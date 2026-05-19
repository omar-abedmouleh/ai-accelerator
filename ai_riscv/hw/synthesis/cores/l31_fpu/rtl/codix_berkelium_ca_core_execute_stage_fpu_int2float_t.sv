/**
 *  Codasip s.r.o.
 * 
 *  CONFIDENTIAL
 * 
 *  Copyright 2024 Codasip s.r.o.
 * 
 *  All Rights Reserved.
 *  This file is part of the Codasip Studio product. No part of the Studio product, including this
 *  file, may be use, copied, modified, or distributed except in accordance with the terms contained
 *  in Codasip license agreement under which you obtained this file.
 * 
 *  \file
 *  \date    2024-11-27
 *  \author  Codasip (c) HW generator
 *  \version 9.4.1
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_int2float_t' CodAL module.
 *  \note    
 *           Generated for Codasip Ltd.
 *           
 *           Model version: 5.0.3
 *           
 *           Model configuration: l31-32IMFCB-UPTIDpbid
 *           Tools version: b'9.4.1'
 *           Evaluation mode: off
 *           Platform: centos.7.x86_64
 *           All Rights Reserved.
 *           
 *           If you require any assistance submit a support request: support@codasip.com
 *           
 */

module codix_berkelium_ca_core_execute_stage_fpu_int2float_t(
    input  logic execute_stage_fpu_int2float_s_i2f_ce_ICLK,
    input  logic RST,
    input  logic pipe_i2f_COMPUTE_CLEAR_Q,
    input  logic pipe_i2f_COMPUTE_STALL_Q,
    input  logic pipe_i2f_ROUNDING_CLEAR_Q,
    input  logic pipe_i2f_ROUNDING_STALL_Q,
    input  logic s_ack_i_D,
    input  logic s_clk_en_i_D,
    input  logic s_flush_i_D,
    input  logic [5:0] s_op_i_D,
    input  logic [2:0] s_rm_i_D,
    input  logic [4:0] s_ROB_ptr_i_D,
    input  logic [31:0] s_srcA_i_D,
    input  logic s_start_i_D,
    output logic pipe_i2f_COMPUTE_CLEAR_D,
    output logic pipe_i2f_COMPUTE_STALL_D,
    output logic pipe_i2f_ROUNDING_CLEAR_D,
    output logic pipe_i2f_ROUNDING_STALL_D,
    output logic s_ack_i_Q,
    output logic s_clk_en_i_Q,
    output logic s_done_o_Q,
    output logic [4:0] s_flags_o_Q,
    output logic s_i2f_ce_Q,
    output logic s_ready_o_Q,
    output logic [31:0] s_result_o_Q,
    output logic [4:0] s_ROB_ptr_o_Q,
    output logic s_start_i_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic s_start_i;
    // CodAL signal/wire
    logic [31:0] s_srcA_i;
    // CodAL signal/wire
    logic [5:0] s_op_i;
    // CodAL signal/wire
    logic [2:0] s_rm_i;
    // CodAL signal/wire
    logic [4:0] s_ROB_ptr_i;
    // CodAL signal/wire
    logic s_ack_i;
    // CodAL signal/wire
    logic s_flush_i;
    // CodAL signal/wire
    logic s_clk_en_i;
    // CodAL signal/wire
    logic [31:0] s_result_o;
    // CodAL signal/wire
    logic [4:0] s_flags_o;
    // CodAL signal/wire
    logic [4:0] s_ROB_ptr_o;
    // CodAL signal/wire
    logic s_done_o;
    // CodAL signal/wire
    logic s_ready_o;
    // CodAL signal/wire
    logic s_i2f_ce;

    // additional declarations:
    logic compute_int2float_r_fin_shift_WE_wire;
    logic compute_int2float_r_fin_shift_D_wire;
    logic r_fin_shift_Q_wire;
    logic compute_int2float_r_fin_input_WE_wire;
    logic compute_int2float_r_fin_input_D_wire;
    logic r_fin_input_Q_wire;

    // child instances inside CodAL module:
    // instance of 's_start_i' CodAL signal/wire: (single driver)
    assign s_start_i = s_start_i_D;
    // instance of 's_start_i' CodAL signal/wire: (parent port driver(s))
    assign s_start_i_Q = s_start_i;
    // instance of 's_srcA_i' CodAL signal/wire: (single driver)
    assign s_srcA_i = s_srcA_i_D;
    // instance of 's_op_i' CodAL signal/wire: (single driver)
    assign s_op_i = s_op_i_D;
    // instance of 's_rm_i' CodAL signal/wire: (single driver)
    assign s_rm_i = s_rm_i_D;
    // instance of 's_ROB_ptr_i' CodAL signal/wire: (single driver)
    assign s_ROB_ptr_i = s_ROB_ptr_i_D;
    // instance of 's_ack_i' CodAL signal/wire: (single driver)
    assign s_ack_i = s_ack_i_D;
    // instance of 's_ack_i' CodAL signal/wire: (parent port driver(s))
    assign s_ack_i_Q = s_ack_i;
    // instance of 's_flush_i' CodAL signal/wire: (single driver)
    assign s_flush_i = s_flush_i_D;
    // instance of 's_clk_en_i' CodAL signal/wire: (single driver)
    assign s_clk_en_i = s_clk_en_i_D;
    // instance of 's_clk_en_i' CodAL signal/wire: (parent port driver(s))
    assign s_clk_en_i_Q = s_clk_en_i;
    // instance of 's_result_o' CodAL signal/wire: (parent port driver(s))
    assign s_result_o_Q = s_result_o;
    // instance of 's_flags_o' CodAL signal/wire: (parent port driver(s))
    assign s_flags_o_Q = s_flags_o;
    // instance of 's_ROB_ptr_o' CodAL signal/wire: (parent port driver(s))
    assign s_ROB_ptr_o_Q = s_ROB_ptr_o;
    // instance of 's_done_o' CodAL signal/wire: (parent port driver(s))
    assign s_done_o_Q = s_done_o;
    // instance of 's_ready_o' CodAL signal/wire: (parent port driver(s))
    assign s_ready_o_Q = s_ready_o;
    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_fin_shift (
        .CLK(execute_stage_fpu_int2float_s_i2f_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_i2f_ROUNDING_CLEAR_Q),
        .STALL(pipe_i2f_ROUNDING_STALL_Q),
        .WE(compute_int2float_r_fin_shift_WE_wire),
        .D(compute_int2float_r_fin_shift_D_wire),
        .Q(r_fin_shift_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_fin_input (
        .CLK(execute_stage_fpu_int2float_s_i2f_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_i2f_COMPUTE_CLEAR_Q),
        .STALL(pipe_i2f_COMPUTE_STALL_Q),
        .WE(compute_int2float_r_fin_input_WE_wire),
        .D(compute_int2float_r_fin_input_D_wire),
        .Q(r_fin_input_Q_wire)
    );

    // instance of 's_i2f_ce' CodAL signal/wire: (parent port driver(s))
    assign s_i2f_ce_Q = s_i2f_ce;
    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_fpu_int2float_control_i2f_t control_i2f (
        .r_fin_input_Q(r_fin_input_Q_wire),
        .s_ack_i_Q(s_ack_i),
        .s_flush_i_Q(s_flush_i),
        .pipe_i2f_COMPUTE_CLEAR_D(pipe_i2f_COMPUTE_CLEAR_D),
        .pipe_i2f_COMPUTE_STALL_D(pipe_i2f_COMPUTE_STALL_D),
        .pipe_i2f_ROUNDING_CLEAR_D(pipe_i2f_ROUNDING_CLEAR_D),
        .pipe_i2f_ROUNDING_STALL_D(pipe_i2f_ROUNDING_STALL_D),
        .s_ready_o_D(s_ready_o)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_fpu_int2float_compute_int2float_t compute_int2float (
        .execute_stage_fpu_int2float_s_i2f_ce_ICLK(execute_stage_fpu_int2float_s_i2f_ce_ICLK),
        .RST(RST),
        .pipe_i2f_COMPUTE_CLEAR_Q(pipe_i2f_COMPUTE_CLEAR_Q),
        .pipe_i2f_COMPUTE_STALL_Q(pipe_i2f_COMPUTE_STALL_Q),
        .pipe_i2f_ROUNDING_CLEAR_Q(pipe_i2f_ROUNDING_CLEAR_Q),
        .pipe_i2f_ROUNDING_STALL_Q(pipe_i2f_ROUNDING_STALL_Q),
        .r_fin_input_Q(r_fin_input_Q_wire),
        .r_fin_shift_Q(r_fin_shift_Q_wire),
        .s_op_i_Q(s_op_i),
        .s_rm_i_Q(s_rm_i),
        .s_ROB_ptr_i_Q(s_ROB_ptr_i),
        .s_srcA_i_Q(s_srcA_i),
        .s_start_i_Q(s_start_i),
        .r_fin_input_D(compute_int2float_r_fin_input_D_wire),
        .r_fin_input_WE(compute_int2float_r_fin_input_WE_wire),
        .r_fin_shift_D(compute_int2float_r_fin_shift_D_wire),
        .r_fin_shift_WE(compute_int2float_r_fin_shift_WE_wire),
        .s_done_o_D(s_done_o),
        .s_flags_o_D(s_flags_o),
        .s_result_o_D(s_result_o),
        .s_ROB_ptr_o_D(s_ROB_ptr_o)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_fpu_int2float_clk_i2f_t clk_i2f (
        .r_fin_input_Q(r_fin_input_Q_wire),
        .r_fin_shift_Q(r_fin_shift_Q_wire),
        .s_clk_en_i_Q(s_clk_en_i),
        .s_start_i_Q(s_start_i),
        .s_i2f_ce_D(s_i2f_ce)
    );

endmodule: codix_berkelium_ca_core_execute_stage_fpu_int2float_t
