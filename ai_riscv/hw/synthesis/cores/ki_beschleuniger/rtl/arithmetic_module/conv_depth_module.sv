`timescale 1ns/1ps

module conv_depth_module #(
  // PHYSISCHE MAX (compile-time)
  parameter int ROWS_MAX    = 4,
  parameter int COLS_MAX    = 16,
  parameter int CH_MAX      = 3,
  parameter int K_MAX       = 3,

  parameter int IW_W        = 8,
  parameter int IW_I        = 8,
  parameter int BIAS_W      = 32,
  parameter int OUT_W       = 8,

  // Max. Kernel-Elems (z.B. 3*3*3 = 27)
  parameter int KERNEL_ELEMS_MAX = (K_MAX * K_MAX * CH_MAX),
  parameter int ECNT_W           = (KERNEL_ELEMS_MAX > 1) ? $clog2(KERNEL_ELEMS_MAX) : 1
)(
  input  logic                                  clk,
  input  logic                                  reset,
  input  logic                                  start_arithmetic,

  // 0=Conv, 1=Depthwise
  input  logic                                  con_mode_dw,

  // Runtime CFG (aus CSR)
  input  logic [15:0]                           cfg_tile_r,  // aktive rows/lanes (<= ROWS_MAX)
  input  logic [15:0]                           cfg_tile_c,  // aktive cols       (<= COLS_MAX)
  input  logic [15:0]                           cfg_cin,     // <= CH_MAX
  input  logic [15:0]                           cfg_kh,      // <= K_MAX
  input  logic [15:0]                           cfg_kw,      // <= K_MAX

  // Eingänge (physisch MAX breit)
  input  logic signed [0:ROWS_MAX-1][IW_I-1:0]   i_act_left_array,
  input  logic signed [0:COLS_MAX-1][IW_W-1:0]   i_wgt_top_array,
  input  logic signed [0:COLS_MAX-1][BIAS_W-1:0] i_bias_cols_array,
  input  logic signed [0:COLS_MAX-1][31:0]       i_output_multiplier_cols_array,

  // Shift ist signed (links/rechts), 6 Bit
  input  logic signed [0:COLS_MAX-1][5:0]        i_requant_shift_cols_array,

  // Ausgänge (physisch MAX breit)
  output logic signed   [0:ROWS_MAX-1][0:COLS_MAX-1][OUT_W-1:0] o_pixel_array_arithmetic,
  output logic unsigned [0:ROWS_MAX-1][0:COLS_MAX-1][0:0]       o_pixel_valid_array_arithmetic,

  output logic                                  o_busy_arithmetic,
  output logic                                  o_done_arithmetic,

  output logic        [0:ROWS_MAX-1][0:COLS_MAX-1]              dbg_cell_en_pe
);

  // Ableitungen (MAX, compile-time)
  localparam int KERNEL_ELEMS_DW_MAX = (K_MAX * K_MAX);

  localparam int MAX_CYCLES_CONV_MAX = (ROWS_MAX-1) + (COLS_MAX-1) + KERNEL_ELEMS_MAX;
  localparam int MAX_CYCLES_DW_MAX   = KERNEL_ELEMS_DW_MAX;
  localparam int MAX_CYCLES_MAX      =
      (MAX_CYCLES_CONV_MAX > MAX_CYCLES_DW_MAX) ? MAX_CYCLES_CONV_MAX : MAX_CYCLES_DW_MAX;

  // Laufsteuerung (Start-Puls)
  logic running;
  logic [$clog2(MAX_CYCLES_MAX)-1:0] cycle_cnt;

  logic start_q;
  wire  start_pulse;

  assign start_pulse = start_arithmetic & ~start_q;

  // Fix #1: Runtime-CFG am Start register (bricht CSR->PE-Pfad)
  logic        con_mode_dw_q;
  logic [15:0] cfg_tile_r_q;
  logic [15:0] cfg_tile_c_q;
  logic [15:0] cfg_cin_q;
  logic [15:0] cfg_kh_q;
  logic [15:0] cfg_kw_q;

  // optionale Safety-Clamps (gegen 0 / Out-of-Range)
  logic [15:0] cfg_tile_r_latched;
  logic [15:0] cfg_tile_c_latched;
  logic [15:0] cfg_cin_latched;
  logic [15:0] cfg_kh_latched;
  logic [15:0] cfg_kw_latched;

  always_comb begin
    cfg_tile_r_latched = cfg_tile_r;
    if (cfg_tile_r_latched == 16'd0) cfg_tile_r_latched = 16'd1;
    if (cfg_tile_r_latched > ROWS_MAX[15:0]) cfg_tile_r_latched = ROWS_MAX[15:0];

    cfg_tile_c_latched = cfg_tile_c;
    if (cfg_tile_c_latched == 16'd0) cfg_tile_c_latched = 16'd1;
    if (cfg_tile_c_latched > COLS_MAX[15:0]) cfg_tile_c_latched = COLS_MAX[15:0];

    cfg_cin_latched = cfg_cin;
    if (cfg_cin_latched == 16'd0) cfg_cin_latched = 16'd1;
    if (cfg_cin_latched > CH_MAX[15:0]) cfg_cin_latched = CH_MAX[15:0];

    cfg_kh_latched = cfg_kh;
    if (cfg_kh_latched == 16'd0) cfg_kh_latched = 16'd1;
    if (cfg_kh_latched > K_MAX[15:0]) cfg_kh_latched = K_MAX[15:0];

    cfg_kw_latched = cfg_kw;
    if (cfg_kw_latched == 16'd0) cfg_kw_latched = 16'd1;
    if (cfg_kw_latched > K_MAX[15:0]) cfg_kw_latched = K_MAX[15:0];
  end

  // NEU: kleine Bitbreite für Tile-R/C (Timing-Fix ohne Funktionsänderung)
  //   - weil cfg_tile_*_q bereits auf <= ROWS_MAX/COLS_MAX geklemmt ist
  localparam int TR_W = (ROWS_MAX <= 1) ? 1 : $clog2(ROWS_MAX + 1);
  localparam int TC_W = (COLS_MAX <= 1) ? 1 : $clog2(COLS_MAX + 1);

  logic [TR_W-1:0] cfg_tile_r_s;
  logic [TC_W-1:0] cfg_tile_c_s;

  always_comb begin
    cfg_tile_r_s = cfg_tile_r_q[TR_W-1:0];
    cfg_tile_c_s = cfg_tile_c_q[TC_W-1:0];
  end

  // Runtime kernel_elems_cur + max_cycles_cur (nur aus gelatchter CFG!)
  //   Wichtig: +1 Zyklus wegen PE-Pipeline (Quantisierung im Folgetakt)
  logic [ECNT_W-1:0]                 kernel_elems_cur;
  logic [$clog2(MAX_CYCLES_MAX)-1:0] max_cycles_cur;

  integer kernel_elems_int;
  integer max_cycles_int;

  always_comb begin
    kernel_elems_int = 1;
    max_cycles_int   = 1;

    if (con_mode_dw_q) begin
      kernel_elems_int = (cfg_kh_q * cfg_kw_q);
      if (kernel_elems_int < 1) kernel_elems_int = 1;
      max_cycles_int   = kernel_elems_int + 2; // +1 extra wegen neuer PE-Pipeline
    end
    else begin
      kernel_elems_int = (cfg_kh_q * cfg_kw_q * cfg_cin_q);
      if (kernel_elems_int < 1) kernel_elems_int = 1;
      max_cycles_int   = (cfg_tile_r_q - 1) + (cfg_tile_c_q - 1) + kernel_elems_int + 2; // +1 extra wegen neuer PE-Pipeline
      if (max_cycles_int < 1) max_cycles_int = 1;
    end

    kernel_elems_cur = kernel_elems_int[ECNT_W-1:0];
    max_cycles_cur   = max_cycles_int[$clog2(MAX_CYCLES_MAX)-1:0];
  end


  // Running/Counters + CFG-Latch on start
  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      start_q   <= 1'b0;
      running   <= 1'b0;
      cycle_cnt <= '0;

      con_mode_dw_q <= 1'b0;
      cfg_tile_r_q  <= 16'd1;
      cfg_tile_c_q  <= 16'd1;
      cfg_cin_q     <= 16'd1;
      cfg_kh_q      <= 16'd1;
      cfg_kw_q      <= 16'd1;

    end else begin
      start_q <= start_arithmetic;

      if (start_pulse && !running) begin
        running   <= 1'b1;
        cycle_cnt <= '0;

        con_mode_dw_q <= con_mode_dw;
        cfg_tile_r_q  <= cfg_tile_r_latched;
        cfg_tile_c_q  <= cfg_tile_c_latched;
        cfg_cin_q     <= cfg_cin_latched;
        cfg_kh_q      <= cfg_kh_latched;
        cfg_kw_q      <= cfg_kw_latched;

      end
      else if (running) begin
        cycle_cnt <= cycle_cnt + 1'b1;
        if (cycle_cnt == (max_cycles_cur - 1))
          running <= 1'b0;
      end
    end
  end

  assign o_busy_arithmetic = running;

  wire pipe_en;
  assign pipe_en = running | start_pulse;

  // TRIANGULAR Pre-Delays (Area-optimiert)
  logic signed [IW_I-1:0] act_tap [0:ROWS_MAX-1];
  logic signed [IW_W-1:0] wgt_tap [0:COLS_MAX-1];

  genvar gr_d, gc_d;

  generate
    for (gr_d = 0; gr_d < ROWS_MAX; gr_d = gr_d + 1) begin : GEN_ACT_TRI
      localparam int DLYR = gr_d;
      logic signed [IW_I-1:0] sh_act [0:DLYR];
      integer s_act;

      always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
          for (s_act = 0; s_act <= DLYR; s_act = s_act + 1)
            sh_act[s_act] <= '0;
        end
        else if (pipe_en) begin
          sh_act[0] <= i_act_left_array[gr_d];
          for (s_act = 1; s_act <= DLYR; s_act = s_act + 1)
            sh_act[s_act] <= sh_act[s_act-1];
        end
      end

      assign act_tap[gr_d] = sh_act[DLYR];
    end
  endgenerate

  generate
    for (gc_d = 0; gc_d < COLS_MAX; gc_d = gc_d + 1) begin : GEN_WGT_TRI
      localparam int DLYC = gc_d;
      logic signed [IW_W-1:0] sh_wgt [0:DLYC];
      integer s_wgt;

      always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
          for (s_wgt = 0; s_wgt <= DLYC; s_wgt = s_wgt + 1)
            sh_wgt[s_wgt] <= '0;
        end
        else if (pipe_en) begin
          sh_wgt[0] <= i_wgt_top_array[gc_d];
          for (s_wgt = 1; s_wgt <= DLYC; s_wgt = s_wgt + 1)
            sh_wgt[s_wgt] <= sh_wgt[s_wgt-1];
        end
      end

      assign wgt_tap[gc_d] = sh_wgt[DLYC];
    end
  endgenerate

  // Durchreich-Busse (physisch MAX)
  logic signed [IW_I-1:0] cw_bus     [0:ROWS_MAX-1][0:COLS_MAX];
  logic signed [IW_W-1:0] kernel_bus [0:ROWS_MAX][0:COLS_MAX-1];

  genvar gr, gc;

  generate
    for (gr = 0; gr < ROWS_MAX; gr = gr + 1) begin : FEED_ACT
      assign cw_bus[gr][0] = act_tap[gr];
    end
    for (gc = 0; gc < COLS_MAX; gc = gc + 1) begin : FEED_WGT
      assign kernel_bus[0][gc] = wgt_tap[gc];
    end
  endgenerate

  // PE-Array mit runtime Aktivierung über cfg_tile_r/c (gelatcht!)
  logic cell_en_bus [0:ROWS_MAX-1][0:COLS_MAX-1];

  generate
    for (gr = 0; gr < ROWS_MAX; gr = gr + 1) begin : ROW_GEN
      for (gc = 0; gc < COLS_MAX; gc = gc + 1) begin : COL_GEN

        localparam int GR_I = gr;
        localparam int GC_I = gc;

        wire is_diag;
        assign is_diag = (GR_I == GC_I);

        logic row_active;
        logic col_active;
        logic pe_active;

// Hier ist der Timing-Fix: Vergleiche mit cfg_tile_*_s (kleine Breite)
        always_comb begin
          row_active = (cfg_tile_r_s > TR_W'(GR_I));
          col_active = (cfg_tile_c_s > TC_W'(GC_I));
          pe_active  = row_active && col_active;
        end

        // Enable
        if (GC_I == 0) begin : LEFT_EDGE
          always_comb begin
            if (!pe_active) begin
              cell_en_bus[GR_I][GC_I] = 1'b0;
            end
            else if (con_mode_dw_q) begin
              cell_en_bus[GR_I][GC_I] = running && (GR_I == 0);
            end
            else begin
              cell_en_bus[GR_I][GC_I] =
                running &&
                (cycle_cnt >= GR_I) &&
                (cycle_cnt < (GR_I + kernel_elems_cur));
            end
          end
        end
        else begin : NOT_LEFT_EDGE
          always_comb begin
            if (!pe_active) begin
              cell_en_bus[GR_I][GC_I] = 1'b0;
            end
            else if (con_mode_dw_q) begin
              cell_en_bus[GR_I][GC_I] = running && is_diag;
            end
            else begin
              // Avoid stale cell_en from previous layer on first cycle
              if (cycle_cnt != '0)
                cell_en_bus[GR_I][GC_I] = dbg_cell_en_pe[GR_I][GC_I-1];
              else
                cell_en_bus[GR_I][GC_I] = 1'b0;
            end
          end
        end

        // Inputs
        wire signed [BIAS_W-1:0] bias_sel;
        assign bias_sel = i_bias_cols_array[GC_I];

        wire signed [IW_I-1:0] pe_cw_in;
        wire signed [IW_W-1:0] pe_kernel_in;

        assign pe_cw_in =
          (con_mode_dw_q)
            ? ((pe_active && is_diag) ? i_act_left_array[GR_I] : '0)
            : (pe_active ? cw_bus[GR_I][GC_I] : '0);

        assign pe_kernel_in =
          (con_mode_dw_q)
            ? ((pe_active && is_diag) ? i_wgt_top_array[GC_I] : '0)
            : (pe_active ? kernel_bus[GR_I][GC_I] : '0);

        // PE
        logic signed [OUT_W-1:0] px;
        logic                    px_v;
        logic signed [IW_W-1:0]  k_down;
        logic signed [IW_I-1:0]  cw_right;

        process_element_module #(
          .IW_W            (IW_W),
          .IW_I            (IW_I),
          .BIAS_W          (BIAS_W),
          .OUT_W           (OUT_W),
          .KERNEL_ELEMS_MAX(KERNEL_ELEMS_MAX),
          .ECNT_W          (ECNT_W)
        ) u_pe (
          .clk             (clk),
          .reset           (reset),
          .i_kernel        (pe_kernel_in),
          .i_cw            (pe_cw_in),
          .bias            (bias_sel),
          .i_cell_en       (cell_en_bus[GR_I][GC_I]),
          .i_pipeline_en   (running),
          .i_requant_shift (i_requant_shift_cols_array[GC_I]),
          .i_output_multiplier (i_output_multiplier_cols_array[GC_I]),
          .i_kernel_elems  (kernel_elems_cur),
          .o_pixel         (px),
          .o_pixel_valid   (px_v),
          .o_kernel        (k_down),
          .o_cw            (cw_right),
          .o_cell_en       (dbg_cell_en_pe[GR_I][GC_I])
        );

        // Weiterreichen (Conv) / Null (DW oder inaktiv)
        always_comb begin
          if (!pe_active || con_mode_dw_q) begin
            cw_bus[GR_I][GC_I+1]     = '0;
            kernel_bus[GR_I+1][GC_I] = '0;
          end
          else begin
            cw_bus[GR_I][GC_I+1]     = cw_right;
            kernel_bus[GR_I+1][GC_I] = k_down;
          end
        end

        // Ausgänge
        assign o_pixel_array_arithmetic[GR_I][GC_I]       = px;
        assign o_pixel_valid_array_arithmetic[GR_I][GC_I] = {px_v};

      end
    end
  endgenerate

  // DONE-Puls: Rising Edge vom "letzten aktiven" PE (gelatchte CFG!)
  logic br_v_sel;
  logic br_v_q;

  integer br_r_int;
  integer br_c_int;
  integer min_rc;

  always_comb begin
    br_r_int = 0;
    br_c_int = 0;

    if (con_mode_dw_q) begin
      min_rc = cfg_tile_r_q;
      if (cfg_tile_c_q < cfg_tile_r_q) min_rc = cfg_tile_c_q;

      br_r_int = min_rc - 1;
      br_c_int = min_rc - 1;
    end
    else begin
      br_r_int = cfg_tile_r_q - 1;
      br_c_int = cfg_tile_c_q - 1;
    end

    if (br_r_int < 0) br_r_int = 0;
    if (br_c_int < 0) br_c_int = 0;

    if (br_r_int > (ROWS_MAX-1)) br_r_int = (ROWS_MAX-1);
    if (br_c_int > (COLS_MAX-1)) br_c_int = (COLS_MAX-1);

    br_v_sel = o_pixel_valid_array_arithmetic[br_r_int][br_c_int][0];
  end

  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      br_v_q            <= 1'b0;
      o_done_arithmetic <= 1'b0;
    end
    else begin
      br_v_q            <= br_v_sel;
      o_done_arithmetic <= br_v_sel & ~br_v_q;
    end
  end

endmodule
