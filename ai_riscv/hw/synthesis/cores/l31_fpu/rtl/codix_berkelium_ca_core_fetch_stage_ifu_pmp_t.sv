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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_ifu_pmp_t' CodAL module.
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

module codix_berkelium_ca_core_fetch_stage_ifu_pmp_t(
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp0_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp10_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp11_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp12_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp13_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp14_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp15_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp1_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp2_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp3_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp4_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp5_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp6_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp7_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp8_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp9_napot_mask_Q,
    input  logic [31:0] fetch_s_addr_i_D,
    input  logic [1:0] fetch_s_prv_i_D,
    input  logic [31:0] r_csr_pmpaddr0_Q,
    input  logic [31:0] r_csr_pmpaddr10_Q,
    input  logic [31:0] r_csr_pmpaddr11_Q,
    input  logic [31:0] r_csr_pmpaddr12_Q,
    input  logic [31:0] r_csr_pmpaddr13_Q,
    input  logic [31:0] r_csr_pmpaddr14_Q,
    input  logic [31:0] r_csr_pmpaddr15_Q,
    input  logic [31:0] r_csr_pmpaddr1_Q,
    input  logic [31:0] r_csr_pmpaddr2_Q,
    input  logic [31:0] r_csr_pmpaddr3_Q,
    input  logic [31:0] r_csr_pmpaddr4_Q,
    input  logic [31:0] r_csr_pmpaddr5_Q,
    input  logic [31:0] r_csr_pmpaddr6_Q,
    input  logic [31:0] r_csr_pmpaddr7_Q,
    input  logic [31:0] r_csr_pmpaddr8_Q,
    input  logic [31:0] r_csr_pmpaddr9_Q,
    input  logic [31:0] r_csr_pmpcfg0_Q,
    input  logic [31:0] r_csr_pmpcfg1_Q,
    input  logic [31:0] r_csr_pmpcfg2_Q,
    input  logic [31:0] r_csr_pmpcfg3_Q,
    output logic fetch_s_fault_o_Q
);
    // child instances inside CodAL module:
    // CodAL module instance:
    codix_berkelium_ca_core_fetch_stage_ifu_pmp_fetch_t fetch (
        .execute_stage_lsu_pmp_r_pmp0_napot_mask_Q(execute_stage_lsu_pmp_r_pmp0_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp10_napot_mask_Q(execute_stage_lsu_pmp_r_pmp10_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp11_napot_mask_Q(execute_stage_lsu_pmp_r_pmp11_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp12_napot_mask_Q(execute_stage_lsu_pmp_r_pmp12_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp13_napot_mask_Q(execute_stage_lsu_pmp_r_pmp13_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp14_napot_mask_Q(execute_stage_lsu_pmp_r_pmp14_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp15_napot_mask_Q(execute_stage_lsu_pmp_r_pmp15_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp1_napot_mask_Q(execute_stage_lsu_pmp_r_pmp1_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp2_napot_mask_Q(execute_stage_lsu_pmp_r_pmp2_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp3_napot_mask_Q(execute_stage_lsu_pmp_r_pmp3_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp4_napot_mask_Q(execute_stage_lsu_pmp_r_pmp4_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp5_napot_mask_Q(execute_stage_lsu_pmp_r_pmp5_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp6_napot_mask_Q(execute_stage_lsu_pmp_r_pmp6_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp7_napot_mask_Q(execute_stage_lsu_pmp_r_pmp7_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp8_napot_mask_Q(execute_stage_lsu_pmp_r_pmp8_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp9_napot_mask_Q(execute_stage_lsu_pmp_r_pmp9_napot_mask_Q),
        .r_csr_pmpaddr0_Q(r_csr_pmpaddr0_Q),
        .r_csr_pmpaddr10_Q(r_csr_pmpaddr10_Q),
        .r_csr_pmpaddr11_Q(r_csr_pmpaddr11_Q),
        .r_csr_pmpaddr12_Q(r_csr_pmpaddr12_Q),
        .r_csr_pmpaddr13_Q(r_csr_pmpaddr13_Q),
        .r_csr_pmpaddr14_Q(r_csr_pmpaddr14_Q),
        .r_csr_pmpaddr15_Q(r_csr_pmpaddr15_Q),
        .r_csr_pmpaddr1_Q(r_csr_pmpaddr1_Q),
        .r_csr_pmpaddr2_Q(r_csr_pmpaddr2_Q),
        .r_csr_pmpaddr3_Q(r_csr_pmpaddr3_Q),
        .r_csr_pmpaddr4_Q(r_csr_pmpaddr4_Q),
        .r_csr_pmpaddr5_Q(r_csr_pmpaddr5_Q),
        .r_csr_pmpaddr6_Q(r_csr_pmpaddr6_Q),
        .r_csr_pmpaddr7_Q(r_csr_pmpaddr7_Q),
        .r_csr_pmpaddr8_Q(r_csr_pmpaddr8_Q),
        .r_csr_pmpaddr9_Q(r_csr_pmpaddr9_Q),
        .r_csr_pmpcfg0_Q(r_csr_pmpcfg0_Q),
        .r_csr_pmpcfg1_Q(r_csr_pmpcfg1_Q),
        .r_csr_pmpcfg2_Q(r_csr_pmpcfg2_Q),
        .r_csr_pmpcfg3_Q(r_csr_pmpcfg3_Q),
        .s_addr_i_D(fetch_s_addr_i_D),
        .s_prv_i_D(fetch_s_prv_i_D),
        .s_fault_o_Q(fetch_s_fault_o_Q)
    );

endmodule: codix_berkelium_ca_core_fetch_stage_ifu_pmp_t
