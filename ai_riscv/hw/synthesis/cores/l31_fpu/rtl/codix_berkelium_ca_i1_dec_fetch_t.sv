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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_i1_dec_fetch_t' Codasip bus.
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

module codix_berkelium_ca_i1_dec_fetch_t #(
    parameter [31:0] IF_ITCM_FETCH_BASE = 32'h02000000,
    parameter integer IF_ITCM_FETCH_ADDR_BITS = 32'sh0000000e
) (
    input  logic CLK,
    input  logic RST,
    input  logic [31:0] if_cpu_fetch_HADDR,
    input  logic [2:0] if_cpu_fetch_HBURST,
    input  logic if_cpu_fetch_HMASTLOCK,
    input  logic [3:0] if_cpu_fetch_HPROT,
    input  logic [2:0] if_cpu_fetch_HSIZE,
    input  logic [1:0] if_cpu_fetch_HTRANS,
    input  logic if_cpu_fetch_HWRITE,
    input  logic [31:0] if_fetch_HRDATA,
    input  logic if_fetch_HREADY,
    input  logic if_fetch_HRESP,
    input  logic [31:0] if_itcm_fetch_HRDATA,
    input  logic if_itcm_fetch_HREADY,
    input  logic if_itcm_fetch_HRESP,
    input  logic p_itcm_en,
    output logic [31:0] if_cpu_fetch_HRDATA,
    output logic if_cpu_fetch_HREADY,
    output logic if_cpu_fetch_HRESP,
    output logic [31:0] if_fetch_HADDR,
    output logic [2:0] if_fetch_HBURST,
    output logic if_fetch_HMASTLOCK,
    output logic [3:0] if_fetch_HPROT,
    output logic [2:0] if_fetch_HSIZE,
    output logic [1:0] if_fetch_HTRANS,
    output logic if_fetch_HWRITE,
    output logic [31:0] if_itcm_fetch_HADDR,
    output logic [2:0] if_itcm_fetch_HBURST,
    output logic if_itcm_fetch_HMASTLOCK,
    output logic [3:0] if_itcm_fetch_HPROT,
    output logic [2:0] if_itcm_fetch_HSIZE,
    output logic [1:0] if_itcm_fetch_HTRANS,
    output logic if_itcm_fetch_HWRITE
);
    // type, wire and constant declarations:
    // signal/wire
    logic codasip_slave_addr_match_0_wire;
    // signal/wire
    logic codasip_slave_select_0_wire;
    // signal/wire
    logic codasip_slave_select_1_wire;
    // signal/wire
    logic [1:0] codasip_slave_select_wire;
    // signal/wire
    logic codasip_slave_HREADYOUT_wire;

    // additional declarations:
    logic codasip_slave_select_reg_WE;
    logic [1:0] codasip_slave_select_reg_D;
    logic [1:0] codasip_slave_select_reg_Q;

    // child instances inside Codasip bus:
    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h2),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) codasip_slave_select_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(codasip_slave_select_reg_WE),
        .D(codasip_slave_select_reg_D),
        .Q(codasip_slave_select_reg_Q)
    );

    // data-path code:
    assign codasip_slave_addr_match_0_wire = (if_cpu_fetch_HADDR[32'h0000001f:IF_ITCM_FETCH_ADDR_BITS] == IF_ITCM_FETCH_BASE[32'h0000001f:IF_ITCM_FETCH_ADDR_BITS]);
    assign codasip_slave_select_0_wire = (codasip_slave_addr_match_0_wire & p_itcm_en);
    assign codasip_slave_select_1_wire = (~codasip_slave_select_0_wire);
    assign codasip_slave_select_wire = {codasip_slave_select_1_wire, codasip_slave_select_0_wire};
    always_comb begin
        unique case ( codasip_slave_select_reg_Q )
            2'h1: codasip_slave_HREADYOUT_wire = if_itcm_fetch_HREADY;
            2'h2: codasip_slave_HREADYOUT_wire = if_fetch_HREADY;
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: codasip_slave_HREADYOUT_wire = 1'bx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    assign codasip_slave_select_reg_D = codasip_slave_select_wire;
    assign codasip_slave_select_reg_WE = codasip_slave_HREADYOUT_wire;
    assign if_itcm_fetch_HBURST = if_cpu_fetch_HBURST;
    assign if_itcm_fetch_HMASTLOCK = if_cpu_fetch_HMASTLOCK;
    assign if_itcm_fetch_HPROT = if_cpu_fetch_HPROT;
    assign if_itcm_fetch_HSIZE = if_cpu_fetch_HSIZE;
    assign if_itcm_fetch_HWRITE = if_cpu_fetch_HWRITE;
    assign if_itcm_fetch_HADDR = if_cpu_fetch_HADDR;
    assign if_itcm_fetch_HTRANS = (if_cpu_fetch_HTRANS & {32'd2{(codasip_slave_select_0_wire & (codasip_slave_HREADYOUT_wire | codasip_slave_select_reg_Q[0]))}});
    assign if_fetch_HBURST = if_cpu_fetch_HBURST;
    assign if_fetch_HMASTLOCK = if_cpu_fetch_HMASTLOCK;
    assign if_fetch_HPROT = if_cpu_fetch_HPROT;
    assign if_fetch_HSIZE = if_cpu_fetch_HSIZE;
    assign if_fetch_HWRITE = if_cpu_fetch_HWRITE;
    assign if_fetch_HADDR = if_cpu_fetch_HADDR;
    assign if_fetch_HTRANS = (if_cpu_fetch_HTRANS & {32'd2{(codasip_slave_select_1_wire & (codasip_slave_HREADYOUT_wire | codasip_slave_select_reg_Q[1]))}});
    assign if_cpu_fetch_HREADY = codasip_slave_HREADYOUT_wire;
    always_comb begin
        unique case ( codasip_slave_select_reg_Q )
            2'h1: if_cpu_fetch_HRESP = if_itcm_fetch_HRESP;
            2'h2: if_cpu_fetch_HRESP = if_fetch_HRESP;
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: if_cpu_fetch_HRESP = 1'bx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    always_comb begin
        unique case ( codasip_slave_select_reg_Q )
            2'h1: if_cpu_fetch_HRDATA = if_itcm_fetch_HRDATA;
            2'h2: if_cpu_fetch_HRDATA = if_fetch_HRDATA;
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: if_cpu_fetch_HRDATA = 32'hx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
endmodule: codix_berkelium_ca_i1_dec_fetch_t
