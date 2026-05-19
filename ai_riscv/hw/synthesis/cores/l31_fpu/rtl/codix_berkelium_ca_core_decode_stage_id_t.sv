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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_decode_stage_id_t' functional unit.
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

module codix_berkelium_ca_core_decode_stage_id_t(
    input  logic [31:0] aligner_s_addr_o_Q,
    input  logic [31:0] aligner_s_bp_addr_o_Q,
    input  logic aligner_s_bp_rvi_noincr_o_Q,
    input  logic aligner_s_bp_taken_o_Q,
    input  logic [31:0] aligner_s_exc_tval_o_Q,
    input  logic [4:0] aligner_s_exc_type_o_Q,
    input  logic aligner_s_exc_valid_o_Q,
    input  logic [31:0] aligner_s_instr_o_Q,
    input  logic aligner_s_pop_o_Q,
    input  logic aligner_s_rvc_instr_o_Q,
    input  logic aligner_s_rvi_broken_o_Q,
    input  logic [1:0] aligner_s_valid_i_Q,
    input  logic aligner_s_valid_o_Q,
    input  logic [11:0] dec_s_csr_addr_o_Q,
    input  logic [31:0] dec_s_exc_tval_o_Q,
    input  logic [4:0] dec_s_exc_type_o_Q,
    input  logic dec_s_exc_valid_o_Q,
    input  logic [5:0] dec_s_fpu_op_o_Q,
    input  logic [3:0] dec_s_fu_o_Q,
    input  logic [1:0] dec_s_fu_s1_source_o_Q,
    input  logic [1:0] dec_s_fu_s2_source_o_Q,
    input  logic [1:0] dec_s_fu_s3_source_o_Q,
    input  logic [31:0] dec_s_imm_o_Q,
    input  logic [7:0] dec_s_op_o_Q,
    input  logic [5:0] dec_s_rd_addr_o_Q,
    input  logic [2:0] dec_s_rm_o_Q,
    input  logic [5:0] dec_s_rs1_addr_o_Q,
    input  logic [5:0] dec_s_rs2_addr_o_Q,
    input  logic [5:0] dec_s_rs3_addr_o_Q,
    input  logic [31:0] fetch_stage_ifb_s_addr_o_Q,
    input  logic [31:0] fetch_stage_ifb_s_bp_addr_o_Q,
    input  logic [1:0] fetch_stage_ifb_s_bp_taken_o_Q,
    input  logic [31:0] fetch_stage_ifb_s_data_o_Q,
    input  logic fetch_stage_ifb_s_empty_o_Q,
    input  logic [4:0] fetch_stage_ifb_s_exc_type_o_Q,
    input  logic fetch_stage_ifb_s_exc_valid_o_Q,
    input  logic [1:0] fetch_stage_ifb_s_valid_o_Q,
    input  logic hazard_s_data_hazard_o_Q,
    input  logic [31:0] hazard_s_data_o_Q,
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
    input  logic [4:0] tgm_s_trigger_action_o_Q,
    input  logic tgm_s_trigger_fire_o_Q,
    output logic [31:0] aligner_s_addr_i_D,
    output logic [31:0] aligner_s_bp_addr_i_D,
    output logic [1:0] aligner_s_bp_taken_i_D,
    output logic [31:0] aligner_s_data_i_D,
    output logic [4:0] aligner_s_exc_type_i_D,
    output logic aligner_s_exc_valid_i_D,
    output logic aligner_s_flush_i_D,
    output logic aligner_s_update_i_D,
    output logic [1:0] aligner_s_valid_i_D,
    output logic dec_compute_ACT,
    output logic [31:0] dec_s_instr_i_D,
    output logic dec_s_ocd_progbuf_mode_i_D,
    output logic fetch_stage_ifb_s_flush_i_D,
    output logic fetch_stage_ifb_s_pop_i_D,
    output logic [31:0] hazard_s_fpu_dst_regs_D,
    output logic [5:0] hazard_s_p0_addr_i_D,
    output logic hazard_s_p0_we_i_D,
    output logic [5:0] hazard_s_p1_addr_i_D,
    output logic hazard_s_p1_we_i_D,
    output logic [5:0] hazard_s_rd_addr_i_D,
    output logic [31:0] hazard_s_rd_data_i_D,
    output logic hazard_s_rd_we_i_D,
    output logic [5:0] hazard_s_rs_addr_i_D,
    output logic [31:0] hazard_s_rs_data_i_D,
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
    output logic s_perf_data_stall_D,
    output logic [31:0] tgm_s_fetch_addr_i_D,
    output logic [31:0] tgm_s_ldst_addr_i_D,
    output logic [7:0] tgm_s_ldst_cmd_i_D,
    output logic tgm_s_progbuf_mode_i_D,
    output logic [1:0] tgm_s_prv_i_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic aligner_exc_valid_B0;
    // signal/wire
    logic aligner_or_dec_exc_B0;
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
    logic codasip_tmp_var_5;
    // signal/wire
    logic disable_instr_B0;
    // signal/wire
    logic exc_valid_B0;
    // signal/wire
    logic id_data_hazard_B0;
    // signal/wire
    logic [3:0] id_fu_B0;
    // signal/wire
    logic [7:0] id_op_B0;
    // signal/wire
    logic instr_valid_B0;
    // signal/wire
    logic [31:0] lsu_addr_B0;
    // signal/wire
    logic [4:0] r0_addr_B0B1;

    // data-path code:
    assign codasip_tmp_var_0 = (aligner_s_valid_o_Q & (~aligner_s_rvi_broken_o_Q));
    assign r0_addr_B0B1 = (((dec_s_fu_o_Q == 4'h2)) ? dec_s_rs1_addr_o_Q[4:0] : 5'h00);
    assign lsu_addr_B0 = (hazard_s_data_o_Q + dec_s_imm_o_Q);
    assign aligner_exc_valid_B0 = ((aligner_s_valid_o_Q) ? aligner_s_exc_valid_o_Q : 1'b0);
    assign aligner_or_dec_exc_B0 = (aligner_exc_valid_B0 | dec_s_exc_valid_o_Q);
    assign instr_valid_B0 = ((aligner_s_valid_o_Q & (~aligner_s_rvi_broken_o_Q)) & (((~aligner_s_bp_taken_o_Q) | (dec_s_fu_o_Q == 4'h3)) | aligner_exc_valid_B0));
    assign exc_valid_B0 = (instr_valid_B0 & (tgm_s_trigger_fire_o_Q | aligner_or_dec_exc_B0));
    assign id_data_hazard_B0 = (((hazard_s_data_hazard_o_Q & (~aligner_or_dec_exc_B0)) & (dec_s_fu_o_Q == 4'h2)) & (dec_s_fu_s1_source_o_Q == 2'h1));
    assign disable_instr_B0 = (exc_valid_B0 | aligner_s_rvi_broken_o_Q);
    assign id_fu_B0 = ((disable_instr_B0) ? 4'h0 : dec_s_fu_o_Q);
    assign id_op_B0 = ((disable_instr_B0) ? 8'h00 : dec_s_op_o_Q);
    assign codasip_tmp_var_1 = (aligner_s_valid_o_Q & (~aligner_s_rvi_broken_o_Q));
    assign codasip_tmp_var_2 = codasip_tmp_var_1 ? (id_fu_B0 == 4'h7) : 1'b0;
    assign codasip_tmp_var_3 = codasip_tmp_var_1 ? (id_fu_B0 == 4'h2) : 1'b0;
    assign codasip_tmp_var_4 = exc_valid_B0;
    assign codasip_tmp_var_5 = ((exc_valid_B0 | (id_fu_B0 == 4'h6)) | (id_fu_B0 == 4'h7));
    assign aligner_s_addr_i_D = fetch_stage_ifb_s_addr_o_Q;
    assign aligner_s_bp_addr_i_D = fetch_stage_ifb_s_bp_addr_o_Q;
    assign aligner_s_bp_taken_i_D = fetch_stage_ifb_s_bp_taken_o_Q;
    assign aligner_s_data_i_D = fetch_stage_ifb_s_data_o_Q;
    assign aligner_s_exc_type_i_D = fetch_stage_ifb_s_exc_type_o_Q;
    assign aligner_s_exc_valid_i_D = fetch_stage_ifb_s_exc_valid_o_Q;
    assign aligner_s_flush_i_D = ((((aligner_s_bp_taken_o_Q & (~s_ex_stall_Q)) & (~id_data_hazard_B0)) & (aligner_s_valid_i_Q != 2'h2)) | s_flush_Q);
    assign aligner_s_update_i_D = (~s_id_stall_Q);
    assign aligner_s_valid_i_D = ((fetch_stage_ifb_s_empty_o_Q) ? 2'h0 : fetch_stage_ifb_s_valid_o_Q);
    assign dec_compute_ACT = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign dec_s_instr_i_D = aligner_s_instr_o_Q;
    assign dec_s_ocd_progbuf_mode_i_D = s_progbuf_mode_active_Q;
    assign fetch_stage_ifb_s_flush_i_D = s_flush_Q;
    assign fetch_stage_ifb_s_pop_i_D = (aligner_s_pop_o_Q && ((~s_id_stall_Q) | (~aligner_s_valid_o_Q)));
    assign hazard_s_fpu_dst_regs_D = s_fpu_dst_regs_Q;
    assign hazard_s_p0_addr_i_D = s_ex_p0_addr_Q;
    assign hazard_s_p0_we_i_D = s_ex_p0_we_Q;
    assign hazard_s_p1_addr_i_D = s_ex_p1_addr_Q;
    assign hazard_s_p1_we_i_D = s_ex_p1_we_Q;
    assign hazard_s_rd_addr_i_D = s_ex_rd_addr_Q;
    assign hazard_s_rd_data_i_D = s_ex_rd_data_Q;
    assign hazard_s_rd_we_i_D = s_ex_rd_we_Q;
    assign hazard_s_rs_addr_i_D = dec_s_rs1_addr_o_Q;
    assign hazard_s_rs_data_i_D = rf_gpr_r0_Q;
    assign r_ex_bp_addr_D = aligner_s_bp_addr_o_Q;
    assign r_ex_bp_addr_WE = codasip_tmp_var_1 ? 1'b1 : 1'b0;
    assign r_ex_bp_noincr_D = aligner_s_bp_rvi_noincr_o_Q;
    assign r_ex_bp_noincr_WE = 1'b1;
    assign r_ex_bp_taken_D = ((aligner_s_rvi_broken_o_Q) ? 1'b1 : ((aligner_s_valid_o_Q) ? aligner_s_bp_taken_o_Q : 1'b0));
    assign r_ex_bp_taken_WE = 1'b1;
    assign r_ex_csr_addr_D = dec_s_csr_addr_o_Q;
    assign r_ex_csr_addr_WE = codasip_tmp_var_1 ? 1'b1 : 1'b0;
    assign r_ex_exc_tval_D = ((aligner_exc_valid_B0) ? aligner_s_exc_tval_o_Q : dec_s_exc_tval_o_Q);
    assign r_ex_exc_tval_WE = codasip_tmp_var_5 ? 1'b1 : 1'b0;
    assign r_ex_exc_type_D = ((tgm_s_trigger_fire_o_Q) ? tgm_s_trigger_action_o_Q : ((aligner_exc_valid_B0) ? aligner_s_exc_type_o_Q : dec_s_exc_type_o_Q));
    assign r_ex_exc_type_WE = codasip_tmp_var_4 ? 1'b1 : 1'b0;
    assign r_ex_exc_valid_D = exc_valid_B0;
    assign r_ex_exc_valid_WE = 1'b1;
    assign r_ex_fpu_op_D = dec_s_fpu_op_o_Q;
    assign r_ex_fpu_op_WE = codasip_tmp_var_2 ? 1'b1 : 1'b0;
    assign r_ex_fu_D = id_fu_B0;
    assign r_ex_fu_s1_source_D = dec_s_fu_s1_source_o_Q;
    assign r_ex_fu_s1_source_WE = codasip_tmp_var_1 ? 1'b1 : 1'b0;
    assign r_ex_fu_s2_source_D = dec_s_fu_s2_source_o_Q;
    assign r_ex_fu_s2_source_WE = codasip_tmp_var_1 ? 1'b1 : 1'b0;
    assign r_ex_fu_s3_source_D = dec_s_fu_s3_source_o_Q;
    assign r_ex_fu_s3_source_WE = codasip_tmp_var_2 ? 1'b1 : 1'b0;
    assign r_ex_fu_WE = codasip_tmp_var_1 ? 1'b1 : 1'b0;
    assign r_ex_imm_D = dec_s_imm_o_Q;
    assign r_ex_imm_WE = codasip_tmp_var_1 ? 1'b1 : 1'b0;
    assign r_ex_instr_addr_D = s_id_instr_addr_Q;
    assign r_ex_instr_addr_WE = 1'b1;
    assign r_ex_instr_valid_D = instr_valid_B0;
    assign r_ex_instr_valid_WE = 1'b1;
    assign r_ex_is_rvc_D = aligner_s_rvc_instr_o_Q;
    assign r_ex_is_rvc_WE = codasip_tmp_var_1 ? 1'b1 : 1'b0;
    assign r_ex_lsu_addr_D = lsu_addr_B0;
    assign r_ex_lsu_addr_WE = codasip_tmp_var_3 ? 1'b1 : 1'b0;
    assign r_ex_op_D = id_op_B0;
    assign r_ex_op_WE = codasip_tmp_var_1 ? 1'b1 : 1'b0;
    assign r_ex_rd_addr_D = dec_s_rd_addr_o_Q;
    assign r_ex_rd_addr_WE = codasip_tmp_var_1 ? 1'b1 : 1'b0;
    assign r_ex_rm_D = dec_s_rm_o_Q;
    assign r_ex_rm_WE = codasip_tmp_var_2 ? 1'b1 : 1'b0;
    assign r_ex_rs1_addr_D = dec_s_rs1_addr_o_Q;
    assign r_ex_rs1_addr_WE = codasip_tmp_var_1 ? 1'b1 : 1'b0;
    assign r_ex_rs2_addr_D = dec_s_rs2_addr_o_Q;
    assign r_ex_rs2_addr_WE = codasip_tmp_var_1 ? 1'b1 : 1'b0;
    assign r_ex_rs3_addr_D = dec_s_rs3_addr_o_Q;
    assign r_ex_rs3_addr_WE = codasip_tmp_var_2 ? 1'b1 : 1'b0;
    assign rf_gpr_r0_RA = r0_addr_B0B1;
    assign rf_gpr_r0_RE = 1'b1;
    assign s_id_clear_D = (id_data_hazard_B0 & (~s_ex_stall_Q));
    assign s_id_instr_addr_D = aligner_s_addr_o_Q;
    assign s_id_stall_D = (id_data_hazard_B0 | s_ex_stall_Q);
    assign s_perf_data_stall_D = id_data_hazard_B0;
    assign tgm_s_fetch_addr_i_D = s_id_instr_addr_Q;
    assign tgm_s_ldst_addr_i_D = lsu_addr_B0;
    assign tgm_s_ldst_cmd_i_D = dec_s_op_o_Q;
    assign tgm_s_progbuf_mode_i_D = s_ex_progbuf_mode_Q;
    assign tgm_s_prv_i_D = r_prv_Q;
endmodule: codix_berkelium_ca_core_decode_stage_id_t
