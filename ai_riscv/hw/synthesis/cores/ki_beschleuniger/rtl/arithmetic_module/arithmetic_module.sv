`timescale 1ns/1ps

module arithmetic_module #(
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
  input  logic clk,
  input  logic reset,

  // Start der gesamten Arithmetic-/ReLU-Pipeline
  input  logic start_ctrl,

  // Laufzeit-Konfiguration
  input  logic relu_on_cfg,      // 1 => ReLU aktiv
  input  logic pooling_on_cfg,   // 1 => Pooling im Controller
  input  logic dw_on_cfg,        // 1 => Depthwise-Conv

  // Runtime CFG (aus CSR)
  input  logic [15:0] cfg_tile_r,   // aktive rows/lanes (<= ROWS_MAX)
  input  logic [15:0] cfg_tile_c,   // aktive cols       (<= COLS_MAX)
  input  logic [15:0] cfg_cin,      // <= CH_MAX
  input  logic [15:0] cfg_kh,       // <= K_MAX
  input  logic [15:0] cfg_kw,       // <= K_MAX

  // externe Handshakes (aus Fetcher/Writeback/Pooling-Logik)
  input  logic conv_done_global,
  input  logic pooling_done_ext,

  // Array-Inputs (physisch MAX breit)
  input  logic signed [0:ROWS_MAX-1][IW_I-1:0]   i_act_left_array,
  input  logic signed [0:COLS_MAX-1][IW_W-1:0]   i_wgt_top_array,
  input  logic signed [0:COLS_MAX-1][BIAS_W-1:0] i_bias_cols_array,
  input  logic signed [0:COLS_MAX-1][31:0]       i_output_multiplier_cols_array,
  input  logic signed [0:COLS_MAX-1][5:0]       i_requant_shift_cols_array,

  // Output: immer ROWS_MAX x COLS_MAX
  output logic signed [0:ROWS_MAX-1][0:COLS_MAX-1][OUT_W-1:0] o_pixel_array_accelerator,
  output logic        [0:ROWS_MAX-1][0:COLS_MAX-1]            o_pixel_valid_array_accelerator,

  output logic o_busy_accelerator,
  output logic o_done_accelerator,


  output logic        [0:ROWS_MAX-1][0:COLS_MAX-1]           dbg_cell_en_pe

  // FSM-State nach au�Yen

);

  // 2) Arithmetic Outputs
  logic signed   [0:ROWS_MAX-1][0:COLS_MAX-1][OUT_W-1:0] arithmetic_pix;
  logic unsigned [0:ROWS_MAX-1][0:COLS_MAX-1][0:0]       arithmetic_val_raw;
  logic          [0:ROWS_MAX-1][0:COLS_MAX-1]            arithmetic_val;

  genvar mr, mc;
  generate
    for (mr = 0; mr < ROWS_MAX; mr = mr + 1) begin : G_VAL_R
      for (mc = 0; mc < COLS_MAX; mc = mc + 1) begin : G_VAL_C
        assign arithmetic_val[mr][mc] = arithmetic_val_raw[mr][mc][0];
      end
    end
  endgenerate

  logic o_busy_arithmetic;
  logic o_done_arithmetic;

  // 3) Controller
  logic       ctrl_arithmetic_en;
  logic       ctrl_relu_en;
  logic       ctrl_busy;
  logic       ctrl_done;
  logic [2:0] ctrl_state;

  assign ctrl_state_dbg = ctrl_state;

  logic relu_done_int;

  arithmetic_controller u_ctrl (
    .clk             (clk),
    .reset           (reset),

    .start_ctrl      (start_ctrl),
    .auto_en         (1'b0),
    .dma_done_pulse  (1'b0),

    .relu_on         (relu_on_cfg),

    .arithmetic_done (o_done_arithmetic),
    .relu_done       (relu_done_int),

    .arithmetic_en        (ctrl_arithmetic_en),
    .relu_en              (ctrl_relu_en),

    .accelerator_busy     (ctrl_busy),
    .accelerator_is_done  (ctrl_done)

  );

  // 4) Arithmetic-Array (NEUE Ports!)
  conv_depth_module #(
    .ROWS_MAX          (ROWS_MAX),
    .COLS_MAX          (COLS_MAX),
    .CH_MAX            (CH_MAX),
    .K_MAX             (K_MAX),
    .IW_W              (IW_W),
    .IW_I              (IW_I),
    .BIAS_W            (BIAS_W),
    .OUT_W             (OUT_W),
    .KERNEL_ELEMS_MAX  (KERNEL_ELEMS_MAX),
    .ECNT_W            (ECNT_W)
  ) u_arith (
    .clk                            (clk),
    .reset                          (reset),
    .start_arithmetic               (ctrl_arithmetic_en),

    .con_mode_dw                    (dw_on_cfg),

    .cfg_tile_r                     (cfg_tile_r),
    .cfg_tile_c                     (cfg_tile_c),
    .cfg_cin                        (cfg_cin),
    .cfg_kh                         (cfg_kh),
    .cfg_kw                         (cfg_kw),

    .i_act_left_array               (i_act_left_array),
    .i_wgt_top_array                (i_wgt_top_array),
    .i_bias_cols_array              (i_bias_cols_array),
    .i_output_multiplier_cols_array (i_output_multiplier_cols_array),
    .i_requant_shift_cols_array     (i_requant_shift_cols_array),

    .o_pixel_array_arithmetic       (arithmetic_pix),
    .o_pixel_valid_array_arithmetic (arithmetic_val_raw),

    .o_busy_arithmetic              (o_busy_arithmetic),
    .o_done_arithmetic              (o_done_arithmetic),

    .dbg_cell_en_pe                 (dbg_cell_en_pe)


  );

  // 5) ReLU (NEUE Ports!)
  logic signed [0:ROWS_MAX-1][0:COLS_MAX-1][OUT_W-1:0] relu_pix;
  logic        [0:ROWS_MAX-1][0:COLS_MAX-1]            relu_val;

  relu_array #(
    .ROWS_MAX (ROWS_MAX),
    .COLS_MAX (COLS_MAX),
    .OUT_W    (OUT_W)
  ) u_relu_arr (
    .clk               (clk),
    .reset             (reset),

    .cfg_tile_r         (cfg_tile_r),
    .cfg_tile_c         (cfg_tile_c),

    .in_pix             (arithmetic_pix),
    .in_val             (arithmetic_val),

    .o_array_relu       (relu_pix),
    .o_array_relu_valid (relu_val),

    .relu_done          (relu_done_int)
  );

  // 6) Finale Auswahl: mit/ohne ReLU
  genvar r, c;
  generate
    for (r = 0; r < ROWS_MAX; r = r + 1) begin : GEN_OUT_R
      for (c = 0; c < COLS_MAX; c = c + 1) begin : GEN_OUT_C
        always_comb begin
          if (relu_on_cfg) begin
            o_pixel_array_accelerator[r][c]       = relu_pix[r][c];
            o_pixel_valid_array_accelerator[r][c] = relu_val[r][c];
          end else begin
            o_pixel_array_accelerator[r][c]       = arithmetic_pix[r][c];
            o_pixel_valid_array_accelerator[r][c] = arithmetic_val[r][c];
          end
        end
      end
    end
  endgenerate

  // Busy/Done nach au�Yen
  assign o_busy_accelerator = ctrl_busy | o_busy_arithmetic;
  assign o_done_accelerator = ctrl_done;

endmodule
