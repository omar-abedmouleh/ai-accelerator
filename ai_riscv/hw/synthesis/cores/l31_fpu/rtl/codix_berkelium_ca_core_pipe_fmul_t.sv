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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_pipe_fmul_t' pipeline controller.
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

module codix_berkelium_ca_core_pipe_fmul_t(
    input  logic MUL_CLEAR_D,
    input  logic POSTNORM1_CLEAR_D,
    input  logic POSTNORM2_CLEAR_D,
    input  logic ROUNDING_CLEAR_D,
    output logic MUL_CLEAR_Q,
    output logic POSTNORM1_CLEAR_Q,
    output logic POSTNORM2_CLEAR_Q,
    output logic ROUNDING_CLEAR_Q
);
    // data-path code:
    assign MUL_CLEAR_Q = MUL_CLEAR_D;
    assign POSTNORM1_CLEAR_Q = POSTNORM1_CLEAR_D;
    assign POSTNORM2_CLEAR_Q = POSTNORM2_CLEAR_D;
    assign ROUNDING_CLEAR_Q = ROUNDING_CLEAR_D;
endmodule: codix_berkelium_ca_core_pipe_fmul_t
