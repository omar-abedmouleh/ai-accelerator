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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_idtcm_splitter_t' Codasip bus.
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

module codix_berkelium_ca_idtcm_splitter_t #(
    parameter [31:0] ITCM_IF_SLAVE_BASE = 32'h02000000,
    parameter integer ITCM_IF_SLAVE_ADDR_BITS = 32'sh0000000e,
    parameter [31:0] DTCM_IF_SLAVE_BASE = 32'h03000000,
    parameter integer DTCM_IF_SLAVE_ADDR_BITS = 32'sh0000000e
) (
    input  logic CLK,
    input  logic RST,
    input  logic [31:0] dtcm_if_slave_HRDATA,
    input  logic dtcm_if_slave_HREADYOUT,
    input  logic dtcm_if_slave_HRESP,
    input  logic [31:0] if_slave_HADDR,
    input  logic [2:0] if_slave_HBURST,
    input  logic if_slave_HMASTLOCK,
    input  logic [3:0] if_slave_HPROT,
    input  logic [2:0] if_slave_HSIZE,
    input  logic [1:0] if_slave_HTRANS,
    input  logic [31:0] if_slave_HWDATA,
    input  logic if_slave_HWRITE,
    input  logic [31:0] itcm_if_slave_HRDATA,
    input  logic itcm_if_slave_HREADYOUT,
    input  logic itcm_if_slave_HRESP,
    output logic [31:0] dtcm_if_slave_HADDR,
    output logic [2:0] dtcm_if_slave_HBURST,
    output logic dtcm_if_slave_HMASTLOCK,
    output logic [3:0] dtcm_if_slave_HPROT,
    output logic dtcm_if_slave_HREADY,
    output logic dtcm_if_slave_HSEL,
    output logic [2:0] dtcm_if_slave_HSIZE,
    output logic [1:0] dtcm_if_slave_HTRANS,
    output logic [31:0] dtcm_if_slave_HWDATA,
    output logic dtcm_if_slave_HWRITE,
    output logic [31:0] if_slave_HRDATA,
    output logic if_slave_HREADY,
    output logic if_slave_HRESP,
    output logic [31:0] itcm_if_slave_HADDR,
    output logic [2:0] itcm_if_slave_HBURST,
    output logic itcm_if_slave_HMASTLOCK,
    output logic [3:0] itcm_if_slave_HPROT,
    output logic itcm_if_slave_HREADY,
    output logic itcm_if_slave_HSEL,
    output logic [2:0] itcm_if_slave_HSIZE,
    output logic [1:0] itcm_if_slave_HTRANS,
    output logic [31:0] itcm_if_slave_HWDATA,
    output logic itcm_if_slave_HWRITE
);
    // type, wire and constant declarations:
    // signal/wire
    logic codasip_slave_addr_match_0_wire;
    // signal/wire
    logic codasip_slave_select_0_wire;
    // signal/wire
    logic codasip_slave_addr_match_1_wire;
    // signal/wire
    logic codasip_slave_select_1_wire;
    // signal/wire
    logic codasip_slave_select_default_wire;
    // signal/wire
    logic [2:0] codasip_slave_select_wire;
    // signal/wire
    logic codasip_slave_HREADYOUT_wire;
    // signal/wire
    logic if_slave_is_oor_wire;
    // AMBA AHB single transfer or the first transfer of a burst
    localparam logic [1:0] CP_AHB_NONSEQ = 2'h2;
    // AMBA AHB burst transfer
    localparam logic [1:0] CP_AHB_SEQ = 2'h3;
    // AMBA AHB waited transfer
    localparam logic CP_AHB_WAIT = 1'h0;
    // AMBA AHB previous transfer is complete
    localparam logic CP_AHB_READY = 1'h1;
    // AMBA AHB success
    localparam logic CP_AHB_OKAY = 1'h0;
    // AMBA AHB error
    localparam logic CP_AHB_ERROR = 1'h1;

    // additional declarations:
    logic codasip_slave_select_reg_WE;
    logic [2:0] codasip_slave_select_reg_D;
    logic [2:0] codasip_slave_select_reg_Q;
    logic codasip_default_slave_HREADYOUT_reg_D;
    logic codasip_default_slave_HREADYOUT_reg_Q;
    logic codasip_default_slave_HRESP_reg_WE;
    logic codasip_default_slave_HRESP_reg_D;
    logic codasip_default_slave_HRESP_reg_Q;

    // child instances inside Codasip bus:
    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h4),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) codasip_slave_select_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(codasip_slave_select_reg_WE),
        .D(codasip_slave_select_reg_D),
        .Q(codasip_slave_select_reg_Q)
    );

    // register instance:
    d_ff_rst_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b1),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) codasip_default_slave_HREADYOUT_reg (
        .CLK(CLK),
        .RST(RST),
        .D(codasip_default_slave_HREADYOUT_reg_D),
        .Q(codasip_default_slave_HREADYOUT_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) codasip_default_slave_HRESP_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(codasip_default_slave_HRESP_reg_WE),
        .D(codasip_default_slave_HRESP_reg_D),
        .Q(codasip_default_slave_HRESP_reg_Q)
    );

    // data-path code:
    assign codasip_slave_addr_match_0_wire = (if_slave_HADDR[32'h0000001f:ITCM_IF_SLAVE_ADDR_BITS] == ITCM_IF_SLAVE_BASE[32'h0000001f:ITCM_IF_SLAVE_ADDR_BITS]);
    assign codasip_slave_addr_match_1_wire = (if_slave_HADDR[32'h0000001f:DTCM_IF_SLAVE_ADDR_BITS] == DTCM_IF_SLAVE_BASE[32'h0000001f:DTCM_IF_SLAVE_ADDR_BITS]);
    assign codasip_slave_select_0_wire = codasip_slave_addr_match_0_wire;
    assign codasip_slave_select_1_wire = codasip_slave_addr_match_1_wire;
    assign codasip_slave_select_default_wire = (~(codasip_slave_select_1_wire | codasip_slave_select_0_wire));
    assign codasip_slave_select_wire = {codasip_slave_select_default_wire, codasip_slave_select_1_wire, codasip_slave_select_0_wire};
    always_comb begin
        unique case ( codasip_slave_select_reg_Q )
            3'h1: codasip_slave_HREADYOUT_wire = itcm_if_slave_HREADYOUT;
            3'h2: codasip_slave_HREADYOUT_wire = dtcm_if_slave_HREADYOUT;
            3'h4: codasip_slave_HREADYOUT_wire = codasip_default_slave_HREADYOUT_reg_Q;
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: codasip_slave_HREADYOUT_wire = 1'bx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    assign if_slave_is_oor_wire = ((codasip_slave_select_default_wire == 1'b1) && ((if_slave_HTRANS == CP_AHB_SEQ) || (if_slave_HTRANS == CP_AHB_NONSEQ)));
    assign codasip_slave_select_reg_D = codasip_slave_select_wire;
    assign codasip_slave_select_reg_WE = codasip_slave_HREADYOUT_wire;
    assign codasip_default_slave_HREADYOUT_reg_D = ((codasip_slave_select_reg_Q[2] == 1'b1) && (codasip_default_slave_HREADYOUT_reg_Q == CP_AHB_WAIT)) ? CP_AHB_READY :
        (if_slave_is_oor_wire == 1'b1) ? CP_AHB_WAIT : CP_AHB_READY;
    assign codasip_default_slave_HRESP_reg_D = (if_slave_is_oor_wire == 1'b1) ? CP_AHB_ERROR : CP_AHB_OKAY;
    assign codasip_default_slave_HRESP_reg_WE = codasip_slave_HREADYOUT_wire;
    assign itcm_if_slave_HBURST = if_slave_HBURST;
    assign itcm_if_slave_HMASTLOCK = if_slave_HMASTLOCK;
    assign itcm_if_slave_HPROT = if_slave_HPROT;
    assign itcm_if_slave_HSIZE = if_slave_HSIZE;
    assign itcm_if_slave_HWRITE = if_slave_HWRITE;
    assign itcm_if_slave_HADDR = 32'(if_slave_HADDR[(ITCM_IF_SLAVE_ADDR_BITS - 32'h00000001):32'h00000000]);
    assign itcm_if_slave_HTRANS = if_slave_HTRANS;
    assign itcm_if_slave_HSEL = codasip_slave_select_0_wire;
    assign itcm_if_slave_HREADY = codasip_slave_HREADYOUT_wire;
    assign itcm_if_slave_HWDATA = if_slave_HWDATA;
    assign dtcm_if_slave_HBURST = if_slave_HBURST;
    assign dtcm_if_slave_HMASTLOCK = if_slave_HMASTLOCK;
    assign dtcm_if_slave_HPROT = if_slave_HPROT;
    assign dtcm_if_slave_HSIZE = if_slave_HSIZE;
    assign dtcm_if_slave_HWRITE = if_slave_HWRITE;
    assign dtcm_if_slave_HADDR = 32'(if_slave_HADDR[(DTCM_IF_SLAVE_ADDR_BITS - 32'h00000001):32'h00000000]);
    assign dtcm_if_slave_HTRANS = if_slave_HTRANS;
    assign dtcm_if_slave_HSEL = codasip_slave_select_1_wire;
    assign dtcm_if_slave_HREADY = codasip_slave_HREADYOUT_wire;
    assign dtcm_if_slave_HWDATA = if_slave_HWDATA;
    assign if_slave_HREADY = codasip_slave_HREADYOUT_wire;
    always_comb begin
        unique case ( codasip_slave_select_reg_Q )
            3'h1: if_slave_HRESP = itcm_if_slave_HRESP;
            3'h2: if_slave_HRESP = dtcm_if_slave_HRESP;
            3'h4: if_slave_HRESP = codasip_default_slave_HRESP_reg_Q;
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: if_slave_HRESP = 1'bx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    always_comb begin
        unique case ( codasip_slave_select_reg_Q )
            3'h1: if_slave_HRDATA = itcm_if_slave_HRDATA;
            3'h2: if_slave_HRDATA = dtcm_if_slave_HRDATA;
            3'h4: if_slave_HRDATA = 32'h00000000;
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: if_slave_HRDATA = 32'hx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
endmodule: codix_berkelium_ca_idtcm_splitter_t
