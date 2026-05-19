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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_b_unit_ctlz_xlen_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_b_unit_ctlz_xlen_t(
    input  logic ACT,
    input  logic [31:0] codasip_param_0,
    output logic [31:0] RET
);
    // type, wire and constant declarations:
    // signal/wire
    logic signed [31:0] codasip_return2_ctlz_xlen_inline_1_inline_1;
    // signal/wire
    logic signed [31:0] operand_inline_1_inline_1;
    // signal/wire
    logic signed [31:0] result_inline_1_inline_1_B0;

    // data-path code:
    assign operand_inline_1_inline_1 = signed'(codasip_param_0);
    assign result_inline_1_inline_1_B0 = (((operand_inline_1_inline_1[31] != 1'b0)) ? 32'sh00000000 : (((operand_inline_1_inline_1[30] != 1'b0)) ? 32'sh00000001 : (((operand_inline_1_inline_1[29] != 1'b0)) ? 32'sh00000002 : (((operand_inline_1_inline_1[28] != 1'b0)) ? 32'sh00000003 : (((operand_inline_1_inline_1[27] != 1'b0)) ? 32'sh00000004 : (((operand_inline_1_inline_1[26] != 1'b0)) ? 32'sh00000005 : (((operand_inline_1_inline_1[25] != 1'b0)) ? 32'sh00000006 : (((operand_inline_1_inline_1[24] != 1'b0)) ? 32'sh00000007 : (((operand_inline_1_inline_1[23] != 1'b0)) ? 32'sh00000008 : (((operand_inline_1_inline_1[22] != 1'b0)) ? 32'sh00000009 : (((operand_inline_1_inline_1[21] != 1'b0)) ? 32'sh0000000a : (((operand_inline_1_inline_1[20] != 1'b0)) ? 32'sh0000000b : (((operand_inline_1_inline_1[19] != 1'b0)) ? 32'sh0000000c : (((operand_inline_1_inline_1[18] != 1'b0)) ? 32'sh0000000d : (((operand_inline_1_inline_1[17] != 1'b0)) ? 32'sh0000000e : (((operand_inline_1_inline_1[16] != 1'b0)) ? 32'sh0000000f : (((operand_inline_1_inline_1[15] != 1'b0)) ? 32'sh00000010 : (((operand_inline_1_inline_1[14] != 1'b0)) ? 32'sh00000011 : (((operand_inline_1_inline_1[13] != 1'b0)) ? 32'sh00000012 : (((operand_inline_1_inline_1[12] != 1'b0)) ? 32'sh00000013 : (((operand_inline_1_inline_1[11] != 1'b0)) ? 32'sh00000014 : (((operand_inline_1_inline_1[10] != 1'b0)) ? 32'sh00000015 : (((operand_inline_1_inline_1[9] != 1'b0)) ? 32'sh00000016 : (((operand_inline_1_inline_1[8] != 1'b0)) ? 32'sh00000017 : (((operand_inline_1_inline_1[7] != 1'b0)) ? 32'sh00000018 : (((operand_inline_1_inline_1[6] != 1'b0)) ? 32'sh00000019 : (((operand_inline_1_inline_1[5] != 1'b0)) ? 32'sh0000001a : (((operand_inline_1_inline_1[4] != 1'b0)) ? 32'sh0000001b : (((operand_inline_1_inline_1[3] != 1'b0)) ? 32'sh0000001c : (((operand_inline_1_inline_1[2] != 1'b0)) ? 32'sh0000001d : (((operand_inline_1_inline_1[1] != 1'b0)) ? 32'sh0000001e : (((operand_inline_1_inline_1[0] != 1'b0)) ? 32'sh0000001f : 32'sh00000020))))))))))))))))))))))))))))))));
    assign codasip_return2_ctlz_xlen_inline_1_inline_1 = (ACT == 1'b1) ? result_inline_1_inline_1_B0 : 32'sh00000000;
    assign RET = unsigned'(codasip_return2_ctlz_xlen_inline_1_inline_1);
endmodule: codix_berkelium_ca_core_execute_stage_b_unit_ctlz_xlen_t
