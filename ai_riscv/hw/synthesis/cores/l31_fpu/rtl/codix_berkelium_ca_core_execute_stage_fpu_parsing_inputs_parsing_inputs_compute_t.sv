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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_parsing_inputs_parsing_inputs_compute_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_fpu_parsing_inputs_parsing_inputs_compute_t(
    input  logic [31:0] s_srcA_i_Q,
    input  logic [31:0] s_srcB_i_Q,
    input  logic [30:0] s_srcC_i_Q,
    output logic [8:0] s_add_sub_properties_o_D,
    output logic [4:0] s_classify_properties_o_D,
    output logic [4:0] s_cmp_properties_o_D,
    output logic [2:0] s_f2i_properties_o_D,
    output logic [8:0] s_fused_properties_o_D,
    output logic [7:0] s_mul_properties_o_D,
    output logic [9:0] s_sqrt_div_properties_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic denom_A_B0;
    // signal/wire
    logic inf_A_B0;
    // signal/wire
    logic inf_B0;
    // signal/wire
    logic inf_B_B0;
    // signal/wire
    logic inf_C_B0;
    // signal/wire
    logic mul_nan_op_B0;
    // signal/wire
    logic mul_sign_B0;
    // signal/wire
    logic nan_A_B0;
    // signal/wire
    logic nan_B0;
    // signal/wire
    logic nan_B_B0;
    // signal/wire
    logic nan_C_B0;
    // signal/wire
    logic sign_A_B0;
    // signal/wire
    logic sign_B_B0;
    // signal/wire
    logic snan_A_B0;
    // signal/wire
    logic snan_B0;
    // signal/wire
    logic snan_B_B0;
    // signal/wire
    logic zero_A_B0;
    // signal/wire
    logic zero_B0;
    // signal/wire
    logic zero_B_B0;
    // signal/wire
    logic zero_exp_A_B0;
    // signal/wire
    logic zero_exp_B_B0;
    // signal/wire
    logic zero_exp_C_B0;

    // data-path code:
    assign zero_exp_A_B0 = (s_srcA_i_Q[30:23] == 8'h00);
    assign zero_exp_B_B0 = (s_srcB_i_Q[30:23] == 8'h00);
    assign zero_exp_C_B0 = (s_srcC_i_Q[30:23] == 8'h00);
    assign nan_A_B0 = (((~s_srcA_i_Q[30:23]) == 8'h00) && (s_srcA_i_Q[22:0] != 23'h000000));
    assign nan_B_B0 = (((~s_srcB_i_Q[30:23]) == 8'h00) && (s_srcB_i_Q[22:0] != 23'h000000));
    assign nan_C_B0 = (((~s_srcC_i_Q[30:23]) == 8'h00) && (s_srcC_i_Q[22:0] != 23'h000000));
    assign inf_A_B0 = (((~s_srcA_i_Q[30:23]) == 8'h00) && (s_srcA_i_Q[22:0] == 23'h000000));
    assign inf_B_B0 = (((~s_srcB_i_Q[30:23]) == 8'h00) && (s_srcB_i_Q[22:0] == 23'h000000));
    assign inf_C_B0 = (((~s_srcC_i_Q[30:23]) == 8'h00) && (s_srcC_i_Q[22:0] == 23'h000000));
    assign zero_A_B0 = ((s_srcA_i_Q[30:23] == 8'h00) && (s_srcA_i_Q[22:0] == 23'h000000));
    assign zero_B_B0 = ((s_srcB_i_Q[30:23] == 8'h00) && (s_srcB_i_Q[22:0] == 23'h000000));
    assign denom_A_B0 = ((s_srcA_i_Q[30:23] == 8'h00) && (s_srcA_i_Q[22:0] != 23'h000000));
    assign snan_A_B0 = (nan_A_B0 && (!s_srcA_i_Q[22]));
    assign snan_B_B0 = (nan_B_B0 && (!s_srcB_i_Q[22]));
    assign sign_A_B0 = s_srcA_i_Q[31];
    assign sign_B_B0 = s_srcB_i_Q[31];
    assign snan_B0 = (snan_A_B0 || snan_B_B0);
    assign nan_B0 = (nan_A_B0 || nan_B_B0);
    assign inf_B0 = (inf_A_B0 || inf_B_B0);
    assign zero_B0 = (zero_A_B0 || zero_B_B0);
    assign mul_nan_op_B0 = ((inf_A_B0 && zero_B_B0) || (inf_B_B0 && zero_A_B0));
    assign mul_sign_B0 = (sign_A_B0 ^ sign_B_B0);
    assign s_add_sub_properties_o_D = {zero_exp_A_B0, zero_exp_B_B0, inf_A_B0, inf_B_B0, snan_B0, nan_B0, inf_B0, sign_A_B0, sign_B_B0};
    assign s_classify_properties_o_D = {denom_A_B0, zero_A_B0, nan_A_B0, inf_A_B0, sign_A_B0};
    assign s_cmp_properties_o_D = {snan_B0, nan_A_B0, nan_B_B0, zero_A_B0, zero_B_B0};
    assign s_f2i_properties_o_D = {nan_A_B0, inf_A_B0, sign_A_B0};
    assign s_fused_properties_o_D = {zero_exp_C_B0, nan_C_B0, inf_C_B0, snan_B0, nan_B0, inf_B0, zero_B0, mul_nan_op_B0, mul_sign_B0};
    assign s_mul_properties_o_D = {zero_exp_A_B0, zero_exp_B_B0, snan_B0, nan_B0, inf_B0, zero_B0, mul_nan_op_B0, mul_sign_B0};
    assign s_sqrt_div_properties_o_D = {snan_A_B0, snan_B_B0, zero_exp_A_B0, zero_exp_B_B0, nan_A_B0, nan_B_B0, zero_A_B0, zero_B_B0, inf_A_B0, inf_B_B0};
endmodule: codix_berkelium_ca_core_execute_stage_fpu_parsing_inputs_parsing_inputs_compute_t
