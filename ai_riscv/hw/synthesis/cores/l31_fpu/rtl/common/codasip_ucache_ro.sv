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
 *  \file   codasip_ucache_ro.v
 *  \author Jakub Drbal
 *  \email  support@codasip.com
 *  \date   Wed Sep 2 2015
 *  \brief  micro cache - basic cache memory without control (for icache)
 */

module codasip_ucache_ro #(
    parameter integer CACHE_DATA_BITS = 32'sd32,
    parameter integer TAG_BITS        = 32'sd20,
    parameter integer INDEX_BITS      = 32'sd7,
    parameter integer OFFSET_BITS     = 32'sd3,
    parameter integer ASSOCIATIVITY   = 32'sd4,
    parameter integer CACHE_LINE_BITS = 32'sd256,
    parameter [0:0]   RESET_LEVEL     = 1'b0,
    parameter [0:0]   RESET_SYNC      = 1'b1
)(
    input wire                                           CLK,
    input wire                                           RST,
    /// data port
    // data in out
    output reg [CACHE_DATA_BITS-1:0]                     UC_DP_DATAOUT,
    // input address
    input wire [TAG_BITS-1:0]                            UC_DP_TAG,
    input wire [INDEX_BITS-1:0]                          UC_DP_INDEX,
    input wire [OFFSET_BITS-1:0]                         UC_DP_OFFSET,
    // output infos
    output wire                                          UC_DP_HIT,
    // control signals
    input wire                                           UC_DP_AEN,
    input wire                                           UC_DP_DEN,
    input wire                                           UC_DP_BWE,
    /// data management port
    // data in out
    input wire [CACHE_LINE_BITS-1:0]                     UC_MP_DATAIN,
    // input address
    input wire [TAG_BITS-1:0]                            UC_MP_TAGIN,
    input wire [INDEX_BITS-1:0]                          UC_MP_INDEXIN,
    // output infos
    output wire                                          UC_MP_HIT,
    output wire [ASSOCIATIVITY-1:0]                      UC_MP_WAYOUT,
    output wire [ASSOCIATIVITY-1:0]                      UC_MP_VBOUT,
    // control signals
    input wire                                           UC_MP_VALID,
    input wire                                           UC_MP_AEN,
    input wire                                           UC_MP_DEN,
    input wire                                           UC_MP_DWE,
    input wire                                           UC_MP_BWE,
    /// tags management port
    input wire                                           UC_MP_AM,
    input wire [ASSOCIATIVITY-1:0]                       UC_MP_WAYIN,
    input wire                                           UC_MP_CLR,
    input wire [TAG_BITS-1:0]                            UC_MP_TAGWIN,
    input wire                                           UC_MP_TAGWE,
    /// SRAM interfaces
    // SRAM interface for TAG RAMs
    output wire                                          ICACHE_SRAM_TAG_CS,
    output wire                                          ICACHE_SRAM_TAG_RW,
    output wire [INDEX_BITS-1:0]                         ICACHE_SRAM_TAG_A,
    output wire [ASSOCIATIVITY-1:0]                      ICACHE_SRAM_TAG_WSTRB,
    output wire [ASSOCIATIVITY*(TAG_BITS+1)-1:0]         ICACHE_SRAM_TAG_WDATA,
    input wire  [ASSOCIATIVITY*(TAG_BITS+1)-1:0]         ICACHE_SRAM_TAG_RDATA,
    // SRAM interface for DATA RAMs (cache lines)
    output wire                                          ICACHE_SRAM_LINE_DATA_CS,
    output wire                                          ICACHE_SRAM_LINE_DATA_RW,
    output wire [INDEX_BITS-1:0]                         ICACHE_SRAM_LINE_DATA_A,
    output reg  [ASSOCIATIVITY*(CACHE_LINE_BITS/8)-1:0]  ICACHE_SRAM_LINE_DATA_WSTRB,
    output wire [ASSOCIATIVITY*CACHE_LINE_BITS-1:0]      ICACHE_SRAM_LINE_DATA_WDATA,
    input wire  [ASSOCIATIVITY*CACHE_LINE_BITS-1:0]      ICACHE_SRAM_LINE_DATA_RDATA
);

    localparam integer CACHE_LINE_SIZE = (CACHE_LINE_BITS / 32'sd8);
    localparam integer WORDS_PER_LINE = (CACHE_LINE_BITS / CACHE_DATA_BITS);

    // address signals
    wire [INDEX_BITS-1:0]  index_D;
    wire [INDEX_BITS-1:0]  index_Q;
    wire [TAG_BITS-1:0]    tag_D;
    wire [TAG_BITS-1:0]    tag_Q;
    wire [OFFSET_BITS-1:0] offset_Q;
    // control signals
    wire address_EN;
    wire buffer_write_EN;
    // info signals
    wire                     hit;
    wire [ASSOCIATIVITY-1:0] way;
    wire [ASSOCIATIVITY-1:0] valid_bits;
    // hit stage update inputs
    wire                     updated_valid_bit;
    wire [ASSOCIATIVITY-1:0] tag_WE;
    // cache line buffer
    wire [ASSOCIATIVITY*CACHE_LINE_BITS-1:0] storage_buffer_data_D;
    wire [ASSOCIATIVITY*CACHE_LINE_BITS-1:0] storage_buffer_data_Q;
    wire [ASSOCIATIVITY-1:0]                 storage_buffer_WE;

    /// child instances
    // address registers
    d_ff_rst_we_t #(
        .BIT_WIDTH(TAG_BITS),
        .DEFAULT_VALUE({TAG_BITS{1'b0}}),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) tag_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(address_EN),
        .D(tag_D),
        .Q(tag_Q)
    );

    d_ff_rst_we_t #(
        .BIT_WIDTH(INDEX_BITS),
        .DEFAULT_VALUE({INDEX_BITS{1'b0}}),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) index_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(address_EN),
        .D(index_D),
        .Q(index_Q)
    );

    d_ff_rst_we_t #(
        .BIT_WIDTH(OFFSET_BITS),
        .DEFAULT_VALUE({OFFSET_BITS{1'b0}}),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) offset_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(UC_DP_AEN),
        .D(UC_DP_OFFSET),
        .Q(offset_Q)
    );

    // SRAM buffers
    generate
        genvar k;
        for (k = 32'd0; k < ASSOCIATIVITY; k = k + 32'd1) begin : g_cache_line_buffer
            d_ff_rst_we_t #(
                .BIT_WIDTH(CACHE_LINE_BITS),
                .DEFAULT_VALUE({CACHE_LINE_BITS{1'b0}}),
                .RESET_LEVEL(RESET_LEVEL),
                .RESET_SYNC(RESET_SYNC)
            ) cache_line_buffer (
                .CLK(CLK),
                .RST(RST),
                .WE(storage_buffer_WE[k]),
                .D(storage_buffer_data_D[(k*CACHE_LINE_BITS)+:CACHE_LINE_BITS]),
                .Q(storage_buffer_data_Q[(k*CACHE_LINE_BITS)+:CACHE_LINE_BITS])
            );
        end
    endgenerate

    // cache hit stage
    codasip_hit_stage #(
        .ASSOCIATIVITY(ASSOCIATIVITY),
        .TAG_BITS(TAG_BITS),
        .INDEX_BITS(INDEX_BITS),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    )
    i_hit_stage (
        .CLK(CLK),
        .RST(RST),
        .TAG_IN(tag_Q),
        .INDEX_IN(index_D),
        .INDEX_IN_Q(index_Q),
        .WAY_IN({ASSOCIATIVITY{1'b0}}),
        .TAG_W_IN(UC_MP_TAGWIN),
        // reuse of common module
        // verilator lint_off PINCONNECTEMPTY
        .TAG_OUT(),
        .INDEX_OUT(),
        // verilator lint_on PINCONNECTEMPTY
        .WAY_OUT(way),
        .HIT_OUT(hit),
        .VALID_BITS_OUT(valid_bits),
        .VALIDATE(updated_valid_bit),
        .EN(address_EN),
        .WE(tag_WE),
        .BWE(buffer_write_EN),
        .CACHE_SRAM_TAG_CS(ICACHE_SRAM_TAG_CS),
        .CACHE_SRAM_TAG_RW(ICACHE_SRAM_TAG_RW),
        .CACHE_SRAM_TAG_A(ICACHE_SRAM_TAG_A),
        .CACHE_SRAM_TAG_WSTRB(ICACHE_SRAM_TAG_WSTRB),
        .CACHE_SRAM_TAG_WDATA(ICACHE_SRAM_TAG_WDATA),
        .CACHE_SRAM_TAG_RDATA(ICACHE_SRAM_TAG_RDATA)
    );

    /// combinatorial logic
    // ucache inputs and control signals
    assign tag_D             = (UC_MP_VALID == 1'b1) ? UC_MP_TAGIN : UC_DP_TAG;
    assign index_D           = (UC_MP_VALID == 1'b1) ? UC_MP_INDEXIN : UC_DP_INDEX;
    assign address_EN        = (UC_MP_VALID == 1'b1) ? UC_MP_AEN : UC_DP_AEN;
    assign buffer_write_EN   = (UC_MP_VALID == 1'b1) ? UC_MP_BWE : UC_DP_BWE;
    assign updated_valid_bit = (~UC_MP_CLR);

    // tag we generator
    assign tag_WE = (UC_MP_AM == 1'b1) ? ({ASSOCIATIVITY{UC_MP_VALID & UC_MP_TAGWE}} & UC_MP_WAYIN) : 
        {ASSOCIATIVITY{UC_MP_VALID & UC_MP_TAGWE}};

    // cache line buffer
    assign storage_buffer_WE = {ASSOCIATIVITY{buffer_write_EN}} | ({ASSOCIATIVITY{(UC_MP_VALID & UC_MP_DWE)}} & UC_MP_WAYIN);
    assign storage_buffer_data_D = (buffer_write_EN == 1'b1) ? ICACHE_SRAM_LINE_DATA_RDATA : {ASSOCIATIVITY{UC_MP_DATAIN}};

    // cache data select
    always @(*) begin : data_out_mux
        integer i;
        integer j;
        reg [CACHE_DATA_BITS-1:0] data_out [ASSOCIATIVITY-1:0][WORDS_PER_LINE-1:0];
        reg [CACHE_DATA_BITS-1:0] data;

        // prepare different view on the SRAM data: cache line split to words per way
        // (FPGA synthesizer sees the multiplexers instead of shifters)
        for (i=0; i<ASSOCIATIVITY; i=i+1) begin
            for (j=0; j<WORDS_PER_LINE; j=j+1) begin
                data_out[i][j] = storage_buffer_data_Q[((i*CACHE_LINE_BITS)+(j*CACHE_DATA_BITS))+:CACHE_DATA_BITS];
            end
        end
        // select the from target way: AND-OR logic
        data = {CACHE_DATA_BITS{1'b0}};
        for (i=0; i<ASSOCIATIVITY; i=i+1) begin
            data = data | (data_out[i][offset_Q] & {CACHE_DATA_BITS{way[i]}});
        end
        UC_DP_DATAOUT = data;
    end
    
    // storage write strobe
    always @(*) begin : storage_write_strobe
        integer i;
        for (i=0; i<ASSOCIATIVITY; i=i+1) begin
            ICACHE_SRAM_LINE_DATA_WSTRB[(i*CACHE_LINE_SIZE)+:CACHE_LINE_SIZE] = {CACHE_LINE_SIZE{UC_MP_WAYIN[i]}};
        end
    end

    /// uCache outputs
    // data port
    assign UC_DP_HIT     = hit;
    // management port
    assign UC_MP_HIT     = hit;
    assign UC_MP_WAYOUT  = way;
    assign UC_MP_VBOUT   = valid_bits;
    // SRAMs
    assign ICACHE_SRAM_LINE_DATA_CS    = (UC_MP_VALID == 1'b1) ? UC_MP_DEN : UC_DP_DEN;
    assign ICACHE_SRAM_LINE_DATA_RW    = (UC_MP_VALID & UC_MP_DWE);
    assign ICACHE_SRAM_LINE_DATA_A     = index_D;
    assign ICACHE_SRAM_LINE_DATA_WDATA = {ASSOCIATIVITY{UC_MP_DATAIN}};

endmodule
