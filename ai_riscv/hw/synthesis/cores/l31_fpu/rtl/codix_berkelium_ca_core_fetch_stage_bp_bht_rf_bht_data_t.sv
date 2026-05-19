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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_bp_bht_rf_bht_data_t' CodAL register file.
 *           size: 128
 *           address width: 7 bits
 *           data width: 2 bits
 *           reset: yes
 *           number of read data ports: 2
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

module codix_berkelium_ca_core_fetch_stage_bp_bht_rf_bht_data_t(
    input  logic CLK,
    input  logic RST,
    input  logic p0_RE,
    input  logic [6:0] p0_RA,
    input  logic u0_RE,
    input  logic [6:0] u0_RA,
    input  logic w0_WE,
    input  logic [6:0] w0_WA,
    input  logic [1:0] w0_D,
    output logic [1:0] p0_Q,
    output logic [1:0] u0_Q
);
    localparam integer SIZE = 32'h00000080;
    localparam [1:0] DEFAULT_VALUE = 2'h3;
    // memory storage
    logic [1:0] RAM[0:SIZE-1];

    generate
        genvar ii;
        for ( ii = 32'sd0; ii < SIZE; ii = ii + 32'sd1 ) begin : WRITE_PROC
            always_ff @( posedge CLK or negedge RST ) begin
                if ( RST == 1'b0 ) begin
                    RAM[ii] <= DEFAULT_VALUE;
                end else if ( (w0_WE == 1'b1) && (w0_WA == ii[6:0]) ) begin
                    RAM[ii] <= w0_D;
                end
            end
        end
    endgenerate

    assign p0_Q = (p0_RE == 1'b1) ? RAM[p0_RA] : 2'h0;
    assign u0_Q = (u0_RE == 1'b1) ? RAM[u0_RA] : 2'h0;
endmodule: codix_berkelium_ca_core_fetch_stage_bp_bht_rf_bht_data_t
