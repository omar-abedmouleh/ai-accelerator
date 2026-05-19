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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_parsing_inputs_t' CodAL module.
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

module codix_berkelium_ca_core_execute_stage_fpu_parsing_inputs_t(
    input  logic [31:0] s_srcA_i_D,
    input  logic [31:0] s_srcB_i_D,
    input  logic [31:0] s_srcC_i_D,
    output logic [8:0] s_add_sub_properties_o_Q,
    output logic [4:0] s_classify_properties_o_Q,
    output logic [4:0] s_cmp_properties_o_Q,
    output logic [2:0] s_f2i_properties_o_Q,
    output logic [8:0] s_fused_properties_o_Q,
    output logic [7:0] s_mul_properties_o_Q,
    output logic [9:0] s_sqrt_div_properties_o_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic [31:0] s_srcA_i;
    // CodAL signal/wire
    logic [31:0] s_srcB_i;
    // CodAL signal/wire
    logic [31:0] s_srcC_i;
    // CodAL signal/wire
    logic [7:0] s_mul_properties_o;
    // CodAL signal/wire
    logic [8:0] s_add_sub_properties_o;
    // CodAL signal/wire
    logic [8:0] s_fused_properties_o;
    // CodAL signal/wire
    logic [2:0] s_f2i_properties_o;
    // CodAL signal/wire
    logic [4:0] s_classify_properties_o;
    // CodAL signal/wire
    logic [4:0] s_cmp_properties_o;
    // CodAL signal/wire
    logic [9:0] s_sqrt_div_properties_o;

    // child instances inside CodAL module:
    // instance of 's_srcA_i' CodAL signal/wire: (single driver)
    assign s_srcA_i = s_srcA_i_D;
    // instance of 's_srcB_i' CodAL signal/wire: (single driver)
    assign s_srcB_i = s_srcB_i_D;
    // instance of 's_srcC_i' CodAL signal/wire: (single driver)
    assign s_srcC_i = s_srcC_i_D;
    // instance of 's_mul_properties_o' CodAL signal/wire: (parent port driver(s))
    assign s_mul_properties_o_Q = s_mul_properties_o;
    // instance of 's_add_sub_properties_o' CodAL signal/wire: (parent port driver(s))
    assign s_add_sub_properties_o_Q = s_add_sub_properties_o;
    // instance of 's_fused_properties_o' CodAL signal/wire: (parent port driver(s))
    assign s_fused_properties_o_Q = s_fused_properties_o;
    // instance of 's_f2i_properties_o' CodAL signal/wire: (parent port driver(s))
    assign s_f2i_properties_o_Q = s_f2i_properties_o;
    // instance of 's_classify_properties_o' CodAL signal/wire: (parent port driver(s))
    assign s_classify_properties_o_Q = s_classify_properties_o;
    // instance of 's_cmp_properties_o' CodAL signal/wire: (parent port driver(s))
    assign s_cmp_properties_o_Q = s_cmp_properties_o;
    // instance of 's_sqrt_div_properties_o' CodAL signal/wire: (parent port driver(s))
    assign s_sqrt_div_properties_o_Q = s_sqrt_div_properties_o;
    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_fpu_parsing_inputs_parsing_inputs_compute_t parsing_inputs_compute (
        .s_srcA_i_Q(s_srcA_i),
        .s_srcB_i_Q(s_srcB_i),
        .s_srcC_i_Q(s_srcC_i[30:0]),
        .s_add_sub_properties_o_D(s_add_sub_properties_o),
        .s_classify_properties_o_D(s_classify_properties_o),
        .s_cmp_properties_o_D(s_cmp_properties_o),
        .s_f2i_properties_o_D(s_f2i_properties_o),
        .s_fused_properties_o_D(s_fused_properties_o),
        .s_mul_properties_o_D(s_mul_properties_o),
        .s_sqrt_div_properties_o_D(s_sqrt_div_properties_o)
    );

endmodule: codix_berkelium_ca_core_execute_stage_fpu_parsing_inputs_t
