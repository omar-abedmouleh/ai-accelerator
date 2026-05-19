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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_ifb_fifo_rf_fifo_t' CodAL register file.
 *           size: 4
 *           address width: 2 bits
 *           data width: 106 bits
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

module codix_berkelium_ca_core_fetch_stage_ifb_fifo_rf_fifo_t(
    input  logic CLK,
    input  logic r_RE,
    input  logic [1:0] r_RA,
    input  logic w_WE,
    input  logic [1:0] w_WA,
    input  logic [105:0] w_D,
    output logic [105:0] r_Q
);
    localparam integer SIZE = 32'h00000004;
    // memory storage
    logic [105:0] RAM[0:SIZE-1];

    always @( posedge CLK ) begin: WRITE_PROC
        if ( w_WE == 1'b1 ) begin
            RAM[w_WA] <= w_D;
        end
    end

    assign r_Q = (r_RE == 1'b1) ? RAM[r_RA] : {106{1'b0}};
endmodule: codix_berkelium_ca_core_fetch_stage_ifb_fifo_rf_fifo_t
