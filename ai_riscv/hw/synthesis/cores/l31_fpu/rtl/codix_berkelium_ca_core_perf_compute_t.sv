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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_perf_compute_t' functional unit.
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

module codix_berkelium_ca_core_perf_compute_t(
    input  logic [63:0] r_mhpmcounter10_Q,
    input  logic [63:0] r_mhpmcounter12_Q,
    input  logic [63:0] r_mhpmcounter13_Q,
    input  logic [63:0] r_mhpmcounter14_Q,
    input  logic [63:0] r_mhpmcounter15_Q,
    input  logic [63:0] r_mhpmcounter3_Q,
    input  logic [63:0] r_mhpmcounter4_Q,
    input  logic [63:0] r_mhpmcounter5_Q,
    input  logic [63:0] r_mhpmcounter6_Q,
    input  logic [63:0] r_mhpmcounter9_Q,
    input  logic s_branch_miss_i_Q,
    input  logic s_csr_flush_i_Q,
    input  logic s_data_stall_i_Q,
    input  logic s_div_stall_i_Q,
    input  logic s_exc_flush_i_Q,
    input  logic s_flush_i_Q,
    input  logic s_fpu_stall_i_Q,
    input  logic [12:0] s_hpm_inhibit_i_Q,
    input  logic s_ifu_stall_i_Q,
    input  logic s_inhibit_i_Q,
    input  logic s_int_flush_i_Q,
    input  logic s_lsu_stall_i_Q,
    input  logic [11:0] s_perf_waddr_i_Q,
    input  logic [31:0] s_perf_wdata_i_Q,
    input  logic [1:0] s_perf_we_i_Q,
    output logic [63:0] r_mhpmcounter10_D,
    output logic r_mhpmcounter10_WE,
    output logic [63:0] r_mhpmcounter12_D,
    output logic r_mhpmcounter12_WE,
    output logic [63:0] r_mhpmcounter13_D,
    output logic r_mhpmcounter13_WE,
    output logic [63:0] r_mhpmcounter14_D,
    output logic r_mhpmcounter14_WE,
    output logic [63:0] r_mhpmcounter15_D,
    output logic r_mhpmcounter15_WE,
    output logic [63:0] r_mhpmcounter3_D,
    output logic r_mhpmcounter3_WE,
    output logic [63:0] r_mhpmcounter4_D,
    output logic r_mhpmcounter4_WE,
    output logic [63:0] r_mhpmcounter5_D,
    output logic r_mhpmcounter5_WE,
    output logic [63:0] r_mhpmcounter6_D,
    output logic r_mhpmcounter6_WE,
    output logic [63:0] r_mhpmcounter9_D,
    output logic r_mhpmcounter9_WE
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

    // data-path code:
    assign codasip_tmp_var_2 = (!codasip_tmp_var_0) ? ((s_flush_i_Q & (~s_inhibit_i_Q)) & (~s_hpm_inhibit_i_Q[0])) : 1'b0;
    assign codasip_tmp_var_1 = codasip_tmp_var_0 ? s_perf_we_i_Q[1] : 1'b0;
    assign codasip_tmp_var_0 = ((s_perf_we_i_Q != 2'h0) && ((s_perf_waddr_i_Q == 12'hb03) || (s_perf_waddr_i_Q == 12'hb83)));
    assign codasip_tmp_var_5 = (!codasip_tmp_var_3) ? ((s_csr_flush_i_Q & (~s_inhibit_i_Q)) & (~s_hpm_inhibit_i_Q[1])) : 1'b0;
    assign codasip_tmp_var_4 = codasip_tmp_var_3 ? s_perf_we_i_Q[1] : 1'b0;
    assign codasip_tmp_var_3 = ((s_perf_we_i_Q != 2'h0) && ((s_perf_waddr_i_Q == 12'hb04) || (s_perf_waddr_i_Q == 12'hb84)));
    assign codasip_tmp_var_8 = (!codasip_tmp_var_6) ? ((s_exc_flush_i_Q & (~s_inhibit_i_Q)) & (~s_hpm_inhibit_i_Q[2])) : 1'b0;
    assign codasip_tmp_var_7 = codasip_tmp_var_6 ? s_perf_we_i_Q[1] : 1'b0;
    assign codasip_tmp_var_6 = ((s_perf_we_i_Q != 2'h0) && ((s_perf_waddr_i_Q == 12'hb05) || (s_perf_waddr_i_Q == 12'hb85)));
    assign codasip_tmp_var_11 = (!codasip_tmp_var_9) ? ((s_int_flush_i_Q & (~s_inhibit_i_Q)) & (~s_hpm_inhibit_i_Q[3])) : 1'b0;
    assign codasip_tmp_var_10 = codasip_tmp_var_9 ? s_perf_we_i_Q[1] : 1'b0;
    assign codasip_tmp_var_9 = ((s_perf_we_i_Q != 2'h0) && ((s_perf_waddr_i_Q == 12'hb06) || (s_perf_waddr_i_Q == 12'hb86)));
    assign codasip_tmp_var_14 = (!codasip_tmp_var_12) ? ((s_branch_miss_i_Q & (~s_inhibit_i_Q)) & (~s_hpm_inhibit_i_Q[6])) : 1'b0;
    assign codasip_tmp_var_13 = codasip_tmp_var_12 ? s_perf_we_i_Q[1] : 1'b0;
    assign codasip_tmp_var_12 = ((s_perf_we_i_Q != 2'h0) && ((s_perf_waddr_i_Q == 12'hb09) || (s_perf_waddr_i_Q == 12'hb89)));
    assign codasip_tmp_var_17 = (!codasip_tmp_var_15) ? ((s_data_stall_i_Q & (~s_inhibit_i_Q)) & (~s_hpm_inhibit_i_Q[7])) : 1'b0;
    assign codasip_tmp_var_16 = codasip_tmp_var_15 ? s_perf_we_i_Q[1] : 1'b0;
    assign codasip_tmp_var_15 = ((s_perf_we_i_Q != 2'h0) && ((s_perf_waddr_i_Q == 12'hb0a) || (s_perf_waddr_i_Q == 12'hb8a)));
    assign codasip_tmp_var_20 = (!codasip_tmp_var_18) ? ((s_div_stall_i_Q & (~s_inhibit_i_Q)) & (~s_hpm_inhibit_i_Q[9])) : 1'b0;
    assign codasip_tmp_var_19 = codasip_tmp_var_18 ? s_perf_we_i_Q[1] : 1'b0;
    assign codasip_tmp_var_18 = ((s_perf_we_i_Q != 2'h0) && ((s_perf_waddr_i_Q == 12'hb0c) || (s_perf_waddr_i_Q == 12'hb8c)));
    assign codasip_tmp_var_23 = (!codasip_tmp_var_21) ? ((s_ifu_stall_i_Q & (~s_inhibit_i_Q)) & (~s_hpm_inhibit_i_Q[10])) : 1'b0;
    assign codasip_tmp_var_22 = codasip_tmp_var_21 ? s_perf_we_i_Q[1] : 1'b0;
    assign codasip_tmp_var_21 = ((s_perf_we_i_Q != 2'h0) && ((s_perf_waddr_i_Q == 12'hb0d) || (s_perf_waddr_i_Q == 12'hb8d)));
    assign codasip_tmp_var_26 = (!codasip_tmp_var_24) ? ((s_lsu_stall_i_Q & (~s_inhibit_i_Q)) & (~s_hpm_inhibit_i_Q[11])) : 1'b0;
    assign codasip_tmp_var_25 = codasip_tmp_var_24 ? s_perf_we_i_Q[1] : 1'b0;
    assign codasip_tmp_var_24 = ((s_perf_we_i_Q != 2'h0) && ((s_perf_waddr_i_Q == 12'hb0e) || (s_perf_waddr_i_Q == 12'hb8e)));
    assign codasip_tmp_var_29 = (!codasip_tmp_var_27) ? ((s_fpu_stall_i_Q & (~s_inhibit_i_Q)) & (~s_hpm_inhibit_i_Q[12])) : 1'b0;
    assign codasip_tmp_var_28 = codasip_tmp_var_27 ? s_perf_we_i_Q[1] : 1'b0;
    assign codasip_tmp_var_27 = ((s_perf_we_i_Q != 2'h0) && ((s_perf_waddr_i_Q == 12'hb0f) || (s_perf_waddr_i_Q == 12'hb8f)));
    assign r_mhpmcounter10_D = codasip_tmp_var_16 ? {s_perf_wdata_i_Q, r_mhpmcounter10_Q[31:0]} :
        codasip_tmp_var_15 ? {r_mhpmcounter10_Q[63:32], s_perf_wdata_i_Q} :
        codasip_tmp_var_17 ? (r_mhpmcounter10_Q + 64'h0000000000000001) : 64'h0000000000000000;
    assign r_mhpmcounter10_WE = ((codasip_tmp_var_16 || codasip_tmp_var_15) || codasip_tmp_var_17) ? 1'b1 : 1'b0;
    assign r_mhpmcounter12_D = codasip_tmp_var_19 ? {s_perf_wdata_i_Q, r_mhpmcounter12_Q[31:0]} :
        codasip_tmp_var_18 ? {r_mhpmcounter12_Q[63:32], s_perf_wdata_i_Q} :
        codasip_tmp_var_20 ? (r_mhpmcounter12_Q + 64'h0000000000000001) : 64'h0000000000000000;
    assign r_mhpmcounter12_WE = ((codasip_tmp_var_19 || codasip_tmp_var_18) || codasip_tmp_var_20) ? 1'b1 : 1'b0;
    assign r_mhpmcounter13_D = codasip_tmp_var_22 ? {s_perf_wdata_i_Q, r_mhpmcounter13_Q[31:0]} :
        codasip_tmp_var_21 ? {r_mhpmcounter13_Q[63:32], s_perf_wdata_i_Q} :
        codasip_tmp_var_23 ? (r_mhpmcounter13_Q + 64'h0000000000000001) : 64'h0000000000000000;
    assign r_mhpmcounter13_WE = ((codasip_tmp_var_22 || codasip_tmp_var_21) || codasip_tmp_var_23) ? 1'b1 : 1'b0;
    assign r_mhpmcounter14_D = codasip_tmp_var_25 ? {s_perf_wdata_i_Q, r_mhpmcounter14_Q[31:0]} :
        codasip_tmp_var_24 ? {r_mhpmcounter14_Q[63:32], s_perf_wdata_i_Q} :
        codasip_tmp_var_26 ? (r_mhpmcounter14_Q + 64'h0000000000000001) : 64'h0000000000000000;
    assign r_mhpmcounter14_WE = ((codasip_tmp_var_25 || codasip_tmp_var_24) || codasip_tmp_var_26) ? 1'b1 : 1'b0;
    assign r_mhpmcounter15_D = codasip_tmp_var_28 ? {s_perf_wdata_i_Q, r_mhpmcounter15_Q[31:0]} :
        codasip_tmp_var_27 ? {r_mhpmcounter15_Q[63:32], s_perf_wdata_i_Q} :
        codasip_tmp_var_29 ? (r_mhpmcounter15_Q + 64'h0000000000000001) : 64'h0000000000000000;
    assign r_mhpmcounter15_WE = ((codasip_tmp_var_28 || codasip_tmp_var_27) || codasip_tmp_var_29) ? 1'b1 : 1'b0;
    assign r_mhpmcounter3_D = codasip_tmp_var_1 ? {s_perf_wdata_i_Q, r_mhpmcounter3_Q[31:0]} :
        codasip_tmp_var_0 ? {r_mhpmcounter3_Q[63:32], s_perf_wdata_i_Q} :
        codasip_tmp_var_2 ? (r_mhpmcounter3_Q + 64'h0000000000000001) : 64'h0000000000000000;
    assign r_mhpmcounter3_WE = ((codasip_tmp_var_1 || codasip_tmp_var_0) || codasip_tmp_var_2) ? 1'b1 : 1'b0;
    assign r_mhpmcounter4_D = codasip_tmp_var_4 ? {s_perf_wdata_i_Q, r_mhpmcounter4_Q[31:0]} :
        codasip_tmp_var_3 ? {r_mhpmcounter4_Q[63:32], s_perf_wdata_i_Q} :
        codasip_tmp_var_5 ? (r_mhpmcounter4_Q + 64'h0000000000000001) : 64'h0000000000000000;
    assign r_mhpmcounter4_WE = ((codasip_tmp_var_4 || codasip_tmp_var_3) || codasip_tmp_var_5) ? 1'b1 : 1'b0;
    assign r_mhpmcounter5_D = codasip_tmp_var_7 ? {s_perf_wdata_i_Q, r_mhpmcounter5_Q[31:0]} :
        codasip_tmp_var_6 ? {r_mhpmcounter5_Q[63:32], s_perf_wdata_i_Q} :
        codasip_tmp_var_8 ? (r_mhpmcounter5_Q + 64'h0000000000000001) : 64'h0000000000000000;
    assign r_mhpmcounter5_WE = ((codasip_tmp_var_7 || codasip_tmp_var_6) || codasip_tmp_var_8) ? 1'b1 : 1'b0;
    assign r_mhpmcounter6_D = codasip_tmp_var_10 ? {s_perf_wdata_i_Q, r_mhpmcounter6_Q[31:0]} :
        codasip_tmp_var_9 ? {r_mhpmcounter6_Q[63:32], s_perf_wdata_i_Q} :
        codasip_tmp_var_11 ? (r_mhpmcounter6_Q + 64'h0000000000000001) : 64'h0000000000000000;
    assign r_mhpmcounter6_WE = ((codasip_tmp_var_10 || codasip_tmp_var_9) || codasip_tmp_var_11) ? 1'b1 : 1'b0;
    assign r_mhpmcounter9_D = codasip_tmp_var_13 ? {s_perf_wdata_i_Q, r_mhpmcounter9_Q[31:0]} :
        codasip_tmp_var_12 ? {r_mhpmcounter9_Q[63:32], s_perf_wdata_i_Q} :
        codasip_tmp_var_14 ? (r_mhpmcounter9_Q + 64'h0000000000000001) : 64'h0000000000000000;
    assign r_mhpmcounter9_WE = ((codasip_tmp_var_13 || codasip_tmp_var_12) || codasip_tmp_var_14) ? 1'b1 : 1'b0;
endmodule: codix_berkelium_ca_core_perf_compute_t
