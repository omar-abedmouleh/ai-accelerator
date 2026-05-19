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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_move_t' CodAL module.
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

module codix_berkelium_ca_core_execute_stage_fpu_move_t(
    input  logic [4:0] s_ROB_ptr_i_D,
    input  logic [31:0] s_srcA_i_D,
    input  logic s_start_i_D,
    output logic s_done_o_Q,
    output logic [31:0] s_result_o_Q,
    output logic [4:0] s_ROB_ptr_o_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic s_start_i;
    // CodAL signal/wire
    logic [31:0] s_srcA_i;
    // CodAL signal/wire
    logic [4:0] s_ROB_ptr_i;
    // CodAL signal/wire
    logic [31:0] s_result_o;
    // CodAL signal/wire
    logic [4:0] s_ROB_ptr_o;
    // CodAL signal/wire
    logic s_done_o;

    // child instances inside CodAL module:
    // instance of 's_start_i' CodAL signal/wire: (single driver)
    assign s_start_i = s_start_i_D;
    // instance of 's_srcA_i' CodAL signal/wire: (single driver)
    assign s_srcA_i = s_srcA_i_D;
    // instance of 's_ROB_ptr_i' CodAL signal/wire: (single driver)
    assign s_ROB_ptr_i = s_ROB_ptr_i_D;
    // instance of 's_result_o' CodAL signal/wire: (parent port driver(s))
    assign s_result_o_Q = s_result_o;
    // instance of 's_ROB_ptr_o' CodAL signal/wire: (parent port driver(s))
    assign s_ROB_ptr_o_Q = s_ROB_ptr_o;
    // instance of 's_done_o' CodAL signal/wire: (parent port driver(s))
    assign s_done_o_Q = s_done_o;
    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_fpu_move_compute_move_t compute_move (
        .s_ROB_ptr_i_Q(s_ROB_ptr_i),
        .s_srcA_i_Q(s_srcA_i),
        .s_start_i_Q(s_start_i),
        .s_done_o_D(s_done_o),
        .s_result_o_D(s_result_o),
        .s_ROB_ptr_o_D(s_ROB_ptr_o)
    );

endmodule: codix_berkelium_ca_core_execute_stage_fpu_move_t
