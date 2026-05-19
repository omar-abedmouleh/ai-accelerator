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
 *  \brief   Contains definition of generic shift register with synchronous write, configurable reset and positive edge detection.
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

module shift_reg_edge_rst_t #(
    parameter integer BIT_WIDTH = 32'sd8,
    parameter [BIT_WIDTH-1:0] DEFAULT_VALUE = {BIT_WIDTH{1'b0}},
    parameter [0:0] RESET_LEVEL = 1'b0,
    parameter [0:0] RESET_SYNC = 1'b0,
    parameter [0:0] CODASIP_POSEDGE_TYPE = 1'b1
) (
    input  logic CLK,
    input  logic RST,
    input  logic D,
    output logic Q
);
    // local register holding the stored value
    logic [BIT_WIDTH-1:0] Q_reg;

    // local wire to hold shifted value
    logic [BIT_WIDTH-1:0] shift_D_wire;

    generate
        if ( BIT_WIDTH == 32'sd1 ) begin : ONEBIT
            assign shift_D_wire = D;
        end else begin : MULTIBIT
            assign shift_D_wire = {D, Q_reg[BIT_WIDTH-1:1]};
        end
    endgenerate

    generate
        if ( RESET_SYNC ) begin : SYNC
            always_ff @( posedge CLK ) begin
                if ( RST == RESET_LEVEL ) begin
                    Q_reg <= DEFAULT_VALUE;
                end else begin
                    Q_reg <= shift_D_wire;
                end
            end
        end else if ( RESET_LEVEL ) begin : ASYNC_HIGH
            always_ff @( posedge CLK or posedge RST ) begin
                if ( RST == 1'b1 ) begin
                    Q_reg <= DEFAULT_VALUE;
                end else begin
                    Q_reg <= shift_D_wire;
                end
            end
        end else begin : ASYNC_LOW
            always_ff @( posedge CLK or negedge RST ) begin
                if ( RST == 1'b0 ) begin
                    Q_reg <= DEFAULT_VALUE;
                end else begin
                    Q_reg <= shift_D_wire;
                end
            end
        end
    endgenerate

    generate
        if ( CODASIP_POSEDGE_TYPE == 1'b1 ) begin : DETECT_POS_EDGE
            // positive edge detection
            assign Q = Q_reg[1] & (~Q_reg[0]);
        end else begin : DETECT_POSNEG_EDGE
            // both edges detection
            assign Q = Q_reg[1] ^ Q_reg[0];
        end
    endgenerate
endmodule: shift_reg_edge_rst_t
