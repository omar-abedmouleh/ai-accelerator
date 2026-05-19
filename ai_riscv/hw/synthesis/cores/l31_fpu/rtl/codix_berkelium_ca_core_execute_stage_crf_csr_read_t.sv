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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_crf_csr_read_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_crf_csr_read_t #(
    parameter [31:0] itcm_size_p = 32'h00004000,
    parameter [31:0] itcm_baddr_p = 32'h02000000,
    parameter [31:0] dtcm_size_p = 32'h00004000,
    parameter [31:0] dtcm_baddr_p = 32'h03000000,
    parameter [31:0] cache_base_p = 32'h00010000,
    parameter [31:0] hart_id_p = 32'h00000000
) (
    input  logic [63:0] perf_r_mhpmcounter10_Q,
    input  logic [63:0] perf_r_mhpmcounter12_Q,
    input  logic [63:0] perf_r_mhpmcounter13_Q,
    input  logic [63:0] perf_r_mhpmcounter14_Q,
    input  logic [63:0] perf_r_mhpmcounter15_Q,
    input  logic [63:0] perf_r_mhpmcounter3_Q,
    input  logic [63:0] perf_r_mhpmcounter4_Q,
    input  logic [63:0] perf_r_mhpmcounter5_Q,
    input  logic [63:0] perf_r_mhpmcounter6_Q,
    input  logic [63:0] perf_r_mhpmcounter9_Q,
    input  logic [31:0] r_csr_dcsr_Q,
    input  logic [31:0] r_csr_dpc_Q,
    input  logic [31:0] r_csr_fcsr_Q,
    input  logic [31:0] r_csr_mcause_Q,
    input  logic [31:0] r_csr_mcounteren_Q,
    input  logic [31:0] r_csr_mcountinhibit_Q,
    input  logic [63:0] r_csr_mcycle_Q,
    input  logic r_csr_mdtcmen_Q,
    input  logic [30:0] r_csr_mepc_Q,
    input  logic [31:0] r_csr_mexcause_Q,
    input  logic [31:0] r_csr_mie_Q,
    input  logic [63:0] r_csr_minstret_Q,
    input  logic [31:0] r_csr_mip_Q,
    input  logic r_csr_mitcmen_Q,
    input  logic [31:0] r_csr_mpicflag1_Q,
    input  logic [31:0] r_csr_mpicflag2_Q,
    input  logic [31:0] r_csr_mpicflag3_Q,
    input  logic [31:0] r_csr_mpicflag_Q,
    input  logic [31:0] r_csr_mpicmask1_Q,
    input  logic [31:0] r_csr_mpicmask2_Q,
    input  logic [31:0] r_csr_mpicmask3_Q,
    input  logic [31:0] r_csr_mpicmask_Q,
    input  logic [31:0] r_csr_mscratch_Q,
    input  logic [30:0] r_csr_mstatus_Q,
    input  logic [31:0] r_csr_mtval_Q,
    input  logic [31:0] r_csr_mtvec_Q,
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
    input  logic [31:0] r_csr_tcontrol_Q,
    input  logic [31:0] r_csr_tdata1_r_Q,
    input  logic [31:0] r_csr_tdata2_r_Q,
    input  logic [31:0] r_csr_tselect_Q,
    input  logic [1:0] r_prv_Q,
    input  logic [11:0] s_csr_addr_i_Q,
    input  logic s_csr_re_i_Q,
    output logic [2:0] r_csr_tdata1_r_RA,
    output logic r_csr_tdata1_r_RE,
    output logic [2:0] r_csr_tdata2_r_RA,
    output logic r_csr_tdata2_r_RE,
    output logic [31:0] s_read_csr_rdata_D,
    output logic s_read_illegal_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic codasip_tmp_var_0;
    // signal/wire
    logic [11:0] codasip_tmp_var_1;
    // signal/wire
    logic [31:0] s_read_csr_rdata_D_ACT_wire;
    // signal/wire
    logic s_read_illegal_D_ACT_wire;

    // data-path code:
    assign codasip_tmp_var_0 = s_csr_re_i_Q;
    assign codasip_tmp_var_1 = codasip_tmp_var_0 ? s_csr_addr_i_Q : 12'h000;
    assign s_read_csr_rdata_D_ACT_wire = (codasip_tmp_var_1 == 12'hf11) ? 32'h00000503 :
        (codasip_tmp_var_1 == 12'hf12) ? 32'h800016d2 :
        (codasip_tmp_var_1 == 12'hf13) ? 32'h00050003 :
        (codasip_tmp_var_1 == 12'hf14) ? hart_id_p :
        (codasip_tmp_var_1 == 12'h301) ? 32'h40101124 :
        ((codasip_tmp_var_1 == 12'hc83) || (codasip_tmp_var_1 == 12'hb83)) ? perf_r_mhpmcounter3_Q[63:32] :
        ((codasip_tmp_var_1 == 12'hc84) || (codasip_tmp_var_1 == 12'hb84)) ? perf_r_mhpmcounter4_Q[63:32] :
        ((codasip_tmp_var_1 == 12'hc85) || (codasip_tmp_var_1 == 12'hb85)) ? perf_r_mhpmcounter5_Q[63:32] :
        ((codasip_tmp_var_1 == 12'hc86) || (codasip_tmp_var_1 == 12'hb86)) ? perf_r_mhpmcounter6_Q[63:32] :
        ((codasip_tmp_var_1 == 12'hc89) || (codasip_tmp_var_1 == 12'hb89)) ? perf_r_mhpmcounter9_Q[63:32] :
        ((codasip_tmp_var_1 == 12'hc8a) || (codasip_tmp_var_1 == 12'hb8a)) ? perf_r_mhpmcounter10_Q[63:32] :
        ((codasip_tmp_var_1 == 12'hc8c) || (codasip_tmp_var_1 == 12'hb8c)) ? perf_r_mhpmcounter12_Q[63:32] :
        ((codasip_tmp_var_1 == 12'hc8d) || (codasip_tmp_var_1 == 12'hb8d)) ? perf_r_mhpmcounter13_Q[63:32] :
        ((codasip_tmp_var_1 == 12'hc8e) || (codasip_tmp_var_1 == 12'hb8e)) ? perf_r_mhpmcounter14_Q[63:32] :
        ((codasip_tmp_var_1 == 12'hc8f) || (codasip_tmp_var_1 == 12'hb8f)) ? perf_r_mhpmcounter15_Q[63:32] :
        ((codasip_tmp_var_1 == 12'hc03) || (codasip_tmp_var_1 == 12'hb03)) ? perf_r_mhpmcounter3_Q[31:0] :
        ((codasip_tmp_var_1 == 12'hc04) || (codasip_tmp_var_1 == 12'hb04)) ? perf_r_mhpmcounter4_Q[31:0] :
        ((codasip_tmp_var_1 == 12'hc05) || (codasip_tmp_var_1 == 12'hb05)) ? perf_r_mhpmcounter5_Q[31:0] :
        ((codasip_tmp_var_1 == 12'hc06) || (codasip_tmp_var_1 == 12'hb06)) ? perf_r_mhpmcounter6_Q[31:0] :
        ((codasip_tmp_var_1 == 12'hc09) || (codasip_tmp_var_1 == 12'hb09)) ? perf_r_mhpmcounter9_Q[31:0] :
        ((codasip_tmp_var_1 == 12'hc0a) || (codasip_tmp_var_1 == 12'hb0a)) ? perf_r_mhpmcounter10_Q[31:0] :
        ((codasip_tmp_var_1 == 12'hc0c) || (codasip_tmp_var_1 == 12'hb0c)) ? perf_r_mhpmcounter12_Q[31:0] :
        ((codasip_tmp_var_1 == 12'hc0d) || (codasip_tmp_var_1 == 12'hb0d)) ? perf_r_mhpmcounter13_Q[31:0] :
        ((codasip_tmp_var_1 == 12'hc0e) || (codasip_tmp_var_1 == 12'hb0e)) ? perf_r_mhpmcounter14_Q[31:0] :
        ((codasip_tmp_var_1 == 12'hc0f) || (codasip_tmp_var_1 == 12'hb0f)) ? perf_r_mhpmcounter15_Q[31:0] :
        (codasip_tmp_var_1 == 12'h323) ? 32'h00000001 :
        (codasip_tmp_var_1 == 12'h324) ? 32'h00000002 :
        (codasip_tmp_var_1 == 12'h325) ? 32'h00000003 :
        (codasip_tmp_var_1 == 12'h326) ? 32'h00000004 :
        (codasip_tmp_var_1 == 12'h329) ? 32'h00000007 :
        (codasip_tmp_var_1 == 12'h32a) ? 32'h00000008 :
        (codasip_tmp_var_1 == 12'h32c) ? 32'h0000000a :
        (codasip_tmp_var_1 == 12'h32d) ? 32'h0000000b :
        (codasip_tmp_var_1 == 12'h32e) ? 32'h0000000c :
        (codasip_tmp_var_1 == 12'h32f) ? 32'h0000000d :
        (codasip_tmp_var_1 == 12'h300) ? {r_csr_mstatus_Q[30], 8'h00, r_csr_mstatus_Q[21], r_csr_mstatus_Q[20], r_csr_mstatus_Q[19], r_csr_mstatus_Q[18], r_csr_mstatus_Q[17], r_csr_mstatus_Q[16], 2'h0, r_csr_mstatus_Q[13:12], r_csr_mstatus_Q[11:10], 2'h0, r_csr_mstatus_Q[7], r_csr_mstatus_Q[6], 1'b0, r_csr_mstatus_Q[4], 1'b0, r_csr_mstatus_Q[2], 1'b0, r_csr_mstatus_Q[0], 1'b0} :
        (codasip_tmp_var_1 == 12'h305) ? {r_csr_mtvec_Q[31:2], 1'b0, r_csr_mtvec_Q[0]} :
        (codasip_tmp_var_1 == 12'h341) ? {r_csr_mepc_Q, 1'b0} :
        (codasip_tmp_var_1 == 12'h342) ? r_csr_mcause_Q :
        (codasip_tmp_var_1 == 12'h7d4) ? r_csr_mexcause_Q :
        (codasip_tmp_var_1 == 12'h343) ? r_csr_mtval_Q :
        (codasip_tmp_var_1 == 12'h340) ? r_csr_mscratch_Q :
        (codasip_tmp_var_1 == 12'h304) ? r_csr_mie_Q :
        (codasip_tmp_var_1 == 12'h344) ? r_csr_mip_Q :
        (codasip_tmp_var_1 == 12'hb00) ? r_csr_mcycle_Q[31:0] :
        (codasip_tmp_var_1 == 12'hb02) ? r_csr_minstret_Q[31:0] :
        (codasip_tmp_var_1 == 12'hc00) ? r_csr_mcycle_Q[31:0] :
        (codasip_tmp_var_1 == 12'hc02) ? r_csr_minstret_Q[31:0] :
        (codasip_tmp_var_1 == 12'hb80) ? r_csr_mcycle_Q[63:32] :
        (codasip_tmp_var_1 == 12'hb82) ? r_csr_minstret_Q[63:32] :
        (codasip_tmp_var_1 == 12'hc80) ? r_csr_mcycle_Q[63:32] :
        (codasip_tmp_var_1 == 12'hc82) ? r_csr_minstret_Q[63:32] :
        (codasip_tmp_var_1 == 12'h320) ? r_csr_mcountinhibit_Q :
        (codasip_tmp_var_1 == 12'h306) ? r_csr_mcounteren_Q :
        (codasip_tmp_var_1 == 12'h7b1) ? r_csr_dpc_Q :
        (codasip_tmp_var_1 == 12'h7b0) ? r_csr_dcsr_Q :
        (codasip_tmp_var_1 == 12'h7a1) ? r_csr_tdata1_r_Q :
        (codasip_tmp_var_1 == 12'h7a2) ? r_csr_tdata2_r_Q :
        ((codasip_tmp_var_1 == 12'h7a3) || (codasip_tmp_var_1 == 12'h7a8)) ? 32'h00000000 :
        (codasip_tmp_var_1 == 12'h7a4) ? 32'h00000004 :
        (codasip_tmp_var_1 == 12'h7a5) ? r_csr_tcontrol_Q :
        (codasip_tmp_var_1 == 12'h7a0) ? r_csr_tselect_Q :
        (codasip_tmp_var_1 == 12'h7c1) ? r_csr_mpicflag_Q :
        (codasip_tmp_var_1 == 12'h7c2) ? r_csr_mpicmask_Q :
        (codasip_tmp_var_1 == 12'h7c4) ? r_csr_mpicflag1_Q :
        (codasip_tmp_var_1 == 12'h7c5) ? r_csr_mpicmask1_Q :
        (codasip_tmp_var_1 == 12'h7c7) ? r_csr_mpicflag2_Q :
        (codasip_tmp_var_1 == 12'h7c8) ? r_csr_mpicmask2_Q :
        (codasip_tmp_var_1 == 12'h7ca) ? r_csr_mpicflag3_Q :
        (codasip_tmp_var_1 == 12'h7cb) ? r_csr_mpicmask3_Q :
        (codasip_tmp_var_1 == 12'h001) ? 32'(r_csr_fcsr_Q[4:0]) :
        (codasip_tmp_var_1 == 12'h002) ? 32'(r_csr_fcsr_Q[7:5]) :
        (codasip_tmp_var_1 == 12'h003) ? r_csr_fcsr_Q :
        (codasip_tmp_var_1 == 12'h7cd) ? 32'(r_csr_mitcmen_Q) :
        (codasip_tmp_var_1 == 12'hfc2) ? itcm_size_p :
        (codasip_tmp_var_1 == 12'hfc3) ? itcm_baddr_p :
        (codasip_tmp_var_1 == 12'h7d0) ? 32'(r_csr_mdtcmen_Q) :
        (codasip_tmp_var_1 == 12'hfc4) ? dtcm_size_p :
        (codasip_tmp_var_1 == 12'hfc5) ? dtcm_baddr_p :
        (codasip_tmp_var_1 == 12'h3a0) ? r_csr_pmpcfg0_Q :
        (codasip_tmp_var_1 == 12'h3a1) ? r_csr_pmpcfg1_Q :
        (codasip_tmp_var_1 == 12'h3a2) ? r_csr_pmpcfg2_Q :
        (codasip_tmp_var_1 == 12'h3a3) ? r_csr_pmpcfg3_Q :
        (codasip_tmp_var_1 == 12'h3b0) ? r_csr_pmpaddr0_Q :
        (codasip_tmp_var_1 == 12'h3b1) ? r_csr_pmpaddr1_Q :
        (codasip_tmp_var_1 == 12'h3b2) ? r_csr_pmpaddr2_Q :
        (codasip_tmp_var_1 == 12'h3b3) ? r_csr_pmpaddr3_Q :
        (codasip_tmp_var_1 == 12'h3b4) ? r_csr_pmpaddr4_Q :
        (codasip_tmp_var_1 == 12'h3b5) ? r_csr_pmpaddr5_Q :
        (codasip_tmp_var_1 == 12'h3b6) ? r_csr_pmpaddr6_Q :
        (codasip_tmp_var_1 == 12'h3b7) ? r_csr_pmpaddr7_Q :
        (codasip_tmp_var_1 == 12'h3b8) ? r_csr_pmpaddr8_Q :
        (codasip_tmp_var_1 == 12'h3b9) ? r_csr_pmpaddr9_Q :
        (codasip_tmp_var_1 == 12'h3ba) ? r_csr_pmpaddr10_Q :
        (codasip_tmp_var_1 == 12'h3bb) ? r_csr_pmpaddr11_Q :
        (codasip_tmp_var_1 == 12'h3bc) ? r_csr_pmpaddr12_Q :
        (codasip_tmp_var_1 == 12'h3bd) ? r_csr_pmpaddr13_Q :
        (codasip_tmp_var_1 == 12'h3be) ? r_csr_pmpaddr14_Q :
        (codasip_tmp_var_1 == 12'h3bf) ? r_csr_pmpaddr15_Q :
        (codasip_tmp_var_1 == 12'hfc0) ? cache_base_p :
        codasip_tmp_var_0 ? 32'h00000000 : 32'h00000000;
    assign s_read_illegal_D_ACT_wire = (codasip_tmp_var_1 == 12'hc83) ? ((!r_csr_mcounteren_Q[3]) && (r_prv_Q < 2'h3)) :
        (codasip_tmp_var_1 == 12'hc84) ? ((!r_csr_mcounteren_Q[4]) && (r_prv_Q < 2'h3)) :
        (codasip_tmp_var_1 == 12'hc85) ? ((!r_csr_mcounteren_Q[5]) && (r_prv_Q < 2'h3)) :
        (codasip_tmp_var_1 == 12'hc86) ? ((!r_csr_mcounteren_Q[6]) && (r_prv_Q < 2'h3)) :
        (codasip_tmp_var_1 == 12'hc89) ? ((!r_csr_mcounteren_Q[9]) && (r_prv_Q < 2'h3)) :
        (codasip_tmp_var_1 == 12'hc8a) ? ((!r_csr_mcounteren_Q[10]) && (r_prv_Q < 2'h3)) :
        (codasip_tmp_var_1 == 12'hc8c) ? ((!r_csr_mcounteren_Q[12]) && (r_prv_Q < 2'h3)) :
        (codasip_tmp_var_1 == 12'hc8d) ? ((!r_csr_mcounteren_Q[13]) && (r_prv_Q < 2'h3)) :
        (codasip_tmp_var_1 == 12'hc8e) ? ((!r_csr_mcounteren_Q[14]) && (r_prv_Q < 2'h3)) :
        (codasip_tmp_var_1 == 12'hc8f) ? ((!r_csr_mcounteren_Q[15]) && (r_prv_Q < 2'h3)) :
        (codasip_tmp_var_1 == 12'hc03) ? ((!r_csr_mcounteren_Q[3]) && (r_prv_Q < 2'h3)) :
        (codasip_tmp_var_1 == 12'hc04) ? ((!r_csr_mcounteren_Q[4]) && (r_prv_Q < 2'h3)) :
        (codasip_tmp_var_1 == 12'hc05) ? ((!r_csr_mcounteren_Q[5]) && (r_prv_Q < 2'h3)) :
        (codasip_tmp_var_1 == 12'hc06) ? ((!r_csr_mcounteren_Q[6]) && (r_prv_Q < 2'h3)) :
        (codasip_tmp_var_1 == 12'hc09) ? ((!r_csr_mcounteren_Q[9]) && (r_prv_Q < 2'h3)) :
        (codasip_tmp_var_1 == 12'hc0a) ? ((!r_csr_mcounteren_Q[10]) && (r_prv_Q < 2'h3)) :
        (codasip_tmp_var_1 == 12'hc0c) ? ((!r_csr_mcounteren_Q[12]) && (r_prv_Q < 2'h3)) :
        (codasip_tmp_var_1 == 12'hc0d) ? ((!r_csr_mcounteren_Q[13]) && (r_prv_Q < 2'h3)) :
        (codasip_tmp_var_1 == 12'hc0e) ? ((!r_csr_mcounteren_Q[14]) && (r_prv_Q < 2'h3)) :
        (codasip_tmp_var_1 == 12'hc0f) ? ((!r_csr_mcounteren_Q[15]) && (r_prv_Q < 2'h3)) :
        (codasip_tmp_var_1 == 12'hc00) ? ((!r_csr_mcounteren_Q[0]) && (r_prv_Q < 2'h3)) :
        (codasip_tmp_var_1 == 12'hc02) ? ((!r_csr_mcounteren_Q[2]) && (r_prv_Q < 2'h3)) :
        (codasip_tmp_var_1 == 12'hc80) ? ((!r_csr_mcounteren_Q[0]) && (r_prv_Q < 2'h3)) :
        (codasip_tmp_var_1 == 12'hc82) ? ((!r_csr_mcounteren_Q[2]) && (r_prv_Q < 2'h3)) :
        codasip_tmp_var_0 ? ((((s_csr_addr_i_Q[11:5] == 7'h60) && (s_csr_addr_i_Q[4:0] >= 5'h03)) || ((s_csr_addr_i_Q[11:5] == 7'h64) && (s_csr_addr_i_Q[4:0] >= 5'h03))) && (r_prv_Q < 2'h3)) : 1'b0;
    assign r_csr_tdata1_r_RA = (codasip_tmp_var_1 == 12'h7a1) ? 3'(r_csr_tselect_Q) : 3'h0;
    assign r_csr_tdata1_r_RE = (codasip_tmp_var_1 == 12'h7a1) ? 1'b1 : 1'b0;
    assign r_csr_tdata2_r_RA = 3'(r_csr_tselect_Q);
    assign r_csr_tdata2_r_RE = (codasip_tmp_var_1 == 12'h7a2) ? 1'b1 : 1'b0;
    assign s_read_csr_rdata_D = s_read_csr_rdata_D_ACT_wire;
    assign s_read_illegal_D = s_read_illegal_D_ACT_wire;
endmodule: codix_berkelium_ca_core_execute_stage_crf_csr_read_t
