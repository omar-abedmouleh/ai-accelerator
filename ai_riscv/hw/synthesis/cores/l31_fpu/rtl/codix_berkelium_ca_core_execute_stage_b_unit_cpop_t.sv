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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_b_unit_cpop_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_b_unit_cpop_t(
    input  logic ACT,
    input  logic [31:0] codasip_param_0,
    output logic [31:0] RET
);
    // type, wire and constant declarations:
    // signal/wire
    logic signed [31:0] codasip_return2_cpop_inline_1_inline_1;
    // signal/wire
    logic signed [31:0] operand_inline_1_inline_1;
    // signal/wire
    logic signed [31:0] result_inline_1_inline_1_B0;

    // data-path code:
    assign operand_inline_1_inline_1 = signed'(codasip_param_0);
    assign result_inline_1_inline_1_B0 = signed'(32'(unsigned'(6'((((((((((((((((((((((((((((((((6'(operand_inline_1_inline_1[0]) + 6'(operand_inline_1_inline_1[1])) + 6'(operand_inline_1_inline_1[2])) + 6'(operand_inline_1_inline_1[3])) + 6'(operand_inline_1_inline_1[4])) + 6'(operand_inline_1_inline_1[5])) + 6'(operand_inline_1_inline_1[6])) + 6'(operand_inline_1_inline_1[7])) + 6'(operand_inline_1_inline_1[8])) + 6'(operand_inline_1_inline_1[9])) + 6'(operand_inline_1_inline_1[10])) + 6'(operand_inline_1_inline_1[11])) + 6'(operand_inline_1_inline_1[12])) + 6'(operand_inline_1_inline_1[13])) + 6'(operand_inline_1_inline_1[14])) + 6'(operand_inline_1_inline_1[15])) + 6'(operand_inline_1_inline_1[16])) + 6'(operand_inline_1_inline_1[17])) + 6'(operand_inline_1_inline_1[18])) + 6'(operand_inline_1_inline_1[19])) + 6'(operand_inline_1_inline_1[20])) + 6'(operand_inline_1_inline_1[21])) + 6'(operand_inline_1_inline_1[22])) + 6'(operand_inline_1_inline_1[23])) + 6'(operand_inline_1_inline_1[24])) + 6'(operand_inline_1_inline_1[25])) + 6'(operand_inline_1_inline_1[26])) + 6'(operand_inline_1_inline_1[27])) + 6'(operand_inline_1_inline_1[28])) + 6'(operand_inline_1_inline_1[29])) + 6'(operand_inline_1_inline_1[30])) + 6'(operand_inline_1_inline_1[31]))))));
    assign codasip_return2_cpop_inline_1_inline_1 = (ACT == 1'b1) ? result_inline_1_inline_1_B0 : 32'sh00000000;
    assign RET = unsigned'(codasip_return2_cpop_inline_1_inline_1);
endmodule: codix_berkelium_ca_core_execute_stage_b_unit_cpop_t
