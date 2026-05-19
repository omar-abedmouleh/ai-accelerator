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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_perf_t' CodAL module.
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

module codix_berkelium_ca_core_perf_t(
    input  logic r_wfi_ce_ICLK,
    input  logic RST,
    input  logic s_branch_miss_i_D,
    input  logic s_csr_flush_i_D,
    input  logic s_data_stall_i_D,
    input  logic s_div_stall_i_D,
    input  logic s_exc_flush_i_D,
    input  logic s_flush_i_D,
    input  logic s_fpu_stall_i_D,
    input  logic [12:0] s_hpm_inhibit_i_D,
    input  logic s_ifu_stall_i_D,
    input  logic s_inhibit_i_D,
    input  logic s_int_flush_i_D,
    input  logic s_lsu_stall_i_D,
    input  logic [11:0] s_perf_waddr_i_D,
    input  logic [31:0] s_perf_wdata_i_D,
    input  logic [1:0] s_perf_we_i_D,
    output logic [63:0] r_mhpmcounter10_Q,
    output logic [63:0] r_mhpmcounter12_Q,
    output logic [63:0] r_mhpmcounter13_Q,
    output logic [63:0] r_mhpmcounter14_Q,
    output logic [63:0] r_mhpmcounter15_Q,
    output logic [63:0] r_mhpmcounter3_Q,
    output logic [63:0] r_mhpmcounter4_Q,
    output logic [63:0] r_mhpmcounter5_Q,
    output logic [63:0] r_mhpmcounter6_Q,
    output logic [63:0] r_mhpmcounter9_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic s_inhibit_i;
    // CodAL signal/wire
    logic [12:0] s_hpm_inhibit_i;
    // CodAL signal/wire
    logic s_flush_i;
    // CodAL signal/wire
    logic s_csr_flush_i;
    // CodAL signal/wire
    logic s_exc_flush_i;
    // CodAL signal/wire
    logic s_int_flush_i;
    // CodAL signal/wire
    logic s_branch_miss_i;
    // CodAL signal/wire
    logic s_data_stall_i;
    // CodAL signal/wire
    logic s_div_stall_i;
    // CodAL signal/wire
    logic s_ifu_stall_i;
    // CodAL signal/wire
    logic s_lsu_stall_i;
    // CodAL signal/wire
    logic s_fpu_stall_i;
    // CodAL signal/wire
    logic [31:0] s_perf_wdata_i;
    // CodAL signal/wire
    logic [1:0] s_perf_we_i;
    // CodAL signal/wire
    logic [11:0] s_perf_waddr_i;

    // additional declarations:
    logic compute_r_mhpmcounter3_WE_wire;
    logic [63:0] compute_r_mhpmcounter3_D_wire;
    logic [63:0] r_mhpmcounter3_Q_wire;
    logic compute_r_mhpmcounter4_WE_wire;
    logic [63:0] compute_r_mhpmcounter4_D_wire;
    logic [63:0] r_mhpmcounter4_Q_wire;
    logic compute_r_mhpmcounter5_WE_wire;
    logic [63:0] compute_r_mhpmcounter5_D_wire;
    logic [63:0] r_mhpmcounter5_Q_wire;
    logic compute_r_mhpmcounter6_WE_wire;
    logic [63:0] compute_r_mhpmcounter6_D_wire;
    logic [63:0] r_mhpmcounter6_Q_wire;
    logic compute_r_mhpmcounter9_WE_wire;
    logic [63:0] compute_r_mhpmcounter9_D_wire;
    logic [63:0] r_mhpmcounter9_Q_wire;
    logic compute_r_mhpmcounter10_WE_wire;
    logic [63:0] compute_r_mhpmcounter10_D_wire;
    logic [63:0] r_mhpmcounter10_Q_wire;
    logic compute_r_mhpmcounter12_WE_wire;
    logic [63:0] compute_r_mhpmcounter12_D_wire;
    logic [63:0] r_mhpmcounter12_Q_wire;
    logic compute_r_mhpmcounter13_WE_wire;
    logic [63:0] compute_r_mhpmcounter13_D_wire;
    logic [63:0] r_mhpmcounter13_Q_wire;
    logic compute_r_mhpmcounter14_WE_wire;
    logic [63:0] compute_r_mhpmcounter14_D_wire;
    logic [63:0] r_mhpmcounter14_Q_wire;
    logic compute_r_mhpmcounter15_WE_wire;
    logic [63:0] compute_r_mhpmcounter15_D_wire;
    logic [63:0] r_mhpmcounter15_Q_wire;

    // child instances inside CodAL module:
    // instance of 's_inhibit_i' CodAL signal/wire: (single driver)
    assign s_inhibit_i = s_inhibit_i_D;
    // instance of 's_hpm_inhibit_i' CodAL signal/wire: (single driver)
    assign s_hpm_inhibit_i = s_hpm_inhibit_i_D;
    // instance of 's_flush_i' CodAL signal/wire: (single driver)
    assign s_flush_i = s_flush_i_D;
    // instance of 's_csr_flush_i' CodAL signal/wire: (single driver)
    assign s_csr_flush_i = s_csr_flush_i_D;
    // instance of 's_exc_flush_i' CodAL signal/wire: (single driver)
    assign s_exc_flush_i = s_exc_flush_i_D;
    // instance of 's_int_flush_i' CodAL signal/wire: (single driver)
    assign s_int_flush_i = s_int_flush_i_D;
    // instance of 's_branch_miss_i' CodAL signal/wire: (single driver)
    assign s_branch_miss_i = s_branch_miss_i_D;
    // instance of 's_data_stall_i' CodAL signal/wire: (single driver)
    assign s_data_stall_i = s_data_stall_i_D;
    // instance of 's_div_stall_i' CodAL signal/wire: (single driver)
    assign s_div_stall_i = s_div_stall_i_D;
    // instance of 's_ifu_stall_i' CodAL signal/wire: (single driver)
    assign s_ifu_stall_i = s_ifu_stall_i_D;
    // instance of 's_lsu_stall_i' CodAL signal/wire: (single driver)
    assign s_lsu_stall_i = s_lsu_stall_i_D;
    // instance of 's_fpu_stall_i' CodAL signal/wire: (single driver)
    assign s_fpu_stall_i = s_fpu_stall_i_D;
    // instance of 's_perf_wdata_i' CodAL signal/wire: (single driver)
    assign s_perf_wdata_i = s_perf_wdata_i_D;
    // instance of 's_perf_we_i' CodAL signal/wire: (single driver)
    assign s_perf_we_i = s_perf_we_i_D;
    // instance of 's_perf_waddr_i' CodAL signal/wire: (single driver)
    assign s_perf_waddr_i = s_perf_waddr_i_D;
    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd64),
        .DEFAULT_VALUE(64'h0000000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_mhpmcounter3 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(compute_r_mhpmcounter3_WE_wire),
        .D(compute_r_mhpmcounter3_D_wire),
        .Q(r_mhpmcounter3_Q_wire)
    );
    assign r_mhpmcounter3_Q = r_mhpmcounter3_Q_wire;

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd64),
        .DEFAULT_VALUE(64'h0000000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_mhpmcounter4 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(compute_r_mhpmcounter4_WE_wire),
        .D(compute_r_mhpmcounter4_D_wire),
        .Q(r_mhpmcounter4_Q_wire)
    );
    assign r_mhpmcounter4_Q = r_mhpmcounter4_Q_wire;

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd64),
        .DEFAULT_VALUE(64'h0000000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_mhpmcounter5 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(compute_r_mhpmcounter5_WE_wire),
        .D(compute_r_mhpmcounter5_D_wire),
        .Q(r_mhpmcounter5_Q_wire)
    );
    assign r_mhpmcounter5_Q = r_mhpmcounter5_Q_wire;

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd64),
        .DEFAULT_VALUE(64'h0000000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_mhpmcounter6 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(compute_r_mhpmcounter6_WE_wire),
        .D(compute_r_mhpmcounter6_D_wire),
        .Q(r_mhpmcounter6_Q_wire)
    );
    assign r_mhpmcounter6_Q = r_mhpmcounter6_Q_wire;

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd64),
        .DEFAULT_VALUE(64'h0000000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_mhpmcounter9 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(compute_r_mhpmcounter9_WE_wire),
        .D(compute_r_mhpmcounter9_D_wire),
        .Q(r_mhpmcounter9_Q_wire)
    );
    assign r_mhpmcounter9_Q = r_mhpmcounter9_Q_wire;

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd64),
        .DEFAULT_VALUE(64'h0000000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_mhpmcounter10 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(compute_r_mhpmcounter10_WE_wire),
        .D(compute_r_mhpmcounter10_D_wire),
        .Q(r_mhpmcounter10_Q_wire)
    );
    assign r_mhpmcounter10_Q = r_mhpmcounter10_Q_wire;

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd64),
        .DEFAULT_VALUE(64'h0000000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_mhpmcounter12 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(compute_r_mhpmcounter12_WE_wire),
        .D(compute_r_mhpmcounter12_D_wire),
        .Q(r_mhpmcounter12_Q_wire)
    );
    assign r_mhpmcounter12_Q = r_mhpmcounter12_Q_wire;

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd64),
        .DEFAULT_VALUE(64'h0000000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_mhpmcounter13 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(compute_r_mhpmcounter13_WE_wire),
        .D(compute_r_mhpmcounter13_D_wire),
        .Q(r_mhpmcounter13_Q_wire)
    );
    assign r_mhpmcounter13_Q = r_mhpmcounter13_Q_wire;

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd64),
        .DEFAULT_VALUE(64'h0000000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_mhpmcounter14 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(compute_r_mhpmcounter14_WE_wire),
        .D(compute_r_mhpmcounter14_D_wire),
        .Q(r_mhpmcounter14_Q_wire)
    );
    assign r_mhpmcounter14_Q = r_mhpmcounter14_Q_wire;

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd64),
        .DEFAULT_VALUE(64'h0000000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_mhpmcounter15 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(compute_r_mhpmcounter15_WE_wire),
        .D(compute_r_mhpmcounter15_D_wire),
        .Q(r_mhpmcounter15_Q_wire)
    );
    assign r_mhpmcounter15_Q = r_mhpmcounter15_Q_wire;

    // functional unit instance:
    codix_berkelium_ca_core_perf_compute_t compute (
        .r_mhpmcounter10_Q(r_mhpmcounter10_Q_wire),
        .r_mhpmcounter12_Q(r_mhpmcounter12_Q_wire),
        .r_mhpmcounter13_Q(r_mhpmcounter13_Q_wire),
        .r_mhpmcounter14_Q(r_mhpmcounter14_Q_wire),
        .r_mhpmcounter15_Q(r_mhpmcounter15_Q_wire),
        .r_mhpmcounter3_Q(r_mhpmcounter3_Q_wire),
        .r_mhpmcounter4_Q(r_mhpmcounter4_Q_wire),
        .r_mhpmcounter5_Q(r_mhpmcounter5_Q_wire),
        .r_mhpmcounter6_Q(r_mhpmcounter6_Q_wire),
        .r_mhpmcounter9_Q(r_mhpmcounter9_Q_wire),
        .s_branch_miss_i_Q(s_branch_miss_i),
        .s_csr_flush_i_Q(s_csr_flush_i),
        .s_data_stall_i_Q(s_data_stall_i),
        .s_div_stall_i_Q(s_div_stall_i),
        .s_exc_flush_i_Q(s_exc_flush_i),
        .s_flush_i_Q(s_flush_i),
        .s_fpu_stall_i_Q(s_fpu_stall_i),
        .s_hpm_inhibit_i_Q(s_hpm_inhibit_i),
        .s_ifu_stall_i_Q(s_ifu_stall_i),
        .s_inhibit_i_Q(s_inhibit_i),
        .s_int_flush_i_Q(s_int_flush_i),
        .s_lsu_stall_i_Q(s_lsu_stall_i),
        .s_perf_waddr_i_Q(s_perf_waddr_i),
        .s_perf_wdata_i_Q(s_perf_wdata_i),
        .s_perf_we_i_Q(s_perf_we_i),
        .r_mhpmcounter10_D(compute_r_mhpmcounter10_D_wire),
        .r_mhpmcounter10_WE(compute_r_mhpmcounter10_WE_wire),
        .r_mhpmcounter12_D(compute_r_mhpmcounter12_D_wire),
        .r_mhpmcounter12_WE(compute_r_mhpmcounter12_WE_wire),
        .r_mhpmcounter13_D(compute_r_mhpmcounter13_D_wire),
        .r_mhpmcounter13_WE(compute_r_mhpmcounter13_WE_wire),
        .r_mhpmcounter14_D(compute_r_mhpmcounter14_D_wire),
        .r_mhpmcounter14_WE(compute_r_mhpmcounter14_WE_wire),
        .r_mhpmcounter15_D(compute_r_mhpmcounter15_D_wire),
        .r_mhpmcounter15_WE(compute_r_mhpmcounter15_WE_wire),
        .r_mhpmcounter3_D(compute_r_mhpmcounter3_D_wire),
        .r_mhpmcounter3_WE(compute_r_mhpmcounter3_WE_wire),
        .r_mhpmcounter4_D(compute_r_mhpmcounter4_D_wire),
        .r_mhpmcounter4_WE(compute_r_mhpmcounter4_WE_wire),
        .r_mhpmcounter5_D(compute_r_mhpmcounter5_D_wire),
        .r_mhpmcounter5_WE(compute_r_mhpmcounter5_WE_wire),
        .r_mhpmcounter6_D(compute_r_mhpmcounter6_D_wire),
        .r_mhpmcounter6_WE(compute_r_mhpmcounter6_WE_wire),
        .r_mhpmcounter9_D(compute_r_mhpmcounter9_D_wire),
        .r_mhpmcounter9_WE(compute_r_mhpmcounter9_WE_wire)
    );

endmodule: codix_berkelium_ca_core_perf_t
