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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_riscv_dm_dbg_progbuf_t' RISC-V Debug - Program Buffer.
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

module codix_berkelium_ca_riscv_dm_dbg_progbuf_t(
    input  logic CLK,
    input  logic RST,
    input  logic [1:0] codasip_i1_if_cpu_fetch_progbuf_RA,
    input  logic codasip_i1_if_cpu_fetch_progbuf_RE,
    input  logic [1:0] dbg_A,
    input  logic dbg_CS,
    input  logic [31:0] dbg_D,
    input  logic dbg_WE,
    output logic [31:0] codasip_i1_if_cpu_fetch_progbuf_Q,
    output logic [31:0] dbg_Q
);
    // type, wire and constant declarations:
    // signal/wire
    logic [31:0] dbg_RDATA;
    // signal/wire
    logic [3:0] dbg_progbuf_we_onehot;

    // additional declarations:
    logic progbuf0_reg_WE;
    logic [31:0] progbuf0_reg_D;
    logic [31:0] progbuf0_reg_Q;
    logic progbuf1_reg_WE;
    logic [31:0] progbuf1_reg_D;
    logic [31:0] progbuf1_reg_Q;
    logic progbuf2_reg_WE;
    logic [31:0] progbuf2_reg_D;
    logic [31:0] progbuf2_reg_Q;
    logic progbuf3_reg_WE;
    logic [31:0] progbuf3_reg_D;
    logic [31:0] progbuf3_reg_Q;
    logic codix_berkelium_i1_if_cpu_fetch_RA_reg_WE;
    logic [1:0] codix_berkelium_i1_if_cpu_fetch_RA_reg_D;
    logic [1:0] codix_berkelium_i1_if_cpu_fetch_RA_reg_Q;

    // child instances inside RISC-V Debug - Program Buffer:
    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) progbuf0_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(progbuf0_reg_WE),
        .D(progbuf0_reg_D),
        .Q(progbuf0_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) progbuf1_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(progbuf1_reg_WE),
        .D(progbuf1_reg_D),
        .Q(progbuf1_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) progbuf2_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(progbuf2_reg_WE),
        .D(progbuf2_reg_D),
        .Q(progbuf2_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) progbuf3_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(progbuf3_reg_WE),
        .D(progbuf3_reg_D),
        .Q(progbuf3_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) codix_berkelium_i1_if_cpu_fetch_RA_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(codix_berkelium_i1_if_cpu_fetch_RA_reg_WE),
        .D(codix_berkelium_i1_if_cpu_fetch_RA_reg_D),
        .Q(codix_berkelium_i1_if_cpu_fetch_RA_reg_Q)
    );

    // data-path code:
    always_comb begin
        unique case ( dbg_A )
            2'h0: dbg_RDATA = progbuf0_reg_Q;
            2'h1: dbg_RDATA = progbuf1_reg_Q;
            2'h2: dbg_RDATA = progbuf2_reg_Q;
            2'h3: dbg_RDATA = progbuf3_reg_Q;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: dbg_RDATA = 32'hx;
            // pragma translate_on
        endcase
    end
    assign dbg_progbuf_we_onehot = ({3'h0, dbg_WE} << dbg_A);
    assign progbuf0_reg_D = dbg_D;
    assign progbuf0_reg_WE = dbg_progbuf_we_onehot[0];
    assign progbuf1_reg_D = dbg_D;
    assign progbuf1_reg_WE = dbg_progbuf_we_onehot[1];
    assign progbuf2_reg_D = dbg_D;
    assign progbuf2_reg_WE = dbg_progbuf_we_onehot[2];
    assign progbuf3_reg_D = dbg_D;
    assign progbuf3_reg_WE = dbg_progbuf_we_onehot[3];
    assign codix_berkelium_i1_if_cpu_fetch_RA_reg_D = codasip_i1_if_cpu_fetch_progbuf_RA;
    assign codix_berkelium_i1_if_cpu_fetch_RA_reg_WE = codasip_i1_if_cpu_fetch_progbuf_RE;
    assign dbg_Q = (dbg_CS == 1'b1) ? dbg_RDATA : 32'h00000000;
    always_comb begin
        unique case ( codix_berkelium_i1_if_cpu_fetch_RA_reg_Q )
            2'h0: codasip_i1_if_cpu_fetch_progbuf_Q = progbuf0_reg_Q;
            2'h1: codasip_i1_if_cpu_fetch_progbuf_Q = progbuf1_reg_Q;
            2'h2: codasip_i1_if_cpu_fetch_progbuf_Q = progbuf2_reg_Q;
            2'h3: codasip_i1_if_cpu_fetch_progbuf_Q = progbuf3_reg_Q;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: codasip_i1_if_cpu_fetch_progbuf_Q = 32'hx;
            // pragma translate_on
        endcase
    end
endmodule: codix_berkelium_ca_riscv_dm_dbg_progbuf_t
