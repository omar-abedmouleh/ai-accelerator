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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_r_csr_tdata1_t' CodAL register file.
 *           size: 8
 *           address width: 3 bits
 *           data width: 32 bits
 *           reset: yes
 *           number of read data ports: 9
 *           number of write data ports: 1
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

module codix_berkelium_ca_core_r_csr_tdata1_t(
    input  logic CLK,
    input  logic RST,
    input  logic r_RE,
    input  logic [2:0] r_RA,
    input  logic r0_RE,
    input  logic [2:0] r0_RA,
    input  logic r1_RE,
    input  logic [2:0] r1_RA,
    input  logic r2_RE,
    input  logic [2:0] r2_RA,
    input  logic r3_RE,
    input  logic [2:0] r3_RA,
    input  logic r4_RE,
    input  logic [2:0] r4_RA,
    input  logic r5_RE,
    input  logic [2:0] r5_RA,
    input  logic r6_RE,
    input  logic [2:0] r6_RA,
    input  logic r7_RE,
    input  logic [2:0] r7_RA,
    input  logic w_WE,
    input  logic [2:0] w_WA,
    input  logic [31:0] w_D,
    output logic [31:0] r_Q,
    output logic [31:0] r0_Q,
    output logic [31:0] r1_Q,
    output logic [31:0] r2_Q,
    output logic [31:0] r3_Q,
    output logic [31:0] r4_Q,
    output logic [31:0] r5_Q,
    output logic [31:0] r6_Q,
    output logic [31:0] r7_Q
);
    localparam integer SIZE = 32'h00000008;
    localparam [31:0] DEFAULT_VALUE = 32'h28001000;
    // memory storage
    logic [31:0] RAM[0:SIZE-1];

    generate
        genvar ii;
        for ( ii = 32'sd0; ii < SIZE; ii = ii + 32'sd1 ) begin : WRITE_PROC
            always_ff @( posedge CLK or negedge RST ) begin
                if ( RST == 1'b0 ) begin
                    RAM[ii] <= DEFAULT_VALUE;
                end else if ( (w_WE == 1'b1) && (w_WA == ii[2:0]) ) begin
                    RAM[ii] <= w_D;
                end
            end
        end
    endgenerate

    assign r_Q = (r_RE == 1'b1) ? RAM[r_RA] : 32'h00000000;
    assign r0_Q = (r0_RE == 1'b1) ? RAM[r0_RA] : 32'h00000000;
    assign r1_Q = (r1_RE == 1'b1) ? RAM[r1_RA] : 32'h00000000;
    assign r2_Q = (r2_RE == 1'b1) ? RAM[r2_RA] : 32'h00000000;
    assign r3_Q = (r3_RE == 1'b1) ? RAM[r3_RA] : 32'h00000000;
    assign r4_Q = (r4_RE == 1'b1) ? RAM[r4_RA] : 32'h00000000;
    assign r5_Q = (r5_RE == 1'b1) ? RAM[r5_RA] : 32'h00000000;
    assign r6_Q = (r6_RE == 1'b1) ? RAM[r6_RA] : 32'h00000000;
    assign r7_Q = (r7_RE == 1'b1) ? RAM[r7_RA] : 32'h00000000;
endmodule: codix_berkelium_ca_core_r_csr_tdata1_t
