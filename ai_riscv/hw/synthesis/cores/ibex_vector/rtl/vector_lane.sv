// Vector Lane Wrapper
// Wraps both Vector ALU and Vector MUL in a single module

module vector_lane import ibex_pkg::*; (
  input  logic         clk_i,
  input  logic         rst_ni,

  // Operation control
  input  logic         valid_i,
  input  logic         is_mul_i,        // 0 for ALU, 1 for MUL
  input  v_alu_op_e    op_i,
  input  vew_e         vew_i,

  // Operands
  input  logic [31:0]  operand_a_i,
  input  logic [31:0]  operand_b_i,

  output logic pipe_in_ready_o, // ready to take new requests
  output logic pipe_out_valid_o, // the response is valid

  // Result
  output logic [31:0]  result_o,
  // Result (high part for widening operations)
  output logic [31:0]  result_h_o
);

  typedef struct packed {
    v_alu_op_e  op;
    logic       accsub;
    logic       op1_signed;
    logic       op2_signed;
  } op_mode_mul;

  typedef struct packed {
    op_mode_mul  mul_mode;
    vew_e        eew;
  } ctrl_t;

  logic [31:0] alu_result;
  logic [31:0] alu_result_h;
  logic [31:0] mul_result;
  logic [31:0] mul_result_h;
  ctrl_t       mul_ctrl;

  //=============================================================================
  // Vector ALU Instance
  //=============================================================================
  
  vector_alu u_vector_alu (
    .operand_a_i  (operand_a_i),
    .operand_b_i  (operand_b_i),
    .valid_i      (valid_i & ~is_mul_i),
    .op_i         (op_i),
    .vew_i        (vew_i),
    .result_o     (alu_result),
    .result_h_o   (alu_result_h)
  );

  //=============================================================================
  // Vector Multiplier Instance
  //=============================================================================

  // Configure multiplier control
  always_comb begin
    mul_ctrl.eew = vew_i;
    mul_ctrl.mul_mode.op = op_i;
    mul_ctrl.mul_mode.accsub = 1'b0;
    mul_ctrl.mul_mode.op1_signed = 1'b1;
    mul_ctrl.mul_mode.op2_signed = 1'b1;
  end

  logic pipe_in_ready_mul;
  logic pipe_out_valid_mul;
  vector_mul #(
    .MUL_OP_W       (32),
    .BUF_OPERANDS   (1'b0),
    .BUF_MUL_IN     (1'b1),
    .BUF_MUL_OUT    (1'b1),
    .BUF_RESULTS    (1'b0),
    .CTRL_T         (ctrl_t),
    .DONT_CARE_ZERO (1'b0)
  ) u_vector_mul (
    .clk_i              (clk_i),
    .async_rst_ni       (rst_ni),
    .sync_rst_ni        (rst_ni),
    .pipe_in_valid_i    (valid_i & is_mul_i),
    .pipe_in_ready_o    (pipe_in_ready_mul),
    .pipe_in_ctrl_i     (mul_ctrl),
    .pipe_in_op1_i      (operand_a_i),
    .pipe_in_op2_i      (operand_b_i),
    .pipe_in_op3_i      ('0),
    .pipe_out_valid_o   (pipe_out_valid_mul),
    .pipe_out_ready_i   (1'b1),
    .pipe_out_ctrl_o    (),
    .pipe_out_res_o     (mul_result),
    .pipe_out_res_h_o   (mul_result_h)
  );

  assign pipe_in_ready_o = is_mul_i ? pipe_in_ready_mul : 1'b1;
  assign pipe_out_valid_o = is_mul_i ? pipe_out_valid_mul : 1'b1;

  // Result multiplexer
  assign result_o = is_mul_i ? mul_result : alu_result;
  assign result_h_o = is_mul_i ? mul_result_h : alu_result_h;
  // assign result_h_o  = (is_mul_i && op_i == VWMUL) ? mul_result_h : 32'b0;

endmodule
