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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_ocd_compute_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_ocd_compute_t #(
    parameter [31:0] progbuf_base_p = 32'h00020000
) (
    input  logic [29:0] r_csr_dcsr_Q,
    input  logic [31:0] r_csr_dpc_Q,
    input  logic [2:0] r_debug_state_Q,
    input  logic [1:0] r_prv_Q,
    input  logic r_step_cause_Q,
    input  logic s_debug_mode_before_req_Q,
    input  logic s_dm_active_i_Q,
    input  logic s_dm_halt_i_Q,
    input  logic s_dm_halt_Q,
    input  logic s_dm_progbuf_en_i_Q,
    input  logic [4:0] s_exc_type_i_Q,
    input  logic s_exc_valid_i_Q,
    input  logic [31:0] s_instr_addr_i_Q,
    input  logic s_instr_valid_i_Q,
    input  logic s_state_user_mode_Q,
    output logic [2:0] s_debug_after_req_value_D,
    output logic s_debug_mode_before_req_D,
    output logic [2:0] s_debug_mode_value_D,
    output logic [2:0] s_debug_req_value_D,
    output logic s_dm_progbuf_done_o_D,
    output logic s_dm_progbuf_exc_o_D,
    output logic s_hart_halted_o_D,
    output logic [31:0] s_ocd_addr_o_D,
    output logic s_ocd_busy_o_D,
    output logic [31:0] s_ocd_dcsr_o_D,
    output logic s_ocd_debug_mode_req_o_D,
    output logic [31:0] s_ocd_dpc_o_D,
    output logic s_ocd_flush_o_D,
    output logic s_ocd_progbuf_mode_o_D,
    output logic s_ocd_user_mod_req_o_D,
    output logic s_ocd_valid_o_D,
    output logic [2:0] s_progbuf_mode_value_D,
    output logic s_state_user_mode_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic [2:0] cause_B0;
    // signal/wire
    logic codasip_tmp_var_0;
    // signal/wire
    logic codasip_tmp_var_1;
    // signal/wire
    logic debug_mode_after_req_B0;
    // signal/wire
    logic debug_mode_req_B0;
    // signal/wire
    logic halt_req_B0;
    // signal/wire
    logic hw_break_req_B0;
    // signal/wire
    logic progbuf_done_B0;
    // signal/wire
    logic progbuf_exc_B0;
    // signal/wire
    logic sw_break_req_B0;
    // signal/wire
    logic user_mode_req_B0;

    // data-path code:
    assign hw_break_req_B0 = (s_exc_valid_i_Q & (s_exc_type_i_Q == 5'h19));
    assign sw_break_req_B0 = ((s_exc_valid_i_Q & (s_exc_type_i_Q == 5'h03)) & (((r_csr_dcsr_Q[13] & (r_prv_Q == 2'h3)) | (r_csr_dcsr_Q[11] & (r_prv_Q == 2'h1))) | (r_csr_dcsr_Q[10] & (r_prv_Q == 2'h0))));
    assign halt_req_B0 = (s_dm_halt_i_Q & s_instr_valid_i_Q);
    assign debug_mode_after_req_B0 = (r_debug_state_Q == 3'h2);
    assign debug_mode_req_B0 = ((s_debug_mode_before_req_Q | debug_mode_after_req_B0) & s_dm_active_i_Q);
    assign user_mode_req_B0 = ((r_debug_state_Q == 3'h3) & (!s_dm_halt_i_Q));
    assign progbuf_done_B0 = (s_exc_valid_i_Q & (r_debug_state_Q == 3'h4));
    assign progbuf_exc_B0 = (progbuf_done_B0 & (s_exc_type_i_Q != 5'h03));
    assign codasip_tmp_var_0 = s_debug_mode_before_req_Q;
    assign codasip_tmp_var_1 = (!codasip_tmp_var_0) ? debug_mode_after_req_B0 : 1'b0;
    assign cause_B0 = codasip_tmp_var_0 ? ((hw_break_req_B0) ? 3'h2 : ((sw_break_req_B0) ? 3'h1 : ((s_dm_halt_Q) ? 3'h3 : ((r_step_cause_Q) ? 3'h4 : 3'h0)))) :
        codasip_tmp_var_1 ? ((r_step_cause_Q) ? 3'h4 : 3'h0) : 3'h0;
    assign s_debug_after_req_value_D = (((!s_dm_active_i_Q)) ? 3'h0 : ((debug_mode_req_B0) ? 3'h1 : r_debug_state_Q));
    assign s_debug_mode_before_req_D = (((hw_break_req_B0 | sw_break_req_B0) | halt_req_B0) & s_state_user_mode_Q);
    assign s_debug_mode_value_D = ((s_dm_progbuf_en_i_Q) ? 3'h4 : (((!s_dm_halt_i_Q)) ? 3'h0 : r_debug_state_Q));
    assign s_debug_req_value_D = (((!s_dm_active_i_Q)) ? 3'h0 : ((s_dm_halt_i_Q) ? 3'h3 : r_debug_state_Q));
    assign s_dm_progbuf_done_o_D = progbuf_done_B0;
    assign s_dm_progbuf_exc_o_D = progbuf_exc_B0;
    assign s_hart_halted_o_D = ((r_debug_state_Q == 3'h1) | (r_debug_state_Q == 3'h3));
    assign s_ocd_addr_o_D = ((debug_mode_req_B0) ? s_instr_addr_i_Q : ((s_dm_progbuf_en_i_Q) ? progbuf_base_p : ((user_mode_req_B0) ? r_csr_dpc_Q : 32'h00000000)));
    assign s_ocd_busy_o_D = ((r_debug_state_Q == 3'h1) | (r_debug_state_Q == 3'h3));
    assign s_ocd_dcsr_o_D = {r_csr_dcsr_Q[29:7], cause_B0, r_csr_dcsr_Q[3:0], r_prv_Q};
    assign s_ocd_debug_mode_req_o_D = debug_mode_req_B0;
    assign s_ocd_dpc_o_D = s_instr_addr_i_Q;
    assign s_ocd_flush_o_D = (((debug_mode_req_B0 | s_dm_progbuf_en_i_Q) | user_mode_req_B0) | progbuf_done_B0);
    assign s_ocd_progbuf_mode_o_D = (r_debug_state_Q == 3'h4);
    assign s_ocd_user_mod_req_o_D = user_mode_req_B0;
    assign s_ocd_valid_o_D = ((debug_mode_req_B0 | s_dm_progbuf_en_i_Q) | user_mode_req_B0);
    assign s_progbuf_mode_value_D = ((progbuf_done_B0) ? 3'h3 : r_debug_state_Q);
    assign s_state_user_mode_D = (r_debug_state_Q == 3'h0);
endmodule: codix_berkelium_ca_core_execute_stage_ocd_compute_t
