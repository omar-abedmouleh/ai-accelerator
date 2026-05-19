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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_idtcm_itcm_mem_t' Codasip memory.
*
 *           size in words: 4096 (0x1000)
 *           size in bytes: 16384 (0x4000, 16 KB)
 *           memory address width: 32 bits
 *           word width: 32 bits
 *           least addressable unit: 8 bits
 *           read latency: {1}
 *           write latency: {1}
 *           endianness: little
 *           sub-blocks: yes
 *           number of sub-blocks: 4
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

module codix_berkelium_ca_idtcm_itcm_mem_t #(
    parameter [31:0] SIZE = 32'h00004000
) (
    input  logic CLK,
    input  logic RST,
    input  logic [31:0] idtcm_itcm_mem_sram_if_slave_RDATA,
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
    output logic [($clog2(SIZE / 32'd4))-1:0] idtcm_itcm_mem_sram_if_slave_A,
    output logic idtcm_itcm_mem_sram_if_slave_CS,
    output logic idtcm_itcm_mem_sram_if_slave_RW,
    output logic [31:0] idtcm_itcm_mem_sram_if_slave_WDATA,
    output logic [3:0] idtcm_itcm_mem_sram_if_slave_WSTRB,
    output logic [31:0] if_slave_HRDATA,
    output logic if_slave_HREADYOUT,
    output logic if_slave_HRESP
);
    // child instances inside Codasip memory:
    // CodAL interface instance:
    codix_berkelium_ca_idtcm_itcm_mem_if_slave_t #(
        .SIZE(SIZE),
        .ADDR_BITS($clog2(SIZE / 32'd4))
    ) if_slave (
        .CLK(CLK),
        .RST(RST),
        .if_slave_HADDR(if_slave_HADDR),
        .if_slave_HSIZE(if_slave_HSIZE),
        .if_slave_HTRANS(if_slave_HTRANS),
        .if_slave_HWRITE(if_slave_HWRITE),
        .if_slave_HSEL(if_slave_HSEL),
        .if_slave_HREADY(if_slave_HREADY),
        .if_slave_HWDATA(if_slave_HWDATA),
        .idtcm_itcm_mem_sram_if_slave_RDATA(idtcm_itcm_mem_sram_if_slave_RDATA),
        .if_slave_HREADYOUT(if_slave_HREADYOUT),
        .if_slave_HRESP(if_slave_HRESP),
        .if_slave_HRDATA(if_slave_HRDATA),
        .idtcm_itcm_mem_sram_if_slave_CS(idtcm_itcm_mem_sram_if_slave_CS),
        .idtcm_itcm_mem_sram_if_slave_RW(idtcm_itcm_mem_sram_if_slave_RW),
        .idtcm_itcm_mem_sram_if_slave_WSTRB(idtcm_itcm_mem_sram_if_slave_WSTRB),
        .idtcm_itcm_mem_sram_if_slave_WDATA(idtcm_itcm_mem_sram_if_slave_WDATA),
        .idtcm_itcm_mem_sram_if_slave_A(idtcm_itcm_mem_sram_if_slave_A)
    );

endmodule: codix_berkelium_ca_idtcm_itcm_mem_t
