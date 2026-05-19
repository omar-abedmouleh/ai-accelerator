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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_fused_compute_fused_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_fpu_fused_compute_fused_t(
    input  logic execute_stage_fpu_fused_s_fused_ce_ICLK,
    input  logic RST,
    input  logic pipe_fused_ADDSUB_CLEAR_Q,
    input  logic pipe_fused_POSTNORM_ADDSUB_CLEAR_Q,
    input  logic pipe_fused_POSTNORM_MUL1_CLEAR_Q,
    input  logic pipe_fused_POSTNORM_MUL2_CLEAR_Q,
    input  logic pipe_fused_PRENORM_ADDSUB_CLEAR_Q,
    input  logic pipe_fused_ROUNDING_CLEAR_Q,
    input  logic pipe_fused_WAIT_MUL_CLEAR_Q,
    input  logic r_addsub_fin_Q,
    input  logic r_postnorm_addsub_fin_Q,
    input  logic r_postnorm_mul1_fin_Q,
    input  logic r_postnorm_mul2_fin_Q,
    input  logic r_prenorm_addsub_fin_Q,
    input  logic r_rounding_fin_Q,
    input  logic r_wait_mul_fin_Q,
    input  logic [57:0] s_mul_partial_result_i_Q,
    input  logic [5:0] s_op_i_Q,
    input  logic [8:0] s_properties_i_Q,
    input  logic [2:0] s_rm_i_Q,
    input  logic [4:0] s_ROB_ptr_i_Q,
    input  logic s_srcA_i_Q,
    input  logic s_srcB_i_Q,
    input  logic [31:0] s_srcC_i_Q,
    input  logic s_start_i_Q,
    output logic r_addsub_fin_D,
    output logic r_addsub_fin_WE,
    output logic r_postnorm_addsub_fin_D,
    output logic r_postnorm_addsub_fin_WE,
    output logic r_postnorm_mul1_fin_D,
    output logic r_postnorm_mul1_fin_WE,
    output logic r_postnorm_mul2_fin_D,
    output logic r_postnorm_mul2_fin_WE,
    output logic r_prenorm_addsub_fin_D,
    output logic r_prenorm_addsub_fin_WE,
    output logic r_rounding_fin_D,
    output logic r_rounding_fin_WE,
    output logic r_wait_mul_fin_D,
    output logic r_wait_mul_fin_WE,
    output logic s_done_o_D,
    output logic [4:0] s_flags_o_D,
    output logic [31:0] s_result_o_D,
    output logic [4:0] s_ROB_ptr_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic LSB_B0B6;
    // signal/wire
    logic a_eq_b_B0B4;
    // signal/wire
    logic a_low_b_B0B4;
    // signal/wire
    logic adding_B0B4;
    // signal/wire
    logic carry_B0B5;
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
    logic codasip_tmp_var_17;
    // signal/wire
    logic codasip_tmp_var_18;
    // signal/wire
    logic codasip_tmp_var_19;
    // signal/wire
    logic codasip_tmp_var_2;
    // signal/wire
    logic codasip_tmp_var_20;
    // signal/wire
    logic codasip_tmp_var_21;
    // signal/wire
    logic [46:0] codasip_tmp_var_22;
    // signal/wire
    logic [46:0] codasip_tmp_var_23;
    // signal/wire
    logic [46:0] codasip_tmp_var_24;
    // signal/wire
    logic [49:0] codasip_tmp_var_25;
    // signal/wire
    logic [49:0] codasip_tmp_var_26;
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
    logic [7:0] count_r_shift_ext_B0B1;
    // signal/wire
    logic denom_a_B0B3;
    // signal/wire
    logic denom_b_B0B3;
    // signal/wire
    logic [8:0] exp_B0B2;
    // signal/wire
    logic [7:0] exp_B0B5;
    // signal/wire
    logic [8:0] exp_a_B0B3;
    // signal/wire
    logic exp_a_low_b_B0B3;
    // signal/wire
    logic [8:0] exp_b_B0B3;
    // signal/wire
    logic [8:0] exp_bigger_B0B3;
    // signal/wire
    logic [8:0] exp_diff_B0B3;
    // signal/wire
    logic [8:0] exp_ext_round_B0B6;
    // signal/wire
    logic [8:0] exp_lower_B0B3;
    // signal/wire
    logic [9:0] exp_rot1_B0B2;
    // signal/wire
    logic [8:0] exp_rot_B0B5;
    // signal/wire
    logic exp_zero_B0B6;
    // signal/wire
    logic [49:0] fract_a_ext_B0B3;
    // signal/wire
    logic [49:0] fract_b_ext_B0B3;
    // signal/wire
    logic [50:0] fract_bigger_B0B4;
    // signal/wire
    logic [50:0] fract_lower_B0B4;
    // signal/wire
    logic [49:0] fract_lower_ext_B0B3;
    // signal/wire
    logic [49:0] fract_rot_B0B2;
    // signal/wire
    logic [49:0] fract_rot_B0B5;
    // signal/wire
    logic [49:0] fract_rot_shifted_B0B2;
    // signal/wire
    logic [49:0] fract_rot_shifted_B0B5;
    // signal/wire
    logic [27:0] fract_round_B0B6;
    // signal/wire
    logic [27:0] fract_round_rot_B0B6;
    // signal/wire
    logic [49:0] fract_shift_ext_B0B3;
    // signal/wire
    logic fused_inf_B0B6;
    // signal/wire
    logic fused_nan_B0B6;
    // signal/wire
    logic fused_nan_op_B0B6;
    // signal/wire
    logic guard_B0B6;
    // signal/wire
    logic hidden_B0B5;
    // signal/wire
    logic hidden_B0B6;
    // signal/wire
    logic hidden_before_rounding_B0B6;
    // signal/wire
    logic inexact_B0B6;
    // signal/wire
    logic inf_B0B6;
    // signal/wire
    logic inf_C_B0B6;
    // signal/wire
    logic invalid_B0B6;
    // signal/wire
    logic lost_B0B6;
    // signal/wire
    logic [7:0] max_exp_B0B5;
    // signal/wire
    logic [9:0] mul_exp_B0B1;
    // signal/wire
    logic mul_exp_ext_msb_B0B1;
    // signal/wire
    logic mul_exp_ext_msb_B0B2;
    // signal/wire
    logic mul_exp_msb_B0B5;
    // signal/wire
    logic mul_nan_op_B0B6;
    // signal/wire
    logic [1:0] mul_res_msb_bits_B0B1;
    // signal/wire
    logic nan_B0B6;
    // signal/wire
    logic nan_C_B0B6;
    // signal/wire
    logic not_roundup_if_unbounded_exp_B0B6;
    // signal/wire
    logic overflow_B0B6;
    // signal/wire
    logic [8:0] overflow_limit_B0B6;
    // signal/wire
    logic postnorm_addsub_exp_is_zero_B0B5;
    // signal/wire
    logic [31:0] res_B0B6;
    // signal/wire
    logic [50:0] res_fract_B0B4;
    // signal/wire
    logic round_B0B6;
    // signal/wire
    logic roundup_B0B6;
    // signal/wire
    logic [6:0] rzeros_B0B3;
    // signal/wire
    logic [8:0] shift_B0B5B1B0B1;
    // signal/wire
    logic shift_left_B0B5;
    // signal/wire
    logic shift_right_B0B5;
    // signal/wire
    logic shift_right_round_B0B6;
    // signal/wire
    logic sign_A_B0B0;
    // signal/wire
    logic sign_B_B0B0;
    // signal/wire
    logic sign_C_B0B0;
    // signal/wire
    logic sign_mul_B0B0;
    // signal/wire
    logic sign_op3_B0B0;
    // signal/wire
    logic sign_res_B0B4;
    // signal/wire
    logic snan_B0B6;
    // signal/wire
    logic sticky_B0B2;
    // signal/wire
    logic sticky_B0B3;
    // signal/wire
    logic sticky_B0B5;
    // signal/wire
    logic sticky_B0B6;
    // signal/wire
    logic tiny_B0B6;
    // signal/wire
    logic underflow_B0B6;
    // signal/wire
    logic zero_B0B2;
    // signal/wire
    logic [6:0] zeros_B0B5;

    // additional declarations:
    logic r_addsub_ROB_ptr_WE;
    logic [4:0] r_addsub_ROB_ptr_D;
    logic [4:0] r_addsub_ROB_ptr_Q;
    logic r_addsub_exp_WE;
    logic [8:0] r_addsub_exp_D;
    logic [8:0] r_addsub_exp_Q;
    logic r_addsub_fract_a_WE;
    logic [49:0] r_addsub_fract_a_D;
    logic [49:0] r_addsub_fract_a_Q;
    logic r_addsub_fract_b_WE;
    logic [49:0] r_addsub_fract_b_D;
    logic [49:0] r_addsub_fract_b_Q;
    logic r_addsub_fract_msb_WE;
    logic r_addsub_fract_msb_D;
    logic r_addsub_fract_msb_Q;
    logic r_addsub_properties_WE;
    logic [8:0] r_addsub_properties_D;
    logic [8:0] r_addsub_properties_Q;
    logic r_addsub_rm_WE;
    logic [2:0] r_addsub_rm_D;
    logic [2:0] r_addsub_rm_Q;
    logic r_addsub_sign_mul_WE;
    logic r_addsub_sign_mul_D;
    logic r_addsub_sign_mul_Q;
    logic r_addsub_sign_op3_WE;
    logic r_addsub_sign_op3_D;
    logic r_addsub_sign_op3_Q;
    logic r_addsub_sticky_WE;
    logic r_addsub_sticky_D;
    logic r_addsub_sticky_Q;
    logic r_postnorm_addsub_ROB_ptr_WE;
    logic [4:0] r_postnorm_addsub_ROB_ptr_D;
    logic [4:0] r_postnorm_addsub_ROB_ptr_Q;
    logic r_postnorm_addsub_exp_WE;
    logic [8:0] r_postnorm_addsub_exp_D;
    logic [8:0] r_postnorm_addsub_exp_Q;
    logic r_postnorm_addsub_fract_msb_WE;
    logic r_postnorm_addsub_fract_msb_D;
    logic r_postnorm_addsub_fract_msb_Q;
    logic r_postnorm_addsub_properties_WE;
    logic [8:0] r_postnorm_addsub_properties_D;
    logic [8:0] r_postnorm_addsub_properties_Q;
    logic r_postnorm_addsub_res_fract_WE;
    logic [50:0] r_postnorm_addsub_res_fract_D;
    logic [50:0] r_postnorm_addsub_res_fract_Q;
    logic r_postnorm_addsub_rm_WE;
    logic [2:0] r_postnorm_addsub_rm_D;
    logic [2:0] r_postnorm_addsub_rm_Q;
    logic r_postnorm_addsub_sign_mul_WE;
    logic r_postnorm_addsub_sign_mul_D;
    logic r_postnorm_addsub_sign_mul_Q;
    logic r_postnorm_addsub_sign_op3_WE;
    logic r_postnorm_addsub_sign_op3_D;
    logic r_postnorm_addsub_sign_op3_Q;
    logic r_postnorm_addsub_sign_res_WE;
    logic r_postnorm_addsub_sign_res_D;
    logic r_postnorm_addsub_sign_res_Q;
    logic r_postnorm_addsub_sticky_WE;
    logic r_postnorm_addsub_sticky_D;
    logic r_postnorm_addsub_sticky_Q;
    logic r_postnorm_mul1_ROB_ptr_WE;
    logic [4:0] r_postnorm_mul1_ROB_ptr_D;
    logic [4:0] r_postnorm_mul1_ROB_ptr_Q;
    logic r_postnorm_mul1_properties_WE;
    logic [8:0] r_postnorm_mul1_properties_D;
    logic [8:0] r_postnorm_mul1_properties_Q;
    logic r_postnorm_mul1_rm_WE;
    logic [2:0] r_postnorm_mul1_rm_D;
    logic [2:0] r_postnorm_mul1_rm_Q;
    logic r_postnorm_mul1_sign_mul_WE;
    logic r_postnorm_mul1_sign_mul_D;
    logic r_postnorm_mul1_sign_mul_Q;
    logic r_postnorm_mul1_sign_op3_WE;
    logic r_postnorm_mul1_sign_op3_D;
    logic r_postnorm_mul1_sign_op3_Q;
    logic r_postnorm_mul1_src_C_WE;
    logic [30:0] r_postnorm_mul1_src_C_D;
    logic [30:0] r_postnorm_mul1_src_C_Q;
    logic r_postnorm_mul2_ROB_ptr_WE;
    logic [4:0] r_postnorm_mul2_ROB_ptr_D;
    logic [4:0] r_postnorm_mul2_ROB_ptr_Q;
    logic r_postnorm_mul2_count_r_shift_WE;
    logic [6:0] r_postnorm_mul2_count_r_shift_D;
    logic [6:0] r_postnorm_mul2_count_r_shift_Q;
    logic r_postnorm_mul2_mul_exp_WE;
    logic [9:0] r_postnorm_mul2_mul_exp_D;
    logic [9:0] r_postnorm_mul2_mul_exp_Q;
    logic r_postnorm_mul2_mul_res_WE;
    logic [49:0] r_postnorm_mul2_mul_res_D;
    logic [49:0] r_postnorm_mul2_mul_res_Q;
    logic r_postnorm_mul2_properties_WE;
    logic [8:0] r_postnorm_mul2_properties_D;
    logic [8:0] r_postnorm_mul2_properties_Q;
    logic r_postnorm_mul2_rm_WE;
    logic [2:0] r_postnorm_mul2_rm_D;
    logic [2:0] r_postnorm_mul2_rm_Q;
    logic r_postnorm_mul2_shift_left_WE;
    logic r_postnorm_mul2_shift_left_D;
    logic r_postnorm_mul2_shift_left_Q;
    logic r_postnorm_mul2_shift_right_WE;
    logic r_postnorm_mul2_shift_right_D;
    logic r_postnorm_mul2_shift_right_Q;
    logic r_postnorm_mul2_sign_mul_WE;
    logic r_postnorm_mul2_sign_mul_D;
    logic r_postnorm_mul2_sign_mul_Q;
    logic r_postnorm_mul2_sign_op3_WE;
    logic r_postnorm_mul2_sign_op3_D;
    logic r_postnorm_mul2_sign_op3_Q;
    logic r_postnorm_mul2_src_C_WE;
    logic [30:0] r_postnorm_mul2_src_C_D;
    logic [30:0] r_postnorm_mul2_src_C_Q;
    logic r_postnorm_mul2_zeros_l_WE;
    logic [6:0] r_postnorm_mul2_zeros_l_D;
    logic [6:0] r_postnorm_mul2_zeros_l_Q;
    logic r_postnorm_mul2_zeros_r_WE;
    logic [6:0] r_postnorm_mul2_zeros_r_D;
    logic [6:0] r_postnorm_mul2_zeros_r_Q;
    logic r_prenorm_addsub_ROB_ptr_WE;
    logic [4:0] r_prenorm_addsub_ROB_ptr_D;
    logic [4:0] r_prenorm_addsub_ROB_ptr_Q;
    logic r_prenorm_addsub_exp_WE;
    logic [8:0] r_prenorm_addsub_exp_D;
    logic [8:0] r_prenorm_addsub_exp_Q;
    logic r_prenorm_addsub_fract_WE;
    logic [48:0] r_prenorm_addsub_fract_D;
    logic [48:0] r_prenorm_addsub_fract_Q;
    logic r_prenorm_addsub_properties_WE;
    logic [8:0] r_prenorm_addsub_properties_D;
    logic [8:0] r_prenorm_addsub_properties_Q;
    logic r_prenorm_addsub_rm_WE;
    logic [2:0] r_prenorm_addsub_rm_D;
    logic [2:0] r_prenorm_addsub_rm_Q;
    logic r_prenorm_addsub_sign_mul_WE;
    logic r_prenorm_addsub_sign_mul_D;
    logic r_prenorm_addsub_sign_mul_Q;
    logic r_prenorm_addsub_sign_op3_WE;
    logic r_prenorm_addsub_sign_op3_D;
    logic r_prenorm_addsub_sign_op3_Q;
    logic r_prenorm_addsub_src_C_WE;
    logic [30:0] r_prenorm_addsub_src_C_D;
    logic [30:0] r_prenorm_addsub_src_C_Q;
    logic r_rounding_ROB_ptr_WE;
    logic [4:0] r_rounding_ROB_ptr_D;
    logic [4:0] r_rounding_ROB_ptr_Q;
    logic r_rounding_exp_1sh_WE;
    logic [7:0] r_rounding_exp_1sh_D;
    logic [7:0] r_rounding_exp_1sh_Q;
    logic r_rounding_fract_1sh_WE;
    logic [26:0] r_rounding_fract_1sh_D;
    logic [26:0] r_rounding_fract_1sh_Q;
    logic r_rounding_fract_msb_WE;
    logic r_rounding_fract_msb_D;
    logic r_rounding_fract_msb_Q;
    logic r_rounding_properties_WE;
    logic [8:0] r_rounding_properties_D;
    logic [8:0] r_rounding_properties_Q;
    logic r_rounding_rm_WE;
    logic [2:0] r_rounding_rm_D;
    logic [2:0] r_rounding_rm_Q;
    logic r_rounding_sign_mul_WE;
    logic r_rounding_sign_mul_D;
    logic r_rounding_sign_mul_Q;
    logic r_rounding_sign_op3_WE;
    logic r_rounding_sign_op3_D;
    logic r_rounding_sign_op3_Q;
    logic r_rounding_sign_res_WE;
    logic r_rounding_sign_res_D;
    logic r_rounding_sign_res_Q;
    logic r_wait_mul_ROB_ptr_WE;
    logic [4:0] r_wait_mul_ROB_ptr_D;
    logic [4:0] r_wait_mul_ROB_ptr_Q;
    logic r_wait_mul_properties_WE;
    logic [8:0] r_wait_mul_properties_D;
    logic [8:0] r_wait_mul_properties_Q;
    logic r_wait_mul_rm_WE;
    logic [2:0] r_wait_mul_rm_D;
    logic [2:0] r_wait_mul_rm_Q;
    logic r_wait_mul_sign_mul_WE;
    logic r_wait_mul_sign_mul_D;
    logic r_wait_mul_sign_mul_Q;
    logic r_wait_mul_sign_op3_WE;
    logic r_wait_mul_sign_op3_D;
    logic r_wait_mul_sign_op3_Q;
    logic r_wait_mul_src_C_WE;
    logic [30:0] r_wait_mul_src_C_D;
    logic [30:0] r_wait_mul_src_C_Q;

    // child instances inside functional unit:
    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_addsub_ROB_ptr (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_ADDSUB_CLEAR_Q),
        .WE(r_addsub_ROB_ptr_WE),
        .D(r_addsub_ROB_ptr_D),
        .Q(r_addsub_ROB_ptr_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd9),
        .DEFAULT_VALUE(9'h000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_addsub_exp (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_ADDSUB_CLEAR_Q),
        .WE(r_addsub_exp_WE),
        .D(r_addsub_exp_D),
        .Q(r_addsub_exp_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd50),
        .DEFAULT_VALUE(50'h0000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_addsub_fract_a (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_ADDSUB_CLEAR_Q),
        .WE(r_addsub_fract_a_WE),
        .D(r_addsub_fract_a_D),
        .Q(r_addsub_fract_a_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd50),
        .DEFAULT_VALUE(50'h0000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_addsub_fract_b (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_ADDSUB_CLEAR_Q),
        .WE(r_addsub_fract_b_WE),
        .D(r_addsub_fract_b_D),
        .Q(r_addsub_fract_b_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_addsub_fract_msb (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_ADDSUB_CLEAR_Q),
        .WE(r_addsub_fract_msb_WE),
        .D(r_addsub_fract_msb_D),
        .Q(r_addsub_fract_msb_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd9),
        .DEFAULT_VALUE(9'h000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_addsub_properties (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_ADDSUB_CLEAR_Q),
        .WE(r_addsub_properties_WE),
        .D(r_addsub_properties_D),
        .Q(r_addsub_properties_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_addsub_rm (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_ADDSUB_CLEAR_Q),
        .WE(r_addsub_rm_WE),
        .D(r_addsub_rm_D),
        .Q(r_addsub_rm_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_addsub_sign_mul (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_ADDSUB_CLEAR_Q),
        .WE(r_addsub_sign_mul_WE),
        .D(r_addsub_sign_mul_D),
        .Q(r_addsub_sign_mul_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_addsub_sign_op3 (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_ADDSUB_CLEAR_Q),
        .WE(r_addsub_sign_op3_WE),
        .D(r_addsub_sign_op3_D),
        .Q(r_addsub_sign_op3_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_addsub_sticky (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_ADDSUB_CLEAR_Q),
        .WE(r_addsub_sticky_WE),
        .D(r_addsub_sticky_D),
        .Q(r_addsub_sticky_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_addsub_ROB_ptr (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_ADDSUB_CLEAR_Q),
        .WE(r_postnorm_addsub_ROB_ptr_WE),
        .D(r_postnorm_addsub_ROB_ptr_D),
        .Q(r_postnorm_addsub_ROB_ptr_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd9),
        .DEFAULT_VALUE(9'h000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_addsub_exp (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_ADDSUB_CLEAR_Q),
        .WE(r_postnorm_addsub_exp_WE),
        .D(r_postnorm_addsub_exp_D),
        .Q(r_postnorm_addsub_exp_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_addsub_fract_msb (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_ADDSUB_CLEAR_Q),
        .WE(r_postnorm_addsub_fract_msb_WE),
        .D(r_postnorm_addsub_fract_msb_D),
        .Q(r_postnorm_addsub_fract_msb_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd9),
        .DEFAULT_VALUE(9'h000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_addsub_properties (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_ADDSUB_CLEAR_Q),
        .WE(r_postnorm_addsub_properties_WE),
        .D(r_postnorm_addsub_properties_D),
        .Q(r_postnorm_addsub_properties_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd51),
        .DEFAULT_VALUE(51'h0000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_addsub_res_fract (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_ADDSUB_CLEAR_Q),
        .WE(r_postnorm_addsub_res_fract_WE),
        .D(r_postnorm_addsub_res_fract_D),
        .Q(r_postnorm_addsub_res_fract_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_addsub_rm (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_ADDSUB_CLEAR_Q),
        .WE(r_postnorm_addsub_rm_WE),
        .D(r_postnorm_addsub_rm_D),
        .Q(r_postnorm_addsub_rm_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_addsub_sign_mul (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_ADDSUB_CLEAR_Q),
        .WE(r_postnorm_addsub_sign_mul_WE),
        .D(r_postnorm_addsub_sign_mul_D),
        .Q(r_postnorm_addsub_sign_mul_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_addsub_sign_op3 (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_ADDSUB_CLEAR_Q),
        .WE(r_postnorm_addsub_sign_op3_WE),
        .D(r_postnorm_addsub_sign_op3_D),
        .Q(r_postnorm_addsub_sign_op3_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_addsub_sign_res (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_ADDSUB_CLEAR_Q),
        .WE(r_postnorm_addsub_sign_res_WE),
        .D(r_postnorm_addsub_sign_res_D),
        .Q(r_postnorm_addsub_sign_res_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_addsub_sticky (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_ADDSUB_CLEAR_Q),
        .WE(r_postnorm_addsub_sticky_WE),
        .D(r_postnorm_addsub_sticky_D),
        .Q(r_postnorm_addsub_sticky_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_mul1_ROB_ptr (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_MUL1_CLEAR_Q),
        .WE(r_postnorm_mul1_ROB_ptr_WE),
        .D(r_postnorm_mul1_ROB_ptr_D),
        .Q(r_postnorm_mul1_ROB_ptr_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd9),
        .DEFAULT_VALUE(9'h000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_mul1_properties (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_MUL1_CLEAR_Q),
        .WE(r_postnorm_mul1_properties_WE),
        .D(r_postnorm_mul1_properties_D),
        .Q(r_postnorm_mul1_properties_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_mul1_rm (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_MUL1_CLEAR_Q),
        .WE(r_postnorm_mul1_rm_WE),
        .D(r_postnorm_mul1_rm_D),
        .Q(r_postnorm_mul1_rm_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_mul1_sign_mul (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_MUL1_CLEAR_Q),
        .WE(r_postnorm_mul1_sign_mul_WE),
        .D(r_postnorm_mul1_sign_mul_D),
        .Q(r_postnorm_mul1_sign_mul_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_mul1_sign_op3 (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_MUL1_CLEAR_Q),
        .WE(r_postnorm_mul1_sign_op3_WE),
        .D(r_postnorm_mul1_sign_op3_D),
        .Q(r_postnorm_mul1_sign_op3_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd31),
        .DEFAULT_VALUE(31'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_mul1_src_C (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_MUL1_CLEAR_Q),
        .WE(r_postnorm_mul1_src_C_WE),
        .D(r_postnorm_mul1_src_C_D),
        .Q(r_postnorm_mul1_src_C_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_mul2_ROB_ptr (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_MUL2_CLEAR_Q),
        .WE(r_postnorm_mul2_ROB_ptr_WE),
        .D(r_postnorm_mul2_ROB_ptr_D),
        .Q(r_postnorm_mul2_ROB_ptr_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd7),
        .DEFAULT_VALUE(7'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_mul2_count_r_shift (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_MUL2_CLEAR_Q),
        .WE(r_postnorm_mul2_count_r_shift_WE),
        .D(r_postnorm_mul2_count_r_shift_D),
        .Q(r_postnorm_mul2_count_r_shift_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd10),
        .DEFAULT_VALUE(10'h000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_mul2_mul_exp (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_MUL2_CLEAR_Q),
        .WE(r_postnorm_mul2_mul_exp_WE),
        .D(r_postnorm_mul2_mul_exp_D),
        .Q(r_postnorm_mul2_mul_exp_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd50),
        .DEFAULT_VALUE(50'h0000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_mul2_mul_res (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_MUL2_CLEAR_Q),
        .WE(r_postnorm_mul2_mul_res_WE),
        .D(r_postnorm_mul2_mul_res_D),
        .Q(r_postnorm_mul2_mul_res_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd9),
        .DEFAULT_VALUE(9'h000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_mul2_properties (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_MUL2_CLEAR_Q),
        .WE(r_postnorm_mul2_properties_WE),
        .D(r_postnorm_mul2_properties_D),
        .Q(r_postnorm_mul2_properties_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_mul2_rm (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_MUL2_CLEAR_Q),
        .WE(r_postnorm_mul2_rm_WE),
        .D(r_postnorm_mul2_rm_D),
        .Q(r_postnorm_mul2_rm_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_mul2_shift_left (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_MUL2_CLEAR_Q),
        .WE(r_postnorm_mul2_shift_left_WE),
        .D(r_postnorm_mul2_shift_left_D),
        .Q(r_postnorm_mul2_shift_left_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_mul2_shift_right (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_MUL2_CLEAR_Q),
        .WE(r_postnorm_mul2_shift_right_WE),
        .D(r_postnorm_mul2_shift_right_D),
        .Q(r_postnorm_mul2_shift_right_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_mul2_sign_mul (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_MUL2_CLEAR_Q),
        .WE(r_postnorm_mul2_sign_mul_WE),
        .D(r_postnorm_mul2_sign_mul_D),
        .Q(r_postnorm_mul2_sign_mul_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_mul2_sign_op3 (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_MUL2_CLEAR_Q),
        .WE(r_postnorm_mul2_sign_op3_WE),
        .D(r_postnorm_mul2_sign_op3_D),
        .Q(r_postnorm_mul2_sign_op3_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd31),
        .DEFAULT_VALUE(31'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_mul2_src_C (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_MUL2_CLEAR_Q),
        .WE(r_postnorm_mul2_src_C_WE),
        .D(r_postnorm_mul2_src_C_D),
        .Q(r_postnorm_mul2_src_C_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd7),
        .DEFAULT_VALUE(7'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_mul2_zeros_l (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_MUL2_CLEAR_Q),
        .WE(r_postnorm_mul2_zeros_l_WE),
        .D(r_postnorm_mul2_zeros_l_D),
        .Q(r_postnorm_mul2_zeros_l_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd7),
        .DEFAULT_VALUE(7'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_mul2_zeros_r (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_POSTNORM_MUL2_CLEAR_Q),
        .WE(r_postnorm_mul2_zeros_r_WE),
        .D(r_postnorm_mul2_zeros_r_D),
        .Q(r_postnorm_mul2_zeros_r_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_prenorm_addsub_ROB_ptr (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_PRENORM_ADDSUB_CLEAR_Q),
        .WE(r_prenorm_addsub_ROB_ptr_WE),
        .D(r_prenorm_addsub_ROB_ptr_D),
        .Q(r_prenorm_addsub_ROB_ptr_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd9),
        .DEFAULT_VALUE(9'h000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_prenorm_addsub_exp (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_PRENORM_ADDSUB_CLEAR_Q),
        .WE(r_prenorm_addsub_exp_WE),
        .D(r_prenorm_addsub_exp_D),
        .Q(r_prenorm_addsub_exp_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd49),
        .DEFAULT_VALUE(49'h0000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_prenorm_addsub_fract (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_PRENORM_ADDSUB_CLEAR_Q),
        .WE(r_prenorm_addsub_fract_WE),
        .D(r_prenorm_addsub_fract_D),
        .Q(r_prenorm_addsub_fract_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd9),
        .DEFAULT_VALUE(9'h000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_prenorm_addsub_properties (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_PRENORM_ADDSUB_CLEAR_Q),
        .WE(r_prenorm_addsub_properties_WE),
        .D(r_prenorm_addsub_properties_D),
        .Q(r_prenorm_addsub_properties_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_prenorm_addsub_rm (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_PRENORM_ADDSUB_CLEAR_Q),
        .WE(r_prenorm_addsub_rm_WE),
        .D(r_prenorm_addsub_rm_D),
        .Q(r_prenorm_addsub_rm_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_prenorm_addsub_sign_mul (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_PRENORM_ADDSUB_CLEAR_Q),
        .WE(r_prenorm_addsub_sign_mul_WE),
        .D(r_prenorm_addsub_sign_mul_D),
        .Q(r_prenorm_addsub_sign_mul_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_prenorm_addsub_sign_op3 (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_PRENORM_ADDSUB_CLEAR_Q),
        .WE(r_prenorm_addsub_sign_op3_WE),
        .D(r_prenorm_addsub_sign_op3_D),
        .Q(r_prenorm_addsub_sign_op3_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd31),
        .DEFAULT_VALUE(31'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_prenorm_addsub_src_C (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_PRENORM_ADDSUB_CLEAR_Q),
        .WE(r_prenorm_addsub_src_C_WE),
        .D(r_prenorm_addsub_src_C_D),
        .Q(r_prenorm_addsub_src_C_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_ROB_ptr (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_ROUNDING_CLEAR_Q),
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
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_ROUNDING_CLEAR_Q),
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
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_ROUNDING_CLEAR_Q),
        .WE(r_rounding_fract_1sh_WE),
        .D(r_rounding_fract_1sh_D),
        .Q(r_rounding_fract_1sh_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_fract_msb (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_ROUNDING_CLEAR_Q),
        .WE(r_rounding_fract_msb_WE),
        .D(r_rounding_fract_msb_D),
        .Q(r_rounding_fract_msb_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd9),
        .DEFAULT_VALUE(9'h000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_properties (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_ROUNDING_CLEAR_Q),
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
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_ROUNDING_CLEAR_Q),
        .WE(r_rounding_rm_WE),
        .D(r_rounding_rm_D),
        .Q(r_rounding_rm_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_sign_mul (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_ROUNDING_CLEAR_Q),
        .WE(r_rounding_sign_mul_WE),
        .D(r_rounding_sign_mul_D),
        .Q(r_rounding_sign_mul_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_sign_op3 (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_ROUNDING_CLEAR_Q),
        .WE(r_rounding_sign_op3_WE),
        .D(r_rounding_sign_op3_D),
        .Q(r_rounding_sign_op3_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_sign_res (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_ROUNDING_CLEAR_Q),
        .WE(r_rounding_sign_res_WE),
        .D(r_rounding_sign_res_D),
        .Q(r_rounding_sign_res_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wait_mul_ROB_ptr (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_WAIT_MUL_CLEAR_Q),
        .WE(r_wait_mul_ROB_ptr_WE),
        .D(r_wait_mul_ROB_ptr_D),
        .Q(r_wait_mul_ROB_ptr_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd9),
        .DEFAULT_VALUE(9'h000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wait_mul_properties (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_WAIT_MUL_CLEAR_Q),
        .WE(r_wait_mul_properties_WE),
        .D(r_wait_mul_properties_D),
        .Q(r_wait_mul_properties_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wait_mul_rm (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_WAIT_MUL_CLEAR_Q),
        .WE(r_wait_mul_rm_WE),
        .D(r_wait_mul_rm_D),
        .Q(r_wait_mul_rm_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wait_mul_sign_mul (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_WAIT_MUL_CLEAR_Q),
        .WE(r_wait_mul_sign_mul_WE),
        .D(r_wait_mul_sign_mul_D),
        .Q(r_wait_mul_sign_mul_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wait_mul_sign_op3 (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_WAIT_MUL_CLEAR_Q),
        .WE(r_wait_mul_sign_op3_WE),
        .D(r_wait_mul_sign_op3_D),
        .Q(r_wait_mul_sign_op3_Q)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd31),
        .DEFAULT_VALUE(31'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wait_mul_src_C (
        .CLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_fused_WAIT_MUL_CLEAR_Q),
        .WE(r_wait_mul_src_C_WE),
        .D(r_wait_mul_src_C_D),
        .Q(r_wait_mul_src_C_Q)
    );

    // data-path code:
    assign codasip_tmp_var_0 = s_start_i_Q;
    assign sign_A_B0B0 = codasip_tmp_var_0 ? s_srcA_i_Q : 1'b0;
    assign sign_B_B0B0 = codasip_tmp_var_0 ? s_srcB_i_Q : 1'b0;
    assign sign_C_B0B0 = codasip_tmp_var_0 ? s_srcC_i_Q[31] : 1'b0;
    assign sign_mul_B0B0 = codasip_tmp_var_0 ? ((((s_op_i_Q == 6'h09) | (s_op_i_Q == 6'h0a)) ^ sign_A_B0B0) ^ sign_B_B0B0) : 1'b0;
    assign sign_op3_B0B0 = codasip_tmp_var_0 ? (((s_op_i_Q == 6'h08) | (s_op_i_Q == 6'h0a)) ^ sign_C_B0B0) : 1'b0;
    assign r_wait_mul_src_C_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_wait_mul_src_C_D = 31'(s_srcC_i_Q);
    assign r_wait_mul_sign_mul_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_wait_mul_sign_mul_D = sign_mul_B0B0;
    assign r_wait_mul_sign_op3_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_wait_mul_sign_op3_D = sign_op3_B0B0;
    assign r_wait_mul_ROB_ptr_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_wait_mul_ROB_ptr_D = s_ROB_ptr_i_Q;
    assign r_wait_mul_properties_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_wait_mul_properties_D = s_properties_i_Q;
    assign r_wait_mul_rm_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_wait_mul_rm_D = s_rm_i_Q;
    assign r_postnorm_mul1_src_C_D = r_wait_mul_src_C_Q;
    assign r_postnorm_mul1_sign_mul_D = r_wait_mul_sign_mul_Q;
    assign r_postnorm_mul1_sign_op3_D = r_wait_mul_sign_op3_Q;
    assign r_postnorm_mul1_ROB_ptr_D = r_wait_mul_ROB_ptr_Q;
    assign r_postnorm_mul1_properties_D = r_wait_mul_properties_Q;
    assign r_postnorm_mul1_rm_D = r_wait_mul_rm_Q;
    assign mul_exp_B0B1 = s_mul_partial_result_i_Q[57:48];
    assign mul_exp_ext_msb_B0B1 = s_mul_partial_result_i_Q[57];
    assign mul_res_msb_bits_B0B1 = s_mul_partial_result_i_Q[47:46];
    assign r_postnorm_mul2_shift_right_D = ((mul_exp_ext_msb_B0B1 || mul_res_msb_bits_B0B1[1]) || (mul_exp_B0B1 == 10'h000));
    assign r_postnorm_mul2_shift_left_D = (((!mul_exp_ext_msb_B0B1) && (mul_res_msb_bits_B0B1 == 2'h0)) && (mul_exp_B0B1 != 10'h000));
    assign count_r_shift_ext_B0B1 = 8'(((mul_exp_ext_msb_B0B1) ? (10'h001 - mul_exp_B0B1) : 10'h001));
    assign r_postnorm_mul2_count_r_shift_D = (((count_r_shift_ext_B0B1 < 8'h30)) ? count_r_shift_ext_B0B1[6:0] : 7'h30);
    assign r_postnorm_mul2_zeros_l_D = (((codasip_tmp_var_23[46] != 1'b0)) ? 7'h00 : (((codasip_tmp_var_23[45] != 1'b0)) ? 7'h01 : (((codasip_tmp_var_23[44] != 1'b0)) ? 7'h02 : (((codasip_tmp_var_23[43] != 1'b0)) ? 7'h03 : (((codasip_tmp_var_23[42] != 1'b0)) ? 7'h04 : (((codasip_tmp_var_23[41] != 1'b0)) ? 7'h05 : (((codasip_tmp_var_23[40] != 1'b0)) ? 7'h06 : (((codasip_tmp_var_23[39] != 1'b0)) ? 7'h07 : (((codasip_tmp_var_23[38] != 1'b0)) ? 7'h08 : (((codasip_tmp_var_23[37] != 1'b0)) ? 7'h09 : (((codasip_tmp_var_23[36] != 1'b0)) ? 7'h0a : (((codasip_tmp_var_23[35] != 1'b0)) ? 7'h0b : (((codasip_tmp_var_23[34] != 1'b0)) ? 7'h0c : (((codasip_tmp_var_23[33] != 1'b0)) ? 7'h0d : (((codasip_tmp_var_23[32] != 1'b0)) ? 7'h0e : (((codasip_tmp_var_23[31] != 1'b0)) ? 7'h0f : (((codasip_tmp_var_23[30] != 1'b0)) ? 7'h10 : (((codasip_tmp_var_23[29] != 1'b0)) ? 7'h11 : (((codasip_tmp_var_23[28] != 1'b0)) ? 7'h12 : (((codasip_tmp_var_23[27] != 1'b0)) ? 7'h13 : (((codasip_tmp_var_23[26] != 1'b0)) ? 7'h14 : (((codasip_tmp_var_23[25] != 1'b0)) ? 7'h15 : (((codasip_tmp_var_23[24] != 1'b0)) ? 7'h16 : (((codasip_tmp_var_23[23] != 1'b0)) ? 7'h17 : (((codasip_tmp_var_23[22] != 1'b0)) ? 7'h18 : (((codasip_tmp_var_23[21] != 1'b0)) ? 7'h19 : (((codasip_tmp_var_23[20] != 1'b0)) ? 7'h1a : (((codasip_tmp_var_23[19] != 1'b0)) ? 7'h1b : (((codasip_tmp_var_23[18] != 1'b0)) ? 7'h1c : (((codasip_tmp_var_23[17] != 1'b0)) ? 7'h1d : (((codasip_tmp_var_23[16] != 1'b0)) ? 7'h1e : (((codasip_tmp_var_23[15] != 1'b0)) ? 7'h1f : (((codasip_tmp_var_23[14] != 1'b0)) ? 7'h20 : (((codasip_tmp_var_23[13] != 1'b0)) ? 7'h21 : (((codasip_tmp_var_23[12] != 1'b0)) ? 7'h22 : (((codasip_tmp_var_23[11] != 1'b0)) ? 7'h23 : (((codasip_tmp_var_23[10] != 1'b0)) ? 7'h24 : (((codasip_tmp_var_23[9] != 1'b0)) ? 7'h25 : (((codasip_tmp_var_23[8] != 1'b0)) ? 7'h26 : (((codasip_tmp_var_23[7] != 1'b0)) ? 7'h27 : (((codasip_tmp_var_23[6] != 1'b0)) ? 7'h28 : (((codasip_tmp_var_23[5] != 1'b0)) ? 7'h29 : (((codasip_tmp_var_23[4] != 1'b0)) ? 7'h2a : (((codasip_tmp_var_23[3] != 1'b0)) ? 7'h2b : (((codasip_tmp_var_23[2] != 1'b0)) ? 7'h2c : (((codasip_tmp_var_23[1] != 1'b0)) ? 7'h2d : (((codasip_tmp_var_23[0] != 1'b0)) ? 7'h2e : 7'h2f)))))))))))))))))))))))))))))))))))))))))))))));
    assign codasip_tmp_var_23 = s_mul_partial_result_i_Q[46:0];
    assign r_postnorm_mul2_zeros_r_D = 7'((32'h00000002 + 32'(7'(codasip_tmp_var_22))));
    assign codasip_tmp_var_24 = s_mul_partial_result_i_Q[46:0];
    assign codasip_tmp_var_22 = (((codasip_tmp_var_24[0] != 1'b0)) ? 47'h000000000000 : (((codasip_tmp_var_24[1] != 1'b0)) ? 47'h000000000001 : (((codasip_tmp_var_24[2] != 1'b0)) ? 47'h000000000002 : (((codasip_tmp_var_24[3] != 1'b0)) ? 47'h000000000003 : (((codasip_tmp_var_24[4] != 1'b0)) ? 47'h000000000004 : (((codasip_tmp_var_24[5] != 1'b0)) ? 47'h000000000005 : (((codasip_tmp_var_24[6] != 1'b0)) ? 47'h000000000006 : (((codasip_tmp_var_24[7] != 1'b0)) ? 47'h000000000007 : (((codasip_tmp_var_24[8] != 1'b0)) ? 47'h000000000008 : (((codasip_tmp_var_24[9] != 1'b0)) ? 47'h000000000009 : (((codasip_tmp_var_24[10] != 1'b0)) ? 47'h00000000000a : (((codasip_tmp_var_24[11] != 1'b0)) ? 47'h00000000000b : (((codasip_tmp_var_24[12] != 1'b0)) ? 47'h00000000000c : (((codasip_tmp_var_24[13] != 1'b0)) ? 47'h00000000000d : (((codasip_tmp_var_24[14] != 1'b0)) ? 47'h00000000000e : (((codasip_tmp_var_24[15] != 1'b0)) ? 47'h00000000000f : (((codasip_tmp_var_24[16] != 1'b0)) ? 47'h000000000010 : (((codasip_tmp_var_24[17] != 1'b0)) ? 47'h000000000011 : (((codasip_tmp_var_24[18] != 1'b0)) ? 47'h000000000012 : (((codasip_tmp_var_24[19] != 1'b0)) ? 47'h000000000013 : (((codasip_tmp_var_24[20] != 1'b0)) ? 47'h000000000014 : (((codasip_tmp_var_24[21] != 1'b0)) ? 47'h000000000015 : (((codasip_tmp_var_24[22] != 1'b0)) ? 47'h000000000016 : (((codasip_tmp_var_24[23] != 1'b0)) ? 47'h000000000017 : (((codasip_tmp_var_24[24] != 1'b0)) ? 47'h000000000018 : (((codasip_tmp_var_24[25] != 1'b0)) ? 47'h000000000019 : (((codasip_tmp_var_24[26] != 1'b0)) ? 47'h00000000001a : (((codasip_tmp_var_24[27] != 1'b0)) ? 47'h00000000001b : (((codasip_tmp_var_24[28] != 1'b0)) ? 47'h00000000001c : (((codasip_tmp_var_24[29] != 1'b0)) ? 47'h00000000001d : (((codasip_tmp_var_24[30] != 1'b0)) ? 47'h00000000001e : (((codasip_tmp_var_24[31] != 1'b0)) ? 47'h00000000001f : (((codasip_tmp_var_24[32] != 1'b0)) ? 47'h000000000020 : (((codasip_tmp_var_24[33] != 1'b0)) ? 47'h000000000021 : (((codasip_tmp_var_24[34] != 1'b0)) ? 47'h000000000022 : (((codasip_tmp_var_24[35] != 1'b0)) ? 47'h000000000023 : (((codasip_tmp_var_24[36] != 1'b0)) ? 47'h000000000024 : (((codasip_tmp_var_24[37] != 1'b0)) ? 47'h000000000025 : (((codasip_tmp_var_24[38] != 1'b0)) ? 47'h000000000026 : (((codasip_tmp_var_24[39] != 1'b0)) ? 47'h000000000027 : (((codasip_tmp_var_24[40] != 1'b0)) ? 47'h000000000028 : (((codasip_tmp_var_24[41] != 1'b0)) ? 47'h000000000029 : (((codasip_tmp_var_24[42] != 1'b0)) ? 47'h00000000002a : (((codasip_tmp_var_24[43] != 1'b0)) ? 47'h00000000002b : (((codasip_tmp_var_24[44] != 1'b0)) ? 47'h00000000002c : (((codasip_tmp_var_24[45] != 1'b0)) ? 47'h00000000002d : (((codasip_tmp_var_24[46] != 1'b0)) ? 47'h00000000002e : 47'h00000000002f)))))))))))))))))))))))))))))))))))))))))))))));
    assign r_postnorm_mul2_mul_res_D = {s_mul_partial_result_i_Q[47:0], 2'h0};
    assign r_postnorm_mul2_mul_exp_D = mul_exp_B0B1;
    assign r_postnorm_mul2_src_C_D = r_postnorm_mul1_src_C_Q;
    assign r_postnorm_mul2_sign_mul_D = r_postnorm_mul1_sign_mul_Q;
    assign r_postnorm_mul2_sign_op3_D = r_postnorm_mul1_sign_op3_Q;
    assign r_postnorm_mul2_ROB_ptr_D = r_postnorm_mul1_ROB_ptr_Q;
    assign r_postnorm_mul2_properties_D = r_postnorm_mul1_properties_Q;
    assign r_postnorm_mul2_rm_D = r_postnorm_mul1_rm_Q;
    assign zero_B0B2 = r_postnorm_mul2_properties_Q[2];
    assign codasip_tmp_var_1 = r_postnorm_mul2_shift_right_Q;
    assign codasip_tmp_var_2 = (!codasip_tmp_var_1) ? r_postnorm_mul2_shift_left_Q : 1'b0;
    assign codasip_tmp_var_3 = codasip_tmp_var_2 ? (r_postnorm_mul2_mul_exp_Q > 10'(r_postnorm_mul2_zeros_l_Q)) : 1'b0;
    assign exp_rot1_B0B2 = codasip_tmp_var_1 ? (r_postnorm_mul2_mul_exp_Q + 10'(r_postnorm_mul2_count_r_shift_Q)) :
        codasip_tmp_var_3 ? (r_postnorm_mul2_mul_exp_Q - 10'(r_postnorm_mul2_zeros_l_Q)) :
        codasip_tmp_var_2 ? 10'h000 : r_postnorm_mul2_mul_exp_Q;
    assign fract_rot_B0B2 = codasip_tmp_var_1 ? (r_postnorm_mul2_mul_res_Q >> r_postnorm_mul2_count_r_shift_Q) :
        codasip_tmp_var_3 ? (r_postnorm_mul2_mul_res_Q << r_postnorm_mul2_zeros_l_Q) :
        codasip_tmp_var_2 ? (r_postnorm_mul2_mul_res_Q << (32'(r_postnorm_mul2_mul_exp_Q) - 32'h00000001)) : r_postnorm_mul2_mul_res_Q;
    assign fract_rot_shifted_B0B2 = fract_rot_B0B2;
    assign mul_exp_ext_msb_B0B2 = exp_rot1_B0B2[9];
    assign exp_B0B2 = ((mul_exp_ext_msb_B0B2) ? 9'h000 : (((fract_rot_shifted_B0B2[48] == 1'b0)) ? 9'h000 : exp_rot1_B0B2[8:0]));
    assign sticky_B0B2 = ((r_postnorm_mul2_shift_right_Q && (r_postnorm_mul2_zeros_r_Q < r_postnorm_mul2_count_r_shift_Q)) && (!zero_B0B2));
    assign codasip_tmp_var_4 = zero_B0B2;
    assign codasip_tmp_var_5 = (!codasip_tmp_var_4) ? (fract_rot_B0B2 == 50'h0000000000000) : 1'b0;
    assign r_prenorm_addsub_fract_D = codasip_tmp_var_4 ? 49'h0000000000000 :
        codasip_tmp_var_5 ? 49'(sticky_B0B2) : {fract_rot_B0B2[47:0], sticky_B0B2};
    assign r_prenorm_addsub_exp_D = (codasip_tmp_var_4 || codasip_tmp_var_5) ? 9'h000 : exp_B0B2;
    assign r_prenorm_addsub_src_C_D = r_postnorm_mul2_src_C_Q;
    assign r_prenorm_addsub_sign_mul_D = r_postnorm_mul2_sign_mul_Q;
    assign r_prenorm_addsub_sign_op3_D = r_postnorm_mul2_sign_op3_Q;
    assign r_prenorm_addsub_ROB_ptr_D = r_postnorm_mul2_ROB_ptr_Q;
    assign r_prenorm_addsub_properties_D = r_postnorm_mul2_properties_Q;
    assign r_prenorm_addsub_rm_D = r_postnorm_mul2_rm_Q;
    assign denom_a_B0B3 = (r_prenorm_addsub_exp_Q == 9'h000);
    assign denom_b_B0B3 = r_prenorm_addsub_properties_Q[8];
    assign exp_a_B0B3 = r_prenorm_addsub_exp_Q;
    assign fract_a_ext_B0B3 = {(!denom_a_B0B3), r_prenorm_addsub_fract_Q};
    assign exp_b_B0B3 = 9'(r_prenorm_addsub_src_C_Q[30:23]);
    assign fract_b_ext_B0B3 = {(!denom_b_B0B3), r_prenorm_addsub_src_C_Q[22:0], 26'h0000000};
    assign exp_a_low_b_B0B3 = (exp_a_B0B3 < exp_b_B0B3);
    assign fract_lower_ext_B0B3 = ((exp_a_low_b_B0B3) ? fract_a_ext_B0B3 : fract_b_ext_B0B3);
    assign rzeros_B0B3 = (((codasip_tmp_var_25[0] != 1'b0)) ? 7'h00 : (((codasip_tmp_var_25[1] != 1'b0)) ? 7'h01 : (((codasip_tmp_var_25[2] != 1'b0)) ? 7'h02 : (((codasip_tmp_var_25[3] != 1'b0)) ? 7'h03 : (((codasip_tmp_var_25[4] != 1'b0)) ? 7'h04 : (((codasip_tmp_var_25[5] != 1'b0)) ? 7'h05 : (((codasip_tmp_var_25[6] != 1'b0)) ? 7'h06 : (((codasip_tmp_var_25[7] != 1'b0)) ? 7'h07 : (((codasip_tmp_var_25[8] != 1'b0)) ? 7'h08 : (((codasip_tmp_var_25[9] != 1'b0)) ? 7'h09 : (((codasip_tmp_var_25[10] != 1'b0)) ? 7'h0a : (((codasip_tmp_var_25[11] != 1'b0)) ? 7'h0b : (((codasip_tmp_var_25[12] != 1'b0)) ? 7'h0c : (((codasip_tmp_var_25[13] != 1'b0)) ? 7'h0d : (((codasip_tmp_var_25[14] != 1'b0)) ? 7'h0e : (((codasip_tmp_var_25[15] != 1'b0)) ? 7'h0f : (((codasip_tmp_var_25[16] != 1'b0)) ? 7'h10 : (((codasip_tmp_var_25[17] != 1'b0)) ? 7'h11 : (((codasip_tmp_var_25[18] != 1'b0)) ? 7'h12 : (((codasip_tmp_var_25[19] != 1'b0)) ? 7'h13 : (((codasip_tmp_var_25[20] != 1'b0)) ? 7'h14 : (((codasip_tmp_var_25[21] != 1'b0)) ? 7'h15 : (((codasip_tmp_var_25[22] != 1'b0)) ? 7'h16 : (((codasip_tmp_var_25[23] != 1'b0)) ? 7'h17 : (((codasip_tmp_var_25[24] != 1'b0)) ? 7'h18 : (((codasip_tmp_var_25[25] != 1'b0)) ? 7'h19 : (((codasip_tmp_var_25[26] != 1'b0)) ? 7'h1a : (((codasip_tmp_var_25[27] != 1'b0)) ? 7'h1b : (((codasip_tmp_var_25[28] != 1'b0)) ? 7'h1c : (((codasip_tmp_var_25[29] != 1'b0)) ? 7'h1d : (((codasip_tmp_var_25[30] != 1'b0)) ? 7'h1e : (((codasip_tmp_var_25[31] != 1'b0)) ? 7'h1f : (((codasip_tmp_var_25[32] != 1'b0)) ? 7'h20 : (((codasip_tmp_var_25[33] != 1'b0)) ? 7'h21 : (((codasip_tmp_var_25[34] != 1'b0)) ? 7'h22 : (((codasip_tmp_var_25[35] != 1'b0)) ? 7'h23 : (((codasip_tmp_var_25[36] != 1'b0)) ? 7'h24 : (((codasip_tmp_var_25[37] != 1'b0)) ? 7'h25 : (((codasip_tmp_var_25[38] != 1'b0)) ? 7'h26 : (((codasip_tmp_var_25[39] != 1'b0)) ? 7'h27 : (((codasip_tmp_var_25[40] != 1'b0)) ? 7'h28 : (((codasip_tmp_var_25[41] != 1'b0)) ? 7'h29 : (((codasip_tmp_var_25[42] != 1'b0)) ? 7'h2a : (((codasip_tmp_var_25[43] != 1'b0)) ? 7'h2b : (((codasip_tmp_var_25[44] != 1'b0)) ? 7'h2c : (((codasip_tmp_var_25[45] != 1'b0)) ? 7'h2d : (((codasip_tmp_var_25[46] != 1'b0)) ? 7'h2e : (((codasip_tmp_var_25[47] != 1'b0)) ? 7'h2f : (((codasip_tmp_var_25[48] != 1'b0)) ? 7'h30 : (((codasip_tmp_var_25[49] != 1'b0)) ? 7'h31 : 7'h32))))))))))))))))))))))))))))))))))))))))))))))))));
    assign codasip_tmp_var_25 = fract_lower_ext_B0B3;
    assign exp_lower_B0B3 = ((exp_a_low_b_B0B3) ? exp_a_B0B3 : exp_b_B0B3);
    assign exp_bigger_B0B3 = ((exp_a_low_b_B0B3) ? exp_b_B0B3 : exp_a_B0B3);
    assign exp_diff_B0B3 = (exp_bigger_B0B3 - (exp_lower_B0B3 + 9'(unsigned'(1'((denom_a_B0B3 ^ denom_b_B0B3))))));
    assign fract_shift_ext_B0B3 = (fract_lower_ext_B0B3 >> exp_diff_B0B3);
    assign sticky_B0B3 = ((exp_diff_B0B3 > 9'(rzeros_B0B3)) && (rzeros_B0B3 != 7'h32));
    assign r_addsub_exp_D = ((exp_a_low_b_B0B3) ? exp_b_B0B3 : exp_a_B0B3);
    assign r_addsub_sticky_D = sticky_B0B3;
    assign r_addsub_fract_a_D = (((!exp_a_low_b_B0B3)) ? fract_a_ext_B0B3 : {fract_shift_ext_B0B3[49:1], (sticky_B0B3 | fract_shift_ext_B0B3[0])});
    assign r_addsub_fract_b_D = ((exp_a_low_b_B0B3) ? fract_b_ext_B0B3 : {fract_shift_ext_B0B3[49:1], (sticky_B0B3 | fract_shift_ext_B0B3[0])});
    assign r_addsub_fract_msb_D = r_prenorm_addsub_src_C_Q[22];
    assign r_addsub_sign_mul_D = r_prenorm_addsub_sign_mul_Q;
    assign r_addsub_sign_op3_D = r_prenorm_addsub_sign_op3_Q;
    assign r_addsub_ROB_ptr_D = r_prenorm_addsub_ROB_ptr_Q;
    assign r_addsub_properties_D = r_prenorm_addsub_properties_Q;
    assign r_addsub_rm_D = r_prenorm_addsub_rm_Q;
    assign adding_B0B4 = (!(r_addsub_sign_mul_Q ^ r_addsub_sign_op3_Q));
    assign a_low_b_B0B4 = (r_addsub_fract_a_Q < r_addsub_fract_b_Q);
    assign a_eq_b_B0B4 = (r_addsub_fract_a_Q == r_addsub_fract_b_Q);
    assign fract_bigger_B0B4 = 51'(unsigned'(50'(((a_low_b_B0B4) ? r_addsub_fract_b_Q : r_addsub_fract_a_Q))));
    assign fract_lower_B0B4 = 51'(unsigned'(50'(((a_low_b_B0B4) ? r_addsub_fract_a_Q : r_addsub_fract_b_Q))));
    assign res_fract_B0B4 = ((adding_B0B4) ? (51'(r_addsub_fract_a_Q) + 51'(r_addsub_fract_b_Q)) : (fract_bigger_B0B4 - fract_lower_B0B4));
    assign sign_res_B0B4 = (((((!a_eq_b_B0B4) || adding_B0B4)) ? 32'(unsigned'(1'((((((!r_addsub_sign_mul_Q) && a_low_b_B0B4) && r_addsub_sign_op3_Q) | (r_addsub_sign_mul_Q && r_addsub_sign_op3_Q)) | (r_addsub_sign_mul_Q && (!a_low_b_B0B4)))))) : (((r_addsub_rm_Q == 3'h2)) ? 32'h00000001 : 32'h00000000)) != 32'h00000000);
    assign r_postnorm_addsub_exp_D = r_addsub_exp_Q;
    assign r_postnorm_addsub_sign_res_D = sign_res_B0B4;
    assign r_postnorm_addsub_res_fract_D = res_fract_B0B4;
    assign r_postnorm_addsub_fract_msb_D = r_addsub_fract_msb_Q;
    assign r_postnorm_addsub_sticky_D = r_addsub_sticky_Q;
    assign r_postnorm_addsub_sign_mul_D = r_addsub_sign_mul_Q;
    assign r_postnorm_addsub_sign_op3_D = r_addsub_sign_op3_Q;
    assign r_postnorm_addsub_ROB_ptr_D = r_addsub_ROB_ptr_Q;
    assign r_postnorm_addsub_properties_D = r_addsub_properties_Q;
    assign r_postnorm_addsub_rm_D = r_addsub_rm_Q;
    assign carry_B0B5 = r_postnorm_addsub_res_fract_Q[50];
    assign hidden_B0B5 = r_postnorm_addsub_res_fract_Q[49];
    assign shift_right_B0B5 = carry_B0B5;
    assign postnorm_addsub_exp_is_zero_B0B5 = (r_postnorm_addsub_exp_Q == 9'h000);
    assign shift_left_B0B5 = (((!postnorm_addsub_exp_is_zero_B0B5) && (!carry_B0B5)) && (!hidden_B0B5));
    assign zeros_B0B5 = (((codasip_tmp_var_26[49] != 1'b0)) ? 7'h00 : (((codasip_tmp_var_26[48] != 1'b0)) ? 7'h01 : (((codasip_tmp_var_26[47] != 1'b0)) ? 7'h02 : (((codasip_tmp_var_26[46] != 1'b0)) ? 7'h03 : (((codasip_tmp_var_26[45] != 1'b0)) ? 7'h04 : (((codasip_tmp_var_26[44] != 1'b0)) ? 7'h05 : (((codasip_tmp_var_26[43] != 1'b0)) ? 7'h06 : (((codasip_tmp_var_26[42] != 1'b0)) ? 7'h07 : (((codasip_tmp_var_26[41] != 1'b0)) ? 7'h08 : (((codasip_tmp_var_26[40] != 1'b0)) ? 7'h09 : (((codasip_tmp_var_26[39] != 1'b0)) ? 7'h0a : (((codasip_tmp_var_26[38] != 1'b0)) ? 7'h0b : (((codasip_tmp_var_26[37] != 1'b0)) ? 7'h0c : (((codasip_tmp_var_26[36] != 1'b0)) ? 7'h0d : (((codasip_tmp_var_26[35] != 1'b0)) ? 7'h0e : (((codasip_tmp_var_26[34] != 1'b0)) ? 7'h0f : (((codasip_tmp_var_26[33] != 1'b0)) ? 7'h10 : (((codasip_tmp_var_26[32] != 1'b0)) ? 7'h11 : (((codasip_tmp_var_26[31] != 1'b0)) ? 7'h12 : (((codasip_tmp_var_26[30] != 1'b0)) ? 7'h13 : (((codasip_tmp_var_26[29] != 1'b0)) ? 7'h14 : (((codasip_tmp_var_26[28] != 1'b0)) ? 7'h15 : (((codasip_tmp_var_26[27] != 1'b0)) ? 7'h16 : (((codasip_tmp_var_26[26] != 1'b0)) ? 7'h17 : (((codasip_tmp_var_26[25] != 1'b0)) ? 7'h18 : (((codasip_tmp_var_26[24] != 1'b0)) ? 7'h19 : (((codasip_tmp_var_26[23] != 1'b0)) ? 7'h1a : (((codasip_tmp_var_26[22] != 1'b0)) ? 7'h1b : (((codasip_tmp_var_26[21] != 1'b0)) ? 7'h1c : (((codasip_tmp_var_26[20] != 1'b0)) ? 7'h1d : (((codasip_tmp_var_26[19] != 1'b0)) ? 7'h1e : (((codasip_tmp_var_26[18] != 1'b0)) ? 7'h1f : (((codasip_tmp_var_26[17] != 1'b0)) ? 7'h20 : (((codasip_tmp_var_26[16] != 1'b0)) ? 7'h21 : (((codasip_tmp_var_26[15] != 1'b0)) ? 7'h22 : (((codasip_tmp_var_26[14] != 1'b0)) ? 7'h23 : (((codasip_tmp_var_26[13] != 1'b0)) ? 7'h24 : (((codasip_tmp_var_26[12] != 1'b0)) ? 7'h25 : (((codasip_tmp_var_26[11] != 1'b0)) ? 7'h26 : (((codasip_tmp_var_26[10] != 1'b0)) ? 7'h27 : (((codasip_tmp_var_26[9] != 1'b0)) ? 7'h28 : (((codasip_tmp_var_26[8] != 1'b0)) ? 7'h29 : (((codasip_tmp_var_26[7] != 1'b0)) ? 7'h2a : (((codasip_tmp_var_26[6] != 1'b0)) ? 7'h2b : (((codasip_tmp_var_26[5] != 1'b0)) ? 7'h2c : (((codasip_tmp_var_26[4] != 1'b0)) ? 7'h2d : (((codasip_tmp_var_26[3] != 1'b0)) ? 7'h2e : (((codasip_tmp_var_26[2] != 1'b0)) ? 7'h2f : (((codasip_tmp_var_26[1] != 1'b0)) ? 7'h30 : (((codasip_tmp_var_26[0] != 1'b0)) ? 7'h31 : 7'h32))))))))))))))))))))))))))))))))))))))))))))))))));
    assign codasip_tmp_var_26 = r_postnorm_addsub_res_fract_Q[49:0];
    assign codasip_tmp_var_6 = shift_right_B0B5;
    assign codasip_tmp_var_7 = (!codasip_tmp_var_6) ? shift_left_B0B5 : 1'b0;
    assign codasip_tmp_var_8 = codasip_tmp_var_7 ? (r_postnorm_addsub_exp_Q > 9'(zeros_B0B5)) : 1'b0;
    assign exp_rot_B0B5 = codasip_tmp_var_6 ? (r_postnorm_addsub_exp_Q + 9'h001) :
        codasip_tmp_var_8 ? (r_postnorm_addsub_exp_Q - 9'(zeros_B0B5)) :
        codasip_tmp_var_7 ? 9'h000 : r_postnorm_addsub_exp_Q;
    assign shift_B0B5B1B0B1 = ((!codasip_tmp_var_8) && codasip_tmp_var_7) ? (r_postnorm_addsub_exp_Q - 9'h001) : 9'h000;
    assign fract_rot_B0B5 = codasip_tmp_var_6 ? r_postnorm_addsub_res_fract_Q[50:1] :
        codasip_tmp_var_8 ? (r_postnorm_addsub_res_fract_Q[49:0] << zeros_B0B5) :
        codasip_tmp_var_7 ? (r_postnorm_addsub_res_fract_Q[49:0] << shift_B0B5B1B0B1) : 50'(r_postnorm_addsub_res_fract_Q);
    assign fract_rot_shifted_B0B5 = fract_rot_B0B5;
    assign mul_exp_msb_B0B5 = exp_rot_B0B5[8];
    assign max_exp_B0B5 = 8'hff;
    assign exp_B0B5 = ((mul_exp_msb_B0B5) ? max_exp_B0B5 : (((fract_rot_shifted_B0B5[49] == 1'b0)) ? 8'h00 : exp_rot_B0B5[7:0]));
    assign sticky_B0B5 = (((shift_right_B0B5 & r_postnorm_addsub_res_fract_Q[0]) | (fract_rot_B0B5[23:0] != 24'h000000)) | r_postnorm_addsub_sticky_Q);
    assign r_rounding_fract_1sh_D = {fract_rot_B0B5[49:24], sticky_B0B5};
    assign r_rounding_exp_1sh_D = exp_B0B5;
    assign r_rounding_sign_res_D = r_postnorm_addsub_sign_res_Q;
    assign r_rounding_fract_msb_D = r_postnorm_addsub_fract_msb_Q;
    assign r_rounding_sign_mul_D = r_postnorm_addsub_sign_mul_Q;
    assign r_rounding_sign_op3_D = r_postnorm_addsub_sign_op3_Q;
    assign r_rounding_ROB_ptr_D = r_postnorm_addsub_ROB_ptr_Q;
    assign r_rounding_properties_D = r_postnorm_addsub_properties_Q;
    assign r_rounding_rm_D = r_postnorm_addsub_rm_Q;
    assign mul_nan_op_B0B6 = r_rounding_properties_Q[1];
    assign inf_B0B6 = r_rounding_properties_Q[3];
    assign nan_B0B6 = r_rounding_properties_Q[4];
    assign snan_B0B6 = r_rounding_properties_Q[5];
    assign inf_C_B0B6 = r_rounding_properties_Q[6];
    assign nan_C_B0B6 = r_rounding_properties_Q[7];
    assign hidden_before_rounding_B0B6 = r_rounding_fract_1sh_Q[26];
    assign LSB_B0B6 = r_rounding_fract_1sh_Q[3];
    assign guard_B0B6 = r_rounding_fract_1sh_Q[2];
    assign round_B0B6 = r_rounding_fract_1sh_Q[1];
    assign sticky_B0B6 = r_rounding_fract_1sh_Q[0];
    assign codasip_tmp_var_9 = (r_rounding_rm_Q == 3'h0);
    assign codasip_tmp_var_10 = (!codasip_tmp_var_9) ? r_rounding_rm_Q[1] : 1'b0;
    assign codasip_tmp_var_11 = ((!codasip_tmp_var_10) && (!codasip_tmp_var_9)) ? r_rounding_rm_Q[2] : 1'b0;
    assign roundup_B0B6 = codasip_tmp_var_9 ? (guard_B0B6 & ((round_B0B6 | sticky_B0B6) | LSB_B0B6)) :
        codasip_tmp_var_10 ? ((r_rounding_rm_Q[0] ^ r_rounding_sign_res_Q) & ((guard_B0B6 | round_B0B6) | sticky_B0B6)) :
        codasip_tmp_var_11 ? guard_B0B6 : 1'b0;
    assign not_roundup_if_unbounded_exp_B0B6 = codasip_tmp_var_9 ? (!round_B0B6) :
        codasip_tmp_var_10 ? ((!round_B0B6) & (!sticky_B0B6)) :
        codasip_tmp_var_11 ? (!round_B0B6) : 1'b0;
    assign fract_round_B0B6 = (28'(r_rounding_fract_1sh_Q) + 28'(unsigned'(4'({roundup_B0B6, 3'h0}))));
    assign fused_nan_op_B0B6 = (mul_nan_op_B0B6 || ((((!nan_B0B6) && inf_B0B6) && inf_C_B0B6) && (r_rounding_sign_mul_Q ^ r_rounding_sign_op3_Q)));
    assign fused_nan_B0B6 = (nan_B0B6 || nan_C_B0B6);
    assign fused_inf_B0B6 = (inf_B0B6 || inf_C_B0B6);
    assign shift_right_round_B0B6 = fract_round_B0B6[27];
    assign hidden_B0B6 = fract_round_B0B6[26];
    assign exp_zero_B0B6 = (r_rounding_exp_1sh_Q == 8'h00);
    assign codasip_tmp_var_12 = shift_right_round_B0B6;
    assign codasip_tmp_var_13 = (!codasip_tmp_var_12) ? (hidden_B0B6 && exp_zero_B0B6) : 1'b0;
    assign codasip_tmp_var_14 = ((!codasip_tmp_var_13) && (!codasip_tmp_var_12)) ? ((!hidden_B0B6) && (r_rounding_exp_1sh_Q == 8'h01)) : 1'b0;
    assign exp_ext_round_B0B6 = codasip_tmp_var_12 ? 9'((32'(9'(r_rounding_exp_1sh_Q)) + 32'h00000001)) :
        codasip_tmp_var_13 ? 9'h001 :
        codasip_tmp_var_14 ? 9'h000 : 9'(r_rounding_exp_1sh_Q);
    assign fract_round_rot_B0B6 = codasip_tmp_var_12 ? (fract_round_B0B6 >> 32'sh00000001) : fract_round_B0B6;
    assign overflow_limit_B0B6 = 9'h0ff;
    assign overflow_B0B6 = ((((exp_ext_round_B0B6 >= overflow_limit_B0B6) && (!fused_inf_B0B6)) && (!fused_nan_B0B6)) && (!nan_C_B0B6));
    assign lost_B0B6 = (((shift_right_round_B0B6 || fract_round_rot_B0B6[2]) || fract_round_rot_B0B6[1]) || fract_round_rot_B0B6[0]);
    assign inexact_B0B6 = ((((overflow_B0B6 || lost_B0B6) && (!fused_inf_B0B6)) && (!fused_nan_B0B6)) && (!nan_C_B0B6));
    assign tiny_B0B6 = (((!hidden_B0B6) & (!shift_right_round_B0B6)) | ((exp_zero_B0B6 & (!hidden_before_rounding_B0B6)) & ((!guard_B0B6) | not_roundup_if_unbounded_exp_B0B6)));
    assign underflow_B0B6 = (tiny_B0B6 & inexact_B0B6);
    assign invalid_B0B6 = ((fused_nan_op_B0B6 || snan_B0B6) || (nan_C_B0B6 && (!r_rounding_fract_msb_Q)));
    assign codasip_tmp_var_15 = (fused_nan_B0B6 || fused_nan_op_B0B6);
    assign codasip_tmp_var_16 = (!codasip_tmp_var_15) ? inf_B0B6 : 1'b0;
    assign codasip_tmp_var_17 = ((!codasip_tmp_var_16) && (!codasip_tmp_var_15)) ? inf_C_B0B6 : 1'b0;
    assign codasip_tmp_var_18 = (((!codasip_tmp_var_17) && (!codasip_tmp_var_16)) && (!codasip_tmp_var_15)) ? overflow_B0B6 : 1'b0;
    assign codasip_tmp_var_19 = codasip_tmp_var_18 ? (r_rounding_sign_res_Q && ((r_rounding_rm_Q == 3'h3) || (r_rounding_rm_Q == 3'h1))) : 1'b0;
    assign codasip_tmp_var_20 = ((!codasip_tmp_var_19) && codasip_tmp_var_18) ? ((!r_rounding_sign_res_Q) && ((r_rounding_rm_Q == 3'h2) || (r_rounding_rm_Q == 3'h1))) : 1'b0;
    assign codasip_tmp_var_21 = ((((!codasip_tmp_var_18) && (!codasip_tmp_var_17)) && (!codasip_tmp_var_16)) && (!codasip_tmp_var_15)) ? (fract_round_rot_B0B6 == 28'h0000000) : 1'b0;
    assign res_B0B6 = codasip_tmp_var_15 ? 32'h7fc00000 :
        codasip_tmp_var_16 ? {r_rounding_sign_mul_Q, 31'h7f800000} :
        codasip_tmp_var_17 ? {r_rounding_sign_op3_Q, 31'h7f800000} :
        codasip_tmp_var_19 ? 32'hff7fffff :
        codasip_tmp_var_20 ? 32'h7f7fffff :
        codasip_tmp_var_18 ? {r_rounding_sign_res_Q, 31'h7f800000} :
        codasip_tmp_var_21 ? {r_rounding_sign_res_Q, 31'h00000000} : {r_rounding_sign_res_Q, exp_ext_round_B0B6[7:0], fract_round_rot_B0B6[25:3]};
    assign r_addsub_ROB_ptr_WE = 1'b1;
    assign r_addsub_exp_WE = 1'b1;
    assign r_addsub_fract_a_WE = 1'b1;
    assign r_addsub_fract_b_WE = 1'b1;
    assign r_addsub_fract_msb_WE = 1'b1;
    assign r_addsub_properties_WE = 1'b1;
    assign r_addsub_rm_WE = 1'b1;
    assign r_addsub_sign_mul_WE = 1'b1;
    assign r_addsub_sign_op3_WE = 1'b1;
    assign r_addsub_sticky_WE = 1'b1;
    assign r_postnorm_addsub_ROB_ptr_WE = 1'b1;
    assign r_postnorm_addsub_exp_WE = 1'b1;
    assign r_postnorm_addsub_fract_msb_WE = 1'b1;
    assign r_postnorm_addsub_properties_WE = 1'b1;
    assign r_postnorm_addsub_res_fract_WE = 1'b1;
    assign r_postnorm_addsub_rm_WE = 1'b1;
    assign r_postnorm_addsub_sign_mul_WE = 1'b1;
    assign r_postnorm_addsub_sign_op3_WE = 1'b1;
    assign r_postnorm_addsub_sign_res_WE = 1'b1;
    assign r_postnorm_addsub_sticky_WE = 1'b1;
    assign r_postnorm_mul1_ROB_ptr_WE = 1'b1;
    assign r_postnorm_mul1_properties_WE = 1'b1;
    assign r_postnorm_mul1_rm_WE = 1'b1;
    assign r_postnorm_mul1_sign_mul_WE = 1'b1;
    assign r_postnorm_mul1_sign_op3_WE = 1'b1;
    assign r_postnorm_mul1_src_C_WE = 1'b1;
    assign r_postnorm_mul2_ROB_ptr_WE = 1'b1;
    assign r_postnorm_mul2_count_r_shift_WE = 1'b1;
    assign r_postnorm_mul2_mul_exp_WE = 1'b1;
    assign r_postnorm_mul2_mul_res_WE = 1'b1;
    assign r_postnorm_mul2_properties_WE = 1'b1;
    assign r_postnorm_mul2_rm_WE = 1'b1;
    assign r_postnorm_mul2_shift_left_WE = 1'b1;
    assign r_postnorm_mul2_shift_right_WE = 1'b1;
    assign r_postnorm_mul2_sign_mul_WE = 1'b1;
    assign r_postnorm_mul2_sign_op3_WE = 1'b1;
    assign r_postnorm_mul2_src_C_WE = 1'b1;
    assign r_postnorm_mul2_zeros_l_WE = 1'b1;
    assign r_postnorm_mul2_zeros_r_WE = 1'b1;
    assign r_prenorm_addsub_ROB_ptr_WE = 1'b1;
    assign r_prenorm_addsub_exp_WE = 1'b1;
    assign r_prenorm_addsub_fract_WE = 1'b1;
    assign r_prenorm_addsub_properties_WE = 1'b1;
    assign r_prenorm_addsub_rm_WE = 1'b1;
    assign r_prenorm_addsub_sign_mul_WE = 1'b1;
    assign r_prenorm_addsub_sign_op3_WE = 1'b1;
    assign r_prenorm_addsub_src_C_WE = 1'b1;
    assign r_rounding_ROB_ptr_WE = 1'b1;
    assign r_rounding_exp_1sh_WE = 1'b1;
    assign r_rounding_fract_1sh_WE = 1'b1;
    assign r_rounding_fract_msb_WE = 1'b1;
    assign r_rounding_properties_WE = 1'b1;
    assign r_rounding_rm_WE = 1'b1;
    assign r_rounding_sign_mul_WE = 1'b1;
    assign r_rounding_sign_op3_WE = 1'b1;
    assign r_rounding_sign_res_WE = 1'b1;
    assign r_addsub_fin_D = r_prenorm_addsub_fin_Q;
    assign r_addsub_fin_WE = 1'b1;
    assign r_postnorm_addsub_fin_D = r_addsub_fin_Q;
    assign r_postnorm_addsub_fin_WE = 1'b1;
    assign r_postnorm_mul1_fin_D = r_wait_mul_fin_Q;
    assign r_postnorm_mul1_fin_WE = 1'b1;
    assign r_postnorm_mul2_fin_D = r_postnorm_mul1_fin_Q;
    assign r_postnorm_mul2_fin_WE = 1'b1;
    assign r_prenorm_addsub_fin_D = r_postnorm_mul2_fin_Q;
    assign r_prenorm_addsub_fin_WE = 1'b1;
    assign r_rounding_fin_D = r_postnorm_addsub_fin_Q;
    assign r_rounding_fin_WE = 1'b1;
    assign r_wait_mul_fin_D = s_start_i_Q;
    assign r_wait_mul_fin_WE = 1'b1;
    assign s_done_o_D = r_rounding_fin_Q;
    assign s_flags_o_D = {invalid_B0B6, 1'b0, overflow_B0B6, underflow_B0B6, inexact_B0B6};
    assign s_result_o_D = res_B0B6;
    assign s_ROB_ptr_o_D = r_rounding_ROB_ptr_Q;
endmodule: codix_berkelium_ca_core_execute_stage_fpu_fused_compute_fused_t
