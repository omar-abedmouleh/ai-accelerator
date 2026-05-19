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
 *  \file   codasip_linefill_buffer_ro.v
 *  \author Jakub Drbal
 *  \email  support@codasip.com
 *  \date   Wed Sep 2 2015
 *  \brief  switch between cache control and bus interface unit
 */

module codasip_linefill_buffer_ro #(
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
    // control
    input wire LFB_RAMWE,
    input wire LFB_CLR,
    // offset
    input wire [OFFSET_BITS-1:0]      LFB_CACHEOFFSET,
    // the offset input is unused for configuration with one RAM word per cache line
    // verilator lint_off UNUSED
    input wire [RAM_OFFSET_BITS-1:0]  LFB_RAMOFFSET,
    // verilator lint_on UNUSED
    // data
    input wire  [RAM_DATA_BITS-1:0]   LFB_RAMDATAIN,
    output reg  [CACHE_DATA_BITS-1:0] LFB_CACHEDATAOUT,
    output wire                       LFB_CACHEDATAOUTVAL,
    output wire [CACHE_LINE_BITS-1:0] LFB_DATAOUT
);

    localparam integer WORDS_PER_LINE = CACHE_LINE_BITS/CACHE_DATA_BITS;
    localparam integer RAM_WORDS_PER_LINE = CACHE_LINE_BITS/RAM_DATA_BITS;

    // linefill buffer
    wire [RAM_WORDS_PER_LINE-1:0] linefill_buffer_reg_WE;
    wire [CACHE_LINE_BITS-1:0] linefill_buffer_reg_Q;
    // data output valid
    wire data_out_val_reg_WE;
    wire data_out_val_reg_D;
    wire data_out_val_reg_Q;

    // data output valid register
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) data_out_val_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(data_out_val_reg_WE),
        .D(data_out_val_reg_D),
        .Q(data_out_val_reg_Q)
    );

    // generate linefill buffer registers
    generate
        genvar ii;
        for ( ii = 32'sd0; ii < RAM_WORDS_PER_LINE; ii = ii + 32'sd1 ) begin : g_linefill
            d_ff_rst_we_t #(
                .BIT_WIDTH(RAM_DATA_BITS),
                .DEFAULT_VALUE({RAM_DATA_BITS{1'b0}}),
                .RESET_LEVEL(RESET_LEVEL),
                .RESET_SYNC(RESET_SYNC)
            ) buffer_reg (
                .CLK(CLK),
                .RST(RST),
                .WE(linefill_buffer_reg_WE[ii]),
                .D(LFB_RAMDATAIN),
                .Q(linefill_buffer_reg_Q[(ii*RAM_DATA_BITS)+:RAM_DATA_BITS])
            );
        end
    endgenerate

    // internal register drivers
    generate if (RAM_WORDS_PER_LINE == 32'sd1) begin
        // the whole cache line is fetched using one memory transaction
        assign linefill_buffer_reg_WE = LFB_RAMWE;
        assign data_out_val_reg_D = (~LFB_CLR & linefill_buffer_reg_WE);
    end else begin
        // multiple RAM words per line, even more cache words per line
        assign linefill_buffer_reg_WE = {{RAM_WORDS_PER_LINE-1{1'b0}}, LFB_RAMWE} << LFB_RAMOFFSET;
        assign data_out_val_reg_D = (LFB_RAMWE == 1'b1) && (LFB_CLR == 1'b0) &&
            (LFB_CACHEOFFSET[OFFSET_BITS-1-:RAM_OFFSET_BITS] == LFB_RAMOFFSET);
    end endgenerate

    assign data_out_val_reg_WE = (LFB_CLR | LFB_RAMWE);

    // output drivers
    assign LFB_DATAOUT = linefill_buffer_reg_Q;
    assign LFB_CACHEDATAOUTVAL = data_out_val_reg_Q;
    always @(*) begin : data_out_mux
        integer i;
        reg [CACHE_DATA_BITS-1:0] data_out [WORDS_PER_LINE-1:0];

        for (i = 32'sd0; i < WORDS_PER_LINE; i = i + 32'sd1) begin
            data_out[i] = linefill_buffer_reg_Q[(i*CACHE_DATA_BITS)+:CACHE_DATA_BITS];
        end
        LFB_CACHEDATAOUT = data_out[LFB_CACHEOFFSET];
    end

endmodule
