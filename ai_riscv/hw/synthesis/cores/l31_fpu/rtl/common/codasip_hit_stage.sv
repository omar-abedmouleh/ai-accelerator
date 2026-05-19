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
 *  \file   codasip_hit_stage.v
 *  \author Jakub Drbal
 *  \email  support@codasip.com
 *  \date   Wed Sep 2 2015
 *  \brief  stage with tag and valid bits memory where hit is computed
 */

module codasip_hit_stage #(
    parameter integer ASSOCIATIVITY = 32'sd4,
    parameter integer TAG_BITS      = 32'sd20,
    parameter integer INDEX_BITS    = 32'sd7,
    parameter [0:0]   RESET_LEVEL   = 1'b0,
    parameter [0:0]   RESET_SYNC    = 1'b1
)(
    input wire                                   CLK,
    input wire                                   RST,
    // input address
    input wire [TAG_BITS-1:0]                    TAG_IN,
    input wire [INDEX_BITS-1:0]                  INDEX_IN,
    input wire [INDEX_BITS-1:0]                  INDEX_IN_Q,
    input wire [ASSOCIATIVITY-1:0]               WAY_IN,
    // tag for content update
    input wire [TAG_BITS-1:0]                    TAG_W_IN,
    // output infos
    output reg  [TAG_BITS-1:0]                   TAG_OUT,
    output wire [INDEX_BITS-1:0]                 INDEX_OUT,
    output wire [ASSOCIATIVITY-1:0]              WAY_OUT,
    output wire                                  HIT_OUT,
    output wire [ASSOCIATIVITY-1:0]              VALID_BITS_OUT,
    // control signals
    input wire                                   VALIDATE,
    input wire                                   EN,
    input wire [ASSOCIATIVITY-1:0]               WE,
    input wire                                   BWE,
    // SRAM interface for TAG RAMs
    output wire                                  CACHE_SRAM_TAG_CS,
    output wire                                  CACHE_SRAM_TAG_RW,
    output wire [INDEX_BITS-1:0]                 CACHE_SRAM_TAG_A,
    output wire [ASSOCIATIVITY-1:0]              CACHE_SRAM_TAG_WSTRB,
    output wire [ASSOCIATIVITY*(TAG_BITS+1)-1:0] CACHE_SRAM_TAG_WDATA,
    input wire  [ASSOCIATIVITY*(TAG_BITS+1)-1:0] CACHE_SRAM_TAG_RDATA
);

    localparam integer TAG_VALID_BITS = TAG_BITS + 32'd1;

    // tag SRAMs
    wire                                          tag_ram_rw;
    wire [TAG_VALID_BITS-1:0]                     tag_data_in;
    // tag buffer
    wire [ASSOCIATIVITY-1:0]                      tag_buffer_WE;
    wire [ASSOCIATIVITY*TAG_VALID_BITS-1:0]       tag_buffer_data_D;
    wire [TAG_VALID_BITS-1:0]                     tag_buffer_data_Q [ASSOCIATIVITY-1:0];
    wire                                          index_buffer_WE;
    wire [INDEX_BITS-1:0]                         index_buffer_D;
    wire [INDEX_BITS-1:0]                         index_buffer_Q;
    // tag signals
    reg  [TAG_BITS-1:0]                           tags [ASSOCIATIVITY-1:0];
    reg  [ASSOCIATIVITY-1:0]                      valid;
    // hit info
    wire                                          index_valid;
    reg                                           is_hit;
    reg  [ASSOCIATIVITY-1:0]                      hit_way;

    /// register instances
    generate
        genvar k;
        for (k = 32'd0; k < ASSOCIATIVITY; k = k + 32'd1) begin : g_cache_tag_buffer
            d_ff_rst_we_t #(
                .BIT_WIDTH(TAG_VALID_BITS),
                .DEFAULT_VALUE({TAG_VALID_BITS{1'b0}}),
                .RESET_LEVEL(RESET_LEVEL),
                .RESET_SYNC(RESET_SYNC)
            ) cache_tag_buffer (
                .CLK(CLK),
                .RST(RST),
                .WE(tag_buffer_WE[k]),
                .D(tag_buffer_data_D[(k*TAG_VALID_BITS)+:TAG_VALID_BITS]),
                .Q(tag_buffer_data_Q[k])
            );
        end
    endgenerate

    d_ff_rst_we_t #(
        .BIT_WIDTH(INDEX_BITS),
        .DEFAULT_VALUE({INDEX_BITS{1'b0}}),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) cache_index_buffer (
        .CLK(CLK),
        .RST(RST),
        .WE(index_buffer_WE),
        .D(index_buffer_D),
        .Q(index_buffer_Q)
    );

    /// hit stage inputs
    assign tag_data_in = {TAG_W_IN, VALIDATE};
    assign tag_ram_rw  = | WE;

    // tag buffer   
    assign tag_buffer_WE = {ASSOCIATIVITY{BWE}} | WE;
    assign tag_buffer_data_D = (BWE == 1'b1) ? CACHE_SRAM_TAG_RDATA : {ASSOCIATIVITY{tag_data_in}};

    // index buffer
    assign index_buffer_D  = (BWE == 1'b1) ? INDEX_IN_Q : INDEX_IN;
    assign index_buffer_WE = | tag_buffer_WE;

    // tag and valid bits extraction
    always @(*)
    begin : tag_valid_extr
        integer i;
        for (i=0; i<ASSOCIATIVITY; i=i+1) begin
            valid[i] = tag_buffer_data_Q[i][0];
            tags[i] = tag_buffer_data_Q[i][TAG_BITS:1];
        end
    end

    assign index_valid = (index_buffer_Q == INDEX_IN_Q);
    
    // determine if we have a hit
    always @(*) begin : hit_way_decoder
        integer i;
        for (i=0; i<ASSOCIATIVITY; i=i+1) begin : decide_hit
            hit_way[i] = (tags[i] == TAG_IN) && (index_valid == 1'b1) && (valid[i] == 1'b1);
        end
        is_hit = |hit_way;
    end
    
    always @(*) begin : tag_out_decoder
        integer i;
        reg [TAG_BITS-1:0] data;
        data = {TAG_BITS{1'b0}};
        for (i=0; i<ASSOCIATIVITY; i=i+1) begin
            data = data | (tags[i] & {TAG_BITS{WAY_IN[i]}});
        end
        TAG_OUT = data;
    end

    /// hit stage outputs
    // SRAMs
    assign CACHE_SRAM_TAG_CS    = EN;
    assign CACHE_SRAM_TAG_RW    = tag_ram_rw;
    assign CACHE_SRAM_TAG_A     = INDEX_IN;
    assign CACHE_SRAM_TAG_WSTRB = WE;
    assign CACHE_SRAM_TAG_WDATA = {ASSOCIATIVITY{tag_data_in}};
    // ucache
    assign VALID_BITS_OUT = valid;
    assign HIT_OUT        = is_hit;
    assign WAY_OUT        = hit_way;
    assign INDEX_OUT      = index_buffer_Q;

endmodule
