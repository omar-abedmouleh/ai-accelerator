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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_plc_compute_t' functional unit.
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

module codix_berkelium_ca_core_plc_compute_t(
    input  logic fetch_stage_ifb_s_full_o_Q,
    input  logic fetch_stage_ifu_s_ifu_busy_o_Q,
    input  logic s_ex1_clear_i_Q,
    input  logic s_ex1_stall_i_Q,
    input  logic s_ex_clear_i_Q,
    input  logic s_ex_stall_i_Q,
    input  logic s_flush_i_Q,
    input  logic s_id_clear_i_Q,
    output logic pipe_EX1_CLEAR_D,
    output logic pipe_EX1_STALL_D,
    output logic pipe_EX_CLEAR_D,
    output logic pipe_EX_STALL_D,
    output logic pipe_FE_STALL_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic codasip_tmp_var_0;
    // signal/wire
    logic codasip_tmp_var_1;
    // signal/wire
    logic codasip_tmp_var_2;
    // signal/wire
    logic codasip_tmp_var_3;
    // signal/wire
    logic codasip_tmp_var_4;
    // signal/wire
    logic pipe_clear_B0;
    // signal/wire
    logic pipe_stall_B0;

    // data-path code:
    assign pipe_stall_B0 = s_ex_stall_i_Q;
    assign pipe_clear_B0 = ((s_id_clear_i_Q | s_ex_clear_i_Q) | s_flush_i_Q);
    assign codasip_tmp_var_0 = pipe_clear_B0;
    assign codasip_tmp_var_1 = (!codasip_tmp_var_0) ? pipe_stall_B0 : 1'b0;
    assign codasip_tmp_var_2 = s_ex1_clear_i_Q;
    assign codasip_tmp_var_3 = (!codasip_tmp_var_2) ? s_ex1_stall_i_Q : 1'b0;
    assign codasip_tmp_var_4 = (fetch_stage_ifb_s_full_o_Q | fetch_stage_ifu_s_ifu_busy_o_Q);
    assign pipe_EX1_CLEAR_D = codasip_tmp_var_2 ? 1'b1 : 1'b0;
    assign pipe_EX1_STALL_D = codasip_tmp_var_3 ? 1'b1 : 1'b0;
    assign pipe_EX_CLEAR_D = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign pipe_EX_STALL_D = codasip_tmp_var_1 ? 1'b1 : 1'b0;
    assign pipe_FE_STALL_D = codasip_tmp_var_4 ? 1'b1 : 1'b0;
endmodule: codix_berkelium_ca_core_plc_compute_t
