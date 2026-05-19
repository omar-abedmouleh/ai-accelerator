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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_fmul_t' CodAL module.
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

module codix_berkelium_ca_core_execute_stage_fpu_fmul_t(
    input  logic execute_stage_fpu_fmul_s_fmul_ce_ICLK,
    input  logic RST,
    input  logic pipe_fmul_MUL_CLEAR_Q,
    input  logic pipe_fmul_POSTNORM1_CLEAR_Q,
    input  logic pipe_fmul_POSTNORM2_CLEAR_Q,
    input  logic pipe_fmul_ROUNDING_CLEAR_Q,
    input  logic s_clk_en_i_D,
    input  logic s_flush_i_D,
    input  logic [5:0] s_op_i_D,
    input  logic [7:0] s_properties_i_D,
    input  logic [2:0] s_rm_i_D,
    input  logic [4:0] s_ROB_ptr_i_D,
    input  logic [31:0] s_srcA_i_D,
    input  logic [31:0] s_srcB_i_D,
    input  logic s_start_i_D,
    output logic pipe_fmul_MUL_CLEAR_D,
    output logic pipe_fmul_POSTNORM1_CLEAR_D,
    output logic pipe_fmul_POSTNORM2_CLEAR_D,
    output logic pipe_fmul_ROUNDING_CLEAR_D,
    output logic s_clk_en_i_Q,
    output logic s_done_o_Q,
    output logic [4:0] s_flags_o_Q,
    output logic s_fmul_ce_Q,
    output logic [57:0] s_mul_partial_result_Q,
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
    logic [31:0] s_srcB_i;
    // CodAL signal/wire
    logic [5:0] s_op_i;
    // CodAL signal/wire
    logic [2:0] s_rm_i;
    // CodAL signal/wire
    logic [4:0] s_ROB_ptr_i;
    // CodAL signal/wire
    logic s_flush_i;
    // CodAL signal/wire
    logic s_clk_en_i;
    // CodAL signal/wire
    logic [7:0] s_properties_i;
    // CodAL signal/wire
    logic [31:0] s_result_o;
    // CodAL signal/wire
    logic [4:0] s_flags_o;
    // CodAL signal/wire
    logic [4:0] s_ROB_ptr_o;
    // CodAL signal/wire
    logic s_done_o;
    // CodAL signal/wire
    logic [57:0] s_mul_partial_result;
    // CodAL signal/wire
    logic s_fmul_ce;

    // additional declarations:
    logic compute_mul_r_mul_fin_WE_wire;
    logic compute_mul_r_mul_fin_D_wire;
    logic r_mul_fin_Q_wire;
    logic compute_mul_r_postnorm1_fin_WE_wire;
    logic compute_mul_r_postnorm1_fin_D_wire;
    logic r_postnorm1_fin_Q_wire;
    logic compute_mul_r_postnorm2_fin_WE_wire;
    logic compute_mul_r_postnorm2_fin_D_wire;
    logic r_postnorm2_fin_Q_wire;
    logic compute_mul_r_rounding_fin_WE_wire;
    logic compute_mul_r_rounding_fin_D_wire;
    logic r_rounding_fin_Q_wire;

    // child instances inside CodAL module:
    // instance of 's_start_i' CodAL signal/wire: (single driver)
    assign s_start_i = s_start_i_D;
    // instance of 's_start_i' CodAL signal/wire: (parent port driver(s))
    assign s_start_i_Q = s_start_i;
    // instance of 's_srcA_i' CodAL signal/wire: (single driver)
    assign s_srcA_i = s_srcA_i_D;
    // instance of 's_srcB_i' CodAL signal/wire: (single driver)
    assign s_srcB_i = s_srcB_i_D;
    // instance of 's_op_i' CodAL signal/wire: (single driver)
    assign s_op_i = s_op_i_D;
    // instance of 's_rm_i' CodAL signal/wire: (single driver)
    assign s_rm_i = s_rm_i_D;
    // instance of 's_ROB_ptr_i' CodAL signal/wire: (single driver)
    assign s_ROB_ptr_i = s_ROB_ptr_i_D;
    // instance of 's_flush_i' CodAL signal/wire: (single driver)
    assign s_flush_i = s_flush_i_D;
    // instance of 's_clk_en_i' CodAL signal/wire: (single driver)
    assign s_clk_en_i = s_clk_en_i_D;
    // instance of 's_clk_en_i' CodAL signal/wire: (parent port driver(s))
    assign s_clk_en_i_Q = s_clk_en_i;
    // instance of 's_properties_i' CodAL signal/wire: (single driver)
    assign s_properties_i = s_properties_i_D;
    // instance of 's_result_o' CodAL signal/wire: (parent port driver(s))
    assign s_result_o_Q = s_result_o;
    // instance of 's_flags_o' CodAL signal/wire: (parent port driver(s))
    assign s_flags_o_Q = s_flags_o;
    // instance of 's_ROB_ptr_o' CodAL signal/wire: (parent port driver(s))
    assign s_ROB_ptr_o_Q = s_ROB_ptr_o;
    // instance of 's_done_o' CodAL signal/wire: (parent port driver(s))
    assign s_done_o_Q = s_done_o;
    // instance of 's_mul_partial_result' CodAL signal/wire: (parent port driver(s))
    assign s_mul_partial_result_Q = s_mul_partial_result;
    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_mul_fin (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_MUL_CLEAR_Q),
        .WE(compute_mul_r_mul_fin_WE_wire),
        .D(compute_mul_r_mul_fin_D_wire),
        .Q(r_mul_fin_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm1_fin (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_POSTNORM1_CLEAR_Q),
        .WE(compute_mul_r_postnorm1_fin_WE_wire),
        .D(compute_mul_r_postnorm1_fin_D_wire),
        .Q(r_postnorm1_fin_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm2_fin (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_POSTNORM2_CLEAR_Q),
        .WE(compute_mul_r_postnorm2_fin_WE_wire),
        .D(compute_mul_r_postnorm2_fin_D_wire),
        .Q(r_postnorm2_fin_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_fin (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_ROUNDING_CLEAR_Q),
        .WE(compute_mul_r_rounding_fin_WE_wire),
        .D(compute_mul_r_rounding_fin_D_wire),
        .Q(r_rounding_fin_Q_wire)
    );

    // instance of 's_fmul_ce' CodAL signal/wire: (parent port driver(s))
    assign s_fmul_ce_Q = s_fmul_ce;
    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_fpu_fmul_compute_mul_t compute_mul (
        .execute_stage_fpu_fmul_s_fmul_ce_ICLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .pipe_fmul_MUL_CLEAR_Q(pipe_fmul_MUL_CLEAR_Q),
        .pipe_fmul_POSTNORM1_CLEAR_Q(pipe_fmul_POSTNORM1_CLEAR_Q),
        .pipe_fmul_POSTNORM2_CLEAR_Q(pipe_fmul_POSTNORM2_CLEAR_Q),
        .pipe_fmul_ROUNDING_CLEAR_Q(pipe_fmul_ROUNDING_CLEAR_Q),
        .r_mul_fin_Q(r_mul_fin_Q_wire),
        .r_postnorm1_fin_Q(r_postnorm1_fin_Q_wire),
        .r_postnorm2_fin_Q(r_postnorm2_fin_Q_wire),
        .r_rounding_fin_Q(r_rounding_fin_Q_wire),
        .s_op_i_Q(s_op_i),
        .s_properties_i_Q(s_properties_i),
        .s_rm_i_Q(s_rm_i),
        .s_ROB_ptr_i_Q(s_ROB_ptr_i),
        .s_srcA_i_Q(s_srcA_i[30:0]),
        .s_srcB_i_Q(s_srcB_i[30:0]),
        .s_start_i_Q(s_start_i),
        .r_mul_fin_D(compute_mul_r_mul_fin_D_wire),
        .r_mul_fin_WE(compute_mul_r_mul_fin_WE_wire),
        .r_postnorm1_fin_D(compute_mul_r_postnorm1_fin_D_wire),
        .r_postnorm1_fin_WE(compute_mul_r_postnorm1_fin_WE_wire),
        .r_postnorm2_fin_D(compute_mul_r_postnorm2_fin_D_wire),
        .r_postnorm2_fin_WE(compute_mul_r_postnorm2_fin_WE_wire),
        .r_rounding_fin_D(compute_mul_r_rounding_fin_D_wire),
        .r_rounding_fin_WE(compute_mul_r_rounding_fin_WE_wire),
        .s_done_o_D(s_done_o),
        .s_flags_o_D(s_flags_o),
        .s_mul_partial_result_D(s_mul_partial_result),
        .s_result_o_D(s_result_o),
        .s_ROB_ptr_o_D(s_ROB_ptr_o)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_fpu_fmul_control_fmul_t control_fmul (
        .s_flush_i_Q(s_flush_i),
        .pipe_fmul_MUL_CLEAR_D(pipe_fmul_MUL_CLEAR_D),
        .pipe_fmul_POSTNORM1_CLEAR_D(pipe_fmul_POSTNORM1_CLEAR_D),
        .pipe_fmul_POSTNORM2_CLEAR_D(pipe_fmul_POSTNORM2_CLEAR_D),
        .pipe_fmul_ROUNDING_CLEAR_D(pipe_fmul_ROUNDING_CLEAR_D)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_fpu_fmul_clk_fmul_t clk_fmul (
        .r_mul_fin_Q(r_mul_fin_Q_wire),
        .r_postnorm1_fin_Q(r_postnorm1_fin_Q_wire),
        .r_postnorm2_fin_Q(r_postnorm2_fin_Q_wire),
        .r_rounding_fin_Q(r_rounding_fin_Q_wire),
        .s_clk_en_i_Q(s_clk_en_i),
        .s_start_i_Q(s_start_i),
        .s_fmul_ce_D(s_fmul_ce)
    );

endmodule: codix_berkelium_ca_core_execute_stage_fpu_fmul_t
