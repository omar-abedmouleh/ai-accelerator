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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_bp_btb_rf_jtb_data_t' CodAL register file.
 *           size: 16
 *           address width: 4 bits
 *           data width: 31 bits
 *           reset: no
 *           number of read data ports: 1
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

module codix_berkelium_ca_core_fetch_stage_bp_btb_rf_jtb_data_t(
    input  logic CLK,
    input  logic p0_RE,
    input  logic [3:0] p0_RA,
    input  logic w0_WE,
    input  logic [3:0] w0_WA,
    input  logic [30:0] w0_D,
    output logic [30:0] p0_Q
);
    localparam integer SIZE = 32'h00000010;
    // memory storage
    logic [30:0] RAM[0:SIZE-1];

    always @( posedge CLK ) begin: WRITE_PROC
        if ( w0_WE == 1'b1 ) begin
            RAM[w0_WA] <= w0_D;
        end
    end

    assign p0_Q = (p0_RE == 1'b1) ? RAM[p0_RA] : 31'h00000000;
endmodule: codix_berkelium_ca_core_fetch_stage_bp_btb_rf_jtb_data_t
