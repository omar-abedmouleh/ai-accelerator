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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_ifb_ifb_update_t' functional unit.
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

module codix_berkelium_ca_core_fetch_stage_ifb_ifb_update_t(
    input  logic [31:0] s_addr_i_Q,
    input  logic [31:0] s_bp_addr_i_Q,
    input  logic [1:0] s_bp_taken_i_Q,
    input  logic [31:0] s_data_i_Q,
    input  logic [4:0] s_exc_type_i_Q,
    input  logic s_exc_valid_i_Q,
    input  logic s_flush_i_Q,
    input  logic s_pop_i_Q,
    input  logic s_push_i_Q,
    input  logic [1:0] s_valid_i_Q,
    output logic fifo_s_clear_i_D,
    output logic [105:0] fifo_s_d_i_D,
    output logic fifo_s_re_i_D,
    output logic fifo_s_we_i_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic [105:0] wdata_B0;

    // data-path code:
    assign wdata_B0 = {s_bp_addr_i_Q, s_bp_taken_i_Q, s_addr_i_Q, s_data_i_Q, s_valid_i_Q, s_exc_type_i_Q, s_exc_valid_i_Q};
    assign fifo_s_clear_i_D = s_flush_i_Q;
    assign fifo_s_d_i_D = wdata_B0;
    assign fifo_s_re_i_D = s_pop_i_Q;
    assign fifo_s_we_i_D = s_push_i_Q;
endmodule: codix_berkelium_ca_core_fetch_stage_ifb_ifb_update_t
