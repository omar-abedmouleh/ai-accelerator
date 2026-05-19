`timescale 1ns/1ps
module sram_feature_bank_whc #(
  parameter int IMG_W_MAX   = 226,
  parameter int IMG_H_MAX   = 226,
  parameter int CH_BANK_MAX = 64,
  parameter int LANES_MAX   = 8,

  // NEW: Max Beats (compile-time)
  parameter int BEATS_MAX   = 256
)(
  input  logic                           clk,
  input  logic                           reset,

  // ORIGINAL dimensions (ohne Padding)
  input  logic [15:0]                    cfg_img_w,
  input  logic [15:0]                    cfg_img_h,
  input  logic [15:0]                    cfg_cin,

  // padding
  input  logic [7:0]                     cfg_pad_left,
  input  logic [7:0]                     cfg_pad_right,
  input  logic [7:0]                     cfg_pad_top,
  input  logic [7:0]                     cfg_pad_bottom,

  input  logic                           w_flat_en,
  input  logic [7:0]                     w_flat_data,

  input  logic                           we_ofmap,
  input  logic [$clog2(CH_BANK_MAX)-1:0] w_ch,
  input  logic [$clog2(IMG_H_MAX)-1:0]   w_y,
  input  logic [$clog2(IMG_W_MAX)-1:0]   w_x,
  input  logic [7:0]                     of_wdata,

  input  logic                           start,
  output logic                           px_valid,
  output logic [LANES_MAX-1:0][7:0]      px_out_lane,
  input  logic                           px_ready,
  output logic                           done_frame,

  input  logic [15:0]                    cfg_tile_r,
  input  logic [15:0]                    cfg_ch_base,

  input  logic                           pw_mode,

  // NEW: PW needed beats kommt von oben (keine Berechnung mehr hier!)
  input  logic [15:0]                    pw_needed_beats
);

  localparam int DEPTH_PIX   = IMG_W_MAX * IMG_H_MAX;
  localparam int GROUPS_MAX  = (CH_BANK_MAX + LANES_MAX - 1) / LANES_MAX;
  localparam int DEPTH_BANK  = DEPTH_PIX * GROUPS_MAX;
  localparam int ADDR_W      = (DEPTH_BANK > 1) ? $clog2(DEPTH_BANK) : 1;

`ifndef SYNTHESIS
  logic [7:0] mem_bank_flat [0:LANES_MAX*DEPTH_BANK-1];
`endif

  // WRITE

  logic [$clog2(CH_BANK_MAX)-1:0] wr_ch;
  logic [$clog2(IMG_W_MAX)-1:0]   wr_x;
  logic [$clog2(IMG_H_MAX)-1:0]   wr_y;
  logic [ADDR_W-1:0]              wr_row_base_pix;

  logic                           cfg_lat_valid;
  logic [$clog2(CH_BANK_MAX)-1:0] cin_m1_lat;
  logic [$clog2(IMG_W_MAX)-1:0]   w_m1_lat;
  logic [$clog2(IMG_H_MAX)-1:0]   h_m1_lat;

  logic [LANES_MAX-1:0]             bank_we;
  logic [LANES_MAX-1:0][ADDR_W-1:0] bank_waddr;
  logic [LANES_MAX-1:0][7:0]        bank_wdata;

  logic [LANES_MAX-1:0]             bank_ren;
  logic [LANES_MAX-1:0][ADDR_W-1:0] bank_raddr;
  logic [LANES_MAX-1:0][7:0]        bank_rdata;

  genvar g;
  generate
    for (g = 0; g < LANES_MAX; g = g + 1) begin : GEN_BANKS
      ram_1r1w_sync #(.AW(ADDR_W), .DW(8)) u_bank (
        .clk   (clk),
        .we    (bank_we[g]),
        .waddr (bank_waddr[g]),
        .wdata (bank_wdata[g]),
        .ren   (bank_ren[g]),
        .raddr (bank_raddr[g]),
        .rdata (bank_rdata[g])
      );
    end
  endgenerate

  logic [$clog2(LANES_MAX)-1:0] wr_bank_idx;
  logic [15:0]                 wr_group16;
  logic [ADDR_W-1:0]           wr_pix_addr;
  logic [ADDR_W-1:0]           wr_addr_bank;

  logic [$clog2(LANES_MAX)-1:0] of_bank_idx;
  logic [15:0]                  of_group16;
  logic [ADDR_W-1:0]            of_pix_addr;
  logic [ADDR_W-1:0]            of_addr_bank;

  integer bi;

  always_comb begin
    for (bi = 0; bi < LANES_MAX; bi = bi + 1) begin
      bank_we[bi]    = 1'b0;
      bank_waddr[bi] = '0;
      bank_wdata[bi] = 8'h00;
    end

    wr_pix_addr  = wr_row_base_pix + wr_x;
    wr_bank_idx  = wr_ch[$clog2(LANES_MAX)-1:0];
    wr_group16   = (16'(wr_ch)) >> $clog2(LANES_MAX);
    wr_addr_bank = (ADDR_W'(wr_group16) * DEPTH_PIX[ADDR_W-1:0]) + wr_pix_addr;

    of_pix_addr  = (w_y * IMG_W_MAX) + w_x;
    of_bank_idx  = w_ch[$clog2(LANES_MAX)-1:0];
    of_group16   = (16'(w_ch)) >> $clog2(LANES_MAX);
    of_addr_bank = (ADDR_W'(of_group16) * DEPTH_PIX[ADDR_W-1:0]) + of_pix_addr[ADDR_W-1:0];

    if (w_flat_en) begin
      if ((cfg_cin   != 16'd0) &&
          (cfg_img_w != 16'd0) &&
          (cfg_img_h != 16'd0) &&
          (wr_ch < cfg_cin[$clog2(CH_BANK_MAX)-1:0]) &&
          (wr_x  < cfg_img_w[$clog2(IMG_W_MAX)-1:0]) &&
          (wr_y  < cfg_img_h[$clog2(IMG_H_MAX)-1:0])) begin
        if (wr_addr_bank < DEPTH_BANK[ADDR_W-1:0]) begin
          bank_we[wr_bank_idx]    = 1'b1;
          bank_waddr[wr_bank_idx] = wr_addr_bank;
          bank_wdata[wr_bank_idx] = w_flat_data;
        end
      end
    end else if (we_ofmap) begin
      if ((w_ch < CH_BANK_MAX) &&
          (w_y  < IMG_H_MAX) &&
          (w_x  < IMG_W_MAX)) begin
        if (of_addr_bank < DEPTH_BANK[ADDR_W-1:0]) begin
          bank_we[of_bank_idx]    = 1'b1;
          bank_waddr[of_bank_idx] = of_addr_bank;
          bank_wdata[of_bank_idx] = of_wdata;
        end
      end
    end
  end

  logic [$clog2(CH_BANK_MAX)-1:0] cin_m1_use;
  logic [$clog2(IMG_W_MAX)-1:0]   w_m1_use;
  logic [$clog2(IMG_H_MAX)-1:0]   h_m1_use;
  logic ch_last, x_last, y_last;

  always_comb begin
    if (cfg_lat_valid) begin
      cin_m1_use = cin_m1_lat;
      w_m1_use   = w_m1_lat;
      h_m1_use   = h_m1_lat;
    end else begin
      cin_m1_use = (cfg_cin[$clog2(CH_BANK_MAX)-1:0] != '0) ? (cfg_cin[$clog2(CH_BANK_MAX)-1:0] - 1'b1) : '0;
      w_m1_use   = (cfg_img_w[$clog2(IMG_W_MAX)-1:0] != '0)  ? (cfg_img_w[$clog2(IMG_W_MAX)-1:0] - 1'b1)  : '0;
      h_m1_use   = (cfg_img_h[$clog2(IMG_H_MAX)-1:0] != '0)  ? (cfg_img_h[$clog2(IMG_H_MAX)-1:0] - 1'b1)  : '0;
    end
    ch_last = (wr_ch == cin_m1_use);
    x_last  = (wr_x  == w_m1_use);
    y_last  = (wr_y  == h_m1_use);
  end

  logic [$clog2(CH_BANK_MAX)-1:0] wr_ch_n;
  logic [$clog2(IMG_W_MAX)-1:0]   wr_x_n;
  logic [$clog2(IMG_H_MAX)-1:0]   wr_y_n;
  logic [ADDR_W-1:0]              wr_row_base_pix_n;
  logic [ADDR_W-1:0]              wr_row_base_pix_inc;

  always_comb begin
    wr_row_base_pix_inc = wr_row_base_pix + IMG_W_MAX[ADDR_W-1:0];
  end

  always_comb begin
    wr_ch_n            = wr_ch;
    wr_x_n             = wr_x;
    wr_y_n             = wr_y;
    wr_row_base_pix_n  = wr_row_base_pix;

    if (start) begin
      wr_ch_n           = '0;
      wr_x_n            = '0;
      wr_y_n            = '0;
      wr_row_base_pix_n = '0;
    end

    if (w_flat_en) begin
      if (ch_last) begin
        wr_ch_n = '0;
        if (x_last) begin
          wr_x_n = '0;
          if (y_last) begin
            wr_y_n            = '0;
            wr_row_base_pix_n = '0;
          end else begin
            wr_y_n            = wr_y + 1'b1;
            wr_row_base_pix_n = wr_row_base_pix_inc;
          end
        end else begin
          wr_x_n = wr_x + 1'b1;
        end
      end else begin
        wr_ch_n = wr_ch + 1'b1;
      end
    end
  end

  integer flat_idx;
  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      wr_ch           <= '0;
      wr_x            <= '0;
      wr_y            <= '0;
      wr_row_base_pix <= '0;

      cfg_lat_valid   <= 1'b0;
      cin_m1_lat      <= '0;
      w_m1_lat        <= '0;
      h_m1_lat        <= '0;
    end else begin
      if (start || (w_flat_en && !cfg_lat_valid)) begin
        cfg_lat_valid <= 1'b1;
        cin_m1_lat <= (cfg_cin[$clog2(CH_BANK_MAX)-1:0] != '0) ? (cfg_cin[$clog2(CH_BANK_MAX)-1:0] - 1'b1) : '0;
        w_m1_lat   <= (cfg_img_w[$clog2(IMG_W_MAX)-1:0] != '0)  ? (cfg_img_w[$clog2(IMG_W_MAX)-1:0] - 1'b1)  : '0;
        h_m1_lat   <= (cfg_img_h[$clog2(IMG_H_MAX)-1:0] != '0)  ? (cfg_img_h[$clog2(IMG_H_MAX)-1:0] - 1'b1)  : '0;
      end

`ifndef SYNTHESIS
      if (w_flat_en) begin
        if (wr_addr_bank < DEPTH_BANK[ADDR_W-1:0]) begin
          flat_idx = (integer'(wr_bank_idx) * DEPTH_BANK) + integer'(wr_addr_bank);
          if ((flat_idx >= 0) && (flat_idx < (LANES_MAX*DEPTH_BANK)))
            mem_bank_flat[flat_idx] <= w_flat_data;
        end
      end else if (we_ofmap) begin
        if (of_addr_bank < DEPTH_BANK[ADDR_W-1:0]) begin
          flat_idx = (integer'(of_bank_idx) * DEPTH_BANK) + integer'(of_addr_bank);
          if ((flat_idx >= 0) && (flat_idx < (LANES_MAX*DEPTH_BANK)))
            mem_bank_flat[flat_idx] <= of_wdata;
        end
      end
`endif

      wr_ch           <= wr_ch_n;
      wr_x            <= wr_x_n;
      wr_y            <= wr_y_n;
      wr_row_base_pix <= wr_row_base_pix_n;
    end
  end

  // STREAMING

  typedef enum logic [1:0] { S_RESET=2'd0, S_IDLE=2'd1, S_STREAM=2'd2, S_DONE=2'd3 } state_t;
  state_t state, state_n;

  logic [15:0] run_w, run_h, run_cin;
  logic [15:0] run_tile_r;
  logic [15:0] run_ch_base_cur;

  logic [7:0]  run_pad_left, run_pad_right, run_pad_top, run_pad_bottom;
  logic [15:0] run_orig_w, run_orig_h;

  logic [15:0] run_w_n, run_h_n, run_cin_n;
  logic [15:0] run_tile_r_n;
  logic [15:0] run_ch_base_cur_n;
  logic [7:0]  run_pad_left_n, run_pad_right_n, run_pad_top_n, run_pad_bottom_n;
  logic [15:0] run_orig_w_n, run_orig_h_n;

  logic [$clog2(IMG_W_MAX)-1:0] x, x_n;
  logic [$clog2(IMG_H_MAX)-1:0] y, y_n;

  logic pending, pending_n;
  logic pending_pad, pending_pad_n;

  logic issue_read;
  logic out_fire;

  logic px_valid_n;
  logic done_frame_n;

  logic last_x, last_y, last_pixel;
  logic last_pixel_issued, last_pixel_issued_n;
  logic last_pixel_out,    last_pixel_out_n;

  logic [15:0] pad_l16, pad_r16, pad_t16, pad_b16;
  logic [15:0] x16, y16;
  logic [15:0] mem_x16, mem_y16;
  logic [15:0] orig_w16, orig_h16;

  logic in_img_x, in_img_y, in_img_xy;

  logic [$clog2(IMG_W_MAX)-1:0] mem_x;
  logic [$clog2(IMG_H_MAX)-1:0] mem_y;
  logic [ADDR_W-1:0]            mem_pix_addr;

  logic                           lane_ok_c   [0:LANES_MAX-1];
  logic                           lane_ok_q   [0:LANES_MAX-1];
  logic                           lane_ok_q_n [0:LANES_MAX-1];

  logic [$clog2(LANES_MAX)-1:0]   lane_bank_c [0:LANES_MAX-1];
  logic [$clog2(LANES_MAX)-1:0]   lane_bank_q [0:LANES_MAX-1];
  logic [$clog2(LANES_MAX)-1:0]   lane_bank_q_n[0:LANES_MAX-1];

  logic [7:0]                     sel_lane_q   [0:LANES_MAX-1];
  logic [7:0]                     sel_lane_q_n [0:LANES_MAX-1];
  logic [LANES_MAX-1:0][7:0]      px_out_lane_n;

  integer i_fsm_c;
  integer li_ff;

  logic [15:0] ch_k16;
  logic [15:0] group_k16;
  logic [$clog2(LANES_MAX)-1:0] bank_k;
  logic [ADDR_W-1:0] addr_k;

  logic [15:0] pw_beat_idx, pw_beat_idx_n;
  logic [15:0] needed_beats_pw;          // NEW: from input (clamped)
  logic [15:0] ch_base_eff16;
  logic        pw_last_beat;
  logic        pw_last_beat_issued, pw_last_beat_issued_n;

  // Derived
  always_comb begin
    out_fire = px_valid && (px_ready === 1'b1);

    last_x = (run_w != 16'd0) ? (x == (run_w[$clog2(IMG_W_MAX)-1:0] - 1'b1)) : 1'b0;
    last_y = (run_h != 16'd0) ? (y == (run_h[$clog2(IMG_H_MAX)-1:0] - 1'b1)) : 1'b0;
    last_pixel = last_x && last_y;

    // FIX:
    // - Non-PW: allow pipelined issue on out_fire
    // - PW: do NOT issue on out_fire; wait until px_valid is cleared
    if (pw_mode)
      issue_read = (state == S_STREAM) && (!pending) && (!px_valid);
    else
      issue_read = (state == S_STREAM) && (!pending) && ( (!px_valid) || out_fire );
  end

  // Padding mapping
  always_comb begin
    pad_l16 = {8'd0, run_pad_left};
    pad_r16 = {8'd0, run_pad_right};
    pad_t16 = {8'd0, run_pad_top};
    pad_b16 = {8'd0, run_pad_bottom};

    orig_w16 = run_orig_w;
    orig_h16 = run_orig_h;

    x16 = { {(16-$clog2(IMG_W_MAX)){1'b0}}, x };
    y16 = { {(16-$clog2(IMG_H_MAX)){1'b0}}, y };

    in_img_x  = (x16 >= pad_l16) && (x16 < (pad_l16 + orig_w16));
    in_img_y  = (y16 >= pad_t16) && (y16 < (pad_t16 + orig_h16));
    in_img_xy = in_img_x && in_img_y;

    mem_x16 = (x16 - pad_l16);
    mem_y16 = (y16 - pad_t16);

    mem_x = mem_x16[$clog2(IMG_W_MAX)-1:0];
    mem_y = mem_y16[$clog2(IMG_H_MAX)-1:0];

    mem_pix_addr = (mem_y * IMG_W_MAX) + mem_x;
  end

  // NEW: needed_beats kommt von oben (nur clampen)
  always_comb begin
    needed_beats_pw = pw_needed_beats;
    if (needed_beats_pw == 16'd0) needed_beats_pw = 16'd1;

    // clamp to BEATS_MAX
    if (needed_beats_pw > BEATS_MAX[15:0]) needed_beats_pw = BEATS_MAX[15:0];

    // safety clamp to GROUPS_MAX (weil SRAM so organisiert ist)
    if (needed_beats_pw > 16'(GROUPS_MAX)) needed_beats_pw = 16'(GROUPS_MAX);

    pw_last_beat = (pw_beat_idx == (needed_beats_pw - 16'd1));
  end

  // Effective base for this beat
  always_comb begin
    ch_base_eff16 = run_ch_base_cur;
    if (pw_mode)
      ch_base_eff16 = run_ch_base_cur + (pw_beat_idx * LANES_MAX[15:0]);
  end

  // lane ok: compute which lanes are valid for the current beat/pixel
  logic [15:0] lane_limit;

  always_comb begin : LANE_OK_BLK
    integer k_ok;

    // Select how many lanes are allowed for this beat:
    // - PW mode: use all lanes
    // - non-PW: limit by run_tile_r (tile size)
    lane_limit = pw_mode ? LANES_MAX[15:0] : run_tile_r;
    // Clamp to the physical lane count in case run_tile_r is larger.
    if (lane_limit > LANES_MAX[15:0]) lane_limit = LANES_MAX[15:0];

    for (k_ok = 0; k_ok < LANES_MAX; k_ok = k_ok + 1) begin
      // Lane k_ok is valid only if ALL are true:
      // 1) k_ok is within lane_limit
      // 2) channel index (ch_base_eff16 + k_ok) is within run_cin
      // 3) channel index is within absolute CH_BANK_MAX
      if ((16'(k_ok) < lane_limit) &&
          ((ch_base_eff16 + 16'(k_ok)) < run_cin) &&
          ((ch_base_eff16 + 16'(k_ok)) < CH_BANK_MAX[15:0]))
        lane_ok_c[k_ok] = 1'b1;
      else
        lane_ok_c[k_ok] = 1'b0;
    end
  end

  // read map
  always_comb begin : READ_MAP_BLK
    integer k_rd;
    for (k_rd = 0; k_rd < LANES_MAX; k_rd = k_rd + 1) begin
      bank_ren[k_rd]    = 1'b0;
      bank_raddr[k_rd]  = '0;
      lane_bank_c[k_rd] = '0;
    end

    // When a read is issued, map each valid lane to a bank and address.
    // bank_k selects which SRAM bank serves the lane, addr_k is the pixel address.
    if (issue_read && in_img_xy) begin
      for (k_rd = 0; k_rd < LANES_MAX; k_rd = k_rd + 1) begin
        if (lane_ok_c[k_rd]) begin
          // Channel index for this lane (base channel + lane offset).
          ch_k16    = ch_base_eff16 + 16'(k_rd);
          // Bank select = channel modulo LANES_MAX.
          bank_k    = ch_k16[$clog2(LANES_MAX)-1:0];
          // Group index = channel divided by LANES_MAX.
          group_k16 = ch_k16 >> $clog2(LANES_MAX);
          // Bank address = group offset * pixels_per_image + pixel index.
          addr_k    = (ADDR_W'(group_k16) * DEPTH_PIX[ADDR_W-1:0]) + mem_pix_addr;

          // which SRAM bank this lane will read from.
          // Example (LANES_MAX=4, run_cin=8):
          // ch_base_eff16=0:
          // k_rd=0 -> ch=0 -> bank=0; k_rd=1 -> ch=1 -> bank=1;
          // k_rd=2 -> ch=2 -> bank=2; k_rd=3 -> ch=3 -> bank=3.
          // ch_base_eff16=4:
          // k_rd=0 -> ch=4 -> bank=0; k_rd=1 -> ch=5 -> bank=1;
          // k_rd=2 -> ch=6 -> bank=2; k_rd=3 -> ch=7 -> bank=3.
          lane_bank_c[k_rd] = bank_k;
          bank_ren[bank_k]   = 1'b1;
          bank_raddr[bank_k] = addr_k;
        end
      end
    end
  end

  // FSM next
  always_comb begin
    state_n = state;

    run_w_n           = run_w;
    run_h_n           = run_h;
    run_cin_n         = run_cin;
    run_tile_r_n      = run_tile_r;
    run_ch_base_cur_n = run_ch_base_cur;

    run_pad_left_n    = run_pad_left;
    run_pad_right_n   = run_pad_right;
    run_pad_top_n     = run_pad_top;
    run_pad_bottom_n  = run_pad_bottom;

    run_orig_w_n      = run_orig_w;
    run_orig_h_n      = run_orig_h;

    x_n = x;
    y_n = y;

    pending_n     = pending;
    pending_pad_n = pending_pad;

    px_valid_n   = px_valid;
    done_frame_n = 1'b0;

    last_pixel_issued_n = last_pixel_issued;
    last_pixel_out_n    = last_pixel_out;

    pw_beat_idx_n         = pw_beat_idx;
    pw_last_beat_issued_n = pw_last_beat_issued;

    for (i_fsm_c = 0; i_fsm_c < LANES_MAX; i_fsm_c = i_fsm_c + 1) begin
      lane_ok_q_n[i_fsm_c]    = lane_ok_q[i_fsm_c];
      lane_bank_q_n[i_fsm_c]  = lane_bank_q[i_fsm_c];
      sel_lane_q_n[i_fsm_c]   = sel_lane_q[i_fsm_c];
      px_out_lane_n[i_fsm_c]  = px_out_lane[i_fsm_c];
    end

    if (out_fire) px_valid_n = 1'b0;

    if (start === 1'b1) begin
      run_pad_left_n    = cfg_pad_left;
      run_pad_right_n   = cfg_pad_right;
      run_pad_top_n     = cfg_pad_top;
      run_pad_bottom_n  = cfg_pad_bottom;

      run_orig_w_n      = cfg_img_w;
      run_orig_h_n      = cfg_img_h;

      run_w_n = cfg_img_w + {8'd0,cfg_pad_left} + {8'd0,cfg_pad_right};
      run_h_n = cfg_img_h + {8'd0,cfg_pad_top}  + {8'd0,cfg_pad_bottom};

      if (run_w_n == 16'd0) run_w_n = 16'd1;
      if (run_h_n == 16'd0) run_h_n = 16'd1;

      if (run_w_n > IMG_W_MAX[15:0]) run_w_n = IMG_W_MAX[15:0];
      if (run_h_n > IMG_H_MAX[15:0]) run_h_n = IMG_H_MAX[15:0];

      run_cin_n = cfg_cin;

      // Für Conv/DW altes Verhalten: cfg_tile_r==0 -> 1; PW bleibt davon unabhängig
      run_tile_r_n = (cfg_tile_r == 16'd0) ? 16'd1 : cfg_tile_r;
      if (run_tile_r_n > LANES_MAX[15:0]) run_tile_r_n = LANES_MAX[15:0];

      run_ch_base_cur_n = cfg_ch_base;

      state_n   = S_STREAM;
      x_n       = '0;
      y_n       = '0;
      pending_n = 1'b0;
      pending_pad_n = 1'b0;
      px_valid_n = 1'b0;

      last_pixel_out_n    = 1'b0;
      last_pixel_issued_n = 1'b0;

      pw_beat_idx_n         = 16'd0;   // start always at 0
      pw_last_beat_issued_n = 1'b0;

      for (i_fsm_c = 0; i_fsm_c < LANES_MAX; i_fsm_c = i_fsm_c + 1) begin
        lane_ok_q_n[i_fsm_c]    = 1'b0;
        lane_bank_q_n[i_fsm_c]  = '0;
        sel_lane_q_n[i_fsm_c]   = 8'h00;
        px_out_lane_n[i_fsm_c]  = 8'h00;
      end
    end else begin
      case (state)
        S_RESET: begin
          state_n    = S_IDLE;
          x_n        = '0;
          y_n        = '0;
          pending_n  = 1'b0;
          px_valid_n = 1'b0;
          pw_beat_idx_n = 16'd0;
        end

        S_IDLE: begin
          px_valid_n = 1'b0;
          pending_n  = 1'b0;
          x_n        = '0;
          y_n        = '0;
          pw_beat_idx_n = 16'd0;
        end

        S_STREAM: begin
          // Issue a read (address uses CURRENT pw_beat_idx)
          if (issue_read) begin
            pending_n           = 1'b1;
            pending_pad_n       = ~in_img_xy;
            last_pixel_issued_n = last_pixel;
            pw_last_beat_issued_n = pw_last_beat;

            for (i_fsm_c = 0; i_fsm_c < LANES_MAX; i_fsm_c = i_fsm_c + 1) begin
              lane_ok_q_n[i_fsm_c]   = lane_ok_c[i_fsm_c];
              lane_bank_q_n[i_fsm_c] = lane_bank_c[i_fsm_c];
            end

            // Non-PW: advance Pixel-Koordinaten sofort
            if (!pw_mode) begin
              if (last_pixel) begin
                x_n = '0; y_n = '0;
              end else if (last_x) begin
                x_n = '0; y_n = y + 1'b1;
              end else begin
                x_n = x + 1'b1; y_n = y;
              end
            end
          end

          // Consume pending (1-cycle RAM latency):
          // - When pending is set, the SRAM read issued in the previous cycle
          //   is now available on bank_rdata[*].
          if (pending) begin
            // If this pixel is padding, force zeros on all lanes (no SRAM use).
            if (pending_pad) begin
              for (i_fsm_c = 0; i_fsm_c < LANES_MAX; i_fsm_c = i_fsm_c + 1)
                sel_lane_q_n[i_fsm_c] = 8'h00;
            end else begin
              // Normal case: for each lane, either take data from its bank
              // (lane_ok_q=1) or force zero if that lane is invalid.
              for (i_fsm_c = 0; i_fsm_c < LANES_MAX; i_fsm_c = i_fsm_c + 1) begin
                if (lane_ok_q[i_fsm_c])
                  // Use the bank selected for this lane at issue_read time.
                  sel_lane_q_n[i_fsm_c] = bank_rdata[lane_bank_q[i_fsm_c]];
                else
                  // Lane not valid for this beat -> output zero.
                  sel_lane_q_n[i_fsm_c] = 8'h00;
              end
            end


            if ((!px_valid) || out_fire) begin
              // Copy selected lane data into the output registers.
              for (i_fsm_c = 0; i_fsm_c < LANES_MAX; i_fsm_c = i_fsm_c + 1)
                px_out_lane_n[i_fsm_c] = sel_lane_q_n[i_fsm_c];
              // Mark output as valid for the downstream consumer.
              px_valid_n = 1'b1;

              if (pw_mode)
                last_pixel_out_n = last_pixel_issued && pw_last_beat_issued;
              else
                last_pixel_out_n = last_pixel_issued;
            end

            pending_n     = 1'b0;
            pending_pad_n = 1'b0;
          end

          // PW beat advances ONLY when output is consumed
          if (pw_mode && out_fire) begin
            if (pw_last_beat_issued) begin
              pw_beat_idx_n = 16'd0; // next pixel starts at beat 0
              // advance x/y after last beat
              if (last_pixel_out) begin
                x_n = '0; y_n = '0;
              end else if (last_x) begin
                x_n = '0; y_n = y + 1'b1;
              end else begin
                x_n = x + 1'b1; y_n = y;
              end
            end else begin
              pw_beat_idx_n = pw_beat_idx + 16'd1; // next beat
              x_n = x; y_n = y;
            end
          end

          // done logic
          if (out_fire && last_pixel_out) begin
            if (pw_mode) begin
              done_frame_n = 1'b1;
              state_n      = S_DONE;
            end else begin
              if ((run_ch_base_cur + run_tile_r) < run_cin) begin
                run_ch_base_cur_n = run_ch_base_cur + run_tile_r;
                x_n = '0; y_n = '0;
                state_n = S_STREAM;
              end else begin
                done_frame_n = 1'b1;
                state_n      = S_DONE;
              end
            end
          end
        end

        S_DONE: begin
          px_valid_n = 1'b0;
          pending_n  = 1'b0;
          state_n    = S_IDLE;
          pw_beat_idx_n = 16'd0;
        end

        default: state_n = S_RESET;
      endcase
    end
  end

  // regs
  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      state <= S_RESET;

      run_w <= 16'd0; run_h <= 16'd0; run_cin <= 16'd0;
      run_tile_r <= 16'd1; run_ch_base_cur <= 16'd0;

      run_pad_left <= 8'd0; run_pad_right <= 8'd0;
      run_pad_top  <= 8'd0; run_pad_bottom <= 8'd0;

      run_orig_w <= 16'd0; run_orig_h <= 16'd0;

      x <= '0; y <= '0;

      pending <= 1'b0; pending_pad <= 1'b0;
      px_valid <= 1'b0; done_frame <= 1'b0;

      last_pixel_out <= 1'b0; last_pixel_issued <= 1'b0;

      pw_beat_idx <= 16'd0;
      pw_last_beat_issued <= 1'b0;

      for (li_ff = 0; li_ff < LANES_MAX; li_ff = li_ff + 1) begin
        lane_ok_q[li_ff]    <= 1'b0;
        lane_bank_q[li_ff]  <= '0;
        sel_lane_q[li_ff]   <= 8'h00;
        px_out_lane[li_ff]  <= 8'h00;
      end
    end else begin
      state <= state_n;

      run_w <= run_w_n; run_h <= run_h_n; run_cin <= run_cin_n;
      run_tile_r <= run_tile_r_n; run_ch_base_cur <= run_ch_base_cur_n;

      run_pad_left <= run_pad_left_n; run_pad_right <= run_pad_right_n;
      run_pad_top  <= run_pad_top_n;  run_pad_bottom <= run_pad_bottom_n;

      run_orig_w <= run_orig_w_n; run_orig_h <= run_orig_h_n;

      x <= x_n; y <= y_n;

      pending <= pending_n; pending_pad <= pending_pad_n;
      px_valid <= px_valid_n; done_frame <= done_frame_n;

      last_pixel_out <= last_pixel_out_n;
      last_pixel_issued <= last_pixel_issued_n;

      pw_beat_idx <= pw_beat_idx_n;
      pw_last_beat_issued <= pw_last_beat_issued_n;

      for (li_ff = 0; li_ff < LANES_MAX; li_ff = li_ff + 1) begin
        lane_ok_q[li_ff]    <= lane_ok_q_n[li_ff];
        lane_bank_q[li_ff]  <= lane_bank_q_n[li_ff];
        sel_lane_q[li_ff]   <= sel_lane_q_n[li_ff];
        px_out_lane[li_ff]  <= px_out_lane_n[li_ff];
      end
    end
  end

endmodule
