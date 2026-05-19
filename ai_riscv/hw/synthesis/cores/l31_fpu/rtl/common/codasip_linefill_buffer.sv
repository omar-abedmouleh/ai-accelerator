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
 *  \file   codasip_linefill_buffer.v
 *  \author Jakub Drbal
 *  \email  support@codasip.com
 *  \date   Wed Sep 2 2015
 *  \brief  buffer for cache line filling
 */

module codasip_linefill_buffer #(
    parameter integer RAM_DATA_BITS   = 32'sd32,
    parameter integer RAM_OFFSET_BITS = 32'sd3,
    parameter integer CACHE_DATA_BITS = 32'sd32,
    parameter integer OFFSET_BITS     = 32'sd3,
    parameter integer CACHE_LINE_BITS = 32'sd256,
    parameter [0:0]   RESET_LEVEL     = 1'b0,
    parameter [0:0]   RESET_SYNC      = 1'b1
)(
    input wire CLK,
    input wire RST,
    // data
    input wire [CACHE_DATA_BITS-1:0]  LFB_CACHEDATAIN,
    output reg [CACHE_DATA_BITS-1:0]  LFB_CACHEDATAOUT,
    output reg                        LFB_CACHEDATAOUTVAL,
    input wire [RAM_DATA_BITS-1:0]    LFB_RAMDATAIN,
    output wire [CACHE_LINE_BITS-1:0] LFB_DATAOUT,
    output wire                       LFB_DIRTYFLAG,
    // offset
    input wire [OFFSET_BITS-1:0]      LFB_CACHEOFFSET,
    input wire [RAM_OFFSET_BITS-1:0]  LFB_RAMOFFSET,
    // control
    input wire                        LFB_CACHEWE,
    input wire [(CACHE_DATA_BITS/8)-1:0] LFB_CACHEBEN,
    input wire                        LFB_RAMWE,
    input wire                        LFB_CLR
);

    localparam integer BYTE_BITS            = 32'sd8;
    localparam integer BYTES_PER_WORD       = CACHE_DATA_BITS/BYTE_BITS;
    localparam integer WORDS_PER_LINE       = CACHE_LINE_BITS/CACHE_DATA_BITS;
    localparam integer BYTES_PER_CACHE_LINE = WORDS_PER_LINE*BYTES_PER_WORD;
    localparam integer RAM_WORDS_PER_LINE   = CACHE_LINE_BITS/RAM_DATA_BITS;
    localparam integer BYTES_PER_RAM_WORD   = RAM_DATA_BITS/BYTE_BITS;

    // linefill buffer
    wire [BYTES_PER_CACHE_LINE-1:0] linefill_buffer_ben;
    reg  [CACHE_LINE_BITS-1:0]      linefill_buffer_D;
    wire [CACHE_LINE_BITS-1:0]      linefill_buffer_Q;
    wire [BYTES_PER_CACHE_LINE-1:0] linefill_buffer_bvalid_WE;
    wire [BYTES_PER_CACHE_LINE-1:0] linefill_buffer_bvalid_D;
    wire [BYTES_PER_CACHE_LINE-1:0] linefill_buffer_bvalid_Q;
    // dirty flag
    wire dirty_flag_WE;
    wire dirty_flag_D;
    wire dirty_flag_Q;
    // byte enables
    reg [BYTES_PER_CACHE_LINE-1:0] ram_ben;
    reg [BYTES_PER_CACHE_LINE-1:0] cache_ben;
    
    // dirty flag register
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'd1),
        .DEFAULT_VALUE(32'd0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) dirty_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(dirty_flag_WE),
        .D(dirty_flag_D),
        .Q(dirty_flag_Q)
    );
    
    // generate linefill buffer registers   
    generate
        genvar ii;
        for ( ii = 32'd0; ii < BYTES_PER_CACHE_LINE; ii = ii + 32'd1 ) begin : g_data_reg
            d_ff_rst_we_t #(
                .BIT_WIDTH(BYTE_BITS),
                .DEFAULT_VALUE({BYTE_BITS{1'b0}}),
                .RESET_LEVEL(RESET_LEVEL),
                .RESET_SYNC(RESET_SYNC)
            ) data_reg (
                .CLK(CLK),
                .RST(RST),
                .WE(linefill_buffer_ben[ii]),
                .D(linefill_buffer_D[(ii*BYTE_BITS)+:BYTE_BITS]),
                .Q(linefill_buffer_Q[(ii*BYTE_BITS)+:BYTE_BITS])
            );

            assign linefill_buffer_bvalid_D[ii] = ~LFB_CLR;
            assign linefill_buffer_bvalid_WE[ii] = LFB_CLR || linefill_buffer_ben[ii];
            
            d_ff_rst_we_t #(
                .BIT_WIDTH(32'd1),
                .DEFAULT_VALUE(1'b0),
                .RESET_LEVEL(RESET_LEVEL),
                .RESET_SYNC(RESET_SYNC)
            ) data_valid_reg (
                .CLK(CLK),
                .RST(RST),
                .WE(linefill_buffer_bvalid_WE[ii]),
                .D(linefill_buffer_bvalid_D[ii]),
                .Q(linefill_buffer_bvalid_Q[ii])
            );
        end
    endgenerate

    // master interface byte enable decoder
    always @(*)
    begin : ram_byte_enable_dec
        integer i;
        ram_ben = {BYTES_PER_CACHE_LINE{1'b0}};

        for (i=0; i<RAM_WORDS_PER_LINE; i=i+1) begin
            if (LFB_RAMWE == 1'b1 && LFB_RAMOFFSET == i[RAM_OFFSET_BITS-1:0]) begin
                ram_ben[(i*BYTES_PER_RAM_WORD)+:BYTES_PER_RAM_WORD]
                    = ~linefill_buffer_bvalid_Q[(i*BYTES_PER_RAM_WORD)+:BYTES_PER_RAM_WORD];
            end
        end
    end

    // slave interface byte enable decoder
    always @(*)
    begin : cache_byte_enable_dec
        integer i;
        cache_ben = {BYTES_PER_CACHE_LINE{1'b0}};

        for (i=0; i<WORDS_PER_LINE; i=i+1) begin
            if (LFB_CACHEWE == 1'b1 && LFB_CACHEOFFSET == i[OFFSET_BITS-1:0]) begin
                cache_ben[(i*BYTES_PER_WORD)+:BYTES_PER_WORD] = LFB_CACHEBEN;
            end
        end
    end

    // data input mux
    always @(*)
    begin : data_input_mux
        integer i;
        integer n;

        for (i=0; i<RAM_WORDS_PER_LINE; i=i+1) begin
            linefill_buffer_D[(i*RAM_DATA_BITS)+:RAM_DATA_BITS] = LFB_RAMDATAIN;
        end
        for (i=0; i<WORDS_PER_LINE; i=i+1) begin
            if (LFB_CACHEWE == 1'b1 && LFB_CACHEOFFSET == i[OFFSET_BITS-1:0]) begin
                for (n=0; n<BYTES_PER_WORD; n=n+1) begin
                    if (LFB_CACHEBEN[n] == 1'b1) begin
                        linefill_buffer_D[((n*BYTE_BITS) + (i*CACHE_DATA_BITS))+:BYTE_BITS]
                            = LFB_CACHEDATAIN[(n*BYTE_BITS)+:BYTE_BITS];
                    end
                end
            end
        end
    end

    // data output demux
    always @(*)
    begin : data_output_demux
        integer i;
        LFB_CACHEDATAOUTVAL = 1'b0;
        LFB_CACHEDATAOUT = {CACHE_DATA_BITS{1'b0}};

        for (i=0; i<WORDS_PER_LINE; i=i+1) begin
            if (LFB_CACHEOFFSET == i[OFFSET_BITS-1:0]) begin
                LFB_CACHEDATAOUTVAL = linefill_buffer_bvalid_Q[(i+1)*BYTES_PER_WORD -1];
                LFB_CACHEDATAOUT = linefill_buffer_Q[(i*CACHE_DATA_BITS)+:CACHE_DATA_BITS];
            end
        end
    end
    
    // byte enable
    assign linefill_buffer_ben = ram_ben | cache_ben;
    
    // dirty flag
    assign dirty_flag_D  = (LFB_CLR == 1'b1) ? 1'b0 : 1'b1;
    assign dirty_flag_WE = LFB_CLR | LFB_CACHEWE;
    
    // output assignments
    assign LFB_DIRTYFLAG = dirty_flag_Q;
    assign LFB_DATAOUT = linefill_buffer_Q;

endmodule
