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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_riscv_dm_dmi_sync_t' RISC-V Debug - Clock domain crossing synchronization.
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

module codix_berkelium_ca_riscv_dm_dmi_sync_t(
    input  logic CLK,
    input  logic TCK,
    input  logic RST,
    input  logic TRST,
    input  logic [31:0] data_from_clk_CLK,
    input  logic data_from_clk_READY_CLK,
    input  logic data_from_tck_READY_TCK,
    input  logic [39:0] data_from_tck_TCK,
    output logic data_from_clk_DONE_TCK,
    output logic [31:0] data_from_clk_TCK,
    output logic [39:0] data_from_tck_CLK,
    output logic data_from_tck_DONE_CLK
);
    // additional declarations:
    logic data_from_clk_status_reg_WE;
    logic data_from_clk_status_reg_D;
    logic data_from_clk_status_reg_Q;
    logic data_from_clk_READY_TCK_sync_reg_D;
    logic data_from_clk_READY_TCK_sync_reg_Q;
    logic data_from_clk_DONE_TCK_sync_reg_D;
    logic data_from_clk_DONE_TCK_sync_reg_Q;
    logic data_from_clk_CLK_sync_reg_WE;
    logic [31:0] data_from_clk_CLK_sync_reg_D;
    logic [31:0] data_from_clk_CLK_sync_reg_Q;
    logic data_from_clk_TCK_sync_reg_WE;
    logic [31:0] data_from_clk_TCK_sync_reg_D;
    logic [31:0] data_from_clk_TCK_sync_reg_Q;
    logic data_from_tck_READY_CLK_sync_reg_D;
    logic data_from_tck_READY_CLK_sync_reg_Q;
    logic data_from_tck_DONE_CLK_sync_reg_D;
    logic data_from_tck_DONE_CLK_sync_reg_Q;
    logic data_from_tck_CLK_sync_reg_WE;
    logic [39:0] data_from_tck_CLK_sync_reg_D;
    logic [39:0] data_from_tck_CLK_sync_reg_Q;

    // child instances inside RISC-V Debug - Clock domain crossing synchronization:
    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) data_from_clk_status_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(data_from_clk_status_reg_WE),
        .D(data_from_clk_status_reg_D),
        .Q(data_from_clk_status_reg_Q)
    );

    // register instance:
    shift_reg_edge_rst_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0),
        .CODASIP_POSEDGE_TYPE(1'b0)
    ) data_from_clk_READY_TCK_sync_reg (
        .CLK(TCK),
        .RST(TRST),
        .D(data_from_clk_READY_TCK_sync_reg_D),
        .Q(data_from_clk_READY_TCK_sync_reg_Q)
    );

    // register instance:
    d_ff_rst_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) data_from_clk_DONE_TCK_sync_reg (
        .CLK(TCK),
        .RST(TRST),
        .D(data_from_clk_DONE_TCK_sync_reg_D),
        .Q(data_from_clk_DONE_TCK_sync_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) data_from_clk_CLK_sync_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(data_from_clk_CLK_sync_reg_WE),
        .D(data_from_clk_CLK_sync_reg_D),
        .Q(data_from_clk_CLK_sync_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) data_from_clk_TCK_sync_reg (
        .CLK(TCK),
        .RST(TRST),
        .WE(data_from_clk_TCK_sync_reg_WE),
        .D(data_from_clk_TCK_sync_reg_D),
        .Q(data_from_clk_TCK_sync_reg_Q)
    );

    // register instance:
    shift_reg_edge_rst_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0),
        .CODASIP_POSEDGE_TYPE(1'b1)
    ) data_from_tck_READY_CLK_sync_reg (
        .CLK(CLK),
        .RST(RST),
        .D(data_from_tck_READY_CLK_sync_reg_D),
        .Q(data_from_tck_READY_CLK_sync_reg_Q)
    );

    // register instance:
    d_ff_rst_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) data_from_tck_DONE_CLK_sync_reg (
        .CLK(CLK),
        .RST(RST),
        .D(data_from_tck_DONE_CLK_sync_reg_D),
        .Q(data_from_tck_DONE_CLK_sync_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd40),
        .DEFAULT_VALUE(40'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) data_from_tck_CLK_sync_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(data_from_tck_CLK_sync_reg_WE),
        .D(data_from_tck_CLK_sync_reg_D),
        .Q(data_from_tck_CLK_sync_reg_Q)
    );

    // data-path code:
    assign data_from_clk_status_reg_D = (~data_from_clk_status_reg_Q);
    assign data_from_clk_status_reg_WE = data_from_clk_READY_CLK;
    assign data_from_clk_READY_TCK_sync_reg_D = data_from_clk_status_reg_Q;
    assign data_from_clk_DONE_TCK_sync_reg_D = data_from_clk_READY_TCK_sync_reg_Q;
    assign data_from_clk_CLK_sync_reg_D = data_from_clk_CLK;
    assign data_from_clk_CLK_sync_reg_WE = data_from_clk_READY_CLK;
    assign data_from_clk_TCK_sync_reg_D = data_from_clk_CLK_sync_reg_Q;
    assign data_from_clk_TCK_sync_reg_WE = data_from_clk_READY_TCK_sync_reg_Q;
    assign data_from_tck_READY_CLK_sync_reg_D = data_from_tck_READY_TCK;
    assign data_from_tck_DONE_CLK_sync_reg_D = data_from_tck_READY_CLK_sync_reg_Q;
    assign data_from_tck_CLK_sync_reg_D = data_from_tck_TCK;
    assign data_from_tck_CLK_sync_reg_WE = data_from_tck_READY_CLK_sync_reg_Q;
    assign data_from_clk_DONE_TCK = data_from_clk_DONE_TCK_sync_reg_Q;
    assign data_from_clk_TCK = data_from_clk_TCK_sync_reg_Q;
    assign data_from_tck_DONE_CLK = data_from_tck_DONE_CLK_sync_reg_Q;
    assign data_from_tck_CLK = data_from_tck_CLK_sync_reg_Q;
endmodule: codix_berkelium_ca_riscv_dm_dmi_sync_t
