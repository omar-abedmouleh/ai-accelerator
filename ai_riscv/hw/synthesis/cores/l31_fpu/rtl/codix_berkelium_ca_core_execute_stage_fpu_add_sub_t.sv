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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_add_sub_t' CodAL module.
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

module codix_berkelium_ca_core_execute_stage_fpu_add_sub_t(
    input  logic execute_stage_fpu_add_sub_s_add_sub_ce_ICLK,
    input  logic RST,
    input  logic pipe_add_sub_COMPUTE_CLEAR_Q,
    input  logic pipe_add_sub_COMPUTE_STALL_Q,
    input  logic pipe_add_sub_POSTNORM_CLEAR_Q,
    input  logic pipe_add_sub_POSTNORM_STALL_Q,
    input  logic pipe_add_sub_ROUNDING_CLEAR_Q,
    input  logic pipe_add_sub_ROUNDING_STALL_Q,
    input  logic s_ack_i_D,
    input  logic s_clk_en_i_D,
    input  logic s_flush_i_D,
    input  logic [5:0] s_op_i_D,
    input  logic [8:0] s_properties_i_D,
    input  logic [2:0] s_rm_i_D,
    input  logic [4:0] s_ROB_ptr_i_D,
    input  logic [31:0] s_srcA_i_D,
    input  logic [31:0] s_srcB_i_D,
    input  logic s_start_i_D,
    output logic pipe_add_sub_COMPUTE_CLEAR_D,
    output logic pipe_add_sub_COMPUTE_STALL_D,
    output logic pipe_add_sub_POSTNORM_CLEAR_D,
    output logic pipe_add_sub_POSTNORM_STALL_D,
    output logic pipe_add_sub_ROUNDING_CLEAR_D,
    output logic pipe_add_sub_ROUNDING_STALL_D,
    output logic s_ack_i_Q,
    output logic s_add_sub_ce_Q,
    output logic s_clk_en_i_Q,
    output logic s_done_o_Q,
    output logic [4:0] s_flags_o_Q,
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
    logic [31:0] s_srcB_i;
    // CodAL signal/wire
    logic [5:0] s_op_i;
    // CodAL signal/wire
    logic [2:0] s_rm_i;
    // CodAL signal/wire
    logic [4:0] s_ROB_ptr_i;
    // CodAL signal/wire
    logic [8:0] s_properties_i;
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
    logic s_add_sub_ce;

    // additional declarations:
    logic compute_add_sub_r_compute_fin_WE_wire;
    logic compute_add_sub_r_compute_fin_D_wire;
    logic r_compute_fin_Q_wire;
    logic compute_add_sub_r_postnorm_fin_WE_wire;
    logic compute_add_sub_r_postnorm_fin_D_wire;
    logic r_postnorm_fin_Q_wire;
    logic compute_add_sub_r_rounding_fin_WE_wire;
    logic compute_add_sub_r_rounding_fin_D_wire;
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
    // instance of 's_properties_i' CodAL signal/wire: (single driver)
    assign s_properties_i = s_properties_i_D;
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
    ) r_compute_fin (
        .CLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_add_sub_COMPUTE_CLEAR_Q),
        .STALL(pipe_add_sub_COMPUTE_STALL_Q),
        .WE(compute_add_sub_r_compute_fin_WE_wire),
        .D(compute_add_sub_r_compute_fin_D_wire),
        .Q(r_compute_fin_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_fin (
        .CLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_add_sub_POSTNORM_CLEAR_Q),
        .STALL(pipe_add_sub_POSTNORM_STALL_Q),
        .WE(compute_add_sub_r_postnorm_fin_WE_wire),
        .D(compute_add_sub_r_postnorm_fin_D_wire),
        .Q(r_postnorm_fin_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_fin (
        .CLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_add_sub_ROUNDING_CLEAR_Q),
        .STALL(pipe_add_sub_ROUNDING_STALL_Q),
        .WE(compute_add_sub_r_rounding_fin_WE_wire),
        .D(compute_add_sub_r_rounding_fin_D_wire),
        .Q(r_rounding_fin_Q_wire)
    );

    // instance of 's_add_sub_ce' CodAL signal/wire: (parent port driver(s))
    assign s_add_sub_ce_Q = s_add_sub_ce;
    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_fpu_add_sub_clk_add_sub_t clk_add_sub (
        .r_compute_fin_Q(r_compute_fin_Q_wire),
        .r_postnorm_fin_Q(r_postnorm_fin_Q_wire),
        .r_rounding_fin_Q(r_rounding_fin_Q_wire),
        .s_clk_en_i_Q(s_clk_en_i),
        .s_start_i_Q(s_start_i),
        .s_add_sub_ce_D(s_add_sub_ce)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_fpu_add_sub_compute_add_sub_t compute_add_sub (
        .execute_stage_fpu_add_sub_s_add_sub_ce_ICLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .pipe_add_sub_COMPUTE_CLEAR_Q(pipe_add_sub_COMPUTE_CLEAR_Q),
        .pipe_add_sub_COMPUTE_STALL_Q(pipe_add_sub_COMPUTE_STALL_Q),
        .pipe_add_sub_POSTNORM_CLEAR_Q(pipe_add_sub_POSTNORM_CLEAR_Q),
        .pipe_add_sub_POSTNORM_STALL_Q(pipe_add_sub_POSTNORM_STALL_Q),
        .pipe_add_sub_ROUNDING_CLEAR_Q(pipe_add_sub_ROUNDING_CLEAR_Q),
        .pipe_add_sub_ROUNDING_STALL_Q(pipe_add_sub_ROUNDING_STALL_Q),
        .r_compute_fin_Q(r_compute_fin_Q_wire),
        .r_postnorm_fin_Q(r_postnorm_fin_Q_wire),
        .r_rounding_fin_Q(r_rounding_fin_Q_wire),
        .s_op_i_Q(s_op_i),
        .s_properties_i_Q(s_properties_i),
        .s_rm_i_Q(s_rm_i),
        .s_ROB_ptr_i_Q(s_ROB_ptr_i),
        .s_srcA_i_Q(s_srcA_i[30:0]),
        .s_srcB_i_Q(s_srcB_i[30:0]),
        .s_start_i_Q(s_start_i),
        .r_compute_fin_D(compute_add_sub_r_compute_fin_D_wire),
        .r_compute_fin_WE(compute_add_sub_r_compute_fin_WE_wire),
        .r_postnorm_fin_D(compute_add_sub_r_postnorm_fin_D_wire),
        .r_postnorm_fin_WE(compute_add_sub_r_postnorm_fin_WE_wire),
        .r_rounding_fin_D(compute_add_sub_r_rounding_fin_D_wire),
        .r_rounding_fin_WE(compute_add_sub_r_rounding_fin_WE_wire),
        .s_done_o_D(s_done_o),
        .s_flags_o_D(s_flags_o),
        .s_result_o_D(s_result_o),
        .s_ROB_ptr_o_D(s_ROB_ptr_o)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_fpu_add_sub_control_add_sub_t control_add_sub (
        .r_compute_fin_Q(r_compute_fin_Q_wire),
        .r_postnorm_fin_Q(r_postnorm_fin_Q_wire),
        .s_ack_i_Q(s_ack_i),
        .s_flush_i_Q(s_flush_i),
        .pipe_add_sub_COMPUTE_CLEAR_D(pipe_add_sub_COMPUTE_CLEAR_D),
        .pipe_add_sub_COMPUTE_STALL_D(pipe_add_sub_COMPUTE_STALL_D),
        .pipe_add_sub_POSTNORM_CLEAR_D(pipe_add_sub_POSTNORM_CLEAR_D),
        .pipe_add_sub_POSTNORM_STALL_D(pipe_add_sub_POSTNORM_STALL_D),
        .pipe_add_sub_ROUNDING_CLEAR_D(pipe_add_sub_ROUNDING_CLEAR_D),
        .pipe_add_sub_ROUNDING_STALL_D(pipe_add_sub_ROUNDING_STALL_D),
        .s_ready_o_D(s_ready_o)
    );

endmodule: codix_berkelium_ca_core_execute_stage_fpu_add_sub_t
