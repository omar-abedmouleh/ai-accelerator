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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_idtcm_dtcm_arbiter_t' Codasip interface arbiter.
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

module codix_berkelium_ca_idtcm_dtcm_arbiter_t(
    input  logic CLK,
    input  logic RST,
    input  logic [31:0] codasip_if_master_HRDATA,
    input  logic codasip_if_master_HREADY,
    input  logic codasip_if_master_HRESP,
    input  logic [31:0] if_dtcm_ldst_HADDR,
    input  logic [2:0] if_dtcm_ldst_HBURST,
    input  logic if_dtcm_ldst_HMASTLOCK,
    input  logic [3:0] if_dtcm_ldst_HPROT,
    input  logic [2:0] if_dtcm_ldst_HSIZE,
    input  logic [1:0] if_dtcm_ldst_HTRANS,
    input  logic [31:0] if_dtcm_ldst_HWDATA,
    input  logic if_dtcm_ldst_HWRITE,
    input  logic [31:0] if_slave_HADDR,
    input  logic [2:0] if_slave_HBURST,
    input  logic if_slave_HMASTLOCK,
    input  logic [3:0] if_slave_HPROT,
    input  logic if_slave_HREADY,
    input  logic if_slave_HSEL,
    input  logic [2:0] if_slave_HSIZE,
    input  logic [1:0] if_slave_HTRANS,
    input  logic [31:0] if_slave_HWDATA,
    input  logic if_slave_HWRITE,
    output logic [31:0] codasip_if_master_HADDR,
    output logic [2:0] codasip_if_master_HBURST,
    output logic codasip_if_master_HMASTLOCK,
    output logic [3:0] codasip_if_master_HPROT,
    output logic [2:0] codasip_if_master_HSIZE,
    output logic [1:0] codasip_if_master_HTRANS,
    output logic [31:0] codasip_if_master_HWDATA,
    output logic codasip_if_master_HWRITE,
    output logic [31:0] if_dtcm_ldst_HRDATA,
    output logic if_dtcm_ldst_HREADY,
    output logic if_dtcm_ldst_HRESP,
    output logic [31:0] if_slave_HRDATA,
    output logic if_slave_HREADYOUT,
    output logic if_slave_HRESP
);
    // type, wire and constant declarations:
    // AMBA AHB no data transfer
    localparam logic [1:0] CP_AHB_IDLE = 2'h0;
    // AMBA AHB previous transfer is complete
    localparam logic CP_AHB_READY = 1'h1;

    // additional declarations:
    logic [31:0] arb0_if_src_hi_HADDR;
    logic [31:0] arb0_if_src_lo_HADDR;
    logic [1:0] arb0_if_src_lo_HTRANS;

    // child instances inside Codasip interface arbiter:
    // Arbiter between two AMBA 3 AHB-Lite master interfaces instance:
    codasip_arbiter_ahb3_lite_t #(
        .ADDR_BITS(32'sd32),
        .DATA_BITS(32'sd32)
    ) arb0 (
        .CLK(CLK),
        .RST(RST),
        .if_dst_HRDATA(codasip_if_master_HRDATA),
        .if_dst_HREADY(codasip_if_master_HREADY),
        .if_dst_HRESP(codasip_if_master_HRESP),
        .if_src_hi_HADDR(arb0_if_src_hi_HADDR),
        .if_src_hi_HBURST(if_dtcm_ldst_HBURST),
        .if_src_hi_HMASTLOCK(if_dtcm_ldst_HMASTLOCK),
        .if_src_hi_HPROT(if_dtcm_ldst_HPROT),
        .if_src_hi_HSIZE(if_dtcm_ldst_HSIZE),
        .if_src_hi_HTRANS(if_dtcm_ldst_HTRANS),
        .if_src_hi_HWDATA(if_dtcm_ldst_HWDATA),
        .if_src_hi_HWRITE(if_dtcm_ldst_HWRITE),
        .if_src_lo_HADDR(arb0_if_src_lo_HADDR),
        .if_src_lo_HBURST(if_slave_HBURST),
        .if_src_lo_HMASTLOCK(if_slave_HMASTLOCK),
        .if_src_lo_HPROT(if_slave_HPROT),
        .if_src_lo_HSIZE(if_slave_HSIZE),
        .if_src_lo_HTRANS(arb0_if_src_lo_HTRANS),
        .if_src_lo_HWDATA(if_slave_HWDATA),
        .if_src_lo_HWRITE(if_slave_HWRITE),
        .if_dst_HADDR(codasip_if_master_HADDR),
        .if_dst_HBURST(codasip_if_master_HBURST),
        .if_dst_HMASTLOCK(codasip_if_master_HMASTLOCK),
        .if_dst_HPROT(codasip_if_master_HPROT),
        .if_dst_HSIZE(codasip_if_master_HSIZE),
        .if_dst_HTRANS(codasip_if_master_HTRANS),
        .if_dst_HWDATA(codasip_if_master_HWDATA),
        .if_dst_HWRITE(codasip_if_master_HWRITE),
        .if_src_hi_HRDATA(if_dtcm_ldst_HRDATA),
        .if_src_hi_HREADY(if_dtcm_ldst_HREADY),
        .if_src_hi_HRESP(if_dtcm_ldst_HRESP),
        .if_src_lo_HRDATA(if_slave_HRDATA),
        .if_src_lo_HREADY(if_slave_HREADYOUT),
        .if_src_lo_HRESP(if_slave_HRESP)
    );

    // data-path code:
    assign arb0_if_src_hi_HADDR = if_dtcm_ldst_HADDR;
    assign arb0_if_src_lo_HTRANS = ((if_slave_HREADY == CP_AHB_READY) && (if_slave_HSEL == 1'b1)) ? if_slave_HTRANS : CP_AHB_IDLE;
    assign arb0_if_src_lo_HADDR = if_slave_HADDR;
endmodule: codix_berkelium_ca_idtcm_dtcm_arbiter_t
