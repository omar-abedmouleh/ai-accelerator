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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_ifb_fifo_outputs_t' functional unit.
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

module codix_berkelium_ca_core_fetch_stage_ifb_fifo_outputs_t(
    input  logic r_empty_Q,
    input  logic r_full_Q,
    input  logic [1:0] r_read_ptr_Q,
    input  logic [105:0] rf_fifo_r_Q,
    output logic [1:0] rf_fifo_r_RA,
    output logic rf_fifo_r_RE,
    output logic s_empty_o_D,
    output logic s_full_o_D,
    output logic [105:0] s_q_o_D
);
    // data-path code:
    assign rf_fifo_r_RA = r_read_ptr_Q;
    assign rf_fifo_r_RE = 1'b1;
    assign s_empty_o_D = r_empty_Q;
    assign s_full_o_D = r_full_Q;
    assign s_q_o_D = rf_fifo_r_Q;
endmodule: codix_berkelium_ca_core_fetch_stage_ifb_fifo_outputs_t
