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
 *  \file   codasip_ucache.v
 *  \author Jakub Drbal
 *  \email  support@codasip.com
 *  \date   Wed Sep 2 2015
 *  \brief  micro cache - basic cache memory without control
 */

module codasip_ucache #(
    parameter integer CACHE_DATA_BITS = 32'sd32,
    parameter integer TAG_BITS        = 32'sd20,
    parameter integer INDEX_BITS      = 32'sd7,
    parameter integer OFFSET_BITS     = 32'sd3,
    parameter integer ASSOCIATIVITY   = 32'sd4,
    parameter integer CACHE_LINE_BITS = 32'sd256,
    parameter [0:0]   RESET_LEVEL     = 1'b0,
    parameter [0:0]   RESET_SYNC      = 1'b1
)(
    input  wire                                          CLK,
    input  wire                                          RST,
    /// data port
    // data in out
    input  wire [CACHE_DATA_BITS-1:0]                    UC_DP_DATAIN, // data to ucache
    output reg  [CACHE_DATA_BITS-1:0]                    UC_DP_DATAOUT, // data from ucache, synchronous read
    // input address
    input  wire [TAG_BITS-1:0]                           UC_DP_TAG, // tag for addressing
    input  wire [INDEX_BITS-1:0]                         UC_DP_INDEX, // index, for addressing
    input  wire [OFFSET_BITS-1:0]                        UC_DP_OFFSET, // offset, for addressing
    // output infos
    output wire                                          UC_DP_HIT, // data is valid (only for tag addressing), synchronous read
    // control signals
    input  wire                                          UC_DP_AEN, // address enable
    input  wire                                          UC_DP_DEN, // data enable
    input  wire [(CACHE_DATA_BITS/8)-1:0]                UC_DP_BEN, // byte enable for write
    input  wire                                          UC_DP_DWE, // write enable ucache read/write
    input  wire                                          UC_DP_BWE, // buffer write enable
    /// data management port
    // data in out
    input  wire [CACHE_LINE_BITS-1:0]                    UC_MP_DATAIN, // data to ucache
    output reg  [CACHE_LINE_BITS-1:0]                    UC_MP_DATAOUT, // data from ucache, synchronous read
    // input address
    input  wire [TAG_BITS-1:0]                           UC_MP_TAGIN, // tag for addressing
    input  wire [INDEX_BITS-1:0]                         UC_MP_INDEXIN, // index, for addressing
    // output infos
    output wire                                          UC_MP_HIT, // data is valid (only for tag addressing), synchronous read
    output wire [ASSOCIATIVITY-1:0]                      UC_MP_WAYOUT, // way where the data is, synchronous
    output wire [TAG_BITS-1:0]                           UC_MP_TAGOUT, // tags(INDEXIN)(WAYIN), synchronous read
    output wire [INDEX_BITS-1:0]                         UC_MP_INDEXOUT, // index of content saved in internal buffers
    output wire [ASSOCIATIVITY-1:0]                      UC_MP_VBOUT, // valid_bits(INDEXIN) for all ways, synchronous read
    output wire [ASSOCIATIVITY-1:0]                      UC_MP_DBOUT, // dirty_bits(INDEXIN) for all ways, synchronous read
    // control signals
    input  wire                                          UC_MP_VALID, // request valid
    input  wire                                          UC_MP_AEN, // address enable
    input  wire                                          UC_MP_DEN, // data enable
    input  wire                                          UC_MP_DWE, // write enable ucache read/write
    input  wire                                          UC_MP_BWE, // buffer write enable
    /// tags management port
    input  wire                                          UC_MP_AM, // ucache addressing mode ('0' - tag, '1' - way)
    input  wire [ASSOCIATIVITY-1:0]                      UC_MP_WAYIN, // way for addressing
    input  wire                                          UC_MP_CLR, // clear ucache (AM = '1' - only WAYIN, AM = '0' all ways)
    input  wire [TAG_BITS-1:0]                           UC_MP_TAGWIN, // tag which will be written to ucache
    input  wire                                          UC_MP_TAGWE, // write enable for tag
    input  wire                                          UC_MP_DSET,  // set dirty bit(s)
    input  wire                                          UC_MP_DCLR,  // clear dirty bit(s)
    /// contol bit
    input  wire                                          UC_CS_WT, // write through
    /// SRAM interfaces
    // SRAM interface for TAG RAMs
    output wire                                          DCACHE_SRAM_TAG_CS,
    output wire                                          DCACHE_SRAM_TAG_RW,
    output wire [INDEX_BITS-1:0]                         DCACHE_SRAM_TAG_A,
    output wire [ASSOCIATIVITY-1:0]                      DCACHE_SRAM_TAG_WSTRB,
    output wire [ASSOCIATIVITY*(TAG_BITS+1)-1:0]         DCACHE_SRAM_TAG_WDATA,
    input  wire [ASSOCIATIVITY*(TAG_BITS+1)-1:0]         DCACHE_SRAM_TAG_RDATA,
    // SRAM interface for DATA RAMs (cache lines)
    output wire                                          DCACHE_SRAM_LINE_DATA_CS,
    output wire                                          DCACHE_SRAM_LINE_DATA_RW,
    output wire [INDEX_BITS-1:0]                         DCACHE_SRAM_LINE_DATA_A,
    output reg  [ASSOCIATIVITY*(CACHE_LINE_BITS/8)-1:0]  DCACHE_SRAM_LINE_DATA_WSTRB,
    output wire [ASSOCIATIVITY*CACHE_LINE_BITS-1:0]      DCACHE_SRAM_LINE_DATA_WDATA,
    input  wire [ASSOCIATIVITY*CACHE_LINE_BITS-1:0]      DCACHE_SRAM_LINE_DATA_RDATA,
    // SRAM interface for Dirty bits
    output wire                                          DCACHE_SRAM_DIRTY_CS,
    output wire                                          DCACHE_SRAM_DIRTY_RW,
    output wire [INDEX_BITS-1:0]                         DCACHE_SRAM_DIRTY_A,
    output wire [ASSOCIATIVITY-1:0]                      DCACHE_SRAM_DIRTY_WSTRB,
    output wire [ASSOCIATIVITY-1:0]                      DCACHE_SRAM_DIRTY_WDATA,
    input  wire [ASSOCIATIVITY-1:0]                      DCACHE_SRAM_DIRTY_RDATA
);

    localparam integer BYTE_BITS       = 32'sd8;
    localparam integer CACHE_LINE_SIZE = (CACHE_LINE_BITS / BYTE_BITS);
    localparam integer BYTES_PER_WORD  = (CACHE_DATA_BITS / BYTE_BITS);
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
    wire mp_dw_EN;
    // info signals
    wire                     hit;
    wire [ASSOCIATIVITY-1:0] way;
    wire [TAG_BITS-1:0]      tag;
    wire [ASSOCIATIVITY-1:0] valid_bits;
    // hit stage update inputs
    wire                     am_D;
    wire                     am_Q;
    wire [INDEX_BITS-1:0]    address;
    wire                     updated_valid_bit;
    wire [ASSOCIATIVITY-1:0] tag_WE;
    // storage signals
    reg  [CACHE_LINE_BITS-1:0]               storage_data_in;
    reg  [CACHE_LINE_SIZE-1:0]               storage_we [ASSOCIATIVITY-1:0];
    wire [ASSOCIATIVITY*CACHE_LINE_BITS-1:0] storage_buffer_data_D;
    wire [ASSOCIATIVITY*CACHE_LINE_BITS-1:0] storage_buffer_data_Q;
    reg  [CACHE_LINE_SIZE-1:0]               storage_buffer_WE [ASSOCIATIVITY-1:0];
    // dirty bits signals
    wire                             dbits_update;
    wire [ASSOCIATIVITY-1:0]         dbits_in;
    wire [ASSOCIATIVITY-1:0]         dbits_we;
    wire                             dbits_rw;
    wire [ASSOCIATIVITY-1:0]         dbits_buffer_D;
    wire [ASSOCIATIVITY-1:0]         dbits_buffer_Q;
    wire [ASSOCIATIVITY-1:0]         dbits_buffer_WE;

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

    // control registers
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) addr_mode_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(address_EN),
        .D(am_D),
        .Q(am_Q)
    );

    // SRAM buffers
    generate
        genvar k;
        for (k = 32'd0; k < ASSOCIATIVITY; k = k + 32'd1) begin : g_cache_line_buffer
            codasip_d_ff_rst_bwe_t #(
                .BIT_WIDTH(CACHE_LINE_BITS),
                .BYTE_NUM(CACHE_LINE_SIZE),
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

    codasip_d_ff_rst_bwe_t #(
        .BIT_WIDTH(ASSOCIATIVITY),
        .BYTE_NUM(ASSOCIATIVITY),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) cache_dbits_buffer (
        .CLK(CLK),
        .RST(RST),
        .WE(dbits_buffer_WE),
        .D(dbits_buffer_D),
        .Q(dbits_buffer_Q)
    );

    // cache hit stage
    codasip_hit_stage #(
        .ASSOCIATIVITY(ASSOCIATIVITY),
        .TAG_BITS(TAG_BITS),
        .INDEX_BITS(INDEX_BITS),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    )
    i_hit_stage(
        .CLK(CLK),
        .RST(RST),
        .TAG_IN(tag_Q),
        .INDEX_IN(index_D),
        .INDEX_IN_Q(index_Q),
        .WAY_IN(UC_MP_WAYIN),
        .TAG_W_IN(UC_MP_TAGWIN),
        .TAG_OUT(tag),
        .INDEX_OUT(UC_MP_INDEXOUT),
        .WAY_OUT(way),
        .HIT_OUT(hit),
        .VALID_BITS_OUT(valid_bits),
        .VALIDATE(updated_valid_bit),
        .EN(address_EN),
        .WE(tag_WE),
        .BWE(buffer_write_EN),
        .CACHE_SRAM_TAG_CS(DCACHE_SRAM_TAG_CS),
        .CACHE_SRAM_TAG_RW(DCACHE_SRAM_TAG_RW),
        .CACHE_SRAM_TAG_A(DCACHE_SRAM_TAG_A),
        .CACHE_SRAM_TAG_WSTRB(DCACHE_SRAM_TAG_WSTRB),
        .CACHE_SRAM_TAG_WDATA(DCACHE_SRAM_TAG_WDATA),
        .CACHE_SRAM_TAG_RDATA(DCACHE_SRAM_TAG_RDATA)
    );

    /// combinatorial logic
    // ucache inputs and control signals
    assign tag_D             = (UC_MP_VALID == 1'b1) ? UC_MP_TAGIN : UC_DP_TAG;
    assign index_D           = (UC_MP_VALID == 1'b1) ? UC_MP_INDEXIN : UC_DP_INDEX;
    assign address_EN        = (UC_MP_VALID == 1'b1) ? UC_MP_AEN : UC_DP_AEN;
    assign address           = (UC_MP_VALID == 1'b1) ? UC_MP_INDEXIN :
        (UC_DP_DWE == 1'b1) ? index_Q : UC_DP_INDEX;
    assign am_D              = (UC_MP_VALID == 1'b1) ? UC_MP_AM : 1'b0;
    assign buffer_write_EN   = (UC_MP_VALID == 1'b1) ? UC_MP_BWE : UC_DP_BWE;
    assign mp_dw_EN          = UC_MP_VALID & UC_MP_DWE;
    assign updated_valid_bit = (~UC_MP_CLR);
    assign dbits_update      = UC_DP_DWE & (~UC_CS_WT);

    // tag we generator
    assign tag_WE = (UC_MP_AM == 1'b1) ? ({ASSOCIATIVITY{UC_MP_VALID & UC_MP_TAGWE}} & UC_MP_WAYIN) : 
        {ASSOCIATIVITY{UC_MP_VALID & UC_MP_TAGWE}};
    
    // cache line buffer
    always @(*)
    begin : buffer_we_gen
        integer i;
        integer j;

        for (i=0; i<ASSOCIATIVITY; i=i+1) begin
            storage_we[i] = {CACHE_LINE_SIZE{1'b0}};
            if (mp_dw_EN == 1'b1) begin
                storage_we[i] = {CACHE_LINE_SIZE{UC_MP_WAYIN[i]}};
            end else if (UC_DP_DWE == 1'b1) begin
                for (j=0; j<WORDS_PER_LINE; j=j+1) begin
                    if (offset_Q == j[OFFSET_BITS-1:0]) begin
                        storage_we[i][j*BYTES_PER_WORD+:BYTES_PER_WORD] = (UC_DP_BEN & {BYTES_PER_WORD{way[i]}});
                    end
                end
            end
            storage_buffer_WE[i] = {CACHE_LINE_SIZE{buffer_write_EN}} | storage_we[i];
        end
    end
    
    always @(*)
    begin : storage_wdata_gen
        integer j;
        
        storage_data_in = {CACHE_LINE_BITS{1'b0}};
        if (mp_dw_EN == 1'b1) begin
            storage_data_in = UC_MP_DATAIN;
        end else if (UC_DP_DWE == 1'b1) begin
            for (j=0; j<WORDS_PER_LINE; j=j+1) begin
                storage_data_in[(j*CACHE_DATA_BITS)+:CACHE_DATA_BITS] = UC_DP_DATAIN;
            end
        end
    end
    
    assign storage_buffer_data_D = (buffer_write_EN == 1'b1) ? DCACHE_SRAM_LINE_DATA_RDATA : {ASSOCIATIVITY{storage_data_in}};

    // cache line select
    always @(*)
    begin : cache_line_mux
        integer i;
        reg [CACHE_LINE_BITS-1:0] cache_data_out;
        reg [ASSOCIATIVITY-1:0] way_out;
        
        cache_data_out = {CACHE_LINE_BITS{1'b0}};
        way_out = (am_Q == 1'b1) ? UC_MP_WAYIN : way;
        
        for (i=0; i<ASSOCIATIVITY; i=i+1) begin
            cache_data_out = cache_data_out | (storage_buffer_data_Q[(i*CACHE_LINE_BITS)+:CACHE_LINE_BITS] & {CACHE_LINE_BITS{way_out[i]}});
        end
        UC_MP_DATAOUT = cache_data_out;
    end

    // dirty bits memory    
    assign dbits_we = (UC_MP_VALID == 1'b1) ? ((UC_MP_AM == 1'b1) ? ({ASSOCIATIVITY{UC_MP_TAGWE | UC_MP_DCLR}} & UC_MP_WAYIN) : 
        {ASSOCIATIVITY{UC_MP_TAGWE | UC_MP_DCLR}}) : {ASSOCIATIVITY{dbits_update}} & way;
    assign dbits_rw = (UC_MP_VALID & (UC_MP_TAGWE | UC_MP_DCLR)) | dbits_update;
    assign dbits_in = {ASSOCIATIVITY{UC_MP_VALID & ~UC_CS_WT & UC_MP_DSET}} | {ASSOCIATIVITY{~UC_MP_VALID & ~UC_CS_WT}};

    // dirty bits buffer   
    assign dbits_buffer_WE = (buffer_write_EN == 1'b1) ? {ASSOCIATIVITY{1'b1}} : dbits_we;
    assign dbits_buffer_D = (buffer_write_EN == 1'b1) ? DCACHE_SRAM_DIRTY_RDATA : dbits_in;
    
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
            DCACHE_SRAM_LINE_DATA_WSTRB[(i*CACHE_LINE_SIZE)+:CACHE_LINE_SIZE] = storage_we[i];
        end
    end

    /// uCache outputs
    // data port
    assign UC_DP_HIT     = hit;
    // management port
    assign UC_MP_HIT     = hit;
    assign UC_MP_WAYOUT  = way;
    assign UC_MP_VBOUT   = valid_bits;
    assign UC_MP_TAGOUT  = tag;
    assign UC_MP_DBOUT   = dbits_buffer_Q;
    // SRAMs
    assign DCACHE_SRAM_LINE_DATA_CS    = (UC_MP_VALID == 1'b1) ? UC_MP_DEN : UC_DP_DEN;
    assign DCACHE_SRAM_LINE_DATA_RW    = (UC_MP_VALID == 1'b1) ? UC_MP_DWE : UC_DP_DWE;
    assign DCACHE_SRAM_LINE_DATA_A     = address;
    assign DCACHE_SRAM_LINE_DATA_WDATA = {ASSOCIATIVITY{storage_data_in}};
    assign DCACHE_SRAM_DIRTY_CS        = (UC_MP_VALID == 1'b1) ? (UC_MP_AEN | UC_MP_DCLR) : (UC_DP_DEN | dbits_update);
    assign DCACHE_SRAM_DIRTY_RW        = dbits_rw;
    assign DCACHE_SRAM_DIRTY_A         = address;
    assign DCACHE_SRAM_DIRTY_WSTRB     = dbits_we;
    assign DCACHE_SRAM_DIRTY_WDATA     = dbits_in;

endmodule
