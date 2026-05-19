`timescale 1ns/1ps

module processing_module #(
    // Physische Grenzen (compile-time)
    parameter int IMG_W_MAX    = 226,
    parameter int IMG_H_MAX    = 226,
    parameter int CH_IN_MAX    = 32,
    // Allow PW layer2 COUT=64
    parameter int CO_MAX       = 64,
    parameter int LANES_MAX    = 4,
    parameter int COLS_MAX     = 16,
    // Max Beats für PW
    parameter int BEATS_MAX    = 256,

    parameter int K_MAX        = 3,
    parameter int STRIDE_MAX   = 2,

    parameter int ADDR_W       = 16,

    parameter int PXW          = 8,
    parameter int IW_W         = 8,
    parameter int IW_I         = 8,
    parameter int BIAS_W       = 32,
    parameter int OUT_W        = 8,

    // MAX Helper (TB overridable)
    parameter int OUT_W_MAX_VALID = 112,
    parameter int OUT_H_MAX_VALID = 112,

    parameter int TOTAL_WINS_MAX  = 12544,
    parameter int TOTAL_GRPS_MAX  = 12544,
    parameter int TOTAL_BLKS_MAX  = 32,
    parameter int NUM_CTX_MAX     = 288
)(
    input  logic                     clk,
    input  logic                     reset,

    input  logic                     start_frame,

    // Ping-Pong: read vs write Bank
    input  logic                     cfg_read_bank_sel,
    input  logic                     cfg_write_bank_sel,

    input  logic                     cfg_pool_enable,
    input  logic                     cfg_pool_max_not_avg,
    input  logic                     cfg_dw_enable,

    // Pointwise enable (vom CSR/top_module)
    input  logic                     cfg_pw_enable,

    // Runtime-CFG aus CSR
    input  logic [15:0]              cfg_in_h,
    input  logic [15:0]              cfg_in_w,
    input  logic [15:0]              cfg_cin,
    input  logic [15:0]              cfg_cout,
    input  logic [15:0]              cfg_kh,
    input  logic [15:0]              cfg_kw,
    input  logic [15:0]              cfg_sh,
    input  logic [15:0]              cfg_sw,
    input  logic [15:0]              cfg_tile_r,
    input  logic [15:0]              cfg_tile_c,

    // Padding CFG (CSR)
    // [7:0]=pad_left, [15:8]=pad_right, [23:16]=pad_top, [31:24]=pad_bottom
    input  logic [31:0]              cfg_pad0,

    // SW/CSR Derived (KEINE Berechnung hier!)
    input  logic [15:0]              cfg_out_h,
    input  logic [15:0]              cfg_out_w,
    input  logic [31:0]              total_wins,
    input  logic [31:0]              total_grps,
    input  logic [31:0]              total_blks,
    input  logic [31:0]              cfg_num_ctx,

    // DMA Flat Write (HWC, Cin)
    input  logic                     if_we_flat,
    input  logic [PXW-1:0]           if_flat_data,

    // Weights (Byte Write)
    input  logic                     w_we,
    input  logic [ADDR_W-1:0]        w_waddr,
    input  logic [7:0]               w_wdata,

    // Bias/Shift (Byte Write)
    input  logic                     bs_we_bias,
    input  logic [ADDR_W-1:0]        bs_waddr_bias,
    input  logic [7:0]               bs_wdata_bias,

    input  logic                     bs_we_shift,
    input  logic [ADDR_W-1:0]        bs_waddr_shift,
    input  logic [7:0]               bs_wdata_shift,

    input  logic                     bs_we_mult,
    input  logic [ADDR_W-1:0]        bs_waddr_mult,
    input  logic [7:0]               bs_wdata_mult,

    // Status
    output logic                     done_all,
    output logic                     conv_done_global,
    output logic                     pooling_done,
    output logic [15:0]              dbg_blk_idx,
    output logic [15:0]              dbg_grp_idx,
    output logic [15:0]              dbg_ctx_idx,

    // NEW: PW needed beats (read-only, derived)
    output logic [15:0]              pw_needed_beats
);

    // Padding decode + effective input size
    logic [7:0]  pad_l, pad_r, pad_t, pad_b;
    logic [15:0] cfg_in_w_eff;
    logic [15:0] cfg_in_h_eff;
    logic [17:0] sum_w18;
    logic [17:0] sum_h18;

    // 0) Bank-Select clean (X/Z -> 0)
    logic read_sel_c, write_sel_c;
    always_comb begin
        read_sel_c  = (cfg_read_bank_sel  === 1'b1);
        write_sel_c = (cfg_write_bank_sel === 1'b1);
    end

    // 0a) SW-derived Werte clampen (nur Vergleiche)
    logic [15:0] out_w_c, out_h_c;
    logic [31:0] total_wins_c, total_grps_c, total_blks_c;
    logic [31:0] num_ctx_c;

    always_comb begin
        out_w_c = (cfg_out_w == 16'd0) ? 16'd1 : cfg_out_w;
        out_h_c = (cfg_out_h == 16'd0) ? 16'd1 : cfg_out_h;

        total_wins_c = total_wins;

        total_grps_c = (total_grps == 32'd0) ? 32'd1 : total_grps;
        if (total_grps_c > TOTAL_GRPS_MAX[31:0]) total_grps_c = TOTAL_GRPS_MAX[31:0];

        total_blks_c = (total_blks == 32'd0) ? 32'd1 : total_blks;
        if (total_blks_c > TOTAL_BLKS_MAX[31:0]) total_blks_c = TOTAL_BLKS_MAX[31:0];

        num_ctx_c = (cfg_num_ctx == 32'd0) ? 32'd1 : cfg_num_ctx;
        if (num_ctx_c > NUM_CTX_MAX[31:0]) num_ctx_c = NUM_CTX_MAX[31:0];
    end

    // Padding: X/Z -> 0, then compute padded effective input sizes
    always_comb begin
        // clean bytes (if any X -> treat as 0)
        pad_l = ((^cfg_pad0[7:0])   === 1'bx) ? 8'd0 : cfg_pad0[7:0];
        pad_r = ((^cfg_pad0[15:8])  === 1'bx) ? 8'd0 : cfg_pad0[15:8];
        pad_t = ((^cfg_pad0[23:16]) === 1'bx) ? 8'd0 : cfg_pad0[23:16];
        pad_b = ((^cfg_pad0[31:24]) === 1'bx) ? 8'd0 : cfg_pad0[31:24];

        // widen and sum
        sum_w18 = {2'b00, cfg_in_w} + {10'b0, pad_l} + {10'b0, pad_r};
        sum_h18 = {2'b00, cfg_in_h} + {10'b0, pad_t} + {10'b0, pad_b};

        // clamp to compile-time maxima
        if (sum_w18[15:0] == 16'd0) cfg_in_w_eff = 16'd1;
        else                        cfg_in_w_eff = sum_w18[15:0];

        if (sum_h18[15:0] == 16'd0) cfg_in_h_eff = 16'd1;
        else                        cfg_in_h_eff = sum_h18[15:0];

        if (cfg_in_w_eff > IMG_W_MAX[15:0]) cfg_in_w_eff = IMG_W_MAX[15:0];
        if (cfg_in_h_eff > IMG_H_MAX[15:0]) cfg_in_h_eff = IMG_H_MAX[15:0];
    end

    // Flags
    logic pool_enable, pool_use_max, dw_enable, pw_enable;
    logic pool_active; // Pooling nur bei CONV (nicht DW, nicht PW)

    assign pool_enable  = cfg_pool_enable;
    assign pool_use_max = cfg_pool_max_not_avg;
    assign dw_enable    = cfg_dw_enable;
    assign pw_enable    = cfg_pw_enable;

    assign pool_active  = pool_enable && !dw_enable && !pw_enable;

    // NEW: PW needed beats (read-only, derived)
    //  - ceil(cfg_cin / LANES_MAX)
    //  - clamp to [1..BEATS_MAX]
    logic [15:0] cin_clamped16;
    logic [15:0] beats_calc16;

    always_comb begin
        cin_clamped16 = cfg_cin;
        if (cin_clamped16 == 16'd0) cin_clamped16 = 16'd1;
        if (cin_clamped16 > CH_IN_MAX[15:0]) cin_clamped16 = CH_IN_MAX[15:0];

        // ceil div
        beats_calc16 = (cin_clamped16 + LANES_MAX[15:0] - 16'd1) / LANES_MAX[15:0];
        if (beats_calc16 == 16'd0) beats_calc16 = 16'd1;

        // clamp
        if (beats_calc16 > BEATS_MAX[15:0]) beats_calc16 = BEATS_MAX[15:0];

        pw_needed_beats = beats_calc16;
    end

    // 1) IFMAP Bank A/B (Ping-Pong)
    logic [15:0] ifmap_ch_base;

    logic we_flat_a, we_flat_b;
    logic start_a, start_b;

    logic if_px_valid_a, if_px_valid_b;
    logic [LANES_MAX-1:0][PXW-1:0] if_px_out_lane_a_bank;
    logic [LANES_MAX-1:0][PXW-1:0] if_px_out_lane_b_bank;
    logic if_done_frame_a, if_done_frame_b;

    logic if_px_ready;

    logic if_we_flat_c;
    always_comb begin
        if_we_flat_c = (if_we_flat === 1'b1);
    end

    assign we_flat_a = if_we_flat_c && (read_sel_c == 1'b0);
    assign we_flat_b = if_we_flat_c && (read_sel_c == 1'b1);

    // Restart vom Fetcher (Scan / Blockwechsel)
    logic ifmap_restart;

    // Start: start_frame ODER ifmap_restart
    assign start_a = (start_frame || ifmap_restart) && (read_sel_c == 1'b0);
    assign start_b = (start_frame || ifmap_restart) && (read_sel_c == 1'b1);

    logic                           of_we;
    logic [$clog2(CO_MAX)-1:0]      of_w_ch;
    logic [$clog2(IMG_H_MAX)-1:0]   of_w_y;
    logic [$clog2(IMG_W_MAX)-1:0]   of_w_x;
    logic signed [OUT_W-1:0]        of_wdata;

    logic of_we_a, of_we_b;
    assign of_we_a = of_we && (write_sel_c == 1'b0);
    assign of_we_b = of_we && (write_sel_c == 1'b1);

    // IFMAP BANK A
    sram_feature_bank_whc #(
        .IMG_W_MAX   (IMG_W_MAX),
        .IMG_H_MAX   (IMG_H_MAX),
        .CH_BANK_MAX (CO_MAX),      // max channels supported
        .LANES_MAX   (LANES_MAX),
        .BEATS_MAX   (BEATS_MAX)    // NEW
    ) u_feat_bank_a (
        .clk         (clk),
        .reset       (reset),

        // ORIGINAL dims (ohne Padding), Bank macht Padding intern
        .cfg_img_w   (cfg_in_w),
        .cfg_img_h   (cfg_in_h),
        .cfg_cin     (cfg_cin),

        .cfg_pad_left   (pad_l),
        .cfg_pad_right  (pad_r),
        .cfg_pad_top    (pad_t),
        .cfg_pad_bottom (pad_b),

        .w_flat_en   (we_flat_a),
        .w_flat_data (if_flat_data),

        .we_ofmap    (of_we_a),
        .w_ch        (of_w_ch),
        .w_y         (of_w_y),
        .w_x         (of_w_x),
        .of_wdata    (of_wdata[7:0]),

        .start       (start_a),
        .px_valid    (if_px_valid_a),
        .px_out_lane (if_px_out_lane_a_bank),   // neuer Port
        .px_ready    ((read_sel_c==1'b0) ? if_px_ready : 1'b0),
        .done_frame  (if_done_frame_a),

        .cfg_tile_r  (cfg_tile_r),
        .cfg_ch_base (ifmap_ch_base),

        .pw_mode          (pw_enable),
        .pw_needed_beats  (pw_needed_beats)     // neu
    );

    // IFMAP BANK B
    sram_feature_bank_whc #(
        .IMG_W_MAX   (IMG_W_MAX),
        .IMG_H_MAX   (IMG_H_MAX),
        .CH_BANK_MAX (CO_MAX),
        .LANES_MAX   (LANES_MAX),
        .BEATS_MAX   (BEATS_MAX)    // neu
    ) u_feat_bank_b (
        .clk         (clk),
        .reset       (reset),

        .cfg_img_w   (cfg_in_w),
        .cfg_img_h   (cfg_in_h),
        .cfg_cin     (cfg_cin),

        .cfg_pad_left   (pad_l),
        .cfg_pad_right  (pad_r),
        .cfg_pad_top    (pad_t),
        .cfg_pad_bottom (pad_b),

        .w_flat_en   (we_flat_b),
        .w_flat_data (if_flat_data),

        .we_ofmap    (of_we_b),
        .w_ch        (of_w_ch),
        .w_y         (of_w_y),
        .w_x         (of_w_x),
        .of_wdata    (of_wdata[7:0]),

        .start       (start_b),
        .px_valid    (if_px_valid_b),
        .px_out_lane (if_px_out_lane_b_bank),   // neuer Port
        .px_ready    ((read_sel_c==1'b1) ? if_px_ready : 1'b0),
        .done_frame  (if_done_frame_b),

        .cfg_tile_r  (cfg_tile_r),
        .cfg_ch_base (ifmap_ch_base),

        .pw_mode          (pw_enable),
        .pw_needed_beats  (pw_needed_beats)     // neu
    );

    // IFMAP MUX (read bank select)
    logic if_px_valid;
    logic [LANES_MAX-1:0][PXW-1:0] if_px_in_lane;

    always_comb begin
        if (read_sel_c == 1'b0) begin
            if_px_valid   = if_px_valid_a;
            if_px_in_lane = if_px_out_lane_a_bank;
        end else begin
            if_px_valid   = if_px_valid_b;
            if_px_in_lane = if_px_out_lane_b_bank;
        end
    end

    // 2) Weight-SRAM
    logic                  w_ren;
    logic [ADDR_W-1:0]     w_raddr;
    logic [COLS_MAX*8-1:0] w_rdata;
    logic                  w_rvalid;

    sram_weight #(
        .READ_ADDR_W    (ADDR_W),
        .BYTES_PER_WORD (COLS_MAX)
    ) u_weight_sram (
        .clk    (clk),
        .reset  (reset),
        .we     (w_we),
        .waddr  (w_waddr),
        .wdata  (w_wdata),
        .ren    (w_ren),
        .raddr  (w_raddr),
        .rdata  (w_rdata),
        .rvalid (w_rvalid)
    );

    // 3) Bias/Shift-SRAM
    logic                      bs_ren;
    logic [ADDR_W-1:0]         bs_raddr;
    logic signed [BIAS_W-1:0]  bs_bias_cols  [0:COLS_MAX-1];
    logic        [31:0]        bs_shift_cols [0:COLS_MAX-1];
    logic signed [31:0]        bs_mult_cols  [0:COLS_MAX-1];
    logic                      bs_rvalid;

    sram_bias_shift #(
        .BS_ADDR_W (ADDR_W),
        .COLS      (COLS_MAX),
        .CO        (CO_MAX),
        .BIAS_W    (BIAS_W),
        .SHIFT_W   (32)
    ) u_bias_shift (
        .clk           (clk),
        .reset         (reset),
        .we_bias       (bs_we_bias),
        .waddr_bias    (bs_waddr_bias),
        .wdata_bias    (bs_wdata_bias),
        .we_shift      (bs_we_shift),
        .waddr_shift   (bs_waddr_shift),
        .wdata_shift   (bs_wdata_shift),
        .we_mult       (bs_we_mult),
        .waddr_mult    (bs_waddr_mult),
        .wdata_mult    (bs_wdata_mult),
        .bs_ren        (bs_ren),
        .bs_raddr      (bs_raddr),
        .bs_bias_cols  (bs_bias_cols),
        .bs_shift_cols (bs_shift_cols),
        .bs_mult_cols  (bs_mult_cols),
        .cfg_tile_c    (cfg_tile_c),
        .bs_rvalid     (bs_rvalid)
    );

    // 4) Fetcher
    logic                                stream_valid;
    logic signed [LANES_MAX-1:0][PXW-1:0] ifmap_array;
    logic signed [COLS_MAX-1:0][7:0]      weight_array;
    logic                                start_acc;
    logic                                fetch_done_all_int;
    logic                                acc_done_grp;

    fetching_module #(
        .IMG_W_MAX        (IMG_W_MAX),
        .IMG_H_MAX        (IMG_H_MAX),
        .CH_MAX           (CO_MAX),
        .LANES_MAX        (LANES_MAX),
        .COLS_MAX         (COLS_MAX),
        .CO_MAX           (CO_MAX),
        .PXW              (PXW),
        .ADDR_W           (ADDR_W),
        .WIN_SIZE         (K_MAX),

        .OUT_W_MAX_VALID  (OUT_W_MAX_VALID),
        .OUT_H_MAX_VALID  (OUT_H_MAX_VALID),
        .TOTAL_WINS_MAX   (TOTAL_WINS_MAX),
        .TOTAL_GRPS_MAX   (TOTAL_GRPS_MAX),
        .TOTAL_BLKS_MAX   (TOTAL_BLKS_MAX),
        .NUM_CTX_MAX      (NUM_CTX_MAX),

        .BEATS_MAX        (BEATS_MAX)   // NEW
    ) u_fetcher (
        .clk        (clk),
        .reset      (reset),
        .start      (start_frame),
        .dw_mode    (dw_enable),
        .pw_mode    (pw_enable),

        // NEW: derived beats
        .pw_needed_beats (pw_needed_beats),

        // NOTE: use padded effective dimensions
        .cfg_in_w   (cfg_in_w),
        .cfg_in_h   (cfg_in_h),

        // padding info
        .cfg_pad_left   (pad_l),
        .cfg_pad_right  (pad_r),
        .cfg_pad_top    (pad_t),
        .cfg_pad_bottom (pad_b),

        .cfg_cin    (cfg_cin),
        .cfg_cout   (cfg_cout),
        .cfg_kw     (cfg_kw),
        .cfg_kh     (cfg_kh),
        .cfg_sw     (cfg_sw),
        .cfg_sh     (cfg_sh),
        .cfg_tile_r (cfg_tile_r),
        .cfg_tile_c (cfg_tile_c),

        .cfg_out_w    (out_w_c),
        .cfg_out_h    (out_h_c),
        .total_wins   (total_wins_c),
        .total_grps   (total_grps_c),
        .total_blks   (total_blks_c),
        .cfg_num_ctx  (num_ctx_c),

        .px_valid    (if_px_valid),
        .px_in_lane  (if_px_in_lane),   // lanes_max only
        .px_ready    (if_px_ready),

        .ifmap_restart (ifmap_restart),

        .sram_re     (w_ren),
        .sram_raddr  (w_raddr),
        .sram_rdata  (w_rdata),
        .sram_rvalid (w_rvalid),

        .base_addr   ('0),
        .acc_done    (acc_done_grp),

        .bs_ren        (bs_ren),
        .bs_raddr      (bs_raddr),
        .bs_bias_cols  (bs_bias_cols),
        .bs_shift_cols (bs_shift_cols),
        .bs_rvalid     (bs_rvalid),

        .stream_valid (stream_valid),
        .ifmap_array  (ifmap_array),
        .weight_array (weight_array),

        .start_acc    (start_acc),

        .done_all     (fetch_done_all_int),
        .dbg_blk_idx  (dbg_blk_idx),
        .dbg_grp_idx  (dbg_grp_idx),
        .dbg_ctx_idx  (dbg_ctx_idx),

        .ifmap_ch_base (ifmap_ch_base)
    );

    // PIPE STAGE (Stelle #1): Register zwischen Fetcher und Accelerator
    logic                                stream_valid_q;
    logic signed [LANES_MAX-1:0][PXW-1:0] ifmap_array_q;
    logic signed [COLS_MAX-1:0][7:0]      weight_array_q;
    logic                                start_acc_pipe;
    integer                              pi;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            stream_valid_q <= 1'b0;
            start_acc_pipe <= 1'b0;

            for (pi = 0; pi < LANES_MAX; pi = pi + 1)
                ifmap_array_q[pi] <= '0;

            for (pi = 0; pi < COLS_MAX; pi = pi + 1)
                weight_array_q[pi] <= '0;

        end else begin
            stream_valid_q <= stream_valid;
            start_acc_pipe <= start_acc;

            if (stream_valid) begin
                for (pi = 0; pi < LANES_MAX; pi = pi + 1)
                    ifmap_array_q[pi] <= ifmap_array[pi];

                for (pi = 0; pi < COLS_MAX; pi = pi + 1)
                    weight_array_q[pi] <= weight_array[pi];
            end
        end
    end

    // 5) arithmetic_module
    logic signed [0:LANES_MAX-1][IW_I-1:0]    act_left_array;
    logic signed [0:COLS_MAX-1][IW_W-1:0]     wgt_top_array;
    logic signed [0:COLS_MAX-1][BIAS_W-1:0]   bias_cols_array;
    logic signed [0:COLS_MAX-1][5:0]          rshift_cols_array;
    logic signed [0:COLS_MAX-1][31:0]         mult_cols_array;

    genvar gr, gc2;
    generate
        for (gr = 0; gr < LANES_MAX; gr = gr + 1) begin : GEN_ACT
            assign act_left_array[gr] = ifmap_array_q[gr];
        end
        for (gc2 = 0; gc2 < COLS_MAX; gc2 = gc2 + 1) begin : GEN_WGT
            assign wgt_top_array[gc2]     = weight_array_q[gc2];
            assign bias_cols_array[gc2]   = bs_bias_cols[gc2];
            assign rshift_cols_array[gc2] = $signed(bs_shift_cols[gc2][5:0]);
            assign mult_cols_array[gc2]   = bs_mult_cols[gc2];
        end
    endgenerate

    logic signed [0:LANES_MAX-1][0:COLS_MAX-1][OUT_W-1:0] pix_accel;
    logic        [0:LANES_MAX-1][0:COLS_MAX-1]            pix_valid_accel;
    logic                                                 done_acc_int;

    logic conv_done_from_accel;
    logic pooling_done_from_accel;
    assign conv_done_from_accel    = 1'b0;
    assign pooling_done_from_accel = 1'b0;

    arithmetic_module #(
        .ROWS_MAX         (LANES_MAX),
        .COLS_MAX         (COLS_MAX),
        .CH_MAX           (CH_IN_MAX),
        .K_MAX            (K_MAX),

        .IW_W             (IW_W),
        .IW_I             (IW_I),
        .BIAS_W           (BIAS_W),
        .OUT_W            (OUT_W),

        .KERNEL_ELEMS_MAX (K_MAX*K_MAX*CH_IN_MAX),
        .ECNT_W           ((K_MAX*K_MAX*CH_IN_MAX > 1) ? $clog2(K_MAX*K_MAX*CH_IN_MAX) : 1)
    ) u_accel (
        .clk             (clk),
        .reset           (reset),
        .start_ctrl      (start_acc_pipe),

        .relu_on_cfg     (1'b0),
        .pooling_on_cfg  (1'b0),
        .dw_on_cfg       (dw_enable),

        .cfg_tile_r      (cfg_tile_r),
        .cfg_tile_c      (cfg_tile_c),
        .cfg_cin         (cfg_cin),
        .cfg_kh          (cfg_kh),
        .cfg_kw          (cfg_kw),

        .conv_done_global(conv_done_from_accel),
        .pooling_done_ext(pooling_done_from_accel),

        .i_act_left_array           (act_left_array),
        .i_wgt_top_array            (wgt_top_array),
        .i_bias_cols_array          (bias_cols_array),
        .i_requant_shift_cols_array (rshift_cols_array),
        .i_output_multiplier_cols_array (mult_cols_array),

        .o_pixel_array_accelerator       (pix_accel),
        .o_pixel_valid_array_accelerator (pix_valid_accel),

        .o_busy_accelerator (/*unused*/),
        .o_done_accelerator (done_acc_int),

        .dbg_cell_en_pe ()
    );

    // 6) STORE + POOLING-INTEGRATION

    logic [15:0] tile_r_use, tile_c_use;
    always_comb begin
        tile_r_use = (cfg_tile_r == 16'd0) ? 16'd1 : cfg_tile_r;
        tile_c_use = (cfg_tile_c == 16'd0) ? 16'd1 : cfg_tile_c;

        if (tile_r_use > LANES_MAX[15:0]) tile_r_use = LANES_MAX[15:0];
        if (tile_c_use > COLS_MAX [15:0]) tile_c_use = COLS_MAX [15:0];

        if (dw_enable) tile_c_use = tile_r_use;
    end

    localparam int LANE_W = (LANES_MAX > 1) ? $clog2(LANES_MAX) : 1;
    localparam int COL_W  = (COLS_MAX  > 1) ? $clog2(COLS_MAX)  : 1;

    typedef enum logic [1:0] { ST_IDLE=2'd0, ST_RUN=2'd1 } store_state_t;
    store_state_t st, st_n;

    logic [LANE_W-1:0] st_lane, st_lane_n;
    logic [COL_W-1:0]  st_col,  st_col_n;

    logic store_done_pulse;

    // Tile-done Puls aus done_acc_int
    logic done_acc_q;
    logic done_acc_pulse;

    // start_acc edge (JETZT: start_acc_pipe verwenden für alignment)
    logic start_acc_q;
    logic start_acc_pulse;

    // Mapping / Base
    logic [31:0] blk_base_co32;
    logic [31:0] blk_step32;
    logic [15:0] dbg_blk_prev;

    logic [31:0] grp_base_x32, grp_base_y32;

    // Latches für die aktuelle Tile-Base (stable für Store)
    logic [31:0] cap_base_x32, cap_base_y32;
    logic [31:0] cap_blk_base_co32;

    // Store Write-Ports (1 Byte / Takt)
    logic                         store_we;
    logic [$clog2(CO_MAX)-1:0]    store_w_ch;
    logic [$clog2(IMG_H_MAX)-1:0] store_w_y;
    logic [$clog2(IMG_W_MAX)-1:0] store_w_x;
    logic signed [OUT_W-1:0]      store_wdata;

    // Pooling Lines (pro lokalem Kanal 2 Zeilen)
    logic signed [OUT_W-1:0] pool_line0 [0:COLS_MAX-1][0:IMG_W_MAX-1];
    logic signed [OUT_W-1:0] pool_line1 [0:COLS_MAX-1][0:IMG_W_MAX-1];

    logic        pool_start;
    logic [15:0] pool_row_y;
    logic        pool_pending;

    logic        even_row_ready;
    logic [15:0] even_row_y;

    logic        pool_start_cond;

    // Pooling module outputs
    logic                         pool_busy;
    logic                         pool_we;
    logic [$clog2(COLS_MAX)-1:0]  pool_w_ch_local;
    logic [$clog2(CO_MAX)-1:0]    pool_w_ch_abs;
    logic [$clog2(IMG_H_MAX)-1:0] pool_w_y;
    logic [$clog2(IMG_W_MAX)-1:0] pool_w_x;
    logic signed [OUT_W-1:0]      pool_wdata;
    logic                         pooling_done_pm;

    // latch "waiting for pooling_done" so fetcher doesn't stall
    logic pool_wait;
    logic pooling_done_q;
    logic pooling_done_pulse;

    // Exports
    logic conv_done_global_int;
    logic pooling_done_int;
    assign conv_done_global = conv_done_global_int;
    assign pooling_done     = pooling_done_int;

    // Helper
    logic [31:0] fm_w32, fm_h32;
    logic [31:0] cfg_cout32;

    logic [31:0] win_x32, win_y32;
    logic [31:0] ch_abs32;

    logic lane_active;
    logic col_active;
    logic cell_active;

    // Stripe-Ende Erkennung (nur am Tile-Ende)
    logic [15:0] lane_last16;
    logic [15:0] col_last16;

    logic [31:0] last_x32, last_y32;
    logic        row_end_tile;
    logic        last_row_is_odd;
    logic [15:0] last_y16;

    integer px_xi;

    assign done_acc_pulse  = done_acc_int & ~done_acc_q;
    assign start_acc_pulse = start_acc_pipe & ~start_acc_q; // zum Accel-Start ausgerichtet

    always_comb begin
        if (dw_enable) blk_step32 = {16'd0, tile_r_use};
        else           blk_step32 = {16'd0, tile_c_use};
    end

    // Store-Comb: Adresse + Daten direkt aus pix_accel[][]
    //  - SRAM-Write nur wenn Pooling NICHT aktiv (pool_active==0)
    always_comb begin
        fm_w32     = {16'd0, out_w_c};
        fm_h32     = {16'd0, out_h_c};
        cfg_cout32 = {16'd0, cfg_cout};

        store_we    = 1'b0;
        store_w_ch  = '0;
        store_w_x   = '0;
        store_w_y   = '0;
        store_wdata = '0;

        lane_active = ({{(16-LANE_W){1'b0}}, st_lane} < tile_r_use);
        col_active  = ({{(16-COL_W ){1'b0}}, st_col } < tile_c_use);

        if (dw_enable) cell_active = lane_active;
        else           cell_active = lane_active && col_active;

        // win_x/win_y mapping
        if (!dw_enable) begin
            win_x32 = cap_base_x32 + {{(32-LANE_W){1'b0}}, st_lane};
            win_y32 = cap_base_y32;
            if (win_x32 >= fm_w32) begin
                win_x32 = win_x32 - fm_w32;
                win_y32 = win_y32 + 32'd1;
            end
        end else begin
            win_x32 = cap_base_x32;
            win_y32 = cap_base_y32;
        end

        // Channel mapping
        if (!dw_enable) ch_abs32 = cap_blk_base_co32 + {{(32-COL_W){1'b0}}, st_col};
        else            ch_abs32 = cap_blk_base_co32 + {{(32-LANE_W){1'b0}}, st_lane};

        // Direkt-Write nur wenn Pooling nicht aktiv
        if (cell_active &&
            (win_x32 < fm_w32) && (win_y32 < fm_h32) &&
            (ch_abs32 < cfg_cout32) &&
            (pool_active == 1'b0)) begin

            store_we    = 1'b1;
            store_w_ch  = ch_abs32[$clog2(CO_MAX)-1:0];
            store_w_x   = win_x32[$clog2(IMG_W_MAX)-1:0];
            store_w_y   = win_y32[$clog2(IMG_H_MAX)-1:0];

            if (!dw_enable)
                store_wdata = pix_accel[st_lane][st_col];
            else
                store_wdata = pix_accel[st_lane][st_lane];
        end
    end

    // STORE FSM: startet auf done_acc_pulse
    always_comb begin
        if (tile_r_use == 16'd0) lane_last16 = 16'd0;
        else                     lane_last16 = tile_r_use - 16'd1;

        if (tile_c_use == 16'd0) col_last16 = 16'd0;
        else                     col_last16 = tile_c_use - 16'd1;
    end

    always_comb begin
        st_n             = st;
        st_lane_n        = st_lane;
        st_col_n         = st_col;
        store_done_pulse = 1'b0;

        case (st)
            ST_IDLE: begin
                if (done_acc_pulse) begin
                    st_n      = ST_RUN;
                    st_lane_n = '0;
                    st_col_n  = '0;
                end
            end

            ST_RUN: begin
                if (dw_enable) begin
                    // DW: nur Diagonale -> st_col folgt st_lane
                    st_col_n = st_lane_n;

                    if ({{(16-LANE_W){1'b0}}, st_lane} == lane_last16) begin
                        st_lane_n = '0;
                        st_col_n  = '0;
                        st_n      = ST_IDLE;
                        store_done_pulse = 1'b1;
                    end else begin
                        st_lane_n = st_lane + 1'b1;
                        st_col_n  = st_lane_n;
                    end
                end else begin
                    // CONV: iteriere nur über aktive tile_r/tile_c
                    if ({{(16-COL_W){1'b0}}, st_col} == col_last16) begin
                        st_col_n = '0;
                        if ({{(16-LANE_W){1'b0}}, st_lane} == lane_last16) begin
                            st_lane_n = '0;
                            st_n = ST_IDLE;
                            store_done_pulse = 1'b1;
                        end else begin
                            st_lane_n = st_lane + 1'b1;
                        end
                    end else begin
                        st_col_n = st_col + 1'b1;
                    end
                end
            end

            default: st_n = ST_IDLE;
        endcase
    end

    // Block-/Group-Base Commit (race-free)
    logic        blk_change;
    logic [31:0] blk_base_co32_next;
    logic [31:0] grp_base_x32_next, grp_base_y32_next;
    logic [15:0] dbg_blk_prev_next;

    logic [31:0] step32_calc;
    logic [31:0] nx32_calc;
    logic [31:0] ny32_calc;

    always_comb begin
        blk_change = start_acc_pulse && (dbg_blk_idx != dbg_blk_prev);

        blk_base_co32_next = blk_base_co32;
        dbg_blk_prev_next  = dbg_blk_prev;

        grp_base_x32_next  = grp_base_x32;
        grp_base_y32_next  = grp_base_y32;

        step32_calc = 32'd0;
        nx32_calc   = 32'd0;
        ny32_calc   = 32'd0;

        if (blk_change) begin
            blk_base_co32_next = blk_base_co32 + blk_step32;
            dbg_blk_prev_next  = dbg_blk_idx;

            grp_base_x32_next  = 32'd0;
            grp_base_y32_next  = 32'd0;
        end
        else if (store_done_pulse) begin
            if (dw_enable) step32_calc = 32'd1;
            else           step32_calc = {16'd0, tile_r_use};

            nx32_calc = grp_base_x32 + step32_calc;
            ny32_calc = grp_base_y32;

            if (nx32_calc >= fm_w32) begin
                nx32_calc = nx32_calc - fm_w32;
                ny32_calc = ny32_calc + 32'd1;
            end

            grp_base_x32_next = nx32_calc;
            grp_base_y32_next = ny32_calc;
        end
    end

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            st      <= ST_IDLE;
            st_lane <= '0;
            st_col  <= '0;

            grp_base_x32 <= 32'd0;
            grp_base_y32 <= 32'd0;

            blk_base_co32 <= 32'd0;
            dbg_blk_prev  <= 16'd0;

            cap_base_x32      <= 32'd0;
            cap_base_y32      <= 32'd0;
            cap_blk_base_co32 <= 32'd0;

            start_acc_q <= 1'b0;
        end else begin
            start_acc_q <= start_acc_pipe;

            if (start_frame) begin
                st      <= ST_IDLE;
                st_lane <= '0;
                st_col  <= '0;

                grp_base_x32  <= 32'd0;
                grp_base_y32  <= 32'd0;

                blk_base_co32 <= 32'd0;
                dbg_blk_prev  <= 16'd0;

                cap_base_x32      <= 32'd0;
                cap_base_y32      <= 32'd0;
                cap_blk_base_co32 <= 32'd0;
            end else begin
                st      <= st_n;
                st_lane <= st_lane_n;
                st_col  <= st_col_n;

                blk_base_co32 <= blk_base_co32_next;
                dbg_blk_prev  <= dbg_blk_prev_next;

                grp_base_x32  <= grp_base_x32_next;
                grp_base_y32  <= grp_base_y32_next;

                if (start_acc_pulse) begin
                    cap_base_x32      <= grp_base_x32_next;
                    cap_base_y32      <= grp_base_y32_next;
                    cap_blk_base_co32 <= blk_base_co32_next;
                end
            end
        end
    end

    // done_acc edge detector
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            done_acc_q <= 1'b0;
        end else begin
            if (start_frame) done_acc_q <= 1'b0;
            else             done_acc_q <= done_acc_int;
        end
    end

    // Stripe-Ende Erkennung am Tile-Ende
    always_comb begin
        last_x32 = cap_base_x32 + {16'd0, lane_last16};
        last_y32 = cap_base_y32;

        if (last_x32 >= fm_w32) begin
            last_x32 = last_x32 - fm_w32;
            last_y32 = last_y32 + 32'd1;
        end

        row_end_tile    = (last_x32 == (fm_w32 - 32'd1)) && (last_y32 < fm_h32);
        last_row_is_odd = last_y32[0];
        last_y16        = last_y32[15:0];
    end

    // Pooling start condition
    always_comb begin
        pool_start_cond =
            pool_active &&
            store_done_pulse &&
            row_end_tile &&
            (last_row_is_odd == 1'b1) &&
            (even_row_ready == 1'b1) &&
            (even_row_y == (last_y16 - 16'd1));
    end

    // NEW: pooling_done pulse detect (robust)
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            pooling_done_q <= 1'b0;
        end else begin
            if (start_frame) pooling_done_q <= 1'b0;
            else             pooling_done_q <= pooling_done_pm;
        end
    end
    assign pooling_done_pulse = pooling_done_pm & ~pooling_done_q;

    // Pooling-Fill + pool_wait latch
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            pool_start           <= 1'b0;
            pool_row_y           <= 16'd0;
            pool_pending         <= 1'b0;

            even_row_ready       <= 1'b0;
            even_row_y           <= 16'd0;

            conv_done_global_int <= 1'b0;
            pooling_done_int     <= 1'b0;

            pool_wait            <= 1'b0;
        end else begin
            pool_start           <= 1'b0;
            conv_done_global_int <= 1'b0;

            pooling_done_int <= pooling_done_pm;

            if (start_frame) begin
                pool_pending   <= 1'b0;
                even_row_ready <= 1'b0;
                even_row_y     <= 16'd0;
                pool_wait      <= 1'b0;
            end else begin
                // Blockwechsel -> Pool-Stripe-Status verwerfen
                if (blk_change) begin
                    pool_pending   <= 1'b0;
                    even_row_ready <= 1'b0;
                    pool_wait      <= 1'b0;
                end

                // Pooling fertig -> pending löschen + wait löschen
                if (pooling_done_pulse) begin
                    pool_pending <= 1'b0;
                    pool_wait    <= 1'b0;
                end

                // Lines füllen (pro Byte/Takt)
                if ((st == ST_RUN) && pool_active) begin
                    if (cell_active &&
                        (win_x32 < fm_w32) && (win_y32 < fm_h32)) begin

                        px_xi = win_x32;

                        if ((px_xi >= 0) && (px_xi < IMG_W_MAX)) begin
                            if (win_y32[0] == 1'b0)
                                pool_line0[st_col][px_xi] <= pix_accel[st_lane][st_col];
                            else
                                pool_line1[st_col][px_xi] <= pix_accel[st_lane][st_col];
                        end
                    end
                end

                // Stripe-Status/Start nur am Tile-Ende
                if (pool_active && store_done_pulse && row_end_tile) begin
                    if (last_row_is_odd == 1'b0) begin
                        // EVEN-Zeile komplett
                        even_row_ready <= 1'b1;
                        even_row_y     <= last_y16;
                    end else begin
                        // ODD-Zeile komplett
                        if (pool_start_cond) begin
                            pool_start           <= 1'b1;
                            pool_row_y           <= last_y16;     // odd row index
                            pool_pending         <= 1'b1;
                            even_row_ready       <= 1'b0;
                            conv_done_global_int <= 1'b1;

// latch that we must ACK fetcher only after pooling_done
                            pool_wait            <= 1'b1;
                        end
                    end
                end
            end
        end
    end

    // Pooling: Channel-Abs (lokal -> absoluter Kanal im OFMAP)
    logic [31:0] pool_ch_sum32;
    always_comb begin
        pool_ch_sum32 = blk_base_co32 + {{(32-$bits(pool_w_ch_local)){1'b0}}, pool_w_ch_local};
        pool_w_ch_abs = pool_ch_sum32[$clog2(CO_MAX)-1:0];
    end

    pooling_module #(
        .FM_W_MAX    (IMG_W_MAX),
        .FM_H_MAX    (IMG_H_MAX),
        .FM_CH_MAX   (COLS_MAX),
        .OUT_W       (OUT_W),
        .POOL_STRIDE (2)
    ) u_pooling (
        .clk          (clk),
        .reset        (reset),

        .pool_enable  (pool_active),
        .pool_use_max (pool_use_max),

        .cfg_fm_w     (out_w_c),
        .cfg_fm_h     (out_h_c),
        .cfg_fm_ch    (tile_c_use),

        .start_pool   (pool_start),
        .stripe_y_in  (pool_row_y),

        .pool_line0   (pool_line0),
        .pool_line1   (pool_line1),

        .of_we        (pool_we),
        .of_ch        (pool_w_ch_local),
        .of_x         (pool_w_x),
        .of_y         (pool_w_y),
        .of_wdata     (pool_wdata),

        .pooling_busy (pool_busy),
        .pooling_done (pooling_done_pm)
    );

    // Fetcher handshake:
    //  - No pooling (oder DW): store_done_pulse
    //  - Pooling aktiv:
    //      * normal tiles: ack auf store_done_pulse
    //      * stripe tile (pool_start_cond): ack erst nach pooling_done_pulse
    assign acc_done_grp =
        (pool_active == 1'b0) ? store_done_pulse :
        (pool_wait ? pooling_done_pulse : (store_done_pulse & ~pool_start_cond));

    // OFMAP MUX
    always_comb begin
        if (pool_active) begin
            of_we    = pool_we;
            of_w_ch  = pool_w_ch_abs;
            of_w_y   = pool_w_y;
            of_w_x   = pool_w_x;
            of_wdata = pool_wdata;
        end else begin
            of_we    = store_we;
            of_w_ch  = store_w_ch;
            of_w_y   = store_w_y;
            of_w_x   = store_w_x;
            of_wdata = store_wdata;
        end
    end

    // done_all
    logic done_all_reg;
    assign done_all = done_all_reg;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            done_all_reg <= 1'b0;
        end else begin
            if (start_frame) begin
                done_all_reg <= 1'b0;
            end else begin
                if (!done_all_reg) begin
                    if (pool_active == 1'b0) begin
                        if (store_done_pulse &&
                            (dbg_blk_idx == (total_blks_c[15:0] - 16'd1)) &&
                            (dbg_grp_idx == (total_grps_c[15:0] - 16'd1))) begin
                            done_all_reg <= 1'b1;
                        end
                    end else begin
                        if (fetch_done_all_int && !pool_pending && !pool_busy && !pool_wait) begin
                            done_all_reg <= 1'b1;
                        end
                    end
                end
            end
        end
    end

endmodule
