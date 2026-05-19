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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_fmul_compute_mul_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_fpu_fmul_compute_mul_t(
    input  logic execute_stage_fpu_fmul_s_fmul_ce_ICLK,
    input  logic RST,
    input  logic pipe_fmul_MUL_CLEAR_Q,
    input  logic pipe_fmul_POSTNORM1_CLEAR_Q,
    input  logic pipe_fmul_POSTNORM2_CLEAR_Q,
    input  logic pipe_fmul_ROUNDING_CLEAR_Q,
    input  logic r_mul_fin_Q,
    input  logic r_postnorm1_fin_Q,
    input  logic r_postnorm2_fin_Q,
    input  logic r_rounding_fin_Q,
    input  logic [5:0] s_op_i_Q,
    input  logic [7:0] s_properties_i_Q,
    input  logic [2:0] s_rm_i_Q,
    input  logic [4:0] s_ROB_ptr_i_Q,
    input  logic [30:0] s_srcA_i_Q,
    input  logic [30:0] s_srcB_i_Q,
    input  logic s_start_i_Q,
    output logic r_mul_fin_D,
    output logic r_mul_fin_WE,
    output logic r_postnorm1_fin_D,
    output logic r_postnorm1_fin_WE,
    output logic r_postnorm2_fin_D,
    output logic r_postnorm2_fin_WE,
    output logic r_rounding_fin_D,
    output logic r_rounding_fin_WE,
    output logic s_done_o_D,
    output logic [4:0] s_flags_o_D,
    output logic [57:0] s_mul_partial_result_D,
    output logic [31:0] s_result_o_D,
    output logic [4:0] s_ROB_ptr_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic LSB_B0B4;
    // signal/wire
    logic codasip_tmp_var_0;
    // signal/wire
    logic codasip_tmp_var_1;
    // signal/wire
    logic codasip_tmp_var_10;
    // signal/wire
    logic codasip_tmp_var_11;
    // signal/wire
    logic codasip_tmp_var_12;
    // signal/wire
    logic codasip_tmp_var_13;
    // signal/wire
    logic codasip_tmp_var_14;
    // signal/wire
    logic codasip_tmp_var_15;
    // signal/wire
    logic codasip_tmp_var_16;
    // signal/wire
    logic [46:0] codasip_tmp_var_17;
    // signal/wire
    logic [46:0] codasip_tmp_var_18;
    // signal/wire
    logic codasip_tmp_var_2;
    // signal/wire
    logic codasip_tmp_var_3;
    // signal/wire
    logic codasip_tmp_var_4;
    // signal/wire
    logic codasip_tmp_var_5;
    // signal/wire
    logic codasip_tmp_var_6;
    // signal/wire
    logic codasip_tmp_var_7;
    // signal/wire
    logic codasip_tmp_var_8;
    // signal/wire
    logic codasip_tmp_var_9;
    // signal/wire
    logic [9:0] count_r_shift_ext_B0B2;
    // signal/wire
    logic [7:0] exp_B0B3;
    // signal/wire
    logic [7:0] exp_a_B0B0;
    // signal/wire
    logic [7:0] exp_b_B0B0;
    // signal/wire
    logic [8:0] exp_ext_round_B0B4;
    // signal/wire
    logic [9:0] exp_rot1_B0B3;
    // signal/wire
    logic exp_zero_B0B4;
    // signal/wire
    logic [47:0] fract_rot_B0B3;
    // signal/wire
    logic [47:0] fract_rot_shifted_B0B3;
    // signal/wire
    logic [27:0] fract_round_B0B4;
    // signal/wire
    logic [27:0] fract_round_rot_B0B4;
    // signal/wire
    logic guard_B0B4;
    // signal/wire
    logic hidden_B0B4;
    // signal/wire
    logic hidden_a_B0B0;
    // signal/wire
    logic hidden_b_B0B0;
    // signal/wire
    logic inexact_B0B4;
    // signal/wire
    logic inf_B0B4;
    // signal/wire
    logic invalid_B0B4;
    // signal/wire
    logic lost_B0B4;
    // signal/wire
    logic [7:0] max_exp_B0B3;
    // signal/wire
    logic mul_exp_ext_msb_B0B2;
    // signal/wire
    logic mul_exp_ext_msb_B0B3;
    // signal/wire
    logic mul_exp_msb_B0B3;
    // signal/wire
    logic mul_nan_op_B0B4;
    // signal/wire
    logic [1:0] mul_res_msb_bits_B0B2;
    // signal/wire
    logic mul_sign_B0B4;
    // signal/wire
    logic nan_B0B4;
    // signal/wire
    logic not_roundup_if_unbounded_exp_B0B4;
    // signal/wire
    logic overflow_B0B4;
    // signal/wire
    logic [8:0] overflow_limit_B0B4;
    // signal/wire
    logic [31:0] res_B0B4;
    // signal/wire
    logic round_B0B4;
    // signal/wire
    logic roundup_B0B4;
    // signal/wire
    logic shift_right_round_B0B4;
    // signal/wire
    logic snan_B0B4;
    // signal/wire
    logic sticky_B0B3;
    // signal/wire
    logic sticky_B0B4;
    // signal/wire
    logic tiny_B0B4;
    // signal/wire
    logic underflow_B0B4;
    // signal/wire
    logic zero_B0B4;

    // additional declarations:
    logic r_mul_ROB_ptr_WE;
    logic [4:0] r_mul_ROB_ptr_D;
    logic [4:0] r_mul_ROB_ptr_Q;
    logic r_mul_exp_WE;
    logic [9:0] r_mul_exp_D;
    logic [9:0] r_mul_exp_Q;
    logic r_mul_fract_a_WE;
    logic [23:0] r_mul_fract_a_D;
    logic [23:0] r_mul_fract_a_Q;
    logic r_mul_fract_b_WE;
    logic [23:0] r_mul_fract_b_D;
    logic [23:0] r_mul_fract_b_Q;
    logic r_mul_op_WE;
    logic [5:0] r_mul_op_D;
    logic [5:0] r_mul_op_Q;
    logic r_mul_properties_WE;
    logic [7:0] r_mul_properties_D;
    logic [7:0] r_mul_properties_Q;
    logic r_mul_rm_WE;
    logic [2:0] r_mul_rm_D;
    logic [2:0] r_mul_rm_Q;
    logic r_postnorm1_ROB_ptr_WE;
    logic [4:0] r_postnorm1_ROB_ptr_D;
    logic [4:0] r_postnorm1_ROB_ptr_Q;
    logic r_postnorm1_exp_WE;
    logic [9:0] r_postnorm1_exp_D;
    logic [9:0] r_postnorm1_exp_Q;
    logic r_postnorm1_properties_WE;
    logic [7:0] r_postnorm1_properties_D;
    logic [7:0] r_postnorm1_properties_Q;
    logic r_postnorm1_res_WE;
    logic [47:0] r_postnorm1_res_D;
    logic [47:0] r_postnorm1_res_Q;
    logic r_postnorm1_rm_WE;
    logic [2:0] r_postnorm1_rm_D;
    logic [2:0] r_postnorm1_rm_Q;
    logic r_postnorm2_ROB_ptr_WE;
    logic [4:0] r_postnorm2_ROB_ptr_D;
    logic [4:0] r_postnorm2_ROB_ptr_Q;
    logic r_postnorm2_count_r_shift_WE;
    logic [6:0] r_postnorm2_count_r_shift_D;
    logic [6:0] r_postnorm2_count_r_shift_Q;
    logic r_postnorm2_mul_exp_WE;
    logic [9:0] r_postnorm2_mul_exp_D;
    logic [9:0] r_postnorm2_mul_exp_Q;
    logic r_postnorm2_mul_res_WE;
    logic [47:0] r_postnorm2_mul_res_D;
    logic [47:0] r_postnorm2_mul_res_Q;
    logic r_postnorm2_properties_WE;
    logic [7:0] r_postnorm2_properties_D;
    logic [7:0] r_postnorm2_properties_Q;
    logic r_postnorm2_rm_WE;
    logic [2:0] r_postnorm2_rm_D;
    logic [2:0] r_postnorm2_rm_Q;
    logic r_postnorm2_shift_left_WE;
    logic r_postnorm2_shift_left_D;
    logic r_postnorm2_shift_left_Q;
    logic r_postnorm2_shift_right_WE;
    logic r_postnorm2_shift_right_D;
    logic r_postnorm2_shift_right_Q;
    logic r_postnorm2_zeros_l_WE;
    logic [6:0] r_postnorm2_zeros_l_D;
    logic [6:0] r_postnorm2_zeros_l_Q;
    logic r_postnorm2_zeros_r_WE;
    logic [6:0] r_postnorm2_zeros_r_D;
    logic [6:0] r_postnorm2_zeros_r_Q;
    logic r_rounding_ROB_ptr_WE;
    logic [4:0] r_rounding_ROB_ptr_D;
    logic [4:0] r_rounding_ROB_ptr_Q;
    logic r_rounding_exp_1sh_WE;
    logic [7:0] r_rounding_exp_1sh_D;
    logic [7:0] r_rounding_exp_1sh_Q;
    logic r_rounding_fract_1sh_WE;
    logic [26:0] r_rounding_fract_1sh_D;
    logic [26:0] r_rounding_fract_1sh_Q;
    logic r_rounding_properties_WE;
    logic [7:0] r_rounding_properties_D;
    logic [7:0] r_rounding_properties_Q;
    logic r_rounding_rm_WE;
    logic [2:0] r_rounding_rm_D;
    logic [2:0] r_rounding_rm_Q;

    // child instances inside functional unit:
    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_mul_ROB_ptr (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_MUL_CLEAR_Q),
        .WE(r_mul_ROB_ptr_WE),
        .D(r_mul_ROB_ptr_D),
        .Q(r_mul_ROB_ptr_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd10),
        .DEFAULT_VALUE(10'h000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_mul_exp (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_MUL_CLEAR_Q),
        .WE(r_mul_exp_WE),
        .D(r_mul_exp_D),
        .Q(r_mul_exp_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd24),
        .DEFAULT_VALUE(24'h000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_mul_fract_a (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_MUL_CLEAR_Q),
        .WE(r_mul_fract_a_WE),
        .D(r_mul_fract_a_D),
        .Q(r_mul_fract_a_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd24),
        .DEFAULT_VALUE(24'h000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_mul_fract_b (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_MUL_CLEAR_Q),
        .WE(r_mul_fract_b_WE),
        .D(r_mul_fract_b_D),
        .Q(r_mul_fract_b_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_mul_op (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_MUL_CLEAR_Q),
        .WE(r_mul_op_WE),
        .D(r_mul_op_D),
        .Q(r_mul_op_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd8),
        .DEFAULT_VALUE(8'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_mul_properties (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_MUL_CLEAR_Q),
        .WE(r_mul_properties_WE),
        .D(r_mul_properties_D),
        .Q(r_mul_properties_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_mul_rm (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_MUL_CLEAR_Q),
        .WE(r_mul_rm_WE),
        .D(r_mul_rm_D),
        .Q(r_mul_rm_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm1_ROB_ptr (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_POSTNORM1_CLEAR_Q),
        .WE(r_postnorm1_ROB_ptr_WE),
        .D(r_postnorm1_ROB_ptr_D),
        .Q(r_postnorm1_ROB_ptr_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd10),
        .DEFAULT_VALUE(10'h000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm1_exp (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_POSTNORM1_CLEAR_Q),
        .WE(r_postnorm1_exp_WE),
        .D(r_postnorm1_exp_D),
        .Q(r_postnorm1_exp_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd8),
        .DEFAULT_VALUE(8'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm1_properties (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_POSTNORM1_CLEAR_Q),
        .WE(r_postnorm1_properties_WE),
        .D(r_postnorm1_properties_D),
        .Q(r_postnorm1_properties_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd48),
        .DEFAULT_VALUE(48'h000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm1_res (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_POSTNORM1_CLEAR_Q),
        .WE(r_postnorm1_res_WE),
        .D(r_postnorm1_res_D),
        .Q(r_postnorm1_res_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm1_rm (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_POSTNORM1_CLEAR_Q),
        .WE(r_postnorm1_rm_WE),
        .D(r_postnorm1_rm_D),
        .Q(r_postnorm1_rm_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm2_ROB_ptr (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_POSTNORM2_CLEAR_Q),
        .WE(r_postnorm2_ROB_ptr_WE),
        .D(r_postnorm2_ROB_ptr_D),
        .Q(r_postnorm2_ROB_ptr_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd7),
        .DEFAULT_VALUE(7'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm2_count_r_shift (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_POSTNORM2_CLEAR_Q),
        .WE(r_postnorm2_count_r_shift_WE),
        .D(r_postnorm2_count_r_shift_D),
        .Q(r_postnorm2_count_r_shift_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd10),
        .DEFAULT_VALUE(10'h000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm2_mul_exp (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_POSTNORM2_CLEAR_Q),
        .WE(r_postnorm2_mul_exp_WE),
        .D(r_postnorm2_mul_exp_D),
        .Q(r_postnorm2_mul_exp_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd48),
        .DEFAULT_VALUE(48'h000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm2_mul_res (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_POSTNORM2_CLEAR_Q),
        .WE(r_postnorm2_mul_res_WE),
        .D(r_postnorm2_mul_res_D),
        .Q(r_postnorm2_mul_res_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd8),
        .DEFAULT_VALUE(8'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm2_properties (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_POSTNORM2_CLEAR_Q),
        .WE(r_postnorm2_properties_WE),
        .D(r_postnorm2_properties_D),
        .Q(r_postnorm2_properties_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm2_rm (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_POSTNORM2_CLEAR_Q),
        .WE(r_postnorm2_rm_WE),
        .D(r_postnorm2_rm_D),
        .Q(r_postnorm2_rm_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm2_shift_left (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_POSTNORM2_CLEAR_Q),
        .WE(r_postnorm2_shift_left_WE),
        .D(r_postnorm2_shift_left_D),
        .Q(r_postnorm2_shift_left_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm2_shift_right (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_POSTNORM2_CLEAR_Q),
        .WE(r_postnorm2_shift_right_WE),
        .D(r_postnorm2_shift_right_D),
        .Q(r_postnorm2_shift_right_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd7),
        .DEFAULT_VALUE(7'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm2_zeros_l (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_POSTNORM2_CLEAR_Q),
        .WE(r_postnorm2_zeros_l_WE),
        .D(r_postnorm2_zeros_l_D),
        .Q(r_postnorm2_zeros_l_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd7),
        .DEFAULT_VALUE(7'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm2_zeros_r (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_POSTNORM2_CLEAR_Q),
        .WE(r_postnorm2_zeros_r_WE),
        .D(r_postnorm2_zeros_r_D),
        .Q(r_postnorm2_zeros_r_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_ROB_ptr (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_ROUNDING_CLEAR_Q),
        .WE(r_rounding_ROB_ptr_WE),
        .D(r_rounding_ROB_ptr_D),
        .Q(r_rounding_ROB_ptr_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd8),
        .DEFAULT_VALUE(8'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_exp_1sh (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_ROUNDING_CLEAR_Q),
        .WE(r_rounding_exp_1sh_WE),
        .D(r_rounding_exp_1sh_D),
        .Q(r_rounding_exp_1sh_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd27),
        .DEFAULT_VALUE(27'h0000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_fract_1sh (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_ROUNDING_CLEAR_Q),
        .WE(r_rounding_fract_1sh_WE),
        .D(r_rounding_fract_1sh_D),
        .Q(r_rounding_fract_1sh_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd8),
        .DEFAULT_VALUE(8'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_properties (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_ROUNDING_CLEAR_Q),
        .WE(r_rounding_properties_WE),
        .D(r_rounding_properties_D),
        .Q(r_rounding_properties_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_rm (
        .CLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fmul_ROUNDING_CLEAR_Q),
        .WE(r_rounding_rm_WE),
        .D(r_rounding_rm_D),
        .Q(r_rounding_rm_Q)
    );

    // data-path code:
    assign hidden_a_B0B0 = (!s_properties_i_Q[7]);
    assign hidden_b_B0B0 = (!s_properties_i_Q[6]);
    assign exp_a_B0B0 = ((hidden_a_B0B0) ? s_srcA_i_Q[30:23] : 8'h01);
    assign exp_b_B0B0 = ((hidden_b_B0B0) ? s_srcB_i_Q[30:23] : 8'h01);
    assign codasip_tmp_var_0 = s_start_i_Q;
    assign r_mul_fract_a_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_mul_fract_a_D = {hidden_a_B0B0, s_srcA_i_Q[22:0]};
    assign r_mul_fract_b_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_mul_fract_b_D = {hidden_b_B0B0, s_srcB_i_Q[22:0]};
    assign r_mul_exp_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_mul_exp_D = 10'((32'(unsigned'(10'((10'(exp_a_B0B0) + 10'(exp_b_B0B0))))) - 32'h0000007f));
    assign r_mul_ROB_ptr_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_mul_ROB_ptr_D = s_ROB_ptr_i_Q;
    assign r_mul_properties_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_mul_properties_D = s_properties_i_Q;
    assign r_mul_rm_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_mul_rm_D = s_rm_i_Q;
    assign r_mul_op_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_mul_op_D = s_op_i_Q;
    assign r_postnorm1_res_D = (r_mul_fract_a_Q * r_mul_fract_b_Q);
    assign r_postnorm1_exp_D = r_mul_exp_Q;
    assign r_postnorm1_ROB_ptr_D = r_mul_ROB_ptr_Q;
    assign r_postnorm1_properties_D = r_mul_properties_Q;
    assign r_postnorm1_rm_D = r_mul_rm_Q;
    assign mul_exp_ext_msb_B0B2 = r_postnorm1_exp_Q[9];
    assign mul_res_msb_bits_B0B2 = r_postnorm1_res_Q[47:46];
    assign r_postnorm2_shift_right_D = ((mul_exp_ext_msb_B0B2 || mul_res_msb_bits_B0B2[1]) || (r_postnorm1_exp_Q == 10'h000));
    assign r_postnorm2_shift_left_D = (((!mul_exp_ext_msb_B0B2) && (mul_res_msb_bits_B0B2 == 2'h0)) && (r_postnorm1_exp_Q != 10'h000));
    assign count_r_shift_ext_B0B2 = ((mul_exp_ext_msb_B0B2) ? (10'h001 - r_postnorm1_exp_Q) : 10'h001);
    assign r_postnorm2_count_r_shift_D = (((count_r_shift_ext_B0B2 < 10'h030)) ? count_r_shift_ext_B0B2[6:0] : 7'h30);
    assign codasip_tmp_var_17 = r_postnorm1_res_Q[46:0];
    assign r_postnorm2_zeros_l_D = (((codasip_tmp_var_17[46] != 1'b0)) ? 7'h00 : (((codasip_tmp_var_17[45] != 1'b0)) ? 7'h01 : (((codasip_tmp_var_17[44] != 1'b0)) ? 7'h02 : (((codasip_tmp_var_17[43] != 1'b0)) ? 7'h03 : (((codasip_tmp_var_17[42] != 1'b0)) ? 7'h04 : (((codasip_tmp_var_17[41] != 1'b0)) ? 7'h05 : (((codasip_tmp_var_17[40] != 1'b0)) ? 7'h06 : (((codasip_tmp_var_17[39] != 1'b0)) ? 7'h07 : (((codasip_tmp_var_17[38] != 1'b0)) ? 7'h08 : (((codasip_tmp_var_17[37] != 1'b0)) ? 7'h09 : (((codasip_tmp_var_17[36] != 1'b0)) ? 7'h0a : (((codasip_tmp_var_17[35] != 1'b0)) ? 7'h0b : (((codasip_tmp_var_17[34] != 1'b0)) ? 7'h0c : (((codasip_tmp_var_17[33] != 1'b0)) ? 7'h0d : (((codasip_tmp_var_17[32] != 1'b0)) ? 7'h0e : (((codasip_tmp_var_17[31] != 1'b0)) ? 7'h0f : (((codasip_tmp_var_17[30] != 1'b0)) ? 7'h10 : (((codasip_tmp_var_17[29] != 1'b0)) ? 7'h11 : (((codasip_tmp_var_17[28] != 1'b0)) ? 7'h12 : (((codasip_tmp_var_17[27] != 1'b0)) ? 7'h13 : (((codasip_tmp_var_17[26] != 1'b0)) ? 7'h14 : (((codasip_tmp_var_17[25] != 1'b0)) ? 7'h15 : (((codasip_tmp_var_17[24] != 1'b0)) ? 7'h16 : (((codasip_tmp_var_17[23] != 1'b0)) ? 7'h17 : (((codasip_tmp_var_17[22] != 1'b0)) ? 7'h18 : (((codasip_tmp_var_17[21] != 1'b0)) ? 7'h19 : (((codasip_tmp_var_17[20] != 1'b0)) ? 7'h1a : (((codasip_tmp_var_17[19] != 1'b0)) ? 7'h1b : (((codasip_tmp_var_17[18] != 1'b0)) ? 7'h1c : (((codasip_tmp_var_17[17] != 1'b0)) ? 7'h1d : (((codasip_tmp_var_17[16] != 1'b0)) ? 7'h1e : (((codasip_tmp_var_17[15] != 1'b0)) ? 7'h1f : (((codasip_tmp_var_17[14] != 1'b0)) ? 7'h20 : (((codasip_tmp_var_17[13] != 1'b0)) ? 7'h21 : (((codasip_tmp_var_17[12] != 1'b0)) ? 7'h22 : (((codasip_tmp_var_17[11] != 1'b0)) ? 7'h23 : (((codasip_tmp_var_17[10] != 1'b0)) ? 7'h24 : (((codasip_tmp_var_17[9] != 1'b0)) ? 7'h25 : (((codasip_tmp_var_17[8] != 1'b0)) ? 7'h26 : (((codasip_tmp_var_17[7] != 1'b0)) ? 7'h27 : (((codasip_tmp_var_17[6] != 1'b0)) ? 7'h28 : (((codasip_tmp_var_17[5] != 1'b0)) ? 7'h29 : (((codasip_tmp_var_17[4] != 1'b0)) ? 7'h2a : (((codasip_tmp_var_17[3] != 1'b0)) ? 7'h2b : (((codasip_tmp_var_17[2] != 1'b0)) ? 7'h2c : (((codasip_tmp_var_17[1] != 1'b0)) ? 7'h2d : (((codasip_tmp_var_17[0] != 1'b0)) ? 7'h2e : 7'h2f)))))))))))))))))))))))))))))))))))))))))))))));
    assign codasip_tmp_var_18 = r_postnorm1_res_Q[46:0];
    assign r_postnorm2_zeros_r_D = (((codasip_tmp_var_18[0] != 1'b0)) ? 7'h00 : (((codasip_tmp_var_18[1] != 1'b0)) ? 7'h01 : (((codasip_tmp_var_18[2] != 1'b0)) ? 7'h02 : (((codasip_tmp_var_18[3] != 1'b0)) ? 7'h03 : (((codasip_tmp_var_18[4] != 1'b0)) ? 7'h04 : (((codasip_tmp_var_18[5] != 1'b0)) ? 7'h05 : (((codasip_tmp_var_18[6] != 1'b0)) ? 7'h06 : (((codasip_tmp_var_18[7] != 1'b0)) ? 7'h07 : (((codasip_tmp_var_18[8] != 1'b0)) ? 7'h08 : (((codasip_tmp_var_18[9] != 1'b0)) ? 7'h09 : (((codasip_tmp_var_18[10] != 1'b0)) ? 7'h0a : (((codasip_tmp_var_18[11] != 1'b0)) ? 7'h0b : (((codasip_tmp_var_18[12] != 1'b0)) ? 7'h0c : (((codasip_tmp_var_18[13] != 1'b0)) ? 7'h0d : (((codasip_tmp_var_18[14] != 1'b0)) ? 7'h0e : (((codasip_tmp_var_18[15] != 1'b0)) ? 7'h0f : (((codasip_tmp_var_18[16] != 1'b0)) ? 7'h10 : (((codasip_tmp_var_18[17] != 1'b0)) ? 7'h11 : (((codasip_tmp_var_18[18] != 1'b0)) ? 7'h12 : (((codasip_tmp_var_18[19] != 1'b0)) ? 7'h13 : (((codasip_tmp_var_18[20] != 1'b0)) ? 7'h14 : (((codasip_tmp_var_18[21] != 1'b0)) ? 7'h15 : (((codasip_tmp_var_18[22] != 1'b0)) ? 7'h16 : (((codasip_tmp_var_18[23] != 1'b0)) ? 7'h17 : (((codasip_tmp_var_18[24] != 1'b0)) ? 7'h18 : (((codasip_tmp_var_18[25] != 1'b0)) ? 7'h19 : (((codasip_tmp_var_18[26] != 1'b0)) ? 7'h1a : (((codasip_tmp_var_18[27] != 1'b0)) ? 7'h1b : (((codasip_tmp_var_18[28] != 1'b0)) ? 7'h1c : (((codasip_tmp_var_18[29] != 1'b0)) ? 7'h1d : (((codasip_tmp_var_18[30] != 1'b0)) ? 7'h1e : (((codasip_tmp_var_18[31] != 1'b0)) ? 7'h1f : (((codasip_tmp_var_18[32] != 1'b0)) ? 7'h20 : (((codasip_tmp_var_18[33] != 1'b0)) ? 7'h21 : (((codasip_tmp_var_18[34] != 1'b0)) ? 7'h22 : (((codasip_tmp_var_18[35] != 1'b0)) ? 7'h23 : (((codasip_tmp_var_18[36] != 1'b0)) ? 7'h24 : (((codasip_tmp_var_18[37] != 1'b0)) ? 7'h25 : (((codasip_tmp_var_18[38] != 1'b0)) ? 7'h26 : (((codasip_tmp_var_18[39] != 1'b0)) ? 7'h27 : (((codasip_tmp_var_18[40] != 1'b0)) ? 7'h28 : (((codasip_tmp_var_18[41] != 1'b0)) ? 7'h29 : (((codasip_tmp_var_18[42] != 1'b0)) ? 7'h2a : (((codasip_tmp_var_18[43] != 1'b0)) ? 7'h2b : (((codasip_tmp_var_18[44] != 1'b0)) ? 7'h2c : (((codasip_tmp_var_18[45] != 1'b0)) ? 7'h2d : (((codasip_tmp_var_18[46] != 1'b0)) ? 7'h2e : 7'h2f)))))))))))))))))))))))))))))))))))))))))))))));
    assign r_postnorm2_mul_res_D = r_postnorm1_res_Q;
    assign r_postnorm2_mul_exp_D = r_postnorm1_exp_Q;
    assign r_postnorm2_ROB_ptr_D = r_postnorm1_ROB_ptr_Q;
    assign r_postnorm2_properties_D = r_postnorm1_properties_Q;
    assign r_postnorm2_rm_D = r_postnorm1_rm_Q;
    assign codasip_tmp_var_1 = r_postnorm2_shift_right_Q;
    assign codasip_tmp_var_2 = (!codasip_tmp_var_1) ? r_postnorm2_shift_left_Q : 1'b0;
    assign codasip_tmp_var_3 = codasip_tmp_var_2 ? (r_postnorm2_mul_exp_Q > 10'(r_postnorm2_zeros_l_Q)) : 1'b0;
    assign exp_rot1_B0B3 = codasip_tmp_var_1 ? (r_postnorm2_mul_exp_Q + 10'(r_postnorm2_count_r_shift_Q)) :
        codasip_tmp_var_3 ? (r_postnorm2_mul_exp_Q - 10'(r_postnorm2_zeros_l_Q)) :
        codasip_tmp_var_2 ? 10'h000 : r_postnorm2_mul_exp_Q;
    assign fract_rot_B0B3 = codasip_tmp_var_1 ? (r_postnorm2_mul_res_Q >> r_postnorm2_count_r_shift_Q) :
        codasip_tmp_var_3 ? (r_postnorm2_mul_res_Q << r_postnorm2_zeros_l_Q) :
        codasip_tmp_var_2 ? (r_postnorm2_mul_res_Q << (32'(r_postnorm2_mul_exp_Q) - 32'h00000001)) : r_postnorm2_mul_res_Q;
    assign fract_rot_shifted_B0B3 = fract_rot_B0B3;
    assign mul_exp_ext_msb_B0B3 = exp_rot1_B0B3[9];
    assign mul_exp_msb_B0B3 = exp_rot1_B0B3[8];
    assign max_exp_B0B3 = 8'hff;
    assign exp_B0B3 = ((mul_exp_ext_msb_B0B3) ? 8'h00 : ((mul_exp_msb_B0B3) ? max_exp_B0B3 : (((fract_rot_shifted_B0B3[46] == 1'b0)) ? 8'h00 : exp_rot1_B0B3[7:0])));
    assign sticky_B0B3 = (((r_postnorm2_shift_right_Q && (r_postnorm2_zeros_r_Q < r_postnorm2_count_r_shift_Q))) ? 1'b1 : (fract_rot_B0B3[20:0] != 21'h000000));
    assign r_rounding_fract_1sh_D = {fract_rot_B0B3[46:21], sticky_B0B3};
    assign r_rounding_exp_1sh_D = exp_B0B3;
    assign r_rounding_ROB_ptr_D = r_postnorm2_ROB_ptr_Q;
    assign r_rounding_properties_D = r_postnorm2_properties_Q;
    assign r_rounding_rm_D = r_postnorm2_rm_Q;
    assign mul_sign_B0B4 = r_rounding_properties_Q[0];
    assign mul_nan_op_B0B4 = r_rounding_properties_Q[1];
    assign zero_B0B4 = r_rounding_properties_Q[2];
    assign inf_B0B4 = r_rounding_properties_Q[3];
    assign nan_B0B4 = r_rounding_properties_Q[4];
    assign snan_B0B4 = r_rounding_properties_Q[5];
    assign LSB_B0B4 = r_rounding_fract_1sh_Q[3];
    assign guard_B0B4 = r_rounding_fract_1sh_Q[2];
    assign round_B0B4 = r_rounding_fract_1sh_Q[1];
    assign sticky_B0B4 = r_rounding_fract_1sh_Q[0];
    assign codasip_tmp_var_4 = (r_rounding_rm_Q == 3'h0);
    assign codasip_tmp_var_5 = (!codasip_tmp_var_4) ? r_rounding_rm_Q[1] : 1'b0;
    assign codasip_tmp_var_6 = ((!codasip_tmp_var_5) && (!codasip_tmp_var_4)) ? r_rounding_rm_Q[2] : 1'b0;
    assign roundup_B0B4 = codasip_tmp_var_4 ? (guard_B0B4 & ((round_B0B4 | sticky_B0B4) | LSB_B0B4)) :
        codasip_tmp_var_5 ? ((r_rounding_rm_Q[0] ^ mul_sign_B0B4) & ((guard_B0B4 | round_B0B4) | sticky_B0B4)) :
        codasip_tmp_var_6 ? guard_B0B4 : 1'b0;
    assign not_roundup_if_unbounded_exp_B0B4 = codasip_tmp_var_4 ? (!round_B0B4) :
        codasip_tmp_var_5 ? ((!round_B0B4) & (!sticky_B0B4)) :
        codasip_tmp_var_6 ? (!round_B0B4) : 1'b0;
    assign fract_round_B0B4 = (28'(r_rounding_fract_1sh_Q) + 28'(unsigned'(4'({roundup_B0B4, 3'h0}))));
    assign shift_right_round_B0B4 = fract_round_B0B4[27];
    assign hidden_B0B4 = fract_round_B0B4[26];
    assign exp_zero_B0B4 = (r_rounding_exp_1sh_Q == 8'h00);
    assign codasip_tmp_var_7 = shift_right_round_B0B4;
    assign codasip_tmp_var_8 = (!codasip_tmp_var_7) ? (hidden_B0B4 && exp_zero_B0B4) : 1'b0;
    assign codasip_tmp_var_9 = ((!codasip_tmp_var_8) && (!codasip_tmp_var_7)) ? ((!hidden_B0B4) && (r_rounding_exp_1sh_Q != 8'h00)) : 1'b0;
    assign exp_ext_round_B0B4 = codasip_tmp_var_7 ? (9'(r_rounding_exp_1sh_Q) + 9'h001) :
        codasip_tmp_var_8 ? 9'h001 :
        codasip_tmp_var_9 ? 9'h000 : 9'(r_rounding_exp_1sh_Q);
    assign fract_round_rot_B0B4 = codasip_tmp_var_7 ? (fract_round_B0B4 >> 32'sh00000001) : fract_round_B0B4;
    assign overflow_limit_B0B4 = 9'h0ff;
    assign overflow_B0B4 = ((((exp_ext_round_B0B4 >= overflow_limit_B0B4) & (!inf_B0B4)) & (!nan_B0B4)) & (!zero_B0B4));
    assign lost_B0B4 = (((shift_right_round_B0B4 | fract_round_rot_B0B4[2]) | fract_round_rot_B0B4[1]) | fract_round_rot_B0B4[0]);
    assign inexact_B0B4 = ((overflow_B0B4 | lost_B0B4) && (((!inf_B0B4) & (!nan_B0B4)) & (!zero_B0B4)));
    assign invalid_B0B4 = (mul_nan_op_B0B4 | snan_B0B4);
    assign tiny_B0B4 = (((!hidden_B0B4) & (!shift_right_round_B0B4)) | ((exp_zero_B0B4 & hidden_B0B4) & ((!guard_B0B4) | not_roundup_if_unbounded_exp_B0B4)));
    assign underflow_B0B4 = (tiny_B0B4 & inexact_B0B4);
    assign codasip_tmp_var_10 = (nan_B0B4 || mul_nan_op_B0B4);
    assign codasip_tmp_var_11 = (!codasip_tmp_var_10) ? inf_B0B4 : 1'b0;
    assign codasip_tmp_var_12 = ((!codasip_tmp_var_11) && (!codasip_tmp_var_10)) ? zero_B0B4 : 1'b0;
    assign codasip_tmp_var_13 = (((!codasip_tmp_var_12) && (!codasip_tmp_var_11)) && (!codasip_tmp_var_10)) ? overflow_B0B4 : 1'b0;
    assign codasip_tmp_var_14 = codasip_tmp_var_13 ? (mul_sign_B0B4 && ((r_rounding_rm_Q == 3'h3) || (r_rounding_rm_Q == 3'h1))) : 1'b0;
    assign codasip_tmp_var_15 = ((!codasip_tmp_var_14) && codasip_tmp_var_13) ? ((!mul_sign_B0B4) && ((r_rounding_rm_Q == 3'h2) || (r_rounding_rm_Q == 3'h1))) : 1'b0;
    assign codasip_tmp_var_16 = ((((!codasip_tmp_var_13) && (!codasip_tmp_var_12)) && (!codasip_tmp_var_11)) && (!codasip_tmp_var_10)) ? (fract_round_rot_B0B4 == 28'h0000000) : 1'b0;
    assign res_B0B4 = codasip_tmp_var_10 ? 32'h7fc00000 :
        codasip_tmp_var_11 ? {mul_sign_B0B4, 31'h7f800000} :
        codasip_tmp_var_12 ? {mul_sign_B0B4, 31'h00000000} :
        codasip_tmp_var_14 ? 32'hff7fffff :
        codasip_tmp_var_15 ? 32'h7f7fffff :
        codasip_tmp_var_13 ? {mul_sign_B0B4, 31'h7f800000} :
        codasip_tmp_var_16 ? {mul_sign_B0B4, 31'h00000000} : {mul_sign_B0B4, exp_ext_round_B0B4[7:0], fract_round_rot_B0B4[25:3]};
    assign r_postnorm1_ROB_ptr_WE = 1'b1;
    assign r_postnorm1_exp_WE = 1'b1;
    assign r_postnorm1_properties_WE = 1'b1;
    assign r_postnorm1_res_WE = 1'b1;
    assign r_postnorm1_rm_WE = 1'b1;
    assign r_postnorm2_ROB_ptr_WE = 1'b1;
    assign r_postnorm2_count_r_shift_WE = 1'b1;
    assign r_postnorm2_mul_exp_WE = 1'b1;
    assign r_postnorm2_mul_res_WE = 1'b1;
    assign r_postnorm2_properties_WE = 1'b1;
    assign r_postnorm2_rm_WE = 1'b1;
    assign r_postnorm2_shift_left_WE = 1'b1;
    assign r_postnorm2_shift_right_WE = 1'b1;
    assign r_postnorm2_zeros_l_WE = 1'b1;
    assign r_postnorm2_zeros_r_WE = 1'b1;
    assign r_rounding_ROB_ptr_WE = 1'b1;
    assign r_rounding_exp_1sh_WE = 1'b1;
    assign r_rounding_fract_1sh_WE = 1'b1;
    assign r_rounding_properties_WE = 1'b1;
    assign r_rounding_rm_WE = 1'b1;
    assign r_mul_fin_D = s_start_i_Q;
    assign r_mul_fin_WE = 1'b1;
    assign r_postnorm1_fin_D = (r_mul_fin_Q & (r_mul_op_Q == 6'h02));
    assign r_postnorm1_fin_WE = 1'b1;
    assign r_postnorm2_fin_D = r_postnorm1_fin_Q;
    assign r_postnorm2_fin_WE = 1'b1;
    assign r_rounding_fin_D = r_postnorm2_fin_Q;
    assign r_rounding_fin_WE = 1'b1;
    assign s_done_o_D = r_rounding_fin_Q;
    assign s_flags_o_D = {invalid_B0B4, 1'b0, overflow_B0B4, underflow_B0B4, inexact_B0B4};
    assign s_mul_partial_result_D = {r_postnorm1_exp_Q, r_postnorm1_res_Q};
    assign s_result_o_D = res_B0B4;
    assign s_ROB_ptr_o_D = r_rounding_ROB_ptr_Q;
endmodule: codix_berkelium_ca_core_execute_stage_fpu_fmul_compute_mul_t
