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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_float2int_control_f2i_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_fpu_float2int_control_f2i_t(
    input  logic s_ack_i_Q,
    input  logic s_flush_i_Q,
    output logic pipe_f2i_F2I_CLEAR_D,
    output logic pipe_f2i_F2I_STALL_D,
    output logic s_ready_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic codasip_tmp_var_0;
    // signal/wire
    logic codasip_tmp_var_1;

    // data-path code:
    assign codasip_tmp_var_0 = s_flush_i_Q;
    assign codasip_tmp_var_1 = (!codasip_tmp_var_0) ? (~s_ack_i_Q) : 1'b0;
    assign pipe_f2i_F2I_CLEAR_D = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign pipe_f2i_F2I_STALL_D = codasip_tmp_var_1 ? 1'b1 : 1'b0;
    assign s_ready_o_D = s_ack_i_Q;
endmodule: codix_berkelium_ca_core_execute_stage_fpu_float2int_control_f2i_t
