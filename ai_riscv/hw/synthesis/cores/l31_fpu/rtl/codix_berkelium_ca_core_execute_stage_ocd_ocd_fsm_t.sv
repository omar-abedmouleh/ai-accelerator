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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_ocd_ocd_fsm_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_ocd_ocd_fsm_t(
    input  logic r_csr_dcsr_Q,
    input  logic [2:0] r_debug_state_Q,
    input  logic r_step_cause_Q,
    input  logic [2:0] s_debug_after_req_value_Q,
    input  logic s_debug_mode_before_req_Q,
    input  logic [2:0] s_debug_mode_value_Q,
    input  logic [2:0] s_debug_req_value_Q,
    input  logic s_instr_commit_i_Q,
    input  logic [2:0] s_progbuf_mode_value_Q,
    input  logic s_state_user_mode_Q,
    input  logic [2:0] s_user_mode_value_Q,
    output logic [2:0] r_debug_state_D,
    output logic r_debug_state_WE,
    output logic r_step_cause_D,
    output logic r_step_cause_WE,
    output logic [2:0] s_user_mode_value_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic [2:0] codasip_tmp_var_0;
    // signal/wire
    logic [2:0] debug_state_next_B0;
    // signal/wire
    logic step_req_B0;

    // data-path code:
    assign step_req_B0 = ((r_csr_dcsr_Q & s_instr_commit_i_Q) & s_state_user_mode_Q);
    assign codasip_tmp_var_0 = r_debug_state_Q;
    always_comb begin
        unique case ( codasip_tmp_var_0 )
            3'h0: debug_state_next_B0 = s_user_mode_value_Q;
            3'h1: debug_state_next_B0 = s_debug_req_value_Q;
            3'h2: debug_state_next_B0 = s_debug_after_req_value_Q;
            3'h3: debug_state_next_B0 = s_debug_mode_value_Q;
            3'h4: debug_state_next_B0 = s_progbuf_mode_value_Q;
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: debug_state_next_B0 = 3'bxxx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    assign r_debug_state_D = debug_state_next_B0;
    assign r_debug_state_WE = 1'b1;
    assign r_step_cause_D = ((s_state_user_mode_Q) ? step_req_B0 : r_step_cause_Q);
    assign r_step_cause_WE = 1'b1;
    assign s_user_mode_value_D = ((s_debug_mode_before_req_Q) ? 3'h1 : ((step_req_B0) ? 3'h2 : r_debug_state_Q));
endmodule: codix_berkelium_ca_core_execute_stage_ocd_ocd_fsm_t
