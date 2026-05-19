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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_add_sub_control_add_sub_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_fpu_add_sub_control_add_sub_t(
    input  logic r_compute_fin_Q,
    input  logic r_postnorm_fin_Q,
    input  logic s_ack_i_Q,
    input  logic s_flush_i_Q,
    output logic pipe_add_sub_COMPUTE_CLEAR_D,
    output logic pipe_add_sub_COMPUTE_STALL_D,
    output logic pipe_add_sub_POSTNORM_CLEAR_D,
    output logic pipe_add_sub_POSTNORM_STALL_D,
    output logic pipe_add_sub_ROUNDING_CLEAR_D,
    output logic pipe_add_sub_ROUNDING_STALL_D,
    output logic s_ready_o_D
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
    logic compute_stall_B0;
    // signal/wire
    logic postnorm_stall_B0;

    // data-path code:
    assign postnorm_stall_B0 = ((~s_ack_i_Q) && r_postnorm_fin_Q);
    assign compute_stall_B0 = (postnorm_stall_B0 && r_compute_fin_Q);
    assign codasip_tmp_var_0 = s_flush_i_Q;
    assign codasip_tmp_var_1 = (!codasip_tmp_var_0) ? compute_stall_B0 : 1'b0;
    assign codasip_tmp_var_2 = (!codasip_tmp_var_0) ? postnorm_stall_B0 : 1'b0;
    assign codasip_tmp_var_3 = (!codasip_tmp_var_0) ? (~s_ack_i_Q) : 1'b0;
    assign pipe_add_sub_COMPUTE_CLEAR_D = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign pipe_add_sub_COMPUTE_STALL_D = codasip_tmp_var_1 ? 1'b1 : 1'b0;
    assign pipe_add_sub_POSTNORM_CLEAR_D = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign pipe_add_sub_POSTNORM_STALL_D = codasip_tmp_var_2 ? 1'b1 : 1'b0;
    assign pipe_add_sub_ROUNDING_CLEAR_D = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign pipe_add_sub_ROUNDING_STALL_D = codasip_tmp_var_3 ? 1'b1 : 1'b0;
    assign s_ready_o_D = (~compute_stall_B0);
endmodule: codix_berkelium_ca_core_execute_stage_fpu_add_sub_control_add_sub_t
