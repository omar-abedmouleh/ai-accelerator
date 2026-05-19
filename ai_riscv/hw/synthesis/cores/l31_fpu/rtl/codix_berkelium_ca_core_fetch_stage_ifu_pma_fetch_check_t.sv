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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_ifu_pma_fetch_check_t' functional unit.
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

module codix_berkelium_ca_core_fetch_stage_ifu_pma_fetch_check_t #(
    parameter [31:0] pma_base0_p = 32'h20000000,
    parameter [31:0] pma_mask0_p = 32'hffe00000,
    parameter [15:0] pma_enable_p = 16'h003f,
    parameter [31:0] pma_base1_p = 32'h70010000,
    parameter [31:0] pma_mask1_p = 32'hffffff00,
    parameter [31:0] pma_base2_p = 32'h00020000,
    parameter [31:0] pma_mask2_p = 32'hfffffff0,
    parameter [31:0] pma_base3_p = 32'h00010000,
    parameter [31:0] pma_mask3_p = 32'hfffffe00,
    parameter [31:0] pma_base4_p = 32'h02000000,
    parameter [31:0] pma_mask4_p = 32'hffffc000,
    parameter [31:0] pma_base5_p = 32'h03000000,
    parameter [31:0] pma_mask5_p = 32'hffffc000,
    parameter [31:0] pma_base6_p = 32'h00000000,
    parameter [31:0] pma_mask6_p = 32'h00000000,
    parameter [31:0] pma_base7_p = 32'h00000000,
    parameter [31:0] pma_mask7_p = 32'h00000000,
    parameter [31:0] pma_base8_p = 32'h00000000,
    parameter [31:0] pma_mask8_p = 32'h00000000,
    parameter [31:0] pma_base9_p = 32'h00000000,
    parameter [31:0] pma_mask9_p = 32'h00000000,
    parameter [31:0] pma_base10_p = 32'h00000000,
    parameter [31:0] pma_mask10_p = 32'h00000000,
    parameter [31:0] pma_base11_p = 32'h00000000,
    parameter [31:0] pma_mask11_p = 32'h00000000,
    parameter [31:0] pma_base12_p = 32'h00000000,
    parameter [31:0] pma_mask12_p = 32'h00000000,
    parameter [31:0] pma_base13_p = 32'h00000000,
    parameter [31:0] pma_mask13_p = 32'h00000000,
    parameter [31:0] pma_base14_p = 32'h00000000,
    parameter [31:0] pma_mask14_p = 32'h00000000,
    parameter [31:0] pma_base15_p = 32'h00000000,
    parameter [31:0] pma_mask15_p = 32'h00000000,
    parameter [1:0] pma_cfg15_p = 2'h0,
    parameter [1:0] pma_cfg14_p = 2'h0,
    parameter [1:0] pma_cfg13_p = 2'h0,
    parameter [1:0] pma_cfg12_p = 2'h0,
    parameter [1:0] pma_cfg11_p = 2'h0,
    parameter [1:0] pma_cfg10_p = 2'h0,
    parameter [1:0] pma_cfg9_p = 2'h0,
    parameter [1:0] pma_cfg8_p = 2'h0,
    parameter [1:0] pma_cfg7_p = 2'h0,
    parameter [1:0] pma_cfg6_p = 2'h0,
    parameter [1:0] pma_cfg5_p = 2'h2,
    parameter [1:0] pma_cfg4_p = 2'h2,
    parameter [1:0] pma_cfg3_p = 2'h0,
    parameter [1:0] pma_cfg2_p = 2'h0,
    parameter [1:0] pma_cfg1_p = 2'h0,
    parameter [1:0] pma_cfg0_p = 2'h3
) (
    input  logic pma0_hit_Q,
    input  logic pma10_hit_Q,
    input  logic pma11_hit_Q,
    input  logic pma12_hit_Q,
    input  logic pma13_hit_Q,
    input  logic pma14_hit_Q,
    input  logic pma15_hit_Q,
    input  logic pma1_hit_Q,
    input  logic pma2_hit_Q,
    input  logic pma3_hit_Q,
    input  logic pma4_hit_Q,
    input  logic pma5_hit_Q,
    input  logic pma6_hit_Q,
    input  logic pma7_hit_Q,
    input  logic pma8_hit_Q,
    input  logic pma9_hit_Q,
    input  logic [31:0] s_addr_i_Q,
    output logic pma0_hit_D,
    output logic pma10_hit_D,
    output logic pma11_hit_D,
    output logic pma12_hit_D,
    output logic pma13_hit_D,
    output logic pma14_hit_D,
    output logic pma15_hit_D,
    output logic pma1_hit_D,
    output logic pma2_hit_D,
    output logic pma3_hit_D,
    output logic pma4_hit_D,
    output logic pma5_hit_D,
    output logic pma6_hit_D,
    output logic pma7_hit_D,
    output logic pma8_hit_D,
    output logic pma9_hit_D,
    output logic s_cacheable_o_D,
    output logic s_fault_o_D,
    output logic s_idempotent_o_D
);
    // data-path code:
    assign pma0_hit_D = (pma_enable_p[0] && ((s_addr_i_Q & pma_mask0_p) == pma_base0_p));
    assign pma10_hit_D = (pma_enable_p[10] && ((s_addr_i_Q & pma_mask10_p) == pma_base10_p));
    assign pma11_hit_D = (pma_enable_p[11] && ((s_addr_i_Q & pma_mask11_p) == pma_base11_p));
    assign pma12_hit_D = (pma_enable_p[12] && ((s_addr_i_Q & pma_mask12_p) == pma_base12_p));
    assign pma13_hit_D = (pma_enable_p[13] && ((s_addr_i_Q & pma_mask13_p) == pma_base13_p));
    assign pma14_hit_D = (pma_enable_p[14] && ((s_addr_i_Q & pma_mask14_p) == pma_base14_p));
    assign pma15_hit_D = (pma_enable_p[15] && ((s_addr_i_Q & pma_mask15_p) == pma_base15_p));
    assign pma1_hit_D = (pma_enable_p[1] && ((s_addr_i_Q & pma_mask1_p) == pma_base1_p));
    assign pma2_hit_D = (pma_enable_p[2] && ((s_addr_i_Q & pma_mask2_p) == pma_base2_p));
    assign pma3_hit_D = (pma_enable_p[3] && ((s_addr_i_Q & pma_mask3_p) == pma_base3_p));
    assign pma4_hit_D = (pma_enable_p[4] && ((s_addr_i_Q & pma_mask4_p) == pma_base4_p));
    assign pma5_hit_D = (pma_enable_p[5] && ((s_addr_i_Q & pma_mask5_p) == pma_base5_p));
    assign pma6_hit_D = (pma_enable_p[6] && ((s_addr_i_Q & pma_mask6_p) == pma_base6_p));
    assign pma7_hit_D = (pma_enable_p[7] && ((s_addr_i_Q & pma_mask7_p) == pma_base7_p));
    assign pma8_hit_D = (pma_enable_p[8] && ((s_addr_i_Q & pma_mask8_p) == pma_base8_p));
    assign pma9_hit_D = (pma_enable_p[9] && ((s_addr_i_Q & pma_mask9_p) == pma_base9_p));
    assign s_cacheable_o_D = ((((((((((((((((pma0_hit_Q && pma_cfg0_p[1]) || (pma1_hit_Q && pma_cfg1_p[1])) || (pma2_hit_Q && pma_cfg2_p[1])) || (pma3_hit_Q && pma_cfg3_p[1])) || (pma4_hit_Q && pma_cfg4_p[1])) || (pma5_hit_Q && pma_cfg5_p[1])) || (pma6_hit_Q && pma_cfg6_p[1])) || (pma7_hit_Q && pma_cfg7_p[1])) || (pma8_hit_Q && pma_cfg8_p[1])) || (pma9_hit_Q && pma_cfg9_p[1])) || (pma10_hit_Q && pma_cfg10_p[1])) || (pma11_hit_Q && pma_cfg11_p[1])) || (pma12_hit_Q && pma_cfg12_p[1])) || (pma13_hit_Q && pma_cfg13_p[1])) || (pma14_hit_Q && pma_cfg14_p[1])) || (pma15_hit_Q && pma_cfg15_p[1]));
    assign s_fault_o_D = ((((((((((((((((!pma0_hit_Q) && (!pma1_hit_Q)) && (!pma2_hit_Q)) && (!pma3_hit_Q)) && (!pma4_hit_Q)) && (!pma5_hit_Q)) && (!pma6_hit_Q)) && (!pma7_hit_Q)) && (!pma8_hit_Q)) && (!pma9_hit_Q)) && (!pma10_hit_Q)) && (!pma11_hit_Q)) && (!pma12_hit_Q)) && (!pma13_hit_Q)) && (!pma14_hit_Q)) && (!pma15_hit_Q));
    assign s_idempotent_o_D = ((((((((((((((((pma0_hit_Q && pma_cfg0_p[0]) || (pma1_hit_Q && pma_cfg1_p[0])) || (pma2_hit_Q && pma_cfg2_p[0])) || (pma3_hit_Q && pma_cfg3_p[0])) || (pma4_hit_Q && pma_cfg4_p[0])) || (pma5_hit_Q && pma_cfg5_p[0])) || (pma6_hit_Q && pma_cfg6_p[0])) || (pma7_hit_Q && pma_cfg7_p[0])) || (pma8_hit_Q && pma_cfg8_p[0])) || (pma9_hit_Q && pma_cfg9_p[0])) || (pma10_hit_Q && pma_cfg10_p[0])) || (pma11_hit_Q && pma_cfg11_p[0])) || (pma12_hit_Q && pma_cfg12_p[0])) || (pma13_hit_Q && pma_cfg13_p[0])) || (pma14_hit_Q && pma_cfg14_p[0])) || (pma15_hit_Q && pma_cfg15_p[0]));
endmodule: codix_berkelium_ca_core_fetch_stage_ifu_pma_fetch_check_t
