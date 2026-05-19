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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_lsu_pmp_t' CodAL module.
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

module codix_berkelium_ca_core_execute_stage_lsu_pmp_t(
    input  logic r_wfi_ce_ICLK,
    input  logic RST,
    input  logic [31:0] ldst_s_addr_i_D,
    input  logic [1:0] ldst_s_prv_i_D,
    input  logic ldst_s_valid_i_D,
    input  logic ldst_s_write_i_D,
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
    input  logic [11:0] s_csr_waddr_i_D,
    input  logic [31:0] s_csr_wdata_i_D,
    input  logic s_csr_we_i_D,
    output logic ldst_s_fault_o_Q,
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
    output logic [31:0] r_pmp0_napot_mask_Q,
    output logic [31:0] r_pmp10_napot_mask_Q,
    output logic [31:0] r_pmp11_napot_mask_Q,
    output logic [31:0] r_pmp12_napot_mask_Q,
    output logic [31:0] r_pmp13_napot_mask_Q,
    output logic [31:0] r_pmp14_napot_mask_Q,
    output logic [31:0] r_pmp15_napot_mask_Q,
    output logic [31:0] r_pmp1_napot_mask_Q,
    output logic [31:0] r_pmp2_napot_mask_Q,
    output logic [31:0] r_pmp3_napot_mask_Q,
    output logic [31:0] r_pmp4_napot_mask_Q,
    output logic [31:0] r_pmp5_napot_mask_Q,
    output logic [31:0] r_pmp6_napot_mask_Q,
    output logic [31:0] r_pmp7_napot_mask_Q,
    output logic [31:0] r_pmp8_napot_mask_Q,
    output logic [31:0] r_pmp9_napot_mask_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic s_csr_we_i;
    // CodAL signal/wire
    logic [11:0] s_csr_waddr_i;
    // CodAL signal/wire
    logic [31:0] s_csr_wdata_i;
    // CodAL signal/wire
    logic s_pmpaddr0_we;
    // CodAL signal/wire
    logic s_pmpaddr1_we;
    // CodAL signal/wire
    logic s_pmpaddr2_we;
    // CodAL signal/wire
    logic s_pmpaddr3_we;
    // CodAL signal/wire
    logic s_pmpaddr4_we;
    // CodAL signal/wire
    logic s_pmpaddr5_we;
    // CodAL signal/wire
    logic s_pmpaddr6_we;
    // CodAL signal/wire
    logic s_pmpaddr7_we;
    // CodAL signal/wire
    logic s_pmpaddr8_we;
    // CodAL signal/wire
    logic s_pmpaddr9_we;
    // CodAL signal/wire
    logic s_pmpaddr10_we;
    // CodAL signal/wire
    logic s_pmpaddr11_we;
    // CodAL signal/wire
    logic s_pmpaddr12_we;
    // CodAL signal/wire
    logic s_pmpaddr13_we;
    // CodAL signal/wire
    logic s_pmpaddr14_we;
    // CodAL signal/wire
    logic s_pmpaddr15_we;
    // CodAL signal/wire
    logic [31:0] s_csr_pmpaddr0_new;
    // CodAL signal/wire
    logic [31:0] s_csr_pmpaddr1_new;
    // CodAL signal/wire
    logic [31:0] s_csr_pmpaddr2_new;
    // CodAL signal/wire
    logic [31:0] s_csr_pmpaddr3_new;
    // CodAL signal/wire
    logic [31:0] s_csr_pmpaddr4_new;
    // CodAL signal/wire
    logic [31:0] s_csr_pmpaddr5_new;
    // CodAL signal/wire
    logic [31:0] s_csr_pmpaddr6_new;
    // CodAL signal/wire
    logic [31:0] s_csr_pmpaddr7_new;
    // CodAL signal/wire
    logic [31:0] s_csr_pmpaddr8_new;
    // CodAL signal/wire
    logic [31:0] s_csr_pmpaddr9_new;
    // CodAL signal/wire
    logic [31:0] s_csr_pmpaddr10_new;
    // CodAL signal/wire
    logic [31:0] s_csr_pmpaddr11_new;
    // CodAL signal/wire
    logic [31:0] s_csr_pmpaddr12_new;
    // CodAL signal/wire
    logic [31:0] s_csr_pmpaddr13_new;
    // CodAL signal/wire
    logic [31:0] s_csr_pmpaddr14_new;
    // CodAL signal/wire
    logic [31:0] s_csr_pmpaddr15_new;
    // CodAL signal/wire
    logic s_pmpcfg0_we;
    // CodAL signal/wire
    logic s_pmpcfg1_we;
    // CodAL signal/wire
    logic s_pmpcfg2_we;
    // CodAL signal/wire
    logic s_pmpcfg3_we;
    // CodAL signal/wire
    logic [31:0] s_csr_pmpcfg0_new;
    // CodAL signal/wire
    logic [31:0] s_csr_pmpcfg1_new;
    // CodAL signal/wire
    logic [31:0] s_csr_pmpcfg2_new;
    // CodAL signal/wire
    logic [31:0] s_csr_pmpcfg3_new;

    // additional declarations:
    logic csr_write_r_pmp0_napot_mask_WE_wire;
    logic [31:0] csr_write_r_pmp0_napot_mask_D_wire;
    logic [31:0] r_pmp0_napot_mask_Q_wire;
    logic csr_write_r_pmp1_napot_mask_WE_wire;
    logic [31:0] csr_write_r_pmp1_napot_mask_D_wire;
    logic [31:0] r_pmp1_napot_mask_Q_wire;
    logic csr_write_r_pmp2_napot_mask_WE_wire;
    logic [31:0] csr_write_r_pmp2_napot_mask_D_wire;
    logic [31:0] r_pmp2_napot_mask_Q_wire;
    logic csr_write_r_pmp3_napot_mask_WE_wire;
    logic [31:0] csr_write_r_pmp3_napot_mask_D_wire;
    logic [31:0] r_pmp3_napot_mask_Q_wire;
    logic csr_write_r_pmp4_napot_mask_WE_wire;
    logic [31:0] csr_write_r_pmp4_napot_mask_D_wire;
    logic [31:0] r_pmp4_napot_mask_Q_wire;
    logic csr_write_r_pmp5_napot_mask_WE_wire;
    logic [31:0] csr_write_r_pmp5_napot_mask_D_wire;
    logic [31:0] r_pmp5_napot_mask_Q_wire;
    logic csr_write_r_pmp6_napot_mask_WE_wire;
    logic [31:0] csr_write_r_pmp6_napot_mask_D_wire;
    logic [31:0] r_pmp6_napot_mask_Q_wire;
    logic csr_write_r_pmp7_napot_mask_WE_wire;
    logic [31:0] csr_write_r_pmp7_napot_mask_D_wire;
    logic [31:0] r_pmp7_napot_mask_Q_wire;
    logic csr_write_r_pmp8_napot_mask_WE_wire;
    logic [31:0] csr_write_r_pmp8_napot_mask_D_wire;
    logic [31:0] r_pmp8_napot_mask_Q_wire;
    logic csr_write_r_pmp9_napot_mask_WE_wire;
    logic [31:0] csr_write_r_pmp9_napot_mask_D_wire;
    logic [31:0] r_pmp9_napot_mask_Q_wire;
    logic csr_write_r_pmp10_napot_mask_WE_wire;
    logic [31:0] csr_write_r_pmp10_napot_mask_D_wire;
    logic [31:0] r_pmp10_napot_mask_Q_wire;
    logic csr_write_r_pmp11_napot_mask_WE_wire;
    logic [31:0] csr_write_r_pmp11_napot_mask_D_wire;
    logic [31:0] r_pmp11_napot_mask_Q_wire;
    logic csr_write_r_pmp12_napot_mask_WE_wire;
    logic [31:0] csr_write_r_pmp12_napot_mask_D_wire;
    logic [31:0] r_pmp12_napot_mask_Q_wire;
    logic csr_write_r_pmp13_napot_mask_WE_wire;
    logic [31:0] csr_write_r_pmp13_napot_mask_D_wire;
    logic [31:0] r_pmp13_napot_mask_Q_wire;
    logic csr_write_r_pmp14_napot_mask_WE_wire;
    logic [31:0] csr_write_r_pmp14_napot_mask_D_wire;
    logic [31:0] r_pmp14_napot_mask_Q_wire;
    logic csr_write_r_pmp15_napot_mask_WE_wire;
    logic [31:0] csr_write_r_pmp15_napot_mask_D_wire;
    logic [31:0] r_pmp15_napot_mask_Q_wire;

    // child instances inside CodAL module:
    // instance of 's_csr_we_i' CodAL signal/wire: (single driver)
    assign s_csr_we_i = s_csr_we_i_D;
    // instance of 's_csr_waddr_i' CodAL signal/wire: (single driver)
    assign s_csr_waddr_i = s_csr_waddr_i_D;
    // instance of 's_csr_wdata_i' CodAL signal/wire: (single driver)
    assign s_csr_wdata_i = s_csr_wdata_i_D;
    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_pmp0_napot_mask (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(csr_write_r_pmp0_napot_mask_WE_wire),
        .D(csr_write_r_pmp0_napot_mask_D_wire),
        .Q(r_pmp0_napot_mask_Q_wire)
    );
    assign r_pmp0_napot_mask_Q = r_pmp0_napot_mask_Q_wire;

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_pmp1_napot_mask (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(csr_write_r_pmp1_napot_mask_WE_wire),
        .D(csr_write_r_pmp1_napot_mask_D_wire),
        .Q(r_pmp1_napot_mask_Q_wire)
    );
    assign r_pmp1_napot_mask_Q = r_pmp1_napot_mask_Q_wire;

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_pmp2_napot_mask (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(csr_write_r_pmp2_napot_mask_WE_wire),
        .D(csr_write_r_pmp2_napot_mask_D_wire),
        .Q(r_pmp2_napot_mask_Q_wire)
    );
    assign r_pmp2_napot_mask_Q = r_pmp2_napot_mask_Q_wire;

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_pmp3_napot_mask (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(csr_write_r_pmp3_napot_mask_WE_wire),
        .D(csr_write_r_pmp3_napot_mask_D_wire),
        .Q(r_pmp3_napot_mask_Q_wire)
    );
    assign r_pmp3_napot_mask_Q = r_pmp3_napot_mask_Q_wire;

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_pmp4_napot_mask (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(csr_write_r_pmp4_napot_mask_WE_wire),
        .D(csr_write_r_pmp4_napot_mask_D_wire),
        .Q(r_pmp4_napot_mask_Q_wire)
    );
    assign r_pmp4_napot_mask_Q = r_pmp4_napot_mask_Q_wire;

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_pmp5_napot_mask (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(csr_write_r_pmp5_napot_mask_WE_wire),
        .D(csr_write_r_pmp5_napot_mask_D_wire),
        .Q(r_pmp5_napot_mask_Q_wire)
    );
    assign r_pmp5_napot_mask_Q = r_pmp5_napot_mask_Q_wire;

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_pmp6_napot_mask (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(csr_write_r_pmp6_napot_mask_WE_wire),
        .D(csr_write_r_pmp6_napot_mask_D_wire),
        .Q(r_pmp6_napot_mask_Q_wire)
    );
    assign r_pmp6_napot_mask_Q = r_pmp6_napot_mask_Q_wire;

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_pmp7_napot_mask (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(csr_write_r_pmp7_napot_mask_WE_wire),
        .D(csr_write_r_pmp7_napot_mask_D_wire),
        .Q(r_pmp7_napot_mask_Q_wire)
    );
    assign r_pmp7_napot_mask_Q = r_pmp7_napot_mask_Q_wire;

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_pmp8_napot_mask (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(csr_write_r_pmp8_napot_mask_WE_wire),
        .D(csr_write_r_pmp8_napot_mask_D_wire),
        .Q(r_pmp8_napot_mask_Q_wire)
    );
    assign r_pmp8_napot_mask_Q = r_pmp8_napot_mask_Q_wire;

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_pmp9_napot_mask (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(csr_write_r_pmp9_napot_mask_WE_wire),
        .D(csr_write_r_pmp9_napot_mask_D_wire),
        .Q(r_pmp9_napot_mask_Q_wire)
    );
    assign r_pmp9_napot_mask_Q = r_pmp9_napot_mask_Q_wire;

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_pmp10_napot_mask (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(csr_write_r_pmp10_napot_mask_WE_wire),
        .D(csr_write_r_pmp10_napot_mask_D_wire),
        .Q(r_pmp10_napot_mask_Q_wire)
    );
    assign r_pmp10_napot_mask_Q = r_pmp10_napot_mask_Q_wire;

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_pmp11_napot_mask (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(csr_write_r_pmp11_napot_mask_WE_wire),
        .D(csr_write_r_pmp11_napot_mask_D_wire),
        .Q(r_pmp11_napot_mask_Q_wire)
    );
    assign r_pmp11_napot_mask_Q = r_pmp11_napot_mask_Q_wire;

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_pmp12_napot_mask (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(csr_write_r_pmp12_napot_mask_WE_wire),
        .D(csr_write_r_pmp12_napot_mask_D_wire),
        .Q(r_pmp12_napot_mask_Q_wire)
    );
    assign r_pmp12_napot_mask_Q = r_pmp12_napot_mask_Q_wire;

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_pmp13_napot_mask (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(csr_write_r_pmp13_napot_mask_WE_wire),
        .D(csr_write_r_pmp13_napot_mask_D_wire),
        .Q(r_pmp13_napot_mask_Q_wire)
    );
    assign r_pmp13_napot_mask_Q = r_pmp13_napot_mask_Q_wire;

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_pmp14_napot_mask (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(csr_write_r_pmp14_napot_mask_WE_wire),
        .D(csr_write_r_pmp14_napot_mask_D_wire),
        .Q(r_pmp14_napot_mask_Q_wire)
    );
    assign r_pmp14_napot_mask_Q = r_pmp14_napot_mask_Q_wire;

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_pmp15_napot_mask (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(csr_write_r_pmp15_napot_mask_WE_wire),
        .D(csr_write_r_pmp15_napot_mask_D_wire),
        .Q(r_pmp15_napot_mask_Q_wire)
    );
    assign r_pmp15_napot_mask_Q = r_pmp15_napot_mask_Q_wire;

    // CodAL module instance:
    codix_berkelium_ca_core_execute_stage_lsu_pmp_ldst_t ldst (
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
        .r_pmp0_napot_mask_Q(r_pmp0_napot_mask_Q_wire),
        .r_pmp10_napot_mask_Q(r_pmp10_napot_mask_Q_wire),
        .r_pmp11_napot_mask_Q(r_pmp11_napot_mask_Q_wire),
        .r_pmp12_napot_mask_Q(r_pmp12_napot_mask_Q_wire),
        .r_pmp13_napot_mask_Q(r_pmp13_napot_mask_Q_wire),
        .r_pmp14_napot_mask_Q(r_pmp14_napot_mask_Q_wire),
        .r_pmp15_napot_mask_Q(r_pmp15_napot_mask_Q_wire),
        .r_pmp1_napot_mask_Q(r_pmp1_napot_mask_Q_wire),
        .r_pmp2_napot_mask_Q(r_pmp2_napot_mask_Q_wire),
        .r_pmp3_napot_mask_Q(r_pmp3_napot_mask_Q_wire),
        .r_pmp4_napot_mask_Q(r_pmp4_napot_mask_Q_wire),
        .r_pmp5_napot_mask_Q(r_pmp5_napot_mask_Q_wire),
        .r_pmp6_napot_mask_Q(r_pmp6_napot_mask_Q_wire),
        .r_pmp7_napot_mask_Q(r_pmp7_napot_mask_Q_wire),
        .r_pmp8_napot_mask_Q(r_pmp8_napot_mask_Q_wire),
        .r_pmp9_napot_mask_Q(r_pmp9_napot_mask_Q_wire),
        .s_addr_i_D(ldst_s_addr_i_D),
        .s_prv_i_D(ldst_s_prv_i_D),
        .s_valid_i_D(ldst_s_valid_i_D),
        .s_write_i_D(ldst_s_write_i_D),
        .s_fault_o_Q(ldst_s_fault_o_Q)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_lsu_pmp_csr_write_t csr_write (
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
        .s_csr_pmpaddr0_new_Q(s_csr_pmpaddr0_new),
        .s_csr_pmpaddr10_new_Q(s_csr_pmpaddr10_new),
        .s_csr_pmpaddr11_new_Q(s_csr_pmpaddr11_new),
        .s_csr_pmpaddr12_new_Q(s_csr_pmpaddr12_new),
        .s_csr_pmpaddr13_new_Q(s_csr_pmpaddr13_new),
        .s_csr_pmpaddr14_new_Q(s_csr_pmpaddr14_new),
        .s_csr_pmpaddr15_new_Q(s_csr_pmpaddr15_new),
        .s_csr_pmpaddr1_new_Q(s_csr_pmpaddr1_new),
        .s_csr_pmpaddr2_new_Q(s_csr_pmpaddr2_new),
        .s_csr_pmpaddr3_new_Q(s_csr_pmpaddr3_new),
        .s_csr_pmpaddr4_new_Q(s_csr_pmpaddr4_new),
        .s_csr_pmpaddr5_new_Q(s_csr_pmpaddr5_new),
        .s_csr_pmpaddr6_new_Q(s_csr_pmpaddr6_new),
        .s_csr_pmpaddr7_new_Q(s_csr_pmpaddr7_new),
        .s_csr_pmpaddr8_new_Q(s_csr_pmpaddr8_new),
        .s_csr_pmpaddr9_new_Q(s_csr_pmpaddr9_new),
        .s_csr_pmpcfg0_new_Q(s_csr_pmpcfg0_new),
        .s_csr_pmpcfg1_new_Q(s_csr_pmpcfg1_new),
        .s_csr_pmpcfg2_new_Q(s_csr_pmpcfg2_new),
        .s_csr_pmpcfg3_new_Q(s_csr_pmpcfg3_new),
        .s_csr_waddr_i_Q(s_csr_waddr_i),
        .s_csr_wdata_i_Q(s_csr_wdata_i),
        .s_csr_we_i_Q(s_csr_we_i),
        .s_pmpaddr0_we_Q(s_pmpaddr0_we),
        .s_pmpaddr10_we_Q(s_pmpaddr10_we),
        .s_pmpaddr11_we_Q(s_pmpaddr11_we),
        .s_pmpaddr12_we_Q(s_pmpaddr12_we),
        .s_pmpaddr13_we_Q(s_pmpaddr13_we),
        .s_pmpaddr14_we_Q(s_pmpaddr14_we),
        .s_pmpaddr15_we_Q(s_pmpaddr15_we),
        .s_pmpaddr1_we_Q(s_pmpaddr1_we),
        .s_pmpaddr2_we_Q(s_pmpaddr2_we),
        .s_pmpaddr3_we_Q(s_pmpaddr3_we),
        .s_pmpaddr4_we_Q(s_pmpaddr4_we),
        .s_pmpaddr5_we_Q(s_pmpaddr5_we),
        .s_pmpaddr6_we_Q(s_pmpaddr6_we),
        .s_pmpaddr7_we_Q(s_pmpaddr7_we),
        .s_pmpaddr8_we_Q(s_pmpaddr8_we),
        .s_pmpaddr9_we_Q(s_pmpaddr9_we),
        .s_pmpcfg0_we_Q(s_pmpcfg0_we),
        .s_pmpcfg1_we_Q(s_pmpcfg1_we),
        .s_pmpcfg2_we_Q(s_pmpcfg2_we),
        .s_pmpcfg3_we_Q(s_pmpcfg3_we),
        .r_csr_pmpaddr0_D(r_csr_pmpaddr0_D),
        .r_csr_pmpaddr0_WE(r_csr_pmpaddr0_WE),
        .r_csr_pmpaddr10_D(r_csr_pmpaddr10_D),
        .r_csr_pmpaddr10_WE(r_csr_pmpaddr10_WE),
        .r_csr_pmpaddr11_D(r_csr_pmpaddr11_D),
        .r_csr_pmpaddr11_WE(r_csr_pmpaddr11_WE),
        .r_csr_pmpaddr12_D(r_csr_pmpaddr12_D),
        .r_csr_pmpaddr12_WE(r_csr_pmpaddr12_WE),
        .r_csr_pmpaddr13_D(r_csr_pmpaddr13_D),
        .r_csr_pmpaddr13_WE(r_csr_pmpaddr13_WE),
        .r_csr_pmpaddr14_D(r_csr_pmpaddr14_D),
        .r_csr_pmpaddr14_WE(r_csr_pmpaddr14_WE),
        .r_csr_pmpaddr15_D(r_csr_pmpaddr15_D),
        .r_csr_pmpaddr15_WE(r_csr_pmpaddr15_WE),
        .r_csr_pmpaddr1_D(r_csr_pmpaddr1_D),
        .r_csr_pmpaddr1_WE(r_csr_pmpaddr1_WE),
        .r_csr_pmpaddr2_D(r_csr_pmpaddr2_D),
        .r_csr_pmpaddr2_WE(r_csr_pmpaddr2_WE),
        .r_csr_pmpaddr3_D(r_csr_pmpaddr3_D),
        .r_csr_pmpaddr3_WE(r_csr_pmpaddr3_WE),
        .r_csr_pmpaddr4_D(r_csr_pmpaddr4_D),
        .r_csr_pmpaddr4_WE(r_csr_pmpaddr4_WE),
        .r_csr_pmpaddr5_D(r_csr_pmpaddr5_D),
        .r_csr_pmpaddr5_WE(r_csr_pmpaddr5_WE),
        .r_csr_pmpaddr6_D(r_csr_pmpaddr6_D),
        .r_csr_pmpaddr6_WE(r_csr_pmpaddr6_WE),
        .r_csr_pmpaddr7_D(r_csr_pmpaddr7_D),
        .r_csr_pmpaddr7_WE(r_csr_pmpaddr7_WE),
        .r_csr_pmpaddr8_D(r_csr_pmpaddr8_D),
        .r_csr_pmpaddr8_WE(r_csr_pmpaddr8_WE),
        .r_csr_pmpaddr9_D(r_csr_pmpaddr9_D),
        .r_csr_pmpaddr9_WE(r_csr_pmpaddr9_WE),
        .r_csr_pmpcfg0_D(r_csr_pmpcfg0_D),
        .r_csr_pmpcfg0_WE(r_csr_pmpcfg0_WE),
        .r_csr_pmpcfg1_D(r_csr_pmpcfg1_D),
        .r_csr_pmpcfg1_WE(r_csr_pmpcfg1_WE),
        .r_csr_pmpcfg2_D(r_csr_pmpcfg2_D),
        .r_csr_pmpcfg2_WE(r_csr_pmpcfg2_WE),
        .r_csr_pmpcfg3_D(r_csr_pmpcfg3_D),
        .r_csr_pmpcfg3_WE(r_csr_pmpcfg3_WE),
        .r_pmp0_napot_mask_D(csr_write_r_pmp0_napot_mask_D_wire),
        .r_pmp0_napot_mask_WE(csr_write_r_pmp0_napot_mask_WE_wire),
        .r_pmp10_napot_mask_D(csr_write_r_pmp10_napot_mask_D_wire),
        .r_pmp10_napot_mask_WE(csr_write_r_pmp10_napot_mask_WE_wire),
        .r_pmp11_napot_mask_D(csr_write_r_pmp11_napot_mask_D_wire),
        .r_pmp11_napot_mask_WE(csr_write_r_pmp11_napot_mask_WE_wire),
        .r_pmp12_napot_mask_D(csr_write_r_pmp12_napot_mask_D_wire),
        .r_pmp12_napot_mask_WE(csr_write_r_pmp12_napot_mask_WE_wire),
        .r_pmp13_napot_mask_D(csr_write_r_pmp13_napot_mask_D_wire),
        .r_pmp13_napot_mask_WE(csr_write_r_pmp13_napot_mask_WE_wire),
        .r_pmp14_napot_mask_D(csr_write_r_pmp14_napot_mask_D_wire),
        .r_pmp14_napot_mask_WE(csr_write_r_pmp14_napot_mask_WE_wire),
        .r_pmp15_napot_mask_D(csr_write_r_pmp15_napot_mask_D_wire),
        .r_pmp15_napot_mask_WE(csr_write_r_pmp15_napot_mask_WE_wire),
        .r_pmp1_napot_mask_D(csr_write_r_pmp1_napot_mask_D_wire),
        .r_pmp1_napot_mask_WE(csr_write_r_pmp1_napot_mask_WE_wire),
        .r_pmp2_napot_mask_D(csr_write_r_pmp2_napot_mask_D_wire),
        .r_pmp2_napot_mask_WE(csr_write_r_pmp2_napot_mask_WE_wire),
        .r_pmp3_napot_mask_D(csr_write_r_pmp3_napot_mask_D_wire),
        .r_pmp3_napot_mask_WE(csr_write_r_pmp3_napot_mask_WE_wire),
        .r_pmp4_napot_mask_D(csr_write_r_pmp4_napot_mask_D_wire),
        .r_pmp4_napot_mask_WE(csr_write_r_pmp4_napot_mask_WE_wire),
        .r_pmp5_napot_mask_D(csr_write_r_pmp5_napot_mask_D_wire),
        .r_pmp5_napot_mask_WE(csr_write_r_pmp5_napot_mask_WE_wire),
        .r_pmp6_napot_mask_D(csr_write_r_pmp6_napot_mask_D_wire),
        .r_pmp6_napot_mask_WE(csr_write_r_pmp6_napot_mask_WE_wire),
        .r_pmp7_napot_mask_D(csr_write_r_pmp7_napot_mask_D_wire),
        .r_pmp7_napot_mask_WE(csr_write_r_pmp7_napot_mask_WE_wire),
        .r_pmp8_napot_mask_D(csr_write_r_pmp8_napot_mask_D_wire),
        .r_pmp8_napot_mask_WE(csr_write_r_pmp8_napot_mask_WE_wire),
        .r_pmp9_napot_mask_D(csr_write_r_pmp9_napot_mask_D_wire),
        .r_pmp9_napot_mask_WE(csr_write_r_pmp9_napot_mask_WE_wire),
        .s_csr_pmpaddr0_new_D(s_csr_pmpaddr0_new),
        .s_csr_pmpaddr10_new_D(s_csr_pmpaddr10_new),
        .s_csr_pmpaddr11_new_D(s_csr_pmpaddr11_new),
        .s_csr_pmpaddr12_new_D(s_csr_pmpaddr12_new),
        .s_csr_pmpaddr13_new_D(s_csr_pmpaddr13_new),
        .s_csr_pmpaddr14_new_D(s_csr_pmpaddr14_new),
        .s_csr_pmpaddr15_new_D(s_csr_pmpaddr15_new),
        .s_csr_pmpaddr1_new_D(s_csr_pmpaddr1_new),
        .s_csr_pmpaddr2_new_D(s_csr_pmpaddr2_new),
        .s_csr_pmpaddr3_new_D(s_csr_pmpaddr3_new),
        .s_csr_pmpaddr4_new_D(s_csr_pmpaddr4_new),
        .s_csr_pmpaddr5_new_D(s_csr_pmpaddr5_new),
        .s_csr_pmpaddr6_new_D(s_csr_pmpaddr6_new),
        .s_csr_pmpaddr7_new_D(s_csr_pmpaddr7_new),
        .s_csr_pmpaddr8_new_D(s_csr_pmpaddr8_new),
        .s_csr_pmpaddr9_new_D(s_csr_pmpaddr9_new),
        .s_csr_pmpcfg0_new_D(s_csr_pmpcfg0_new),
        .s_csr_pmpcfg1_new_D(s_csr_pmpcfg1_new),
        .s_csr_pmpcfg2_new_D(s_csr_pmpcfg2_new),
        .s_csr_pmpcfg3_new_D(s_csr_pmpcfg3_new),
        .s_pmpaddr0_we_D(s_pmpaddr0_we),
        .s_pmpaddr10_we_D(s_pmpaddr10_we),
        .s_pmpaddr11_we_D(s_pmpaddr11_we),
        .s_pmpaddr12_we_D(s_pmpaddr12_we),
        .s_pmpaddr13_we_D(s_pmpaddr13_we),
        .s_pmpaddr14_we_D(s_pmpaddr14_we),
        .s_pmpaddr15_we_D(s_pmpaddr15_we),
        .s_pmpaddr1_we_D(s_pmpaddr1_we),
        .s_pmpaddr2_we_D(s_pmpaddr2_we),
        .s_pmpaddr3_we_D(s_pmpaddr3_we),
        .s_pmpaddr4_we_D(s_pmpaddr4_we),
        .s_pmpaddr5_we_D(s_pmpaddr5_we),
        .s_pmpaddr6_we_D(s_pmpaddr6_we),
        .s_pmpaddr7_we_D(s_pmpaddr7_we),
        .s_pmpaddr8_we_D(s_pmpaddr8_we),
        .s_pmpaddr9_we_D(s_pmpaddr9_we),
        .s_pmpcfg0_we_D(s_pmpcfg0_we),
        .s_pmpcfg1_we_D(s_pmpcfg1_we),
        .s_pmpcfg2_we_D(s_pmpcfg2_we),
        .s_pmpcfg3_we_D(s_pmpcfg3_we)
    );

endmodule: codix_berkelium_ca_core_execute_stage_lsu_pmp_t
