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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_fused_t' CodAL module.
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

module codix_berkelium_ca_core_execute_stage_fpu_fused_t(
    input  logic execute_stage_fpu_fused_s_fused_ce_ICLK,
    input  logic RST,
    input  logic pipe_fused_ADDSUB_CLEAR_Q,
    input  logic pipe_fused_POSTNORM_ADDSUB_CLEAR_Q,
    input  logic pipe_fused_POSTNORM_MUL1_CLEAR_Q,
    input  logic pipe_fused_POSTNORM_MUL2_CLEAR_Q,
    input  logic pipe_fused_PRENORM_ADDSUB_CLEAR_Q,
    input  logic pipe_fused_ROUNDING_CLEAR_Q,
    input  logic pipe_fused_WAIT_MUL_CLEAR_Q,
    input  logic s_clk_en_i_D,
    input  logic s_flush_i_D,
    input  logic [57:0] s_mul_partial_result_i_D,
    input  logic [5:0] s_op_i_D,
    input  logic [8:0] s_properties_i_D,
    input  logic [2:0] s_rm_i_D,
    input  logic [4:0] s_ROB_ptr_i_D,
    input  logic [31:0] s_srcA_i_D,
    input  logic [31:0] s_srcB_i_D,
    input  logic [31:0] s_srcC_i_D,
    input  logic s_start_i_D,
    output logic pipe_fused_ADDSUB_CLEAR_D,
    output logic pipe_fused_POSTNORM_ADDSUB_CLEAR_D,
    output logic pipe_fused_POSTNORM_MUL1_CLEAR_D,
    output logic pipe_fused_POSTNORM_MUL2_CLEAR_D,
    output logic pipe_fused_PRENORM_ADDSUB_CLEAR_D,
    output logic pipe_fused_ROUNDING_CLEAR_D,
    output logic pipe_fused_WAIT_MUL_CLEAR_D,
    output logic s_clk_en_i_Q,
    output logic s_done_o_Q,
    output logic [4:0] s_flags_o_Q,
    output logic s_fused_ce_Q,
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
    logic [31:0] s_srcC_i;
    // CodAL signal/wire
    logic [5:0] s_op_i;
    // CodAL signal/wire
    logic [2:0] s_rm_i;
    // CodAL signal/wire
    logic [4:0] s_ROB_ptr_i;
    // CodAL signal/wire
    logic [8:0] s_properties_i;
    // CodAL signal/wire
    logic s_flush_i;
    // CodAL signal/wire
    logic s_clk_en_i;
    // CodAL signal/wire
    logic [57:0] s_mul_partial_result_i;
    // CodAL signal/wire
    logic [31:0] s_result_o;
    // CodAL signal/wire
    logic [4:0] s_flags_o;
    // CodAL signal/wire
    logic [4:0] s_ROB_ptr_o;
    // CodAL signal/wire
    logic s_done_o;
    // CodAL signal/wire
    logic s_fused_ce;

    // additional declarations:
    logic compute_fused_r_wait_mul_fin_WE_wire;
    logic compute_fused_r_wait_mul_fin_D_wire;
    logic r_wait_mul_fin_Q_wire;
    logic compute_fused_r_postnorm_mul1_fin_WE_wire;
    logic compute_fused_r_postnorm_mul1_fin_D_wire;
    logic r_postnorm_mul1_fin_Q_wire;
    logic compute_fused_r_postnorm_mul2_fin_WE_wire;
    logic compute_fused_r_postnorm_mul2_fin_D_wire;
    logic r_postnorm_mul2_fin_Q_wire;
    logic compute_fused_r_prenorm_addsub_fin_WE_wire;
    logic compute_fused_r_prenorm_addsub_fin_D_wire;
    logic r_prenorm_addsub_fin_Q_wire;
    logic compute_fused_r_addsub_fin_WE_wire;
    logic compute_fused_r_addsub_fin_D_wire;
    logic r_addsub_fin_Q_wire;
    logic compute_fused_r_postnorm_addsub_fin_WE_wire;
    logic compute_fused_r_postnorm_addsub_fin_D_wire;
    logic r_postnorm_addsub_fin_Q_wire;
    logic compute_fused_r_rounding_fin_WE_wire;
    logic compute_fused_r_rounding_fin_D_wire;
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
    // instance of 's_srcC_i' CodAL signal/wire: (single driver)
    assign s_srcC_i = s_srcC_i_D;
    // instance of 's_op_i' CodAL signal/wire: (single driver)
    assign s_op_i = s_op_i_D;
    // instance of 's_rm_i' CodAL signal/wire: (single driver)
    assign s_rm_i = s_rm_i_D;
    // instance of 's_ROB_ptr_i' CodAL signal/wire: (single driver)
    assign s_ROB_ptr_i = s_ROB_ptr_i_D;
    // instance of 's_properties_i' CodAL signal/wire: (single driver)
    assign s_properties_i = s_properties_i_D;
    // instance of 's_flush_i' CodAL signal/wire: (single driver)
    assign s_flush_i = s_flush_i_D;
    // instance of 's_clk_en_i' CodAL signal/wire: (single driver)
    assign s_clk_en_i = s_clk_en_i_D;
    // instance of 's_clk_en_i' CodAL signal/wire: (parent port driver(s))
    assign s_clk_en_i_Q = s_clk_en_i;
    // instance of 's_mul_partial_result_i' CodAL signal/wire: (single driver)
    assign s_mul_partial_result_i = s_mul_partial_result_i_D;
    // instance of 's_result_o' CodAL signal/wire: (parent port driver(s))
    assign s_result_o_Q = s_result_o;
    // instance of 's_flags_o' CodAL signal/wire: (parent port driver(s))
    assign s_flags_o_Q = s_flags_o;
    // instance of 's_ROB_ptr_o' CodAL signal/wire: (parent port driver(s))
    assign s_ROB_ptr_o_Q = s_ROB_ptr_o;
    // instance of 's_done_o' CodAL signal/wire: (parent port driver(s))
    assign s_done_o_Q = s_done_o;
    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wait_mul_fin (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_WAIT_MUL_CLEAR_Q),
        .WE(compute_fused_r_wait_mul_fin_WE_wire),
        .D(compute_fused_r_wait_mul_fin_D_wire),
        .Q(r_wait_mul_fin_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_mul1_fin (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_MUL1_CLEAR_Q),
        .WE(compute_fused_r_postnorm_mul1_fin_WE_wire),
        .D(compute_fused_r_postnorm_mul1_fin_D_wire),
        .Q(r_postnorm_mul1_fin_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_mul2_fin (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_MUL2_CLEAR_Q),
        .WE(compute_fused_r_postnorm_mul2_fin_WE_wire),
        .D(compute_fused_r_postnorm_mul2_fin_D_wire),
        .Q(r_postnorm_mul2_fin_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_prenorm_addsub_fin (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_PRENORM_ADDSUB_CLEAR_Q),
        .WE(compute_fused_r_prenorm_addsub_fin_WE_wire),
        .D(compute_fused_r_prenorm_addsub_fin_D_wire),
        .Q(r_prenorm_addsub_fin_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_addsub_fin (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_ADDSUB_CLEAR_Q),
        .WE(compute_fused_r_addsub_fin_WE_wire),
        .D(compute_fused_r_addsub_fin_D_wire),
        .Q(r_addsub_fin_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_addsub_fin (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_ADDSUB_CLEAR_Q),
        .WE(compute_fused_r_postnorm_addsub_fin_WE_wire),
        .D(compute_fused_r_postnorm_addsub_fin_D_wire),
        .Q(r_postnorm_addsub_fin_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_fin (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_ROUNDING_CLEAR_Q),
        .WE(compute_fused_r_rounding_fin_WE_wire),
        .D(compute_fused_r_rounding_fin_D_wire),
        .Q(r_rounding_fin_Q_wire)
    );

    // instance of 's_fused_ce' CodAL signal/wire: (parent port driver(s))
    assign s_fused_ce_Q = s_fused_ce;
    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_fpu_fused_compute_fused_t compute_fused (
        .execute_stage_fpu_fused_s_fused_ce_ICLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .pipe_fused_ADDSUB_CLEAR_Q(pipe_fused_ADDSUB_CLEAR_Q),
        .pipe_fused_POSTNORM_ADDSUB_CLEAR_Q(pipe_fused_POSTNORM_ADDSUB_CLEAR_Q),
        .pipe_fused_POSTNORM_MUL1_CLEAR_Q(pipe_fused_POSTNORM_MUL1_CLEAR_Q),
        .pipe_fused_POSTNORM_MUL2_CLEAR_Q(pipe_fused_POSTNORM_MUL2_CLEAR_Q),
        .pipe_fused_PRENORM_ADDSUB_CLEAR_Q(pipe_fused_PRENORM_ADDSUB_CLEAR_Q),
        .pipe_fused_ROUNDING_CLEAR_Q(pipe_fused_ROUNDING_CLEAR_Q),
        .pipe_fused_WAIT_MUL_CLEAR_Q(pipe_fused_WAIT_MUL_CLEAR_Q),
        .r_addsub_fin_Q(r_addsub_fin_Q_wire),
        .r_postnorm_addsub_fin_Q(r_postnorm_addsub_fin_Q_wire),
        .r_postnorm_mul1_fin_Q(r_postnorm_mul1_fin_Q_wire),
        .r_postnorm_mul2_fin_Q(r_postnorm_mul2_fin_Q_wire),
        .r_prenorm_addsub_fin_Q(r_prenorm_addsub_fin_Q_wire),
        .r_rounding_fin_Q(r_rounding_fin_Q_wire),
        .r_wait_mul_fin_Q(r_wait_mul_fin_Q_wire),
        .s_mul_partial_result_i_Q(s_mul_partial_result_i),
        .s_op_i_Q(s_op_i),
        .s_properties_i_Q(s_properties_i),
        .s_rm_i_Q(s_rm_i),
        .s_ROB_ptr_i_Q(s_ROB_ptr_i),
        .s_srcA_i_Q(s_srcA_i[31]),
        .s_srcB_i_Q(s_srcB_i[31]),
        .s_srcC_i_Q(s_srcC_i),
        .s_start_i_Q(s_start_i),
        .r_addsub_fin_D(compute_fused_r_addsub_fin_D_wire),
        .r_addsub_fin_WE(compute_fused_r_addsub_fin_WE_wire),
        .r_postnorm_addsub_fin_D(compute_fused_r_postnorm_addsub_fin_D_wire),
        .r_postnorm_addsub_fin_WE(compute_fused_r_postnorm_addsub_fin_WE_wire),
        .r_postnorm_mul1_fin_D(compute_fused_r_postnorm_mul1_fin_D_wire),
        .r_postnorm_mul1_fin_WE(compute_fused_r_postnorm_mul1_fin_WE_wire),
        .r_postnorm_mul2_fin_D(compute_fused_r_postnorm_mul2_fin_D_wire),
        .r_postnorm_mul2_fin_WE(compute_fused_r_postnorm_mul2_fin_WE_wire),
        .r_prenorm_addsub_fin_D(compute_fused_r_prenorm_addsub_fin_D_wire),
        .r_prenorm_addsub_fin_WE(compute_fused_r_prenorm_addsub_fin_WE_wire),
        .r_rounding_fin_D(compute_fused_r_rounding_fin_D_wire),
        .r_rounding_fin_WE(compute_fused_r_rounding_fin_WE_wire),
        .r_wait_mul_fin_D(compute_fused_r_wait_mul_fin_D_wire),
        .r_wait_mul_fin_WE(compute_fused_r_wait_mul_fin_WE_wire),
        .s_done_o_D(s_done_o),
        .s_flags_o_D(s_flags_o),
        .s_result_o_D(s_result_o),
        .s_ROB_ptr_o_D(s_ROB_ptr_o)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_fpu_fused_control_fused_t control_fused (
        .s_flush_i_Q(s_flush_i),
        .pipe_fused_ADDSUB_CLEAR_D(pipe_fused_ADDSUB_CLEAR_D),
        .pipe_fused_POSTNORM_ADDSUB_CLEAR_D(pipe_fused_POSTNORM_ADDSUB_CLEAR_D),
        .pipe_fused_POSTNORM_MUL1_CLEAR_D(pipe_fused_POSTNORM_MUL1_CLEAR_D),
        .pipe_fused_POSTNORM_MUL2_CLEAR_D(pipe_fused_POSTNORM_MUL2_CLEAR_D),
        .pipe_fused_PRENORM_ADDSUB_CLEAR_D(pipe_fused_PRENORM_ADDSUB_CLEAR_D),
        .pipe_fused_ROUNDING_CLEAR_D(pipe_fused_ROUNDING_CLEAR_D),
        .pipe_fused_WAIT_MUL_CLEAR_D(pipe_fused_WAIT_MUL_CLEAR_D)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_fpu_fused_clk_fused_t clk_fused (
        .r_addsub_fin_Q(r_addsub_fin_Q_wire),
        .r_postnorm_addsub_fin_Q(r_postnorm_addsub_fin_Q_wire),
        .r_postnorm_mul1_fin_Q(r_postnorm_mul1_fin_Q_wire),
        .r_postnorm_mul2_fin_Q(r_postnorm_mul2_fin_Q_wire),
        .r_prenorm_addsub_fin_Q(r_prenorm_addsub_fin_Q_wire),
        .r_rounding_fin_Q(r_rounding_fin_Q_wire),
        .r_wait_mul_fin_Q(r_wait_mul_fin_Q_wire),
        .s_clk_en_i_Q(s_clk_en_i),
        .s_start_i_Q(s_start_i),
        .s_fused_ce_D(s_fused_ce)
    );

endmodule: codix_berkelium_ca_core_execute_stage_fpu_fused_t
