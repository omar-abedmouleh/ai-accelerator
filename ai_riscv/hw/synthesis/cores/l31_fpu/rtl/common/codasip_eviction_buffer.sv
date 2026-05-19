/**
 *  Codasip s.r.o.
 *
 *  CONFIDENTIAL
 *
 *  Copyright 2021 Codasip s.r.o.
 *
 *  All Rights Reserved.
 *
 *  NOTICE: All information contained in this file, is and shall remain the property of
 *  Codasip s.r.o. and its suppliers, if any.
 *
 *  The intellectual and technical concepts contained herein are confidential and proprietary to
 *  Codasip s.r.o. and are protected by trade secret and copyright law. In addition, elements of the
 *  technical concepts may be patent pending.
 *
 *  This file is part of the Codasip Studio product. No part of the Studio product, including this
 *  file, may be use, copied, modified, or distributed except in accordance with the terms contained
 *  in Codasip license agreement under which you obtained this file.
 *
 *  \file   codasip_eviction_buffer.v
 *  \author Jakub Drbal
 *  \email  support@codasip.com
 *  \date   Wed Sep 2 2015
 *  \brief  buffer for cache line witch will be evicted
 */

module codasip_eviction_buffer #(
    parameter integer RAM_DATA_BITS   = 32'sd64,
    parameter integer RAM_OFFSET_BITS = 32'sd2,
    parameter integer TAG_BITS        = 32'sd20,
    parameter integer INDEX_BITS      = 32'sd7,
    parameter integer CACHE_LINE_BITS = 32'sd256,
    parameter [0:0]   RESET_LEVEL     = 1'b0,
    parameter [0:0]   RESET_SYNC      = 1'b1
)(
    input wire CLK,
    input wire RST,
    //  data in
    input wire [CACHE_LINE_BITS-1:0] EB_DATAIN,
    input wire [TAG_BITS-1:0]        EB_TAGIN,
    input wire [INDEX_BITS-1:0]      EB_INDEXIN,
    input wire [3:0]                 EB_HPROTIN,
    input wire                       EB_HMASTLOCKIN,
    // data out
    output wire [RAM_DATA_BITS-1:0]  EB_RAMDATAOUT,
    output wire [TAG_BITS-1:0]       EB_RAMTAGOUT,
    output wire [INDEX_BITS-1:0]     EB_RAMINDEXOUT,
    output wire [3:0]                EB_RAMHPROTOUT,
    output wire                      EB_RAMHMASTLOCKOUT,
    input wire [RAM_OFFSET_BITS-1:0] EB_RAMOFFSETIN,
    // control
    input wire                       EB_WE,
    output wire                      EB_EMPTY,
    input wire                       EB_CLR
);

    localparam integer RAM_WORDS_PER_LINE = CACHE_LINE_BITS/RAM_DATA_BITS;

    wire [CACHE_LINE_BITS-1:0] eviction_buffer_data_Q;
    reg  [RAM_DATA_BITS-1:0]   eviction_buffer_dataout;
    wire [TAG_BITS-1:0]        eviction_buffer_tag_Q;
    wire [INDEX_BITS-1:0]      eviction_buffer_index_Q;
    wire [3:0]                 eviction_buffer_hprot_Q;
    wire                       eviction_buffer_hmastlock_Q;
    wire                       eviction_buffer_empty_WE;
    wire                       eviction_buffer_empty_D;
    wire                       eviction_buffer_empty_Q;

    // data register
    d_ff_rst_we_t #(
        .BIT_WIDTH(CACHE_LINE_BITS),
        .DEFAULT_VALUE({CACHE_LINE_BITS{1'b0}}),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) data_eb_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(EB_WE),
        .D(EB_DATAIN),
        .Q(eviction_buffer_data_Q)
    );

    // tag register
    d_ff_rst_we_t #(
        .BIT_WIDTH(TAG_BITS),
        .DEFAULT_VALUE({TAG_BITS{1'b0}}),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) tag_eb_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(EB_WE),
        .D(EB_TAGIN),
        .Q(eviction_buffer_tag_Q)
    );

    // index register
    d_ff_rst_we_t #(
        .BIT_WIDTH(INDEX_BITS),
        .DEFAULT_VALUE({INDEX_BITS{1'b0}}),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) index_eb_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(EB_WE),
        .D(EB_INDEXIN),
        .Q(eviction_buffer_index_Q)
    );

    // hprot register
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'd4),
        .DEFAULT_VALUE(4'h0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) hprot_eb_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(EB_WE),
        .D(EB_HPROTIN),
        .Q(eviction_buffer_hprot_Q)
    );

    // hmastlock register
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) hmastlock_eb_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(EB_WE),
        .D(EB_HMASTLOCKIN),
        .Q(eviction_buffer_hmastlock_Q)
    );

    // EB empty register
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'd1),
        .DEFAULT_VALUE(1'b1),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) empty_eb_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(eviction_buffer_empty_WE),
        .D(eviction_buffer_empty_D),
        .Q(eviction_buffer_empty_Q)
    );
    
    // EB empty
    assign eviction_buffer_empty_D = EB_CLR;
    assign eviction_buffer_empty_WE = EB_WE | EB_CLR;

    // data output mux
    always @(*)
    begin : data_out_mux
        integer i;
        eviction_buffer_dataout = {RAM_DATA_BITS{1'b0}};

        for (i=0; i<RAM_WORDS_PER_LINE; i=i+1) begin
            if (EB_RAMOFFSETIN == i[RAM_OFFSET_BITS-1:0]) begin
                eviction_buffer_dataout = eviction_buffer_data_Q[(i*RAM_DATA_BITS)+:RAM_DATA_BITS];
            end
        end
    end

    // output assignments
    assign EB_RAMTAGOUT   = eviction_buffer_tag_Q;
    assign EB_RAMINDEXOUT = eviction_buffer_index_Q;
    assign EB_EMPTY       = eviction_buffer_empty_Q;
    assign EB_RAMHPROTOUT = eviction_buffer_hprot_Q;
    assign EB_RAMHMASTLOCKOUT = eviction_buffer_hmastlock_Q;
    assign EB_RAMDATAOUT = eviction_buffer_dataout;

endmodule
