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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_control_fpu_t' pipeline controller.
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

module codix_berkelium_ca_core_control_fpu_t(
    input  logic CONTROL_CLEAR_D,
    input  logic CONTROL_STALL_D,
    input  logic ROB_CLEAR_D,
    output logic CONTROL_CLEAR_Q,
    output logic CONTROL_STALL_Q,
    output logic ROB_CLEAR_Q
);
    // data-path code:
    assign ROB_CLEAR_Q = ROB_CLEAR_D;
    assign CONTROL_CLEAR_Q = CONTROL_CLEAR_D;
    assign CONTROL_STALL_Q = CONTROL_STALL_D;
endmodule: codix_berkelium_ca_core_control_fpu_t
