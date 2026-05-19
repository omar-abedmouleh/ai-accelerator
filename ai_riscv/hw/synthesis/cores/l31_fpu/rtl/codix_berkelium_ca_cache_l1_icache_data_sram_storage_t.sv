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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_cache_l1_icache_data_sram_storage_t' Codasip memory data storage.
 *           size: 256
 *           address width: 8 bits
 *           data width: 512 bits
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

module codix_berkelium_ca_cache_l1_icache_data_sram_storage_t #(
    parameter [31:0] SIZE = 32'h00000100,
    parameter integer ADDR_BITS = 32'sh00000008,
    parameter integer DATA_BITS = 32'sh00000020,
    parameter integer WSTRB_BITS = 32'sh00000004
) (
    input  logic CLK,
    input  logic [(ADDR_BITS)-1:0] A,
    input  logic CS,
    input  logic [(DATA_BITS)-1:0] WDATA,
    input  logic [(WSTRB_BITS)-1:0] WE,
    output logic [(DATA_BITS)-1:0] RDATA
);
    // memory storage
    logic[DATA_BITS-1:0] RAM[0:SIZE-1];

    localparam integer BYTE_BITS = DATA_BITS / WSTRB_BITS;

    always @( posedge CLK ) begin: WRITE_PROC
        integer ii;
        if ( CS == 1'b1 ) begin
            for ( ii = 32'sd0; ii < WSTRB_BITS; ii = ii + 32'sd1 ) begin
                if ( WE[ii] == 1'b1 ) begin
                    RAM[A][(ii*BYTE_BITS)+:BYTE_BITS] <= WDATA[(ii*BYTE_BITS)+:BYTE_BITS];
                end
            end
        end
    end

    always_ff @( posedge CLK ) begin
        RDATA <= {DATA_BITS{1'bx}};
        if ( CS == 1'b1 ) begin
            if ( WE == {WSTRB_BITS{1'b0}} ) begin
                RDATA <= RAM[A];
            end
        end
    end
endmodule: codix_berkelium_ca_cache_l1_icache_data_sram_storage_t
