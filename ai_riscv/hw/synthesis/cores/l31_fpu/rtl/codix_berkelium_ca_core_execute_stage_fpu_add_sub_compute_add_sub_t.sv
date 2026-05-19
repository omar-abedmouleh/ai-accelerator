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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_add_sub_compute_add_sub_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_fpu_add_sub_compute_add_sub_t(
    input  logic execute_stage_fpu_add_sub_s_add_sub_ce_ICLK,
    input  logic RST,
    input  logic pipe_add_sub_COMPUTE_CLEAR_Q,
    input  logic pipe_add_sub_COMPUTE_STALL_Q,
    input  logic pipe_add_sub_POSTNORM_CLEAR_Q,
    input  logic pipe_add_sub_POSTNORM_STALL_Q,
    input  logic pipe_add_sub_ROUNDING_CLEAR_Q,
    input  logic pipe_add_sub_ROUNDING_STALL_Q,
    input  logic r_compute_fin_Q,
    input  logic r_postnorm_fin_Q,
    input  logic r_rounding_fin_Q,
    input  logic [5:0] s_op_i_Q,
    input  logic [8:0] s_properties_i_Q,
    input  logic [2:0] s_rm_i_Q,
    input  logic [4:0] s_ROB_ptr_i_Q,
    input  logic [30:0] s_srcA_i_Q,
    input  logic [30:0] s_srcB_i_Q,
    input  logic s_start_i_Q,
    output logic r_compute_fin_D,
    output logic r_compute_fin_WE,
    output logic r_postnorm_fin_D,
    output logic r_postnorm_fin_WE,
    output logic r_rounding_fin_D,
    output logic r_rounding_fin_WE,
    output logic s_done_o_D,
    output logic [4:0] s_flags_o_D,
    output logic [31:0] s_result_o_D,
    output logic [4:0] s_ROB_ptr_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic a_eq_b_B0B1;
    // signal/wire
    logic a_low_b_B0B1;
    // signal/wire
    logic adding_B0B1;
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
    logic [23:0] codasip_tmp_var_13;
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
    logic denom_a_B0B0;
    // signal/wire
    logic denom_b_B0B0;
    // signal/wire
    logic [7:0] exp_B0B2;
    // signal/wire
    logic [7:0] exp_a_B0B0;
    // signal/wire
    logic exp_a_low_b_B0B0;
    // signal/wire
    logic [7:0] exp_b_B0B0;
    // signal/wire
    logic [7:0] exp_bigger_B0B0;
    // signal/wire
    logic [7:0] exp_diff_B0B0;
    // signal/wire
    logic [7:0] exp_ext_round_B0B3;
    // signal/wire
    logic [7:0] exp_lower_B0B0;
    // signal/wire
    logic [8:0] exp_rot_B0B2;
    // signal/wire
    logic [26:0] fract_a_ext_B0B0;
    // signal/wire
    logic [26:0] fract_b_ext_B0B0;
    // signal/wire
    logic [27:0] fract_bigger_B0B1;
    // signal/wire
    logic [27:0] fract_lower_B0B1;
    // signal/wire
    logic [26:0] fract_lower_ext_B0B0;
    // signal/wire
    logic [26:0] fract_rot_B0B2;
    // signal/wire
    logic [27:0] fract_round_B0B3;
    // signal/wire
    logic [27:0] fract_round_rot_B0B3;
    // signal/wire
    logic [26:0] fract_shift_ext_B0B0;
    // signal/wire
    logic inexact_B0B3;
    // signal/wire
    logic inf_A_B0B3;
    // signal/wire
    logic inf_B0B3;
    // signal/wire
    logic inf_B_B0B3;
    // signal/wire
    logic invalid_B0B3;
    // signal/wire
    logic lost_B0B3;
    // signal/wire
    logic nan_B0B3;
    // signal/wire
    logic nan_op_B0B3;
    // signal/wire
    logic overflow_B0B3;
    // signal/wire
    logic [31:0] res_B0B3;
    // signal/wire
    logic [27:0] res_fract_B0B1;
    // signal/wire
    logic [2:0] rm_B0B1;
    // signal/wire
    logic [2:0] rm_B0B3;
    // signal/wire
    logic round1_fract_round_B0B3;
    // signal/wire
    logic roundup_B0B3;
    // signal/wire
    logic [5:0] rzeros_B0B0;
    // signal/wire
    logic [5:0] rzeros_tmp_B0B0;
    // signal/wire
    logic shift_left_B0B2;
    // signal/wire
    logic shift_right_B0B2;
    // signal/wire
    logic shift_right_round_B0B3;
    // signal/wire
    logic sign_A_B0B1;
    // signal/wire
    logic sign_A_B0B3;
    // signal/wire
    logic sign_B_B0B3;
    // signal/wire
    logic sign_inf_B0B3B3B0;
    // signal/wire
    logic sign_res_B0B1;
    // signal/wire
    logic sing_B_B0B1;
    // signal/wire
    logic snan_B0B3;
    // signal/wire
    logic sticky_B0B0;
    // signal/wire
    logic sticky_B0B2;
    // signal/wire
    logic [5:0] zeros_B0B2;

    // additional declarations:
    logic r_compute_ROB_ptr_WE;
    logic [4:0] r_compute_ROB_ptr_D;
    logic [4:0] r_compute_ROB_ptr_Q;
    logic r_compute_exp_WE;
    logic [7:0] r_compute_exp_D;
    logic [7:0] r_compute_exp_Q;
    logic r_compute_fract_a_WE;
    logic [26:0] r_compute_fract_a_D;
    logic [26:0] r_compute_fract_a_Q;
    logic r_compute_fract_b_WE;
    logic [26:0] r_compute_fract_b_D;
    logic [26:0] r_compute_fract_b_Q;
    logic r_compute_properties_WE;
    logic [8:0] r_compute_properties_D;
    logic [8:0] r_compute_properties_Q;
    logic r_compute_rm_WE;
    logic [2:0] r_compute_rm_D;
    logic [2:0] r_compute_rm_Q;
    logic r_compute_sub_WE;
    logic r_compute_sub_D;
    logic r_compute_sub_Q;
    logic r_postnorm_ROB_ptr_WE;
    logic [4:0] r_postnorm_ROB_ptr_D;
    logic [4:0] r_postnorm_ROB_ptr_Q;
    logic r_postnorm_exp_WE;
    logic [7:0] r_postnorm_exp_D;
    logic [7:0] r_postnorm_exp_Q;
    logic r_postnorm_properties_WE;
    logic [8:0] r_postnorm_properties_D;
    logic [8:0] r_postnorm_properties_Q;
    logic r_postnorm_res_fract_WE;
    logic [27:0] r_postnorm_res_fract_D;
    logic [27:0] r_postnorm_res_fract_Q;
    logic r_postnorm_rm_WE;
    logic [2:0] r_postnorm_rm_D;
    logic [2:0] r_postnorm_rm_Q;
    logic r_postnorm_sign_res_WE;
    logic r_postnorm_sign_res_D;
    logic r_postnorm_sign_res_Q;
    logic r_postnorm_sub_WE;
    logic r_postnorm_sub_D;
    logic r_postnorm_sub_Q;
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
    logic [8:0] r_rounding_properties_D;
    logic [8:0] r_rounding_properties_Q;
    logic r_rounding_rm_WE;
    logic [2:0] r_rounding_rm_D;
    logic [2:0] r_rounding_rm_Q;
    logic r_rounding_sign_res_WE;
    logic r_rounding_sign_res_D;
    logic r_rounding_sign_res_Q;
    logic r_rounding_sub_WE;
    logic r_rounding_sub_D;
    logic r_rounding_sub_Q;
    logic tmp_codasip_conv_BIT_EXTRACT_638_1;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_638_2;
    logic tmp_codasip_conv_BIT_EXTRACT_642_3;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_642_4;
    logic tmp_codasip_conv_BIT_EXTRACT_646_5;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_646_6;
    logic tmp_codasip_conv_BIT_EXTRACT_650_7;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_650_8;
    logic tmp_codasip_conv_BIT_EXTRACT_654_9;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_654_10;
    logic tmp_codasip_conv_BIT_EXTRACT_658_11;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_658_12;
    logic tmp_codasip_conv_BIT_EXTRACT_662_13;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_662_14;
    logic tmp_codasip_conv_BIT_EXTRACT_666_15;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_666_16;
    logic tmp_codasip_conv_BIT_EXTRACT_670_17;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_670_18;
    logic tmp_codasip_conv_BIT_EXTRACT_674_19;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_674_20;
    logic tmp_codasip_conv_BIT_EXTRACT_678_21;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_678_22;
    logic tmp_codasip_conv_BIT_EXTRACT_682_23;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_682_24;
    logic tmp_codasip_conv_BIT_EXTRACT_686_25;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_686_26;
    logic tmp_codasip_conv_BIT_EXTRACT_690_27;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_690_28;
    logic tmp_codasip_conv_BIT_EXTRACT_694_29;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_694_30;
    logic tmp_codasip_conv_BIT_EXTRACT_698_31;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_698_32;
    logic tmp_codasip_conv_BIT_EXTRACT_702_33;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_702_34;
    logic tmp_codasip_conv_BIT_EXTRACT_706_35;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_706_36;
    logic tmp_codasip_conv_BIT_EXTRACT_710_37;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_710_38;
    logic tmp_codasip_conv_BIT_EXTRACT_714_39;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_714_40;
    logic tmp_codasip_conv_BIT_EXTRACT_718_41;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_718_42;
    logic tmp_codasip_conv_BIT_EXTRACT_722_43;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_722_44;
    logic tmp_codasip_conv_BIT_EXTRACT_726_45;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_726_46;
    logic tmp_codasip_conv_BIT_EXTRACT_730_47;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_730_48;
    logic tmp_codasip_conv_BIT_EXTRACT_734_49;
    logic [26:0] tmp_codasip_conv_BIT_EXTRACT_734_50;

    // child instances inside functional unit:
    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_compute_ROB_ptr (
        .CLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_add_sub_COMPUTE_CLEAR_Q),
        .STALL(pipe_add_sub_COMPUTE_STALL_Q),
        .WE(r_compute_ROB_ptr_WE),
        .D(r_compute_ROB_ptr_D),
        .Q(r_compute_ROB_ptr_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd8),
        .DEFAULT_VALUE(8'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_compute_exp (
        .CLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_add_sub_COMPUTE_CLEAR_Q),
        .STALL(pipe_add_sub_COMPUTE_STALL_Q),
        .WE(r_compute_exp_WE),
        .D(r_compute_exp_D),
        .Q(r_compute_exp_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd27),
        .DEFAULT_VALUE(27'h0000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_compute_fract_a (
        .CLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_add_sub_COMPUTE_CLEAR_Q),
        .STALL(pipe_add_sub_COMPUTE_STALL_Q),
        .WE(r_compute_fract_a_WE),
        .D(r_compute_fract_a_D),
        .Q(r_compute_fract_a_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd27),
        .DEFAULT_VALUE(27'h0000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_compute_fract_b (
        .CLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_add_sub_COMPUTE_CLEAR_Q),
        .STALL(pipe_add_sub_COMPUTE_STALL_Q),
        .WE(r_compute_fract_b_WE),
        .D(r_compute_fract_b_D),
        .Q(r_compute_fract_b_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd9),
        .DEFAULT_VALUE(9'h000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_compute_properties (
        .CLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_add_sub_COMPUTE_CLEAR_Q),
        .STALL(pipe_add_sub_COMPUTE_STALL_Q),
        .WE(r_compute_properties_WE),
        .D(r_compute_properties_D),
        .Q(r_compute_properties_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_compute_rm (
        .CLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_add_sub_COMPUTE_CLEAR_Q),
        .STALL(pipe_add_sub_COMPUTE_STALL_Q),
        .WE(r_compute_rm_WE),
        .D(r_compute_rm_D),
        .Q(r_compute_rm_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_compute_sub (
        .CLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_add_sub_COMPUTE_CLEAR_Q),
        .STALL(pipe_add_sub_COMPUTE_STALL_Q),
        .WE(r_compute_sub_WE),
        .D(r_compute_sub_D),
        .Q(r_compute_sub_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_ROB_ptr (
        .CLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_add_sub_POSTNORM_CLEAR_Q),
        .STALL(pipe_add_sub_POSTNORM_STALL_Q),
        .WE(r_postnorm_ROB_ptr_WE),
        .D(r_postnorm_ROB_ptr_D),
        .Q(r_postnorm_ROB_ptr_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd8),
        .DEFAULT_VALUE(8'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_exp (
        .CLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_add_sub_POSTNORM_CLEAR_Q),
        .STALL(pipe_add_sub_POSTNORM_STALL_Q),
        .WE(r_postnorm_exp_WE),
        .D(r_postnorm_exp_D),
        .Q(r_postnorm_exp_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd9),
        .DEFAULT_VALUE(9'h000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_properties (
        .CLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_add_sub_POSTNORM_CLEAR_Q),
        .STALL(pipe_add_sub_POSTNORM_STALL_Q),
        .WE(r_postnorm_properties_WE),
        .D(r_postnorm_properties_D),
        .Q(r_postnorm_properties_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd28),
        .DEFAULT_VALUE(28'h0000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_res_fract (
        .CLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_add_sub_POSTNORM_CLEAR_Q),
        .STALL(pipe_add_sub_POSTNORM_STALL_Q),
        .WE(r_postnorm_res_fract_WE),
        .D(r_postnorm_res_fract_D),
        .Q(r_postnorm_res_fract_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_rm (
        .CLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_add_sub_POSTNORM_CLEAR_Q),
        .STALL(pipe_add_sub_POSTNORM_STALL_Q),
        .WE(r_postnorm_rm_WE),
        .D(r_postnorm_rm_D),
        .Q(r_postnorm_rm_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_sign_res (
        .CLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_add_sub_POSTNORM_CLEAR_Q),
        .STALL(pipe_add_sub_POSTNORM_STALL_Q),
        .WE(r_postnorm_sign_res_WE),
        .D(r_postnorm_sign_res_D),
        .Q(r_postnorm_sign_res_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_postnorm_sub (
        .CLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_add_sub_POSTNORM_CLEAR_Q),
        .STALL(pipe_add_sub_POSTNORM_STALL_Q),
        .WE(r_postnorm_sub_WE),
        .D(r_postnorm_sub_D),
        .Q(r_postnorm_sub_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_ROB_ptr (
        .CLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_add_sub_ROUNDING_CLEAR_Q),
        .STALL(pipe_add_sub_ROUNDING_STALL_Q),
        .WE(r_rounding_ROB_ptr_WE),
        .D(r_rounding_ROB_ptr_D),
        .Q(r_rounding_ROB_ptr_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd8),
        .DEFAULT_VALUE(8'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_exp_1sh (
        .CLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_add_sub_ROUNDING_CLEAR_Q),
        .STALL(pipe_add_sub_ROUNDING_STALL_Q),
        .WE(r_rounding_exp_1sh_WE),
        .D(r_rounding_exp_1sh_D),
        .Q(r_rounding_exp_1sh_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd27),
        .DEFAULT_VALUE(27'h0000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_fract_1sh (
        .CLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_add_sub_ROUNDING_CLEAR_Q),
        .STALL(pipe_add_sub_ROUNDING_STALL_Q),
        .WE(r_rounding_fract_1sh_WE),
        .D(r_rounding_fract_1sh_D),
        .Q(r_rounding_fract_1sh_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd9),
        .DEFAULT_VALUE(9'h000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_properties (
        .CLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_add_sub_ROUNDING_CLEAR_Q),
        .STALL(pipe_add_sub_ROUNDING_STALL_Q),
        .WE(r_rounding_properties_WE),
        .D(r_rounding_properties_D),
        .Q(r_rounding_properties_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_rm (
        .CLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_add_sub_ROUNDING_CLEAR_Q),
        .STALL(pipe_add_sub_ROUNDING_STALL_Q),
        .WE(r_rounding_rm_WE),
        .D(r_rounding_rm_D),
        .Q(r_rounding_rm_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_sign_res (
        .CLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_add_sub_ROUNDING_CLEAR_Q),
        .STALL(pipe_add_sub_ROUNDING_STALL_Q),
        .WE(r_rounding_sign_res_WE),
        .D(r_rounding_sign_res_D),
        .Q(r_rounding_sign_res_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_sub (
        .CLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_add_sub_ROUNDING_CLEAR_Q),
        .STALL(pipe_add_sub_ROUNDING_STALL_Q),
        .WE(r_rounding_sub_WE),
        .D(r_rounding_sub_D),
        .Q(r_rounding_sub_Q)
    );

    // conversions for data-path:
    assign tmp_codasip_conv_BIT_EXTRACT_638_2 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_638_1 = tmp_codasip_conv_BIT_EXTRACT_638_2[26];
    assign tmp_codasip_conv_BIT_EXTRACT_642_4 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_642_3 = tmp_codasip_conv_BIT_EXTRACT_642_4[25];
    assign tmp_codasip_conv_BIT_EXTRACT_646_6 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_646_5 = tmp_codasip_conv_BIT_EXTRACT_646_6[24];
    assign tmp_codasip_conv_BIT_EXTRACT_650_8 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_650_7 = tmp_codasip_conv_BIT_EXTRACT_650_8[23];
    assign tmp_codasip_conv_BIT_EXTRACT_654_10 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_654_9 = tmp_codasip_conv_BIT_EXTRACT_654_10[22];
    assign tmp_codasip_conv_BIT_EXTRACT_658_12 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_658_11 = tmp_codasip_conv_BIT_EXTRACT_658_12[21];
    assign tmp_codasip_conv_BIT_EXTRACT_662_14 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_662_13 = tmp_codasip_conv_BIT_EXTRACT_662_14[20];
    assign tmp_codasip_conv_BIT_EXTRACT_666_16 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_666_15 = tmp_codasip_conv_BIT_EXTRACT_666_16[19];
    assign tmp_codasip_conv_BIT_EXTRACT_670_18 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_670_17 = tmp_codasip_conv_BIT_EXTRACT_670_18[18];
    assign tmp_codasip_conv_BIT_EXTRACT_674_20 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_674_19 = tmp_codasip_conv_BIT_EXTRACT_674_20[17];
    assign tmp_codasip_conv_BIT_EXTRACT_678_22 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_678_21 = tmp_codasip_conv_BIT_EXTRACT_678_22[16];
    assign tmp_codasip_conv_BIT_EXTRACT_682_24 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_682_23 = tmp_codasip_conv_BIT_EXTRACT_682_24[15];
    assign tmp_codasip_conv_BIT_EXTRACT_686_26 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_686_25 = tmp_codasip_conv_BIT_EXTRACT_686_26[14];
    assign tmp_codasip_conv_BIT_EXTRACT_690_28 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_690_27 = tmp_codasip_conv_BIT_EXTRACT_690_28[13];
    assign tmp_codasip_conv_BIT_EXTRACT_694_30 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_694_29 = tmp_codasip_conv_BIT_EXTRACT_694_30[12];
    assign tmp_codasip_conv_BIT_EXTRACT_698_32 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_698_31 = tmp_codasip_conv_BIT_EXTRACT_698_32[11];
    assign tmp_codasip_conv_BIT_EXTRACT_702_34 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_702_33 = tmp_codasip_conv_BIT_EXTRACT_702_34[10];
    assign tmp_codasip_conv_BIT_EXTRACT_706_36 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_706_35 = tmp_codasip_conv_BIT_EXTRACT_706_36[9];
    assign tmp_codasip_conv_BIT_EXTRACT_710_38 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_710_37 = tmp_codasip_conv_BIT_EXTRACT_710_38[8];
    assign tmp_codasip_conv_BIT_EXTRACT_714_40 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_714_39 = tmp_codasip_conv_BIT_EXTRACT_714_40[7];
    assign tmp_codasip_conv_BIT_EXTRACT_718_42 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_718_41 = tmp_codasip_conv_BIT_EXTRACT_718_42[6];
    assign tmp_codasip_conv_BIT_EXTRACT_722_44 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_722_43 = tmp_codasip_conv_BIT_EXTRACT_722_44[5];
    assign tmp_codasip_conv_BIT_EXTRACT_726_46 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_726_45 = tmp_codasip_conv_BIT_EXTRACT_726_46[4];
    assign tmp_codasip_conv_BIT_EXTRACT_730_48 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_730_47 = tmp_codasip_conv_BIT_EXTRACT_730_48[3];
    assign tmp_codasip_conv_BIT_EXTRACT_734_50 = unsigned'(r_postnorm_res_fract_Q[26:0]);
    assign tmp_codasip_conv_BIT_EXTRACT_734_49 = tmp_codasip_conv_BIT_EXTRACT_734_50[2];
    // data-path code:
    assign denom_a_B0B0 = s_properties_i_Q[8];
    assign denom_b_B0B0 = s_properties_i_Q[7];
    assign exp_a_B0B0 = s_srcA_i_Q[30:23];
    assign exp_b_B0B0 = s_srcB_i_Q[30:23];
    assign fract_a_ext_B0B0 = {(!denom_a_B0B0), s_srcA_i_Q[22:0], 3'h0};
    assign fract_b_ext_B0B0 = {(!denom_b_B0B0), s_srcB_i_Q[22:0], 3'h0};
    assign exp_a_low_b_B0B0 = (exp_a_B0B0 < exp_b_B0B0);
    assign fract_lower_ext_B0B0 = ((exp_a_low_b_B0B0) ? fract_a_ext_B0B0 : fract_b_ext_B0B0);
    assign rzeros_tmp_B0B0 = (((codasip_tmp_var_13[0] != 1'b0)) ? 6'h00 : (((codasip_tmp_var_13[1] != 1'b0)) ? 6'h01 : (((codasip_tmp_var_13[2] != 1'b0)) ? 6'h02 : (((codasip_tmp_var_13[3] != 1'b0)) ? 6'h03 : (((codasip_tmp_var_13[4] != 1'b0)) ? 6'h04 : (((codasip_tmp_var_13[5] != 1'b0)) ? 6'h05 : (((codasip_tmp_var_13[6] != 1'b0)) ? 6'h06 : (((codasip_tmp_var_13[7] != 1'b0)) ? 6'h07 : (((codasip_tmp_var_13[8] != 1'b0)) ? 6'h08 : (((codasip_tmp_var_13[9] != 1'b0)) ? 6'h09 : (((codasip_tmp_var_13[10] != 1'b0)) ? 6'h0a : (((codasip_tmp_var_13[11] != 1'b0)) ? 6'h0b : (((codasip_tmp_var_13[12] != 1'b0)) ? 6'h0c : (((codasip_tmp_var_13[13] != 1'b0)) ? 6'h0d : (((codasip_tmp_var_13[14] != 1'b0)) ? 6'h0e : (((codasip_tmp_var_13[15] != 1'b0)) ? 6'h0f : (((codasip_tmp_var_13[16] != 1'b0)) ? 6'h10 : (((codasip_tmp_var_13[17] != 1'b0)) ? 6'h11 : (((codasip_tmp_var_13[18] != 1'b0)) ? 6'h12 : (((codasip_tmp_var_13[19] != 1'b0)) ? 6'h13 : (((codasip_tmp_var_13[20] != 1'b0)) ? 6'h14 : (((codasip_tmp_var_13[21] != 1'b0)) ? 6'h15 : (((codasip_tmp_var_13[22] != 1'b0)) ? 6'h16 : (((codasip_tmp_var_13[23] != 1'b0)) ? 6'h17 : 6'h18))))))))))))))))))))))));
    assign codasip_tmp_var_13 = fract_lower_ext_B0B0[26:3];
    assign rzeros_B0B0 = (rzeros_tmp_B0B0 + 6'h03);
    assign exp_lower_B0B0 = ((exp_a_low_b_B0B0) ? exp_a_B0B0 : exp_b_B0B0);
    assign exp_bigger_B0B0 = ((exp_a_low_b_B0B0) ? exp_b_B0B0 : exp_a_B0B0);
    assign exp_diff_B0B0 = (exp_bigger_B0B0 - (exp_lower_B0B0 + 8'(unsigned'(1'((denom_a_B0B0 ^ denom_b_B0B0))))));
    assign fract_shift_ext_B0B0 = (fract_lower_ext_B0B0 >> exp_diff_B0B0);
    assign sticky_B0B0 = ((exp_diff_B0B0 > 8'(rzeros_B0B0)) && (rzeros_B0B0 != 6'h1b));
    assign codasip_tmp_var_0 = s_start_i_Q;
    assign r_compute_sub_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_compute_sub_D = (s_op_i_Q == 6'h01);
    assign r_compute_exp_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_compute_exp_D = ((exp_a_low_b_B0B0) ? exp_b_B0B0 : exp_a_B0B0);
    assign r_compute_fract_a_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_compute_fract_a_D = (((!exp_a_low_b_B0B0)) ? fract_a_ext_B0B0 : {fract_shift_ext_B0B0[26:1], (sticky_B0B0 | fract_shift_ext_B0B0[0])});
    assign r_compute_fract_b_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_compute_fract_b_D = ((exp_a_low_b_B0B0) ? fract_b_ext_B0B0 : {fract_shift_ext_B0B0[26:1], (sticky_B0B0 | fract_shift_ext_B0B0[0])});
    assign r_compute_ROB_ptr_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_compute_ROB_ptr_D = s_ROB_ptr_i_Q;
    assign r_compute_rm_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_compute_rm_D = s_rm_i_Q;
    assign r_compute_properties_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_compute_properties_D = s_properties_i_Q;
    assign sign_A_B0B1 = r_compute_properties_Q[1];
    assign sing_B_B0B1 = r_compute_properties_Q[0];
    assign rm_B0B1 = r_compute_rm_Q;
    assign adding_B0B1 = (((!r_compute_sub_Q) && (!(sign_A_B0B1 ^ sing_B_B0B1))) || (r_compute_sub_Q && (sign_A_B0B1 ^ sing_B_B0B1)));
    assign a_low_b_B0B1 = (r_compute_fract_a_Q < r_compute_fract_b_Q);
    assign a_eq_b_B0B1 = (r_compute_fract_a_Q == r_compute_fract_b_Q);
    assign fract_bigger_B0B1 = ((a_low_b_B0B1) ? 28'(r_compute_fract_b_Q) : 28'(r_compute_fract_a_Q));
    assign fract_lower_B0B1 = ((a_low_b_B0B1) ? 28'(r_compute_fract_a_Q) : 28'(r_compute_fract_b_Q));
    assign res_fract_B0B1 = ((adding_B0B1) ? (28'(r_compute_fract_a_Q) + 28'(r_compute_fract_b_Q)) : (fract_bigger_B0B1 - fract_lower_B0B1));
    assign sign_res_B0B1 = (((((!a_eq_b_B0B1) || adding_B0B1)) ? 128'(unsigned'(1'((((((!sign_A_B0B1) && a_low_b_B0B1) && (r_compute_sub_Q ^ sing_B_B0B1)) | (sign_A_B0B1 && (r_compute_sub_Q ^ sing_B_B0B1))) | (sign_A_B0B1 && (!a_low_b_B0B1)))))) : (((rm_B0B1 == 3'h2)) ? 128'h00000000000000000000000000000001 : {128{1'b0}})) != {128{1'b0}});
    assign r_postnorm_sub_D = r_compute_sub_Q;
    assign r_postnorm_exp_D = r_compute_exp_Q;
    assign r_postnorm_sign_res_D = sign_res_B0B1;
    assign r_postnorm_res_fract_D = res_fract_B0B1;
    assign r_postnorm_ROB_ptr_D = r_compute_ROB_ptr_Q;
    assign r_postnorm_properties_D = r_compute_properties_Q;
    assign r_postnorm_rm_D = r_compute_rm_Q;
    assign shift_right_B0B2 = r_postnorm_res_fract_Q[27];
    assign shift_left_B0B2 = ((r_postnorm_exp_Q != 8'h00) && (r_postnorm_res_fract_Q[27:26] == 2'h0));
    assign zeros_B0B2 = 6'(unsigned'(5'(((tmp_codasip_conv_BIT_EXTRACT_638_1) ? 5'h00 : ((tmp_codasip_conv_BIT_EXTRACT_642_3) ? 5'h01 : ((tmp_codasip_conv_BIT_EXTRACT_646_5) ? 5'h02 : ((tmp_codasip_conv_BIT_EXTRACT_650_7) ? 5'h03 : ((tmp_codasip_conv_BIT_EXTRACT_654_9) ? 5'h04 : ((tmp_codasip_conv_BIT_EXTRACT_658_11) ? 5'h05 : ((tmp_codasip_conv_BIT_EXTRACT_662_13) ? 5'h06 : ((tmp_codasip_conv_BIT_EXTRACT_666_15) ? 5'h07 : ((tmp_codasip_conv_BIT_EXTRACT_670_17) ? 5'h08 : ((tmp_codasip_conv_BIT_EXTRACT_674_19) ? 5'h09 : ((tmp_codasip_conv_BIT_EXTRACT_678_21) ? 5'h0a : ((tmp_codasip_conv_BIT_EXTRACT_682_23) ? 5'h0b : ((tmp_codasip_conv_BIT_EXTRACT_686_25) ? 5'h0c : ((tmp_codasip_conv_BIT_EXTRACT_690_27) ? 5'h0d : ((tmp_codasip_conv_BIT_EXTRACT_694_29) ? 5'h0e : ((tmp_codasip_conv_BIT_EXTRACT_698_31) ? 5'h0f : ((tmp_codasip_conv_BIT_EXTRACT_702_33) ? 5'h10 : ((tmp_codasip_conv_BIT_EXTRACT_706_35) ? 5'h11 : ((tmp_codasip_conv_BIT_EXTRACT_710_37) ? 5'h12 : ((tmp_codasip_conv_BIT_EXTRACT_714_39) ? 5'h13 : ((tmp_codasip_conv_BIT_EXTRACT_718_41) ? 5'h14 : ((tmp_codasip_conv_BIT_EXTRACT_722_43) ? 5'h15 : ((tmp_codasip_conv_BIT_EXTRACT_726_45) ? 5'h16 : ((tmp_codasip_conv_BIT_EXTRACT_730_47) ? 5'h17 : ((tmp_codasip_conv_BIT_EXTRACT_734_49) ? 5'h18 : 5'h1b))))))))))))))))))))))))))));
    assign codasip_tmp_var_1 = shift_right_B0B2;
    assign codasip_tmp_var_2 = (!codasip_tmp_var_1) ? shift_left_B0B2 : 1'b0;
    assign codasip_tmp_var_3 = codasip_tmp_var_2 ? (r_postnorm_exp_Q > 8'(zeros_B0B2)) : 1'b0;
    assign exp_rot_B0B2 = codasip_tmp_var_1 ? (9'(r_postnorm_exp_Q) + 9'h001) :
        codasip_tmp_var_3 ? (9'(r_postnorm_exp_Q) - 9'(zeros_B0B2)) :
        codasip_tmp_var_2 ? 9'h000 : 9'(r_postnorm_exp_Q);
    assign fract_rot_B0B2 = codasip_tmp_var_1 ? r_postnorm_res_fract_Q[27:1] :
        codasip_tmp_var_3 ? (r_postnorm_res_fract_Q[26:0] << zeros_B0B2) :
        codasip_tmp_var_2 ? (r_postnorm_res_fract_Q[26:0] << (32'(r_postnorm_exp_Q) - 32'h00000001)) : r_postnorm_res_fract_Q[26:0];
    assign exp_B0B2 = ((exp_rot_B0B2[8]) ? 8'hff : (((fract_rot_B0B2[26] == 1'b0)) ? 8'h00 : exp_rot_B0B2[7:0]));
    assign sticky_B0B2 = ((shift_right_B0B2 & r_postnorm_res_fract_Q[0]) | fract_rot_B0B2[0]);
    assign r_rounding_sub_D = r_postnorm_sub_Q;
    assign r_rounding_sign_res_D = r_postnorm_sign_res_Q;
    assign r_rounding_fract_1sh_D = {fract_rot_B0B2[26:1], sticky_B0B2};
    assign r_rounding_exp_1sh_D = exp_B0B2;
    assign r_rounding_ROB_ptr_D = r_postnorm_ROB_ptr_Q;
    assign r_rounding_properties_D = r_postnorm_properties_Q;
    assign r_rounding_rm_D = r_postnorm_rm_Q;
    assign sign_B_B0B3 = r_rounding_properties_Q[0];
    assign sign_A_B0B3 = r_rounding_properties_Q[1];
    assign inf_B0B3 = r_rounding_properties_Q[2];
    assign nan_B0B3 = r_rounding_properties_Q[3];
    assign snan_B0B3 = r_rounding_properties_Q[4];
    assign inf_B_B0B3 = r_rounding_properties_Q[5];
    assign inf_A_B0B3 = r_rounding_properties_Q[6];
    assign rm_B0B3 = r_rounding_rm_Q;
    assign roundup_B0B3 = ((((rm_B0B3 == 3'h0)) ? 32'(unsigned'(1'((r_rounding_fract_1sh_Q[2] & ((r_rounding_fract_1sh_Q[1] | r_rounding_fract_1sh_Q[0]) | r_rounding_fract_1sh_Q[3]))))) : (((rm_B0B3 == 3'h3)) ? 32'(unsigned'(1'((((r_rounding_fract_1sh_Q[2] | r_rounding_fract_1sh_Q[1]) | r_rounding_fract_1sh_Q[0]) & (~r_rounding_sign_res_Q))))) : (((rm_B0B3 == 3'h2)) ? 32'(unsigned'(1'((((r_rounding_fract_1sh_Q[2] | r_rounding_fract_1sh_Q[1]) | r_rounding_fract_1sh_Q[0]) & r_rounding_sign_res_Q)))) : (((rm_B0B3 == 3'h4)) ? 32'(r_rounding_fract_1sh_Q[2]) : 32'h00000000)))) != 32'h00000000);
    assign fract_round_B0B3 = (28'(r_rounding_fract_1sh_Q) + 28'(unsigned'(4'({roundup_B0B3, 3'h0}))));
    assign shift_right_round_B0B3 = fract_round_B0B3[27];
    assign round1_fract_round_B0B3 = fract_round_B0B3[26];
    assign codasip_tmp_var_4 = shift_right_round_B0B3;
    assign codasip_tmp_var_5 = (!codasip_tmp_var_4) ? (round1_fract_round_B0B3 && (r_rounding_exp_1sh_Q == 8'h00)) : 1'b0;
    assign codasip_tmp_var_6 = ((!codasip_tmp_var_5) && (!codasip_tmp_var_4)) ? ((round1_fract_round_B0B3 == 1'b0) && (r_rounding_exp_1sh_Q == 8'h01)) : 1'b0;
    assign exp_ext_round_B0B3 = codasip_tmp_var_4 ? 8'((9'(r_rounding_exp_1sh_Q) + 9'h001)) :
        codasip_tmp_var_5 ? 8'h01 :
        codasip_tmp_var_6 ? 8'h00 : 8'(9'(r_rounding_exp_1sh_Q));
    assign fract_round_rot_B0B3 = codasip_tmp_var_4 ? (fract_round_B0B3 >> 32'sh00000001) : fract_round_B0B3;
    assign nan_op_B0B3 = ((inf_A_B0B3 && inf_B_B0B3) && ((sign_A_B0B3 ^ sign_B_B0B3) ^ r_rounding_sub_Q));
    assign overflow_B0B3 = (((exp_ext_round_B0B3 >= 8'hff) && (!inf_B0B3)) && (!nan_B0B3));
    assign lost_B0B3 = ((((shift_right_round_B0B3 && fract_round_B0B3[0]) || fract_round_rot_B0B3[2]) || fract_round_rot_B0B3[1]) || fract_round_rot_B0B3[0]);
    assign inexact_B0B3 = (((overflow_B0B3 || lost_B0B3) && (!inf_B0B3)) && (!nan_B0B3));
    assign invalid_B0B3 = (nan_op_B0B3 || snan_B0B3);
    assign codasip_tmp_var_7 = (nan_B0B3 || nan_op_B0B3);
    assign codasip_tmp_var_8 = (!codasip_tmp_var_7) ? inf_B0B3 : 1'b0;
    assign sign_inf_B0B3B3B0 = codasip_tmp_var_8 ? ((nan_op_B0B3 || (inf_A_B0B3 && sign_A_B0B3)) || (inf_B_B0B3 && (sign_B_B0B3 ^ r_rounding_sub_Q))) : 1'b0;
    assign codasip_tmp_var_9 = ((!codasip_tmp_var_8) && (!codasip_tmp_var_7)) ? overflow_B0B3 : 1'b0;
    assign codasip_tmp_var_10 = codasip_tmp_var_9 ? (r_rounding_sign_res_Q && ((rm_B0B3 == 3'h3) || (rm_B0B3 == 3'h1))) : 1'b0;
    assign codasip_tmp_var_11 = ((!codasip_tmp_var_10) && codasip_tmp_var_9) ? ((!r_rounding_sign_res_Q) && ((rm_B0B3 == 3'h2) || (rm_B0B3 == 3'h1))) : 1'b0;
    assign codasip_tmp_var_12 = (((!codasip_tmp_var_9) && (!codasip_tmp_var_8)) && (!codasip_tmp_var_7)) ? (fract_round_rot_B0B3 == 28'h0000000) : 1'b0;
    assign res_B0B3 = codasip_tmp_var_7 ? 32'h7fc00000 :
        codasip_tmp_var_8 ? {sign_inf_B0B3B3B0, 31'h7f800000} :
        codasip_tmp_var_10 ? 32'hff7fffff :
        codasip_tmp_var_11 ? 32'h7f7fffff :
        codasip_tmp_var_9 ? {r_rounding_sign_res_Q, 31'h7f800000} :
        codasip_tmp_var_12 ? {r_rounding_sign_res_Q, 31'h00000000} : {r_rounding_sign_res_Q, exp_ext_round_B0B3, fract_round_rot_B0B3[25:3]};
    assign r_postnorm_ROB_ptr_WE = 1'b1;
    assign r_postnorm_exp_WE = 1'b1;
    assign r_postnorm_properties_WE = 1'b1;
    assign r_postnorm_res_fract_WE = 1'b1;
    assign r_postnorm_rm_WE = 1'b1;
    assign r_postnorm_sign_res_WE = 1'b1;
    assign r_postnorm_sub_WE = 1'b1;
    assign r_rounding_ROB_ptr_WE = 1'b1;
    assign r_rounding_exp_1sh_WE = 1'b1;
    assign r_rounding_fract_1sh_WE = 1'b1;
    assign r_rounding_properties_WE = 1'b1;
    assign r_rounding_rm_WE = 1'b1;
    assign r_rounding_sign_res_WE = 1'b1;
    assign r_rounding_sub_WE = 1'b1;
    assign r_compute_fin_D = s_start_i_Q;
    assign r_compute_fin_WE = 1'b1;
    assign r_postnorm_fin_D = r_compute_fin_Q;
    assign r_postnorm_fin_WE = 1'b1;
    assign r_rounding_fin_D = r_postnorm_fin_Q;
    assign r_rounding_fin_WE = 1'b1;
    assign s_done_o_D = r_rounding_fin_Q;
    assign s_flags_o_D = {invalid_B0B3, 1'b0, overflow_B0B3, 1'b0, inexact_B0B3};
    assign s_result_o_D = res_B0B3;
    assign s_ROB_ptr_o_D = r_rounding_ROB_ptr_Q;
endmodule: codix_berkelium_ca_core_execute_stage_fpu_add_sub_compute_add_sub_t
