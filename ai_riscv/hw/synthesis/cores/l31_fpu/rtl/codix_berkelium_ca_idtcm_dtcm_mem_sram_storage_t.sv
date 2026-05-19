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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_idtcm_dtcm_mem_sram_storage_t' Codasip memory data storage.
 *           size: 4096
 *           address width: 12 bits
 *           data width: 32 bits
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

module codix_berkelium_ca_idtcm_dtcm_mem_sram_storage_t #(
    parameter [31:0] SIZE = 32'h00000100,
    parameter integer ADDR_BITS = 32'sh00000008
) (
    input  logic CLK,
    input  logic [(ADDR_BITS)-1:0] if_slave_A,
    input  logic if_slave_CS,
    input  logic [31:0] if_slave_WDATA,
    input  logic [3:0] if_slave_WE,
    output logic [31:0] if_slave_RDATA
);
    // memory storage
    logic [31:0] RAM[0:SIZE-1];

    localparam integer DATA_BITS = 32'sh00000020;
    localparam integer WSTRB_BITS = 32'sh00000004;
    localparam integer BYTE_BITS = DATA_BITS / WSTRB_BITS;

    always @( posedge CLK ) begin: WRITE_PROC
        integer ii;
        if ( if_slave_CS == 1'b1 ) begin
            for ( ii = 32'sd0; ii < WSTRB_BITS; ii = ii + 32'sd1 ) begin
                if ( if_slave_WE[ii] == 1'b1 ) begin
                    RAM[if_slave_A][(ii*BYTE_BITS)+:BYTE_BITS] <= if_slave_WDATA[(ii*BYTE_BITS)+:BYTE_BITS];
                end
            end
        end
    end

    always_ff @( posedge CLK ) begin
        if_slave_RDATA <= 32'hx;
        if ( if_slave_CS == 1'b1 ) begin
            if ( if_slave_WE == 4'h0 ) begin
                if_slave_RDATA <= RAM[if_slave_A];
            end
        end
    end

    initial begin: INIT_PROC
        integer ii;
        for ( ii = 32'sd0; ii < SIZE; ii = ii + 32'sd1 ) begin
            RAM[ii] = 32'h00000000;
        end
    end
endmodule: codix_berkelium_ca_idtcm_dtcm_mem_sram_storage_t
