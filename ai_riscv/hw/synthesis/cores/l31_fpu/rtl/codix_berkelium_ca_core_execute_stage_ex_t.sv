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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_ex_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_ex_t(
    input  logic [31:0] alu_s_rd_data_o_Q,
    input  logic alu_s_take_branch_o_Q,
    input  logic [31:0] b_unit_s_rd_data_o_Q,
    input  logic bru_s_branch_bht_update_o_Q,
    input  logic bru_s_branch_btb_update_o_Q,
    input  logic bru_s_branch_miss_o_Q,
    input  logic bru_s_branch_taken_o_Q,
    input  logic [31:0] bru_s_branch_target_addr_o_Q,
    input  logic [31:0] bru_s_rd_data_o_Q,
    input  logic bru_s_rd_we_o_Q,
    input  logic crf_r_fce_wfi_valid_Q,
    input  logic [31:0] crf_s_csr_addr_o_Q,
    input  logic crf_s_csr_flush_o_Q,
    input  logic crf_s_csr_valid_o_Q,
    input  logic crf_s_exc_flush_o_Q,
    input  logic [4:0] crf_s_exc_type_o_Q,
    input  logic crf_s_exc_valid_o_Q,
    input  logic crf_s_flush_o_Q,
    input  logic crf_s_instr_1_valid_i_Q,
    input  logic crf_s_int_flush_o_Q,
    input  logic crf_s_int_stall_o_Q,
    input  logic [31:0] crf_s_intexc_trap_addr_Q,
    input  logic crf_s_intexc_trap_valid_Q,
    input  logic [11:0] crf_s_perf_waddr_o_Q,
    input  logic [31:0] crf_s_perf_wdata_o_Q,
    input  logic [1:0] crf_s_perf_we_o_Q,
    input  logic [31:0] crf_s_rdata_o_Q,
    input  logic crf_s_take_nmi_o_Q,
    input  logic crf_s_wfi_o_Q,
    input  logic [11:0] csr_s_csr_addr_o_Q,
    input  logic csr_s_csr_rd_we_o_Q,
    input  logic csr_s_csr_re_o_Q,
    input  logic csr_s_csr_valid_o_Q,
    input  logic [31:0] csr_s_csr_wdata_o_Q,
    input  logic csr_s_csr_we_o_Q,
    input  logic div_s_busy_o_Q,
    input  logic [31:0] div_s_rd_data_o_Q,
    input  logic div_s_rd_valid_o_Q,
    input  logic fetch_stage_ifu_s_bus_busy_o_Q,
    input  logic fpu_s_busy_o_Q,
    input  logic [31:0] fpu_s_exc_instr_addr_o_Q,
    input  logic [31:0] fpu_s_exc_tval_o_Q,
    input  logic [4:0] fpu_s_exc_type_o_Q,
    input  logic fpu_s_exc_valid_o_Q,
    input  logic [4:0] fpu_s_flags_o_Q,
    input  logic [5:0] fpu_s_rd_addr_o_Q,
    input  logic [31:0] fpu_s_rd_data_o_Q,
    input  logic [31:0] fpu_s_rdx_valid_o_Q,
    input  logic fpu_s_ready_o_Q,
    input  logic fpu_s_valid_o_Q,
    input  logic [31:0] ira_r_return_address_Q,
    input  logic ira_s_ex0_retired_i_Q,
    input  logic ira_s_ex1_retired_i_Q,
    input  logic [31:0] ira_s_int_addr_o_Q,
    input  logic lsu_s_fin_busy_o_Q,
    input  logic [1:0] lsu_s_fin_exc_extra_o_Q,
    input  logic [31:0] lsu_s_fin_exc_tval_o_Q,
    input  logic [4:0] lsu_s_fin_exc_type_o_Q,
    input  logic lsu_s_fin_exc_valid_o_Q,
    input  logic [7:0] lsu_s_fin_op_o_Q,
    input  logic [5:0] lsu_s_fin_rd_addr_o_Q,
    input  logic [31:0] lsu_s_fin_rd_data_o_Q,
    input  logic lsu_s_fin_rd_valid_o_Q,
    input  logic lsu_s_fin_rd_we_o_Q,
    input  logic lsu_s_is_load_Q,
    input  logic [1:0] lsu_s_req_exc_extra_o_Q,
    input  logic [31:0] lsu_s_req_exc_tval_o_Q,
    input  logic [4:0] lsu_s_req_exc_type_o_Q,
    input  logic lsu_s_req_exc_valid_o_Q,
    input  logic lsu_s_waited_transfer_o_Q,
    input  logic [31:0] mul_s_rd_data_o_Q,
    input  logic ocd_s_dm_progbuf_done_o_Q,
    input  logic ocd_s_dm_progbuf_exc_o_Q,
    input  logic ocd_s_hart_halted_o_Q,
    input  logic [31:0] ocd_s_ocd_addr_o_Q,
    input  logic ocd_s_ocd_busy_o_Q,
    input  logic [31:0] ocd_s_ocd_dcsr_o_Q,
    input  logic ocd_s_ocd_debug_mode_req_o_Q,
    input  logic [31:0] ocd_s_ocd_dpc_o_Q,
    input  logic ocd_s_ocd_flush_o_Q,
    input  logic ocd_s_ocd_progbuf_mode_o_Q,
    input  logic ocd_s_ocd_step_commited_o_Q,
    input  logic ocd_s_ocd_step_mode_o_Q,
    input  logic ocd_s_ocd_user_mod_req_o_Q,
    input  logic ocd_s_ocd_valid_o_Q,
    input  logic [127:0] p_int_Q,
    input  logic p_msip_Q,
    input  logic p_mtip_Q,
    input  logic [31:0] p_nmi_mtval_Q,
    input  logic p_nmi_Q,
    input  logic [9:0] r_csr_dcsr_Q,
    input  logic [2:0] r_csr_fcsr_Q,
    input  logic [31:0] r_csr_mie_Q,
    input  logic [31:0] r_csr_mip_Q,
    input  logic r_csr_mstatus_Q,
    input  logic [3:0] r_ex1_fu_Q,
    input  logic [31:0] r_ex1_instr_addr_Q,
    input  logic r_ex1_is_rvc_Q,
    input  logic [5:0] r_ex1_rd_addr_Q,
    input  logic [31:0] r_ex_bp_addr_Q,
    input  logic r_ex_bp_taken_Q,
    input  logic [11:0] r_ex_csr_addr_Q,
    input  logic [31:0] r_ex_exc_tval_Q,
    input  logic [4:0] r_ex_exc_type_Q,
    input  logic r_ex_exc_valid_Q,
    input  logic [5:0] r_ex_fpu_op_Q,
    input  logic [3:0] r_ex_fu_Q,
    input  logic [1:0] r_ex_fu_s1_source_Q,
    input  logic [1:0] r_ex_fu_s2_source_Q,
    input  logic [1:0] r_ex_fu_s3_source_Q,
    input  logic [31:0] r_ex_imm_Q,
    input  logic [31:0] r_ex_instr_addr_Q,
    input  logic r_ex_instr_valid_Q,
    input  logic r_ex_is_rvc_Q,
    input  logic [31:0] r_ex_lsu_addr_Q,
    input  logic [7:0] r_ex_op_Q,
    input  logic [5:0] r_ex_rd_addr_Q,
    input  logic [2:0] r_ex_rm_Q,
    input  logic [5:0] r_ex_rs1_addr_Q,
    input  logic [5:0] r_ex_rs2_addr_Q,
    input  logic [5:0] r_ex_rs3_addr_Q,
    input  logic r_nmi_i_Q,
    input  logic [31:0] r_nmi_mtval_Q,
    input  logic r_nmi_source_Q,
    input  logic [1:0] r_prv_Q,
    input  logic [31:0] r_syscall_addr_Q,
    input  logic r_wfi_ce_Q,
    input  logic [31:0] rf_fr_r1_Q,
    input  logic [31:0] rf_fr_r2_Q,
    input  logic [31:0] rf_fr_r3_Q,
    input  logic [31:0] rf_gpr_r1_Q,
    input  logic [31:0] rf_gpr_r2_Q,
    input  logic s_dm_active_Q,
    input  logic s_dm_halt_Q,
    input  logic s_dm_progbuf_en_Q,
    input  logic s_eviction_error_Q,
    input  logic s_ex_bp_restart_Q,
    input  logic s_ex_branch_miss_Q,
    input  logic [31:0] s_ex_branch_target_addr_Q,
    input  logic s_ex_fpu_busy_Q,
    input  logic s_ex_stall_Q,
    input  logic s_flush_Q,
    input  logic [5:0] s_rd0_addr_Q,
    input  logic [31:0] s_rd0_data_Q,
    input  logic s_rd0_we_Q,
    input  logic s_rd0_write_Q,
    input  logic [5:0] s_rd1_addr_Q,
    input  logic [31:0] s_rd1_data_Q,
    input  logic s_rd1_we_Q,
    input  logic s_rd1_write_Q,
    output logic alu_compute_ACT,
    output logic [7:0] alu_s_op_i_D,
    output logic [31:0] alu_s_s1_data_i_D,
    output logic [31:0] alu_s_s2_data_i_D,
    output logic b_unit_compute_ACT,
    output logic [7:0] b_unit_s_op_i_D,
    output logic [31:0] b_unit_s_s1_data_i_D,
    output logic [31:0] b_unit_s_s2_data_i_D,
    output logic bru_compute_ACT,
    output logic [31:0] bru_s_bp_addr_i_D,
    output logic bru_s_bp_taken_i_D,
    output logic [31:0] bru_s_imm_i_D,
    output logic [31:0] bru_s_instr_addr_i_D,
    output logic bru_s_is_rvc_i_D,
    output logic [7:0] bru_s_op_i_D,
    output logic [31:0] bru_s_rs1_data_i_D,
    output logic bru_s_take_branch_i_D,
    output logic [11:0] crf_s_csr_addr_i_D,
    output logic crf_s_csr_re_i_D,
    output logic crf_s_csr_valid_i_D,
    output logic [31:0] crf_s_csr_wdata_i_D,
    output logic crf_s_csr_we_i_D,
    output logic [127:0] crf_s_eip_i_D,
    output logic [1:0] crf_s_exc_extra_i_D,
    output logic [31:0] crf_s_exc_tval_i_D,
    output logic [4:0] crf_s_exc_type_i_D,
    output logic crf_s_exc_valid_i_D,
    output logic [4:0] crf_s_fflags_i_D,
    output logic crf_s_fs_context_change_i_D,
    output logic [3:0] crf_s_fu1_i_D,
    output logic crf_s_instr_1_valid_i_D,
    output logic [31:0] crf_s_instr_addr_i_D,
    output logic crf_s_instr_valid_excint_i_D,
    output logic crf_s_instr_valid_i_D,
    output logic [31:0] crf_s_int_addr_i_D,
    output logic crf_s_int_safe_to_take_i_D,
    output logic crf_s_nmi_i_D,
    output logic [31:0] crf_s_nmi_mtval_i_D,
    output logic crf_s_nmi_source_i_D,
    output logic crf_s_ocd_busy_i_D,
    output logic [31:0] crf_s_ocd_dcsr_i_D,
    output logic crf_s_ocd_debug_mode_req_i_D,
    output logic [31:0] crf_s_ocd_dpc_i_D,
    output logic crf_s_ocd_flush_i_D,
    output logic crf_s_ocd_progbuf_mode_i_D,
    output logic crf_s_ocd_user_mode_req_i_D,
    output logic [7:0] crf_s_op_i_D,
    output logic crf_s_sip_i_D,
    output logic crf_s_tip_i_D,
    output logic crf_s_wfi_delay_i_D,
    output logic crf_s_write_fflags_i_D,
    output logic [11:0] csr_s_csr_addr_i_D,
    output logic [5:0] csr_s_csr_s1_addr_i_D,
    output logic [1:0] csr_s_csr_s1_source_i_D,
    output logic [31:0] csr_s_csr_wdata_i_D,
    output logic [7:0] csr_s_op_i_D,
    output logic div_div_compute_ACT,
    output logic div_s_div_ce_i_D,
    output logic div_s_flush_i_D,
    output logic [7:0] div_s_op_i_D,
    output logic [31:0] div_s_s1_data_i_D,
    output logic [31:0] div_s_s2_data_i_D,
    output logic fpu_s_ack_i_D,
    output logic [4:0] fpu_s_exc_type_i_D,
    output logic fpu_s_exc_valid_i_D,
    output logic fpu_s_flush_i_D,
    output logic [2:0] fpu_s_frm_i_D,
    output logic [31:0] fpu_s_instr_addr_i_D,
    output logic [31:0] fpu_s_instr_i_D,
    output logic [5:0] fpu_s_op_i_D,
    output logic [5:0] fpu_s_rd_addr_i_D,
    output logic [2:0] fpu_s_rm_i_D,
    output logic [5:0] fpu_s_s1_addr_i_D,
    output logic [31:0] fpu_s_s1_data_i_D,
    output logic [5:0] fpu_s_s2_addr_i_D,
    output logic [31:0] fpu_s_s2_data_i_D,
    output logic [5:0] fpu_s_s3_addr_i_D,
    output logic [31:0] fpu_s_s3_data_i_D,
    output logic fpu_s_valid_i_D,
    output logic [31:0] ira_s_ex0_branch_target_i_D,
    output logic [31:0] ira_s_ex0_csr_addr_i_D,
    output logic [31:0] ira_s_ex0_instr_addr_i_D,
    output logic [31:0] ira_s_ex0_intexc_addr_i_D,
    output logic ira_s_ex0_is_branch_i_D,
    output logic ira_s_ex0_is_csr_i_D,
    output logic ira_s_ex0_is_intexc_i_D,
    output logic ira_s_ex0_is_rvc_i_D,
    output logic ira_s_ex0_retired_i_D,
    output logic [31:0] ira_s_ex1_instr_addr_i_D,
    output logic ira_s_ex1_is_rvc_i_D,
    output logic ira_s_ex1_retired_i_D,
    output logic [31:0] ira_s_ocd_addr_i_D,
    output logic ira_s_ocd_stop_count_i_D,
    output logic ira_s_ocd_valid_i_D,
    output logic [31:0] lsu_s_addr_i_D,
    output logic lsu_s_clear_i_D,
    output logic lsu_s_ocd_mmode_i_D,
    output logic [7:0] lsu_s_op_i_D,
    output logic [5:0] lsu_s_rd_addr_i_D,
    output logic [31:0] lsu_s_syscall_addr_i_D,
    output logic [31:0] lsu_s_wdata_i_D,
    output logic mul_compute_ACT,
    output logic [7:0] mul_s_op_i_D,
    output logic [31:0] mul_s_s1_data_i_D,
    output logic [31:0] mul_s_s2_data_i_D,
    output logic ocd_s_dm_active_i_D,
    output logic ocd_s_dm_halt_i_D,
    output logic ocd_s_dm_progbuf_en_i_D,
    output logic [4:0] ocd_s_exc_type_i_D,
    output logic ocd_s_exc_valid_i_D,
    output logic [31:0] ocd_s_instr_addr_i_D,
    output logic ocd_s_instr_commit_i_D,
    output logic ocd_s_instr_valid_i_D,
    output logic [3:0] r_ex1_fu_D,
    output logic r_ex1_fu_WE,
    output logic [31:0] r_ex1_instr_addr_D,
    output logic r_ex1_instr_addr_WE,
    output logic r_ex1_is_rvc_D,
    output logic r_ex1_is_rvc_WE,
    output logic [5:0] r_ex1_rd_addr_D,
    output logic r_ex1_rd_addr_WE,
    output logic r_nmi_i_D,
    output logic r_nmi_i_WE,
    output logic [31:0] r_nmi_mtval_D,
    output logic r_nmi_mtval_WE,
    output logic r_nmi_source_D,
    output logic r_nmi_source_WE,
    output logic r_wfi_ce_D,
    output logic r_wfi_ce_WE,
    output logic [4:0] rf_fr_r1_RA,
    output logic rf_fr_r1_RE,
    output logic [4:0] rf_fr_r2_RA,
    output logic rf_fr_r2_RE,
    output logic [4:0] rf_fr_r3_RA,
    output logic rf_fr_r3_RE,
    output logic [31:0] rf_fr_w_D,
    output logic [4:0] rf_fr_w_WA,
    output logic rf_fr_w_WE,
    output logic [4:0] rf_gpr_r1_RA,
    output logic rf_gpr_r1_RE,
    output logic [4:0] rf_gpr_r2_RA,
    output logic rf_gpr_r2_RE,
    output logic [31:0] rf_gpr_w0_D,
    output logic [4:0] rf_gpr_w0_WA,
    output logic rf_gpr_w0_WE,
    output logic [31:0] rf_gpr_w1_D,
    output logic [4:0] rf_gpr_w1_WA,
    output logic rf_gpr_w1_WE,
    output logic s_dm_progbuf_done_D,
    output logic s_dm_progbuf_exc_D,
    output logic s_ex1_clear_D,
    output logic s_ex1_stall_D,
    output logic s_ex_bp_flush_D,
    output logic s_ex_bp_flush_line_D,
    output logic s_ex_bp_restart_D,
    output logic s_ex_branch_bht_update_D,
    output logic s_ex_branch_btb_update_D,
    output logic [31:0] s_ex_branch_instr_addr_D,
    output logic s_ex_branch_is_rvc_D,
    output logic s_ex_branch_miss_D,
    output logic [31:0] s_ex_branch_offset_D,
    output logic s_ex_branch_taken_D,
    output logic [31:0] s_ex_branch_target_addr_D,
    output logic s_ex_clear_D,
    output logic s_ex_fence_valid_D,
    output logic s_ex_fpu_busy_D,
    output logic [5:0] s_ex_p0_addr_D,
    output logic s_ex_p0_we_D,
    output logic [5:0] s_ex_p1_addr_D,
    output logic s_ex_p1_we_D,
    output logic s_ex_progbuf_mode_D,
    output logic [5:0] s_ex_rd_addr_D,
    output logic [31:0] s_ex_rd_data_D,
    output logic s_ex_rd_we_D,
    output logic s_ex_return_link_D,
    output logic s_ex_return_update_D,
    output logic s_ex_stall_D,
    output logic s_flush_D,
    output logic [31:0] s_fpu_dst_regs_D,
    output logic s_hart_halted_D,
    output logic s_perf_branch_miss_D,
    output logic s_perf_csr_flush_D,
    output logic s_perf_div_stall_D,
    output logic s_perf_exc_flush_D,
    output logic s_perf_fpu_stall_D,
    output logic s_perf_int_flush_D,
    output logic s_perf_lsu_stall_D,
    output logic [11:0] s_perf_waddr_D,
    output logic [31:0] s_perf_wdata_D,
    output logic [1:0] s_perf_we_D,
    output logic s_progbuf_mode_active_D,
    output logic [5:0] s_rd0_addr_D,
    output logic [31:0] s_rd0_data_D,
    output logic s_rd0_we_D,
    output logic s_rd0_write_D,
    output logic [5:0] s_rd1_addr_D,
    output logic [31:0] s_rd1_data_D,
    output logic s_rd1_we_D,
    output logic s_rd1_write_D,
    output logic s_wfi_prevent_fetch_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic alu_act_B0B27;
    // signal/wire
    logic [7:0] alu_and_op_B0B27;
    // signal/wire
    logic [31:0] alu_and_rs_B0B27;
    // signal/wire
    logic bru_act_B0B28;
    // signal/wire
    logic [31:0] bru_and_addr_B0B28;
    // signal/wire
    logic [7:0] bru_and_op_B0B28;
    // signal/wire
    logic bu_act_B0B31;
    // signal/wire
    logic [7:0] bu_and_op_B0B31;
    // signal/wire
    logic [31:0] bu_and_rs_B0B31;
    // signal/wire
    logic [1:0] codasip_tmp_var_0;
    // signal/wire
    logic [1:0] codasip_tmp_var_1;
    // signal/wire
    logic [3:0] codasip_tmp_var_10;
    // signal/wire
    logic codasip_tmp_var_11;
    // signal/wire
    logic codasip_tmp_var_12;
    // signal/wire
    logic codasip_tmp_var_13;
    // signal/wire
    logic codasip_tmp_var_14;
    // signal/wire
    logic codasip_tmp_var_15;
    // signal/wire
    logic [3:0] codasip_tmp_var_16;
    // signal/wire
    logic [3:0] codasip_tmp_var_17;
    // signal/wire
    logic [3:0] codasip_tmp_var_18;
    // signal/wire
    logic codasip_tmp_var_19;
    // signal/wire
    logic [1:0] codasip_tmp_var_2;
    // signal/wire
    logic codasip_tmp_var_20;
    // signal/wire
    logic codasip_tmp_var_21;
    // signal/wire
    logic codasip_tmp_var_22;
    // signal/wire
    logic codasip_tmp_var_3;
    // signal/wire
    logic codasip_tmp_var_4;
    // signal/wire
    logic codasip_tmp_var_5;
    // signal/wire
    logic codasip_tmp_var_6;
    // signal/wire
    logic [3:0] codasip_tmp_var_7;
    // signal/wire
    logic [3:0] codasip_tmp_var_8;
    // signal/wire
    logic [3:0] codasip_tmp_var_9;
    // signal/wire
    logic csr_hazard_B0;
    // signal/wire
    logic [7:0] csr_op_B0;
    // signal/wire
    logic div_act_B0B30;
    // signal/wire
    logic [7:0] div_and_op_B0B30;
    // signal/wire
    logic [31:0] div_and_rs_B0B30;
    // signal/wire
    logic div_ce_B0B30;
    // signal/wire
    logic ex0_excint_delay_B0;
    // signal/wire
    logic ex1_I2O_free_stall_B0;
    // signal/wire
    logic ex1_fencei_B0;
    // signal/wire
    logic ex1_fencei_finished_B0;
    // signal/wire
    logic [3:0] ex1_fu_act_B0;
    // signal/wire
    logic ex1_stall_B0;
    // signal/wire
    logic ex_data_hazard_B0;
    // signal/wire
    logic [3:0] ex_fu_B0;
    // signal/wire
    logic [7:0] ex_op_B0;
    // signal/wire
    logic [1:0] exc_extra_B0;
    // signal/wire
    logic [31:0] exc_tval_B0;
    // signal/wire
    logic [4:0] exc_type_B0;
    // signal/wire
    logic exc_valid_B0;
    // signal/wire
    logic fpu_flw_fin_B0;
    // signal/wire
    logic fpu_hazard_B0;
    // signal/wire
    logic fpu_modify_context_B0;
    // signal/wire
    logic fpu_modify_fcsr_B0;
    // signal/wire
    logic fpu_valid_B0;
    // signal/wire
    logic instr_0_commit_B0;
    // signal/wire
    logic instr_0_valid_B0;
    // signal/wire
    logic instr_1_valid_B0;
    // signal/wire
    logic [31:0] instr_addr_B0;
    // signal/wire
    logic instr_retire_B0;
    // signal/wire
    logic instr_valid_B0;
    // signal/wire
    logic instr_valid_I2O_free_B0;
    // signal/wire
    logic int_stall_B0;
    // signal/wire
    logic interrupt_pending_B0;
    // signal/wire
    logic ldst_proceed_not_ready_B0;
    // signal/wire
    logic mul_act_B0B29;
    // signal/wire
    logic [7:0] mul_and_op_B0B29;
    // signal/wire
    logic [31:0] mul_and_rs_B0B29;
    // signal/wire
    logic nmi_pending_B0;
    // signal/wire
    logic [31:0] op1_data_B0;
    // signal/wire
    logic [31:0] op2_data_B0;
    // signal/wire
    logic [31:0] op3_data_B0;
    // signal/wire
    logic [5:0] rd_addr_B0;
    // signal/wire
    logic [4:0] rs1_addr_B0;
    // signal/wire
    logic [31:0] rs1_data_B0;
    // signal/wire
    logic [4:0] rs1_x_addr_B0B9;
    // signal/wire
    logic rs1_x_dst_B0B9;
    // signal/wire
    logic [4:0] rs2_addr_B0;
    // signal/wire
    logic [31:0] rs2_data_B0;
    // signal/wire
    logic [4:0] rs2_x_addr_B0B9;
    // signal/wire
    logic rs2_x_dst_B0B9;
    // signal/wire
    logic [4:0] rs3_addr_B0;
    // signal/wire
    logic [31:0] rs3_data_B0;
    // signal/wire
    logic s_ex_p0_we_D_ACT_wire;
    // CodAL signal/wire
    logic s_fpu_f2x_hazard;
    // signal/wire
    logic [5:0] s_rd0_addr_D_ACT_wire;
    // signal/wire
    logic [31:0] s_rd0_data_D_ACT_wire;
    // signal/wire
    logic s_rd0_we_D_ACT_wire;
    // signal/wire
    logic [5:0] s_rd1_addr_D_ACT_wire;
    // signal/wire
    logic [31:0] s_rd1_data_D_ACT_wire;
    // signal/wire
    logic s_rd1_we_D_ACT_wire;
    // signal/wire
    logic start_op_B0;
    // signal/wire
    logic step_active_B0;
    // signal/wire
    logic step_mode_int_disable_B0;
    // signal/wire
    logic wfi_delay_B0;
    // signal/wire
    logic wfi_wake_B0;
    // signal/wire
    logic write_ex1_on_pending_int_B0;

    // data-path code:
    assign step_active_B0 = (ocd_s_ocd_step_mode_o_Q & (r_ex1_fu_Q != 4'h0));
    assign step_mode_int_disable_B0 = ((~r_csr_dcsr_Q[9]) & r_csr_dcsr_Q[0]);
    assign wfi_delay_B0 = ((fetch_stage_ifu_s_bus_busy_o_Q & (~ocd_s_ocd_progbuf_mode_o_Q)) & (~r_csr_dcsr_Q[0]));
    assign rd_addr_B0 = (r_ex_rd_addr_Q & {32'd6{r_ex_instr_valid_Q}});
    assign ex_op_B0 = (r_ex_op_Q & {32'd8{(r_ex_instr_valid_Q & (~step_active_B0))}});
    assign ex_fu_B0 = (r_ex_fu_Q & {32'd4{(r_ex_instr_valid_Q & (~step_active_B0))}});
    assign rs1_addr_B0 = ((r_ex_instr_valid_Q) ? r_ex_rs1_addr_Q[4:0] : 5'h00);
    assign rs2_addr_B0 = ((r_ex_instr_valid_Q) ? r_ex_rs2_addr_Q[4:0] : 5'h00);
    assign op1_data_B0 = ((r_ex_rs1_addr_Q[5]) ? rf_fr_r1_Q : rf_gpr_r1_Q);
    assign op2_data_B0 = ((r_ex_rs2_addr_Q[5]) ? rf_fr_r2_Q : rf_gpr_r2_Q);
    assign rs3_addr_B0 = ((r_ex_instr_valid_Q) ? r_ex_rs3_addr_Q[4:0] : 5'h00);
    assign op3_data_B0 = rf_fr_r3_Q;
    assign codasip_tmp_var_0 = r_ex_fu_s1_source_Q;
    always_comb begin
        unique case ( codasip_tmp_var_0 )
            2'h0: rs1_data_B0 = 32'h00000000;
            2'h1: rs1_data_B0 = op1_data_B0;
            2'h2: rs1_data_B0 = r_ex_imm_Q;
            2'h3: rs1_data_B0 = r_ex_instr_addr_Q;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: rs1_data_B0 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign codasip_tmp_var_1 = r_ex_fu_s2_source_Q;
    always_comb begin
        unique case ( codasip_tmp_var_1 )
            2'h0: rs2_data_B0 = 32'h00000000;
            2'h1: rs2_data_B0 = op2_data_B0;
            2'h2: rs2_data_B0 = r_ex_imm_Q;
            2'h3: rs2_data_B0 = 32'h00000000;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: rs2_data_B0 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign codasip_tmp_var_2 = r_ex_fu_s3_source_Q;
    always_comb begin
        case ( codasip_tmp_var_2 )
            2'h0: rs3_data_B0 = 32'h00000000;
            2'h1: rs3_data_B0 = op3_data_B0;
            default: rs3_data_B0 = 32'h00000000;
        endcase
    end
    assign ex1_fencei_B0 = (lsu_s_fin_op_o_Q == 8'h1d);
    assign ex1_fencei_finished_B0 = (ex1_fencei_B0 & (~lsu_s_fin_busy_o_Q));
    assign nmi_pending_B0 = (((r_nmi_i_Q && (~ocd_s_ocd_progbuf_mode_o_Q)) && (~ocd_s_ocd_busy_o_Q)) && (~step_mode_int_disable_B0));
    assign rs1_x_dst_B0B9 = ((~r_ex_rs1_addr_Q[5]) & (r_ex_fu_s1_source_Q == 2'h1));
    assign rs2_x_dst_B0B9 = ((~r_ex_rs2_addr_Q[5]) & (r_ex_fu_s2_source_Q == 2'h1));
    assign rs1_x_addr_B0B9 = ((rs1_x_dst_B0B9) ? rs1_addr_B0 : 5'h00);
    assign rs2_x_addr_B0B9 = ((rs2_x_dst_B0B9) ? rs2_addr_B0 : 5'h00);
    assign s_fpu_f2x_hazard = ((((32'h00000001 << rs1_x_addr_B0B9) | (32'h00000001 << rs2_x_addr_B0B9)) & fpu_s_rdx_valid_o_Q) != 32'h00000000);
    assign ex_data_hazard_B0 = (((r_ex1_fu_Q == 4'h2) & ((((r_ex_rs1_addr_Q == lsu_s_fin_rd_addr_o_Q) & (r_ex_fu_s1_source_Q == 2'h1)) | ((r_ex_rs2_addr_Q == lsu_s_fin_rd_addr_o_Q) & (r_ex_fu_s2_source_Q == 2'h1))) | ((r_ex_rs3_addr_Q == lsu_s_fin_rd_addr_o_Q) & (r_ex_fu_s3_source_Q == 2'h1)))) & lsu_s_fin_rd_we_o_Q);
    assign fpu_hazard_B0 = ((((~fpu_s_ready_o_Q) | s_fpu_f2x_hazard) | (((ex_fu_B0 != 4'h7) & r_ex_instr_valid_Q) & s_ex_fpu_busy_Q)) | (((ex_fu_B0 == 4'h7) & (r_ex1_fu_Q != 4'h0)) & (r_ex1_fu_Q != 4'h7)));
    assign csr_hazard_B0 = ((ex_fu_B0 == 4'h6) & (r_ex1_fu_Q != 4'h0));
    assign codasip_tmp_var_3 = fpu_s_exc_valid_o_Q;
    assign codasip_tmp_var_4 = (!codasip_tmp_var_3) ? lsu_s_fin_exc_valid_o_Q : 1'b0;
    assign codasip_tmp_var_5 = ((!codasip_tmp_var_4) && (!codasip_tmp_var_3)) ? r_ex_exc_valid_Q : 1'b0;
    assign codasip_tmp_var_6 = (((!codasip_tmp_var_5) && (!codasip_tmp_var_4)) && (!codasip_tmp_var_3)) ? lsu_s_req_exc_valid_o_Q : 1'b0;
    assign exc_type_B0 = codasip_tmp_var_3 ? fpu_s_exc_type_o_Q :
        codasip_tmp_var_4 ? lsu_s_fin_exc_type_o_Q :
        codasip_tmp_var_5 ? ((((r_ex_exc_type_Q == 5'h1b) || (r_ex_exc_type_Q == 5'h1c))) ? 5'h01 : r_ex_exc_type_Q) :
        codasip_tmp_var_6 ? lsu_s_req_exc_type_o_Q : r_ex_exc_type_Q;
    assign exc_extra_B0 = codasip_tmp_var_3 ? 2'h0 :
        codasip_tmp_var_4 ? lsu_s_fin_exc_extra_o_Q :
        codasip_tmp_var_5 ? (((r_ex_exc_type_Q == 5'h1b)) ? 2'h2 : (((r_ex_exc_type_Q == 5'h1c)) ? 2'h3 : (((r_ex_exc_type_Q == 5'h01)) ? 2'h1 : 2'h0))) :
        codasip_tmp_var_6 ? lsu_s_req_exc_extra_o_Q : 2'h0;
    assign exc_tval_B0 = codasip_tmp_var_3 ? fpu_s_exc_tval_o_Q :
        codasip_tmp_var_4 ? lsu_s_fin_exc_tval_o_Q :
        codasip_tmp_var_5 ? r_ex_exc_tval_Q :
        codasip_tmp_var_6 ? lsu_s_req_exc_tval_o_Q : r_ex_exc_tval_Q;
    assign exc_valid_B0 = (((codasip_tmp_var_3 || codasip_tmp_var_4) || codasip_tmp_var_5) || codasip_tmp_var_6) ? 1'b1 : 1'b0;
    assign ex0_excint_delay_B0 = (((~fpu_s_exc_valid_o_Q) & (r_ex1_fu_Q != 4'h0)) & exc_valid_B0);
    assign codasip_tmp_var_7 = r_ex1_fu_Q;
    always_comb begin
        case ( codasip_tmp_var_7 )
            4'h2: ex1_stall_B0 = lsu_s_fin_busy_o_Q;
            4'h4: ex1_stall_B0 = div_s_busy_o_Q;
            4'h7: ex1_stall_B0 = fpu_hazard_B0;
            default: ex1_stall_B0 = 1'b0;
        endcase
    end
    assign codasip_tmp_var_8 = r_ex1_fu_Q;
    always_comb begin
        case ( codasip_tmp_var_8 )
            4'h4: ex1_I2O_free_stall_B0 = div_s_busy_o_Q;
            4'h7: ex1_I2O_free_stall_B0 = fpu_hazard_B0;
            default: ex1_I2O_free_stall_B0 = 1'b0;
        endcase
    end
    assign interrupt_pending_B0 = ((((((r_prv_Q != 2'h3) || r_csr_mstatus_Q) && ((r_csr_mip_Q & r_csr_mie_Q) != 32'h00000000)) && (~ocd_s_ocd_progbuf_mode_o_Q)) && (~ocd_s_ocd_busy_o_Q)) && (~step_mode_int_disable_B0));
    assign start_op_B0 = (((((((((~fpu_hazard_B0) & (~step_active_B0)) & (~ocd_s_ocd_debug_mode_req_o_Q)) & (~ex1_stall_B0)) & (~exc_valid_B0)) & (~ex_data_hazard_B0)) & (~ex0_excint_delay_B0)) & (~ex1_fencei_B0)) & (~((interrupt_pending_B0 | nmi_pending_B0) & (~lsu_s_waited_transfer_o_Q))));
    assign codasip_tmp_var_9 = ex_fu_B0;
    always_comb begin
        case ( codasip_tmp_var_9 )
            4'h2: ex1_fu_act_B0 = ((start_op_B0) ? 4'h2 : 4'h0);
            4'h4: ex1_fu_act_B0 = ((start_op_B0) ? 4'h4 : 4'h0);
            4'h7: ex1_fu_act_B0 = ((start_op_B0) ? 4'h7 : 4'h0);
            default: ex1_fu_act_B0 = ((s_ex_fpu_busy_Q) ? 4'h7 : 4'h0);
        endcase
    end
    assign ldst_proceed_not_ready_B0 = ((ex1_fu_act_B0 == 4'h2) & lsu_s_fin_busy_o_Q);
    assign instr_addr_B0 = (((lsu_s_fin_exc_valid_o_Q | ex1_fencei_B0)) ? r_ex1_instr_addr_Q : ((s_ex_fpu_busy_Q) ? fpu_s_exc_instr_addr_o_Q : r_ex_instr_addr_Q));
    assign instr_valid_I2O_free_B0 = (((r_ex_instr_valid_Q & (~ex1_I2O_free_stall_B0)) & (~ex_data_hazard_B0)) & (~csr_hazard_B0));
    assign instr_valid_B0 = ((((r_ex_instr_valid_Q & (~ex1_stall_B0)) & (~ex_data_hazard_B0)) & (~csr_hazard_B0)) & (~ex0_excint_delay_B0));
    assign fpu_modify_fcsr_B0 = ((((fpu_s_valid_o_Q & (~fpu_s_exc_valid_o_Q)) & ((r_ex1_fu_Q == 4'h7) & (fpu_s_rd_addr_o_Q[5] | ((~fpu_s_rd_addr_o_Q[5]) & (fpu_s_flags_o_Q != 5'h00))))) & (~interrupt_pending_B0)) & (~nmi_pending_B0));
    assign fpu_flw_fin_B0 = (((r_ex1_fu_Q == 4'h2) & (lsu_s_fin_op_o_Q == 8'h19)) & lsu_s_fin_rd_valid_o_Q);
    assign fpu_modify_context_B0 = (fpu_modify_fcsr_B0 | fpu_flw_fin_B0);
    assign csr_op_B0 = ((csr_hazard_B0) ? 8'h00 : ex_op_B0);
    assign instr_0_valid_B0 = (((ex_fu_B0 != 4'h7) & (~step_active_B0)) & (((instr_valid_B0 & (ex1_fu_act_B0 == 4'h0)) & (~ex1_fencei_B0)) & (~interrupt_pending_B0)));
    assign codasip_tmp_var_10 = r_ex1_fu_Q;
    always_comb begin
        case ( codasip_tmp_var_10 )
            4'h2: instr_1_valid_B0 = (~lsu_s_fin_busy_o_Q);
            4'h4: instr_1_valid_B0 = div_s_rd_valid_o_Q;
            4'h7: instr_1_valid_B0 = fpu_s_valid_o_Q;
            default: instr_1_valid_B0 = 1'b0;
        endcase
    end
    always_comb begin
        case ( codasip_tmp_var_10 )
            4'h2: instr_retire_B0 = (~lsu_s_fin_exc_valid_o_Q);
            4'h4: instr_retire_B0 = 1'b1;
            4'h7: instr_retire_B0 = (~fpu_s_exc_valid_o_Q);
            default: instr_retire_B0 = 1'b0;
        endcase
    end
    assign int_stall_B0 = (crf_s_int_stall_o_Q & (~lsu_s_waited_transfer_o_Q));
    assign alu_act_B0B27 = ((ex_fu_B0 == 4'h1) || (ex_fu_B0 == 4'h3));
    assign alu_and_op_B0B27 = {32'd8{alu_act_B0B27}};
    assign alu_and_rs_B0B27 = {32'd32{alu_act_B0B27}};
    assign codasip_tmp_var_11 = alu_act_B0B27;
    assign bru_act_B0B28 = (ex_fu_B0 == 4'h3);
    assign bru_and_op_B0B28 = {32'd8{bru_act_B0B28}};
    assign bru_and_addr_B0B28 = {32'd32{bru_act_B0B28}};
    assign codasip_tmp_var_12 = bru_act_B0B28;
    assign mul_act_B0B29 = (ex_fu_B0 == 4'h5);
    assign mul_and_op_B0B29 = {32'd8{mul_act_B0B29}};
    assign mul_and_rs_B0B29 = {32'd32{mul_act_B0B29}};
    assign codasip_tmp_var_13 = mul_act_B0B29;
    assign div_act_B0B30 = (((ex_fu_B0 == 4'h4) & start_op_B0) | (r_ex1_fu_Q == 4'h4));
    assign div_ce_B0B30 = ((ex_fu_B0 == 4'h4) | (r_ex1_fu_Q == 4'h4));
    assign div_and_op_B0B30 = {32'd8{div_act_B0B30}};
    assign div_and_rs_B0B30 = {32'd32{div_act_B0B30}};
    assign codasip_tmp_var_14 = div_act_B0B30;
    assign fpu_valid_B0 = (((ex_fu_B0 == 4'h7) & start_op_B0) | (((r_ex1_fu_Q == 4'h7) & (~fpu_hazard_B0)) & (ex_fu_B0 == 4'h7)));
    assign bu_act_B0B31 = (ex_fu_B0 == 4'h8);
    assign bu_and_op_B0B31 = {32'd8{bu_act_B0B31}};
    assign bu_and_rs_B0B31 = {32'd32{bu_act_B0B31}};
    assign codasip_tmp_var_15 = bu_act_B0B31;
    assign codasip_tmp_var_16 = ex_fu_B0;
    always_comb begin
        case ( codasip_tmp_var_16 )
            4'h1: s_rd0_addr_D_ACT_wire = rd_addr_B0;
            4'h3: s_rd0_addr_D_ACT_wire = rd_addr_B0;
            4'h5: s_rd0_addr_D_ACT_wire = rd_addr_B0;
            4'h6: s_rd0_addr_D_ACT_wire = rd_addr_B0;
            4'h8: s_rd0_addr_D_ACT_wire = rd_addr_B0;
            default: s_rd0_addr_D_ACT_wire = 6'h00;
        endcase
    end
    always_comb begin
        case ( codasip_tmp_var_16 )
            4'h1: s_rd0_data_D_ACT_wire = alu_s_rd_data_o_Q;
            4'h3: s_rd0_data_D_ACT_wire = bru_s_rd_data_o_Q;
            4'h5: s_rd0_data_D_ACT_wire = mul_s_rd_data_o_Q;
            4'h6: s_rd0_data_D_ACT_wire = crf_s_rdata_o_Q;
            4'h8: s_rd0_data_D_ACT_wire = b_unit_s_rd_data_o_Q;
            default: s_rd0_data_D_ACT_wire = 32'h00000000;
        endcase
    end
    always_comb begin
        case ( codasip_tmp_var_16 )
            4'h1: s_rd0_we_D_ACT_wire = (~r_ex_exc_valid_Q);
            4'h3: s_rd0_we_D_ACT_wire = bru_s_rd_we_o_Q;
            4'h5: s_rd0_we_D_ACT_wire = (~r_ex_exc_valid_Q);
            4'h6: s_rd0_we_D_ACT_wire = csr_s_csr_rd_we_o_Q;
            4'h8: s_rd0_we_D_ACT_wire = (~r_ex_exc_valid_Q);
            default: s_rd0_we_D_ACT_wire = 1'b0;
        endcase
    end
    assign codasip_tmp_var_17 = r_ex1_fu_Q;
    always_comb begin
        case ( codasip_tmp_var_17 )
            4'h2: s_rd1_addr_D_ACT_wire = lsu_s_fin_rd_addr_o_Q;
            4'h4: s_rd1_addr_D_ACT_wire = r_ex1_rd_addr_Q;
            4'h7: s_rd1_addr_D_ACT_wire = fpu_s_rd_addr_o_Q;
            default: s_rd1_addr_D_ACT_wire = 6'h00;
        endcase
    end
    always_comb begin
        case ( codasip_tmp_var_17 )
            4'h2: s_rd1_data_D_ACT_wire = lsu_s_fin_rd_data_o_Q;
            4'h4: s_rd1_data_D_ACT_wire = div_s_rd_data_o_Q;
            4'h7: s_rd1_data_D_ACT_wire = fpu_s_rd_data_o_Q;
            default: s_rd1_data_D_ACT_wire = 32'h00000000;
        endcase
    end
    always_comb begin
        case ( codasip_tmp_var_17 )
            4'h2: s_rd1_we_D_ACT_wire = ((lsu_s_fin_rd_we_o_Q & lsu_s_fin_rd_valid_o_Q) & (~lsu_s_fin_exc_valid_o_Q));
            4'h4: s_rd1_we_D_ACT_wire = div_s_rd_valid_o_Q;
            4'h7: s_rd1_we_D_ACT_wire = (fpu_s_valid_o_Q & (~fpu_s_exc_valid_o_Q));
            default: s_rd1_we_D_ACT_wire = 1'b0;
        endcase
    end
    assign codasip_tmp_var_18 = ex_fu_B0;
    always_comb begin
        case ( codasip_tmp_var_18 )
            4'h2: s_ex_p0_we_D_ACT_wire = lsu_s_is_load_Q;
            4'h3: s_ex_p0_we_D_ACT_wire = bru_s_rd_we_o_Q;
            4'h4: s_ex_p0_we_D_ACT_wire = 1'b1;
            4'h5: s_ex_p0_we_D_ACT_wire = 1'b1;
            4'h6: s_ex_p0_we_D_ACT_wire = csr_s_csr_rd_we_o_Q;
            4'h7: s_ex_p0_we_D_ACT_wire = 1'b1;
            default: s_ex_p0_we_D_ACT_wire = 1'b0;
        endcase
    end
    assign wfi_wake_B0 = ((((((r_csr_mie_Q & r_csr_mip_Q) != 32'h00000000) || ocd_s_ocd_valid_o_Q) || ocd_s_ocd_progbuf_mode_o_Q) || r_csr_dcsr_Q[0]) || r_nmi_i_Q);
    assign codasip_tmp_var_19 = (ex_fu_B0 == 4'h3);
    assign write_ex1_on_pending_int_B0 = ((crf_s_int_stall_o_Q) ? (r_ex1_fu_Q == 4'h2) : 1'b1);
    assign instr_0_commit_B0 = (((((instr_0_valid_B0 & r_wfi_ce_Q) & (~crf_r_fce_wfi_valid_Q)) & ((~wfi_delay_B0) | (~crf_s_wfi_o_Q))) & ((~instr_1_valid_B0) | instr_retire_B0)) & (~int_stall_B0));
    assign codasip_tmp_var_20 = ((s_rd1_write_Q & s_rd1_we_Q) & (s_rd1_addr_Q != 6'h00));
    assign codasip_tmp_var_21 = codasip_tmp_var_20 ? s_rd1_addr_Q[5] : 1'b0;
    assign codasip_tmp_var_22 = ((s_rd0_write_Q & s_rd0_we_Q) & (s_rd0_addr_Q != 6'h00));
    assign alu_compute_ACT = codasip_tmp_var_11 ? 1'b1 : 1'b0;
    assign alu_s_op_i_D = (ex_op_B0 & alu_and_op_B0B27);
    assign alu_s_s1_data_i_D = (rs1_data_B0 & alu_and_rs_B0B27);
    assign alu_s_s2_data_i_D = (rs2_data_B0 & alu_and_rs_B0B27);
    assign b_unit_compute_ACT = codasip_tmp_var_15 ? 1'b1 : 1'b0;
    assign b_unit_s_op_i_D = (ex_op_B0 & bu_and_op_B0B31);
    assign b_unit_s_s1_data_i_D = (rs1_data_B0 & bu_and_rs_B0B31);
    assign b_unit_s_s2_data_i_D = (rs2_data_B0 & bu_and_rs_B0B31);
    assign bru_compute_ACT = codasip_tmp_var_12 ? 1'b1 : 1'b0;
    assign bru_s_bp_addr_i_D = (r_ex_bp_addr_Q & bru_and_addr_B0B28);
    assign bru_s_bp_taken_i_D = r_ex_bp_taken_Q;
    assign bru_s_imm_i_D = (r_ex_imm_Q & bru_and_addr_B0B28);
    assign bru_s_instr_addr_i_D = (r_ex_instr_addr_Q & bru_and_addr_B0B28);
    assign bru_s_is_rvc_i_D = r_ex_is_rvc_Q;
    assign bru_s_op_i_D = (ex_op_B0 & bru_and_op_B0B28);
    assign bru_s_rs1_data_i_D = (rs1_data_B0 & bru_and_addr_B0B28);
    assign bru_s_take_branch_i_D = alu_s_take_branch_o_Q;
    assign crf_s_csr_addr_i_D = csr_s_csr_addr_o_Q;
    assign crf_s_csr_re_i_D = (csr_s_csr_re_o_Q & (ex_fu_B0 == 4'h6));
    assign crf_s_csr_valid_i_D = (csr_s_csr_valid_o_Q & (ex_fu_B0 == 4'h6));
    assign crf_s_csr_wdata_i_D = csr_s_csr_wdata_o_Q;
    assign crf_s_csr_we_i_D = (csr_s_csr_we_o_Q & (ex_fu_B0 == 4'h6));
    assign crf_s_eip_i_D = p_int_Q;
    assign crf_s_exc_extra_i_D = exc_extra_B0;
    assign crf_s_exc_tval_i_D = exc_tval_B0;
    assign crf_s_exc_type_i_D = exc_type_B0;
    assign crf_s_exc_valid_i_D = exc_valid_B0;
    assign crf_s_fflags_i_D = fpu_s_flags_o_Q;
    assign crf_s_fs_context_change_i_D = fpu_modify_context_B0;
    assign crf_s_fu1_i_D = r_ex1_fu_Q;
    assign crf_s_instr_1_valid_i_D = (instr_1_valid_B0 & instr_retire_B0);
    assign crf_s_instr_addr_i_D = instr_addr_B0;
    assign crf_s_instr_valid_excint_i_D = (((fpu_s_valid_o_Q & fpu_s_exc_valid_o_Q) | (lsu_s_fin_exc_valid_o_Q & (r_ex1_fu_Q == 4'h2))) | (instr_valid_I2O_free_B0 & ((r_ex1_fu_Q == 4'h0) | ((r_ex1_fu_Q == 4'h7) & fpu_s_exc_valid_o_Q))));
    assign crf_s_instr_valid_i_D = (instr_0_valid_B0 & (~nmi_pending_B0));
    assign crf_s_int_addr_i_D = ira_s_int_addr_o_Q;
    assign crf_s_int_safe_to_take_i_D = (((r_wfi_ce_Q & (~ocd_s_ocd_step_commited_o_Q)) & (r_ex1_fu_Q != 4'h2)) & (~lsu_s_waited_transfer_o_Q));
    assign crf_s_nmi_i_D = r_nmi_i_Q;
    assign crf_s_nmi_mtval_i_D = r_nmi_mtval_Q;
    assign crf_s_nmi_source_i_D = r_nmi_source_Q;
    assign crf_s_ocd_busy_i_D = ocd_s_ocd_busy_o_Q;
    assign crf_s_ocd_dcsr_i_D = ocd_s_ocd_dcsr_o_Q;
    assign crf_s_ocd_debug_mode_req_i_D = ocd_s_ocd_debug_mode_req_o_Q;
    assign crf_s_ocd_dpc_i_D = ocd_s_ocd_dpc_o_Q;
    assign crf_s_ocd_flush_i_D = ocd_s_ocd_flush_o_Q;
    assign crf_s_ocd_progbuf_mode_i_D = ocd_s_ocd_progbuf_mode_o_Q;
    assign crf_s_ocd_user_mode_req_i_D = ocd_s_ocd_user_mod_req_o_Q;
    assign crf_s_op_i_D = csr_op_B0;
    assign crf_s_sip_i_D = p_msip_Q;
    assign crf_s_tip_i_D = p_mtip_Q;
    assign crf_s_wfi_delay_i_D = wfi_delay_B0;
    assign crf_s_write_fflags_i_D = fpu_modify_fcsr_B0;
    assign csr_s_csr_addr_i_D = r_ex_csr_addr_Q;
    assign csr_s_csr_s1_addr_i_D = r_ex_rs1_addr_Q;
    assign csr_s_csr_s1_source_i_D = r_ex_fu_s1_source_Q;
    assign csr_s_csr_wdata_i_D = rs1_data_B0;
    assign csr_s_op_i_D = csr_op_B0;
    assign div_div_compute_ACT = codasip_tmp_var_14 ? 1'b1 : 1'b0;
    assign div_s_div_ce_i_D = div_ce_B0B30;
    assign div_s_flush_i_D = ((s_flush_Q | int_stall_B0) & div_ce_B0B30);
    assign div_s_op_i_D = (ex_op_B0 & div_and_op_B0B30);
    assign div_s_s1_data_i_D = (rs1_data_B0 & div_and_rs_B0B30);
    assign div_s_s2_data_i_D = (rs2_data_B0 & div_and_rs_B0B30);
    assign fpu_s_ack_i_D = 1'b1;
    assign fpu_s_exc_type_i_D = 5'h00;
    assign fpu_s_exc_valid_i_D = 1'b0;
    assign fpu_s_flush_i_D = (s_flush_Q | int_stall_B0);
    assign fpu_s_frm_i_D = r_csr_fcsr_Q;
    assign fpu_s_instr_addr_i_D = r_ex_instr_addr_Q;
    assign fpu_s_instr_i_D = r_ex_exc_tval_Q;
    assign fpu_s_op_i_D = r_ex_fpu_op_Q;
    assign fpu_s_rd_addr_i_D = rd_addr_B0;
    assign fpu_s_rm_i_D = r_ex_rm_Q;
    assign fpu_s_s1_addr_i_D = r_ex_rs1_addr_Q;
    assign fpu_s_s1_data_i_D = rs1_data_B0;
    assign fpu_s_s2_addr_i_D = r_ex_rs2_addr_Q;
    assign fpu_s_s2_data_i_D = rs2_data_B0;
    assign fpu_s_s3_addr_i_D = r_ex_rs3_addr_Q;
    assign fpu_s_s3_data_i_D = rs3_data_B0;
    assign fpu_s_valid_i_D = fpu_valid_B0;
    assign ira_s_ex0_branch_target_i_D = s_ex_branch_target_addr_Q;
    assign ira_s_ex0_csr_addr_i_D = crf_s_csr_addr_o_Q;
    assign ira_s_ex0_instr_addr_i_D = r_ex_instr_addr_Q;
    assign ira_s_ex0_intexc_addr_i_D = crf_s_intexc_trap_addr_Q;
    assign ira_s_ex0_is_branch_i_D = (ex_fu_B0 == 4'h3);
    assign ira_s_ex0_is_csr_i_D = crf_s_csr_valid_o_Q;
    assign ira_s_ex0_is_intexc_i_D = crf_s_intexc_trap_valid_Q;
    assign ira_s_ex0_is_rvc_i_D = r_ex_is_rvc_Q;
    assign ira_s_ex0_retired_i_D = (instr_0_commit_B0 & (~nmi_pending_B0));
    assign ira_s_ex1_instr_addr_i_D = (((r_ex1_fu_Q == 4'h7)) ? fpu_s_exc_instr_addr_o_Q : r_ex1_instr_addr_Q);
    assign ira_s_ex1_is_rvc_i_D = (((r_ex1_fu_Q == 4'h7)) ? (fpu_s_exc_tval_o_Q[1:0] != 2'h3) : r_ex1_is_rvc_Q);
    assign ira_s_ex1_retired_i_D = (crf_s_instr_1_valid_i_Q & write_ex1_on_pending_int_B0);
    assign ira_s_ocd_addr_i_D = ocd_s_ocd_addr_o_Q;
    assign ira_s_ocd_stop_count_i_D = ocd_s_ocd_progbuf_mode_o_Q;
    assign ira_s_ocd_valid_i_D = ocd_s_ocd_valid_o_Q;
    assign lsu_s_addr_i_D = r_ex_lsu_addr_Q;
    assign lsu_s_clear_i_D = ((((ex1_I2O_free_stall_B0 | ex_data_hazard_B0) | crf_s_flush_o_Q) | r_ex_exc_valid_Q) | crf_s_int_stall_o_Q);
    assign lsu_s_ocd_mmode_i_D = (ocd_s_ocd_progbuf_mode_o_Q & (~r_csr_dcsr_Q[2]));
    assign lsu_s_op_i_D = ((ex1_fencei_B0) ? 8'h00 : ex_op_B0);
    assign lsu_s_rd_addr_i_D = rd_addr_B0;
    assign lsu_s_syscall_addr_i_D = r_syscall_addr_Q;
    assign lsu_s_wdata_i_D = rs2_data_B0;
    assign mul_compute_ACT = codasip_tmp_var_13 ? 1'b1 : 1'b0;
    assign mul_s_op_i_D = (ex_op_B0 & mul_and_op_B0B29);
    assign mul_s_s1_data_i_D = (rs1_data_B0 & mul_and_rs_B0B29);
    assign mul_s_s2_data_i_D = (rs2_data_B0 & mul_and_rs_B0B29);
    assign ocd_s_dm_active_i_D = s_dm_active_Q;
    assign ocd_s_dm_halt_i_D = s_dm_halt_Q;
    assign ocd_s_dm_progbuf_en_i_D = s_dm_progbuf_en_Q;
    assign ocd_s_exc_type_i_D = crf_s_exc_type_o_Q;
    assign ocd_s_exc_valid_i_D = crf_s_exc_valid_o_Q;
    assign ocd_s_instr_addr_i_D = ira_r_return_address_Q;
    assign ocd_s_instr_commit_i_D = (((ira_s_ex0_retired_i_Q | ira_s_ex1_retired_i_Q) | crf_s_int_flush_o_Q) | crf_s_exc_flush_o_Q);
    assign ocd_s_instr_valid_i_D = (r_ex_instr_valid_Q & (r_ex1_fu_Q == 4'h0));
    assign r_ex1_fu_D = ((ldst_proceed_not_ready_B0) ? 4'h0 : ex1_fu_act_B0);
    assign r_ex1_fu_WE = 1'b1;
    assign r_ex1_instr_addr_D = r_ex_instr_addr_Q;
    assign r_ex1_instr_addr_WE = 1'b1;
    assign r_ex1_is_rvc_D = r_ex_is_rvc_Q;
    assign r_ex1_is_rvc_WE = 1'b1;
    assign r_ex1_rd_addr_D = rd_addr_B0;
    assign r_ex1_rd_addr_WE = 1'b1;
    assign r_nmi_i_D = ((((r_wfi_ce_Q & crf_s_take_nmi_o_Q) | (~r_nmi_i_Q))) ? (p_nmi_Q | s_eviction_error_Q) : r_nmi_i_Q);
    assign r_nmi_i_WE = 1'b1;
    assign r_nmi_mtval_D = ((p_nmi_Q) ? p_nmi_mtval_Q : r_nmi_mtval_Q);
    assign r_nmi_mtval_WE = 1'b1;
    assign r_nmi_source_D = ((s_eviction_error_Q) ? 1'b1 : ((p_nmi_Q) ? 1'b0 : r_nmi_source_Q));
    assign r_nmi_source_WE = 1'b1;
    assign r_wfi_ce_D = ((r_wfi_ce_Q) ? (((~crf_s_wfi_o_Q) | wfi_delay_B0) | wfi_wake_B0) : wfi_wake_B0);
    assign r_wfi_ce_WE = 1'b1;
    assign rf_fr_r1_RA = rs1_addr_B0;
    assign rf_fr_r1_RE = 1'b1;
    assign rf_fr_r2_RA = rs2_addr_B0;
    assign rf_fr_r2_RE = 1'b1;
    assign rf_fr_r3_RA = rs3_addr_B0;
    assign rf_fr_r3_RE = 1'b1;
    assign rf_fr_w_D = s_rd1_data_Q;
    assign rf_fr_w_WA = s_rd1_addr_Q[4:0];
    assign rf_fr_w_WE = codasip_tmp_var_21 ? 1'b1 : 1'b0;
    assign rf_gpr_r1_RA = rs1_addr_B0;
    assign rf_gpr_r1_RE = 1'b1;
    assign rf_gpr_r2_RA = rs2_addr_B0;
    assign rf_gpr_r2_RE = 1'b1;
    assign rf_gpr_w0_D = s_rd0_data_Q;
    assign rf_gpr_w0_WA = s_rd0_addr_Q[4:0];
    assign rf_gpr_w0_WE = codasip_tmp_var_22 ? 1'b1 : 1'b0;
    assign rf_gpr_w1_D = s_rd1_data_Q;
    assign rf_gpr_w1_WA = s_rd1_addr_Q[4:0];
    assign rf_gpr_w1_WE = ((!codasip_tmp_var_21) && codasip_tmp_var_20) ? 1'b1 : 1'b0;
    assign s_dm_progbuf_done_D = ocd_s_dm_progbuf_done_o_Q;
    assign s_dm_progbuf_exc_D = ocd_s_dm_progbuf_exc_o_Q;
    assign s_ex1_clear_D = 1'b0;
    assign s_ex1_stall_D = ex1_stall_B0;
    assign s_ex_bp_flush_D = crf_s_flush_o_Q;
    assign s_ex_bp_flush_line_D = (s_ex_bp_restart_Q & (r_ex1_fu_Q == 4'h0));
    assign s_ex_bp_restart_D = (r_ex_bp_taken_Q & (~r_ex_instr_valid_Q));
    assign s_ex_branch_bht_update_D = (bru_s_branch_bht_update_o_Q & (~s_ex_stall_Q));
    assign s_ex_branch_btb_update_D = (bru_s_branch_btb_update_o_Q & (~s_ex_stall_Q));
    assign s_ex_branch_instr_addr_D = r_ex_instr_addr_Q;
    assign s_ex_branch_is_rvc_D = r_ex_is_rvc_Q;
    assign s_ex_branch_miss_D = (((bru_s_branch_miss_o_Q | (s_ex_bp_restart_Q & (r_ex1_fu_Q == 4'h0))) & start_op_B0) & (~int_stall_B0));
    assign s_ex_branch_offset_D = codasip_tmp_var_19 ? r_ex_imm_Q : 32'h00000000;
    assign s_ex_branch_taken_D = bru_s_branch_taken_o_Q;
    assign s_ex_branch_target_addr_D = ((s_ex_bp_restart_Q) ? r_ex_instr_addr_Q : bru_s_branch_target_addr_o_Q);
    assign s_ex_clear_D = 1'b0;
    assign s_ex_fence_valid_D = ex1_fencei_finished_B0;
    assign s_ex_fpu_busy_D = fpu_s_busy_o_Q;
    assign s_ex_p0_addr_D = rd_addr_B0;
    assign s_ex_p0_we_D = s_ex_p0_we_D_ACT_wire;
    assign s_ex_p1_addr_D = s_rd1_addr_Q;
    assign s_ex_p1_we_D = s_rd1_we_Q;
    assign s_ex_progbuf_mode_D = ocd_s_ocd_progbuf_mode_o_Q;
    assign s_ex_rd_addr_D = rd_addr_B0;
    assign s_ex_rd_data_D = (((ex_fu_B0 == 4'h8)) ? b_unit_s_rd_data_o_Q : alu_s_rd_data_o_Q);
    assign s_ex_rd_we_D = (((ex_fu_B0 == 4'h1) | (ex_fu_B0 == 4'h8)) & (~r_ex_exc_valid_Q));
    assign s_ex_return_link_D = codasip_tmp_var_19 ? ((r_ex_op_Q == 8'h48) & (r_ex_rd_addr_Q == 6'h01)) : 1'b0;
    assign s_ex_return_update_D = codasip_tmp_var_19 ? (r_ex_op_Q == 8'h47) : 1'b0;
    assign s_ex_stall_D = (((((((((((ldst_proceed_not_ready_B0 | int_stall_B0) | ocd_s_ocd_busy_o_Q) | step_active_B0) | s_ex_bp_restart_Q) | fpu_hazard_B0) | ((ex_fu_B0 != 4'h7) & ex1_stall_B0)) | ex_data_hazard_B0) | csr_hazard_B0) | crf_s_wfi_o_Q) | (!r_wfi_ce_Q)) | ex0_excint_delay_B0);
    assign s_flush_D = ((crf_s_flush_o_Q | s_ex_branch_miss_Q) | ex1_fencei_finished_B0);
    assign s_fpu_dst_regs_D = fpu_s_rdx_valid_o_Q;
    assign s_hart_halted_D = ocd_s_hart_halted_o_Q;
    assign s_perf_branch_miss_D = s_ex_branch_miss_Q;
    assign s_perf_csr_flush_D = crf_s_csr_flush_o_Q;
    assign s_perf_div_stall_D = div_s_busy_o_Q;
    assign s_perf_exc_flush_D = crf_s_exc_flush_o_Q;
    assign s_perf_fpu_stall_D = ((~fpu_s_ready_o_Q) | fpu_hazard_B0);
    assign s_perf_int_flush_D = crf_s_int_flush_o_Q;
    assign s_perf_lsu_stall_D = lsu_s_fin_busy_o_Q;
    assign s_perf_waddr_D = crf_s_perf_waddr_o_Q;
    assign s_perf_wdata_D = crf_s_perf_wdata_o_Q;
    assign s_perf_we_D = crf_s_perf_we_o_Q;
    assign s_progbuf_mode_active_D = ocd_s_ocd_progbuf_mode_o_Q;
    assign s_rd0_addr_D = s_rd0_addr_D_ACT_wire;
    assign s_rd0_data_D = s_rd0_data_D_ACT_wire;
    assign s_rd0_we_D = s_rd0_we_D_ACT_wire;
    assign s_rd0_write_D = (((((((~s_ex_stall_Q) & (~ocd_s_ocd_debug_mode_req_o_Q)) & (~crf_s_exc_valid_o_Q)) & (~crf_s_int_flush_o_Q)) & (~int_stall_B0)) & (~r_ex_exc_valid_Q)) & (~ex1_fencei_B0));
    assign s_rd1_addr_D = s_rd1_addr_D_ACT_wire;
    assign s_rd1_data_D = s_rd1_data_D_ACT_wire;
    assign s_rd1_we_D = s_rd1_we_D_ACT_wire;
    assign s_rd1_write_D = (((r_ex1_fu_Q != 4'h0) & (~((s_rd0_write_Q & s_rd0_we_Q) & (s_rd0_addr_Q == s_rd1_addr_Q)))) & write_ex1_on_pending_int_B0);
    assign s_wfi_prevent_fetch_D = ((r_ex_fu_Q == 4'h6) & (r_ex_op_Q == 8'h3e));
endmodule: codix_berkelium_ca_core_execute_stage_ex_t
