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
 *  \file    codasip_d_ff_rst_bwe_t.v
 *  \author  Codasip (c) HW generator
 *  \email   support@codasip.com
 *  \date    Jun 01 2020
 *  \brief   Contains definition of generic register with synchronous write, configurable reset and with write enable signal.
 */

module codasip_d_ff_rst_bwe_t #(
    parameter integer BIT_WIDTH  = 32'sd8,
    parameter integer BYTE_NUM   = 32'd1,
    parameter [0:0]   RESET_LEVEL = 1'b0,
    parameter [0:0]   RESET_SYNC  = 1'b0
) (
    input  wire CLK,
    input  wire RST,
    input  wire [BYTE_NUM-1:0] WE,
    input  wire [BIT_WIDTH-1:0] D,
    output wire [BIT_WIDTH-1:0] Q
);

    localparam integer BYTE_BITS = BIT_WIDTH / BYTE_NUM;

    generate
        genvar i;
        for (i = 32'd0; i < BYTE_NUM; i = i + 32'd1) begin : g_subblock
            d_ff_rst_we_t #(
                .BIT_WIDTH(BYTE_BITS),
                .DEFAULT_VALUE({BYTE_BITS{1'b0}}),
                .RESET_LEVEL(RESET_LEVEL),
                .RESET_SYNC(RESET_SYNC)
            ) subblock (
                .CLK(CLK),
                .RST(RST),
                .WE(WE[i]),
                .D(D[(i*BYTE_BITS)+:BYTE_BITS]),
                .Q(Q[(i*BYTE_BITS)+:BYTE_BITS])
            );
        end
    endgenerate

endmodule // codasip_d_ff_rst_bwe_t
