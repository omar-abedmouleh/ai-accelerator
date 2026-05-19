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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_lsu_pma_t' CodAL module.
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

module codix_berkelium_ca_core_execute_stage_lsu_pma_t #(
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
    input  logic [31:0] ldst_s_addr_i_D,
    input  logic [1:0] ldst_s_size_i_D,
    output logic ldst_s_cacheable_o_Q,
    output logic ldst_s_fault_o_Q,
    output logic ldst_s_idempotent_o_Q,
    output logic ldst_s_misaligned_o_Q
);
    // child instances inside CodAL module:
    // CodAL module instance:
    codix_berkelium_ca_core_execute_stage_lsu_pma_ldst_t #(
        .pma_base0_p(pma_base0_p),
        .pma_mask0_p(pma_mask0_p),
        .pma_enable_p(pma_enable_p),
        .pma_base1_p(pma_base1_p),
        .pma_mask1_p(pma_mask1_p),
        .pma_base2_p(pma_base2_p),
        .pma_mask2_p(pma_mask2_p),
        .pma_base3_p(pma_base3_p),
        .pma_mask3_p(pma_mask3_p),
        .pma_base4_p(pma_base4_p),
        .pma_mask4_p(pma_mask4_p),
        .pma_base5_p(pma_base5_p),
        .pma_mask5_p(pma_mask5_p),
        .pma_base6_p(pma_base6_p),
        .pma_mask6_p(pma_mask6_p),
        .pma_base7_p(pma_base7_p),
        .pma_mask7_p(pma_mask7_p),
        .pma_base8_p(pma_base8_p),
        .pma_mask8_p(pma_mask8_p),
        .pma_base9_p(pma_base9_p),
        .pma_mask9_p(pma_mask9_p),
        .pma_base10_p(pma_base10_p),
        .pma_mask10_p(pma_mask10_p),
        .pma_base11_p(pma_base11_p),
        .pma_mask11_p(pma_mask11_p),
        .pma_base12_p(pma_base12_p),
        .pma_mask12_p(pma_mask12_p),
        .pma_base13_p(pma_base13_p),
        .pma_mask13_p(pma_mask13_p),
        .pma_base14_p(pma_base14_p),
        .pma_mask14_p(pma_mask14_p),
        .pma_base15_p(pma_base15_p),
        .pma_mask15_p(pma_mask15_p),
        .pma_cfg15_p(pma_cfg15_p),
        .pma_cfg14_p(pma_cfg14_p),
        .pma_cfg13_p(pma_cfg13_p),
        .pma_cfg12_p(pma_cfg12_p),
        .pma_cfg11_p(pma_cfg11_p),
        .pma_cfg10_p(pma_cfg10_p),
        .pma_cfg9_p(pma_cfg9_p),
        .pma_cfg8_p(pma_cfg8_p),
        .pma_cfg7_p(pma_cfg7_p),
        .pma_cfg6_p(pma_cfg6_p),
        .pma_cfg5_p(pma_cfg5_p),
        .pma_cfg4_p(pma_cfg4_p),
        .pma_cfg3_p(pma_cfg3_p),
        .pma_cfg2_p(pma_cfg2_p),
        .pma_cfg1_p(pma_cfg1_p),
        .pma_cfg0_p(pma_cfg0_p)
    ) ldst (
        .s_addr_i_D(ldst_s_addr_i_D),
        .s_size_i_D(ldst_s_size_i_D),
        .s_cacheable_o_Q(ldst_s_cacheable_o_Q),
        .s_fault_o_Q(ldst_s_fault_o_Q),
        .s_idempotent_o_Q(ldst_s_idempotent_o_Q),
        .s_misaligned_o_Q(ldst_s_misaligned_o_Q)
    );

endmodule: codix_berkelium_ca_core_execute_stage_lsu_pma_t
