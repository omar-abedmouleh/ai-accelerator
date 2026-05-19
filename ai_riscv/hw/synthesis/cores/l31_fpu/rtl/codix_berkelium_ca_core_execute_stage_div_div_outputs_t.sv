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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_div_div_outputs_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_div_div_outputs_t(
    input  logic [5:0] r_counter_Q,
    input  logic [32:0] r_div_Q,
    input  logic [7:0] r_op_Q,
    input  logic [32:0] r_rem_Q,
    input  logic r_sign_Q,
    input  logic [1:0] r_state_Q,
    output logic s_busy_o_D,
    output logic [31:0] s_rd_data_o_D,
    output logic s_rd_valid_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic [32:0] result_B0;
    // signal/wire
    logic [32:0] result_neg_B0;
    // signal/wire
    logic [32:0] result_raw_B0;

    // data-path code:
    assign result_raw_B0 = ((((r_op_Q == 8'h3f) | (r_op_Q == 8'h40))) ? r_div_Q : r_rem_Q);
    assign result_B0 = result_raw_B0;
    assign result_neg_B0 = (-result_B0);
    assign s_busy_o_D = (r_state_Q != 2'h0);
    assign s_rd_data_o_D = 32'(((r_sign_Q) ? result_neg_B0 : result_B0));
    assign s_rd_valid_o_D = ((r_state_Q == 2'h1) & (r_counter_Q == 6'h00));
endmodule: codix_berkelium_ca_core_execute_stage_div_div_outputs_t
