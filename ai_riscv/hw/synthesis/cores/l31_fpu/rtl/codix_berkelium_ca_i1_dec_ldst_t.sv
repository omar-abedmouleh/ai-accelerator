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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_i1_dec_ldst_t' Codasip bus.
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

module codix_berkelium_ca_i1_dec_ldst_t #(
    parameter [31:0] IF_ITCM_LDST_BASE = 32'h02000000,
    parameter integer IF_ITCM_LDST_ADDR_BITS = 32'sh0000000e,
    parameter [31:0] IF_DTCM_LDST_BASE = 32'h03000000,
    parameter integer IF_DTCM_LDST_ADDR_BITS = 32'sh0000000e
) (
    input  logic CLK,
    input  logic RST,
    input  logic [31:0] if_cpu_ldst_HADDR,
    input  logic [2:0] if_cpu_ldst_HBURST,
    input  logic if_cpu_ldst_HMASTLOCK,
    input  logic [3:0] if_cpu_ldst_HPROT,
    input  logic [2:0] if_cpu_ldst_HSIZE,
    input  logic [1:0] if_cpu_ldst_HTRANS,
    input  logic [31:0] if_cpu_ldst_HWDATA,
    input  logic if_cpu_ldst_HWRITE,
    input  logic [31:0] if_dtcm_ldst_HRDATA,
    input  logic if_dtcm_ldst_HREADY,
    input  logic if_dtcm_ldst_HRESP,
    input  logic [31:0] if_itcm_ldst_HRDATA,
    input  logic if_itcm_ldst_HREADY,
    input  logic if_itcm_ldst_HRESP,
    input  logic [31:0] if_ldst_HRDATA,
    input  logic if_ldst_HREADY,
    input  logic if_ldst_HRESP,
    input  logic p_dtcm_en,
    input  logic p_itcm_en,
    output logic [31:0] if_cpu_ldst_HRDATA,
    output logic if_cpu_ldst_HREADY,
    output logic if_cpu_ldst_HRESP,
    output logic [31:0] if_dtcm_ldst_HADDR,
    output logic [2:0] if_dtcm_ldst_HBURST,
    output logic if_dtcm_ldst_HMASTLOCK,
    output logic [3:0] if_dtcm_ldst_HPROT,
    output logic [2:0] if_dtcm_ldst_HSIZE,
    output logic [1:0] if_dtcm_ldst_HTRANS,
    output logic [31:0] if_dtcm_ldst_HWDATA,
    output logic if_dtcm_ldst_HWRITE,
    output logic [31:0] if_itcm_ldst_HADDR,
    output logic [2:0] if_itcm_ldst_HBURST,
    output logic if_itcm_ldst_HMASTLOCK,
    output logic [3:0] if_itcm_ldst_HPROT,
    output logic [2:0] if_itcm_ldst_HSIZE,
    output logic [1:0] if_itcm_ldst_HTRANS,
    output logic [31:0] if_itcm_ldst_HWDATA,
    output logic if_itcm_ldst_HWRITE,
    output logic [31:0] if_ldst_HADDR,
    output logic [2:0] if_ldst_HBURST,
    output logic if_ldst_HMASTLOCK,
    output logic [3:0] if_ldst_HPROT,
    output logic [2:0] if_ldst_HSIZE,
    output logic [1:0] if_ldst_HTRANS,
    output logic [31:0] if_ldst_HWDATA,
    output logic if_ldst_HWRITE
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
    logic codasip_slave_select_2_wire;
    // signal/wire
    logic [2:0] codasip_slave_select_wire;
    // signal/wire
    logic codasip_slave_HREADYOUT_wire;

    // additional declarations:
    logic codasip_slave_select_reg_WE;
    logic [2:0] codasip_slave_select_reg_D;
    logic [2:0] codasip_slave_select_reg_Q;

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

    // data-path code:
    assign codasip_slave_addr_match_0_wire = (if_cpu_ldst_HADDR[32'h0000001f:IF_ITCM_LDST_ADDR_BITS] == IF_ITCM_LDST_BASE[32'h0000001f:IF_ITCM_LDST_ADDR_BITS]);
    assign codasip_slave_addr_match_1_wire = (if_cpu_ldst_HADDR[32'h0000001f:IF_DTCM_LDST_ADDR_BITS] == IF_DTCM_LDST_BASE[32'h0000001f:IF_DTCM_LDST_ADDR_BITS]);
    assign codasip_slave_select_0_wire = (codasip_slave_addr_match_0_wire & p_itcm_en);
    assign codasip_slave_select_1_wire = (codasip_slave_addr_match_1_wire & p_dtcm_en);
    assign codasip_slave_select_2_wire = (~(codasip_slave_select_1_wire | codasip_slave_select_0_wire));
    assign codasip_slave_select_wire = {codasip_slave_select_2_wire, codasip_slave_select_1_wire, codasip_slave_select_0_wire};
    always_comb begin
        unique case ( codasip_slave_select_reg_Q )
            3'h1: codasip_slave_HREADYOUT_wire = if_itcm_ldst_HREADY;
            3'h2: codasip_slave_HREADYOUT_wire = if_dtcm_ldst_HREADY;
            3'h4: codasip_slave_HREADYOUT_wire = if_ldst_HREADY;
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
    assign if_itcm_ldst_HBURST = if_cpu_ldst_HBURST;
    assign if_itcm_ldst_HMASTLOCK = if_cpu_ldst_HMASTLOCK;
    assign if_itcm_ldst_HPROT = if_cpu_ldst_HPROT;
    assign if_itcm_ldst_HSIZE = if_cpu_ldst_HSIZE;
    assign if_itcm_ldst_HWRITE = if_cpu_ldst_HWRITE;
    assign if_itcm_ldst_HADDR = if_cpu_ldst_HADDR;
    assign if_itcm_ldst_HTRANS = (if_cpu_ldst_HTRANS & {32'd2{(codasip_slave_select_0_wire & (codasip_slave_HREADYOUT_wire | codasip_slave_select_reg_Q[0]))}});
    assign if_itcm_ldst_HWDATA = if_cpu_ldst_HWDATA;
    assign if_dtcm_ldst_HBURST = if_cpu_ldst_HBURST;
    assign if_dtcm_ldst_HMASTLOCK = if_cpu_ldst_HMASTLOCK;
    assign if_dtcm_ldst_HPROT = if_cpu_ldst_HPROT;
    assign if_dtcm_ldst_HSIZE = if_cpu_ldst_HSIZE;
    assign if_dtcm_ldst_HWRITE = if_cpu_ldst_HWRITE;
    assign if_dtcm_ldst_HADDR = if_cpu_ldst_HADDR;
    assign if_dtcm_ldst_HTRANS = (if_cpu_ldst_HTRANS & {32'd2{(codasip_slave_select_1_wire & (codasip_slave_HREADYOUT_wire | codasip_slave_select_reg_Q[1]))}});
    assign if_dtcm_ldst_HWDATA = if_cpu_ldst_HWDATA;
    assign if_ldst_HBURST = if_cpu_ldst_HBURST;
    assign if_ldst_HMASTLOCK = if_cpu_ldst_HMASTLOCK;
    assign if_ldst_HPROT = if_cpu_ldst_HPROT;
    assign if_ldst_HSIZE = if_cpu_ldst_HSIZE;
    assign if_ldst_HWRITE = if_cpu_ldst_HWRITE;
    assign if_ldst_HADDR = if_cpu_ldst_HADDR;
    assign if_ldst_HTRANS = (if_cpu_ldst_HTRANS & {32'd2{(codasip_slave_select_2_wire & (codasip_slave_HREADYOUT_wire | codasip_slave_select_reg_Q[2]))}});
    assign if_ldst_HWDATA = if_cpu_ldst_HWDATA;
    assign if_cpu_ldst_HREADY = codasip_slave_HREADYOUT_wire;
    always_comb begin
        unique case ( codasip_slave_select_reg_Q )
            3'h1: if_cpu_ldst_HRESP = if_itcm_ldst_HRESP;
            3'h2: if_cpu_ldst_HRESP = if_dtcm_ldst_HRESP;
            3'h4: if_cpu_ldst_HRESP = if_ldst_HRESP;
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: if_cpu_ldst_HRESP = 1'bx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    always_comb begin
        unique case ( codasip_slave_select_reg_Q )
            3'h1: if_cpu_ldst_HRDATA = if_itcm_ldst_HRDATA;
            3'h2: if_cpu_ldst_HRDATA = if_dtcm_ldst_HRDATA;
            3'h4: if_cpu_ldst_HRDATA = if_ldst_HRDATA;
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: if_cpu_ldst_HRDATA = 32'hx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
endmodule: codix_berkelium_ca_i1_dec_ldst_t
