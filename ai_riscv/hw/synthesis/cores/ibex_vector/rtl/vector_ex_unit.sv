// Vector Execution Unit
//////////////PROBLEMS SECTION//////////////////
// TODO: PROBLEM, USING VMV WITH LMUL > 1 REQUIRES THAT V1,V2... NULLED
// TODO: THE UNIT CAN NOT HANDLE THE CASE WHERE VL = 0
////////////////////////////////////////////////
module vector_ex_unit import ibex_pkg::*; #(
  parameter int unsigned VLEN = 128,

  // Parameterized constants, do not change!
  parameter int unsigned NUM_SLICES = VLEN / 32,               // Number of slices per vector register
  parameter int unsigned COUNTER_WIDTH = $clog2(NUM_SLICES) + 1 + 3,   // Counter width for slice iteration

  // Half number of slices (used by widening ops)
  parameter int unsigned HALF_NUM_SLICES = NUM_SLICES / 2
) (
  input  logic         clk_i,
  input  logic         rst_ni,

  // FROM/TO Decoder
  input  logic         ex_req_i,          // Vector ALU operation request
  input  logic         is_mul,            // 0 for vector_alu operation and 1 for vector_mul operation
  input  v_alu_op_e    op_i,              // ALU operation or MUL operation
  output logic         resp_valid_o, // This is a very important Signal, without it we can't stall the core. It can be st_resp_valid or ld_resp_valid

  // CSR Registers
  input  vew_e         vew_i,             // Element width
  input  logic [31:0]  v_vl_i,

  // Vector register file interface
  input  logic [VLEN-1:0] vrf_rdata1_i,
  input  logic [VLEN-1:0] vrf_rdata2_i,
  
  // Vector register file interface
  output logic            vrf_we_o,
  output logic [VLEN-1:0] vrf_wdata_o,

  input  logic [31:0]     rf_rdata_a_i,
  input  logic            is_scalar_i, 

  // Status signals
  output logic         busy_o,
  // Pulse: indicates intermediate write and request to increment vd externally
  output logic         refresh_vd_o,

  output logic         refresh_vs1_o,
  output logic         refresh_vs2_o
);

  typedef enum logic[1:0] {
    EX_IDLE,
    EX_WAIT,
    EX_REQ,
    EX_REFRESH_VRFS
  } ex_state_e;

  ex_state_e ex_state_q, ex_state_d;

  logic [VLEN-1:0] vrf_rdata1_q, vrf_rdata1_d;
  logic [VLEN-1:0] vrf_rdata2_q, vrf_rdata2_d;
  logic [VLEN-1:0] result_q, result_d;

  // Internal signals
  logic [31:0] operand_a;
  logic [31:0] operand_b;
  logic        valid;
  logic [31:0] ex_result;
  logic [31:0] ex_result_h;

  logic [31:0] total_bytes; 
  logic [COUNTER_WIDTH-1:0] anzahl_req;

  logic last_req;

  // Element size calculation
  logic [1:0] SHIFT_FAKTOR;

  logic [COUNTER_WIDTH-1:0] requests_counter_q, requests_counter_d;
  logic [COUNTER_WIDTH-1:0] res_counter_q, res_counter_d;

  logic wide;
  logic [63:0] w_ex_result;

  logic [31:0] scalar_operand;

  logic [32-1:0] wide_out_slices; // how many 64-bit result slices are valid
  logic [32-1:0] wide_shift_amt; // shift in bits (needs extra bits for multiplication)

  logic is_mul_intern;
  logic pipe_out_valid;

  logic last_valid_d, last_valid_q;

  // New FSM-driven control signals
  logic                fwd_operand_a;       // 1: use inputs, 0: use queued
  logic                fwd_operand_b;       // 1: use inputs, 0: use queued

  logic refresh_srcs;
  logic last_valid;

  logic refresh_vd;

  // Pipeline stage for writeback outputs
  logic            vrf_we_d, vrf_we_q;

  logic [VLEN - 1:0] vs1_mux_data;

  assign wide = (op_i == VWMUL) || (op_i == VWADD);
  assign w_ex_result = {ex_result_h, ex_result};
  
  always_comb begin : veu_sew_to_shift
    case (vew_i)
      EW8: begin // SEW=8
        SHIFT_FAKTOR = 2'd0;
      end
      EW16: begin // SEW=16
        SHIFT_FAKTOR = 2'd1;
      end
      EW32: begin // SEW=32
        SHIFT_FAKTOR = 2'd2;
      end
      default: begin
        SHIFT_FAKTOR = 2'd0;
      end
    endcase
  end
  
  // Calculate total bytes and number of 32-bit requests
  assign total_bytes = (v_vl_i << SHIFT_FAKTOR);
  assign anzahl_req = total_bytes[2 + COUNTER_WIDTH - 1:2] + {{(COUNTER_WIDTH-1){1'b0}}, |total_bytes[1:0]}; // Ceiling division by 4

  // For widening (64-bit) results: number of 64-bit slices produced = ceil(anzahl_req / 2)
  always_comb begin : veu_wide_shift_calc
    wide_shift_amt = '0;
    wide_out_slices = '0;
    if (wide) begin
      // wide_out_slices = (anzahl_req >> 1) + anzahl_req[0]; // ceil division by 2
      if (anzahl_req[$clog2(HALF_NUM_SLICES)-1:0] == '0) begin
        wide_shift_amt = '0; // multiply by 64
      end
      // Shift to drop unused high 64-bit slots: (HALF_NUM_SLICES - wide_out_slices) * 64
      else begin
        wide_out_slices = {{(32-$clog2(HALF_NUM_SLICES)){1'b0}}, anzahl_req[$clog2(HALF_NUM_SLICES)-1:0]};
        wide_shift_amt = (HALF_NUM_SLICES - wide_out_slices) << 6; // multiply by 64
      end
    end
    else begin
      // wide_out_slices = (anzahl_req >> 1) + anzahl_req[0]; // ceil division by 2
      if (anzahl_req[$clog2(NUM_SLICES)-1:0] == '0) begin
        wide_shift_amt = '0;
      end
      // Shift to drop unused high 64-bit slots: (HALF_NUM_SLICES - wide_out_slices) * 64
      else begin
        wide_out_slices = {{(32-$clog2(NUM_SLICES)){1'b0}}, anzahl_req[$clog2(NUM_SLICES)-1:0]};
        wide_shift_amt = (NUM_SLICES - wide_out_slices) << 5; // multiply by 32
      end
    end
  end

  always_comb begin : veu_scalar_operand_build
    case (vew_i)
      EW8: begin // SEW=8
        scalar_operand = {rf_rdata_a_i[7:0],rf_rdata_a_i[7:0],rf_rdata_a_i[7:0],rf_rdata_a_i[7:0]};
      end
      EW16: begin // SEW=16
        scalar_operand = {rf_rdata_a_i[15:0],rf_rdata_a_i[15:0]};
      end
      EW32: begin // SEW=32
        scalar_operand = rf_rdata_a_i;
      end
      default: begin
        scalar_operand = rf_rdata_a_i;
      end
    endcase 
  end

  //=============================================================================
  // Vector Lane Instance (wraps ALU and MUL)
  //=============================================================================
  assign is_mul_intern = (op_i == VWMUL) || (op_i == MUL_VMUL) || (op_i == MUL_VMULH) || (op_i == MUL_VMACC);

  vector_lane u_vector_lane (
    .clk_i        (clk_i),
    .rst_ni       (rst_ni),
    .valid_i      (valid),
    .is_mul_i     (is_mul_intern),
    .op_i         (op_i),
    .vew_i        (vew_i),
    .operand_a_i  (operand_a),
    .operand_b_i  (operand_b),
    .pipe_in_ready_o(), // ready not used in VEU logic
    .pipe_out_valid_o(pipe_out_valid), // the response is valid
    .result_o     (ex_result),
    .result_h_o   (ex_result_h)
  );

  // Register the output for timing
  always_ff @(posedge clk_i or negedge rst_ni) begin : veu_regs
    if (!rst_ni) begin
        vrf_rdata1_q <= '0;
        vrf_rdata2_q <= '0;
        requests_counter_q <= '0;
        res_counter_q <= '0;
        result_q <= '0;
        ex_state_q <= EX_IDLE;
        last_valid_q <= '0;
    end else begin
        last_valid_q <= last_valid_d;
        res_counter_q <= res_counter_d;
        vrf_rdata1_q <= vrf_rdata1_d;
        vrf_rdata2_q <= vrf_rdata2_d;
        requests_counter_q <= requests_counter_d;
        result_q <= result_d;
        ex_state_q <= ex_state_d;
    end
  end

  // Request counter logic
  always_comb begin : veu_req_counter
    requests_counter_d = requests_counter_q;
    last_req = 1'b0;
    refresh_srcs = 1'b0;
    
    // Advance requests on acceptance; with no ready, acceptance == valid
    if (((ex_state_q != EX_IDLE) || ex_req_i) && (ex_state_q != EX_WAIT)) begin
      if (requests_counter_q + 1 == anzahl_req) begin
        last_req = 1'b1;
        requests_counter_d = '0; // Reset for next operation //checked
      end else begin
        requests_counter_d = requests_counter_q + 1;
        if (wide) begin // widening mode
          if (requests_counter_d[$clog2(NUM_SLICES)-1:0] == '0) begin
            refresh_srcs = 1'b1;
          end
        end
        else begin // standard mode
          if (requests_counter_d[$clog2(NUM_SLICES)-1:0] == '0) begin
            refresh_srcs = 1'b1;
          end
        end
      end
    end
  end

  assign resp_valid_o = last_valid_q;

  assign last_valid_d = last_valid;

  assign refresh_vd_o = vrf_we_q;
  // Valid response counter logic
  always_comb begin : veu_resp_counter
    res_counter_d = res_counter_q;

    // resp_valid_o = 1'b0;
    refresh_vd = 1'b0; // default

    last_valid = 1'b0;

    if (pipe_out_valid && ((ex_state_q != EX_IDLE) || ex_req_i)) begin
      if (res_counter_q + 1 == anzahl_req) begin
        last_valid = 1'b1;
        // resp_valid_o = 1'b1;
        res_counter_d = '0; // Reset for next operation //checked
      end else begin
        res_counter_d = res_counter_q + 1;

        if (wide) begin // widening mode
          if (res_counter_d[$clog2(NUM_SLICES)-1:0] == '0) begin
            refresh_vd = 1'b1;
          end
          else if (res_counter_d[$clog2(HALF_NUM_SLICES)-1:0] == '0) begin
            refresh_vd = 1'b1;
          end
        end

        else begin // standard mode no Widening!
          if (res_counter_d[$clog2(NUM_SLICES)-1:0] == '0) begin
            refresh_vd = 1'b1;
          end
        end
      end
    end
  end

  // Combinational block for VRF write enable (drives pipeline input)
  always_comb begin : veu_we_build
    vrf_we_d = last_valid | refresh_vd;
  end

  // Build VRF write data in a dedicated combinational block
  // always_comb begin : veu_wdata_build
  //   vrf_wdata_o = '0;
  //   if (last_valid) begin
  //     // Alignment correction: shift out unused upper bits for final write
  //     if (~wide) begin
  //       vrf_wdata_o = {ex_result, result_q[VLEN-1:32]} >> wide_shift_amt;
  //     end else begin
  //       vrf_wdata_o = {w_ex_result, result_q[VLEN-1:64]} >> wide_shift_amt;
  //     end
  //   end else begin
  //     // Intermediate writes are unshifted
  //     if (~wide) begin
  //       vrf_wdata_o = {ex_result, result_q[VLEN-1:32]};
  //     end else begin
  //       vrf_wdata_o = {w_ex_result, result_q[VLEN-1:64]};
  //     end
  //   end
  // end

  // Pipeline flip-flop for writeback
  always_ff @(posedge clk_i or negedge rst_ni) begin : veu_writeback_pipeline
    if (!rst_ni) begin
      vrf_we_q    <= '0;
    end else begin
      vrf_we_q    <= vrf_we_d;
    end
  end

  // Outputs are registered (one cycle delayed)
  assign vrf_we_o    = vrf_we_q;

  always_comb begin
    if (last_valid_q) begin
      vrf_wdata_o = result_q >> wide_shift_amt;
    end else begin
      vrf_wdata_o = result_q;
    end
  end

  assign busy_o = (ex_state_q != EX_IDLE) || vrf_we_q;


  always_comb begin : veu_fsm
    ex_state_d = ex_state_q;

    // Defaults for control signals
    refresh_vs1_o      = 1'b0;
    refresh_vs2_o      = 1'b0;
    fwd_operand_a      = 1'b0;
    fwd_operand_b      = 1'b0;
    valid              = 1'b0;

    unique case (ex_state_q)
      EX_IDLE: begin
        if (ex_req_i) begin
          // Drive operands from inputs on IDLE
          fwd_operand_a = 1'b1;
          fwd_operand_b = 1'b1;
          valid         = 1'b1;
          // No ready gating: move directly into request flow
          if (last_req) begin
            if (last_valid) ex_state_d = EX_IDLE;
            else ex_state_d = EX_WAIT; // wait for a valid signal
          end
          else ex_state_d = EX_REQ;
        end
      end
      EX_WAIT: begin // for now not used, will be replaced by wait valid signal
        // With no ready, waiting collapses into continuous request flow
        if (last_valid) ex_state_d = EX_IDLE;
      end
      EX_REQ: begin
        valid        = 1'b1;
        fwd_operand_a = 1'b0;
        fwd_operand_b = 1'b0;
        if (last_req) begin
          if (last_valid) ex_state_d = EX_IDLE;
          else ex_state_d = EX_WAIT; // wait for a valid signal
        end
        else if (refresh_srcs) begin 
          ex_state_d = EX_REFRESH_VRFS;
          refresh_vs1_o = 1'b1;
          refresh_vs2_o = 1'b1; 
        end else begin
          ex_state_d = EX_REQ;
        end
      end
      EX_REFRESH_VRFS: begin
        // Drive operands from inputs while refreshing sources
        fwd_operand_a = 1'b1;
        fwd_operand_b = 1'b1;
        valid        = 1'b1;
        if (last_req) begin
          if (last_valid) ex_state_d = EX_IDLE;
          else ex_state_d = EX_WAIT; // wait for a valid signal
        end
        else ex_state_d = EX_REQ;
      end
    endcase
  end

  // Build operands and valid in a dedicated combinational block
  always_comb begin : veu_operands_build
    operand_a = '0;
    operand_b = '0;
    if (fwd_operand_a) begin
      operand_a = vs1_mux_data[31:0];
    end else begin
      operand_a = vrf_rdata1_q[31:0];
    end
    operand_b = fwd_operand_b ? vrf_rdata2_i[31:0] : vrf_rdata2_q[31:0];
  end

  always_comb begin : veu_pack_scalar_or_vrf1
    if (is_scalar_i) vs1_mux_data = {scalar_operand,scalar_operand,scalar_operand,scalar_operand};
    else vs1_mux_data = vrf_rdata1_i;
  end

  always_comb begin : veu_vrf1_next_sel
    vrf_rdata1_d = vrf_rdata1_q;
    if (fwd_operand_a) begin
      // Shift on acceptance; with no ready, acceptance == valid
      vrf_rdata1_d = vs1_mux_data >> 32;
    end else begin
      vrf_rdata1_d = vrf_rdata1_q >> 32;
    end
  end

  always_comb begin : veu_vrf2_next_sel
    vrf_rdata2_d = vrf_rdata2_q;
    if (fwd_operand_b) begin
      vrf_rdata2_d = vrf_rdata2_i >> 32;
    end else begin
      vrf_rdata2_d = vrf_rdata2_q >> 32;
    end
  end


  // Build result accumulation in a dedicated combinational block
  always_comb begin : veu_result_accum
    result_d = result_q;
    if (pipe_out_valid) begin
      if (wide) begin
        result_d = {w_ex_result, result_q[VLEN-1:64]};
      end else begin
        result_d = {ex_result, result_q[VLEN-1:32]};
      end
    end
  end

endmodule
