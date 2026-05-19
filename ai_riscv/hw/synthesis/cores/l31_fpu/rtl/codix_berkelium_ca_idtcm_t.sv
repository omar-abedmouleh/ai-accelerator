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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_idtcm_t' Codasip Tightly Coupled Memory.
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

module codix_berkelium_ca_idtcm_t #(
    parameter [31:0] itcm_baddr_p = 32'h02000000,
    parameter [31:0] itcm_size_p = 32'h00004000,
    parameter [31:0] dtcm_baddr_p = 32'h03000000,
    parameter [31:0] dtcm_size_p = 32'h00004000
) (
    input  logic CLK,
    input  logic RST,
    input  logic [31:0] idtcm_dtcm_mem_sram_if_slave_RDATA,
    input  logic [31:0] idtcm_itcm_mem_sram_if_slave_RDATA,
    input  logic [31:0] if_dtcm_ldst_HADDR,
    input  logic [2:0] if_dtcm_ldst_HBURST,
    input  logic if_dtcm_ldst_HMASTLOCK,
    input  logic [3:0] if_dtcm_ldst_HPROT,
    input  logic [2:0] if_dtcm_ldst_HSIZE,
    input  logic [1:0] if_dtcm_ldst_HTRANS,
    input  logic [31:0] if_dtcm_ldst_HWDATA,
    input  logic if_dtcm_ldst_HWRITE,
    input  logic [31:0] if_itcm_fetch_HADDR,
    input  logic [2:0] if_itcm_fetch_HBURST,
    input  logic if_itcm_fetch_HMASTLOCK,
    input  logic [3:0] if_itcm_fetch_HPROT,
    input  logic [2:0] if_itcm_fetch_HSIZE,
    input  logic [1:0] if_itcm_fetch_HTRANS,
    input  logic if_itcm_fetch_HWRITE,
    input  logic [31:0] if_itcm_ldst_HADDR,
    input  logic [2:0] if_itcm_ldst_HBURST,
    input  logic if_itcm_ldst_HMASTLOCK,
    input  logic [3:0] if_itcm_ldst_HPROT,
    input  logic [2:0] if_itcm_ldst_HSIZE,
    input  logic [1:0] if_itcm_ldst_HTRANS,
    input  logic [31:0] if_itcm_ldst_HWDATA,
    input  logic if_itcm_ldst_HWRITE,
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
    output logic [($clog2(dtcm_size_p / 32'd4))-1:0] idtcm_dtcm_mem_sram_if_slave_A,
    output logic idtcm_dtcm_mem_sram_if_slave_CS,
    output logic idtcm_dtcm_mem_sram_if_slave_RW,
    output logic [31:0] idtcm_dtcm_mem_sram_if_slave_WDATA,
    output logic [3:0] idtcm_dtcm_mem_sram_if_slave_WSTRB,
    output logic [($clog2(itcm_size_p / 32'd4))-1:0] idtcm_itcm_mem_sram_if_slave_A,
    output logic idtcm_itcm_mem_sram_if_slave_CS,
    output logic idtcm_itcm_mem_sram_if_slave_RW,
    output logic [31:0] idtcm_itcm_mem_sram_if_slave_WDATA,
    output logic [3:0] idtcm_itcm_mem_sram_if_slave_WSTRB,
    output logic [31:0] if_dtcm_ldst_HRDATA,
    output logic if_dtcm_ldst_HREADY,
    output logic if_dtcm_ldst_HRESP,
    output logic [31:0] if_itcm_fetch_HRDATA,
    output logic if_itcm_fetch_HREADY,
    output logic if_itcm_fetch_HRESP,
    output logic [31:0] if_itcm_ldst_HRDATA,
    output logic if_itcm_ldst_HREADY,
    output logic if_itcm_ldst_HRESP,
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
    logic [31:0] dtcm_arbiter_if_slave_HRDATA;
    logic dtcm_arbiter_if_slave_HREADYOUT;
    logic dtcm_arbiter_if_slave_HRESP;
    logic [1:0] splitter_if_slave_HTRANS;
    logic [31:0] itcm_arbiter_if_slave_HRDATA;
    logic itcm_arbiter_if_slave_HREADYOUT;
    logic itcm_arbiter_if_slave_HRESP;
    logic [31:0] splitter_dtcm_if_slave_HADDR;
    logic [2:0] splitter_dtcm_if_slave_HBURST;
    logic splitter_dtcm_if_slave_HMASTLOCK;
    logic [3:0] splitter_dtcm_if_slave_HPROT;
    logic splitter_dtcm_if_slave_HREADY;
    logic splitter_dtcm_if_slave_HSEL;
    logic [2:0] splitter_dtcm_if_slave_HSIZE;
    logic [1:0] splitter_dtcm_if_slave_HTRANS;
    logic [31:0] splitter_dtcm_if_slave_HWDATA;
    logic splitter_dtcm_if_slave_HWRITE;
    logic [31:0] splitter_itcm_if_slave_HADDR;
    logic [2:0] splitter_itcm_if_slave_HBURST;
    logic splitter_itcm_if_slave_HMASTLOCK;
    logic [3:0] splitter_itcm_if_slave_HPROT;
    logic splitter_itcm_if_slave_HREADY;
    logic splitter_itcm_if_slave_HSEL;
    logic [2:0] splitter_itcm_if_slave_HSIZE;
    logic [1:0] splitter_itcm_if_slave_HTRANS;
    logic [31:0] splitter_itcm_if_slave_HWDATA;
    logic splitter_itcm_if_slave_HWRITE;
    logic [31:0] itcm_arbiter_codasip_if_master_HADDR;
    logic [2:0] itcm_arbiter_codasip_if_master_HBURST;
    logic itcm_arbiter_codasip_if_master_HMASTLOCK;
    logic [3:0] itcm_arbiter_codasip_if_master_HPROT;
    logic itcm_mem_if_slave_HREADYOUT;
    logic [2:0] itcm_arbiter_codasip_if_master_HSIZE;
    logic [1:0] itcm_arbiter_codasip_if_master_HTRANS;
    logic [31:0] itcm_arbiter_codasip_if_master_HWDATA;
    logic itcm_arbiter_codasip_if_master_HWRITE;
    logic [31:0] itcm_mem_if_slave_HRDATA;
    logic itcm_mem_if_slave_HRESP;
    logic [31:0] dtcm_arbiter_codasip_if_master_HADDR;
    logic [2:0] dtcm_arbiter_codasip_if_master_HBURST;
    logic dtcm_arbiter_codasip_if_master_HMASTLOCK;
    logic [3:0] dtcm_arbiter_codasip_if_master_HPROT;
    logic dtcm_mem_if_slave_HREADYOUT;
    logic [2:0] dtcm_arbiter_codasip_if_master_HSIZE;
    logic [1:0] dtcm_arbiter_codasip_if_master_HTRANS;
    logic [31:0] dtcm_arbiter_codasip_if_master_HWDATA;
    logic dtcm_arbiter_codasip_if_master_HWRITE;
    logic [31:0] dtcm_mem_if_slave_HRDATA;
    logic dtcm_mem_if_slave_HRESP;

    // child instances inside Codasip Tightly Coupled Memory:
    // Codasip bus instance:
    codix_berkelium_ca_idtcm_splitter_t #(
        .ITCM_IF_SLAVE_BASE(itcm_baddr_p),
        .ITCM_IF_SLAVE_ADDR_BITS($clog2(itcm_size_p)),
        .DTCM_IF_SLAVE_BASE(dtcm_baddr_p),
        .DTCM_IF_SLAVE_ADDR_BITS($clog2(dtcm_size_p))
    ) splitter (
        .CLK(CLK),
        .RST(RST),
        .dtcm_if_slave_HRDATA(dtcm_arbiter_if_slave_HRDATA),
        .dtcm_if_slave_HREADYOUT(dtcm_arbiter_if_slave_HREADYOUT),
        .dtcm_if_slave_HRESP(dtcm_arbiter_if_slave_HRESP),
        .if_slave_HADDR(if_slave_HADDR),
        .if_slave_HBURST(if_slave_HBURST),
        .if_slave_HMASTLOCK(if_slave_HMASTLOCK),
        .if_slave_HPROT(if_slave_HPROT),
        .if_slave_HSIZE(if_slave_HSIZE),
        .if_slave_HTRANS(splitter_if_slave_HTRANS),
        .if_slave_HWDATA(if_slave_HWDATA),
        .if_slave_HWRITE(if_slave_HWRITE),
        .itcm_if_slave_HRDATA(itcm_arbiter_if_slave_HRDATA),
        .itcm_if_slave_HREADYOUT(itcm_arbiter_if_slave_HREADYOUT),
        .itcm_if_slave_HRESP(itcm_arbiter_if_slave_HRESP),
        .dtcm_if_slave_HADDR(splitter_dtcm_if_slave_HADDR),
        .dtcm_if_slave_HBURST(splitter_dtcm_if_slave_HBURST),
        .dtcm_if_slave_HMASTLOCK(splitter_dtcm_if_slave_HMASTLOCK),
        .dtcm_if_slave_HPROT(splitter_dtcm_if_slave_HPROT),
        .dtcm_if_slave_HREADY(splitter_dtcm_if_slave_HREADY),
        .dtcm_if_slave_HSEL(splitter_dtcm_if_slave_HSEL),
        .dtcm_if_slave_HSIZE(splitter_dtcm_if_slave_HSIZE),
        .dtcm_if_slave_HTRANS(splitter_dtcm_if_slave_HTRANS),
        .dtcm_if_slave_HWDATA(splitter_dtcm_if_slave_HWDATA),
        .dtcm_if_slave_HWRITE(splitter_dtcm_if_slave_HWRITE),
        .if_slave_HRDATA(if_slave_HRDATA),
        .if_slave_HREADY(if_slave_HREADYOUT),
        .if_slave_HRESP(if_slave_HRESP),
        .itcm_if_slave_HADDR(splitter_itcm_if_slave_HADDR),
        .itcm_if_slave_HBURST(splitter_itcm_if_slave_HBURST),
        .itcm_if_slave_HMASTLOCK(splitter_itcm_if_slave_HMASTLOCK),
        .itcm_if_slave_HPROT(splitter_itcm_if_slave_HPROT),
        .itcm_if_slave_HREADY(splitter_itcm_if_slave_HREADY),
        .itcm_if_slave_HSEL(splitter_itcm_if_slave_HSEL),
        .itcm_if_slave_HSIZE(splitter_itcm_if_slave_HSIZE),
        .itcm_if_slave_HTRANS(splitter_itcm_if_slave_HTRANS),
        .itcm_if_slave_HWDATA(splitter_itcm_if_slave_HWDATA),
        .itcm_if_slave_HWRITE(splitter_itcm_if_slave_HWRITE)
    );

    // Codasip memory instance:
    codix_berkelium_ca_idtcm_itcm_mem_t #(
        .SIZE(itcm_size_p)
    ) itcm_mem (
        .CLK(CLK),
        .RST(RST),
        .idtcm_itcm_mem_sram_if_slave_RDATA(idtcm_itcm_mem_sram_if_slave_RDATA),
        .if_slave_HADDR(itcm_arbiter_codasip_if_master_HADDR),
        .if_slave_HBURST(itcm_arbiter_codasip_if_master_HBURST),
        .if_slave_HMASTLOCK(itcm_arbiter_codasip_if_master_HMASTLOCK),
        .if_slave_HPROT(itcm_arbiter_codasip_if_master_HPROT),
        .if_slave_HREADY(itcm_mem_if_slave_HREADYOUT),
        .if_slave_HSEL(1'b1),
        .if_slave_HSIZE(itcm_arbiter_codasip_if_master_HSIZE),
        .if_slave_HTRANS(itcm_arbiter_codasip_if_master_HTRANS),
        .if_slave_HWDATA(itcm_arbiter_codasip_if_master_HWDATA),
        .if_slave_HWRITE(itcm_arbiter_codasip_if_master_HWRITE),
        .idtcm_itcm_mem_sram_if_slave_A(idtcm_itcm_mem_sram_if_slave_A),
        .idtcm_itcm_mem_sram_if_slave_CS(idtcm_itcm_mem_sram_if_slave_CS),
        .idtcm_itcm_mem_sram_if_slave_RW(idtcm_itcm_mem_sram_if_slave_RW),
        .idtcm_itcm_mem_sram_if_slave_WDATA(idtcm_itcm_mem_sram_if_slave_WDATA),
        .idtcm_itcm_mem_sram_if_slave_WSTRB(idtcm_itcm_mem_sram_if_slave_WSTRB),
        .if_slave_HRDATA(itcm_mem_if_slave_HRDATA),
        .if_slave_HREADYOUT(itcm_mem_if_slave_HREADYOUT),
        .if_slave_HRESP(itcm_mem_if_slave_HRESP)
    );

    // Codasip interface arbiter instance:
    codix_berkelium_ca_idtcm_itcm_arbiter_t itcm_arbiter (
        .CLK(CLK),
        .RST(RST),
        .codasip_if_master_HRDATA(itcm_mem_if_slave_HRDATA),
        .codasip_if_master_HREADY(itcm_mem_if_slave_HREADYOUT),
        .codasip_if_master_HRESP(itcm_mem_if_slave_HRESP),
        .if_itcm_fetch_HADDR(if_itcm_fetch_HADDR),
        .if_itcm_fetch_HBURST(if_itcm_fetch_HBURST),
        .if_itcm_fetch_HMASTLOCK(if_itcm_fetch_HMASTLOCK),
        .if_itcm_fetch_HPROT(if_itcm_fetch_HPROT),
        .if_itcm_fetch_HSIZE(if_itcm_fetch_HSIZE),
        .if_itcm_fetch_HTRANS(if_itcm_fetch_HTRANS),
        .if_itcm_fetch_HWRITE(if_itcm_fetch_HWRITE),
        .if_itcm_ldst_HADDR(if_itcm_ldst_HADDR),
        .if_itcm_ldst_HBURST(if_itcm_ldst_HBURST),
        .if_itcm_ldst_HMASTLOCK(if_itcm_ldst_HMASTLOCK),
        .if_itcm_ldst_HPROT(if_itcm_ldst_HPROT),
        .if_itcm_ldst_HSIZE(if_itcm_ldst_HSIZE),
        .if_itcm_ldst_HTRANS(if_itcm_ldst_HTRANS),
        .if_itcm_ldst_HWDATA(if_itcm_ldst_HWDATA),
        .if_itcm_ldst_HWRITE(if_itcm_ldst_HWRITE),
        .if_slave_HADDR(splitter_itcm_if_slave_HADDR),
        .if_slave_HBURST(splitter_itcm_if_slave_HBURST),
        .if_slave_HMASTLOCK(splitter_itcm_if_slave_HMASTLOCK),
        .if_slave_HPROT(splitter_itcm_if_slave_HPROT),
        .if_slave_HREADY(splitter_itcm_if_slave_HREADY),
        .if_slave_HSEL(splitter_itcm_if_slave_HSEL),
        .if_slave_HSIZE(splitter_itcm_if_slave_HSIZE),
        .if_slave_HTRANS(splitter_itcm_if_slave_HTRANS),
        .if_slave_HWDATA(splitter_itcm_if_slave_HWDATA),
        .if_slave_HWRITE(splitter_itcm_if_slave_HWRITE),
        .codasip_if_master_HADDR(itcm_arbiter_codasip_if_master_HADDR),
        .codasip_if_master_HBURST(itcm_arbiter_codasip_if_master_HBURST),
        .codasip_if_master_HMASTLOCK(itcm_arbiter_codasip_if_master_HMASTLOCK),
        .codasip_if_master_HPROT(itcm_arbiter_codasip_if_master_HPROT),
        .codasip_if_master_HSIZE(itcm_arbiter_codasip_if_master_HSIZE),
        .codasip_if_master_HTRANS(itcm_arbiter_codasip_if_master_HTRANS),
        .codasip_if_master_HWDATA(itcm_arbiter_codasip_if_master_HWDATA),
        .codasip_if_master_HWRITE(itcm_arbiter_codasip_if_master_HWRITE),
        .if_itcm_fetch_HRDATA(if_itcm_fetch_HRDATA),
        .if_itcm_fetch_HREADY(if_itcm_fetch_HREADY),
        .if_itcm_fetch_HRESP(if_itcm_fetch_HRESP),
        .if_itcm_ldst_HRDATA(if_itcm_ldst_HRDATA),
        .if_itcm_ldst_HREADY(if_itcm_ldst_HREADY),
        .if_itcm_ldst_HRESP(if_itcm_ldst_HRESP),
        .if_slave_HRDATA(itcm_arbiter_if_slave_HRDATA),
        .if_slave_HREADYOUT(itcm_arbiter_if_slave_HREADYOUT),
        .if_slave_HRESP(itcm_arbiter_if_slave_HRESP)
    );

    // Codasip memory instance:
    codix_berkelium_ca_idtcm_dtcm_mem_t #(
        .SIZE(dtcm_size_p)
    ) dtcm_mem (
        .CLK(CLK),
        .RST(RST),
        .idtcm_dtcm_mem_sram_if_slave_RDATA(idtcm_dtcm_mem_sram_if_slave_RDATA),
        .if_slave_HADDR(dtcm_arbiter_codasip_if_master_HADDR),
        .if_slave_HBURST(dtcm_arbiter_codasip_if_master_HBURST),
        .if_slave_HMASTLOCK(dtcm_arbiter_codasip_if_master_HMASTLOCK),
        .if_slave_HPROT(dtcm_arbiter_codasip_if_master_HPROT),
        .if_slave_HREADY(dtcm_mem_if_slave_HREADYOUT),
        .if_slave_HSEL(1'b1),
        .if_slave_HSIZE(dtcm_arbiter_codasip_if_master_HSIZE),
        .if_slave_HTRANS(dtcm_arbiter_codasip_if_master_HTRANS),
        .if_slave_HWDATA(dtcm_arbiter_codasip_if_master_HWDATA),
        .if_slave_HWRITE(dtcm_arbiter_codasip_if_master_HWRITE),
        .idtcm_dtcm_mem_sram_if_slave_A(idtcm_dtcm_mem_sram_if_slave_A),
        .idtcm_dtcm_mem_sram_if_slave_CS(idtcm_dtcm_mem_sram_if_slave_CS),
        .idtcm_dtcm_mem_sram_if_slave_RW(idtcm_dtcm_mem_sram_if_slave_RW),
        .idtcm_dtcm_mem_sram_if_slave_WDATA(idtcm_dtcm_mem_sram_if_slave_WDATA),
        .idtcm_dtcm_mem_sram_if_slave_WSTRB(idtcm_dtcm_mem_sram_if_slave_WSTRB),
        .if_slave_HRDATA(dtcm_mem_if_slave_HRDATA),
        .if_slave_HREADYOUT(dtcm_mem_if_slave_HREADYOUT),
        .if_slave_HRESP(dtcm_mem_if_slave_HRESP)
    );

    // Codasip interface arbiter instance:
    codix_berkelium_ca_idtcm_dtcm_arbiter_t dtcm_arbiter (
        .CLK(CLK),
        .RST(RST),
        .codasip_if_master_HRDATA(dtcm_mem_if_slave_HRDATA),
        .codasip_if_master_HREADY(dtcm_mem_if_slave_HREADYOUT),
        .codasip_if_master_HRESP(dtcm_mem_if_slave_HRESP),
        .if_dtcm_ldst_HADDR(if_dtcm_ldst_HADDR),
        .if_dtcm_ldst_HBURST(if_dtcm_ldst_HBURST),
        .if_dtcm_ldst_HMASTLOCK(if_dtcm_ldst_HMASTLOCK),
        .if_dtcm_ldst_HPROT(if_dtcm_ldst_HPROT),
        .if_dtcm_ldst_HSIZE(if_dtcm_ldst_HSIZE),
        .if_dtcm_ldst_HTRANS(if_dtcm_ldst_HTRANS),
        .if_dtcm_ldst_HWDATA(if_dtcm_ldst_HWDATA),
        .if_dtcm_ldst_HWRITE(if_dtcm_ldst_HWRITE),
        .if_slave_HADDR(splitter_dtcm_if_slave_HADDR),
        .if_slave_HBURST(splitter_dtcm_if_slave_HBURST),
        .if_slave_HMASTLOCK(splitter_dtcm_if_slave_HMASTLOCK),
        .if_slave_HPROT(splitter_dtcm_if_slave_HPROT),
        .if_slave_HREADY(splitter_dtcm_if_slave_HREADY),
        .if_slave_HSEL(splitter_dtcm_if_slave_HSEL),
        .if_slave_HSIZE(splitter_dtcm_if_slave_HSIZE),
        .if_slave_HTRANS(splitter_dtcm_if_slave_HTRANS),
        .if_slave_HWDATA(splitter_dtcm_if_slave_HWDATA),
        .if_slave_HWRITE(splitter_dtcm_if_slave_HWRITE),
        .codasip_if_master_HADDR(dtcm_arbiter_codasip_if_master_HADDR),
        .codasip_if_master_HBURST(dtcm_arbiter_codasip_if_master_HBURST),
        .codasip_if_master_HMASTLOCK(dtcm_arbiter_codasip_if_master_HMASTLOCK),
        .codasip_if_master_HPROT(dtcm_arbiter_codasip_if_master_HPROT),
        .codasip_if_master_HSIZE(dtcm_arbiter_codasip_if_master_HSIZE),
        .codasip_if_master_HTRANS(dtcm_arbiter_codasip_if_master_HTRANS),
        .codasip_if_master_HWDATA(dtcm_arbiter_codasip_if_master_HWDATA),
        .codasip_if_master_HWRITE(dtcm_arbiter_codasip_if_master_HWRITE),
        .if_dtcm_ldst_HRDATA(if_dtcm_ldst_HRDATA),
        .if_dtcm_ldst_HREADY(if_dtcm_ldst_HREADY),
        .if_dtcm_ldst_HRESP(if_dtcm_ldst_HRESP),
        .if_slave_HRDATA(dtcm_arbiter_if_slave_HRDATA),
        .if_slave_HREADYOUT(dtcm_arbiter_if_slave_HREADYOUT),
        .if_slave_HRESP(dtcm_arbiter_if_slave_HRESP)
    );

    // data-path code:
    assign splitter_if_slave_HTRANS = ((if_slave_HREADY == CP_AHB_READY) && (if_slave_HSEL == 1'b1)) ? if_slave_HTRANS : CP_AHB_IDLE;
endmodule: codix_berkelium_ca_idtcm_t
