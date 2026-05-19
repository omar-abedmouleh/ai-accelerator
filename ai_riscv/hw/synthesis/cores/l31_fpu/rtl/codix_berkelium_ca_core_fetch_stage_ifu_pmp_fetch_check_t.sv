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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_ifu_pmp_fetch_check_t' functional unit.
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

module codix_berkelium_ca_core_fetch_stage_ifu_pmp_fetch_check_t(
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
    input  logic [31:0] s_addr_i_Q,
    input  logic [1:0] s_prv_i_Q,
    output logic s_fault_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic pmp0_hit_B0;
    // signal/wire
    logic pmp0_hit_napot_B0;
    // signal/wire
    logic pmp0_hit_tor_B0;
    // signal/wire
    logic pmp0_pass_B0;
    // signal/wire
    logic [7:0] pmp0cfg_B0;
    // signal/wire
    logic pmp10_hit_B0;
    // signal/wire
    logic pmp10_hit_napot_B0;
    // signal/wire
    logic pmp10_hit_tor_B0;
    // signal/wire
    logic pmp10_pass_B0;
    // signal/wire
    logic [7:0] pmp10cfg_B0;
    // signal/wire
    logic pmp11_hit_B0;
    // signal/wire
    logic pmp11_hit_napot_B0;
    // signal/wire
    logic pmp11_hit_tor_B0;
    // signal/wire
    logic pmp11_pass_B0;
    // signal/wire
    logic [7:0] pmp11cfg_B0;
    // signal/wire
    logic pmp12_hit_B0;
    // signal/wire
    logic pmp12_hit_napot_B0;
    // signal/wire
    logic pmp12_hit_tor_B0;
    // signal/wire
    logic pmp12_pass_B0;
    // signal/wire
    logic [7:0] pmp12cfg_B0;
    // signal/wire
    logic pmp13_hit_B0;
    // signal/wire
    logic pmp13_hit_napot_B0;
    // signal/wire
    logic pmp13_hit_tor_B0;
    // signal/wire
    logic pmp13_pass_B0;
    // signal/wire
    logic [7:0] pmp13cfg_B0;
    // signal/wire
    logic pmp14_hit_B0;
    // signal/wire
    logic pmp14_hit_napot_B0;
    // signal/wire
    logic pmp14_hit_tor_B0;
    // signal/wire
    logic pmp14_pass_B0;
    // signal/wire
    logic [7:0] pmp14cfg_B0;
    // signal/wire
    logic pmp15_hit_B0;
    // signal/wire
    logic pmp15_hit_napot_B0;
    // signal/wire
    logic pmp15_hit_tor_B0;
    // signal/wire
    logic pmp15_pass_B0;
    // signal/wire
    logic [7:0] pmp15cfg_B0;
    // signal/wire
    logic pmp1_hit_B0;
    // signal/wire
    logic pmp1_hit_napot_B0;
    // signal/wire
    logic pmp1_hit_tor_B0;
    // signal/wire
    logic pmp1_pass_B0;
    // signal/wire
    logic [7:0] pmp1cfg_B0;
    // signal/wire
    logic pmp2_hit_B0;
    // signal/wire
    logic pmp2_hit_napot_B0;
    // signal/wire
    logic pmp2_hit_tor_B0;
    // signal/wire
    logic pmp2_pass_B0;
    // signal/wire
    logic [7:0] pmp2cfg_B0;
    // signal/wire
    logic pmp3_hit_B0;
    // signal/wire
    logic pmp3_hit_napot_B0;
    // signal/wire
    logic pmp3_hit_tor_B0;
    // signal/wire
    logic pmp3_pass_B0;
    // signal/wire
    logic [7:0] pmp3cfg_B0;
    // signal/wire
    logic pmp4_hit_B0;
    // signal/wire
    logic pmp4_hit_napot_B0;
    // signal/wire
    logic pmp4_hit_tor_B0;
    // signal/wire
    logic pmp4_pass_B0;
    // signal/wire
    logic [7:0] pmp4cfg_B0;
    // signal/wire
    logic pmp5_hit_B0;
    // signal/wire
    logic pmp5_hit_napot_B0;
    // signal/wire
    logic pmp5_hit_tor_B0;
    // signal/wire
    logic pmp5_pass_B0;
    // signal/wire
    logic [7:0] pmp5cfg_B0;
    // signal/wire
    logic pmp6_hit_B0;
    // signal/wire
    logic pmp6_hit_napot_B0;
    // signal/wire
    logic pmp6_hit_tor_B0;
    // signal/wire
    logic pmp6_pass_B0;
    // signal/wire
    logic [7:0] pmp6cfg_B0;
    // signal/wire
    logic pmp7_hit_B0;
    // signal/wire
    logic pmp7_hit_napot_B0;
    // signal/wire
    logic pmp7_hit_tor_B0;
    // signal/wire
    logic pmp7_pass_B0;
    // signal/wire
    logic [7:0] pmp7cfg_B0;
    // signal/wire
    logic pmp8_hit_B0;
    // signal/wire
    logic pmp8_hit_napot_B0;
    // signal/wire
    logic pmp8_hit_tor_B0;
    // signal/wire
    logic pmp8_pass_B0;
    // signal/wire
    logic [7:0] pmp8cfg_B0;
    // signal/wire
    logic pmp9_hit_B0;
    // signal/wire
    logic pmp9_hit_napot_B0;
    // signal/wire
    logic pmp9_hit_tor_B0;
    // signal/wire
    logic pmp9_pass_B0;
    // signal/wire
    logic [7:0] pmp9cfg_B0;
    // signal/wire
    logic pmp_access_granted_B0;
    // signal/wire
    logic prv_m_B0;

    // data-path code:
    assign pmp0_hit_tor_B0 = (((pmp0cfg_B0[4:3] == 2'h1) && 1'b1) && (r_csr_pmpaddr0_Q > s_addr_i_Q));
    assign pmp1_hit_tor_B0 = (((pmp1cfg_B0[4:3] == 2'h1) && (r_csr_pmpaddr0_Q <= s_addr_i_Q)) && (r_csr_pmpaddr1_Q > s_addr_i_Q));
    assign pmp2_hit_tor_B0 = (((pmp2cfg_B0[4:3] == 2'h1) && (r_csr_pmpaddr1_Q <= s_addr_i_Q)) && (r_csr_pmpaddr2_Q > s_addr_i_Q));
    assign pmp3_hit_tor_B0 = (((pmp3cfg_B0[4:3] == 2'h1) && (r_csr_pmpaddr2_Q <= s_addr_i_Q)) && (r_csr_pmpaddr3_Q > s_addr_i_Q));
    assign pmp4_hit_tor_B0 = (((pmp4cfg_B0[4:3] == 2'h1) && (r_csr_pmpaddr3_Q <= s_addr_i_Q)) && (r_csr_pmpaddr4_Q > s_addr_i_Q));
    assign pmp5_hit_tor_B0 = (((pmp5cfg_B0[4:3] == 2'h1) && (r_csr_pmpaddr4_Q <= s_addr_i_Q)) && (r_csr_pmpaddr5_Q > s_addr_i_Q));
    assign pmp6_hit_tor_B0 = (((pmp6cfg_B0[4:3] == 2'h1) && (r_csr_pmpaddr5_Q <= s_addr_i_Q)) && (r_csr_pmpaddr6_Q > s_addr_i_Q));
    assign pmp7_hit_tor_B0 = (((pmp7cfg_B0[4:3] == 2'h1) && (r_csr_pmpaddr6_Q <= s_addr_i_Q)) && (r_csr_pmpaddr7_Q > s_addr_i_Q));
    assign pmp8_hit_tor_B0 = (((pmp8cfg_B0[4:3] == 2'h1) && (r_csr_pmpaddr7_Q <= s_addr_i_Q)) && (r_csr_pmpaddr8_Q > s_addr_i_Q));
    assign pmp9_hit_tor_B0 = (((pmp9cfg_B0[4:3] == 2'h1) && (r_csr_pmpaddr8_Q <= s_addr_i_Q)) && (r_csr_pmpaddr9_Q > s_addr_i_Q));
    assign pmp10_hit_tor_B0 = (((pmp10cfg_B0[4:3] == 2'h1) && (r_csr_pmpaddr9_Q <= s_addr_i_Q)) && (r_csr_pmpaddr10_Q > s_addr_i_Q));
    assign pmp11_hit_tor_B0 = (((pmp11cfg_B0[4:3] == 2'h1) && (r_csr_pmpaddr10_Q <= s_addr_i_Q)) && (r_csr_pmpaddr11_Q > s_addr_i_Q));
    assign pmp12_hit_tor_B0 = (((pmp12cfg_B0[4:3] == 2'h1) && (r_csr_pmpaddr11_Q <= s_addr_i_Q)) && (r_csr_pmpaddr12_Q > s_addr_i_Q));
    assign pmp13_hit_tor_B0 = (((pmp13cfg_B0[4:3] == 2'h1) && (r_csr_pmpaddr12_Q <= s_addr_i_Q)) && (r_csr_pmpaddr13_Q > s_addr_i_Q));
    assign pmp14_hit_tor_B0 = (((pmp14cfg_B0[4:3] == 2'h1) && (r_csr_pmpaddr13_Q <= s_addr_i_Q)) && (r_csr_pmpaddr14_Q > s_addr_i_Q));
    assign pmp15_hit_tor_B0 = (((pmp15cfg_B0[4:3] == 2'h1) && (r_csr_pmpaddr14_Q <= s_addr_i_Q)) && (r_csr_pmpaddr15_Q > s_addr_i_Q));
    assign pmp0_hit_napot_B0 = (pmp0cfg_B0[4] && ((r_csr_pmpaddr0_Q | execute_stage_lsu_pmp_r_pmp0_napot_mask_Q) == (s_addr_i_Q | execute_stage_lsu_pmp_r_pmp0_napot_mask_Q)));
    assign pmp1_hit_napot_B0 = (pmp1cfg_B0[4] && ((r_csr_pmpaddr1_Q | execute_stage_lsu_pmp_r_pmp1_napot_mask_Q) == (s_addr_i_Q | execute_stage_lsu_pmp_r_pmp1_napot_mask_Q)));
    assign pmp2_hit_napot_B0 = (pmp2cfg_B0[4] && ((r_csr_pmpaddr2_Q | execute_stage_lsu_pmp_r_pmp2_napot_mask_Q) == (s_addr_i_Q | execute_stage_lsu_pmp_r_pmp2_napot_mask_Q)));
    assign pmp3_hit_napot_B0 = (pmp3cfg_B0[4] && ((r_csr_pmpaddr3_Q | execute_stage_lsu_pmp_r_pmp3_napot_mask_Q) == (s_addr_i_Q | execute_stage_lsu_pmp_r_pmp3_napot_mask_Q)));
    assign pmp4_hit_napot_B0 = (pmp4cfg_B0[4] && ((r_csr_pmpaddr4_Q | execute_stage_lsu_pmp_r_pmp4_napot_mask_Q) == (s_addr_i_Q | execute_stage_lsu_pmp_r_pmp4_napot_mask_Q)));
    assign pmp5_hit_napot_B0 = (pmp5cfg_B0[4] && ((r_csr_pmpaddr5_Q | execute_stage_lsu_pmp_r_pmp5_napot_mask_Q) == (s_addr_i_Q | execute_stage_lsu_pmp_r_pmp5_napot_mask_Q)));
    assign pmp6_hit_napot_B0 = (pmp6cfg_B0[4] && ((r_csr_pmpaddr6_Q | execute_stage_lsu_pmp_r_pmp6_napot_mask_Q) == (s_addr_i_Q | execute_stage_lsu_pmp_r_pmp6_napot_mask_Q)));
    assign pmp7_hit_napot_B0 = (pmp7cfg_B0[4] && ((r_csr_pmpaddr7_Q | execute_stage_lsu_pmp_r_pmp7_napot_mask_Q) == (s_addr_i_Q | execute_stage_lsu_pmp_r_pmp7_napot_mask_Q)));
    assign pmp8_hit_napot_B0 = (pmp8cfg_B0[4] && ((r_csr_pmpaddr8_Q | execute_stage_lsu_pmp_r_pmp8_napot_mask_Q) == (s_addr_i_Q | execute_stage_lsu_pmp_r_pmp8_napot_mask_Q)));
    assign pmp9_hit_napot_B0 = (pmp9cfg_B0[4] && ((r_csr_pmpaddr9_Q | execute_stage_lsu_pmp_r_pmp9_napot_mask_Q) == (s_addr_i_Q | execute_stage_lsu_pmp_r_pmp9_napot_mask_Q)));
    assign pmp10_hit_napot_B0 = (pmp10cfg_B0[4] && ((r_csr_pmpaddr10_Q | execute_stage_lsu_pmp_r_pmp10_napot_mask_Q) == (s_addr_i_Q | execute_stage_lsu_pmp_r_pmp10_napot_mask_Q)));
    assign pmp11_hit_napot_B0 = (pmp11cfg_B0[4] && ((r_csr_pmpaddr11_Q | execute_stage_lsu_pmp_r_pmp11_napot_mask_Q) == (s_addr_i_Q | execute_stage_lsu_pmp_r_pmp11_napot_mask_Q)));
    assign pmp12_hit_napot_B0 = (pmp12cfg_B0[4] && ((r_csr_pmpaddr12_Q | execute_stage_lsu_pmp_r_pmp12_napot_mask_Q) == (s_addr_i_Q | execute_stage_lsu_pmp_r_pmp12_napot_mask_Q)));
    assign pmp13_hit_napot_B0 = (pmp13cfg_B0[4] && ((r_csr_pmpaddr13_Q | execute_stage_lsu_pmp_r_pmp13_napot_mask_Q) == (s_addr_i_Q | execute_stage_lsu_pmp_r_pmp13_napot_mask_Q)));
    assign pmp14_hit_napot_B0 = (pmp14cfg_B0[4] && ((r_csr_pmpaddr14_Q | execute_stage_lsu_pmp_r_pmp14_napot_mask_Q) == (s_addr_i_Q | execute_stage_lsu_pmp_r_pmp14_napot_mask_Q)));
    assign pmp15_hit_napot_B0 = (pmp15cfg_B0[4] && ((r_csr_pmpaddr15_Q | execute_stage_lsu_pmp_r_pmp15_napot_mask_Q) == (s_addr_i_Q | execute_stage_lsu_pmp_r_pmp15_napot_mask_Q)));
    assign pmp0_hit_B0 = (pmp0_hit_tor_B0 || pmp0_hit_napot_B0);
    assign pmp1_hit_B0 = (pmp1_hit_tor_B0 || pmp1_hit_napot_B0);
    assign pmp2_hit_B0 = (pmp2_hit_tor_B0 || pmp2_hit_napot_B0);
    assign pmp3_hit_B0 = (pmp3_hit_tor_B0 || pmp3_hit_napot_B0);
    assign pmp4_hit_B0 = (pmp4_hit_tor_B0 || pmp4_hit_napot_B0);
    assign pmp5_hit_B0 = (pmp5_hit_tor_B0 || pmp5_hit_napot_B0);
    assign pmp6_hit_B0 = (pmp6_hit_tor_B0 || pmp6_hit_napot_B0);
    assign pmp7_hit_B0 = (pmp7_hit_tor_B0 || pmp7_hit_napot_B0);
    assign pmp8_hit_B0 = (pmp8_hit_tor_B0 || pmp8_hit_napot_B0);
    assign pmp9_hit_B0 = (pmp9_hit_tor_B0 || pmp9_hit_napot_B0);
    assign pmp10_hit_B0 = (pmp10_hit_tor_B0 || pmp10_hit_napot_B0);
    assign pmp11_hit_B0 = (pmp11_hit_tor_B0 || pmp11_hit_napot_B0);
    assign pmp12_hit_B0 = (pmp12_hit_tor_B0 || pmp12_hit_napot_B0);
    assign pmp13_hit_B0 = (pmp13_hit_tor_B0 || pmp13_hit_napot_B0);
    assign pmp14_hit_B0 = (pmp14_hit_tor_B0 || pmp14_hit_napot_B0);
    assign pmp15_hit_B0 = (pmp15_hit_tor_B0 || pmp15_hit_napot_B0);
    assign prv_m_B0 = (s_prv_i_Q == 2'h3);
    assign pmp0_pass_B0 = pmp0cfg_B0[2];
    assign pmp1_pass_B0 = pmp1cfg_B0[2];
    assign pmp2_pass_B0 = pmp2cfg_B0[2];
    assign pmp3_pass_B0 = pmp3cfg_B0[2];
    assign pmp4_pass_B0 = pmp4cfg_B0[2];
    assign pmp5_pass_B0 = pmp5cfg_B0[2];
    assign pmp6_pass_B0 = pmp6cfg_B0[2];
    assign pmp7_pass_B0 = pmp7cfg_B0[2];
    assign pmp8_pass_B0 = pmp8cfg_B0[2];
    assign pmp9_pass_B0 = pmp9cfg_B0[2];
    assign pmp10_pass_B0 = pmp10cfg_B0[2];
    assign pmp11_pass_B0 = pmp11cfg_B0[2];
    assign pmp12_pass_B0 = pmp12cfg_B0[2];
    assign pmp13_pass_B0 = pmp13cfg_B0[2];
    assign pmp14_pass_B0 = pmp14cfg_B0[2];
    assign pmp15_pass_B0 = pmp15cfg_B0[2];
    assign pmp_access_granted_B0 = ((pmp0_hit_B0) ? (pmp0_pass_B0 || (prv_m_B0 && (!pmp0cfg_B0[7]))) : ((pmp1_hit_B0) ? (pmp1_pass_B0 || (prv_m_B0 && (!pmp1cfg_B0[7]))) : ((pmp2_hit_B0) ? (pmp2_pass_B0 || (prv_m_B0 && (!pmp2cfg_B0[7]))) : ((pmp3_hit_B0) ? (pmp3_pass_B0 || (prv_m_B0 && (!pmp3cfg_B0[7]))) : ((pmp4_hit_B0) ? (pmp4_pass_B0 || (prv_m_B0 && (!pmp4cfg_B0[7]))) : ((pmp5_hit_B0) ? (pmp5_pass_B0 || (prv_m_B0 && (!pmp5cfg_B0[7]))) : ((pmp6_hit_B0) ? (pmp6_pass_B0 || (prv_m_B0 && (!pmp6cfg_B0[7]))) : ((pmp7_hit_B0) ? (pmp7_pass_B0 || (prv_m_B0 && (!pmp7cfg_B0[7]))) : ((pmp8_hit_B0) ? (pmp8_pass_B0 || (prv_m_B0 && (!pmp8cfg_B0[7]))) : ((pmp9_hit_B0) ? (pmp9_pass_B0 || (prv_m_B0 && (!pmp9cfg_B0[7]))) : ((pmp10_hit_B0) ? (pmp10_pass_B0 || (prv_m_B0 && (!pmp10cfg_B0[7]))) : ((pmp11_hit_B0) ? (pmp11_pass_B0 || (prv_m_B0 && (!pmp11cfg_B0[7]))) : ((pmp12_hit_B0) ? (pmp12_pass_B0 || (prv_m_B0 && (!pmp12cfg_B0[7]))) : ((pmp13_hit_B0) ? (pmp13_pass_B0 || (prv_m_B0 && (!pmp13cfg_B0[7]))) : ((pmp14_hit_B0) ? (pmp14_pass_B0 || (prv_m_B0 && (!pmp14cfg_B0[7]))) : ((pmp15_hit_B0) ? (pmp15_pass_B0 || (prv_m_B0 && (!pmp15cfg_B0[7]))) : prv_m_B0))))))))))))))));
    assign pmp0cfg_B0 = r_csr_pmpcfg0_Q[7:0];
    assign pmp1cfg_B0 = r_csr_pmpcfg0_Q[15:8];
    assign pmp2cfg_B0 = r_csr_pmpcfg0_Q[23:16];
    assign pmp3cfg_B0 = r_csr_pmpcfg0_Q[31:24];
    assign pmp4cfg_B0 = r_csr_pmpcfg1_Q[7:0];
    assign pmp5cfg_B0 = r_csr_pmpcfg1_Q[15:8];
    assign pmp6cfg_B0 = r_csr_pmpcfg1_Q[23:16];
    assign pmp7cfg_B0 = r_csr_pmpcfg1_Q[31:24];
    assign pmp8cfg_B0 = r_csr_pmpcfg2_Q[7:0];
    assign pmp9cfg_B0 = r_csr_pmpcfg2_Q[15:8];
    assign pmp10cfg_B0 = r_csr_pmpcfg2_Q[23:16];
    assign pmp11cfg_B0 = r_csr_pmpcfg2_Q[31:24];
    assign pmp12cfg_B0 = r_csr_pmpcfg3_Q[7:0];
    assign pmp13cfg_B0 = r_csr_pmpcfg3_Q[15:8];
    assign pmp14cfg_B0 = r_csr_pmpcfg3_Q[23:16];
    assign pmp15cfg_B0 = r_csr_pmpcfg3_Q[31:24];
    assign s_fault_o_D = (~pmp_access_granted_B0);
endmodule: codix_berkelium_ca_core_fetch_stage_ifu_pmp_fetch_check_t
