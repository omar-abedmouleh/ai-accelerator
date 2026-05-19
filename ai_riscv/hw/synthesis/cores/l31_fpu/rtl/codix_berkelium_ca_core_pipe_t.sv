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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_pipe_t' pipeline controller.
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

module codix_berkelium_ca_core_pipe_t(
    input  logic EX1_CLEAR_D,
    input  logic EX1_STALL_D,
    input  logic EX_CLEAR_D,
    input  logic EX_STALL_D,
    input  logic FE_STALL_D,
    output logic EX1_CLEAR_Q,
    output logic EX1_STALL_Q,
    output logic EX_CLEAR_Q,
    output logic EX_STALL_Q,
    output logic FE_STALL_Q
);
    // data-path code:
    assign FE_STALL_Q = FE_STALL_D;
    assign EX_CLEAR_Q = EX_CLEAR_D;
    assign EX_STALL_Q = EX_STALL_D;
    assign EX1_CLEAR_Q = EX1_CLEAR_D;
    assign EX1_STALL_Q = EX1_STALL_D;
endmodule: codix_berkelium_ca_core_pipe_t
