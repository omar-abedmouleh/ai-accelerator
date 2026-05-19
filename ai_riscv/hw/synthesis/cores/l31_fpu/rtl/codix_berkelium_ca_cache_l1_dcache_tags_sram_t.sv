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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_cache_l1_dcache_tags_sram_t' Codasip SRAM logic.
 *           size: 256
 *           address width: 8 bits
 *           data width: 40 bits
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

module codix_berkelium_ca_cache_l1_dcache_tags_sram_t #(
    parameter [31:0] SIZE = 32'h00000100,
    parameter integer ADDR_BITS = 32'sh00000008,
    parameter integer DATA_BITS = 32'sh00000020,
    parameter integer BANK_DATA_BITS = 32'sh00000020,
    parameter integer WSTRB_BITS = 32'sh00000004
) (
    input  logic CLK,
    input  logic [(ADDR_BITS)-1:0] A,
    input  logic CS,
    input  logic RW,
    input  logic [(DATA_BITS)-1:0] WDATA,
    input  logic [(WSTRB_BITS)-1:0] WSTRB,
    output logic [(DATA_BITS)-1:0] RDATA
);
    // additional declarations:
    logic [(ADDR_BITS)-1:0] storage_A;
    logic storage_CS;
    logic [(DATA_BITS)-1:0] storage_WDATA;
    logic [(WSTRB_BITS)-1:0] storage_WE;
    logic [(DATA_BITS)-1:0] storage_RDATA;

    // child instances inside Codasip SRAM logic:
    localparam integer BANK_COUNT = DATA_BITS / BANK_DATA_BITS;
    localparam integer BANK_WSTRB_BITS = WSTRB_BITS / BANK_COUNT;
    genvar ii;
    // split wide SRAM storage to multiple banks to simplify/speedup synthesis
    generate
        for ( ii = 32'sd0; ii < BANK_COUNT; ii = ii + 32'sd1 ) begin : BANK
            // Codasip memory data storage instance:
            codix_berkelium_ca_cache_l1_dcache_tags_sram_storage_t #(
                .SIZE(SIZE),
                .ADDR_BITS(ADDR_BITS),
                .DATA_BITS(BANK_DATA_BITS),
                .WSTRB_BITS(BANK_WSTRB_BITS)
            ) storage (
                .CLK(CLK),
                .A(storage_A),
                .CS(storage_CS),
                .WDATA(storage_WDATA[(ii*BANK_DATA_BITS)+:BANK_DATA_BITS]),
                .WE(storage_WE[(ii*BANK_WSTRB_BITS)+:BANK_WSTRB_BITS]),
                .RDATA(storage_RDATA[(ii*BANK_DATA_BITS)+:BANK_DATA_BITS])
            );

        end
    endgenerate

    // data-path code:
    assign storage_A = A;
    assign storage_CS = ((CS == 1'b1) && ((RW == 1'b0) || (WSTRB != {WSTRB_BITS{1'b0}})));
    assign storage_WE = (RW == 1'b1) ? WSTRB : {WSTRB_BITS{1'b0}};
    assign storage_WDATA = WDATA;
    assign RDATA = storage_RDATA;
endmodule: codix_berkelium_ca_cache_l1_dcache_tags_sram_t
