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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_rf_gpr_inner_rf_gpr_t' CodAL register file.
 *           size: 32
 *           address width: 5 bits
 *           data width: 32 bits
 *           reset: yes
 *           number of read data ports: 3
 *           number of write data ports: 2
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

module codix_berkelium_ca_core_rf_gpr_inner_rf_gpr_t(
    input  logic CLK,
    input  logic RST,
    input  logic r0_RE,
    input  logic [4:0] r0_RA,
    input  logic r1_RE,
    input  logic [4:0] r1_RA,
    input  logic r2_RE,
    input  logic [4:0] r2_RA,
    input  logic w1_WE,
    input  logic [4:0] w1_WA,
    input  logic [31:0] w1_D,
    input  logic w0_WE,
    input  logic [4:0] w0_WA,
    input  logic [31:0] w0_D,
    output logic [31:0] r0_Q,
    output logic [31:0] r1_Q,
    output logic [31:0] r2_Q
);
    localparam integer SIZE = 32'h00000020;
    localparam [31:0] DEFAULT_VALUE = 32'h00000000;
    // memory storage
    logic [31:0] RAM[0:SIZE-1];

    generate
        genvar ii;
        for ( ii = 32'sd0; ii < SIZE; ii = ii + 32'sd1 ) begin : WRITE_PROC
            always_ff @( posedge CLK or negedge RST ) begin
                if ( RST == 1'b0 ) begin
                    RAM[ii] <= DEFAULT_VALUE;
                end else if ( (w1_WE == 1'b1) && (w1_WA == ii[4:0]) ) begin
                    RAM[ii] <= w1_D;
                end else if ( (w0_WE == 1'b1) && (w0_WA == ii[4:0]) ) begin
                    RAM[ii] <= w0_D;
                end
            end
        end
    endgenerate

    assign r0_Q = (r0_RE == 1'b1) ? RAM[r0_RA] : 32'h00000000;
    assign r1_Q = (r1_RE == 1'b1) ? RAM[r1_RA] : 32'h00000000;
    assign r2_Q = (r2_RE == 1'b1) ? RAM[r2_RA] : 32'h00000000;
endmodule: codix_berkelium_ca_core_rf_gpr_inner_rf_gpr_t
