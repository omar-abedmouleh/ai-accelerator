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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_i1_t' Codasip interconnect.
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

module codix_berkelium_ca_i1_t #(
    parameter [31:0] itcm_baddr_p = 32'h02000000,
    parameter [31:0] itcm_size_p = 32'h00004000,
    parameter [31:0] dtcm_baddr_p = 32'h03000000,
    parameter [31:0] dtcm_size_p = 32'h00004000
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
    input  logic [31:0] if_fetch_HRDATA,
    input  logic if_fetch_HREADY,
    input  logic if_fetch_HRESP,
    input  logic [31:0] if_itcm_fetch_HRDATA,
    input  logic if_itcm_fetch_HREADY,
    input  logic if_itcm_fetch_HRESP,
    input  logic [31:0] if_itcm_ldst_HRDATA,
    input  logic if_itcm_ldst_HREADY,
    input  logic if_itcm_ldst_HRESP,
    input  logic [31:0] if_ldst_HRDATA,
    input  logic if_ldst_HREADY,
    input  logic if_ldst_HRESP,
    input  logic p_dtcm_en,
    input  logic p_itcm_en,
    output logic [31:0] if_cpu_fetch_HRDATA,
    output logic if_cpu_fetch_HREADY,
    output logic if_cpu_fetch_HRESP,
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
    output logic if_itcm_fetch_HWRITE,
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
    // child instances inside Codasip interconnect:
    // Codasip bus instance:
    codix_berkelium_ca_i1_dec_fetch_t #(
        .IF_ITCM_FETCH_BASE(itcm_baddr_p),
        .IF_ITCM_FETCH_ADDR_BITS($clog2(itcm_size_p))
    ) dec_fetch (
        .CLK(CLK),
        .RST(RST),
        .if_cpu_fetch_HADDR(if_cpu_fetch_HADDR),
        .if_cpu_fetch_HBURST(if_cpu_fetch_HBURST),
        .if_cpu_fetch_HMASTLOCK(if_cpu_fetch_HMASTLOCK),
        .if_cpu_fetch_HPROT(if_cpu_fetch_HPROT),
        .if_cpu_fetch_HSIZE(if_cpu_fetch_HSIZE),
        .if_cpu_fetch_HTRANS(if_cpu_fetch_HTRANS),
        .if_cpu_fetch_HWRITE(if_cpu_fetch_HWRITE),
        .if_fetch_HRDATA(if_fetch_HRDATA),
        .if_fetch_HREADY(if_fetch_HREADY),
        .if_fetch_HRESP(if_fetch_HRESP),
        .if_itcm_fetch_HRDATA(if_itcm_fetch_HRDATA),
        .if_itcm_fetch_HREADY(if_itcm_fetch_HREADY),
        .if_itcm_fetch_HRESP(if_itcm_fetch_HRESP),
        .p_itcm_en(p_itcm_en),
        .if_cpu_fetch_HRDATA(if_cpu_fetch_HRDATA),
        .if_cpu_fetch_HREADY(if_cpu_fetch_HREADY),
        .if_cpu_fetch_HRESP(if_cpu_fetch_HRESP),
        .if_fetch_HADDR(if_fetch_HADDR),
        .if_fetch_HBURST(if_fetch_HBURST),
        .if_fetch_HMASTLOCK(if_fetch_HMASTLOCK),
        .if_fetch_HPROT(if_fetch_HPROT),
        .if_fetch_HSIZE(if_fetch_HSIZE),
        .if_fetch_HTRANS(if_fetch_HTRANS),
        .if_fetch_HWRITE(if_fetch_HWRITE),
        .if_itcm_fetch_HADDR(if_itcm_fetch_HADDR),
        .if_itcm_fetch_HBURST(if_itcm_fetch_HBURST),
        .if_itcm_fetch_HMASTLOCK(if_itcm_fetch_HMASTLOCK),
        .if_itcm_fetch_HPROT(if_itcm_fetch_HPROT),
        .if_itcm_fetch_HSIZE(if_itcm_fetch_HSIZE),
        .if_itcm_fetch_HTRANS(if_itcm_fetch_HTRANS),
        .if_itcm_fetch_HWRITE(if_itcm_fetch_HWRITE)
    );

    // Codasip bus instance:
    codix_berkelium_ca_i1_dec_ldst_t #(
        .IF_ITCM_LDST_BASE(itcm_baddr_p),
        .IF_ITCM_LDST_ADDR_BITS($clog2(itcm_size_p)),
        .IF_DTCM_LDST_BASE(dtcm_baddr_p),
        .IF_DTCM_LDST_ADDR_BITS($clog2(dtcm_size_p))
    ) dec_ldst (
        .CLK(CLK),
        .RST(RST),
        .if_cpu_ldst_HADDR(if_cpu_ldst_HADDR),
        .if_cpu_ldst_HBURST(if_cpu_ldst_HBURST),
        .if_cpu_ldst_HMASTLOCK(if_cpu_ldst_HMASTLOCK),
        .if_cpu_ldst_HPROT(if_cpu_ldst_HPROT),
        .if_cpu_ldst_HSIZE(if_cpu_ldst_HSIZE),
        .if_cpu_ldst_HTRANS(if_cpu_ldst_HTRANS),
        .if_cpu_ldst_HWDATA(if_cpu_ldst_HWDATA),
        .if_cpu_ldst_HWRITE(if_cpu_ldst_HWRITE),
        .if_dtcm_ldst_HRDATA(if_dtcm_ldst_HRDATA),
        .if_dtcm_ldst_HREADY(if_dtcm_ldst_HREADY),
        .if_dtcm_ldst_HRESP(if_dtcm_ldst_HRESP),
        .if_itcm_ldst_HRDATA(if_itcm_ldst_HRDATA),
        .if_itcm_ldst_HREADY(if_itcm_ldst_HREADY),
        .if_itcm_ldst_HRESP(if_itcm_ldst_HRESP),
        .if_ldst_HRDATA(if_ldst_HRDATA),
        .if_ldst_HREADY(if_ldst_HREADY),
        .if_ldst_HRESP(if_ldst_HRESP),
        .p_dtcm_en(p_dtcm_en),
        .p_itcm_en(p_itcm_en),
        .if_cpu_ldst_HRDATA(if_cpu_ldst_HRDATA),
        .if_cpu_ldst_HREADY(if_cpu_ldst_HREADY),
        .if_cpu_ldst_HRESP(if_cpu_ldst_HRESP),
        .if_dtcm_ldst_HADDR(if_dtcm_ldst_HADDR),
        .if_dtcm_ldst_HBURST(if_dtcm_ldst_HBURST),
        .if_dtcm_ldst_HMASTLOCK(if_dtcm_ldst_HMASTLOCK),
        .if_dtcm_ldst_HPROT(if_dtcm_ldst_HPROT),
        .if_dtcm_ldst_HSIZE(if_dtcm_ldst_HSIZE),
        .if_dtcm_ldst_HTRANS(if_dtcm_ldst_HTRANS),
        .if_dtcm_ldst_HWDATA(if_dtcm_ldst_HWDATA),
        .if_dtcm_ldst_HWRITE(if_dtcm_ldst_HWRITE),
        .if_itcm_ldst_HADDR(if_itcm_ldst_HADDR),
        .if_itcm_ldst_HBURST(if_itcm_ldst_HBURST),
        .if_itcm_ldst_HMASTLOCK(if_itcm_ldst_HMASTLOCK),
        .if_itcm_ldst_HPROT(if_itcm_ldst_HPROT),
        .if_itcm_ldst_HSIZE(if_itcm_ldst_HSIZE),
        .if_itcm_ldst_HTRANS(if_itcm_ldst_HTRANS),
        .if_itcm_ldst_HWDATA(if_itcm_ldst_HWDATA),
        .if_itcm_ldst_HWRITE(if_itcm_ldst_HWRITE),
        .if_ldst_HADDR(if_ldst_HADDR),
        .if_ldst_HBURST(if_ldst_HBURST),
        .if_ldst_HMASTLOCK(if_ldst_HMASTLOCK),
        .if_ldst_HPROT(if_ldst_HPROT),
        .if_ldst_HSIZE(if_ldst_HSIZE),
        .if_ldst_HTRANS(if_ldst_HTRANS),
        .if_ldst_HWDATA(if_ldst_HWDATA),
        .if_ldst_HWRITE(if_ldst_HWRITE)
    );

endmodule: codix_berkelium_ca_i1_t
