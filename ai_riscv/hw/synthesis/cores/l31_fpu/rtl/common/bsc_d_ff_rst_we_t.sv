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
 *  \brief   Contains definition of generic boundary-scan register with synchronous write, configurable reset and with write enable signal.
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

module bsc_d_ff_rst_we_t #(
    parameter integer BIT_WIDTH = 32'sd8,
    parameter [BIT_WIDTH-1:0] DEFAULT_VALUE = {BIT_WIDTH{1'b0}},
    parameter [0:0] RESET_LEVEL = 1'b0,
    parameter [0:0] RESET_SYNC = 1'b0
) (
    input  logic CLK,
    input  logic RST,
    input  logic [(BIT_WIDTH)-1:0] BSC_D,
    input  logic BSC_UPDATE,
    input  logic [(BIT_WIDTH)-1:0] D,
    input  logic DEBUG_MODE,
    input  logic WE,
    output logic [(BIT_WIDTH)-1:0] BSC_Q,
    output logic [(BIT_WIDTH)-1:0] Q
);

    // additional declarations:
    logic data_reg_WE;
    logic [(BIT_WIDTH)-1:0] data_reg_D;
    logic [(BIT_WIDTH)-1:0] data_reg_Q;

    // child instances inside register with BSC support:
    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(BIT_WIDTH),
        .DEFAULT_VALUE(DEFAULT_VALUE),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) data_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(data_reg_WE),
        .D(data_reg_D),
        .Q(data_reg_Q)
    );

    // data-path code:
    assign data_reg_D = (DEBUG_MODE == 1'b1) ? BSC_D : D;
    assign data_reg_WE = (DEBUG_MODE == 1'b1) ? BSC_UPDATE : WE;
    assign Q = data_reg_Q;
    assign BSC_Q = data_reg_Q;
endmodule: bsc_d_ff_rst_we_t
