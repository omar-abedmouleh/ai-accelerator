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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_sqrt_div_compute_sqrt_div_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_fpu_sqrt_div_compute_sqrt_div_t(
    input  logic [5:0] r_cnt_val_Q,
    input  logic r_computing_Q,
    input  logic r_div_en_Q,
    input  logic r_div_zero_Q,
    input  logic [52:0] r_divident_A_Q,
    input  logic [53:0] r_divison_B_Q,
    input  logic [11:0] r_exp_A_Q,
    input  logic [11:0] r_exp_B_Q,
    input  logic [10:0] r_exp_norm_res_Q,
    input  logic [12:0] r_exp_result_prenorm_Q,
    input  logic r_inf_A_Q,
    input  logic r_inf_B_Q,
    input  logic r_invalid_Q,
    input  logic [57:0] r_Iteration1_sum_Q,
    input  logic [57:0] r_Iteration2_sum_Q,
    input  logic [53:0] r_mant_sqrt_norm_Q,
    input  logic [1:0] r_mantissa_lower_part_Q,
    input  logic r_mantissa_sticky_bit_Q,
    input  logic [52:0] r_mantissa_upper_part_Q,
    input  logic r_nan_A_Q,
    input  logic r_nan_B_Q,
    input  logic r_overflow_Q,
    input  logic [57:0] r_partial_remainder_Q,
    input  logic [52:0] r_prenorm_fract_B_Q,
    input  logic [56:0] r_quotient_32_Q,
    input  logic [56:0] r_quotient_Q,
    input  logic r_remainder_en_Q,
    input  logic [56:0] r_remainder_shift_Q,
    input  logic [56:0] r_result_man_shift_Q,
    input  logic [4:0] r_ROB_ptr_work_Q,
    input  logic [2:0] r_round_mode_fin_Q,
    input  logic [2:0] r_round_mode_Q,
    input  logic r_same_number_Q,
    input  logic r_sign_bit_fin_Q,
    input  logic r_sign_bit_Q,
    input  logic r_sign_res_Q,
    input  logic r_snan_Q,
    input  logic r_sqr_div_done_post_norm_Q,
    input  logic r_sqr_div_done_round_Q,
    input  logic [4:0] r_sqr_div_rob_post_norm_Q,
    input  logic [4:0] r_sqr_div_rob_round_Q,
    input  logic r_sqrt_en_Q,
    input  logic r_sticky_rem_Q,
    input  logic r_tiny_Q,
    input  logic r_zero_A_Q,
    input  logic r_zero_B_Q,
    input  logic s_done_o_Q,
    input  logic [5:0] s_op_i_Q,
    input  logic [9:0] s_properties_i_Q,
    input  logic [2:0] s_rm_i_Q,
    input  logic [4:0] s_ROB_ptr_i_Q,
    input  logic s_sqr_div_done_comp_Q,
    input  logic [31:0] s_srcA_i_Q,
    input  logic [31:0] s_srcB_i_Q,
    input  logic s_start_i_Q,
    input  logic sqrt_div_busy_Q,
    output logic [5:0] r_cnt_val_D,
    output logic r_cnt_val_WE,
    output logic r_computing_D,
    output logic r_computing_WE,
    output logic r_div_en_D,
    output logic r_div_en_WE,
    output logic r_div_zero_D,
    output logic r_div_zero_WE,
    output logic [52:0] r_divident_A_D,
    output logic r_divident_A_WE,
    output logic [53:0] r_divison_B_D,
    output logic r_divison_B_WE,
    output logic [11:0] r_exp_A_D,
    output logic r_exp_A_WE,
    output logic [11:0] r_exp_B_D,
    output logic r_exp_B_WE,
    output logic [10:0] r_exp_norm_res_D,
    output logic r_exp_norm_res_WE,
    output logic [12:0] r_exp_result_prenorm_D,
    output logic r_exp_result_prenorm_WE,
    output logic r_inf_A_D,
    output logic r_inf_A_WE,
    output logic r_inf_B_D,
    output logic r_inf_B_WE,
    output logic r_invalid_D,
    output logic r_invalid_WE,
    output logic [57:0] r_Iteration1_sum_D,
    output logic r_Iteration1_sum_WE,
    output logic [57:0] r_Iteration2_sum_D,
    output logic r_Iteration2_sum_WE,
    output logic [53:0] r_mant_sqrt_norm_D,
    output logic r_mant_sqrt_norm_WE,
    output logic [1:0] r_mantissa_lower_part_D,
    output logic r_mantissa_lower_part_WE,
    output logic r_mantissa_sticky_bit_D,
    output logic r_mantissa_sticky_bit_WE,
    output logic [52:0] r_mantissa_upper_part_D,
    output logic r_mantissa_upper_part_WE,
    output logic r_nan_A_D,
    output logic r_nan_A_WE,
    output logic r_nan_B_D,
    output logic r_nan_B_WE,
    output logic r_overflow_D,
    output logic r_overflow_WE,
    output logic [57:0] r_partial_remainder_D,
    output logic r_partial_remainder_WE,
    output logic [52:0] r_prenorm_fract_B_D,
    output logic r_prenorm_fract_B_WE,
    output logic [56:0] r_quotient_32_D,
    output logic r_quotient_32_WE,
    output logic [56:0] r_quotient_D,
    output logic r_quotient_WE,
    output logic r_remainder_en_D,
    output logic r_remainder_en_WE,
    output logic [56:0] r_remainder_shift_D,
    output logic r_remainder_shift_WE,
    output logic [56:0] r_result_man_shift_D,
    output logic r_result_man_shift_WE,
    output logic [4:0] r_ROB_ptr_work_D,
    output logic r_ROB_ptr_work_WE,
    output logic [2:0] r_round_mode_D,
    output logic [2:0] r_round_mode_fin_D,
    output logic r_round_mode_fin_WE,
    output logic r_round_mode_WE,
    output logic r_same_number_D,
    output logic r_same_number_WE,
    output logic r_sign_bit_D,
    output logic r_sign_bit_fin_D,
    output logic r_sign_bit_fin_WE,
    output logic r_sign_bit_WE,
    output logic r_sign_res_D,
    output logic r_sign_res_WE,
    output logic r_snan_D,
    output logic r_snan_WE,
    output logic r_sqr_div_done_post_norm_D,
    output logic r_sqr_div_done_post_norm_WE,
    output logic r_sqr_div_done_round_D,
    output logic r_sqr_div_done_round_WE,
    output logic [4:0] r_sqr_div_rob_post_norm_D,
    output logic r_sqr_div_rob_post_norm_WE,
    output logic [4:0] r_sqr_div_rob_round_D,
    output logic r_sqr_div_rob_round_WE,
    output logic r_sqrt_en_D,
    output logic r_sqrt_en_WE,
    output logic r_sticky_rem_D,
    output logic r_sticky_rem_WE,
    output logic r_tiny_D,
    output logic r_tiny_WE,
    output logic r_zero_A_D,
    output logic r_zero_A_WE,
    output logic r_zero_B_D,
    output logic r_zero_B_WE,
    output logic s_busy_o_D,
    output logic s_done_o_D,
    output logic [4:0] s_flags_o_D,
    output logic s_ready_o_D,
    output logic [31:0] s_result_o_D,
    output logic [4:0] s_ROB_ptr_o_D,
    output logic s_sqr_div_done_comp_D,
    output logic sqrt_div_busy_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic [60:0] codasip_return2_iteration_div_sqrt_inline_1_inline_1;
    // signal/wire
    logic [60:0] codasip_return2_iteration_div_sqrt_inline_2_inline_1;
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
    logic [5:0] codasip_tmp_var_2;
    // signal/wire
    logic codasip_tmp_var_20;
    // signal/wire
    logic codasip_tmp_var_21;
    // signal/wire
    logic codasip_tmp_var_22;
    // signal/wire
    logic codasip_tmp_var_23;
    // signal/wire
    logic codasip_tmp_var_24;
    // signal/wire
    logic codasip_tmp_var_25;
    // signal/wire
    logic codasip_tmp_var_26;
    // signal/wire
    logic [2:0] codasip_tmp_var_27;
    // signal/wire
    logic [52:0] codasip_tmp_var_28;
    // signal/wire
    logic [52:0] codasip_tmp_var_29;
    // signal/wire
    logic [5:0] codasip_tmp_var_3;
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
    logic [4:0] cycle_val_B0B2;
    // signal/wire
    logic [53:0] divident_A_B0B0;
    // signal/wire
    logic [57:0] division_format_B0B1;
    // signal/wire
    logic [12:0] exp_add_a_B0B1;
    // signal/wire
    logic [12:0] exp_add_b_B0B1;
    // signal/wire
    logic [12:0] exp_add_c_B0B1;
    // signal/wire
    logic [10:0] exp_res_B0B3;
    // signal/wire
    logic [12:0] exp_saturate_B0B2;
    // signal/wire
    logic [10:0] exponent_A_B0B0;
    // signal/wire
    logic [10:0] exponent_B_B0B0;
    // signal/wire
    logic [57:0] first_iteration_A_B0B1;
    // signal/wire
    logic [57:0] first_iteration_B_B0B1;
    // signal/wire
    logic [57:0] first_iteration_fract_a_B0B1;
    // signal/wire
    logic [57:0] first_iteration_fract_b_B0B1;
    // signal/wire
    logic [6:0] height_one_B0B1;
    // signal/wire
    logic hidden_a_B0B0;
    // signal/wire
    logic hidden_b_B0B0;
    // signal/wire
    logic leading_or_A_B0B0;
    // signal/wire
    logic leading_or_B_B0B0;
    // signal/wire
    logic [6:0] lzeros_a_B0B0;
    // signal/wire
    logic [6:0] lzeros_a_tmp_B0B0;
    // signal/wire
    logic [6:0] lzeros_b_B0B0;
    // signal/wire
    logic [6:0] lzeros_b_tmp_B0B0;
    // signal/wire
    logic [51:0] mantissa_A_B0B0;
    // signal/wire
    logic [56:0] mantissa_B0B2;
    // signal/wire
    logic [51:0] mantissa_B_B0B0;
    // signal/wire
    logic [56:0] mantissa_round_B0B2;
    // signal/wire
    logic [53:0] mantissa_round_res_B0B3;
    // signal/wire
    logic [56:0] mantissa_rounded_B0B3;
    // signal/wire
    logic [11:0] norm_exp_A_B0B0;
    // signal/wire
    logic [11:0] norm_exp_B_B0B0;
    // signal/wire
    logic [52:0] prenorm_fract_A_B0B0;
    // signal/wire
    logic [52:0] prenorm_fract_B_B0B0;
    // signal/wire
    logic [1:0] quotient_B0B1;
    // signal/wire
    logic [109:0] quotient_no_sticky_B0B2;
    // signal/wire
    logic quotient_sel1_B0B1;
    // signal/wire
    logic [52:0] result_mantissa_norm_B0B2;
    // CodAL signal/wire
    logic s_Iteration1_carry;
    // CodAL signal/wire
    logic [60:0] s_Iteration1_res;
    // CodAL signal/wire
    logic [1:0] s_Iteration1_sqrt_Do;
    // CodAL signal/wire
    logic [57:0] s_Iteration1_sum;
    // CodAL signal/wire
    logic s_Iteration2_carry;
    // CodAL signal/wire
    logic [60:0] s_Iteration2_res;
    // CodAL signal/wire
    logic [1:0] s_Iteration2_sqrt_Do;
    // CodAL signal/wire
    logic [57:0] s_Iteration2_sum;
    // CodAL signal/wire
    logic [57:0] s_Sqrt_Q0;
    // CodAL signal/wire
    logic [57:0] s_Sqrt_Q1;
    // CodAL signal/wire
    logic [57:0] s_Sqrt_R0;
    // CodAL signal/wire
    logic [57:0] s_Sqrt_R1;
    // CodAL signal/wire
    logic [57:0] s_Sqrt_R2;
    // CodAL signal/wire
    logic [1:0] s_cnt_0;
    // CodAL signal/wire
    logic [2:0] s_cnt_1;
    // CodAL signal/wire
    logic [20:0] s_cnt_10;
    // CodAL signal/wire
    logic [22:0] s_cnt_11;
    // CodAL signal/wire
    logic [24:0] s_cnt_12;
    // CodAL signal/wire
    logic [26:0] s_cnt_13;
    // CodAL signal/wire
    logic [4:0] s_cnt_2;
    // CodAL signal/wire
    logic [6:0] s_cnt_3;
    // CodAL signal/wire
    logic [8:0] s_cnt_4;
    // CodAL signal/wire
    logic [10:0] s_cnt_5;
    // CodAL signal/wire
    logic [12:0] s_cnt_6;
    // CodAL signal/wire
    logic [14:0] s_cnt_7;
    // CodAL signal/wire
    logic [16:0] s_cnt_8;
    // CodAL signal/wire
    logic [18:0] s_cnt_9;
    // CodAL signal/wire
    logic s_inexact;
    // CodAL signal/wire
    logic s_mantissa_roundup;
    // CodAL signal/wire
    logic [109:0] s_quotient_pom;
    // signal/wire
    logic s_sqr_div_done_comp_D_ACT_wire;
    // CodAL signal/wire
    logic [57:0] s_sqrt1;
    // CodAL signal/wire
    logic [1:0] s_sqrt_D0;
    // CodAL signal/wire
    logic [1:0] s_sqrt_D1;
    // CodAL signal/wire
    logic s_underflow;
    // signal/wire
    logic [57:0] second_iteration_A_B0B1;
    // signal/wire
    logic [57:0] second_iteration_B_B0B1;
    // signal/wire
    logic [57:0] second_iteration_fract_a_B0B1;
    // signal/wire
    logic [57:0] second_iteration_fract_b_B0B1;
    // signal/wire
    logic sel_b_first_B0B1;
    // signal/wire
    logic sel_b_second_B0B1;
    // signal/wire
    logic [6:0] shift1_B0B1B0B28;
    // signal/wire
    logic [6:0] shift2_B0B1B0B28;
    // signal/wire
    logic [12:0] shift_amount_B0B2;
    // signal/wire
    logic [12:0] shift_amount_no_sat_B0B2;
    // signal/wire
    logic shifted_out_B0B2;
    // signal/wire
    logic sign_A_B0B0;
    // signal/wire
    logic sign_B_B0B0;
    // signal/wire
    logic [57:0] sqrt_com_B0B1;
    // signal/wire
    logic sqrt_div_busy_D_ACT_wire;

    // additional declarations:
    logic iteration_div_sqrt_inline_1_inline_1_ACT;
    logic [57:0] iteration_div_sqrt_inline_1_inline_1_codasip_param_0;
    logic [57:0] iteration_div_sqrt_inline_1_inline_1_codasip_param_1;
    logic iteration_div_sqrt_inline_1_inline_1_codasip_param_2;
    logic iteration_div_sqrt_inline_1_inline_1_codasip_param_3;
    logic [1:0] iteration_div_sqrt_inline_1_inline_1_codasip_param_4;
    logic [60:0] iteration_div_sqrt_inline_1_inline_1_RET;
    logic iteration_div_sqrt_inline_2_inline_1_ACT;
    logic [57:0] iteration_div_sqrt_inline_2_inline_1_codasip_param_0;
    logic [57:0] iteration_div_sqrt_inline_2_inline_1_codasip_param_1;
    logic iteration_div_sqrt_inline_2_inline_1_codasip_param_2;
    logic iteration_div_sqrt_inline_2_inline_1_codasip_param_3;
    logic [1:0] iteration_div_sqrt_inline_2_inline_1_codasip_param_4;
    logic [60:0] iteration_div_sqrt_inline_2_inline_1_RET;
    logic [27:0] tmp_codasip_conv_BIT_CONCATENATE_2522_1;
    logic [56:0] tmp_codasip_conv_BIT_CONCATENATE_2522_2;

    // child instances inside functional unit:
    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_fpu_sqrt_div_iteration_div_sqrt_t iteration_div_sqrt_inline_1_inline_1 (
        .ACT(iteration_div_sqrt_inline_1_inline_1_ACT),
        .codasip_param_0(iteration_div_sqrt_inline_1_inline_1_codasip_param_0),
        .codasip_param_1(iteration_div_sqrt_inline_1_inline_1_codasip_param_1),
        .codasip_param_2(iteration_div_sqrt_inline_1_inline_1_codasip_param_2),
        .codasip_param_3(iteration_div_sqrt_inline_1_inline_1_codasip_param_3),
        .codasip_param_4(iteration_div_sqrt_inline_1_inline_1_codasip_param_4),
        .RET(iteration_div_sqrt_inline_1_inline_1_RET)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_fpu_sqrt_div_iteration_div_sqrt_t iteration_div_sqrt_inline_2_inline_1 (
        .ACT(iteration_div_sqrt_inline_2_inline_1_ACT),
        .codasip_param_0(iteration_div_sqrt_inline_2_inline_1_codasip_param_0),
        .codasip_param_1(iteration_div_sqrt_inline_2_inline_1_codasip_param_1),
        .codasip_param_2(iteration_div_sqrt_inline_2_inline_1_codasip_param_2),
        .codasip_param_3(iteration_div_sqrt_inline_2_inline_1_codasip_param_3),
        .codasip_param_4(iteration_div_sqrt_inline_2_inline_1_codasip_param_4),
        .RET(iteration_div_sqrt_inline_2_inline_1_RET)
    );

    // conversions for data-path:
    assign tmp_codasip_conv_BIT_CONCATENATE_2522_2 = unsigned'({r_quotient_Q[54:0], quotient_B0B1});
    assign tmp_codasip_conv_BIT_CONCATENATE_2522_1 = tmp_codasip_conv_BIT_CONCATENATE_2522_2[27:0];
    // data-path code:
    assign sign_A_B0B0 = s_srcA_i_Q[31];
    assign exponent_A_B0B0 = {3'h0, s_srcA_i_Q[30:23]};
    assign mantissa_A_B0B0 = {s_srcA_i_Q[22:0], 29'h00000000};
    assign sign_B_B0B0 = s_srcB_i_Q[31];
    assign exponent_B_B0B0 = {3'h0, s_srcB_i_Q[30:23]};
    assign mantissa_B_B0B0 = {s_srcB_i_Q[22:0], 29'h00000000};
    assign hidden_a_B0B0 = (~s_properties_i_Q[7]);
    assign hidden_b_B0B0 = (~s_properties_i_Q[6]);
    assign codasip_tmp_var_28 = {hidden_a_B0B0, mantissa_A_B0B0};
    assign lzeros_a_tmp_B0B0 = (((codasip_tmp_var_28[52] != 1'b0)) ? 7'h00 : (((codasip_tmp_var_28[51] != 1'b0)) ? 7'h01 : (((codasip_tmp_var_28[50] != 1'b0)) ? 7'h02 : (((codasip_tmp_var_28[49] != 1'b0)) ? 7'h03 : (((codasip_tmp_var_28[48] != 1'b0)) ? 7'h04 : (((codasip_tmp_var_28[47] != 1'b0)) ? 7'h05 : (((codasip_tmp_var_28[46] != 1'b0)) ? 7'h06 : (((codasip_tmp_var_28[45] != 1'b0)) ? 7'h07 : (((codasip_tmp_var_28[44] != 1'b0)) ? 7'h08 : (((codasip_tmp_var_28[43] != 1'b0)) ? 7'h09 : (((codasip_tmp_var_28[42] != 1'b0)) ? 7'h0a : (((codasip_tmp_var_28[41] != 1'b0)) ? 7'h0b : (((codasip_tmp_var_28[40] != 1'b0)) ? 7'h0c : (((codasip_tmp_var_28[39] != 1'b0)) ? 7'h0d : (((codasip_tmp_var_28[38] != 1'b0)) ? 7'h0e : (((codasip_tmp_var_28[37] != 1'b0)) ? 7'h0f : (((codasip_tmp_var_28[36] != 1'b0)) ? 7'h10 : (((codasip_tmp_var_28[35] != 1'b0)) ? 7'h11 : (((codasip_tmp_var_28[34] != 1'b0)) ? 7'h12 : (((codasip_tmp_var_28[33] != 1'b0)) ? 7'h13 : (((codasip_tmp_var_28[32] != 1'b0)) ? 7'h14 : (((codasip_tmp_var_28[31] != 1'b0)) ? 7'h15 : (((codasip_tmp_var_28[30] != 1'b0)) ? 7'h16 : (((codasip_tmp_var_28[29] != 1'b0)) ? 7'h17 : (((codasip_tmp_var_28[28] != 1'b0)) ? 7'h18 : (((codasip_tmp_var_28[27] != 1'b0)) ? 7'h19 : (((codasip_tmp_var_28[26] != 1'b0)) ? 7'h1a : (((codasip_tmp_var_28[25] != 1'b0)) ? 7'h1b : (((codasip_tmp_var_28[24] != 1'b0)) ? 7'h1c : (((codasip_tmp_var_28[23] != 1'b0)) ? 7'h1d : (((codasip_tmp_var_28[22] != 1'b0)) ? 7'h1e : (((codasip_tmp_var_28[21] != 1'b0)) ? 7'h1f : (((codasip_tmp_var_28[20] != 1'b0)) ? 7'h20 : (((codasip_tmp_var_28[19] != 1'b0)) ? 7'h21 : (((codasip_tmp_var_28[18] != 1'b0)) ? 7'h22 : (((codasip_tmp_var_28[17] != 1'b0)) ? 7'h23 : (((codasip_tmp_var_28[16] != 1'b0)) ? 7'h24 : (((codasip_tmp_var_28[15] != 1'b0)) ? 7'h25 : (((codasip_tmp_var_28[14] != 1'b0)) ? 7'h26 : (((codasip_tmp_var_28[13] != 1'b0)) ? 7'h27 : (((codasip_tmp_var_28[12] != 1'b0)) ? 7'h28 : (((codasip_tmp_var_28[11] != 1'b0)) ? 7'h29 : (((codasip_tmp_var_28[10] != 1'b0)) ? 7'h2a : (((codasip_tmp_var_28[9] != 1'b0)) ? 7'h2b : (((codasip_tmp_var_28[8] != 1'b0)) ? 7'h2c : (((codasip_tmp_var_28[7] != 1'b0)) ? 7'h2d : (((codasip_tmp_var_28[6] != 1'b0)) ? 7'h2e : (((codasip_tmp_var_28[5] != 1'b0)) ? 7'h2f : (((codasip_tmp_var_28[4] != 1'b0)) ? 7'h30 : (((codasip_tmp_var_28[3] != 1'b0)) ? 7'h31 : (((codasip_tmp_var_28[2] != 1'b0)) ? 7'h32 : (((codasip_tmp_var_28[1] != 1'b0)) ? 7'h33 : (((codasip_tmp_var_28[0] != 1'b0)) ? 7'h34 : 7'h35)))))))))))))))))))))))))))))))))))))))))))))))))))));
    assign codasip_tmp_var_29 = {hidden_b_B0B0, mantissa_B_B0B0};
    assign lzeros_b_tmp_B0B0 = (((codasip_tmp_var_29[52] != 1'b0)) ? 7'h00 : (((codasip_tmp_var_29[51] != 1'b0)) ? 7'h01 : (((codasip_tmp_var_29[50] != 1'b0)) ? 7'h02 : (((codasip_tmp_var_29[49] != 1'b0)) ? 7'h03 : (((codasip_tmp_var_29[48] != 1'b0)) ? 7'h04 : (((codasip_tmp_var_29[47] != 1'b0)) ? 7'h05 : (((codasip_tmp_var_29[46] != 1'b0)) ? 7'h06 : (((codasip_tmp_var_29[45] != 1'b0)) ? 7'h07 : (((codasip_tmp_var_29[44] != 1'b0)) ? 7'h08 : (((codasip_tmp_var_29[43] != 1'b0)) ? 7'h09 : (((codasip_tmp_var_29[42] != 1'b0)) ? 7'h0a : (((codasip_tmp_var_29[41] != 1'b0)) ? 7'h0b : (((codasip_tmp_var_29[40] != 1'b0)) ? 7'h0c : (((codasip_tmp_var_29[39] != 1'b0)) ? 7'h0d : (((codasip_tmp_var_29[38] != 1'b0)) ? 7'h0e : (((codasip_tmp_var_29[37] != 1'b0)) ? 7'h0f : (((codasip_tmp_var_29[36] != 1'b0)) ? 7'h10 : (((codasip_tmp_var_29[35] != 1'b0)) ? 7'h11 : (((codasip_tmp_var_29[34] != 1'b0)) ? 7'h12 : (((codasip_tmp_var_29[33] != 1'b0)) ? 7'h13 : (((codasip_tmp_var_29[32] != 1'b0)) ? 7'h14 : (((codasip_tmp_var_29[31] != 1'b0)) ? 7'h15 : (((codasip_tmp_var_29[30] != 1'b0)) ? 7'h16 : (((codasip_tmp_var_29[29] != 1'b0)) ? 7'h17 : (((codasip_tmp_var_29[28] != 1'b0)) ? 7'h18 : (((codasip_tmp_var_29[27] != 1'b0)) ? 7'h19 : (((codasip_tmp_var_29[26] != 1'b0)) ? 7'h1a : (((codasip_tmp_var_29[25] != 1'b0)) ? 7'h1b : (((codasip_tmp_var_29[24] != 1'b0)) ? 7'h1c : (((codasip_tmp_var_29[23] != 1'b0)) ? 7'h1d : (((codasip_tmp_var_29[22] != 1'b0)) ? 7'h1e : (((codasip_tmp_var_29[21] != 1'b0)) ? 7'h1f : (((codasip_tmp_var_29[20] != 1'b0)) ? 7'h20 : (((codasip_tmp_var_29[19] != 1'b0)) ? 7'h21 : (((codasip_tmp_var_29[18] != 1'b0)) ? 7'h22 : (((codasip_tmp_var_29[17] != 1'b0)) ? 7'h23 : (((codasip_tmp_var_29[16] != 1'b0)) ? 7'h24 : (((codasip_tmp_var_29[15] != 1'b0)) ? 7'h25 : (((codasip_tmp_var_29[14] != 1'b0)) ? 7'h26 : (((codasip_tmp_var_29[13] != 1'b0)) ? 7'h27 : (((codasip_tmp_var_29[12] != 1'b0)) ? 7'h28 : (((codasip_tmp_var_29[11] != 1'b0)) ? 7'h29 : (((codasip_tmp_var_29[10] != 1'b0)) ? 7'h2a : (((codasip_tmp_var_29[9] != 1'b0)) ? 7'h2b : (((codasip_tmp_var_29[8] != 1'b0)) ? 7'h2c : (((codasip_tmp_var_29[7] != 1'b0)) ? 7'h2d : (((codasip_tmp_var_29[6] != 1'b0)) ? 7'h2e : (((codasip_tmp_var_29[5] != 1'b0)) ? 7'h2f : (((codasip_tmp_var_29[4] != 1'b0)) ? 7'h30 : (((codasip_tmp_var_29[3] != 1'b0)) ? 7'h31 : (((codasip_tmp_var_29[2] != 1'b0)) ? 7'h32 : (((codasip_tmp_var_29[1] != 1'b0)) ? 7'h33 : (((codasip_tmp_var_29[0] != 1'b0)) ? 7'h34 : 7'h35)))))))))))))))))))))))))))))))))))))))))))))))))))));
    assign lzeros_a_B0B0 = (((lzeros_a_tmp_B0B0 == 7'h35)) ? 7'h38 : lzeros_a_tmp_B0B0);
    assign lzeros_b_B0B0 = (((lzeros_b_tmp_B0B0 == 7'h35)) ? 7'h38 : lzeros_b_tmp_B0B0);
    assign prenorm_fract_A_B0B0 = ({hidden_a_B0B0, mantissa_A_B0B0} << lzeros_a_B0B0);
    assign prenorm_fract_B_B0B0 = ({hidden_b_B0B0, mantissa_B_B0B0} << lzeros_b_B0B0);
    assign divident_A_B0B0 = {1'b0, prenorm_fract_A_B0B0};
    assign leading_or_A_B0B0 = ((((lzeros_a_B0B0[4] | lzeros_a_B0B0[3]) | lzeros_a_B0B0[2]) | lzeros_a_B0B0[1]) | lzeros_a_B0B0[0]);
    assign leading_or_B_B0B0 = ((((lzeros_b_B0B0[4] | lzeros_b_B0B0[3]) | lzeros_b_B0B0[2]) | lzeros_b_B0B0[1]) | lzeros_b_B0B0[0]);
    assign norm_exp_A_B0B0 = ((12'(exponent_A_B0B0) - 12'(lzeros_a_B0B0)) + 12'(leading_or_A_B0B0));
    assign norm_exp_B_B0B0 = ((12'(exponent_B_B0B0) - 12'(lzeros_b_B0B0)) + 12'(leading_or_B_B0B0));
    assign codasip_tmp_var_0 = s_start_i_Q;
    assign codasip_tmp_var_1 = r_computing_Q;
    assign codasip_tmp_var_2 = codasip_tmp_var_1 ? r_cnt_val_Q : 6'h00;
    assign sqrt_com_B0B1 = (codasip_tmp_var_2 == 6'h01) ? {29'h00000000, (~{27'h0000000, r_quotient_Q[1:0]})} :
        (codasip_tmp_var_2 == 6'h02) ? {29'h00000000, (~{25'h0000000, r_quotient_Q[3:0]})} :
        (codasip_tmp_var_2 == 6'h03) ? {29'h00000000, (~{23'h000000, r_quotient_Q[5:0]})} :
        (codasip_tmp_var_2 == 6'h04) ? {29'h00000000, (~{21'h000000, r_quotient_Q[7:0]})} :
        (codasip_tmp_var_2 == 6'h05) ? {29'h00000000, (~{19'h00000, r_quotient_Q[9:0]})} :
        (codasip_tmp_var_2 == 6'h06) ? {29'h00000000, (~{17'h00000, r_quotient_Q[11:0]})} :
        (codasip_tmp_var_2 == 6'h07) ? {29'h00000000, (~{15'h0000, r_quotient_Q[13:0]})} :
        (codasip_tmp_var_2 == 6'h08) ? {29'h00000000, (~{13'h0000, r_quotient_Q[15:0]})} :
        (codasip_tmp_var_2 == 6'h09) ? {29'h00000000, (~{11'h000, r_quotient_Q[17:0]})} :
        (codasip_tmp_var_2 == 6'h0a) ? {29'h00000000, (~{9'h000, r_quotient_Q[19:0]})} :
        (codasip_tmp_var_2 == 6'h0b) ? {29'h00000000, (~{7'h00, r_quotient_Q[21:0]})} :
        (codasip_tmp_var_2 == 6'h0c) ? {29'h00000000, (~{5'h00, r_quotient_Q[23:0]})} :
        (codasip_tmp_var_2 == 6'h0d) ? {29'h00000000, (~{3'h0, r_quotient_Q[25:0]})} : 58'h000000000000000;
    assign s_Sqrt_Q0 = ((codasip_tmp_var_2 == 6'h00) && codasip_tmp_var_1) ? 58'h00000001fffffff :
        (codasip_tmp_var_2 == 6'h01) ? ((r_quotient_Q[0]) ? sqrt_com_B0B1 : 58'(r_quotient_Q[1:0])) :
        (codasip_tmp_var_2 == 6'h02) ? ((r_quotient_Q[0]) ? sqrt_com_B0B1 : 58'(r_quotient_Q[3:0])) :
        (codasip_tmp_var_2 == 6'h03) ? ((r_quotient_Q[0]) ? sqrt_com_B0B1 : 58'(r_quotient_Q[5:0])) :
        (codasip_tmp_var_2 == 6'h04) ? ((r_quotient_Q[0]) ? sqrt_com_B0B1 : 58'(r_quotient_Q[7:0])) :
        (codasip_tmp_var_2 == 6'h05) ? ((r_quotient_Q[0]) ? sqrt_com_B0B1 : 58'(r_quotient_Q[9:0])) :
        (codasip_tmp_var_2 == 6'h06) ? ((r_quotient_Q[0]) ? sqrt_com_B0B1 : 58'(r_quotient_Q[11:0])) :
        (codasip_tmp_var_2 == 6'h07) ? ((r_quotient_Q[0]) ? sqrt_com_B0B1 : 58'(r_quotient_Q[13:0])) :
        (codasip_tmp_var_2 == 6'h08) ? ((r_quotient_Q[0]) ? sqrt_com_B0B1 : 58'(r_quotient_Q[15:0])) :
        (codasip_tmp_var_2 == 6'h09) ? ((r_quotient_Q[0]) ? sqrt_com_B0B1 : 58'(r_quotient_Q[17:0])) :
        (codasip_tmp_var_2 == 6'h0a) ? ((r_quotient_Q[0]) ? sqrt_com_B0B1 : 58'(r_quotient_Q[19:0])) :
        (codasip_tmp_var_2 == 6'h0b) ? ((r_quotient_Q[0]) ? sqrt_com_B0B1 : 58'(r_quotient_Q[21:0])) :
        (codasip_tmp_var_2 == 6'h0c) ? ((r_quotient_Q[0]) ? sqrt_com_B0B1 : 58'(r_quotient_Q[23:0])) :
        (codasip_tmp_var_2 == 6'h0d) ? ((r_quotient_Q[0]) ? sqrt_com_B0B1 : 58'(r_quotient_Q[25:0])) : 58'h000000000000000;
    assign s_sqrt_D0 = ((codasip_tmp_var_2 == 6'h00) && codasip_tmp_var_1) ? r_mant_sqrt_norm_Q[53:52] :
        (codasip_tmp_var_2 == 6'h01) ? r_mant_sqrt_norm_Q[49:48] :
        (codasip_tmp_var_2 == 6'h02) ? r_mant_sqrt_norm_Q[45:44] :
        (codasip_tmp_var_2 == 6'h03) ? r_mant_sqrt_norm_Q[41:40] :
        (codasip_tmp_var_2 == 6'h04) ? r_mant_sqrt_norm_Q[37:36] :
        (codasip_tmp_var_2 == 6'h05) ? r_mant_sqrt_norm_Q[33:32] :
        (codasip_tmp_var_2 == 6'h06) ? r_mant_sqrt_norm_Q[29:28] :
        (codasip_tmp_var_2 == 6'h07) ? r_mant_sqrt_norm_Q[25:24] :
        (codasip_tmp_var_2 == 6'h08) ? r_mant_sqrt_norm_Q[21:20] :
        (codasip_tmp_var_2 == 6'h09) ? r_mant_sqrt_norm_Q[17:16] :
        (codasip_tmp_var_2 == 6'h0a) ? r_mant_sqrt_norm_Q[13:12] :
        (codasip_tmp_var_2 == 6'h0b) ? r_mant_sqrt_norm_Q[9:8] :
        (codasip_tmp_var_2 == 6'h0c) ? r_mant_sqrt_norm_Q[5:4] :
        (codasip_tmp_var_2 == 6'h0d) ? r_mant_sqrt_norm_Q[1:0] : 2'h0;
    assign s_sqrt_D1 = ((codasip_tmp_var_2 == 6'h00) && codasip_tmp_var_1) ? r_mant_sqrt_norm_Q[51:50] :
        (codasip_tmp_var_2 == 6'h01) ? r_mant_sqrt_norm_Q[47:46] :
        (codasip_tmp_var_2 == 6'h02) ? r_mant_sqrt_norm_Q[43:42] :
        (codasip_tmp_var_2 == 6'h03) ? r_mant_sqrt_norm_Q[39:38] :
        (codasip_tmp_var_2 == 6'h04) ? r_mant_sqrt_norm_Q[35:34] :
        (codasip_tmp_var_2 == 6'h05) ? r_mant_sqrt_norm_Q[31:30] :
        (codasip_tmp_var_2 == 6'h06) ? r_mant_sqrt_norm_Q[27:26] :
        (codasip_tmp_var_2 == 6'h07) ? r_mant_sqrt_norm_Q[23:22] :
        (codasip_tmp_var_2 == 6'h08) ? r_mant_sqrt_norm_Q[19:18] :
        (codasip_tmp_var_2 == 6'h09) ? r_mant_sqrt_norm_Q[15:14] :
        (codasip_tmp_var_2 == 6'h0a) ? r_mant_sqrt_norm_Q[11:10] :
        (codasip_tmp_var_2 == 6'h0b) ? r_mant_sqrt_norm_Q[7:6] :
        (codasip_tmp_var_2 == 6'h0c) ? r_mant_sqrt_norm_Q[3:2] :
        (codasip_tmp_var_2 == 6'h0d) ? 2'h0 : 2'h0;
    assign s_Sqrt_R0 = codasip_tmp_var_1 ? (((r_sqrt_en_Q && (r_cnt_val_Q == 6'h00))) ? 58'h000000000000000 : r_partial_remainder_Q) : 58'h000000000000000;
    assign division_format_B0B1 = codasip_tmp_var_1 ? {r_divison_B_Q[53:29], 1'b1, r_divison_B_Q[27:0], 4'h0} : 58'h000000000000000;
    assign first_iteration_fract_a_B0B1 = codasip_tmp_var_1 ? (((r_div_en_Q && (r_cnt_val_Q == 6'h00))) ? {1'b0, r_divident_A_Q[52:29], 1'b1, r_divident_A_Q[27:0], 4'h0} : {r_partial_remainder_Q[56:32], r_quotient_Q[0], r_partial_remainder_Q[30:3], 4'h0}) : 58'h000000000000000;
    assign sel_b_first_B0B1 = codasip_tmp_var_1 ? (((r_div_en_Q && (r_cnt_val_Q == 6'h00))) ? 1'b1 : r_quotient_Q[0]) : 1'b0;
    assign first_iteration_fract_b_B0B1 = codasip_tmp_var_1 ? ((sel_b_first_B0B1) ? division_format_B0B1 : {1'b0, r_prenorm_fract_B_Q, 4'h0}) : 58'h000000000000000;
    assign first_iteration_A_B0B1 = codasip_tmp_var_1 ? ((r_sqrt_en_Q) ? s_Sqrt_R0 : first_iteration_fract_a_B0B1) : 58'h000000000000000;
    assign first_iteration_B_B0B1 = codasip_tmp_var_1 ? ((r_sqrt_en_Q) ? s_Sqrt_Q0 : first_iteration_fract_b_B0B1) : 58'h000000000000000;
    assign codasip_return2_iteration_div_sqrt_inline_1_inline_1 = iteration_div_sqrt_inline_1_inline_1_RET;
    assign iteration_div_sqrt_inline_1_inline_1_ACT = codasip_tmp_var_1 ? 1'b1 : 1'b0;
    assign iteration_div_sqrt_inline_1_inline_1_codasip_param_0 = codasip_tmp_var_1 ? 58'((128'h000000000000000003ffffffffffffff & 128'(first_iteration_A_B0B1))) : 58'h000000000000000;
    assign iteration_div_sqrt_inline_1_inline_1_codasip_param_1 = codasip_tmp_var_1 ? 58'((128'h000000000000000003ffffffffffffff & 128'(first_iteration_B_B0B1))) : 58'h000000000000000;
    assign iteration_div_sqrt_inline_1_inline_1_codasip_param_2 = codasip_tmp_var_1 ? r_sqrt_en_Q : 1'b0;
    assign iteration_div_sqrt_inline_1_inline_1_codasip_param_3 = codasip_tmp_var_1 ? r_div_en_Q : 1'b0;
    assign iteration_div_sqrt_inline_1_inline_1_codasip_param_4 = codasip_tmp_var_1 ? s_sqrt_D0 : 2'h0;
    assign s_Iteration1_res = codasip_tmp_var_1 ? codasip_return2_iteration_div_sqrt_inline_1_inline_1 : 61'h0000000000000000;
    assign s_Iteration1_sum = codasip_tmp_var_1 ? s_Iteration1_res[59:2] : 58'h000000000000000;
    assign s_Iteration1_carry = codasip_tmp_var_1 ? s_Iteration1_res[60] : 1'b0;
    assign s_Iteration1_sqrt_Do = codasip_tmp_var_1 ? s_Iteration1_res[1:0] : 2'h0;
    assign quotient_sel1_B0B1 = codasip_tmp_var_1 ? (~s_Iteration1_sum[28]) : 1'b0;
    assign codasip_tmp_var_3 = codasip_tmp_var_1 ? r_cnt_val_Q : 6'h00;
    assign s_cnt_0 = ((codasip_tmp_var_3 == 6'h00) && codasip_tmp_var_1) ? {1'b0, quotient_sel1_B0B1} : 2'h0;
    assign s_cnt_1 = (codasip_tmp_var_3 == 6'h01) ? 3'({r_quotient_Q, quotient_sel1_B0B1}) : 3'h0;
    assign s_cnt_2 = (codasip_tmp_var_3 == 6'h02) ? 5'({r_quotient_Q, quotient_sel1_B0B1}) : 5'h00;
    assign s_cnt_3 = (codasip_tmp_var_3 == 6'h03) ? 7'({r_quotient_Q, quotient_sel1_B0B1}) : 7'h00;
    assign s_cnt_4 = (codasip_tmp_var_3 == 6'h04) ? 9'({r_quotient_Q, quotient_sel1_B0B1}) : 9'h000;
    assign s_cnt_5 = (codasip_tmp_var_3 == 6'h05) ? 11'({r_quotient_Q, quotient_sel1_B0B1}) : 11'h000;
    assign s_cnt_6 = (codasip_tmp_var_3 == 6'h06) ? 13'({r_quotient_Q, quotient_sel1_B0B1}) : 13'h0000;
    assign s_cnt_7 = (codasip_tmp_var_3 == 6'h07) ? 15'({r_quotient_Q, quotient_sel1_B0B1}) : 15'h0000;
    assign s_cnt_8 = (codasip_tmp_var_3 == 6'h08) ? 17'({r_quotient_Q, quotient_sel1_B0B1}) : 17'h00000;
    assign s_cnt_9 = (codasip_tmp_var_3 == 6'h09) ? 19'({r_quotient_Q, quotient_sel1_B0B1}) : 19'h00000;
    assign s_cnt_10 = (codasip_tmp_var_3 == 6'h0a) ? 21'({r_quotient_Q, quotient_sel1_B0B1}) : 21'h000000;
    assign s_cnt_11 = (codasip_tmp_var_3 == 6'h0b) ? 23'({r_quotient_Q, quotient_sel1_B0B1}) : 23'h000000;
    assign s_cnt_12 = (codasip_tmp_var_3 == 6'h0c) ? 25'({r_quotient_Q, quotient_sel1_B0B1}) : 25'h0000000;
    assign s_cnt_13 = (codasip_tmp_var_3 == 6'h0d) ? 27'({r_quotient_Q, quotient_sel1_B0B1}) : 27'h0000000;
    assign s_sqrt1 = ((codasip_tmp_var_3 == 6'h00) && codasip_tmp_var_1) ? {56'h00000000000000, s_cnt_0} :
        (codasip_tmp_var_3 == 6'h01) ? {55'h00000000000000, s_cnt_1} :
        (codasip_tmp_var_3 == 6'h02) ? {53'h00000000000000, s_cnt_2} :
        (codasip_tmp_var_3 == 6'h03) ? {51'h0000000000000, s_cnt_3} :
        (codasip_tmp_var_3 == 6'h04) ? {49'h0000000000000, s_cnt_4} :
        (codasip_tmp_var_3 == 6'h05) ? {47'h000000000000, s_cnt_5} :
        (codasip_tmp_var_3 == 6'h06) ? {45'h000000000000, s_cnt_6} :
        (codasip_tmp_var_3 == 6'h07) ? {43'h00000000000, s_cnt_7} :
        (codasip_tmp_var_3 == 6'h08) ? {41'h00000000000, s_cnt_8} :
        (codasip_tmp_var_3 == 6'h09) ? {39'h0000000000, s_cnt_9} :
        (codasip_tmp_var_3 == 6'h0a) ? {37'h0000000000, s_cnt_10} :
        (codasip_tmp_var_3 == 6'h0b) ? {35'h000000000, s_cnt_11} :
        (codasip_tmp_var_3 == 6'h0c) ? {33'h000000000, s_cnt_12} :
        (codasip_tmp_var_3 == 6'h0d) ? {31'h00000000, s_cnt_13} : 58'h000000000000000;
    assign s_Sqrt_Q1 = codasip_tmp_var_1 ? ((quotient_sel1_B0B1) ? {29'h00000000, (~s_sqrt1[28:0])} : s_sqrt1) : 58'h000000000000000;
    assign s_Sqrt_R1 = codasip_tmp_var_1 ? {s_Iteration1_sum[57], s_Iteration1_sum[54:0], s_Iteration1_sqrt_Do} : 58'h000000000000000;
    assign sel_b_second_B0B1 = codasip_tmp_var_1 ? (~s_Iteration1_sum[57]) : 1'b0;
    assign second_iteration_fract_a_B0B1 = codasip_tmp_var_1 ? {s_Iteration1_sum[56:32], sel_b_second_B0B1, s_Iteration1_sum[30:3], 4'h0} : 58'h000000000000000;
    assign second_iteration_fract_b_B0B1 = codasip_tmp_var_1 ? ((sel_b_second_B0B1) ? division_format_B0B1 : {1'b0, r_prenorm_fract_B_Q, 4'h0}) : 58'h000000000000000;
    assign second_iteration_A_B0B1 = codasip_tmp_var_1 ? ((r_sqrt_en_Q) ? s_Sqrt_R1 : second_iteration_fract_a_B0B1) : 58'h000000000000000;
    assign second_iteration_B_B0B1 = codasip_tmp_var_1 ? ((r_sqrt_en_Q) ? s_Sqrt_Q1 : second_iteration_fract_b_B0B1) : 58'h000000000000000;
    assign codasip_return2_iteration_div_sqrt_inline_2_inline_1 = iteration_div_sqrt_inline_2_inline_1_RET;
    assign iteration_div_sqrt_inline_2_inline_1_ACT = codasip_tmp_var_1 ? 1'b1 : 1'b0;
    assign iteration_div_sqrt_inline_2_inline_1_codasip_param_0 = codasip_tmp_var_1 ? 58'((128'h000000000000000003ffffffffffffff & 128'(second_iteration_A_B0B1))) : 58'h000000000000000;
    assign iteration_div_sqrt_inline_2_inline_1_codasip_param_1 = codasip_tmp_var_1 ? 58'((128'h000000000000000003ffffffffffffff & 128'(second_iteration_B_B0B1))) : 58'h000000000000000;
    assign iteration_div_sqrt_inline_2_inline_1_codasip_param_2 = codasip_tmp_var_1 ? r_sqrt_en_Q : 1'b0;
    assign iteration_div_sqrt_inline_2_inline_1_codasip_param_3 = codasip_tmp_var_1 ? r_div_en_Q : 1'b0;
    assign iteration_div_sqrt_inline_2_inline_1_codasip_param_4 = codasip_tmp_var_1 ? s_sqrt_D1 : 2'h0;
    assign s_Iteration2_res = codasip_tmp_var_1 ? codasip_return2_iteration_div_sqrt_inline_2_inline_1 : 61'h0000000000000000;
    assign s_Iteration2_sum = codasip_tmp_var_1 ? s_Iteration2_res[59:2] : 58'h000000000000000;
    assign s_Iteration2_carry = codasip_tmp_var_1 ? s_Iteration2_res[60] : 1'b0;
    assign s_Iteration2_sqrt_Do = codasip_tmp_var_1 ? s_Iteration2_res[1:0] : 2'h0;
    assign s_Sqrt_R2 = codasip_tmp_var_1 ? {s_Iteration2_sum[57], s_Iteration2_sum[54:0], s_Iteration2_sqrt_Do} : 58'h000000000000000;
    assign quotient_B0B1 = codasip_tmp_var_1 ? ((r_sqrt_en_Q) ? {(~s_Iteration1_sum[28]), (~s_Iteration2_sum[28])} : {s_Iteration1_carry, s_Iteration2_carry}) : 2'h0;
    assign height_one_B0B1 = codasip_tmp_var_1 ? 7'((((r_quotient_Q[56] != 1'b0)) ? 57'h000000000000000 : (((r_quotient_Q[55] != 1'b0)) ? 57'h000000000000001 : (((r_quotient_Q[54] != 1'b0)) ? 57'h000000000000002 : (((r_quotient_Q[53] != 1'b0)) ? 57'h000000000000003 : (((r_quotient_Q[52] != 1'b0)) ? 57'h000000000000004 : (((r_quotient_Q[51] != 1'b0)) ? 57'h000000000000005 : (((r_quotient_Q[50] != 1'b0)) ? 57'h000000000000006 : (((r_quotient_Q[49] != 1'b0)) ? 57'h000000000000007 : (((r_quotient_Q[48] != 1'b0)) ? 57'h000000000000008 : (((r_quotient_Q[47] != 1'b0)) ? 57'h000000000000009 : (((r_quotient_Q[46] != 1'b0)) ? 57'h00000000000000a : (((r_quotient_Q[45] != 1'b0)) ? 57'h00000000000000b : (((r_quotient_Q[44] != 1'b0)) ? 57'h00000000000000c : (((r_quotient_Q[43] != 1'b0)) ? 57'h00000000000000d : (((r_quotient_Q[42] != 1'b0)) ? 57'h00000000000000e : (((r_quotient_Q[41] != 1'b0)) ? 57'h00000000000000f : (((r_quotient_Q[40] != 1'b0)) ? 57'h000000000000010 : (((r_quotient_Q[39] != 1'b0)) ? 57'h000000000000011 : (((r_quotient_Q[38] != 1'b0)) ? 57'h000000000000012 : (((r_quotient_Q[37] != 1'b0)) ? 57'h000000000000013 : (((r_quotient_Q[36] != 1'b0)) ? 57'h000000000000014 : (((r_quotient_Q[35] != 1'b0)) ? 57'h000000000000015 : (((r_quotient_Q[34] != 1'b0)) ? 57'h000000000000016 : (((r_quotient_Q[33] != 1'b0)) ? 57'h000000000000017 : (((r_quotient_Q[32] != 1'b0)) ? 57'h000000000000018 : (((r_quotient_Q[31] != 1'b0)) ? 57'h000000000000019 : (((r_quotient_Q[30] != 1'b0)) ? 57'h00000000000001a : (((r_quotient_Q[29] != 1'b0)) ? 57'h00000000000001b : (((r_quotient_Q[28] != 1'b0)) ? 57'h00000000000001c : (((r_quotient_Q[27] != 1'b0)) ? 57'h00000000000001d : (((r_quotient_Q[26] != 1'b0)) ? 57'h00000000000001e : (((r_quotient_Q[25] != 1'b0)) ? 57'h00000000000001f : (((r_quotient_Q[24] != 1'b0)) ? 57'h000000000000020 : (((r_quotient_Q[23] != 1'b0)) ? 57'h000000000000021 : (((r_quotient_Q[22] != 1'b0)) ? 57'h000000000000022 : (((r_quotient_Q[21] != 1'b0)) ? 57'h000000000000023 : (((r_quotient_Q[20] != 1'b0)) ? 57'h000000000000024 : (((r_quotient_Q[19] != 1'b0)) ? 57'h000000000000025 : (((r_quotient_Q[18] != 1'b0)) ? 57'h000000000000026 : (((r_quotient_Q[17] != 1'b0)) ? 57'h000000000000027 : (((r_quotient_Q[16] != 1'b0)) ? 57'h000000000000028 : (((r_quotient_Q[15] != 1'b0)) ? 57'h000000000000029 : (((r_quotient_Q[14] != 1'b0)) ? 57'h00000000000002a : (((r_quotient_Q[13] != 1'b0)) ? 57'h00000000000002b : (((r_quotient_Q[12] != 1'b0)) ? 57'h00000000000002c : (((r_quotient_Q[11] != 1'b0)) ? 57'h00000000000002d : (((r_quotient_Q[10] != 1'b0)) ? 57'h00000000000002e : (((r_quotient_Q[9] != 1'b0)) ? 57'h00000000000002f : (((r_quotient_Q[8] != 1'b0)) ? 57'h000000000000030 : (((r_quotient_Q[7] != 1'b0)) ? 57'h000000000000031 : (((r_quotient_Q[6] != 1'b0)) ? 57'h000000000000032 : (((r_quotient_Q[5] != 1'b0)) ? 57'h000000000000033 : (((r_quotient_Q[4] != 1'b0)) ? 57'h000000000000034 : (((r_quotient_Q[3] != 1'b0)) ? 57'h000000000000035 : (((r_quotient_Q[2] != 1'b0)) ? 57'h000000000000036 : (((r_quotient_Q[1] != 1'b0)) ? 57'h000000000000037 : (((r_quotient_Q[0] != 1'b0)) ? 57'h000000000000038 : 57'h000000000000039)))))))))))))))))))))))))))))))))))))))))))))))))))))))))) : 7'h00;
    assign codasip_tmp_var_4 = codasip_tmp_var_1 ? (height_one_B0B1 != 7'h00) : 1'b0;
    assign shift1_B0B1B0B28 = codasip_tmp_var_4 ? (height_one_B0B1 - 7'h01) : 7'h00;
    assign shift2_B0B1B0B28 = codasip_tmp_var_4 ? (height_one_B0B1 - 7'h02) : 7'h00;
    assign exp_add_c_B0B1 = ((r_div_en_Q) ? 13'h0080 : 13'h003f);
    assign exp_add_a_B0B1 = ((r_sqrt_en_Q) ? {r_exp_A_Q[11], r_exp_A_Q[11], r_exp_A_Q[11:1]} : {r_exp_A_Q[11], r_exp_A_Q});
    assign exp_add_b_B0B1 = ((r_sqrt_en_Q) ? {12'h000, r_exp_A_Q[0]} : {(~r_exp_B_Q[11]), (~r_exp_B_Q)});
    assign cycle_val_B0B2 = 5'h0d;
    assign codasip_tmp_var_5 = ((r_cnt_val_Q == 6'(cycle_val_B0B2)) && (r_computing_Q == 1'b1));
    assign codasip_tmp_var_6 = (!codasip_tmp_var_5) ? (r_computing_Q == 1'b1) : 1'b0;
    assign sqrt_div_busy_D_ACT_wire = codasip_tmp_var_5 ? 1'b0 :
        codasip_tmp_var_6 ? 1'b1 : 1'b0;
    assign codasip_tmp_var_7 = ((!codasip_tmp_var_6) && (!codasip_tmp_var_5)) ? s_start_i_Q : 1'b0;
    assign exp_saturate_B0B2 = 13'h00ff;
    assign mantissa_B0B2 = r_quotient_32_Q;
    assign codasip_tmp_var_8 = (r_nan_A_Q || (r_nan_B_Q && r_div_en_Q));
    assign codasip_tmp_var_9 = (!codasip_tmp_var_8) ? r_inf_A_Q : 1'b0;
    assign codasip_tmp_var_10 = codasip_tmp_var_9 ? ((r_div_en_Q && r_inf_B_Q) || (r_sqrt_en_Q && r_sign_bit_Q)) : 1'b0;
    assign codasip_tmp_var_11 = ((!codasip_tmp_var_9) && (!codasip_tmp_var_8)) ? (r_div_en_Q && r_inf_B_Q) : 1'b0;
    assign codasip_tmp_var_12 = (((!codasip_tmp_var_11) && (!codasip_tmp_var_9)) && (!codasip_tmp_var_8)) ? r_zero_A_Q : 1'b0;
    assign codasip_tmp_var_13 = codasip_tmp_var_12 ? (r_div_en_Q && r_zero_B_Q) : 1'b0;
    assign codasip_tmp_var_14 = ((((!codasip_tmp_var_12) && (!codasip_tmp_var_11)) && (!codasip_tmp_var_9)) && (!codasip_tmp_var_8)) ? (r_div_en_Q && r_zero_B_Q) : 1'b0;
    assign codasip_tmp_var_15 = (((((!codasip_tmp_var_14) && (!codasip_tmp_var_12)) && (!codasip_tmp_var_11)) && (!codasip_tmp_var_9)) && (!codasip_tmp_var_8)) ? (r_sqrt_en_Q && r_sign_bit_Q) : 1'b0;
    assign codasip_tmp_var_16 = ((((((!codasip_tmp_var_15) && (!codasip_tmp_var_14)) && (!codasip_tmp_var_12)) && (!codasip_tmp_var_11)) && (!codasip_tmp_var_9)) && (!codasip_tmp_var_8)) ? (r_exp_result_prenorm_Q[11:0] == 12'h000) : 1'b0;
    assign codasip_tmp_var_17 = codasip_tmp_var_16 ? (mantissa_B0B2 != 57'h000000000000000) : 1'b0;
    assign codasip_tmp_var_18 = (((((((!codasip_tmp_var_16) && (!codasip_tmp_var_15)) && (!codasip_tmp_var_14)) && (!codasip_tmp_var_12)) && (!codasip_tmp_var_11)) && (!codasip_tmp_var_9)) && (!codasip_tmp_var_8)) ? ((r_exp_result_prenorm_Q[11:0] == 12'h001) && (~mantissa_B0B2[56])) : 1'b0;
    assign codasip_tmp_var_19 = ((((((((!codasip_tmp_var_18) && (!codasip_tmp_var_16)) && (!codasip_tmp_var_15)) && (!codasip_tmp_var_14)) && (!codasip_tmp_var_12)) && (!codasip_tmp_var_11)) && (!codasip_tmp_var_9)) && (!codasip_tmp_var_8)) ? r_exp_result_prenorm_Q[12] : 1'b0;
    assign shift_amount_no_sat_B0B2 = codasip_tmp_var_19 ? 13'((32'(unsigned'(13'((~r_exp_result_prenorm_Q)))) + 32'h00000002)) : 13'h0000;
    assign shift_amount_B0B2 = codasip_tmp_var_19 ? (((shift_amount_no_sat_B0B2 > 13'h006e)) ? 13'h006e : shift_amount_no_sat_B0B2) : 13'h0000;
    assign quotient_no_sticky_B0B2 = codasip_tmp_var_19 ? ({mantissa_B0B2, 53'h00000000000000} >> shift_amount_B0B2) : {110{1'b0}};
    assign shifted_out_B0B2 = codasip_tmp_var_19 ? ((mantissa_B0B2 << (32'h0000006e - 32'(shift_amount_B0B2))) != 57'h000000000000000) : 1'b0;
    assign s_quotient_pom = codasip_tmp_var_19 ? {quotient_no_sticky_B0B2[109:1], (quotient_no_sticky_B0B2[0] | shifted_out_B0B2)} : {110{1'b0}};
    assign codasip_tmp_var_20 = (((((((((!codasip_tmp_var_19) && (!codasip_tmp_var_18)) && (!codasip_tmp_var_16)) && (!codasip_tmp_var_15)) && (!codasip_tmp_var_14)) && (!codasip_tmp_var_12)) && (!codasip_tmp_var_11)) && (!codasip_tmp_var_9)) && (!codasip_tmp_var_8)) ? r_exp_result_prenorm_Q[8] : 1'b0;
    assign codasip_tmp_var_21 = codasip_tmp_var_20 ? (((r_sign_bit_Q && (r_round_mode_Q == 3'h3)) || ((!r_sign_bit_Q) && (r_round_mode_Q == 3'h2))) || (r_round_mode_Q == 3'h1)) : 1'b0;
    assign codasip_tmp_var_22 = ((((((((((!codasip_tmp_var_20) && (!codasip_tmp_var_19)) && (!codasip_tmp_var_18)) && (!codasip_tmp_var_16)) && (!codasip_tmp_var_15)) && (!codasip_tmp_var_14)) && (!codasip_tmp_var_12)) && (!codasip_tmp_var_11)) && (!codasip_tmp_var_9)) && (!codasip_tmp_var_8)) ? ((~r_exp_result_prenorm_Q[7:0]) == 8'h00) : 1'b0;
    assign codasip_tmp_var_23 = codasip_tmp_var_22 ? (~mantissa_B0B2[56]) : 1'b0;
    assign codasip_tmp_var_24 = ((!codasip_tmp_var_23) && codasip_tmp_var_22) ? (((r_sign_bit_Q && (r_round_mode_Q == 3'h3)) || ((!r_sign_bit_Q) && (r_round_mode_Q == 3'h2))) || (r_round_mode_Q == 3'h1)) : 1'b0;
    assign codasip_tmp_var_25 = (((((((((((!codasip_tmp_var_22) && (!codasip_tmp_var_20)) && (!codasip_tmp_var_19)) && (!codasip_tmp_var_18)) && (!codasip_tmp_var_16)) && (!codasip_tmp_var_15)) && (!codasip_tmp_var_14)) && (!codasip_tmp_var_12)) && (!codasip_tmp_var_11)) && (!codasip_tmp_var_9)) && (!codasip_tmp_var_8)) ? r_same_number_Q : 1'b0;
    assign codasip_tmp_var_26 = ((((((((((((!codasip_tmp_var_25) && (!codasip_tmp_var_22)) && (!codasip_tmp_var_20)) && (!codasip_tmp_var_19)) && (!codasip_tmp_var_18)) && (!codasip_tmp_var_16)) && (!codasip_tmp_var_15)) && (!codasip_tmp_var_14)) && (!codasip_tmp_var_12)) && (!codasip_tmp_var_11)) && (!codasip_tmp_var_9)) && (!codasip_tmp_var_8)) ? mantissa_B0B2[56] : 1'b0;
    assign result_mantissa_norm_B0B2 = (codasip_tmp_var_8 || codasip_tmp_var_10) ? 53'h08000000000000 :
        (codasip_tmp_var_9 || codasip_tmp_var_11) ? 53'h00000000000000 :
        codasip_tmp_var_13 ? 53'h08000000000000 :
        (codasip_tmp_var_12 || codasip_tmp_var_14) ? 53'h00000000000000 :
        codasip_tmp_var_15 ? 53'h08000000000000 :
        codasip_tmp_var_17 ? {1'b0, mantissa_B0B2[56:5]} :
        codasip_tmp_var_16 ? 53'h00000000000000 :
        codasip_tmp_var_18 ? mantissa_B0B2[56:4] :
        codasip_tmp_var_19 ? s_quotient_pom[109:57] :
        codasip_tmp_var_21 ? 53'h1fffffffffffff :
        codasip_tmp_var_20 ? 53'h00000000000000 :
        codasip_tmp_var_23 ? mantissa_B0B2[55:3] :
        codasip_tmp_var_24 ? 53'h1fffffffffffff :
        (codasip_tmp_var_22 || codasip_tmp_var_25) ? 53'h00000000000000 :
        codasip_tmp_var_26 ? mantissa_B0B2[56:4] : mantissa_B0B2[55:3];
    assign mantissa_round_B0B2 = (((((codasip_tmp_var_8 || codasip_tmp_var_9) || codasip_tmp_var_11) || codasip_tmp_var_12) || codasip_tmp_var_14) || codasip_tmp_var_15) ? 57'h000000000000000 :
        codasip_tmp_var_17 ? {mantissa_B0B2[4:0], 52'h0000000000000} :
        codasip_tmp_var_16 ? 57'h000000000000000 :
        codasip_tmp_var_18 ? {mantissa_B0B2[3:0], 53'h00000000000000} :
        codasip_tmp_var_19 ? s_quotient_pom[56:0] :
        codasip_tmp_var_20 ? 57'h000000000000000 :
        codasip_tmp_var_23 ? {mantissa_B0B2[2:0], 54'h00000000000000} :
        (codasip_tmp_var_22 || codasip_tmp_var_25) ? 57'h000000000000000 :
        codasip_tmp_var_26 ? {mantissa_B0B2[3:0], 53'h00000000000000} : {mantissa_B0B2[2:0], 54'h00000000000000};
    assign codasip_tmp_var_27 = r_round_mode_fin_Q;
    always_comb begin
        case ( codasip_tmp_var_27 )
            3'h0: s_mantissa_roundup = (r_mantissa_lower_part_Q[1] && (((r_mantissa_lower_part_Q[0] | r_mantissa_sticky_bit_Q) | r_sticky_rem_Q) | r_mantissa_upper_part_Q[29]));
            3'h2: s_mantissa_roundup = ((((!(r_mantissa_lower_part_Q == 2'h0)) | r_mantissa_sticky_bit_Q) | (r_sticky_rem_Q && r_remainder_en_Q)) & r_sign_bit_fin_Q);
            3'h3: s_mantissa_roundup = ((((!(r_mantissa_lower_part_Q == 2'h0)) | r_mantissa_sticky_bit_Q) | (r_sticky_rem_Q && r_remainder_en_Q)) & (~r_sign_bit_fin_Q));
            3'h4: s_mantissa_roundup = r_mantissa_lower_part_Q[1];
            default: s_mantissa_roundup = 1'b0;
        endcase
    end
    assign mantissa_rounded_B0B3 = 57'(unsigned'(54'((54'(r_mantissa_upper_part_Q) + 54'(unsigned'(30'({s_mantissa_roundup, 29'h00000000})))))));
    assign mantissa_round_res_B0B3 = 54'(unsigned'(52'(((mantissa_rounded_B0B3[53]) ? mantissa_rounded_B0B3[52:1] : mantissa_rounded_B0B3[51:0]))));
    assign exp_res_B0B3 = ((11'(mantissa_rounded_B0B3[53]) + r_exp_norm_res_Q) + 11'(((r_exp_norm_res_Q == 11'h000) && mantissa_rounded_B0B3[52])));
    assign s_inexact = ((((!(r_mantissa_lower_part_Q == 2'h0)) | r_mantissa_sticky_bit_Q) | r_overflow_Q) | (r_sticky_rem_Q && r_remainder_en_Q));
    assign s_underflow = (r_tiny_Q && s_inexact);
    assign s_sqr_div_done_comp_D_ACT_wire = codasip_tmp_var_5 ? 1'b1 : 1'b0;
    assign r_cnt_val_D = codasip_tmp_var_6 ? (r_cnt_val_Q + 6'h01) :
        codasip_tmp_var_7 ? 6'h00 : 6'h00;
    assign r_cnt_val_WE = (codasip_tmp_var_6 || codasip_tmp_var_7) ? 1'b1 : 1'b0;
    assign r_computing_D = codasip_tmp_var_5 ? 1'b0 :
        codasip_tmp_var_7 ? 1'b1 : 1'b0;
    assign r_computing_WE = (codasip_tmp_var_5 || codasip_tmp_var_7) ? 1'b1 : 1'b0;
    assign r_div_en_D = (s_op_i_Q == 6'h03);
    assign r_div_en_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_div_zero_D = (((codasip_tmp_var_8 || codasip_tmp_var_9) || codasip_tmp_var_11) || codasip_tmp_var_12) ? 1'b0 :
        codasip_tmp_var_14 ? 1'b1 : 1'b0;
    assign r_div_zero_WE = 1'b1;
    assign r_divident_A_D = prenorm_fract_A_B0B0;
    assign r_divident_A_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_divison_B_D = {(~{1'b0, prenorm_fract_B_B0B0[52:29]}), 29'h00000000};
    assign r_divison_B_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_exp_A_D = norm_exp_A_B0B0;
    assign r_exp_A_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_exp_B_D = norm_exp_B_B0B0;
    assign r_exp_B_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_exp_norm_res_D = codasip_tmp_var_8 ? 11'(exp_saturate_B0B2) :
        codasip_tmp_var_9 ? 11'(exp_saturate_B0B2) :
        codasip_tmp_var_11 ? 11'h000 :
        codasip_tmp_var_13 ? 11'(exp_saturate_B0B2) :
        codasip_tmp_var_12 ? 11'h000 :
        codasip_tmp_var_14 ? 11'(exp_saturate_B0B2) :
        codasip_tmp_var_15 ? 11'(exp_saturate_B0B2) :
        ((codasip_tmp_var_16 || codasip_tmp_var_18) || codasip_tmp_var_19) ? 11'h000 :
        codasip_tmp_var_21 ? 11'h7fe :
        codasip_tmp_var_20 ? 11'h7ff :
        codasip_tmp_var_23 ? 11'((32'(r_exp_result_prenorm_Q) - 32'h00000001)) :
        codasip_tmp_var_24 ? 11'h7fe :
        codasip_tmp_var_22 ? 11'h7ff :
        codasip_tmp_var_25 ? 11'h07f :
        codasip_tmp_var_26 ? r_exp_result_prenorm_Q[10:0] : 11'((32'(r_exp_result_prenorm_Q) - 32'h00000001));
    assign r_exp_norm_res_WE = 1'b1;
    assign r_exp_result_prenorm_D = ((exp_add_a_B0B1 + exp_add_b_B0B1) + exp_add_c_B0B1);
    assign r_exp_result_prenorm_WE = 1'b1;
    assign r_inf_A_D = s_properties_i_Q[1];
    assign r_inf_A_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_inf_B_D = s_properties_i_Q[0];
    assign r_inf_B_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_invalid_D = codasip_tmp_var_8 ? r_snan_Q :
        codasip_tmp_var_10 ? 1'b1 :
        (codasip_tmp_var_9 || codasip_tmp_var_11) ? 1'b0 :
        codasip_tmp_var_13 ? 1'b1 :
        (codasip_tmp_var_12 || codasip_tmp_var_14) ? 1'b0 :
        codasip_tmp_var_15 ? 1'b1 : 1'b0;
    assign r_invalid_WE = 1'b1;
    assign r_Iteration1_sum_D = s_Iteration1_sum;
    assign r_Iteration1_sum_WE = codasip_tmp_var_1 ? 1'b1 : 1'b0;
    assign r_Iteration2_sum_D = s_Iteration2_sum;
    assign r_Iteration2_sum_WE = codasip_tmp_var_1 ? 1'b1 : 1'b0;
    assign r_mant_sqrt_norm_D = 54'(((norm_exp_A_B0B0[0]) ? {1'b0, divident_A_B0B0} : {divident_A_B0B0, 1'b0}));
    assign r_mant_sqrt_norm_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_mantissa_lower_part_D = result_mantissa_norm_B0B2[28:27];
    assign r_mantissa_lower_part_WE = 1'b1;
    assign r_mantissa_sticky_bit_D = ((result_mantissa_norm_B0B2[26:0] != 27'h0000000) || (mantissa_round_B0B2 != 57'h000000000000000));
    assign r_mantissa_sticky_bit_WE = 1'b1;
    assign r_mantissa_upper_part_D = {result_mantissa_norm_B0B2[52:29], 29'h00000000};
    assign r_mantissa_upper_part_WE = 1'b1;
    assign r_nan_A_D = s_properties_i_Q[5];
    assign r_nan_A_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_nan_B_D = s_properties_i_Q[4];
    assign r_nan_B_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_overflow_D = ((((((((codasip_tmp_var_8 || codasip_tmp_var_9) || codasip_tmp_var_11) || codasip_tmp_var_12) || codasip_tmp_var_14) || codasip_tmp_var_15) || codasip_tmp_var_16) || codasip_tmp_var_18) || codasip_tmp_var_19) ? 1'b0 :
        codasip_tmp_var_20 ? 1'b1 :
        codasip_tmp_var_23 ? 1'b0 :
        codasip_tmp_var_22 ? 1'b1 : 1'b0;
    assign r_overflow_WE = 1'b1;
    assign r_partial_remainder_D = ((r_sqrt_en_Q) ? s_Sqrt_R2 : s_Iteration2_sum);
    assign r_partial_remainder_WE = codasip_tmp_var_1 ? 1'b1 : 1'b0;
    assign r_prenorm_fract_B_D = prenorm_fract_B_B0B0;
    assign r_prenorm_fract_B_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_quotient_32_D = {tmp_codasip_conv_BIT_CONCATENATE_2522_1, 29'h00000000};
    assign r_quotient_32_WE = codasip_tmp_var_1 ? 1'b1 : 1'b0;
    assign r_quotient_D = codasip_tmp_var_1 ? {r_quotient_Q[54:0], quotient_B0B1} : 57'h000000000000000;
    assign r_quotient_WE = 1'b1;
    assign r_remainder_en_D = (((((codasip_tmp_var_8 || codasip_tmp_var_9) || codasip_tmp_var_11) || codasip_tmp_var_12) || codasip_tmp_var_14) || codasip_tmp_var_15) ? 1'b0 :
        codasip_tmp_var_17 ? (r_sticky_rem_Q | (~(mantissa_B0B2[4:0] == 5'h00))) :
        codasip_tmp_var_16 ? 1'b0 :
        (codasip_tmp_var_18 || codasip_tmp_var_19) ? 1'b1 :
        codasip_tmp_var_20 ? 1'b0 :
        codasip_tmp_var_23 ? 1'b1 :
        (codasip_tmp_var_22 || codasip_tmp_var_25) ? 1'b0 : 1'b1;
    assign r_remainder_en_WE = 1'b1;
    assign r_remainder_shift_D = codasip_tmp_var_4 ? 57'(((~r_partial_remainder_Q) << shift2_B0B1B0B28)) :
        codasip_tmp_var_1 ? 57'(((~r_partial_remainder_Q) << 32'sh00000001)) : 57'h000000000000000;
    assign r_remainder_shift_WE = (codasip_tmp_var_4 || codasip_tmp_var_1) ? 1'b1 : 1'b0;
    assign r_result_man_shift_D = codasip_tmp_var_4 ? (r_quotient_Q << shift1_B0B1B0B28) :
        codasip_tmp_var_1 ? r_quotient_Q : 57'h000000000000000;
    assign r_result_man_shift_WE = (codasip_tmp_var_4 || codasip_tmp_var_1) ? 1'b1 : 1'b0;
    assign r_ROB_ptr_work_D = s_ROB_ptr_i_Q;
    assign r_ROB_ptr_work_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_round_mode_D = s_rm_i_Q;
    assign r_round_mode_fin_D = r_round_mode_Q;
    assign r_round_mode_fin_WE = 1'b1;
    assign r_round_mode_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_same_number_D = ((s_op_i_Q == 6'h03) && (s_srcA_i_Q == s_srcB_i_Q));
    assign r_same_number_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_sign_bit_D = (((s_op_i_Q == 6'h06)) ? sign_A_B0B0 : (sign_B_B0B0 ^ sign_A_B0B0));
    assign r_sign_bit_fin_D = r_sign_bit_Q;
    assign r_sign_bit_fin_WE = 1'b1;
    assign r_sign_bit_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_sign_res_D = (codasip_tmp_var_8 || codasip_tmp_var_10) ? 1'b0 :
        (codasip_tmp_var_9 || codasip_tmp_var_11) ? r_sign_bit_Q :
        codasip_tmp_var_13 ? 1'b0 :
        (codasip_tmp_var_12 || codasip_tmp_var_14) ? r_sign_bit_Q :
        codasip_tmp_var_15 ? 1'b0 : r_sign_bit_Q;
    assign r_sign_res_WE = 1'b1;
    assign r_snan_D = (s_properties_i_Q[9] | (s_properties_i_Q[8] & (s_op_i_Q == 6'h03)));
    assign r_snan_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_sqr_div_done_post_norm_D = s_sqr_div_done_comp_Q;
    assign r_sqr_div_done_post_norm_WE = 1'b1;
    assign r_sqr_div_done_round_D = r_sqr_div_done_post_norm_Q;
    assign r_sqr_div_done_round_WE = 1'b1;
    assign r_sqr_div_rob_post_norm_D = r_ROB_ptr_work_Q;
    assign r_sqr_div_rob_post_norm_WE = 1'b1;
    assign r_sqr_div_rob_round_D = r_sqr_div_rob_post_norm_Q;
    assign r_sqr_div_rob_round_WE = 1'b1;
    assign r_sqrt_en_D = (s_op_i_Q == 6'h06);
    assign r_sqrt_en_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_sticky_rem_D = ((r_sqrt_en_Q) ? (r_result_man_shift_Q != r_remainder_shift_Q) : ((r_Iteration2_sum_Q != r_Iteration1_sum_Q) && (r_partial_remainder_Q != 58'h000000000000000)));
    assign r_sticky_rem_WE = 1'b1;
    assign r_tiny_D = ((r_exp_result_prenorm_Q[9] || (r_exp_result_prenorm_Q == 13'h0000)) || ((r_exp_result_prenorm_Q == 13'h0001) && (!mantissa_B0B2[56])));
    assign r_tiny_WE = 1'b1;
    assign r_zero_A_D = s_properties_i_Q[3];
    assign r_zero_A_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_zero_B_D = s_properties_i_Q[2];
    assign r_zero_B_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign s_busy_o_D = sqrt_div_busy_Q;
    assign s_done_o_D = r_sqr_div_done_round_Q;
    assign s_flags_o_D = {r_invalid_Q, r_div_zero_Q, r_overflow_Q, s_underflow, s_inexact};
    assign s_ready_o_D = (~r_computing_Q);
    assign s_result_o_D = {r_sign_res_Q, exp_res_B0B3[7:0], mantissa_round_res_B0B3[51:29]};
    assign s_ROB_ptr_o_D = r_sqr_div_rob_round_Q;
    assign s_sqr_div_done_comp_D = s_sqr_div_done_comp_D_ACT_wire;
    assign sqrt_div_busy_D = sqrt_div_busy_D_ACT_wire;
    // code snippets:
`ifdef CODASIP_RTL_ASSERTIONS
    // Specify default clock signal for all assertions.
    // The clock may run even when the unit has gated clock signal.
    default clocking @(posedge `CODASIP_RTL_ASSERTIONS_CLOCK); endclocking

`ifdef CODASIP_RTL_ASSERTIONS_RESET
    // Disable all the assertions in case reset is asserted.
    default disable iff ((`CODASIP_RTL_ASSERTIONS_RESET == 1'b0));
`endif

    div_sqrt_compute_makes_height_one_ge_3: assert property (
        (codasip_tmp_var_1) |-> ((height_one_B0B1 >= 7'h03))
    )
    else $fatal(32'sd2, "div_sqrt_compute_makes_height_one_ge_3: r_quotient 3 MSBs are not 0");

    sqrt_div_datapath_1: assert property (
        ((!((((!r_remainder_en_Q) && $onehot(r_mantissa_lower_part_Q)) && r_sticky_rem_Q) && s_done_o_Q)))
    )
    else $fatal(32'sd2, "sqrt_div_datapath_1:");

`endif  // CODASIP_RTL_ASSERTIONS

endmodule: codix_berkelium_ca_core_execute_stage_fpu_sqrt_div_compute_sqrt_div_t
