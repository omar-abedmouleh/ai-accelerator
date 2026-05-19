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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_rf_gpr_t' CodAL register file with BSC support.
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

module codix_berkelium_ca_core_rf_gpr_t(
    input  logic CLK,
    input  logic RST,
    input  logic [4:0] BSC_A,
    input  logic [31:0] BSC_D,
    input  logic BSC_UPDATE,
    input  logic DEBUG_MODE,
    input  logic [4:0] r0_RA,
    input  logic r0_RE,
    input  logic [4:0] r1_RA,
    input  logic r1_RE,
    input  logic [4:0] r2_RA,
    input  logic r2_RE,
    input  logic [31:0] w0_D,
    input  logic [4:0] w0_WA,
    input  logic w0_WE,
    input  logic [31:0] w1_D,
    input  logic [4:0] w1_WA,
    input  logic w1_WE,
    output logic [31:0] BSC_Q,
    output logic [31:0] r0_Q,
    output logic [31:0] r1_Q,
    output logic [31:0] r2_Q
);
    // additional declarations:
    logic inner_rf_gpr_r0_RE;
    logic [4:0] inner_rf_gpr_r0_RA;
    logic inner_rf_gpr_r1_RE;
    logic [4:0] inner_rf_gpr_r1_RA;
    logic inner_rf_gpr_r2_RE;
    logic [4:0] inner_rf_gpr_r2_RA;
    logic inner_rf_gpr_w1_WE;
    logic [4:0] inner_rf_gpr_w1_WA;
    logic [31:0] inner_rf_gpr_w1_D;
    logic inner_rf_gpr_w0_WE;
    logic [4:0] inner_rf_gpr_w0_WA;
    logic [31:0] inner_rf_gpr_w0_D;
    logic [31:0] inner_rf_gpr_r0_Q;
    logic [31:0] inner_rf_gpr_r1_Q;
    logic [31:0] inner_rf_gpr_r2_Q;

    // child instances inside CodAL register file with BSC support:
    // CodAL register file instance:
    codix_berkelium_ca_core_rf_gpr_inner_rf_gpr_t inner_rf_gpr (
        .CLK(CLK),
        .RST(RST),
        .r0_RE(inner_rf_gpr_r0_RE),
        .r0_RA(inner_rf_gpr_r0_RA),
        .r1_RE(inner_rf_gpr_r1_RE),
        .r1_RA(inner_rf_gpr_r1_RA),
        .r2_RE(inner_rf_gpr_r2_RE),
        .r2_RA(inner_rf_gpr_r2_RA),
        .w1_WE(inner_rf_gpr_w1_WE),
        .w1_WA(inner_rf_gpr_w1_WA),
        .w1_D(inner_rf_gpr_w1_D),
        .w0_WE(inner_rf_gpr_w0_WE),
        .w0_WA(inner_rf_gpr_w0_WA),
        .w0_D(inner_rf_gpr_w0_D),
        .r0_Q(inner_rf_gpr_r0_Q),
        .r1_Q(inner_rf_gpr_r1_Q),
        .r2_Q(inner_rf_gpr_r2_Q)
    );

    // data-path code:
    assign inner_rf_gpr_r0_RE = (DEBUG_MODE == 1'b1) ? 1'b1 : r0_RE;
    assign inner_rf_gpr_r0_RA = (DEBUG_MODE == 1'b1) ? BSC_A : r0_RA;
    assign r0_Q = inner_rf_gpr_r0_Q;
    assign inner_rf_gpr_w1_WE = (DEBUG_MODE == 1'b1) ? BSC_UPDATE : w1_WE;
    assign inner_rf_gpr_w1_WA = (DEBUG_MODE == 1'b1) ? BSC_A : w1_WA;
    assign inner_rf_gpr_w1_D = (DEBUG_MODE == 1'b1) ? BSC_D : w1_D;
    assign inner_rf_gpr_r1_RE = r1_RE;
    assign inner_rf_gpr_r1_RA = r1_RA;
    assign r1_Q = inner_rf_gpr_r1_Q;
    assign inner_rf_gpr_r2_RE = r2_RE;
    assign inner_rf_gpr_r2_RA = r2_RA;
    assign r2_Q = inner_rf_gpr_r2_Q;
    assign inner_rf_gpr_w0_WE = w0_WE;
    assign inner_rf_gpr_w0_WA = w0_WA;
    assign inner_rf_gpr_w0_D = w0_D;
    assign BSC_Q = inner_rf_gpr_r0_Q;
endmodule: codix_berkelium_ca_core_rf_gpr_t
