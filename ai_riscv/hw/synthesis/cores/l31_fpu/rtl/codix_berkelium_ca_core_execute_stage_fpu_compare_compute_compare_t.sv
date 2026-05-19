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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_compare_compute_compare_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_fpu_compare_compute_compare_t(
    input  logic [5:0] s_op_i_Q,
    input  logic [4:0] s_properties_i_Q,
    input  logic [4:0] s_ROB_ptr_i_Q,
    input  logic [31:0] s_srcA_i_Q,
    input  logic [31:0] s_srcB_i_Q,
    input  logic s_start_i_Q,
    output logic s_done_o_D,
    output logic [4:0] s_flags_o_D,
    output logic [31:0] s_result_o_D,
    output logic [4:0] s_ROB_ptr_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic a_eq_b_B0;
    // signal/wire
    logic a_larger_b_B0;
    // signal/wire
    logic cmp_eq_B0;
    // signal/wire
    logic cmp_le_B0;
    // signal/wire
    logic cmp_lt_B0;
    // signal/wire
    logic codasip_tmp_var_0;
    // signal/wire
    logic codasip_tmp_var_1;
    // signal/wire
    logic codasip_tmp_var_2;
    // signal/wire
    logic codasip_tmp_var_3;
    // signal/wire
    logic [5:0] codasip_tmp_var_4;
    // signal/wire
    logic codasip_tmp_var_5;
    // signal/wire
    logic [7:0] exp_a_B0;
    // signal/wire
    logic [7:0] exp_b_B0;
    // signal/wire
    logic [22:0] fract_a_B0;
    // signal/wire
    logic [22:0] fract_b_B0;
    // signal/wire
    logic invalid_B0;
    // signal/wire
    logic invalid_minmax_B0;
    // signal/wire
    logic nan_A_B0;
    // signal/wire
    logic nan_B_B0;
    // signal/wire
    logic nan_op_B0;
    // signal/wire
    logic res_B0;
    // signal/wire
    logic [31:0] res_max_B0;
    // signal/wire
    logic [31:0] res_min_B0;
    // signal/wire
    logic [4:0] s_flags_o_D_ACT_wire;
    // signal/wire
    logic [31:0] s_result_o_D_ACT_wire;
    // signal/wire
    logic sign_a_B0;
    // signal/wire
    logic sign_b_B0;
    // signal/wire
    logic snan_B0;
    // signal/wire
    logic zero_A_B0;
    // signal/wire
    logic zero_B_B0;

    // data-path code:
    assign snan_B0 = s_properties_i_Q[4];
    assign nan_A_B0 = s_properties_i_Q[3];
    assign nan_B_B0 = s_properties_i_Q[2];
    assign zero_A_B0 = s_properties_i_Q[1];
    assign zero_B_B0 = s_properties_i_Q[0];
    assign sign_a_B0 = s_srcA_i_Q[31];
    assign sign_b_B0 = s_srcB_i_Q[31];
    assign exp_a_B0 = s_srcA_i_Q[30:23];
    assign exp_b_B0 = s_srcB_i_Q[30:23];
    assign fract_a_B0 = s_srcA_i_Q[22:0];
    assign fract_b_B0 = s_srcB_i_Q[22:0];
    assign nan_op_B0 = (nan_A_B0 || nan_B_B0);
    assign codasip_tmp_var_0 = (exp_a_B0 > exp_b_B0);
    assign codasip_tmp_var_1 = (!codasip_tmp_var_0) ? (exp_a_B0 == exp_b_B0) : 1'b0;
    assign codasip_tmp_var_2 = codasip_tmp_var_1 ? (fract_a_B0 > fract_b_B0) : 1'b0;
    assign codasip_tmp_var_3 = ((!codasip_tmp_var_2) && codasip_tmp_var_1) ? (fract_a_B0 == fract_b_B0) : 1'b0;
    assign a_eq_b_B0 = (codasip_tmp_var_0 || codasip_tmp_var_2) ? 1'b0 :
        codasip_tmp_var_3 ? 1'b1 : 1'b0;
    assign a_larger_b_B0 = (codasip_tmp_var_0 || codasip_tmp_var_2) ? 1'b1 : 1'b0;
    assign cmp_eq_B0 = ((!nan_op_B0) && ((zero_A_B0 && zero_B_B0) || ((!(sign_a_B0 ^ sign_b_B0)) && a_eq_b_B0)));
    assign cmp_lt_B0 = (((!nan_op_B0) && (!(zero_A_B0 && zero_B_B0))) && ((((sign_a_B0 && sign_b_B0) && (a_larger_b_B0 & (!a_eq_b_B0))) || (((!sign_a_B0) && (!sign_b_B0)) && ((!a_larger_b_B0) & (!a_eq_b_B0)))) || (sign_a_B0 && (!sign_b_B0))));
    assign cmp_le_B0 = ((!nan_op_B0) && ((((zero_A_B0 && zero_B_B0) || ((sign_a_B0 && sign_b_B0) && (a_larger_b_B0 || a_eq_b_B0))) || (((!sign_a_B0) && (!sign_b_B0)) && ((!a_larger_b_B0) || a_eq_b_B0))) || (sign_a_B0 && (!sign_b_B0))));
    assign codasip_tmp_var_4 = s_op_i_Q;
    always_comb begin
        case ( codasip_tmp_var_4 )
            6'h1c: res_B0 = cmp_eq_B0;
            6'h1d: res_B0 = cmp_lt_B0;
            6'h1e: res_B0 = cmp_le_B0;
            default: res_B0 = 1'b0;
        endcase
    end
    always_comb begin
        case ( codasip_tmp_var_4 )
            6'h1c: invalid_B0 = snan_B0;
            6'h1d: invalid_B0 = nan_op_B0;
            6'h1e: invalid_B0 = nan_op_B0;
            default: invalid_B0 = 1'b0;
        endcase
    end
    assign res_min_B0 = ((((cmp_lt_B0 || (cmp_eq_B0 && sign_a_B0)) || nan_B_B0)) ? s_srcA_i_Q : s_srcB_i_Q);
    assign res_max_B0 = ((((((!cmp_le_B0) || (cmp_eq_B0 && sign_b_B0)) && (!nan_A_B0)) || nan_B_B0)) ? s_srcA_i_Q : s_srcB_i_Q);
    assign invalid_minmax_B0 = (snan_B0 && ((s_op_i_Q == 6'h04) || (s_op_i_Q == 6'h05)));
    assign codasip_tmp_var_5 = ((s_op_i_Q == 6'h05) || (s_op_i_Q == 6'h04));
    assign s_flags_o_D_ACT_wire = codasip_tmp_var_5 ? {invalid_minmax_B0, 1'b0, 1'b0, 1'b0, 1'b0} : {invalid_B0, 1'b0, 1'b0, 1'b0, 1'b0};
    assign s_result_o_D_ACT_wire = codasip_tmp_var_5 ? (((nan_A_B0 && nan_B_B0)) ? 32'h7fc00000 : (((s_op_i_Q == 6'h05)) ? res_max_B0 : (((s_op_i_Q == 6'h04)) ? res_min_B0 : 32'h00000000))) : 32'(res_B0);
    assign s_done_o_D = s_start_i_Q;
    assign s_flags_o_D = s_flags_o_D_ACT_wire;
    assign s_result_o_D = s_result_o_D_ACT_wire;
    assign s_ROB_ptr_o_D = s_ROB_ptr_i_Q;
endmodule: codix_berkelium_ca_core_execute_stage_fpu_compare_compute_compare_t
