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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_lsu_pmp_ldst_t' CodAL module.
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

module codix_berkelium_ca_core_execute_stage_lsu_pmp_ldst_t(
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
    input  logic [31:0] r_pmp0_napot_mask_Q,
    input  logic [31:0] r_pmp10_napot_mask_Q,
    input  logic [31:0] r_pmp11_napot_mask_Q,
    input  logic [31:0] r_pmp12_napot_mask_Q,
    input  logic [31:0] r_pmp13_napot_mask_Q,
    input  logic [31:0] r_pmp14_napot_mask_Q,
    input  logic [31:0] r_pmp15_napot_mask_Q,
    input  logic [31:0] r_pmp1_napot_mask_Q,
    input  logic [31:0] r_pmp2_napot_mask_Q,
    input  logic [31:0] r_pmp3_napot_mask_Q,
    input  logic [31:0] r_pmp4_napot_mask_Q,
    input  logic [31:0] r_pmp5_napot_mask_Q,
    input  logic [31:0] r_pmp6_napot_mask_Q,
    input  logic [31:0] r_pmp7_napot_mask_Q,
    input  logic [31:0] r_pmp8_napot_mask_Q,
    input  logic [31:0] r_pmp9_napot_mask_Q,
    input  logic [31:0] s_addr_i_D,
    input  logic [1:0] s_prv_i_D,
    input  logic s_valid_i_D,
    input  logic s_write_i_D,
    output logic s_fault_o_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic [31:0] s_addr_i;
    // CodAL signal/wire
    logic s_valid_i;
    // CodAL signal/wire
    logic [1:0] s_prv_i;
    // CodAL signal/wire
    logic s_write_i;
    // CodAL signal/wire
    logic s_fault_o;

    // child instances inside CodAL module:
    // instance of 's_addr_i' CodAL signal/wire: (single driver)
    assign s_addr_i = s_addr_i_D;
    // instance of 's_valid_i' CodAL signal/wire: (single driver)
    assign s_valid_i = s_valid_i_D;
    // instance of 's_prv_i' CodAL signal/wire: (single driver)
    assign s_prv_i = s_prv_i_D;
    // instance of 's_write_i' CodAL signal/wire: (single driver)
    assign s_write_i = s_write_i_D;
    // instance of 's_fault_o' CodAL signal/wire: (parent port driver(s))
    assign s_fault_o_Q = s_fault_o;
    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_lsu_pmp_ldst_check_t check (
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
        .r_pmp0_napot_mask_Q(r_pmp0_napot_mask_Q),
        .r_pmp10_napot_mask_Q(r_pmp10_napot_mask_Q),
        .r_pmp11_napot_mask_Q(r_pmp11_napot_mask_Q),
        .r_pmp12_napot_mask_Q(r_pmp12_napot_mask_Q),
        .r_pmp13_napot_mask_Q(r_pmp13_napot_mask_Q),
        .r_pmp14_napot_mask_Q(r_pmp14_napot_mask_Q),
        .r_pmp15_napot_mask_Q(r_pmp15_napot_mask_Q),
        .r_pmp1_napot_mask_Q(r_pmp1_napot_mask_Q),
        .r_pmp2_napot_mask_Q(r_pmp2_napot_mask_Q),
        .r_pmp3_napot_mask_Q(r_pmp3_napot_mask_Q),
        .r_pmp4_napot_mask_Q(r_pmp4_napot_mask_Q),
        .r_pmp5_napot_mask_Q(r_pmp5_napot_mask_Q),
        .r_pmp6_napot_mask_Q(r_pmp6_napot_mask_Q),
        .r_pmp7_napot_mask_Q(r_pmp7_napot_mask_Q),
        .r_pmp8_napot_mask_Q(r_pmp8_napot_mask_Q),
        .r_pmp9_napot_mask_Q(r_pmp9_napot_mask_Q),
        .s_addr_i_Q(s_addr_i),
        .s_prv_i_Q(s_prv_i),
        .s_valid_i_Q(s_valid_i),
        .s_write_i_Q(s_write_i),
        .s_fault_o_D(s_fault_o)
    );

endmodule: codix_berkelium_ca_core_execute_stage_lsu_pmp_ldst_t
