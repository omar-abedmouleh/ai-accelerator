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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_lsu_pmp_csr_write_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_lsu_pmp_csr_write_t(
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
    input  logic [31:0] s_csr_pmpaddr0_new_Q,
    input  logic [31:0] s_csr_pmpaddr10_new_Q,
    input  logic [31:0] s_csr_pmpaddr11_new_Q,
    input  logic [31:0] s_csr_pmpaddr12_new_Q,
    input  logic [31:0] s_csr_pmpaddr13_new_Q,
    input  logic [31:0] s_csr_pmpaddr14_new_Q,
    input  logic [31:0] s_csr_pmpaddr15_new_Q,
    input  logic [31:0] s_csr_pmpaddr1_new_Q,
    input  logic [31:0] s_csr_pmpaddr2_new_Q,
    input  logic [31:0] s_csr_pmpaddr3_new_Q,
    input  logic [31:0] s_csr_pmpaddr4_new_Q,
    input  logic [31:0] s_csr_pmpaddr5_new_Q,
    input  logic [31:0] s_csr_pmpaddr6_new_Q,
    input  logic [31:0] s_csr_pmpaddr7_new_Q,
    input  logic [31:0] s_csr_pmpaddr8_new_Q,
    input  logic [31:0] s_csr_pmpaddr9_new_Q,
    input  logic [31:0] s_csr_pmpcfg0_new_Q,
    input  logic [31:0] s_csr_pmpcfg1_new_Q,
    input  logic [31:0] s_csr_pmpcfg2_new_Q,
    input  logic [31:0] s_csr_pmpcfg3_new_Q,
    input  logic [11:0] s_csr_waddr_i_Q,
    input  logic [31:0] s_csr_wdata_i_Q,
    input  logic s_csr_we_i_Q,
    input  logic s_pmpaddr0_we_Q,
    input  logic s_pmpaddr10_we_Q,
    input  logic s_pmpaddr11_we_Q,
    input  logic s_pmpaddr12_we_Q,
    input  logic s_pmpaddr13_we_Q,
    input  logic s_pmpaddr14_we_Q,
    input  logic s_pmpaddr15_we_Q,
    input  logic s_pmpaddr1_we_Q,
    input  logic s_pmpaddr2_we_Q,
    input  logic s_pmpaddr3_we_Q,
    input  logic s_pmpaddr4_we_Q,
    input  logic s_pmpaddr5_we_Q,
    input  logic s_pmpaddr6_we_Q,
    input  logic s_pmpaddr7_we_Q,
    input  logic s_pmpaddr8_we_Q,
    input  logic s_pmpaddr9_we_Q,
    input  logic s_pmpcfg0_we_Q,
    input  logic s_pmpcfg1_we_Q,
    input  logic s_pmpcfg2_we_Q,
    input  logic s_pmpcfg3_we_Q,
    output logic [31:0] r_csr_pmpaddr0_D,
    output logic r_csr_pmpaddr0_WE,
    output logic [31:0] r_csr_pmpaddr10_D,
    output logic r_csr_pmpaddr10_WE,
    output logic [31:0] r_csr_pmpaddr11_D,
    output logic r_csr_pmpaddr11_WE,
    output logic [31:0] r_csr_pmpaddr12_D,
    output logic r_csr_pmpaddr12_WE,
    output logic [31:0] r_csr_pmpaddr13_D,
    output logic r_csr_pmpaddr13_WE,
    output logic [31:0] r_csr_pmpaddr14_D,
    output logic r_csr_pmpaddr14_WE,
    output logic [31:0] r_csr_pmpaddr15_D,
    output logic r_csr_pmpaddr15_WE,
    output logic [31:0] r_csr_pmpaddr1_D,
    output logic r_csr_pmpaddr1_WE,
    output logic [31:0] r_csr_pmpaddr2_D,
    output logic r_csr_pmpaddr2_WE,
    output logic [31:0] r_csr_pmpaddr3_D,
    output logic r_csr_pmpaddr3_WE,
    output logic [31:0] r_csr_pmpaddr4_D,
    output logic r_csr_pmpaddr4_WE,
    output logic [31:0] r_csr_pmpaddr5_D,
    output logic r_csr_pmpaddr5_WE,
    output logic [31:0] r_csr_pmpaddr6_D,
    output logic r_csr_pmpaddr6_WE,
    output logic [31:0] r_csr_pmpaddr7_D,
    output logic r_csr_pmpaddr7_WE,
    output logic [31:0] r_csr_pmpaddr8_D,
    output logic r_csr_pmpaddr8_WE,
    output logic [31:0] r_csr_pmpaddr9_D,
    output logic r_csr_pmpaddr9_WE,
    output logic [31:0] r_csr_pmpcfg0_D,
    output logic r_csr_pmpcfg0_WE,
    output logic [31:0] r_csr_pmpcfg1_D,
    output logic r_csr_pmpcfg1_WE,
    output logic [31:0] r_csr_pmpcfg2_D,
    output logic r_csr_pmpcfg2_WE,
    output logic [31:0] r_csr_pmpcfg3_D,
    output logic r_csr_pmpcfg3_WE,
    output logic [31:0] r_pmp0_napot_mask_D,
    output logic r_pmp0_napot_mask_WE,
    output logic [31:0] r_pmp10_napot_mask_D,
    output logic r_pmp10_napot_mask_WE,
    output logic [31:0] r_pmp11_napot_mask_D,
    output logic r_pmp11_napot_mask_WE,
    output logic [31:0] r_pmp12_napot_mask_D,
    output logic r_pmp12_napot_mask_WE,
    output logic [31:0] r_pmp13_napot_mask_D,
    output logic r_pmp13_napot_mask_WE,
    output logic [31:0] r_pmp14_napot_mask_D,
    output logic r_pmp14_napot_mask_WE,
    output logic [31:0] r_pmp15_napot_mask_D,
    output logic r_pmp15_napot_mask_WE,
    output logic [31:0] r_pmp1_napot_mask_D,
    output logic r_pmp1_napot_mask_WE,
    output logic [31:0] r_pmp2_napot_mask_D,
    output logic r_pmp2_napot_mask_WE,
    output logic [31:0] r_pmp3_napot_mask_D,
    output logic r_pmp3_napot_mask_WE,
    output logic [31:0] r_pmp4_napot_mask_D,
    output logic r_pmp4_napot_mask_WE,
    output logic [31:0] r_pmp5_napot_mask_D,
    output logic r_pmp5_napot_mask_WE,
    output logic [31:0] r_pmp6_napot_mask_D,
    output logic r_pmp6_napot_mask_WE,
    output logic [31:0] r_pmp7_napot_mask_D,
    output logic r_pmp7_napot_mask_WE,
    output logic [31:0] r_pmp8_napot_mask_D,
    output logic r_pmp8_napot_mask_WE,
    output logic [31:0] r_pmp9_napot_mask_D,
    output logic r_pmp9_napot_mask_WE,
    output logic [31:0] s_csr_pmpaddr0_new_D,
    output logic [31:0] s_csr_pmpaddr10_new_D,
    output logic [31:0] s_csr_pmpaddr11_new_D,
    output logic [31:0] s_csr_pmpaddr12_new_D,
    output logic [31:0] s_csr_pmpaddr13_new_D,
    output logic [31:0] s_csr_pmpaddr14_new_D,
    output logic [31:0] s_csr_pmpaddr15_new_D,
    output logic [31:0] s_csr_pmpaddr1_new_D,
    output logic [31:0] s_csr_pmpaddr2_new_D,
    output logic [31:0] s_csr_pmpaddr3_new_D,
    output logic [31:0] s_csr_pmpaddr4_new_D,
    output logic [31:0] s_csr_pmpaddr5_new_D,
    output logic [31:0] s_csr_pmpaddr6_new_D,
    output logic [31:0] s_csr_pmpaddr7_new_D,
    output logic [31:0] s_csr_pmpaddr8_new_D,
    output logic [31:0] s_csr_pmpaddr9_new_D,
    output logic [31:0] s_csr_pmpcfg0_new_D,
    output logic [31:0] s_csr_pmpcfg1_new_D,
    output logic [31:0] s_csr_pmpcfg2_new_D,
    output logic [31:0] s_csr_pmpcfg3_new_D,
    output logic s_pmpaddr0_we_D,
    output logic s_pmpaddr10_we_D,
    output logic s_pmpaddr11_we_D,
    output logic s_pmpaddr12_we_D,
    output logic s_pmpaddr13_we_D,
    output logic s_pmpaddr14_we_D,
    output logic s_pmpaddr15_we_D,
    output logic s_pmpaddr1_we_D,
    output logic s_pmpaddr2_we_D,
    output logic s_pmpaddr3_we_D,
    output logic s_pmpaddr4_we_D,
    output logic s_pmpaddr5_we_D,
    output logic s_pmpaddr6_we_D,
    output logic s_pmpaddr7_we_D,
    output logic s_pmpaddr8_we_D,
    output logic s_pmpaddr9_we_D,
    output logic s_pmpcfg0_we_D,
    output logic s_pmpcfg1_we_D,
    output logic s_pmpcfg2_we_D,
    output logic s_pmpcfg3_we_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic codasip_tmp_var_0;
    // signal/wire
    logic codasip_tmp_var_1;
    // signal/wire
    logic codasip_tmp_var_10;
    // signal/wire
    logic codasip_tmp_var_11;
    // signal/wire
    logic codasip_tmp_var_12;
    // signal/wire
    logic codasip_tmp_var_13;
    // signal/wire
    logic codasip_tmp_var_14;
    // signal/wire
    logic codasip_tmp_var_15;
    // signal/wire
    logic codasip_tmp_var_16;
    // signal/wire
    logic codasip_tmp_var_17;
    // signal/wire
    logic codasip_tmp_var_18;
    // signal/wire
    logic codasip_tmp_var_19;
    // signal/wire
    logic codasip_tmp_var_2;
    // signal/wire
    logic codasip_tmp_var_20;
    // signal/wire
    logic codasip_tmp_var_21;
    // signal/wire
    logic codasip_tmp_var_22;
    // signal/wire
    logic codasip_tmp_var_23;
    // signal/wire
    logic codasip_tmp_var_24;
    // signal/wire
    logic codasip_tmp_var_25;
    // signal/wire
    logic codasip_tmp_var_26;
    // signal/wire
    logic codasip_tmp_var_27;
    // signal/wire
    logic codasip_tmp_var_28;
    // signal/wire
    logic codasip_tmp_var_29;
    // signal/wire
    logic codasip_tmp_var_3;
    // signal/wire
    logic codasip_tmp_var_30;
    // signal/wire
    logic codasip_tmp_var_31;
    // signal/wire
    logic codasip_tmp_var_32;
    // signal/wire
    logic codasip_tmp_var_33;
    // signal/wire
    logic codasip_tmp_var_34;
    // signal/wire
    logic codasip_tmp_var_35;
    // signal/wire
    logic codasip_tmp_var_4;
    // signal/wire
    logic codasip_tmp_var_5;
    // signal/wire
    logic codasip_tmp_var_6;
    // signal/wire
    logic codasip_tmp_var_7;
    // signal/wire
    logic codasip_tmp_var_8;
    // signal/wire
    logic codasip_tmp_var_9;
    // signal/wire
    logic [7:0] new_pmp0cfg_B0;
    // signal/wire
    logic [7:0] new_pmp10cfg_B0;
    // signal/wire
    logic [7:0] new_pmp11cfg_B0;
    // signal/wire
    logic [7:0] new_pmp12cfg_B0;
    // signal/wire
    logic [7:0] new_pmp13cfg_B0;
    // signal/wire
    logic [7:0] new_pmp14cfg_B0;
    // signal/wire
    logic [7:0] new_pmp15cfg_B0;
    // signal/wire
    logic [7:0] new_pmp1cfg_B0;
    // signal/wire
    logic [7:0] new_pmp2cfg_B0;
    // signal/wire
    logic [7:0] new_pmp3cfg_B0;
    // signal/wire
    logic [7:0] new_pmp4cfg_B0;
    // signal/wire
    logic [7:0] new_pmp5cfg_B0;
    // signal/wire
    logic [7:0] new_pmp6cfg_B0;
    // signal/wire
    logic [7:0] new_pmp7cfg_B0;
    // signal/wire
    logic [7:0] new_pmp8cfg_B0;
    // signal/wire
    logic [7:0] new_pmp9cfg_B0;
    // signal/wire
    logic [7:0] pmp0cfg_B0;
    // signal/wire
    logic pmp0cfg_tor_napot_bit_B0;
    // signal/wire
    logic [7:0] pmp0cfg_wdata_B0;
    // signal/wire
    logic pmp0lock_B0;
    // signal/wire
    logic [7:0] pmp10cfg_B0;
    // signal/wire
    logic pmp10cfg_tor_napot_bit_B0;
    // signal/wire
    logic [7:0] pmp10cfg_wdata_B0;
    // signal/wire
    logic pmp10lock_B0;
    // signal/wire
    logic [7:0] pmp11cfg_B0;
    // signal/wire
    logic pmp11cfg_tor_napot_bit_B0;
    // signal/wire
    logic [7:0] pmp11cfg_wdata_B0;
    // signal/wire
    logic pmp11lock_B0;
    // signal/wire
    logic [7:0] pmp12cfg_B0;
    // signal/wire
    logic pmp12cfg_tor_napot_bit_B0;
    // signal/wire
    logic [7:0] pmp12cfg_wdata_B0;
    // signal/wire
    logic pmp12lock_B0;
    // signal/wire
    logic [7:0] pmp13cfg_B0;
    // signal/wire
    logic pmp13cfg_tor_napot_bit_B0;
    // signal/wire
    logic [7:0] pmp13cfg_wdata_B0;
    // signal/wire
    logic pmp13lock_B0;
    // signal/wire
    logic [7:0] pmp14cfg_B0;
    // signal/wire
    logic pmp14cfg_tor_napot_bit_B0;
    // signal/wire
    logic [7:0] pmp14cfg_wdata_B0;
    // signal/wire
    logic pmp14lock_B0;
    // signal/wire
    logic [7:0] pmp15cfg_B0;
    // signal/wire
    logic pmp15cfg_tor_napot_bit_B0;
    // signal/wire
    logic [7:0] pmp15cfg_wdata_B0;
    // signal/wire
    logic pmp15lock_B0;
    // signal/wire
    logic [7:0] pmp1cfg_B0;
    // signal/wire
    logic pmp1cfg_tor_napot_bit_B0;
    // signal/wire
    logic [7:0] pmp1cfg_wdata_B0;
    // signal/wire
    logic pmp1lock_B0;
    // signal/wire
    logic [7:0] pmp2cfg_B0;
    // signal/wire
    logic pmp2cfg_tor_napot_bit_B0;
    // signal/wire
    logic [7:0] pmp2cfg_wdata_B0;
    // signal/wire
    logic pmp2lock_B0;
    // signal/wire
    logic [7:0] pmp3cfg_B0;
    // signal/wire
    logic pmp3cfg_tor_napot_bit_B0;
    // signal/wire
    logic [7:0] pmp3cfg_wdata_B0;
    // signal/wire
    logic pmp3lock_B0;
    // signal/wire
    logic [7:0] pmp4cfg_B0;
    // signal/wire
    logic pmp4cfg_tor_napot_bit_B0;
    // signal/wire
    logic [7:0] pmp4cfg_wdata_B0;
    // signal/wire
    logic pmp4lock_B0;
    // signal/wire
    logic [7:0] pmp5cfg_B0;
    // signal/wire
    logic pmp5cfg_tor_napot_bit_B0;
    // signal/wire
    logic [7:0] pmp5cfg_wdata_B0;
    // signal/wire
    logic pmp5lock_B0;
    // signal/wire
    logic [7:0] pmp6cfg_B0;
    // signal/wire
    logic pmp6cfg_tor_napot_bit_B0;
    // signal/wire
    logic [7:0] pmp6cfg_wdata_B0;
    // signal/wire
    logic pmp6lock_B0;
    // signal/wire
    logic [7:0] pmp7cfg_B0;
    // signal/wire
    logic pmp7cfg_tor_napot_bit_B0;
    // signal/wire
    logic [7:0] pmp7cfg_wdata_B0;
    // signal/wire
    logic pmp7lock_B0;
    // signal/wire
    logic [7:0] pmp8cfg_B0;
    // signal/wire
    logic pmp8cfg_tor_napot_bit_B0;
    // signal/wire
    logic [7:0] pmp8cfg_wdata_B0;
    // signal/wire
    logic pmp8lock_B0;
    // signal/wire
    logic [7:0] pmp9cfg_B0;
    // signal/wire
    logic pmp9cfg_tor_napot_bit_B0;
    // signal/wire
    logic [7:0] pmp9cfg_wdata_B0;
    // signal/wire
    logic pmp9lock_B0;
    // signal/wire
    logic [31:0] s_csr_pmpaddr0_new_D_ACT_wire;
    // signal/wire
    logic [31:0] s_csr_pmpaddr10_new_D_ACT_wire;
    // signal/wire
    logic [31:0] s_csr_pmpaddr11_new_D_ACT_wire;
    // signal/wire
    logic [31:0] s_csr_pmpaddr12_new_D_ACT_wire;
    // signal/wire
    logic [31:0] s_csr_pmpaddr13_new_D_ACT_wire;
    // signal/wire
    logic [31:0] s_csr_pmpaddr14_new_D_ACT_wire;
    // signal/wire
    logic [31:0] s_csr_pmpaddr15_new_D_ACT_wire;
    // signal/wire
    logic [31:0] s_csr_pmpaddr1_new_D_ACT_wire;
    // signal/wire
    logic [31:0] s_csr_pmpaddr2_new_D_ACT_wire;
    // signal/wire
    logic [31:0] s_csr_pmpaddr3_new_D_ACT_wire;
    // signal/wire
    logic [31:0] s_csr_pmpaddr4_new_D_ACT_wire;
    // signal/wire
    logic [31:0] s_csr_pmpaddr5_new_D_ACT_wire;
    // signal/wire
    logic [31:0] s_csr_pmpaddr6_new_D_ACT_wire;
    // signal/wire
    logic [31:0] s_csr_pmpaddr7_new_D_ACT_wire;
    // signal/wire
    logic [31:0] s_csr_pmpaddr8_new_D_ACT_wire;
    // signal/wire
    logic [31:0] s_csr_pmpaddr9_new_D_ACT_wire;
    // signal/wire
    logic [31:0] s_csr_pmpcfg0_new_D_ACT_wire;
    // signal/wire
    logic [31:0] s_csr_pmpcfg1_new_D_ACT_wire;
    // signal/wire
    logic [31:0] s_csr_pmpcfg2_new_D_ACT_wire;
    // signal/wire
    logic [31:0] s_csr_pmpcfg3_new_D_ACT_wire;

    // data-path code:
    assign codasip_tmp_var_5 = (s_pmpcfg0_we_Q | s_pmpaddr0_we_Q);
    assign codasip_tmp_var_7 = (s_pmpcfg0_we_Q | s_pmpaddr1_we_Q);
    assign codasip_tmp_var_9 = (s_pmpcfg0_we_Q | s_pmpaddr2_we_Q);
    assign codasip_tmp_var_11 = (s_pmpcfg0_we_Q | s_pmpaddr3_we_Q);
    assign codasip_tmp_var_13 = (s_pmpcfg1_we_Q | s_pmpaddr4_we_Q);
    assign codasip_tmp_var_15 = (s_pmpcfg1_we_Q | s_pmpaddr5_we_Q);
    assign codasip_tmp_var_17 = (s_pmpcfg1_we_Q | s_pmpaddr6_we_Q);
    assign codasip_tmp_var_19 = (s_pmpcfg1_we_Q | s_pmpaddr7_we_Q);
    assign codasip_tmp_var_21 = (s_pmpcfg2_we_Q | s_pmpaddr8_we_Q);
    assign codasip_tmp_var_23 = (s_pmpcfg2_we_Q | s_pmpaddr9_we_Q);
    assign codasip_tmp_var_25 = (s_pmpcfg2_we_Q | s_pmpaddr10_we_Q);
    assign codasip_tmp_var_27 = (s_pmpcfg2_we_Q | s_pmpaddr11_we_Q);
    assign codasip_tmp_var_29 = (s_pmpcfg3_we_Q | s_pmpaddr12_we_Q);
    assign codasip_tmp_var_31 = (s_pmpcfg3_we_Q | s_pmpaddr13_we_Q);
    assign codasip_tmp_var_33 = (s_pmpcfg3_we_Q | s_pmpaddr14_we_Q);
    assign codasip_tmp_var_35 = (s_pmpcfg3_we_Q | s_pmpaddr15_we_Q);
    assign codasip_tmp_var_0 = s_pmpcfg0_we_Q;
    assign codasip_tmp_var_1 = s_pmpcfg1_we_Q;
    assign codasip_tmp_var_2 = s_pmpcfg2_we_Q;
    assign codasip_tmp_var_3 = s_pmpcfg3_we_Q;
    assign pmp0lock_B0 = (pmp0cfg_B0[7] || (pmp1cfg_B0[7] && (pmp1cfg_B0[4:3] == 2'h1)));
    assign pmp1lock_B0 = (pmp1cfg_B0[7] || (pmp2cfg_B0[7] && (pmp2cfg_B0[4:3] == 2'h1)));
    assign pmp2lock_B0 = (pmp2cfg_B0[7] || (pmp3cfg_B0[7] && (pmp3cfg_B0[4:3] == 2'h1)));
    assign pmp3lock_B0 = (pmp3cfg_B0[7] || (pmp4cfg_B0[7] && (pmp4cfg_B0[4:3] == 2'h1)));
    assign pmp4lock_B0 = (pmp4cfg_B0[7] || (pmp5cfg_B0[7] && (pmp5cfg_B0[4:3] == 2'h1)));
    assign pmp5lock_B0 = (pmp5cfg_B0[7] || (pmp6cfg_B0[7] && (pmp6cfg_B0[4:3] == 2'h1)));
    assign pmp6lock_B0 = (pmp6cfg_B0[7] || (pmp7cfg_B0[7] && (pmp7cfg_B0[4:3] == 2'h1)));
    assign pmp7lock_B0 = (pmp7cfg_B0[7] || (pmp8cfg_B0[7] && (pmp8cfg_B0[4:3] == 2'h1)));
    assign pmp8lock_B0 = (pmp8cfg_B0[7] || (pmp9cfg_B0[7] && (pmp9cfg_B0[4:3] == 2'h1)));
    assign pmp9lock_B0 = (pmp9cfg_B0[7] || (pmp10cfg_B0[7] && (pmp10cfg_B0[4:3] == 2'h1)));
    assign pmp10lock_B0 = (pmp10cfg_B0[7] || (pmp11cfg_B0[7] && (pmp11cfg_B0[4:3] == 2'h1)));
    assign pmp11lock_B0 = (pmp11cfg_B0[7] || (pmp12cfg_B0[7] && (pmp12cfg_B0[4:3] == 2'h1)));
    assign pmp12lock_B0 = (pmp12cfg_B0[7] || (pmp13cfg_B0[7] && (pmp13cfg_B0[4:3] == 2'h1)));
    assign pmp13lock_B0 = (pmp13cfg_B0[7] || (pmp14cfg_B0[7] && (pmp14cfg_B0[4:3] == 2'h1)));
    assign pmp14lock_B0 = (pmp14cfg_B0[7] || (pmp15cfg_B0[7] && (pmp15cfg_B0[4:3] == 2'h1)));
    assign pmp15lock_B0 = pmp15cfg_B0[7];
    assign codasip_tmp_var_4 = s_pmpaddr0_we_Q;
    assign codasip_tmp_var_6 = s_pmpaddr1_we_Q;
    assign codasip_tmp_var_8 = s_pmpaddr2_we_Q;
    assign codasip_tmp_var_10 = s_pmpaddr3_we_Q;
    assign codasip_tmp_var_12 = s_pmpaddr4_we_Q;
    assign codasip_tmp_var_14 = s_pmpaddr5_we_Q;
    assign codasip_tmp_var_16 = s_pmpaddr6_we_Q;
    assign codasip_tmp_var_18 = s_pmpaddr7_we_Q;
    assign codasip_tmp_var_20 = s_pmpaddr8_we_Q;
    assign codasip_tmp_var_22 = s_pmpaddr9_we_Q;
    assign codasip_tmp_var_24 = s_pmpaddr10_we_Q;
    assign codasip_tmp_var_26 = s_pmpaddr11_we_Q;
    assign codasip_tmp_var_28 = s_pmpaddr12_we_Q;
    assign codasip_tmp_var_30 = s_pmpaddr13_we_Q;
    assign codasip_tmp_var_32 = s_pmpaddr14_we_Q;
    assign codasip_tmp_var_34 = s_pmpaddr15_we_Q;
    assign pmp0cfg_tor_napot_bit_B0 = s_csr_pmpcfg0_new_Q[3];
    assign pmp1cfg_tor_napot_bit_B0 = s_csr_pmpcfg0_new_Q[11];
    assign pmp2cfg_tor_napot_bit_B0 = s_csr_pmpcfg0_new_Q[19];
    assign pmp3cfg_tor_napot_bit_B0 = s_csr_pmpcfg0_new_Q[27];
    assign pmp4cfg_tor_napot_bit_B0 = s_csr_pmpcfg1_new_Q[3];
    assign pmp5cfg_tor_napot_bit_B0 = s_csr_pmpcfg1_new_Q[11];
    assign pmp6cfg_tor_napot_bit_B0 = s_csr_pmpcfg1_new_Q[19];
    assign pmp7cfg_tor_napot_bit_B0 = s_csr_pmpcfg1_new_Q[27];
    assign pmp8cfg_tor_napot_bit_B0 = s_csr_pmpcfg2_new_Q[3];
    assign pmp9cfg_tor_napot_bit_B0 = s_csr_pmpcfg2_new_Q[11];
    assign pmp10cfg_tor_napot_bit_B0 = s_csr_pmpcfg2_new_Q[19];
    assign pmp11cfg_tor_napot_bit_B0 = s_csr_pmpcfg2_new_Q[27];
    assign pmp12cfg_tor_napot_bit_B0 = s_csr_pmpcfg3_new_Q[3];
    assign pmp13cfg_tor_napot_bit_B0 = s_csr_pmpcfg3_new_Q[11];
    assign pmp14cfg_tor_napot_bit_B0 = s_csr_pmpcfg3_new_Q[19];
    assign pmp15cfg_tor_napot_bit_B0 = s_csr_pmpcfg3_new_Q[27];
    assign pmp0cfg_wdata_B0 = s_csr_wdata_i_Q[7:0];
    assign pmp1cfg_wdata_B0 = s_csr_wdata_i_Q[15:8];
    assign pmp2cfg_wdata_B0 = s_csr_wdata_i_Q[23:16];
    assign pmp3cfg_wdata_B0 = s_csr_wdata_i_Q[31:24];
    assign pmp4cfg_wdata_B0 = s_csr_wdata_i_Q[7:0];
    assign pmp5cfg_wdata_B0 = s_csr_wdata_i_Q[15:8];
    assign pmp6cfg_wdata_B0 = s_csr_wdata_i_Q[23:16];
    assign pmp7cfg_wdata_B0 = s_csr_wdata_i_Q[31:24];
    assign pmp8cfg_wdata_B0 = s_csr_wdata_i_Q[7:0];
    assign pmp9cfg_wdata_B0 = s_csr_wdata_i_Q[15:8];
    assign pmp10cfg_wdata_B0 = s_csr_wdata_i_Q[23:16];
    assign pmp11cfg_wdata_B0 = s_csr_wdata_i_Q[31:24];
    assign pmp12cfg_wdata_B0 = s_csr_wdata_i_Q[7:0];
    assign pmp13cfg_wdata_B0 = s_csr_wdata_i_Q[15:8];
    assign pmp14cfg_wdata_B0 = s_csr_wdata_i_Q[23:16];
    assign pmp15cfg_wdata_B0 = s_csr_wdata_i_Q[31:24];
    assign new_pmp0cfg_B0 = 8'(((pmp0cfg_B0[7]) ? 32'(pmp0cfg_B0) : ((32'(pmp0cfg_wdata_B0) & 32'h0000009f) | 32'(pmp0cfg_wdata_B0[1]))));
    assign new_pmp1cfg_B0 = 8'(((pmp1cfg_B0[7]) ? 32'(pmp1cfg_B0) : ((32'(pmp1cfg_wdata_B0) & 32'h0000009f) | 32'(pmp1cfg_wdata_B0[1]))));
    assign new_pmp2cfg_B0 = 8'(((pmp2cfg_B0[7]) ? 32'(pmp2cfg_B0) : ((32'(pmp2cfg_wdata_B0) & 32'h0000009f) | 32'(pmp2cfg_wdata_B0[1]))));
    assign new_pmp3cfg_B0 = 8'(((pmp3cfg_B0[7]) ? 32'(pmp3cfg_B0) : ((32'(pmp3cfg_wdata_B0) & 32'h0000009f) | 32'(pmp3cfg_wdata_B0[1]))));
    assign new_pmp4cfg_B0 = 8'(((pmp4cfg_B0[7]) ? 32'(pmp4cfg_B0) : ((32'(pmp4cfg_wdata_B0) & 32'h0000009f) | 32'(pmp4cfg_wdata_B0[1]))));
    assign new_pmp5cfg_B0 = 8'(((pmp5cfg_B0[7]) ? 32'(pmp5cfg_B0) : ((32'(pmp5cfg_wdata_B0) & 32'h0000009f) | 32'(pmp5cfg_wdata_B0[1]))));
    assign new_pmp6cfg_B0 = 8'(((pmp6cfg_B0[7]) ? 32'(pmp6cfg_B0) : ((32'(pmp6cfg_wdata_B0) & 32'h0000009f) | 32'(pmp6cfg_wdata_B0[1]))));
    assign new_pmp7cfg_B0 = 8'(((pmp7cfg_B0[7]) ? 32'(pmp7cfg_B0) : ((32'(pmp7cfg_wdata_B0) & 32'h0000009f) | 32'(pmp7cfg_wdata_B0[1]))));
    assign new_pmp8cfg_B0 = 8'(((pmp8cfg_B0[7]) ? 32'(pmp8cfg_B0) : ((32'(pmp8cfg_wdata_B0) & 32'h0000009f) | 32'(pmp8cfg_wdata_B0[1]))));
    assign new_pmp9cfg_B0 = 8'(((pmp9cfg_B0[7]) ? 32'(pmp9cfg_B0) : ((32'(pmp9cfg_wdata_B0) & 32'h0000009f) | 32'(pmp9cfg_wdata_B0[1]))));
    assign new_pmp10cfg_B0 = 8'(((pmp10cfg_B0[7]) ? 32'(pmp10cfg_B0) : ((32'(pmp10cfg_wdata_B0) & 32'h0000009f) | 32'(pmp10cfg_wdata_B0[1]))));
    assign new_pmp11cfg_B0 = 8'(((pmp11cfg_B0[7]) ? 32'(pmp11cfg_B0) : ((32'(pmp11cfg_wdata_B0) & 32'h0000009f) | 32'(pmp11cfg_wdata_B0[1]))));
    assign new_pmp12cfg_B0 = 8'(((pmp12cfg_B0[7]) ? 32'(pmp12cfg_B0) : ((32'(pmp12cfg_wdata_B0) & 32'h0000009f) | 32'(pmp12cfg_wdata_B0[1]))));
    assign new_pmp13cfg_B0 = 8'(((pmp13cfg_B0[7]) ? 32'(pmp13cfg_B0) : ((32'(pmp13cfg_wdata_B0) & 32'h0000009f) | 32'(pmp13cfg_wdata_B0[1]))));
    assign new_pmp14cfg_B0 = 8'(((pmp14cfg_B0[7]) ? 32'(pmp14cfg_B0) : ((32'(pmp14cfg_wdata_B0) & 32'h0000009f) | 32'(pmp14cfg_wdata_B0[1]))));
    assign new_pmp15cfg_B0 = 8'(((pmp15cfg_B0[7]) ? 32'(pmp15cfg_B0) : ((32'(pmp15cfg_wdata_B0) & 32'h0000009f) | 32'(pmp15cfg_wdata_B0[1]))));
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
    assign s_csr_pmpaddr0_new_D_ACT_wire = codasip_tmp_var_4 ? s_csr_wdata_i_Q : r_csr_pmpaddr0_Q;
    assign s_csr_pmpaddr10_new_D_ACT_wire = codasip_tmp_var_24 ? s_csr_wdata_i_Q : r_csr_pmpaddr10_Q;
    assign s_csr_pmpaddr11_new_D_ACT_wire = codasip_tmp_var_26 ? s_csr_wdata_i_Q : r_csr_pmpaddr11_Q;
    assign s_csr_pmpaddr12_new_D_ACT_wire = codasip_tmp_var_28 ? s_csr_wdata_i_Q : r_csr_pmpaddr12_Q;
    assign s_csr_pmpaddr13_new_D_ACT_wire = codasip_tmp_var_30 ? s_csr_wdata_i_Q : r_csr_pmpaddr13_Q;
    assign s_csr_pmpaddr14_new_D_ACT_wire = codasip_tmp_var_32 ? s_csr_wdata_i_Q : r_csr_pmpaddr14_Q;
    assign s_csr_pmpaddr15_new_D_ACT_wire = codasip_tmp_var_34 ? s_csr_wdata_i_Q : r_csr_pmpaddr15_Q;
    assign s_csr_pmpaddr1_new_D_ACT_wire = codasip_tmp_var_6 ? s_csr_wdata_i_Q : r_csr_pmpaddr1_Q;
    assign s_csr_pmpaddr2_new_D_ACT_wire = codasip_tmp_var_8 ? s_csr_wdata_i_Q : r_csr_pmpaddr2_Q;
    assign s_csr_pmpaddr3_new_D_ACT_wire = codasip_tmp_var_10 ? s_csr_wdata_i_Q : r_csr_pmpaddr3_Q;
    assign s_csr_pmpaddr4_new_D_ACT_wire = codasip_tmp_var_12 ? s_csr_wdata_i_Q : r_csr_pmpaddr4_Q;
    assign s_csr_pmpaddr5_new_D_ACT_wire = codasip_tmp_var_14 ? s_csr_wdata_i_Q : r_csr_pmpaddr5_Q;
    assign s_csr_pmpaddr6_new_D_ACT_wire = codasip_tmp_var_16 ? s_csr_wdata_i_Q : r_csr_pmpaddr6_Q;
    assign s_csr_pmpaddr7_new_D_ACT_wire = codasip_tmp_var_18 ? s_csr_wdata_i_Q : r_csr_pmpaddr7_Q;
    assign s_csr_pmpaddr8_new_D_ACT_wire = codasip_tmp_var_20 ? s_csr_wdata_i_Q : r_csr_pmpaddr8_Q;
    assign s_csr_pmpaddr9_new_D_ACT_wire = codasip_tmp_var_22 ? s_csr_wdata_i_Q : r_csr_pmpaddr9_Q;
    assign s_csr_pmpcfg0_new_D_ACT_wire = codasip_tmp_var_0 ? {new_pmp3cfg_B0, new_pmp2cfg_B0, new_pmp1cfg_B0, new_pmp0cfg_B0} : r_csr_pmpcfg0_Q;
    assign s_csr_pmpcfg1_new_D_ACT_wire = codasip_tmp_var_1 ? {new_pmp7cfg_B0, new_pmp6cfg_B0, new_pmp5cfg_B0, new_pmp4cfg_B0} : r_csr_pmpcfg1_Q;
    assign s_csr_pmpcfg2_new_D_ACT_wire = codasip_tmp_var_2 ? {new_pmp11cfg_B0, new_pmp10cfg_B0, new_pmp9cfg_B0, new_pmp8cfg_B0} : r_csr_pmpcfg2_Q;
    assign s_csr_pmpcfg3_new_D_ACT_wire = codasip_tmp_var_3 ? {new_pmp15cfg_B0, new_pmp14cfg_B0, new_pmp13cfg_B0, new_pmp12cfg_B0} : r_csr_pmpcfg3_Q;
    assign r_csr_pmpaddr0_D = s_csr_wdata_i_Q;
    assign r_csr_pmpaddr0_WE = codasip_tmp_var_4 ? 1'b1 : 1'b0;
    assign r_csr_pmpaddr10_D = s_csr_wdata_i_Q;
    assign r_csr_pmpaddr10_WE = codasip_tmp_var_24 ? 1'b1 : 1'b0;
    assign r_csr_pmpaddr11_D = s_csr_wdata_i_Q;
    assign r_csr_pmpaddr11_WE = codasip_tmp_var_26 ? 1'b1 : 1'b0;
    assign r_csr_pmpaddr12_D = s_csr_wdata_i_Q;
    assign r_csr_pmpaddr12_WE = codasip_tmp_var_28 ? 1'b1 : 1'b0;
    assign r_csr_pmpaddr13_D = s_csr_wdata_i_Q;
    assign r_csr_pmpaddr13_WE = codasip_tmp_var_30 ? 1'b1 : 1'b0;
    assign r_csr_pmpaddr14_D = s_csr_wdata_i_Q;
    assign r_csr_pmpaddr14_WE = codasip_tmp_var_32 ? 1'b1 : 1'b0;
    assign r_csr_pmpaddr15_D = s_csr_wdata_i_Q;
    assign r_csr_pmpaddr15_WE = codasip_tmp_var_34 ? 1'b1 : 1'b0;
    assign r_csr_pmpaddr1_D = s_csr_wdata_i_Q;
    assign r_csr_pmpaddr1_WE = codasip_tmp_var_6 ? 1'b1 : 1'b0;
    assign r_csr_pmpaddr2_D = s_csr_wdata_i_Q;
    assign r_csr_pmpaddr2_WE = codasip_tmp_var_8 ? 1'b1 : 1'b0;
    assign r_csr_pmpaddr3_D = s_csr_wdata_i_Q;
    assign r_csr_pmpaddr3_WE = codasip_tmp_var_10 ? 1'b1 : 1'b0;
    assign r_csr_pmpaddr4_D = s_csr_wdata_i_Q;
    assign r_csr_pmpaddr4_WE = codasip_tmp_var_12 ? 1'b1 : 1'b0;
    assign r_csr_pmpaddr5_D = s_csr_wdata_i_Q;
    assign r_csr_pmpaddr5_WE = codasip_tmp_var_14 ? 1'b1 : 1'b0;
    assign r_csr_pmpaddr6_D = s_csr_wdata_i_Q;
    assign r_csr_pmpaddr6_WE = codasip_tmp_var_16 ? 1'b1 : 1'b0;
    assign r_csr_pmpaddr7_D = s_csr_wdata_i_Q;
    assign r_csr_pmpaddr7_WE = codasip_tmp_var_18 ? 1'b1 : 1'b0;
    assign r_csr_pmpaddr8_D = s_csr_wdata_i_Q;
    assign r_csr_pmpaddr8_WE = codasip_tmp_var_20 ? 1'b1 : 1'b0;
    assign r_csr_pmpaddr9_D = s_csr_wdata_i_Q;
    assign r_csr_pmpaddr9_WE = codasip_tmp_var_22 ? 1'b1 : 1'b0;
    assign r_csr_pmpcfg0_D = s_csr_pmpcfg0_new_Q;
    assign r_csr_pmpcfg0_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_csr_pmpcfg1_D = s_csr_pmpcfg1_new_Q;
    assign r_csr_pmpcfg1_WE = codasip_tmp_var_1 ? 1'b1 : 1'b0;
    assign r_csr_pmpcfg2_D = s_csr_pmpcfg2_new_Q;
    assign r_csr_pmpcfg2_WE = codasip_tmp_var_2 ? 1'b1 : 1'b0;
    assign r_csr_pmpcfg3_D = s_csr_pmpcfg3_new_Q;
    assign r_csr_pmpcfg3_WE = codasip_tmp_var_3 ? 1'b1 : 1'b0;
    assign r_pmp0_napot_mask_D = ((pmp0cfg_tor_napot_bit_B0) ? ((s_csr_pmpaddr0_new_Q + 32'h00000001) ^ s_csr_pmpaddr0_new_Q) : 32'h00000000);
    assign r_pmp0_napot_mask_WE = codasip_tmp_var_5 ? 1'b1 : 1'b0;
    assign r_pmp10_napot_mask_D = ((pmp10cfg_tor_napot_bit_B0) ? ((s_csr_pmpaddr10_new_Q + 32'h00000001) ^ s_csr_pmpaddr10_new_Q) : 32'h00000000);
    assign r_pmp10_napot_mask_WE = codasip_tmp_var_25 ? 1'b1 : 1'b0;
    assign r_pmp11_napot_mask_D = ((pmp11cfg_tor_napot_bit_B0) ? ((s_csr_pmpaddr11_new_Q + 32'h00000001) ^ s_csr_pmpaddr11_new_Q) : 32'h00000000);
    assign r_pmp11_napot_mask_WE = codasip_tmp_var_27 ? 1'b1 : 1'b0;
    assign r_pmp12_napot_mask_D = ((pmp12cfg_tor_napot_bit_B0) ? ((s_csr_pmpaddr12_new_Q + 32'h00000001) ^ s_csr_pmpaddr12_new_Q) : 32'h00000000);
    assign r_pmp12_napot_mask_WE = codasip_tmp_var_29 ? 1'b1 : 1'b0;
    assign r_pmp13_napot_mask_D = ((pmp13cfg_tor_napot_bit_B0) ? ((s_csr_pmpaddr13_new_Q + 32'h00000001) ^ s_csr_pmpaddr13_new_Q) : 32'h00000000);
    assign r_pmp13_napot_mask_WE = codasip_tmp_var_31 ? 1'b1 : 1'b0;
    assign r_pmp14_napot_mask_D = ((pmp14cfg_tor_napot_bit_B0) ? ((s_csr_pmpaddr14_new_Q + 32'h00000001) ^ s_csr_pmpaddr14_new_Q) : 32'h00000000);
    assign r_pmp14_napot_mask_WE = codasip_tmp_var_33 ? 1'b1 : 1'b0;
    assign r_pmp15_napot_mask_D = ((pmp15cfg_tor_napot_bit_B0) ? ((s_csr_pmpaddr15_new_Q + 32'h00000001) ^ s_csr_pmpaddr15_new_Q) : 32'h00000000);
    assign r_pmp15_napot_mask_WE = codasip_tmp_var_35 ? 1'b1 : 1'b0;
    assign r_pmp1_napot_mask_D = ((pmp1cfg_tor_napot_bit_B0) ? ((s_csr_pmpaddr1_new_Q + 32'h00000001) ^ s_csr_pmpaddr1_new_Q) : 32'h00000000);
    assign r_pmp1_napot_mask_WE = codasip_tmp_var_7 ? 1'b1 : 1'b0;
    assign r_pmp2_napot_mask_D = ((pmp2cfg_tor_napot_bit_B0) ? ((s_csr_pmpaddr2_new_Q + 32'h00000001) ^ s_csr_pmpaddr2_new_Q) : 32'h00000000);
    assign r_pmp2_napot_mask_WE = codasip_tmp_var_9 ? 1'b1 : 1'b0;
    assign r_pmp3_napot_mask_D = ((pmp3cfg_tor_napot_bit_B0) ? ((s_csr_pmpaddr3_new_Q + 32'h00000001) ^ s_csr_pmpaddr3_new_Q) : 32'h00000000);
    assign r_pmp3_napot_mask_WE = codasip_tmp_var_11 ? 1'b1 : 1'b0;
    assign r_pmp4_napot_mask_D = ((pmp4cfg_tor_napot_bit_B0) ? ((s_csr_pmpaddr4_new_Q + 32'h00000001) ^ s_csr_pmpaddr4_new_Q) : 32'h00000000);
    assign r_pmp4_napot_mask_WE = codasip_tmp_var_13 ? 1'b1 : 1'b0;
    assign r_pmp5_napot_mask_D = ((pmp5cfg_tor_napot_bit_B0) ? ((s_csr_pmpaddr5_new_Q + 32'h00000001) ^ s_csr_pmpaddr5_new_Q) : 32'h00000000);
    assign r_pmp5_napot_mask_WE = codasip_tmp_var_15 ? 1'b1 : 1'b0;
    assign r_pmp6_napot_mask_D = ((pmp6cfg_tor_napot_bit_B0) ? ((s_csr_pmpaddr6_new_Q + 32'h00000001) ^ s_csr_pmpaddr6_new_Q) : 32'h00000000);
    assign r_pmp6_napot_mask_WE = codasip_tmp_var_17 ? 1'b1 : 1'b0;
    assign r_pmp7_napot_mask_D = ((pmp7cfg_tor_napot_bit_B0) ? ((s_csr_pmpaddr7_new_Q + 32'h00000001) ^ s_csr_pmpaddr7_new_Q) : 32'h00000000);
    assign r_pmp7_napot_mask_WE = codasip_tmp_var_19 ? 1'b1 : 1'b0;
    assign r_pmp8_napot_mask_D = ((pmp8cfg_tor_napot_bit_B0) ? ((s_csr_pmpaddr8_new_Q + 32'h00000001) ^ s_csr_pmpaddr8_new_Q) : 32'h00000000);
    assign r_pmp8_napot_mask_WE = codasip_tmp_var_21 ? 1'b1 : 1'b0;
    assign r_pmp9_napot_mask_D = ((pmp9cfg_tor_napot_bit_B0) ? ((s_csr_pmpaddr9_new_Q + 32'h00000001) ^ s_csr_pmpaddr9_new_Q) : 32'h00000000);
    assign r_pmp9_napot_mask_WE = codasip_tmp_var_23 ? 1'b1 : 1'b0;
    assign s_csr_pmpaddr0_new_D = s_csr_pmpaddr0_new_D_ACT_wire;
    assign s_csr_pmpaddr10_new_D = s_csr_pmpaddr10_new_D_ACT_wire;
    assign s_csr_pmpaddr11_new_D = s_csr_pmpaddr11_new_D_ACT_wire;
    assign s_csr_pmpaddr12_new_D = s_csr_pmpaddr12_new_D_ACT_wire;
    assign s_csr_pmpaddr13_new_D = s_csr_pmpaddr13_new_D_ACT_wire;
    assign s_csr_pmpaddr14_new_D = s_csr_pmpaddr14_new_D_ACT_wire;
    assign s_csr_pmpaddr15_new_D = s_csr_pmpaddr15_new_D_ACT_wire;
    assign s_csr_pmpaddr1_new_D = s_csr_pmpaddr1_new_D_ACT_wire;
    assign s_csr_pmpaddr2_new_D = s_csr_pmpaddr2_new_D_ACT_wire;
    assign s_csr_pmpaddr3_new_D = s_csr_pmpaddr3_new_D_ACT_wire;
    assign s_csr_pmpaddr4_new_D = s_csr_pmpaddr4_new_D_ACT_wire;
    assign s_csr_pmpaddr5_new_D = s_csr_pmpaddr5_new_D_ACT_wire;
    assign s_csr_pmpaddr6_new_D = s_csr_pmpaddr6_new_D_ACT_wire;
    assign s_csr_pmpaddr7_new_D = s_csr_pmpaddr7_new_D_ACT_wire;
    assign s_csr_pmpaddr8_new_D = s_csr_pmpaddr8_new_D_ACT_wire;
    assign s_csr_pmpaddr9_new_D = s_csr_pmpaddr9_new_D_ACT_wire;
    assign s_csr_pmpcfg0_new_D = s_csr_pmpcfg0_new_D_ACT_wire;
    assign s_csr_pmpcfg1_new_D = s_csr_pmpcfg1_new_D_ACT_wire;
    assign s_csr_pmpcfg2_new_D = s_csr_pmpcfg2_new_D_ACT_wire;
    assign s_csr_pmpcfg3_new_D = s_csr_pmpcfg3_new_D_ACT_wire;
    assign s_pmpaddr0_we_D = ((s_csr_we_i_Q && (s_csr_waddr_i_Q == 12'h3b0)) && (!pmp0lock_B0));
    assign s_pmpaddr10_we_D = ((s_csr_we_i_Q && (s_csr_waddr_i_Q == 12'h3ba)) && (!pmp10lock_B0));
    assign s_pmpaddr11_we_D = ((s_csr_we_i_Q && (s_csr_waddr_i_Q == 12'h3bb)) && (!pmp11lock_B0));
    assign s_pmpaddr12_we_D = ((s_csr_we_i_Q && (s_csr_waddr_i_Q == 12'h3bc)) && (!pmp12lock_B0));
    assign s_pmpaddr13_we_D = ((s_csr_we_i_Q && (s_csr_waddr_i_Q == 12'h3bd)) && (!pmp13lock_B0));
    assign s_pmpaddr14_we_D = ((s_csr_we_i_Q && (s_csr_waddr_i_Q == 12'h3be)) && (!pmp14lock_B0));
    assign s_pmpaddr15_we_D = ((s_csr_we_i_Q && (s_csr_waddr_i_Q == 12'h3bf)) && (!pmp15lock_B0));
    assign s_pmpaddr1_we_D = ((s_csr_we_i_Q && (s_csr_waddr_i_Q == 12'h3b1)) && (!pmp1lock_B0));
    assign s_pmpaddr2_we_D = ((s_csr_we_i_Q && (s_csr_waddr_i_Q == 12'h3b2)) && (!pmp2lock_B0));
    assign s_pmpaddr3_we_D = ((s_csr_we_i_Q && (s_csr_waddr_i_Q == 12'h3b3)) && (!pmp3lock_B0));
    assign s_pmpaddr4_we_D = ((s_csr_we_i_Q && (s_csr_waddr_i_Q == 12'h3b4)) && (!pmp4lock_B0));
    assign s_pmpaddr5_we_D = ((s_csr_we_i_Q && (s_csr_waddr_i_Q == 12'h3b5)) && (!pmp5lock_B0));
    assign s_pmpaddr6_we_D = ((s_csr_we_i_Q && (s_csr_waddr_i_Q == 12'h3b6)) && (!pmp6lock_B0));
    assign s_pmpaddr7_we_D = ((s_csr_we_i_Q && (s_csr_waddr_i_Q == 12'h3b7)) && (!pmp7lock_B0));
    assign s_pmpaddr8_we_D = ((s_csr_we_i_Q && (s_csr_waddr_i_Q == 12'h3b8)) && (!pmp8lock_B0));
    assign s_pmpaddr9_we_D = ((s_csr_we_i_Q && (s_csr_waddr_i_Q == 12'h3b9)) && (!pmp9lock_B0));
    assign s_pmpcfg0_we_D = (s_csr_we_i_Q & (s_csr_waddr_i_Q == 12'h3a0));
    assign s_pmpcfg1_we_D = (s_csr_we_i_Q & (s_csr_waddr_i_Q == 12'h3a1));
    assign s_pmpcfg2_we_D = (s_csr_we_i_Q & (s_csr_waddr_i_Q == 12'h3a2));
    assign s_pmpcfg3_we_D = (s_csr_we_i_Q & (s_csr_waddr_i_Q == 12'h3a3));
endmodule: codix_berkelium_ca_core_execute_stage_lsu_pmp_csr_write_t
