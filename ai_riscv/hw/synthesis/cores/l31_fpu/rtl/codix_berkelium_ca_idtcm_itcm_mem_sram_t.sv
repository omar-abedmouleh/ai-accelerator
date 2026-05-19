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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_idtcm_itcm_mem_sram_t' Codasip SRAM logic.
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

module codix_berkelium_ca_idtcm_itcm_mem_sram_t #(
    parameter [31:0] SIZE = 32'h00001000,
    parameter integer ADDR_BITS = 32'sh0000000c
) (
    input  logic CLK,
    input  logic [(ADDR_BITS)-1:0] if_slave_A,
    input  logic if_slave_CS,
    input  logic if_slave_RW,
    input  logic [31:0] if_slave_WDATA,
    input  logic [3:0] if_slave_WSTRB,
    output logic [31:0] if_slave_RDATA
);
    // additional declarations:
    logic [(ADDR_BITS)-1:0] storage_if_slave_A;
    logic storage_if_slave_CS;
    logic [31:0] storage_if_slave_WDATA;
    logic [3:0] storage_if_slave_WE;
    logic [31:0] storage_if_slave_RDATA;

    // child instances inside Codasip SRAM logic:
    // Codasip memory data storage instance:
    codix_berkelium_ca_idtcm_itcm_mem_sram_storage_t #(
        .SIZE(SIZE),
        .ADDR_BITS(ADDR_BITS)
    ) storage (
        .CLK(CLK),
        .if_slave_A(storage_if_slave_A),
        .if_slave_CS(storage_if_slave_CS),
        .if_slave_WDATA(storage_if_slave_WDATA),
        .if_slave_WE(storage_if_slave_WE),
        .if_slave_RDATA(storage_if_slave_RDATA)
    );

    // data-path code:
    assign storage_if_slave_A = if_slave_A;
    assign storage_if_slave_CS = ((if_slave_CS == 1'b1) && ((if_slave_RW == 1'b0) || (if_slave_WSTRB != 4'h0)));
    assign storage_if_slave_WE = (if_slave_RW == 1'b1) ? if_slave_WSTRB : 4'h0;
    assign storage_if_slave_WDATA = if_slave_WDATA;
    assign if_slave_RDATA = storage_if_slave_RDATA;
endmodule: codix_berkelium_ca_idtcm_itcm_mem_sram_t
