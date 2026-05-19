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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_sqrt_div_iteration_div_sqrt_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_fpu_sqrt_div_iteration_div_sqrt_t(
    input  logic ACT,
    input  logic [57:0] codasip_param_0,
    input  logic [57:0] codasip_param_1,
    input  logic codasip_param_2,
    input  logic codasip_param_3,
    input  logic [1:0] codasip_param_4,
    output logic [60:0] RET
);
    // type, wire and constant declarations:
    // signal/wire
    logic [57:0] A_in_inline_1_inline_1;
    // signal/wire
    logic [57:0] B_in_inline_1_inline_1;
    // signal/wire
    logic D0_out_inline_1_inline_1_B0;
    // signal/wire
    logic D1_out_inline_1_inline_1_B0;
    // signal/wire
    logic [1:0] D_in_inline_1_inline_1;
    // signal/wire
    logic [60:0] codasip_return2_iteration_div_sqrt_inline_1_inline_1;
    // signal/wire
    logic div_en_inline_1_inline_1;
    // signal/wire
    logic [58:0] result_inline_1_inline_1_B0;
    // signal/wire
    logic sqrt_cin_inline_1_inline_1_B0;
    // signal/wire
    logic sqrt_en_inline_1_inline_1;

    // data-path code:
    assign D_in_inline_1_inline_1 = codasip_param_4;
    assign div_en_inline_1_inline_1 = codasip_param_3;
    assign sqrt_en_inline_1_inline_1 = codasip_param_2;
    assign B_in_inline_1_inline_1 = codasip_param_1;
    assign A_in_inline_1_inline_1 = codasip_param_0;
    assign D0_out_inline_1_inline_1_B0 = (~D_in_inline_1_inline_1[0]);
    assign D1_out_inline_1_inline_1_B0 = (~(D_in_inline_1_inline_1[1] ^ D_in_inline_1_inline_1[0]));
    assign sqrt_cin_inline_1_inline_1_B0 = (sqrt_en_inline_1_inline_1 && (D_in_inline_1_inline_1[1] || D_in_inline_1_inline_1[0]));
    assign result_inline_1_inline_1_B0 = ((59'(A_in_inline_1_inline_1) + 59'(B_in_inline_1_inline_1)) + ((div_en_inline_1_inline_1) ? 59'h000000000000000 : 59'(sqrt_cin_inline_1_inline_1_B0)));
    assign codasip_return2_iteration_div_sqrt_inline_1_inline_1 = (ACT == 1'b1) ? {result_inline_1_inline_1_B0, D1_out_inline_1_inline_1_B0, D0_out_inline_1_inline_1_B0} : 61'h0000000000000000;
    assign RET = codasip_return2_iteration_div_sqrt_inline_1_inline_1;
endmodule: codix_berkelium_ca_core_execute_stage_fpu_sqrt_div_iteration_div_sqrt_t
