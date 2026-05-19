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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_decode_stage_t' CodAL module.
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

module codix_berkelium_ca_core_decode_stage_t(
    input  logic r_wfi_ce_ICLK,
    input  logic RST,
    input  logic [31:0] fetch_stage_ifb_s_addr_o_Q,
    input  logic [31:0] fetch_stage_ifb_s_bp_addr_o_Q,
    input  logic [1:0] fetch_stage_ifb_s_bp_taken_o_Q,
    input  logic [31:0] fetch_stage_ifb_s_data_o_Q,
    input  logic fetch_stage_ifb_s_empty_o_Q,
    input  logic [4:0] fetch_stage_ifb_s_exc_type_o_Q,
    input  logic fetch_stage_ifb_s_exc_valid_o_Q,
    input  logic [1:0] fetch_stage_ifb_s_valid_o_Q,
    input  logic [1:0] r_csr_mstatus_Q,
    input  logic r_csr_tcontrol_Q,
    input  logic [31:0] r_csr_tdata1_r0_Q,
    input  logic [31:0] r_csr_tdata1_r1_Q,
    input  logic [31:0] r_csr_tdata1_r2_Q,
    input  logic [31:0] r_csr_tdata1_r3_Q,
    input  logic [31:0] r_csr_tdata1_r4_Q,
    input  logic [31:0] r_csr_tdata1_r5_Q,
    input  logic [31:0] r_csr_tdata1_r6_Q,
    input  logic [31:0] r_csr_tdata1_r7_Q,
    input  logic [31:0] r_csr_tdata2_r0_Q,
    input  logic [31:0] r_csr_tdata2_r1_Q,
    input  logic [31:0] r_csr_tdata2_r2_Q,
    input  logic [31:0] r_csr_tdata2_r3_Q,
    input  logic [31:0] r_csr_tdata2_r4_Q,
    input  logic [31:0] r_csr_tdata2_r5_Q,
    input  logic [31:0] r_csr_tdata2_r6_Q,
    input  logic [31:0] r_csr_tdata2_r7_Q,
    input  logic [1:0] r_prv_Q,
    input  logic [31:0] rf_gpr_r0_Q,
    input  logic [5:0] s_ex_p0_addr_Q,
    input  logic s_ex_p0_we_Q,
    input  logic [5:0] s_ex_p1_addr_Q,
    input  logic s_ex_p1_we_Q,
    input  logic s_ex_progbuf_mode_Q,
    input  logic [5:0] s_ex_rd_addr_Q,
    input  logic [31:0] s_ex_rd_data_Q,
    input  logic s_ex_rd_we_Q,
    input  logic s_ex_stall_Q,
    input  logic s_flush_Q,
    input  logic [31:0] s_fpu_dst_regs_Q,
    input  logic [31:0] s_id_instr_addr_Q,
    input  logic s_id_stall_Q,
    input  logic s_progbuf_mode_active_Q,
    output logic fetch_stage_ifb_s_flush_i_D,
    output logic fetch_stage_ifb_s_pop_i_D,
    output logic [2:0] r_csr_tdata1_r0_RA,
    output logic r_csr_tdata1_r0_RE,
    output logic [2:0] r_csr_tdata1_r1_RA,
    output logic r_csr_tdata1_r1_RE,
    output logic [2:0] r_csr_tdata1_r2_RA,
    output logic r_csr_tdata1_r2_RE,
    output logic [2:0] r_csr_tdata1_r3_RA,
    output logic r_csr_tdata1_r3_RE,
    output logic [2:0] r_csr_tdata1_r4_RA,
    output logic r_csr_tdata1_r4_RE,
    output logic [2:0] r_csr_tdata1_r5_RA,
    output logic r_csr_tdata1_r5_RE,
    output logic [2:0] r_csr_tdata1_r6_RA,
    output logic r_csr_tdata1_r6_RE,
    output logic [2:0] r_csr_tdata1_r7_RA,
    output logic r_csr_tdata1_r7_RE,
    output logic [2:0] r_csr_tdata2_r0_RA,
    output logic r_csr_tdata2_r0_RE,
    output logic [2:0] r_csr_tdata2_r1_RA,
    output logic r_csr_tdata2_r1_RE,
    output logic [2:0] r_csr_tdata2_r2_RA,
    output logic r_csr_tdata2_r2_RE,
    output logic [2:0] r_csr_tdata2_r3_RA,
    output logic r_csr_tdata2_r3_RE,
    output logic [2:0] r_csr_tdata2_r4_RA,
    output logic r_csr_tdata2_r4_RE,
    output logic [2:0] r_csr_tdata2_r5_RA,
    output logic r_csr_tdata2_r5_RE,
    output logic [2:0] r_csr_tdata2_r6_RA,
    output logic r_csr_tdata2_r6_RE,
    output logic [2:0] r_csr_tdata2_r7_RA,
    output logic r_csr_tdata2_r7_RE,
    output logic [31:0] r_ex_bp_addr_D,
    output logic r_ex_bp_addr_WE,
    output logic r_ex_bp_noincr_D,
    output logic r_ex_bp_noincr_WE,
    output logic r_ex_bp_taken_D,
    output logic r_ex_bp_taken_WE,
    output logic [11:0] r_ex_csr_addr_D,
    output logic r_ex_csr_addr_WE,
    output logic [31:0] r_ex_exc_tval_D,
    output logic r_ex_exc_tval_WE,
    output logic [4:0] r_ex_exc_type_D,
    output logic r_ex_exc_type_WE,
    output logic r_ex_exc_valid_D,
    output logic r_ex_exc_valid_WE,
    output logic [5:0] r_ex_fpu_op_D,
    output logic r_ex_fpu_op_WE,
    output logic [3:0] r_ex_fu_D,
    output logic [1:0] r_ex_fu_s1_source_D,
    output logic r_ex_fu_s1_source_WE,
    output logic [1:0] r_ex_fu_s2_source_D,
    output logic r_ex_fu_s2_source_WE,
    output logic [1:0] r_ex_fu_s3_source_D,
    output logic r_ex_fu_s3_source_WE,
    output logic r_ex_fu_WE,
    output logic [31:0] r_ex_imm_D,
    output logic r_ex_imm_WE,
    output logic [31:0] r_ex_instr_addr_D,
    output logic r_ex_instr_addr_WE,
    output logic r_ex_instr_valid_D,
    output logic r_ex_instr_valid_WE,
    output logic r_ex_is_rvc_D,
    output logic r_ex_is_rvc_WE,
    output logic [31:0] r_ex_lsu_addr_D,
    output logic r_ex_lsu_addr_WE,
    output logic [7:0] r_ex_op_D,
    output logic r_ex_op_WE,
    output logic [5:0] r_ex_rd_addr_D,
    output logic r_ex_rd_addr_WE,
    output logic [2:0] r_ex_rm_D,
    output logic r_ex_rm_WE,
    output logic [5:0] r_ex_rs1_addr_D,
    output logic r_ex_rs1_addr_WE,
    output logic [5:0] r_ex_rs2_addr_D,
    output logic r_ex_rs2_addr_WE,
    output logic [5:0] r_ex_rs3_addr_D,
    output logic r_ex_rs3_addr_WE,
    output logic [4:0] rf_gpr_r0_RA,
    output logic rf_gpr_r0_RE,
    output logic s_id_clear_D,
    output logic [31:0] s_id_instr_addr_D,
    output logic s_id_stall_D,
    output logic s_perf_data_stall_D
);
    // additional declarations:
    logic id_dec_compute_ACT_wire;
    logic [31:0] id_dec_s_instr_i_D_wire;
    logic id_dec_s_ocd_progbuf_mode_i_D_wire;
    logic [11:0] dec_s_csr_addr_o_Q_wire;
    logic [31:0] dec_s_exc_tval_o_Q_wire;
    logic [4:0] dec_s_exc_type_o_Q_wire;
    logic dec_s_exc_valid_o_Q_wire;
    logic [5:0] dec_s_fpu_op_o_Q_wire;
    logic [3:0] dec_s_fu_o_Q_wire;
    logic [1:0] dec_s_fu_s1_source_o_Q_wire;
    logic [1:0] dec_s_fu_s2_source_o_Q_wire;
    logic [1:0] dec_s_fu_s3_source_o_Q_wire;
    logic [31:0] dec_s_imm_o_Q_wire;
    logic [7:0] dec_s_op_o_Q_wire;
    logic [5:0] dec_s_rd_addr_o_Q_wire;
    logic [2:0] dec_s_rm_o_Q_wire;
    logic [5:0] dec_s_rs1_addr_o_Q_wire;
    logic [5:0] dec_s_rs2_addr_o_Q_wire;
    logic [5:0] dec_s_rs3_addr_o_Q_wire;
    logic [31:0] id_hazard_s_fpu_dst_regs_D_wire;
    logic [5:0] id_hazard_s_p0_addr_i_D_wire;
    logic id_hazard_s_p0_we_i_D_wire;
    logic [5:0] id_hazard_s_p1_addr_i_D_wire;
    logic id_hazard_s_p1_we_i_D_wire;
    logic [5:0] id_hazard_s_rd_addr_i_D_wire;
    logic [31:0] id_hazard_s_rd_data_i_D_wire;
    logic id_hazard_s_rd_we_i_D_wire;
    logic [5:0] id_hazard_s_rs_addr_i_D_wire;
    logic [31:0] id_hazard_s_rs_data_i_D_wire;
    logic hazard_s_data_hazard_o_Q_wire;
    logic [31:0] hazard_s_data_o_Q_wire;
    logic [31:0] id_aligner_s_addr_i_D_wire;
    logic [31:0] id_aligner_s_bp_addr_i_D_wire;
    logic [1:0] id_aligner_s_bp_taken_i_D_wire;
    logic [31:0] id_aligner_s_data_i_D_wire;
    logic [4:0] id_aligner_s_exc_type_i_D_wire;
    logic id_aligner_s_exc_valid_i_D_wire;
    logic id_aligner_s_flush_i_D_wire;
    logic id_aligner_s_update_i_D_wire;
    logic [1:0] id_aligner_s_valid_i_D_wire;
    logic [31:0] aligner_s_addr_o_Q_wire;
    logic [31:0] aligner_s_bp_addr_o_Q_wire;
    logic aligner_s_bp_rvi_noincr_o_Q_wire;
    logic aligner_s_bp_taken_o_Q_wire;
    logic [31:0] aligner_s_exc_tval_o_Q_wire;
    logic [4:0] aligner_s_exc_type_o_Q_wire;
    logic aligner_s_exc_valid_o_Q_wire;
    logic [31:0] aligner_s_instr_o_Q_wire;
    logic aligner_s_pop_o_Q_wire;
    logic aligner_s_rvc_instr_o_Q_wire;
    logic aligner_s_rvi_broken_o_Q_wire;
    logic [1:0] aligner_s_valid_i_Q_wire;
    logic aligner_s_valid_o_Q_wire;
    logic [31:0] tgm_tg_0_s_fetch_addr_i_D_wire;
    logic [31:0] tgm_tg_0_s_ldst_addr_i_D_wire;
    logic [7:0] tgm_tg_0_s_ldst_cmd_i_D_wire;
    logic [1:0] tgm_tg_0_s_prv_i_D_wire;
    logic tg_0_s_trigger_action_o_Q_wire;
    logic tg_0_s_trigger_fire_o_Q_wire;
    logic [31:0] tgm_tg_1_s_fetch_addr_i_D_wire;
    logic [31:0] tgm_tg_1_s_ldst_addr_i_D_wire;
    logic [7:0] tgm_tg_1_s_ldst_cmd_i_D_wire;
    logic [1:0] tgm_tg_1_s_prv_i_D_wire;
    logic tg_1_s_trigger_action_o_Q_wire;
    logic tg_1_s_trigger_fire_o_Q_wire;
    logic [31:0] tgm_tg_2_s_fetch_addr_i_D_wire;
    logic [31:0] tgm_tg_2_s_ldst_addr_i_D_wire;
    logic [7:0] tgm_tg_2_s_ldst_cmd_i_D_wire;
    logic [1:0] tgm_tg_2_s_prv_i_D_wire;
    logic tg_2_s_trigger_action_o_Q_wire;
    logic tg_2_s_trigger_fire_o_Q_wire;
    logic [31:0] tgm_tg_3_s_fetch_addr_i_D_wire;
    logic [31:0] tgm_tg_3_s_ldst_addr_i_D_wire;
    logic [7:0] tgm_tg_3_s_ldst_cmd_i_D_wire;
    logic [1:0] tgm_tg_3_s_prv_i_D_wire;
    logic tg_3_s_trigger_action_o_Q_wire;
    logic tg_3_s_trigger_fire_o_Q_wire;
    logic [31:0] tgm_tg_4_s_fetch_addr_i_D_wire;
    logic [31:0] tgm_tg_4_s_ldst_addr_i_D_wire;
    logic [7:0] tgm_tg_4_s_ldst_cmd_i_D_wire;
    logic [1:0] tgm_tg_4_s_prv_i_D_wire;
    logic tg_4_s_trigger_action_o_Q_wire;
    logic tg_4_s_trigger_fire_o_Q_wire;
    logic [31:0] tgm_tg_5_s_fetch_addr_i_D_wire;
    logic [31:0] tgm_tg_5_s_ldst_addr_i_D_wire;
    logic [7:0] tgm_tg_5_s_ldst_cmd_i_D_wire;
    logic [1:0] tgm_tg_5_s_prv_i_D_wire;
    logic tg_5_s_trigger_action_o_Q_wire;
    logic tg_5_s_trigger_fire_o_Q_wire;
    logic [31:0] tgm_tg_6_s_fetch_addr_i_D_wire;
    logic [31:0] tgm_tg_6_s_ldst_addr_i_D_wire;
    logic [7:0] tgm_tg_6_s_ldst_cmd_i_D_wire;
    logic [1:0] tgm_tg_6_s_prv_i_D_wire;
    logic tg_6_s_trigger_action_o_Q_wire;
    logic tg_6_s_trigger_fire_o_Q_wire;
    logic [31:0] tgm_tg_7_s_fetch_addr_i_D_wire;
    logic [31:0] tgm_tg_7_s_ldst_addr_i_D_wire;
    logic [7:0] tgm_tg_7_s_ldst_cmd_i_D_wire;
    logic [1:0] tgm_tg_7_s_prv_i_D_wire;
    logic tg_7_s_trigger_action_o_Q_wire;
    logic tg_7_s_trigger_fire_o_Q_wire;
    logic [31:0] id_tgm_s_fetch_addr_i_D_wire;
    logic [31:0] id_tgm_s_ldst_addr_i_D_wire;
    logic [7:0] id_tgm_s_ldst_cmd_i_D_wire;
    logic id_tgm_s_progbuf_mode_i_D_wire;
    logic [1:0] id_tgm_s_prv_i_D_wire;
    logic [4:0] tgm_s_trigger_action_o_Q_wire;
    logic tgm_s_trigger_fire_o_Q_wire;

    // child instances inside CodAL module:
    // CodAL module instance:
    codix_berkelium_ca_core_decode_stage_dec_t dec (
        .compute_ACT(id_dec_compute_ACT_wire),
        .r_csr_mstatus_Q(r_csr_mstatus_Q),
        .s_instr_i_D(id_dec_s_instr_i_D_wire),
        .s_ocd_progbuf_mode_i_D(id_dec_s_ocd_progbuf_mode_i_D_wire),
        .s_csr_addr_o_Q(dec_s_csr_addr_o_Q_wire),
        .s_exc_tval_o_Q(dec_s_exc_tval_o_Q_wire),
        .s_exc_type_o_Q(dec_s_exc_type_o_Q_wire),
        .s_exc_valid_o_Q(dec_s_exc_valid_o_Q_wire),
        .s_fpu_op_o_Q(dec_s_fpu_op_o_Q_wire),
        .s_fu_o_Q(dec_s_fu_o_Q_wire),
        .s_fu_s1_source_o_Q(dec_s_fu_s1_source_o_Q_wire),
        .s_fu_s2_source_o_Q(dec_s_fu_s2_source_o_Q_wire),
        .s_fu_s3_source_o_Q(dec_s_fu_s3_source_o_Q_wire),
        .s_imm_o_Q(dec_s_imm_o_Q_wire),
        .s_op_o_Q(dec_s_op_o_Q_wire),
        .s_rd_addr_o_Q(dec_s_rd_addr_o_Q_wire),
        .s_rm_o_Q(dec_s_rm_o_Q_wire),
        .s_rs1_addr_o_Q(dec_s_rs1_addr_o_Q_wire),
        .s_rs2_addr_o_Q(dec_s_rs2_addr_o_Q_wire),
        .s_rs3_addr_o_Q(dec_s_rs3_addr_o_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_decode_stage_hazard_t hazard (
        .s_fpu_dst_regs_D(id_hazard_s_fpu_dst_regs_D_wire),
        .s_p0_addr_i_D(id_hazard_s_p0_addr_i_D_wire),
        .s_p0_we_i_D(id_hazard_s_p0_we_i_D_wire),
        .s_p1_addr_i_D(id_hazard_s_p1_addr_i_D_wire),
        .s_p1_we_i_D(id_hazard_s_p1_we_i_D_wire),
        .s_rd_addr_i_D(id_hazard_s_rd_addr_i_D_wire),
        .s_rd_data_i_D(id_hazard_s_rd_data_i_D_wire),
        .s_rd_we_i_D(id_hazard_s_rd_we_i_D_wire),
        .s_rs_addr_i_D(id_hazard_s_rs_addr_i_D_wire),
        .s_rs_data_i_D(id_hazard_s_rs_data_i_D_wire),
        .s_data_hazard_o_Q(hazard_s_data_hazard_o_Q_wire),
        .s_data_o_Q(hazard_s_data_o_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_decode_stage_aligner_t aligner (
        .r_wfi_ce_ICLK(r_wfi_ce_ICLK),
        .RST(RST),
        .s_addr_i_D(id_aligner_s_addr_i_D_wire),
        .s_bp_addr_i_D(id_aligner_s_bp_addr_i_D_wire),
        .s_bp_taken_i_D(id_aligner_s_bp_taken_i_D_wire),
        .s_data_i_D(id_aligner_s_data_i_D_wire),
        .s_exc_type_i_D(id_aligner_s_exc_type_i_D_wire),
        .s_exc_valid_i_D(id_aligner_s_exc_valid_i_D_wire),
        .s_flush_i_D(id_aligner_s_flush_i_D_wire),
        .s_update_i_D(id_aligner_s_update_i_D_wire),
        .s_valid_i_D(id_aligner_s_valid_i_D_wire),
        .s_addr_o_Q(aligner_s_addr_o_Q_wire),
        .s_bp_addr_o_Q(aligner_s_bp_addr_o_Q_wire),
        .s_bp_rvi_noincr_o_Q(aligner_s_bp_rvi_noincr_o_Q_wire),
        .s_bp_taken_o_Q(aligner_s_bp_taken_o_Q_wire),
        .s_exc_tval_o_Q(aligner_s_exc_tval_o_Q_wire),
        .s_exc_type_o_Q(aligner_s_exc_type_o_Q_wire),
        .s_exc_valid_o_Q(aligner_s_exc_valid_o_Q_wire),
        .s_instr_o_Q(aligner_s_instr_o_Q_wire),
        .s_pop_o_Q(aligner_s_pop_o_Q_wire),
        .s_rvc_instr_o_Q(aligner_s_rvc_instr_o_Q_wire),
        .s_rvi_broken_o_Q(aligner_s_rvi_broken_o_Q_wire),
        .s_valid_i_Q(aligner_s_valid_i_Q_wire),
        .s_valid_o_Q(aligner_s_valid_o_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_decode_stage_tg_0_t tg_0 (
        .r_csr_tcontrol_Q(r_csr_tcontrol_Q),
        .r_csr_tdata1_r0_Q(r_csr_tdata1_r0_Q),
        .r_csr_tdata2_r0_Q(r_csr_tdata2_r0_Q),
        .s_fetch_addr_i_D(tgm_tg_0_s_fetch_addr_i_D_wire),
        .s_ldst_addr_i_D(tgm_tg_0_s_ldst_addr_i_D_wire),
        .s_ldst_cmd_i_D(tgm_tg_0_s_ldst_cmd_i_D_wire),
        .s_prv_i_D(tgm_tg_0_s_prv_i_D_wire),
        .r_csr_tdata1_r0_RA(r_csr_tdata1_r0_RA),
        .r_csr_tdata1_r0_RE(r_csr_tdata1_r0_RE),
        .r_csr_tdata2_r0_RA(r_csr_tdata2_r0_RA),
        .r_csr_tdata2_r0_RE(r_csr_tdata2_r0_RE),
        .s_trigger_action_o_Q(tg_0_s_trigger_action_o_Q_wire),
        .s_trigger_fire_o_Q(tg_0_s_trigger_fire_o_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_decode_stage_tg_1_t tg_1 (
        .r_csr_tcontrol_Q(r_csr_tcontrol_Q),
        .r_csr_tdata1_r1_Q(r_csr_tdata1_r1_Q),
        .r_csr_tdata2_r1_Q(r_csr_tdata2_r1_Q),
        .s_fetch_addr_i_D(tgm_tg_1_s_fetch_addr_i_D_wire),
        .s_ldst_addr_i_D(tgm_tg_1_s_ldst_addr_i_D_wire),
        .s_ldst_cmd_i_D(tgm_tg_1_s_ldst_cmd_i_D_wire),
        .s_prv_i_D(tgm_tg_1_s_prv_i_D_wire),
        .r_csr_tdata1_r1_RA(r_csr_tdata1_r1_RA),
        .r_csr_tdata1_r1_RE(r_csr_tdata1_r1_RE),
        .r_csr_tdata2_r1_RA(r_csr_tdata2_r1_RA),
        .r_csr_tdata2_r1_RE(r_csr_tdata2_r1_RE),
        .s_trigger_action_o_Q(tg_1_s_trigger_action_o_Q_wire),
        .s_trigger_fire_o_Q(tg_1_s_trigger_fire_o_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_decode_stage_tg_2_t tg_2 (
        .r_csr_tcontrol_Q(r_csr_tcontrol_Q),
        .r_csr_tdata1_r2_Q(r_csr_tdata1_r2_Q),
        .r_csr_tdata2_r2_Q(r_csr_tdata2_r2_Q),
        .s_fetch_addr_i_D(tgm_tg_2_s_fetch_addr_i_D_wire),
        .s_ldst_addr_i_D(tgm_tg_2_s_ldst_addr_i_D_wire),
        .s_ldst_cmd_i_D(tgm_tg_2_s_ldst_cmd_i_D_wire),
        .s_prv_i_D(tgm_tg_2_s_prv_i_D_wire),
        .r_csr_tdata1_r2_RA(r_csr_tdata1_r2_RA),
        .r_csr_tdata1_r2_RE(r_csr_tdata1_r2_RE),
        .r_csr_tdata2_r2_RA(r_csr_tdata2_r2_RA),
        .r_csr_tdata2_r2_RE(r_csr_tdata2_r2_RE),
        .s_trigger_action_o_Q(tg_2_s_trigger_action_o_Q_wire),
        .s_trigger_fire_o_Q(tg_2_s_trigger_fire_o_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_decode_stage_tg_3_t tg_3 (
        .r_csr_tcontrol_Q(r_csr_tcontrol_Q),
        .r_csr_tdata1_r3_Q(r_csr_tdata1_r3_Q),
        .r_csr_tdata2_r3_Q(r_csr_tdata2_r3_Q),
        .s_fetch_addr_i_D(tgm_tg_3_s_fetch_addr_i_D_wire),
        .s_ldst_addr_i_D(tgm_tg_3_s_ldst_addr_i_D_wire),
        .s_ldst_cmd_i_D(tgm_tg_3_s_ldst_cmd_i_D_wire),
        .s_prv_i_D(tgm_tg_3_s_prv_i_D_wire),
        .r_csr_tdata1_r3_RA(r_csr_tdata1_r3_RA),
        .r_csr_tdata1_r3_RE(r_csr_tdata1_r3_RE),
        .r_csr_tdata2_r3_RA(r_csr_tdata2_r3_RA),
        .r_csr_tdata2_r3_RE(r_csr_tdata2_r3_RE),
        .s_trigger_action_o_Q(tg_3_s_trigger_action_o_Q_wire),
        .s_trigger_fire_o_Q(tg_3_s_trigger_fire_o_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_decode_stage_tg_4_t tg_4 (
        .r_csr_tcontrol_Q(r_csr_tcontrol_Q),
        .r_csr_tdata1_r4_Q(r_csr_tdata1_r4_Q),
        .r_csr_tdata2_r4_Q(r_csr_tdata2_r4_Q),
        .s_fetch_addr_i_D(tgm_tg_4_s_fetch_addr_i_D_wire),
        .s_ldst_addr_i_D(tgm_tg_4_s_ldst_addr_i_D_wire),
        .s_ldst_cmd_i_D(tgm_tg_4_s_ldst_cmd_i_D_wire),
        .s_prv_i_D(tgm_tg_4_s_prv_i_D_wire),
        .r_csr_tdata1_r4_RA(r_csr_tdata1_r4_RA),
        .r_csr_tdata1_r4_RE(r_csr_tdata1_r4_RE),
        .r_csr_tdata2_r4_RA(r_csr_tdata2_r4_RA),
        .r_csr_tdata2_r4_RE(r_csr_tdata2_r4_RE),
        .s_trigger_action_o_Q(tg_4_s_trigger_action_o_Q_wire),
        .s_trigger_fire_o_Q(tg_4_s_trigger_fire_o_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_decode_stage_tg_5_t tg_5 (
        .r_csr_tcontrol_Q(r_csr_tcontrol_Q),
        .r_csr_tdata1_r5_Q(r_csr_tdata1_r5_Q),
        .r_csr_tdata2_r5_Q(r_csr_tdata2_r5_Q),
        .s_fetch_addr_i_D(tgm_tg_5_s_fetch_addr_i_D_wire),
        .s_ldst_addr_i_D(tgm_tg_5_s_ldst_addr_i_D_wire),
        .s_ldst_cmd_i_D(tgm_tg_5_s_ldst_cmd_i_D_wire),
        .s_prv_i_D(tgm_tg_5_s_prv_i_D_wire),
        .r_csr_tdata1_r5_RA(r_csr_tdata1_r5_RA),
        .r_csr_tdata1_r5_RE(r_csr_tdata1_r5_RE),
        .r_csr_tdata2_r5_RA(r_csr_tdata2_r5_RA),
        .r_csr_tdata2_r5_RE(r_csr_tdata2_r5_RE),
        .s_trigger_action_o_Q(tg_5_s_trigger_action_o_Q_wire),
        .s_trigger_fire_o_Q(tg_5_s_trigger_fire_o_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_decode_stage_tg_6_t tg_6 (
        .r_csr_tcontrol_Q(r_csr_tcontrol_Q),
        .r_csr_tdata1_r6_Q(r_csr_tdata1_r6_Q),
        .r_csr_tdata2_r6_Q(r_csr_tdata2_r6_Q),
        .s_fetch_addr_i_D(tgm_tg_6_s_fetch_addr_i_D_wire),
        .s_ldst_addr_i_D(tgm_tg_6_s_ldst_addr_i_D_wire),
        .s_ldst_cmd_i_D(tgm_tg_6_s_ldst_cmd_i_D_wire),
        .s_prv_i_D(tgm_tg_6_s_prv_i_D_wire),
        .r_csr_tdata1_r6_RA(r_csr_tdata1_r6_RA),
        .r_csr_tdata1_r6_RE(r_csr_tdata1_r6_RE),
        .r_csr_tdata2_r6_RA(r_csr_tdata2_r6_RA),
        .r_csr_tdata2_r6_RE(r_csr_tdata2_r6_RE),
        .s_trigger_action_o_Q(tg_6_s_trigger_action_o_Q_wire),
        .s_trigger_fire_o_Q(tg_6_s_trigger_fire_o_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_decode_stage_tg_7_t tg_7 (
        .r_csr_tcontrol_Q(r_csr_tcontrol_Q),
        .r_csr_tdata1_r7_Q(r_csr_tdata1_r7_Q),
        .r_csr_tdata2_r7_Q(r_csr_tdata2_r7_Q),
        .s_fetch_addr_i_D(tgm_tg_7_s_fetch_addr_i_D_wire),
        .s_ldst_addr_i_D(tgm_tg_7_s_ldst_addr_i_D_wire),
        .s_ldst_cmd_i_D(tgm_tg_7_s_ldst_cmd_i_D_wire),
        .s_prv_i_D(tgm_tg_7_s_prv_i_D_wire),
        .r_csr_tdata1_r7_RA(r_csr_tdata1_r7_RA),
        .r_csr_tdata1_r7_RE(r_csr_tdata1_r7_RE),
        .r_csr_tdata2_r7_RA(r_csr_tdata2_r7_RA),
        .r_csr_tdata2_r7_RE(r_csr_tdata2_r7_RE),
        .s_trigger_action_o_Q(tg_7_s_trigger_action_o_Q_wire),
        .s_trigger_fire_o_Q(tg_7_s_trigger_fire_o_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_decode_stage_tgm_t tgm (
        .s_fetch_addr_i_D(id_tgm_s_fetch_addr_i_D_wire),
        .s_ldst_addr_i_D(id_tgm_s_ldst_addr_i_D_wire),
        .s_ldst_cmd_i_D(id_tgm_s_ldst_cmd_i_D_wire),
        .s_progbuf_mode_i_D(id_tgm_s_progbuf_mode_i_D_wire),
        .s_prv_i_D(id_tgm_s_prv_i_D_wire),
        .tg_0_s_trigger_action_o_Q(tg_0_s_trigger_action_o_Q_wire),
        .tg_0_s_trigger_fire_o_Q(tg_0_s_trigger_fire_o_Q_wire),
        .tg_1_s_trigger_action_o_Q(tg_1_s_trigger_action_o_Q_wire),
        .tg_1_s_trigger_fire_o_Q(tg_1_s_trigger_fire_o_Q_wire),
        .tg_2_s_trigger_action_o_Q(tg_2_s_trigger_action_o_Q_wire),
        .tg_2_s_trigger_fire_o_Q(tg_2_s_trigger_fire_o_Q_wire),
        .tg_3_s_trigger_action_o_Q(tg_3_s_trigger_action_o_Q_wire),
        .tg_3_s_trigger_fire_o_Q(tg_3_s_trigger_fire_o_Q_wire),
        .tg_4_s_trigger_action_o_Q(tg_4_s_trigger_action_o_Q_wire),
        .tg_4_s_trigger_fire_o_Q(tg_4_s_trigger_fire_o_Q_wire),
        .tg_5_s_trigger_action_o_Q(tg_5_s_trigger_action_o_Q_wire),
        .tg_5_s_trigger_fire_o_Q(tg_5_s_trigger_fire_o_Q_wire),
        .tg_6_s_trigger_action_o_Q(tg_6_s_trigger_action_o_Q_wire),
        .tg_6_s_trigger_fire_o_Q(tg_6_s_trigger_fire_o_Q_wire),
        .tg_7_s_trigger_action_o_Q(tg_7_s_trigger_action_o_Q_wire),
        .tg_7_s_trigger_fire_o_Q(tg_7_s_trigger_fire_o_Q_wire),
        .s_trigger_action_o_Q(tgm_s_trigger_action_o_Q_wire),
        .s_trigger_fire_o_Q(tgm_s_trigger_fire_o_Q_wire),
        .tg_0_s_fetch_addr_i_D(tgm_tg_0_s_fetch_addr_i_D_wire),
        .tg_0_s_ldst_addr_i_D(tgm_tg_0_s_ldst_addr_i_D_wire),
        .tg_0_s_ldst_cmd_i_D(tgm_tg_0_s_ldst_cmd_i_D_wire),
        .tg_0_s_prv_i_D(tgm_tg_0_s_prv_i_D_wire),
        .tg_1_s_fetch_addr_i_D(tgm_tg_1_s_fetch_addr_i_D_wire),
        .tg_1_s_ldst_addr_i_D(tgm_tg_1_s_ldst_addr_i_D_wire),
        .tg_1_s_ldst_cmd_i_D(tgm_tg_1_s_ldst_cmd_i_D_wire),
        .tg_1_s_prv_i_D(tgm_tg_1_s_prv_i_D_wire),
        .tg_2_s_fetch_addr_i_D(tgm_tg_2_s_fetch_addr_i_D_wire),
        .tg_2_s_ldst_addr_i_D(tgm_tg_2_s_ldst_addr_i_D_wire),
        .tg_2_s_ldst_cmd_i_D(tgm_tg_2_s_ldst_cmd_i_D_wire),
        .tg_2_s_prv_i_D(tgm_tg_2_s_prv_i_D_wire),
        .tg_3_s_fetch_addr_i_D(tgm_tg_3_s_fetch_addr_i_D_wire),
        .tg_3_s_ldst_addr_i_D(tgm_tg_3_s_ldst_addr_i_D_wire),
        .tg_3_s_ldst_cmd_i_D(tgm_tg_3_s_ldst_cmd_i_D_wire),
        .tg_3_s_prv_i_D(tgm_tg_3_s_prv_i_D_wire),
        .tg_4_s_fetch_addr_i_D(tgm_tg_4_s_fetch_addr_i_D_wire),
        .tg_4_s_ldst_addr_i_D(tgm_tg_4_s_ldst_addr_i_D_wire),
        .tg_4_s_ldst_cmd_i_D(tgm_tg_4_s_ldst_cmd_i_D_wire),
        .tg_4_s_prv_i_D(tgm_tg_4_s_prv_i_D_wire),
        .tg_5_s_fetch_addr_i_D(tgm_tg_5_s_fetch_addr_i_D_wire),
        .tg_5_s_ldst_addr_i_D(tgm_tg_5_s_ldst_addr_i_D_wire),
        .tg_5_s_ldst_cmd_i_D(tgm_tg_5_s_ldst_cmd_i_D_wire),
        .tg_5_s_prv_i_D(tgm_tg_5_s_prv_i_D_wire),
        .tg_6_s_fetch_addr_i_D(tgm_tg_6_s_fetch_addr_i_D_wire),
        .tg_6_s_ldst_addr_i_D(tgm_tg_6_s_ldst_addr_i_D_wire),
        .tg_6_s_ldst_cmd_i_D(tgm_tg_6_s_ldst_cmd_i_D_wire),
        .tg_6_s_prv_i_D(tgm_tg_6_s_prv_i_D_wire),
        .tg_7_s_fetch_addr_i_D(tgm_tg_7_s_fetch_addr_i_D_wire),
        .tg_7_s_ldst_addr_i_D(tgm_tg_7_s_ldst_addr_i_D_wire),
        .tg_7_s_ldst_cmd_i_D(tgm_tg_7_s_ldst_cmd_i_D_wire),
        .tg_7_s_prv_i_D(tgm_tg_7_s_prv_i_D_wire)
    );

    // functional unit instance:
    codix_berkelium_ca_core_decode_stage_id_t id (
        .aligner_s_addr_o_Q(aligner_s_addr_o_Q_wire),
        .aligner_s_bp_addr_o_Q(aligner_s_bp_addr_o_Q_wire),
        .aligner_s_bp_rvi_noincr_o_Q(aligner_s_bp_rvi_noincr_o_Q_wire),
        .aligner_s_bp_taken_o_Q(aligner_s_bp_taken_o_Q_wire),
        .aligner_s_exc_tval_o_Q(aligner_s_exc_tval_o_Q_wire),
        .aligner_s_exc_type_o_Q(aligner_s_exc_type_o_Q_wire),
        .aligner_s_exc_valid_o_Q(aligner_s_exc_valid_o_Q_wire),
        .aligner_s_instr_o_Q(aligner_s_instr_o_Q_wire),
        .aligner_s_pop_o_Q(aligner_s_pop_o_Q_wire),
        .aligner_s_rvc_instr_o_Q(aligner_s_rvc_instr_o_Q_wire),
        .aligner_s_rvi_broken_o_Q(aligner_s_rvi_broken_o_Q_wire),
        .aligner_s_valid_i_Q(aligner_s_valid_i_Q_wire),
        .aligner_s_valid_o_Q(aligner_s_valid_o_Q_wire),
        .dec_s_csr_addr_o_Q(dec_s_csr_addr_o_Q_wire),
        .dec_s_exc_tval_o_Q(dec_s_exc_tval_o_Q_wire),
        .dec_s_exc_type_o_Q(dec_s_exc_type_o_Q_wire),
        .dec_s_exc_valid_o_Q(dec_s_exc_valid_o_Q_wire),
        .dec_s_fpu_op_o_Q(dec_s_fpu_op_o_Q_wire),
        .dec_s_fu_o_Q(dec_s_fu_o_Q_wire),
        .dec_s_fu_s1_source_o_Q(dec_s_fu_s1_source_o_Q_wire),
        .dec_s_fu_s2_source_o_Q(dec_s_fu_s2_source_o_Q_wire),
        .dec_s_fu_s3_source_o_Q(dec_s_fu_s3_source_o_Q_wire),
        .dec_s_imm_o_Q(dec_s_imm_o_Q_wire),
        .dec_s_op_o_Q(dec_s_op_o_Q_wire),
        .dec_s_rd_addr_o_Q(dec_s_rd_addr_o_Q_wire),
        .dec_s_rm_o_Q(dec_s_rm_o_Q_wire),
        .dec_s_rs1_addr_o_Q(dec_s_rs1_addr_o_Q_wire),
        .dec_s_rs2_addr_o_Q(dec_s_rs2_addr_o_Q_wire),
        .dec_s_rs3_addr_o_Q(dec_s_rs3_addr_o_Q_wire),
        .fetch_stage_ifb_s_addr_o_Q(fetch_stage_ifb_s_addr_o_Q),
        .fetch_stage_ifb_s_bp_addr_o_Q(fetch_stage_ifb_s_bp_addr_o_Q),
        .fetch_stage_ifb_s_bp_taken_o_Q(fetch_stage_ifb_s_bp_taken_o_Q),
        .fetch_stage_ifb_s_data_o_Q(fetch_stage_ifb_s_data_o_Q),
        .fetch_stage_ifb_s_empty_o_Q(fetch_stage_ifb_s_empty_o_Q),
        .fetch_stage_ifb_s_exc_type_o_Q(fetch_stage_ifb_s_exc_type_o_Q),
        .fetch_stage_ifb_s_exc_valid_o_Q(fetch_stage_ifb_s_exc_valid_o_Q),
        .fetch_stage_ifb_s_valid_o_Q(fetch_stage_ifb_s_valid_o_Q),
        .hazard_s_data_hazard_o_Q(hazard_s_data_hazard_o_Q_wire),
        .hazard_s_data_o_Q(hazard_s_data_o_Q_wire),
        .r_prv_Q(r_prv_Q),
        .rf_gpr_r0_Q(rf_gpr_r0_Q),
        .s_ex_p0_addr_Q(s_ex_p0_addr_Q),
        .s_ex_p0_we_Q(s_ex_p0_we_Q),
        .s_ex_p1_addr_Q(s_ex_p1_addr_Q),
        .s_ex_p1_we_Q(s_ex_p1_we_Q),
        .s_ex_progbuf_mode_Q(s_ex_progbuf_mode_Q),
        .s_ex_rd_addr_Q(s_ex_rd_addr_Q),
        .s_ex_rd_data_Q(s_ex_rd_data_Q),
        .s_ex_rd_we_Q(s_ex_rd_we_Q),
        .s_ex_stall_Q(s_ex_stall_Q),
        .s_flush_Q(s_flush_Q),
        .s_fpu_dst_regs_Q(s_fpu_dst_regs_Q),
        .s_id_instr_addr_Q(s_id_instr_addr_Q),
        .s_id_stall_Q(s_id_stall_Q),
        .s_progbuf_mode_active_Q(s_progbuf_mode_active_Q),
        .tgm_s_trigger_action_o_Q(tgm_s_trigger_action_o_Q_wire),
        .tgm_s_trigger_fire_o_Q(tgm_s_trigger_fire_o_Q_wire),
        .aligner_s_addr_i_D(id_aligner_s_addr_i_D_wire),
        .aligner_s_bp_addr_i_D(id_aligner_s_bp_addr_i_D_wire),
        .aligner_s_bp_taken_i_D(id_aligner_s_bp_taken_i_D_wire),
        .aligner_s_data_i_D(id_aligner_s_data_i_D_wire),
        .aligner_s_exc_type_i_D(id_aligner_s_exc_type_i_D_wire),
        .aligner_s_exc_valid_i_D(id_aligner_s_exc_valid_i_D_wire),
        .aligner_s_flush_i_D(id_aligner_s_flush_i_D_wire),
        .aligner_s_update_i_D(id_aligner_s_update_i_D_wire),
        .aligner_s_valid_i_D(id_aligner_s_valid_i_D_wire),
        .dec_compute_ACT(id_dec_compute_ACT_wire),
        .dec_s_instr_i_D(id_dec_s_instr_i_D_wire),
        .dec_s_ocd_progbuf_mode_i_D(id_dec_s_ocd_progbuf_mode_i_D_wire),
        .fetch_stage_ifb_s_flush_i_D(fetch_stage_ifb_s_flush_i_D),
        .fetch_stage_ifb_s_pop_i_D(fetch_stage_ifb_s_pop_i_D),
        .hazard_s_fpu_dst_regs_D(id_hazard_s_fpu_dst_regs_D_wire),
        .hazard_s_p0_addr_i_D(id_hazard_s_p0_addr_i_D_wire),
        .hazard_s_p0_we_i_D(id_hazard_s_p0_we_i_D_wire),
        .hazard_s_p1_addr_i_D(id_hazard_s_p1_addr_i_D_wire),
        .hazard_s_p1_we_i_D(id_hazard_s_p1_we_i_D_wire),
        .hazard_s_rd_addr_i_D(id_hazard_s_rd_addr_i_D_wire),
        .hazard_s_rd_data_i_D(id_hazard_s_rd_data_i_D_wire),
        .hazard_s_rd_we_i_D(id_hazard_s_rd_we_i_D_wire),
        .hazard_s_rs_addr_i_D(id_hazard_s_rs_addr_i_D_wire),
        .hazard_s_rs_data_i_D(id_hazard_s_rs_data_i_D_wire),
        .r_ex_bp_addr_D(r_ex_bp_addr_D),
        .r_ex_bp_addr_WE(r_ex_bp_addr_WE),
        .r_ex_bp_noincr_D(r_ex_bp_noincr_D),
        .r_ex_bp_noincr_WE(r_ex_bp_noincr_WE),
        .r_ex_bp_taken_D(r_ex_bp_taken_D),
        .r_ex_bp_taken_WE(r_ex_bp_taken_WE),
        .r_ex_csr_addr_D(r_ex_csr_addr_D),
        .r_ex_csr_addr_WE(r_ex_csr_addr_WE),
        .r_ex_exc_tval_D(r_ex_exc_tval_D),
        .r_ex_exc_tval_WE(r_ex_exc_tval_WE),
        .r_ex_exc_type_D(r_ex_exc_type_D),
        .r_ex_exc_type_WE(r_ex_exc_type_WE),
        .r_ex_exc_valid_D(r_ex_exc_valid_D),
        .r_ex_exc_valid_WE(r_ex_exc_valid_WE),
        .r_ex_fpu_op_D(r_ex_fpu_op_D),
        .r_ex_fpu_op_WE(r_ex_fpu_op_WE),
        .r_ex_fu_D(r_ex_fu_D),
        .r_ex_fu_s1_source_D(r_ex_fu_s1_source_D),
        .r_ex_fu_s1_source_WE(r_ex_fu_s1_source_WE),
        .r_ex_fu_s2_source_D(r_ex_fu_s2_source_D),
        .r_ex_fu_s2_source_WE(r_ex_fu_s2_source_WE),
        .r_ex_fu_s3_source_D(r_ex_fu_s3_source_D),
        .r_ex_fu_s3_source_WE(r_ex_fu_s3_source_WE),
        .r_ex_fu_WE(r_ex_fu_WE),
        .r_ex_imm_D(r_ex_imm_D),
        .r_ex_imm_WE(r_ex_imm_WE),
        .r_ex_instr_addr_D(r_ex_instr_addr_D),
        .r_ex_instr_addr_WE(r_ex_instr_addr_WE),
        .r_ex_instr_valid_D(r_ex_instr_valid_D),
        .r_ex_instr_valid_WE(r_ex_instr_valid_WE),
        .r_ex_is_rvc_D(r_ex_is_rvc_D),
        .r_ex_is_rvc_WE(r_ex_is_rvc_WE),
        .r_ex_lsu_addr_D(r_ex_lsu_addr_D),
        .r_ex_lsu_addr_WE(r_ex_lsu_addr_WE),
        .r_ex_op_D(r_ex_op_D),
        .r_ex_op_WE(r_ex_op_WE),
        .r_ex_rd_addr_D(r_ex_rd_addr_D),
        .r_ex_rd_addr_WE(r_ex_rd_addr_WE),
        .r_ex_rm_D(r_ex_rm_D),
        .r_ex_rm_WE(r_ex_rm_WE),
        .r_ex_rs1_addr_D(r_ex_rs1_addr_D),
        .r_ex_rs1_addr_WE(r_ex_rs1_addr_WE),
        .r_ex_rs2_addr_D(r_ex_rs2_addr_D),
        .r_ex_rs2_addr_WE(r_ex_rs2_addr_WE),
        .r_ex_rs3_addr_D(r_ex_rs3_addr_D),
        .r_ex_rs3_addr_WE(r_ex_rs3_addr_WE),
        .rf_gpr_r0_RA(rf_gpr_r0_RA),
        .rf_gpr_r0_RE(rf_gpr_r0_RE),
        .s_id_clear_D(s_id_clear_D),
        .s_id_instr_addr_D(s_id_instr_addr_D),
        .s_id_stall_D(s_id_stall_D),
        .s_perf_data_stall_D(s_perf_data_stall_D),
        .tgm_s_fetch_addr_i_D(id_tgm_s_fetch_addr_i_D_wire),
        .tgm_s_ldst_addr_i_D(id_tgm_s_ldst_addr_i_D_wire),
        .tgm_s_ldst_cmd_i_D(id_tgm_s_ldst_cmd_i_D_wire),
        .tgm_s_progbuf_mode_i_D(id_tgm_s_progbuf_mode_i_D_wire),
        .tgm_s_prv_i_D(id_tgm_s_prv_i_D_wire)
    );

endmodule: codix_berkelium_ca_core_decode_stage_t
