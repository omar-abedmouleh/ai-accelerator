`timescale 1ns/1ps

module process_element_module #(
  parameter int IW_W   = 8,
  parameter int IW_I   = 8,
  parameter int BIAS_W = 32,

  parameter int PROD_W = IW_W + IW_I,

  parameter int ACC_W     = 33,
  parameter int SAT_ACC_W = 32,
  parameter int OUT_W     = 8,

  parameter int KERNEL_ELEMS_MAX = 27,
  parameter int ECNT_W           = (KERNEL_ELEMS_MAX > 1) ? $clog2(KERNEL_ELEMS_MAX) : 1,

  // Output zero-point: change it if SW output offset differs from -128. Mobilnet V1 uses -128, but some quantization schemes might use a different value.
  parameter int signed OUTPUT_OFFSET_CONST = -128
)(
  input  logic                      clk,
  input  logic                      reset,

  input  logic signed [IW_W-1:0]     i_kernel,
  input  logic signed [IW_I-1:0]     i_cw,
  input  logic signed [BIAS_W-1:0]   bias,

  input  logic                      i_cell_en,
  input  logic                      i_pipeline_en,

  input  logic signed [5:0]         i_requant_shift,
  input  logic signed [31:0]        i_output_multiplier,
  input  logic [ECNT_W-1:0]         i_kernel_elems,

  output logic signed [OUT_W-1:0]   o_pixel,
  output logic                      o_pixel_valid,

  output logic signed [IW_W-1:0]    o_kernel,
  output logic signed [IW_I-1:0]    o_cw,
  output logic                      o_cell_en
);

 
  // Pipeline pass-through regs (kernel/cw/en)
 
  logic signed [IW_W-1:0] kernel_reg;
  logic signed [IW_I-1:0] cw_reg;
  logic                  cell_en_reg;

 
  // Requant params regs (live, as before)
 
  logic signed [5:0]         shift_reg;
  logic signed [31:0]        output_multiplier_reg;
  logic signed [BIAS_W-1:0]  bias_reg;

  logic signed [5:0]     shift_pipe_reg;   // kept
  logic signed [31:0]    mult_pipe_reg;    // kept

  wire shift_en   = i_pipeline_en;
  wire mac_active = i_pipeline_en & i_cell_en;
  logic mac_active_q;
  wire  mac_start = mac_active & ~mac_active_q;

 
  // Stage A: MAC accumulator
 
  logic signed [ACC_W-1:0]        acc_reg;
  logic signed [ACC_W-1:0]        acc_next_accw;
  logic [ECNT_W-1:0]              elem_cnt;

  // NEW: pending flag for output stage
  logic                           quant_pending;

  wire signed [PROD_W-1:0] prod_kernel_window = $signed(i_cw) * $signed(i_kernel);

  logic signed [ACC_W-1:0] op_a;
  logic signed [ACC_W-1:0] op_b;
  logic signed [ACC_W-1:0] sum_acc;

  logic                     ovf32;
  logic                     sign32;
  logic signed [SAT_ACC_W-1:0] a32;

  always_comb begin
    if (mac_start) begin
      op_a = $signed(prod_kernel_window);
      op_b = $signed(bias_reg);
    end else begin
      op_a = acc_reg;
      op_b = $signed(prod_kernel_window);
    end
    sum_acc       = op_a + op_b;
    acc_next_accw = sum_acc;
  end

  localparam logic signed [SAT_ACC_W-1:0] MAX_POS_32 = 32'sh7FFF_FFFF;
  localparam logic signed [SAT_ACC_W-1:0] MIN_NEG_32 = 32'sh8000_0000;

  always_comb begin
    ovf32  = sum_acc[ACC_W-1] ^ sum_acc[SAT_ACC_W-1];
    sign32 = sum_acc[ACC_W-1];

    if (ovf32 && !sign32)
      a32 = MAX_POS_32;
    else if (ovf32 && sign32)
      a32 = MIN_NEG_32;
    else
      a32 = sum_acc[SAT_ACC_W-1:0];
  end

  wire mac_last =
    (i_kernel_elems <= 1) ? mac_start
                          : (elem_cnt == (i_kernel_elems - 1));

 
  // NEW: register final MAC result and params at mac_last
 
  logic signed [SAT_ACC_W-1:0] acc_win_q;    // registered a32 (final sat32)
  logic signed [31:0]          mult_win_q;   // registered output multiplier
  logic signed [5:0]           shift_win_q;  // registered shift
  logic                        win_valid_q;  // 1-cycle pulse after mac_last

 
  // Stage B: 4x(17x17) Partial Products + Pipeline Register
 
  logic signed [31:0] A_s;
  logic signed [31:0] B_s;

  logic        [15:0] A_lo_u, B_lo_u;  // ZE lows
  logic signed [15:0] A_hi_s, B_hi_s;  // SE highs

  logic signed [32:0] p1_d, p2_d, p3_d, p4_d;

  logic signed [32:0] p1_q, p2_q, p3_q, p4_q;
  logic signed [5:0]  shift_q;
  logic               pp_valid_q;

  logic signed [63:0] mult_prod_b;

  // Partial products (combinational) from REGISTERED window values
  always_comb begin
    A_s = $signed(acc_win_q);
    B_s = $signed(mult_win_q);

    A_lo_u = A_s[15:0];
    B_lo_u = B_s[15:0];
    A_hi_s = A_s[31:16];
    B_hi_s = B_s[31:16];

    p1_d = $signed({1'b0, A_lo_u}) * $signed({1'b0, B_lo_u});
    p2_d = $signed({1'b0, A_lo_u}) * $signed({B_hi_s[15], B_hi_s});
    p3_d = $signed({A_hi_s[15], A_hi_s}) * $signed({1'b0, B_lo_u});
    p4_d = $signed({A_hi_s[15], A_hi_s}) * $signed({B_hi_s[15], B_hi_s});
  end

  // Compose 64-bit product AFTER pipeline
  always_comb begin
    mult_prod_b =
      $signed({{31{p1_q[32]}}, p1_q}) +
      ($signed({{31{p2_q[32]}}, p2_q}) <<< 16) +
      ($signed({{31{p3_q[32]}}, p3_q}) <<< 16) +
      ($signed({{31{p4_q[32]}}, p4_q}) <<< 32);
  end

 
  // Stage C: Requantization (same math), now uses mult_prod_b
 
  logic signed [5:0]        shift_amt_b;
  logic        [5:0]        lshift_raw_b;
  logic        [4:0]        lshift_amt_b;
  logic signed [31:0]       mult_shifted_b;
  logic signed [31:0]       round_bias_b;
  logic signed [31:0]       acc_shifted_b;
  logic signed [31:0]       acc_with_offset_b;

  logic signed [OUT_W-1:0]  mac_8_b;
  logic                     ovf8;

  always_comb begin
    shift_amt_b   = shift_q;
    lshift_raw_b  = 6'd0;
    lshift_amt_b  = 5'd0;
    round_bias_b  = 32'sd0;

    //mult_shifted_b = $signed(mult_prod_b >>> 31);   
    mult_shifted_b = $signed(mult_prod_b[31:0]);

    if (shift_amt_b == 0) begin
      acc_shifted_b = mult_shifted_b;
    end else begin
      lshift_raw_b = (shift_amt_b < 0) ? -shift_amt_b : shift_amt_b;
      if (lshift_raw_b > 6'd31)
        lshift_amt_b = 5'd31;
      else
        lshift_amt_b = lshift_raw_b[4:0];

      if (mult_shifted_b >= 0)
        round_bias_b = 32'sd1 <<< (lshift_amt_b - 1);
      else
        round_bias_b = (32'sd1 <<< (lshift_amt_b - 1)) - 32'sd1;

      acc_shifted_b = (mult_shifted_b + round_bias_b) >>> lshift_amt_b;
    end

    acc_with_offset_b = acc_shifted_b + SAT_ACC_W'(OUTPUT_OFFSET_CONST);

    ovf8 = |(acc_with_offset_b[31:OUT_W] ^ {32-OUT_W{acc_with_offset_b[OUT_W-1]}});

    if (ovf8 && !acc_with_offset_b[31])
      mac_8_b = 8'sh7F;
    else if (ovf8 && acc_with_offset_b[31])
      mac_8_b = 8'sh80;
    else
      mac_8_b = acc_with_offset_b[OUT_W-1:0];
  end

 
  // Sequential logic
 
  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      acc_reg      <= '0;
      elem_cnt     <= '0;
      mac_active_q <= 1'b0;

      kernel_reg   <= '0;
      cw_reg       <= '0;
      cell_en_reg  <= 1'b0;

      shift_pipe_reg        <= 6'd0;
      mult_pipe_reg         <= '0;

      bias_reg              <= '0;
      shift_reg             <= 6'd0;
      output_multiplier_reg <= '0;

      acc_win_q   <= '0;
      mult_win_q  <= '0;
      shift_win_q <= 6'd0;
      win_valid_q <= 1'b0;

      p1_q       <= '0;
      p2_q       <= '0;
      p3_q       <= '0;
      p4_q       <= '0;
      shift_q    <= 6'd0;
      pp_valid_q <= 1'b0;

      quant_pending <= 1'b0;

      o_pixel       <= '0;
      o_pixel_valid <= 1'b0;

    end else begin
      o_pixel_valid <= 1'b0;

      mac_active_q <= mac_active;

      bias_reg              <= bias;
      shift_reg             <= i_requant_shift;
      output_multiplier_reg <= i_output_multiplier;

      if (shift_en) begin
        kernel_reg     <= i_kernel;
        cw_reg         <= i_cw;
        cell_en_reg    <= i_cell_en;

        shift_pipe_reg <= i_requant_shift;
        mult_pipe_reg  <= i_output_multiplier;
      end

      // default pulses low
      win_valid_q <= 1'b0;
      pp_valid_q  <= 1'b0;

      // Stage A MAC
      if (!mac_active) begin
        elem_cnt <= '0;
      end else begin
        acc_reg <= acc_next_accw;

        if (mac_last) begin
          acc_win_q   <= a32;
          mult_win_q  <= output_multiplier_reg;
          shift_win_q <= shift_reg;
          win_valid_q <= 1'b1;

          elem_cnt <= '0;
        end else begin
          elem_cnt <= elem_cnt + ECNT_W'(1);
        end
      end

      // Stage B1: register partial products (pipeline after mults)
      if (win_valid_q) begin
        p1_q <= p1_d;
        p2_q <= p2_d;
        p3_q <= p3_d;
        p4_q <= p4_d;

        shift_q    <= shift_win_q;
        pp_valid_q <= 1'b1;
      end

      // Stage C: output one cycle after pp_valid_q
      if (pp_valid_q) begin
        quant_pending <= 1'b1;
      end

      if (quant_pending) begin
        o_pixel       <= mac_8_b;
        o_pixel_valid <= 1'b1;
        quant_pending <= 1'b0;
      end
    end
  end

  assign o_kernel  = kernel_reg;
  assign o_cw      = cw_reg;
  assign o_cell_en = cell_en_reg;

endmodule
