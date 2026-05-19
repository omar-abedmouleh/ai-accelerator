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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_ifb_ifb_outputs_t' functional unit.
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

module codix_berkelium_ca_core_fetch_stage_ifb_ifb_outputs_t(
    input  logic fifo_s_empty_o_Q,
    input  logic fifo_s_full_o_Q,
    input  logic [105:0] fifo_s_q_o_Q,
    output logic [31:0] s_addr_o_D,
    output logic [31:0] s_bp_addr_o_D,
    output logic [1:0] s_bp_taken_o_D,
    output logic [31:0] s_data_o_D,
    output logic s_empty_o_D,
    output logic [4:0] s_exc_type_o_D,
    output logic s_exc_valid_o_D,
    output logic s_full_o_D,
    output logic [1:0] s_valid_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic [105:0] rdata_B0;

    // data-path code:
    assign rdata_B0 = fifo_s_q_o_Q;
    assign s_addr_o_D = rdata_B0[71:40];
    assign s_bp_addr_o_D = rdata_B0[105:74];
    assign s_bp_taken_o_D = rdata_B0[73:72];
    assign s_data_o_D = rdata_B0[39:8];
    assign s_empty_o_D = fifo_s_empty_o_Q;
    assign s_exc_type_o_D = rdata_B0[5:1];
    assign s_exc_valid_o_D = rdata_B0[0];
    assign s_full_o_D = fifo_s_full_o_Q;
    assign s_valid_o_D = rdata_B0[7:6];
endmodule: codix_berkelium_ca_core_fetch_stage_ifb_ifb_outputs_t
