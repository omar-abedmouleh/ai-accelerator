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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_plc_t' CodAL module.
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

module codix_berkelium_ca_core_plc_t(
    input  logic fetch_stage_ifb_s_full_o_Q,
    input  logic fetch_stage_ifu_s_ifu_busy_o_Q,
    input  logic s_ex1_clear_i_D,
    input  logic s_ex1_stall_i_D,
    input  logic s_ex_clear_i_D,
    input  logic s_ex_stall_i_D,
    input  logic s_flush_i_D,
    input  logic s_id_clear_i_D,
    output logic pipe_EX1_CLEAR_D,
    output logic pipe_EX1_STALL_D,
    output logic pipe_EX_CLEAR_D,
    output logic pipe_EX_STALL_D,
    output logic pipe_FE_STALL_D
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic s_flush_i;
    // CodAL signal/wire
    logic s_id_clear_i;
    // CodAL signal/wire
    logic s_ex_stall_i;
    // CodAL signal/wire
    logic s_ex_clear_i;
    // CodAL signal/wire
    logic s_ex1_stall_i;
    // CodAL signal/wire
    logic s_ex1_clear_i;

    // child instances inside CodAL module:
    // instance of 's_flush_i' CodAL signal/wire: (single driver)
    assign s_flush_i = s_flush_i_D;
    // instance of 's_id_clear_i' CodAL signal/wire: (single driver)
    assign s_id_clear_i = s_id_clear_i_D;
    // instance of 's_ex_stall_i' CodAL signal/wire: (single driver)
    assign s_ex_stall_i = s_ex_stall_i_D;
    // instance of 's_ex_clear_i' CodAL signal/wire: (single driver)
    assign s_ex_clear_i = s_ex_clear_i_D;
    // instance of 's_ex1_stall_i' CodAL signal/wire: (single driver)
    assign s_ex1_stall_i = s_ex1_stall_i_D;
    // instance of 's_ex1_clear_i' CodAL signal/wire: (single driver)
    assign s_ex1_clear_i = s_ex1_clear_i_D;
    // functional unit instance:
    codix_berkelium_ca_core_plc_compute_t compute (
        .fetch_stage_ifb_s_full_o_Q(fetch_stage_ifb_s_full_o_Q),
        .fetch_stage_ifu_s_ifu_busy_o_Q(fetch_stage_ifu_s_ifu_busy_o_Q),
        .s_ex1_clear_i_Q(s_ex1_clear_i),
        .s_ex1_stall_i_Q(s_ex1_stall_i),
        .s_ex_clear_i_Q(s_ex_clear_i),
        .s_ex_stall_i_Q(s_ex_stall_i),
        .s_flush_i_Q(s_flush_i),
        .s_id_clear_i_Q(s_id_clear_i),
        .pipe_EX1_CLEAR_D(pipe_EX1_CLEAR_D),
        .pipe_EX1_STALL_D(pipe_EX1_STALL_D),
        .pipe_EX_CLEAR_D(pipe_EX_CLEAR_D),
        .pipe_EX_STALL_D(pipe_EX_STALL_D),
        .pipe_FE_STALL_D(pipe_FE_STALL_D)
    );

endmodule: codix_berkelium_ca_core_plc_t
