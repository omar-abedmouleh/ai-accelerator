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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_fe_t' functional unit.
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

module codix_berkelium_ca_core_fetch_stage_fe_t(
    input  logic [31:0] bp_s_addr_o_Q,
    input  logic [1:0] bp_s_taken_o_Q,
    input  logic execute_stage_bru_s_branch_bht_update_o_Q,
    input  logic execute_stage_bru_s_is_jump_o_Q,
    input  logic [31:0] execute_stage_bru_s_rd_data_o_Q,
    input  logic [31:0] execute_stage_crf_s_csr_addr_o_Q,
    input  logic execute_stage_crf_s_csr_valid_o_Q,
    input  logic [31:0] execute_stage_crf_s_trap_addr_o_Q,
    input  logic execute_stage_crf_s_trap_valid_o_Q,
    input  logic [31:0] execute_stage_ocd_s_ocd_addr_o_Q,
    input  logic execute_stage_ocd_s_ocd_busy_o_Q,
    input  logic execute_stage_ocd_s_ocd_progbuf_mode_o_Q,
    input  logic execute_stage_ocd_s_ocd_valid_o_Q,
    input  logic ifb_s_full_o_Q,
    input  logic ifu_s_bus_busy_o_Q,
    input  logic [31:0] ifu_s_data_addr_o_Q,
    input  logic [31:0] ifu_s_data_o_Q,
    input  logic [1:0] ifu_s_data_valid_o_Q,
    input  logic [4:0] ifu_s_exc_type_o_Q,
    input  logic ifu_s_exc_valid_o_Q,
    input  logic ifu_s_ifu_busy_o_Q,
    input  logic [31:0] npc_s_ifu_addr_o_Q,
    input  logic [1:0] npc_s_ifu_valid_o_Q,
    input  logic [31:0] npc_s_pc_addr_o_Q,
    input  logic [30:0] p_boot_addr_Q,
    input  logic r_cpu_stall_Q,
    input  logic r_ex_bp_noincr_Q,
    input  logic [31:0] r_fe_bp_addr_Q,
    input  logic [1:0] r_fe_bp_taken_Q,
    input  logic [31:0] r_PC_Q,
    input  logic r_reset_init_Q,
    input  logic r_wfi_ce_Q,
    input  logic s_ex_bp_flush_line_Q,
    input  logic s_ex_bp_flush_Q,
    input  logic s_ex_branch_bht_update_Q,
    input  logic s_ex_branch_btb_update_Q,
    input  logic [31:0] s_ex_branch_instr_addr_Q,
    input  logic s_ex_branch_is_rvc_Q,
    input  logic s_ex_branch_miss_Q,
    input  logic [31:0] s_ex_branch_offset_Q,
    input  logic s_ex_branch_taken_Q,
    input  logic [31:0] s_ex_branch_target_addr_Q,
    input  logic s_ex_fence_valid_Q,
    input  logic s_ex_return_link_Q,
    input  logic s_ex_return_update_Q,
    input  logic s_fe_flush_Q,
    input  logic s_flush_Q,
    input  logic s_wfi_prevent_fetch_Q,
    output logic bp_s_branch_bht_update_i_D,
    output logic bp_s_branch_btb_update_i_D,
    output logic [31:0] bp_s_branch_instr_addr_i_D,
    output logic bp_s_branch_is_rvc_i_D,
    output logic [31:0] bp_s_branch_offset_i_D,
    output logic bp_s_flush_i_D,
    output logic bp_s_flush_line_i_D,
    output logic [31:0] bp_s_instr_addr_i_D,
    output logic bp_s_instr_valid_i_D,
    output logic bp_s_is_branch_i_D,
    output logic bp_s_is_jump_i_D,
    output logic bp_s_link_return_i_D,
    output logic bp_s_no_increment_i_D,
    output logic [31:0] bp_s_return_add_i_D,
    output logic bp_s_return_update_i_D,
    output logic bp_s_taken_i_D,
    output logic [31:0] ifb_s_addr_i_D,
    output logic [31:0] ifb_s_bp_addr_i_D,
    output logic [1:0] ifb_s_bp_taken_i_D,
    output logic [31:0] ifb_s_data_i_D,
    output logic [4:0] ifb_s_exc_type_i_D,
    output logic ifb_s_exc_valid_i_D,
    output logic ifb_s_push_i_D,
    output logic [1:0] ifb_s_valid_i_D,
    output logic ifu_s_ack_i_D,
    output logic [31:0] ifu_s_addr_i_D,
    output logic [1:0] ifu_s_addr_valid_i_D,
    output logic ifu_s_flush_i_D,
    output logic ifu_s_ocd_progbuf_mode_i_D,
    output logic [31:0] npc_s_bp_addr_i_D,
    output logic npc_s_bp_valid_i_D,
    output logic [31:0] npc_s_branch_addr_i_D,
    output logic npc_s_branch_valid_i_D,
    output logic [31:0] npc_s_csr_addr_i_D,
    output logic npc_s_csr_valid_i_D,
    output logic [31:0] npc_s_ocd_addr_i_D,
    output logic npc_s_ocd_valid_i_D,
    output logic [31:0] npc_s_pc_addr_i_D,
    output logic npc_s_stall_i_D,
    output logic [31:0] npc_s_trap_addr_i_D,
    output logic npc_s_trap_valid_i_D,
    output logic [31:0] r_fe_bp_addr_D,
    output logic r_fe_bp_addr_WE,
    output logic [1:0] r_fe_bp_taken_D,
    output logic r_fe_bp_taken_WE,
    output logic [31:0] r_PC_D,
    output logic r_PC_WE,
    output logic s_fe_flush_D,
    output logic s_perf_ifu_stall_D
);
    // data-path code:
    assign bp_s_branch_bht_update_i_D = s_ex_branch_bht_update_Q;
    assign bp_s_branch_btb_update_i_D = s_ex_branch_btb_update_Q;
    assign bp_s_branch_instr_addr_i_D = s_ex_branch_instr_addr_Q;
    assign bp_s_branch_is_rvc_i_D = s_ex_branch_is_rvc_Q;
    assign bp_s_branch_offset_i_D = s_ex_branch_offset_Q;
    assign bp_s_flush_i_D = s_ex_bp_flush_Q;
    assign bp_s_flush_line_i_D = s_ex_bp_flush_line_Q;
    assign bp_s_instr_addr_i_D = {r_PC_Q[31:1], 1'b0};
    assign bp_s_instr_valid_i_D = ((~ifb_s_full_o_Q) & (~ifu_s_ifu_busy_o_Q));
    assign bp_s_is_branch_i_D = execute_stage_bru_s_branch_bht_update_o_Q;
    assign bp_s_is_jump_i_D = execute_stage_bru_s_is_jump_o_Q;
    assign bp_s_link_return_i_D = s_ex_return_link_Q;
    assign bp_s_no_increment_i_D = r_ex_bp_noincr_Q;
    assign bp_s_return_add_i_D = execute_stage_bru_s_rd_data_o_Q;
    assign bp_s_return_update_i_D = s_ex_return_update_Q;
    assign bp_s_taken_i_D = s_ex_branch_taken_Q;
    assign ifb_s_addr_i_D = ifu_s_data_addr_o_Q;
    assign ifb_s_bp_addr_i_D = r_fe_bp_addr_Q;
    assign ifb_s_bp_taken_i_D = r_fe_bp_taken_Q;
    assign ifb_s_data_i_D = ifu_s_data_o_Q;
    assign ifb_s_exc_type_i_D = ifu_s_exc_type_o_Q;
    assign ifb_s_exc_valid_i_D = ifu_s_exc_valid_o_Q;
    assign ifb_s_push_i_D = ((ifu_s_data_valid_o_Q != 2'h0) && (!s_fe_flush_Q));
    assign ifb_s_valid_i_D = ifu_s_data_valid_o_Q;
    assign ifu_s_ack_i_D = (!ifb_s_full_o_Q);
    assign ifu_s_addr_i_D = npc_s_ifu_addr_o_Q;
    assign ifu_s_addr_valid_i_D = (npc_s_ifu_valid_o_Q & {32'd2{((((((~s_wfi_prevent_fetch_Q) & (~ifb_s_full_o_Q)) & (~r_reset_init_Q)) & r_wfi_ce_Q) & (~execute_stage_ocd_s_ocd_busy_o_Q)) & (~r_cpu_stall_Q))}});
    assign ifu_s_flush_i_D = s_fe_flush_Q;
    assign ifu_s_ocd_progbuf_mode_i_D = execute_stage_ocd_s_ocd_progbuf_mode_o_Q;
    assign npc_s_bp_addr_i_D = bp_s_addr_o_Q;
    assign npc_s_bp_valid_i_D = (bp_s_taken_o_Q[0] | bp_s_taken_o_Q[1]);
    assign npc_s_branch_addr_i_D = s_ex_branch_target_addr_Q;
    assign npc_s_branch_valid_i_D = s_ex_branch_miss_Q;
    assign npc_s_csr_addr_i_D = execute_stage_crf_s_csr_addr_o_Q;
    assign npc_s_csr_valid_i_D = (execute_stage_crf_s_csr_valid_o_Q | s_ex_fence_valid_Q);
    assign npc_s_ocd_addr_i_D = execute_stage_ocd_s_ocd_addr_o_Q;
    assign npc_s_ocd_valid_i_D = execute_stage_ocd_s_ocd_valid_o_Q;
    assign npc_s_pc_addr_i_D = r_PC_Q;
    assign npc_s_stall_i_D = (((execute_stage_ocd_s_ocd_busy_o_Q | ifb_s_full_o_Q) | ifu_s_ifu_busy_o_Q) | r_cpu_stall_Q);
    assign npc_s_trap_addr_i_D = execute_stage_crf_s_trap_addr_o_Q;
    assign npc_s_trap_valid_i_D = execute_stage_crf_s_trap_valid_o_Q;
    assign r_fe_bp_addr_D = bp_s_addr_o_Q;
    assign r_fe_bp_addr_WE = 1'b1;
    assign r_fe_bp_taken_D = bp_s_taken_o_Q;
    assign r_fe_bp_taken_WE = 1'b1;
    assign r_PC_D = ((r_reset_init_Q) ? {p_boot_addr_Q, 1'b0} : npc_s_pc_addr_o_Q);
    assign r_PC_WE = 1'b1;
    assign s_fe_flush_D = s_flush_Q;
    assign s_perf_ifu_stall_D = ifu_s_bus_busy_o_Q;
endmodule: codix_berkelium_ca_core_fetch_stage_fe_t
