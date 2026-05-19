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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_crf_int_exc_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_crf_int_exc_t #(
    parameter [31:0] nmi_handler_p = 32'h20000004
) (
    input  logic [9:0] r_csr_dcsr_Q,
    input  logic [31:0] r_csr_mie_Q,
    input  logic [31:0] r_csr_mip_Q,
    input  logic [31:0] r_csr_mstatus_Q,
    input  logic [31:0] r_csr_mtvec_Q,
    input  logic r_csr_tcontrol_Q,
    input  logic r_fce_wfi_valid_Q,
    input  logic [1:0] r_prv_Q,
    input  logic r_wfi_ce_Q,
    input  logic [11:0] s_csr_addr_i_Q,
    input  logic s_csr_valid_i_Q,
    input  logic s_csr_we_i_Q,
    input  logic [31:0] s_exc_tval_i_Q,
    input  logic [4:0] s_exc_type_i_Q,
    input  logic [4:0] s_exc_type_Q,
    input  logic s_exc_valid_i_Q,
    input  logic s_exc_valid_Q,
    input  logic s_fce_ebreak_Q,
    input  logic s_fce_ecall_Q,
    input  logic [4:0] s_fce_exc_type_Q,
    input  logic s_fce_exc_valid_Q,
    input  logic s_fce_illegal_Q,
    input  logic s_fce_insufficient_permissions_Q,
    input  logic s_fce_wfi_valid_Q,
    input  logic [31:0] s_instr_addr_i_Q,
    input  logic s_instr_valid_excint_i_Q,
    input  logic [31:0] s_int_addr_i_Q,
    input  logic s_int_safe_to_take_i_Q,
    input  logic [4:0] s_int_type_Q,
    input  logic s_int_valid_Q,
    input  logic s_intexc_valid_Q,
    input  logic s_nmi_i_Q,
    input  logic [31:0] s_nmi_mtval_i_Q,
    input  logic s_nmi_source_i_Q,
    input  logic s_ocd_busy_i_Q,
    input  logic s_ocd_progbuf_mode_i_Q,
    input  logic [7:0] s_op_i_Q,
    input  logic s_read_illegal_Q,
    input  logic s_wfi_delay_i_Q,
    output logic r_fce_wfi_valid_D,
    output logic r_fce_wfi_valid_WE,
    output logic [4:0] s_exc_type_D,
    output logic [4:0] s_exc_type_o_D,
    output logic s_exc_valid_D,
    output logic s_exc_valid_o_D,
    output logic [4:0] s_int_type_D,
    output logic s_int_valid_D,
    output logic s_int_valid_pending_D,
    output logic [31:0] s_intexc_cause_D,
    output logic [31:0] s_intexc_epc_D,
    output logic [31:0] s_intexc_mstatus_D,
    output logic [31:0] s_intexc_tcontrol_D,
    output logic [31:0] s_intexc_trap_addr_D,
    output logic s_intexc_trap_valid_D,
    output logic [31:0] s_intexc_tval_D,
    output logic s_intexc_valid_D,
    output logic s_take_nmi_o_D,
    output logic s_wfi_delay_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic [31:0] cause_B0;
    // signal/wire
    logic codasip_tmp_var_0;
    // signal/wire
    logic csr_exc_valid_B0;
    // signal/wire
    logic illegal_debug_access_B0;
    // signal/wire
    logic illegal_fcsr_access_B0;
    // signal/wire
    logic [11:0] int_pending_B0;
    // signal/wire
    logic [31:0] int_tval_B0;
    // signal/wire
    logic is_int_B0;
    // signal/wire
    logic m_en_B0;
    // signal/wire
    logic [11:0] m_int_B0;
    // signal/wire
    logic read_only_violation_B0;
    // signal/wire
    logic s_intexc_trap_valid_D_ACT_wire;
    // signal/wire
    logic step_mode_int_disable_B0;
    // signal/wire
    logic take_int_B0;
    // signal/wire
    logic take_m_B0;
    // signal/wire
    logic take_nmi_B0;
    // signal/wire
    logic [31:0] tval_B0;
    // signal/wire
    logic [11:0] valid_int_pending_B0;

    // data-path code:
    assign int_pending_B0 = 12'((r_csr_mip_Q & r_csr_mie_Q));
    assign m_en_B0 = ((r_prv_Q != 2'h3) || r_csr_mstatus_Q[3]);
    assign m_int_B0 = int_pending_B0;
    assign take_m_B0 = (m_en_B0 && (m_int_B0 != 12'h000));
    assign valid_int_pending_B0 = ((take_m_B0) ? m_int_B0 : 12'h000);
    assign step_mode_int_disable_B0 = ((~r_csr_dcsr_Q[9]) & r_csr_dcsr_Q[0]);
    assign is_int_B0 = take_m_B0;
    assign take_int_B0 = ((((is_int_B0 & s_int_safe_to_take_i_Q) & (~s_ocd_progbuf_mode_i_Q)) & (~s_ocd_busy_i_Q)) & (~step_mode_int_disable_B0));
    assign take_nmi_B0 = ((((s_nmi_i_Q & s_int_safe_to_take_i_Q) & (~s_ocd_progbuf_mode_i_Q)) & (~s_ocd_busy_i_Q)) & (~step_mode_int_disable_B0));
    assign int_tval_B0 = (((take_nmi_B0 & (~s_nmi_source_i_Q))) ? s_nmi_mtval_i_Q : 32'h00000000);
    assign read_only_violation_B0 = ((s_csr_addr_i_Q[11:10] == 2'h3) && s_csr_we_i_Q);
    assign illegal_debug_access_B0 = (((((s_op_i_Q == 8'h34) || (s_op_i_Q == 8'h35)) || (s_op_i_Q == 8'h36)) && (!s_ocd_progbuf_mode_i_Q)) && ((s_csr_addr_i_Q == 12'h7b0) || (s_csr_addr_i_Q == 12'h7b1)));
    assign illegal_fcsr_access_B0 = (((s_csr_addr_i_Q >= 12'h001) & (s_csr_addr_i_Q <= 12'h003)) & (r_csr_mstatus_Q[14:13] == 2'h0));
    assign csr_exc_valid_B0 = (s_csr_valid_i_Q & (((((illegal_debug_access_B0 | illegal_fcsr_access_B0) | s_fce_insufficient_permissions_Q) | s_read_illegal_Q) | read_only_violation_B0) | s_fce_illegal_Q));
    assign cause_B0 = 32'(((s_int_valid_Q) ? (63'h0000000080000000 | 63'(s_int_type_Q)) : 63'(unsigned'(32'(((s_exc_valid_Q) ? 32'(s_exc_type_Q) : 32'h00000000))))));
    assign tval_B0 = (((s_int_valid_Q | ((~s_exc_valid_i_Q) & s_fce_ecall_Q))) ? int_tval_B0 : ((s_fce_ebreak_Q) ? s_instr_addr_i_Q : s_exc_tval_i_Q));
    assign codasip_tmp_var_0 = s_intexc_valid_Q;
    assign s_intexc_trap_valid_D_ACT_wire = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_fce_wfi_valid_D = ((r_fce_wfi_valid_Q) ? (!r_wfi_ce_Q) : (((s_wfi_delay_i_Q | s_intexc_valid_Q)) ? 1'b0 : s_fce_wfi_valid_Q));
    assign r_fce_wfi_valid_WE = 1'b1;
    assign s_exc_type_D = ((s_exc_valid_i_Q) ? s_exc_type_i_Q : ((s_fce_exc_valid_Q) ? s_fce_exc_type_Q : 5'h02));
    assign s_exc_type_o_D = s_exc_type_Q;
    assign s_exc_valid_D = (((s_exc_valid_i_Q | s_fce_exc_valid_Q) | csr_exc_valid_B0) & s_instr_valid_excint_i_Q);
    assign s_exc_valid_o_D = (s_exc_valid_Q | take_nmi_B0);
    assign s_int_type_D = ((take_nmi_B0) ? ((s_nmi_source_i_Q) ? 5'h11 : 5'h10) : ((valid_int_pending_B0[11]) ? 5'h0b : ((valid_int_pending_B0[3]) ? 5'h03 : ((valid_int_pending_B0[7]) ? 5'h07 : 5'h00))));
    assign s_int_valid_D = (take_int_B0 | take_nmi_B0);
    assign s_int_valid_pending_D = ((((take_m_B0 | s_nmi_i_Q) & (~s_ocd_progbuf_mode_i_Q)) & (~s_ocd_busy_i_Q)) & (~step_mode_int_disable_B0));
    assign s_intexc_cause_D = codasip_tmp_var_0 ? cause_B0 : 32'h00000000;
    assign s_intexc_epc_D = codasip_tmp_var_0 ? ((s_int_valid_Q) ? s_int_addr_i_Q : s_instr_addr_i_Q) : 32'h00000000;
    assign s_intexc_mstatus_D = codasip_tmp_var_0 ? {r_csr_mstatus_Q[31:13], r_prv_Q, r_csr_mstatus_Q[10:8], r_csr_mstatus_Q[3], r_csr_mstatus_Q[6:4], 1'b0, r_csr_mstatus_Q[2:0]} : 32'h00000000;
    assign s_intexc_tcontrol_D = codasip_tmp_var_0 ? 32'(unsigned'(8'({r_csr_tcontrol_Q, 7'h00}))) : 32'h00000000;
    assign s_intexc_trap_addr_D = codasip_tmp_var_0 ? ((take_nmi_B0) ? nmi_handler_p : {(((r_csr_mtvec_Q[0] & s_int_valid_Q)) ? (r_csr_mtvec_Q[31:2] + 30'(cause_B0[4:0])) : r_csr_mtvec_Q[31:2]), 2'h0}) : 32'h00000000;
    assign s_intexc_trap_valid_D = s_intexc_trap_valid_D_ACT_wire;
    assign s_intexc_tval_D = codasip_tmp_var_0 ? tval_B0 : 32'h00000000;
    assign s_intexc_valid_D = (s_int_valid_Q | s_exc_valid_Q);
    assign s_take_nmi_o_D = take_nmi_B0;
    assign s_wfi_delay_D = (s_fce_wfi_valid_Q & s_wfi_delay_i_Q);
endmodule: codix_berkelium_ca_core_execute_stage_crf_int_exc_t
