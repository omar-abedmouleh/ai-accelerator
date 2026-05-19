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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_t' ASIP core.
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

module codix_berkelium_ca_core_t #(
    parameter [31:0] nmi_handler_p = 32'h20000004,
    parameter [31:0] itcm_size_p = 32'h00004000,
    parameter [31:0] itcm_baddr_p = 32'h02000000,
    parameter [31:0] dtcm_size_p = 32'h00004000,
    parameter [31:0] dtcm_baddr_p = 32'h03000000,
    parameter [31:0] cache_base_p = 32'h00010000,
    parameter [31:0] hart_id_p = 32'h00000000,
    parameter [31:0] pma_base0_p = 32'h20000000,
    parameter [31:0] pma_mask0_p = 32'hffe00000,
    parameter [15:0] pma_enable_p = 16'h003f,
    parameter [31:0] pma_base1_p = 32'h70010000,
    parameter [31:0] pma_mask1_p = 32'hffffff00,
    parameter [31:0] pma_base2_p = 32'h00020000,
    parameter [31:0] pma_mask2_p = 32'hfffffff0,
    parameter [31:0] pma_base3_p = 32'h00010000,
    parameter [31:0] pma_mask3_p = 32'hfffffe00,
    parameter [31:0] pma_base4_p = 32'h02000000,
    parameter [31:0] pma_mask4_p = 32'hffffc000,
    parameter [31:0] pma_base5_p = 32'h03000000,
    parameter [31:0] pma_mask5_p = 32'hffffc000,
    parameter [31:0] pma_base6_p = 32'h00000000,
    parameter [31:0] pma_mask6_p = 32'h00000000,
    parameter [31:0] pma_base7_p = 32'h00000000,
    parameter [31:0] pma_mask7_p = 32'h00000000,
    parameter [31:0] pma_base8_p = 32'h00000000,
    parameter [31:0] pma_mask8_p = 32'h00000000,
    parameter [31:0] pma_base9_p = 32'h00000000,
    parameter [31:0] pma_mask9_p = 32'h00000000,
    parameter [31:0] pma_base10_p = 32'h00000000,
    parameter [31:0] pma_mask10_p = 32'h00000000,
    parameter [31:0] pma_base11_p = 32'h00000000,
    parameter [31:0] pma_mask11_p = 32'h00000000,
    parameter [31:0] pma_base12_p = 32'h00000000,
    parameter [31:0] pma_mask12_p = 32'h00000000,
    parameter [31:0] pma_base13_p = 32'h00000000,
    parameter [31:0] pma_mask13_p = 32'h00000000,
    parameter [31:0] pma_base14_p = 32'h00000000,
    parameter [31:0] pma_mask14_p = 32'h00000000,
    parameter [31:0] pma_base15_p = 32'h00000000,
    parameter [31:0] pma_mask15_p = 32'h00000000,
    parameter [1:0] pma_cfg15_p = 2'h0,
    parameter [1:0] pma_cfg14_p = 2'h0,
    parameter [1:0] pma_cfg13_p = 2'h0,
    parameter [1:0] pma_cfg12_p = 2'h0,
    parameter [1:0] pma_cfg11_p = 2'h0,
    parameter [1:0] pma_cfg10_p = 2'h0,
    parameter [1:0] pma_cfg9_p = 2'h0,
    parameter [1:0] pma_cfg8_p = 2'h0,
    parameter [1:0] pma_cfg7_p = 2'h0,
    parameter [1:0] pma_cfg6_p = 2'h0,
    parameter [1:0] pma_cfg5_p = 2'h2,
    parameter [1:0] pma_cfg4_p = 2'h2,
    parameter [1:0] pma_cfg3_p = 2'h0,
    parameter [1:0] pma_cfg2_p = 2'h0,
    parameter [1:0] pma_cfg1_p = 2'h0,
    parameter [1:0] pma_cfg0_p = 2'h3,
    parameter [31:0] progbuf_base_p = 32'h00020000
) (
    input  logic CLK,
    input  logic execute_stage_div_s_div_ce_i_ICLK,
    input  logic execute_stage_fpu_add_sub_s_add_sub_ce_ICLK,
    input  logic execute_stage_fpu_float2int_s_f2i_ce_ICLK,
    input  logic execute_stage_fpu_fmul_s_fmul_ce_ICLK,
    input  logic execute_stage_fpu_fused_s_fused_ce_ICLK,
    input  logic execute_stage_fpu_int2float_s_i2f_ce_ICLK,
    input  logic execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK,
    input  logic execute_stage_lsu_s_load_ce_ICLK,
    input  logic execute_stage_lsu_s_lsu_ce_ICLK,
    input  logic execute_stage_lsu_s_store_ce_ICLK,
    input  logic fetch_stage_bp_bht_s_is_branch_i_ICLK,
    input  logic fetch_stage_bp_btb_s_is_branch_i_ICLK,
    input  logic fetch_stage_bp_btb_s_is_jump_i_ICLK,
    input  logic r_wfi_ce_ICLK,
    input  logic s_dm_active_ICLK,
    input  logic s_fpu_ce_ICLK,
    input  logic RST,
    input  logic [31:0] i1_if_cpu_fetch_HRDATA,
    input  logic i1_if_cpu_fetch_HREADY,
    input  logic i1_if_cpu_fetch_HRESP,
    input  logic [31:0] i1_if_cpu_ldst_HRDATA,
    input  logic i1_if_cpu_ldst_HREADY,
    input  logic i1_if_cpu_ldst_HRESP,
    input  logic [30:0] p_boot_addr_Q,
    input  logic p_cpu_stall_Q,
    input  logic p_dtcm_en_Q,
    input  logic [127:0] p_int_Q,
    input  logic p_itcm_en_Q,
    input  logic p_msip_Q,
    input  logic p_mtip_Q,
    input  logic [31:0] p_nmi_mtval_Q,
    input  logic p_nmi_Q,
    input  logic p_eviction_error_Q,
    input  logic [31:0] r_csr_dpc_BSC_D,
    input  logic r_csr_dpc_BSC_UPDATE,
    input  logic r_csr_dpc_DEBUG_MODE,
    input  logic [4:0] rf_gpr_BSC_A,
    input  logic [31:0] rf_gpr_BSC_D,
    input  logic rf_gpr_BSC_UPDATE,
    input  logic rf_gpr_DEBUG_MODE,
    input  logic s_dm_active_D,
    input  logic s_dm_halt_D,
    input  logic s_dm_progbuf_en_D,
    output logic codasip_halt_wire_D,
    output logic execute_stage_div_s_div_ce_i_Q,
    output logic execute_stage_fpu_add_sub_s_add_sub_ce_Q,
    output logic execute_stage_fpu_float2int_s_f2i_ce_Q,
    output logic execute_stage_fpu_fmul_s_fmul_ce_Q,
    output logic execute_stage_fpu_fused_s_fused_ce_Q,
    output logic execute_stage_fpu_int2float_s_i2f_ce_Q,
    output logic execute_stage_fpu_sqrt_div_s_sqrt_div_ce_Q,
    output logic execute_stage_lsu_s_load_ce_Q,
    output logic execute_stage_lsu_s_lsu_ce_Q,
    output logic execute_stage_lsu_s_store_ce_Q,
    output logic fetch_stage_bp_bht_s_is_branch_i_Q,
    output logic fetch_stage_bp_btb_s_is_branch_i_Q,
    output logic fetch_stage_bp_btb_s_is_jump_i_Q,
    output logic [31:0] i1_if_cpu_fetch_HADDR,
    output logic [2:0] i1_if_cpu_fetch_HBURST,
    output logic i1_if_cpu_fetch_HMASTLOCK,
    output logic [3:0] i1_if_cpu_fetch_HPROT,
    output logic [2:0] i1_if_cpu_fetch_HSIZE,
    output logic [1:0] i1_if_cpu_fetch_HTRANS,
    output logic i1_if_cpu_fetch_HWRITE,
    output logic [31:0] i1_if_cpu_ldst_HADDR,
    output logic [2:0] i1_if_cpu_ldst_HBURST,
    output logic i1_if_cpu_ldst_HMASTLOCK,
    output logic [3:0] i1_if_cpu_ldst_HPROT,
    output logic [2:0] i1_if_cpu_ldst_HSIZE,
    output logic [1:0] i1_if_cpu_ldst_HTRANS,
    output logic [31:0] i1_if_cpu_ldst_HWDATA,
    output logic i1_if_cpu_ldst_HWRITE,
    output logic i1_p_dtcm_en,
    output logic i1_p_itcm_en,
    output logic p_wfi_D,
    output logic [31:0] r_csr_dpc_BSC_Q,
    output logic r_wfi_ce_Q,
    output logic [31:0] rf_gpr_BSC_Q,
    output logic s_dm_active_Q,
    output logic s_dm_progbuf_done_Q,
    output logic s_dm_progbuf_exc_Q,
    output logic s_fpu_ce_Q,
    output logic s_hart_halted_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic s_fpu_ce;
    // CodAL signal/wire
    logic s_ex_fpu_busy;
    // CodAL signal/wire
    logic s_eviction_error;
    // CodAL signal/wire
    logic s_fe_flush;
    // CodAL signal/wire
    logic s_perf_ifu_stall;
    // CodAL signal/wire
    logic [31:0] s_id_instr_addr;
    // CodAL signal/wire
    logic s_id_clear;
    // CodAL signal/wire
    logic s_id_stall;
    // CodAL signal/wire
    logic s_perf_data_stall;
    // CodAL signal/wire
    logic [5:0] s_rd0_addr;
    // CodAL signal/wire
    logic [5:0] s_rd1_addr;
    // CodAL signal/wire
    logic [31:0] s_rd0_data;
    // CodAL signal/wire
    logic [31:0] s_rd1_data;
    // CodAL signal/wire
    logic s_rd0_we;
    // CodAL signal/wire
    logic s_rd1_we;
    // CodAL signal/wire
    logic s_rd0_write;
    // CodAL signal/wire
    logic s_rd1_write;
    // CodAL signal/wire
    logic [5:0] s_ex_rd_addr;
    // CodAL signal/wire
    logic [5:0] s_ex_p0_addr;
    // CodAL signal/wire
    logic [5:0] s_ex_p1_addr;
    // CodAL signal/wire
    logic [31:0] s_ex_rd_data;
    // CodAL signal/wire
    logic [31:0] s_fpu_dst_regs;
    // CodAL signal/wire
    logic s_ex_rd_we;
    // CodAL signal/wire
    logic s_ex_p0_we;
    // CodAL signal/wire
    logic s_ex_p1_we;
    // CodAL signal/wire
    logic s_ex_stall;
    // CodAL signal/wire
    logic s_ex_clear;
    // CodAL signal/wire
    logic s_ex1_stall;
    // CodAL signal/wire
    logic s_ex1_clear;
    // CodAL signal/wire
    logic s_flush;
    // CodAL signal/wire
    logic s_ex_fence_valid;
    // CodAL signal/wire
    logic s_wfi_prevent_fetch;
    // CodAL signal/wire
    logic [31:0] s_ex_branch_target_addr;
    // CodAL signal/wire
    logic s_ex_branch_miss;
    // CodAL signal/wire
    logic [31:0] s_ex_branch_instr_addr;
    // CodAL signal/wire
    logic [31:0] s_ex_branch_offset;
    // CodAL signal/wire
    logic s_ex_branch_taken;
    // CodAL signal/wire
    logic s_ex_branch_bht_update;
    // CodAL signal/wire
    logic s_ex_branch_btb_update;
    // CodAL signal/wire
    logic s_ex_branch_is_rvc;
    // CodAL signal/wire
    logic s_ex_return_link;
    // CodAL signal/wire
    logic s_ex_return_update;
    // CodAL signal/wire
    logic s_ex_bp_flush;
    // CodAL signal/wire
    logic s_ex_bp_flush_line;
    // CodAL signal/wire
    logic s_ex_bp_restart;
    // CodAL signal/wire
    logic s_ex_progbuf_mode;
    // CodAL signal/wire
    logic s_perf_branch_miss;
    // CodAL signal/wire
    logic s_perf_lsu_stall;
    // CodAL signal/wire
    logic s_perf_div_stall;
    // CodAL signal/wire
    logic s_perf_csr_flush;
    // CodAL signal/wire
    logic s_perf_exc_flush;
    // CodAL signal/wire
    logic s_perf_int_flush;
    // CodAL signal/wire
    logic [1:0] s_perf_we;
    // CodAL signal/wire
    logic [31:0] s_perf_wdata;
    // CodAL signal/wire
    logic [11:0] s_perf_waddr;
    // CodAL signal/wire
    logic s_perf_fpu_stall;
    // CodAL signal/wire
    logic s_dm_active;
    // CodAL signal/wire
    logic s_dm_halt;
    // CodAL signal/wire
    logic s_dm_progbuf_en;
    // CodAL signal/wire
    logic s_dm_progbuf_exc;
    // CodAL signal/wire
    logic s_dm_progbuf_done;
    // CodAL signal/wire
    logic s_hart_halted;
    // CodAL signal/wire
    logic s_progbuf_mode_active;

    // additional declarations:
    logic pipe_EX1_CLEAR_Q_wire;
    logic pipe_EX1_STALL_Q_wire;
    logic execute_stage_r_ex1_fu_WE_wire;
    logic [3:0] execute_stage_r_ex1_fu_D_wire;
    logic [3:0] r_ex1_fu_Q_wire;
    logic execute_stage_r_ex1_rd_addr_WE_wire;
    logic [5:0] execute_stage_r_ex1_rd_addr_D_wire;
    logic [5:0] r_ex1_rd_addr_Q_wire;
    logic execute_stage_r_ex1_instr_addr_WE_wire;
    logic [31:0] execute_stage_r_ex1_instr_addr_D_wire;
    logic [31:0] r_ex1_instr_addr_Q_wire;
    logic execute_stage_r_ex1_is_rvc_WE_wire;
    logic execute_stage_r_ex1_is_rvc_D_wire;
    logic r_ex1_is_rvc_Q_wire;
    logic pipe_FE_STALL_Q_wire;
    logic fetch_stage_r_fe_bp_addr_WE_wire;
    logic [31:0] fetch_stage_r_fe_bp_addr_D_wire;
    logic [31:0] r_fe_bp_addr_Q_wire;
    logic fetch_stage_r_fe_bp_taken_WE_wire;
    logic [1:0] fetch_stage_r_fe_bp_taken_D_wire;
    logic [1:0] r_fe_bp_taken_Q_wire;
    logic pipe_EX_CLEAR_Q_wire;
    logic pipe_EX_STALL_Q_wire;
    logic decode_stage_r_ex_instr_addr_WE_wire;
    logic [31:0] decode_stage_r_ex_instr_addr_D_wire;
    logic [31:0] r_ex_instr_addr_Q_wire;
    logic decode_stage_r_ex_instr_valid_WE_wire;
    logic decode_stage_r_ex_instr_valid_D_wire;
    logic r_ex_instr_valid_Q_wire;
    logic decode_stage_r_ex_op_WE_wire;
    logic [7:0] decode_stage_r_ex_op_D_wire;
    logic [7:0] r_ex_op_Q_wire;
    logic decode_stage_r_ex_fu_WE_wire;
    logic [3:0] decode_stage_r_ex_fu_D_wire;
    logic [3:0] r_ex_fu_Q_wire;
    logic decode_stage_r_ex_fu_s1_source_WE_wire;
    logic [1:0] decode_stage_r_ex_fu_s1_source_D_wire;
    logic [1:0] r_ex_fu_s1_source_Q_wire;
    logic decode_stage_r_ex_fu_s2_source_WE_wire;
    logic [1:0] decode_stage_r_ex_fu_s2_source_D_wire;
    logic [1:0] r_ex_fu_s2_source_Q_wire;
    logic decode_stage_r_ex_rs1_addr_WE_wire;
    logic [5:0] decode_stage_r_ex_rs1_addr_D_wire;
    logic [5:0] r_ex_rs1_addr_Q_wire;
    logic decode_stage_r_ex_rs2_addr_WE_wire;
    logic [5:0] decode_stage_r_ex_rs2_addr_D_wire;
    logic [5:0] r_ex_rs2_addr_Q_wire;
    logic decode_stage_r_ex_rd_addr_WE_wire;
    logic [5:0] decode_stage_r_ex_rd_addr_D_wire;
    logic [5:0] r_ex_rd_addr_Q_wire;
    logic decode_stage_r_ex_imm_WE_wire;
    logic [31:0] decode_stage_r_ex_imm_D_wire;
    logic [31:0] r_ex_imm_Q_wire;
    logic decode_stage_r_ex_is_rvc_WE_wire;
    logic decode_stage_r_ex_is_rvc_D_wire;
    logic r_ex_is_rvc_Q_wire;
    logic decode_stage_r_ex_lsu_addr_WE_wire;
    logic [31:0] decode_stage_r_ex_lsu_addr_D_wire;
    logic [31:0] r_ex_lsu_addr_Q_wire;
    logic decode_stage_r_ex_csr_addr_WE_wire;
    logic [11:0] decode_stage_r_ex_csr_addr_D_wire;
    logic [11:0] r_ex_csr_addr_Q_wire;
    logic decode_stage_r_ex_exc_type_WE_wire;
    logic [4:0] decode_stage_r_ex_exc_type_D_wire;
    logic [4:0] r_ex_exc_type_Q_wire;
    logic decode_stage_r_ex_exc_valid_WE_wire;
    logic decode_stage_r_ex_exc_valid_D_wire;
    logic r_ex_exc_valid_Q_wire;
    logic decode_stage_r_ex_exc_tval_WE_wire;
    logic [31:0] decode_stage_r_ex_exc_tval_D_wire;
    logic [31:0] r_ex_exc_tval_Q_wire;
    logic decode_stage_r_ex_bp_taken_WE_wire;
    logic decode_stage_r_ex_bp_taken_D_wire;
    logic r_ex_bp_taken_Q_wire;
    logic decode_stage_r_ex_bp_noincr_WE_wire;
    logic decode_stage_r_ex_bp_noincr_D_wire;
    logic r_ex_bp_noincr_Q_wire;
    logic decode_stage_r_ex_bp_addr_WE_wire;
    logic [31:0] decode_stage_r_ex_bp_addr_D_wire;
    logic [31:0] r_ex_bp_addr_Q_wire;
    logic decode_stage_r_ex_rm_WE_wire;
    logic [2:0] decode_stage_r_ex_rm_D_wire;
    logic [2:0] r_ex_rm_Q_wire;
    logic decode_stage_r_ex_rs3_addr_WE_wire;
    logic [5:0] decode_stage_r_ex_rs3_addr_D_wire;
    logic [5:0] r_ex_rs3_addr_Q_wire;
    logic decode_stage_r_ex_fu_s3_source_WE_wire;
    logic [1:0] decode_stage_r_ex_fu_s3_source_D_wire;
    logic [1:0] r_ex_fu_s3_source_Q_wire;
    logic decode_stage_r_ex_fpu_op_WE_wire;
    logic [5:0] decode_stage_r_ex_fpu_op_D_wire;
    logic [5:0] r_ex_fpu_op_Q_wire;
    logic execute_stage_r_nmi_i_WE_wire;
    logic execute_stage_r_nmi_i_D_wire;
    logic r_nmi_i_Q_wire;
    logic execute_stage_r_nmi_mtval_WE_wire;
    logic [31:0] execute_stage_r_nmi_mtval_D_wire;
    logic [31:0] r_nmi_mtval_Q_wire;
    logic execute_stage_r_nmi_source_WE_wire;
    logic execute_stage_r_nmi_source_D_wire;
    logic r_nmi_source_Q_wire;
    logic main_r_cpu_stall_WE_wire;
    logic main_r_cpu_stall_D_wire;
    logic r_cpu_stall_Q_wire;
    logic execute_stage_r_csr_dcsr_WE_wire;
    logic [31:0] execute_stage_r_csr_dcsr_D_wire;
    logic [31:0] r_csr_dcsr_Q_wire;
    logic [31:0] execute_stage_r_csr_dpc_D_wire;
    logic execute_stage_r_csr_dpc_WE_wire;
    logic [31:0] r_csr_dpc_Q_wire;
    logic execute_stage_r_csr_tselect_WE_wire;
    logic [31:0] execute_stage_r_csr_tselect_D_wire;
    logic [31:0] r_csr_tselect_Q_wire;
    logic execute_stage_r_csr_tcontrol_WE_wire;
    logic [31:0] execute_stage_r_csr_tcontrol_D_wire;
    logic [31:0] r_csr_tcontrol_Q_wire;
    logic execute_stage_r_csr_tdata1_r_RE_wire;
    logic [2:0] execute_stage_r_csr_tdata1_r_RA_wire;
    logic decode_stage_r_csr_tdata1_r0_RE_wire;
    logic [2:0] decode_stage_r_csr_tdata1_r0_RA_wire;
    logic decode_stage_r_csr_tdata1_r1_RE_wire;
    logic [2:0] decode_stage_r_csr_tdata1_r1_RA_wire;
    logic decode_stage_r_csr_tdata1_r2_RE_wire;
    logic [2:0] decode_stage_r_csr_tdata1_r2_RA_wire;
    logic decode_stage_r_csr_tdata1_r3_RE_wire;
    logic [2:0] decode_stage_r_csr_tdata1_r3_RA_wire;
    logic decode_stage_r_csr_tdata1_r4_RE_wire;
    logic [2:0] decode_stage_r_csr_tdata1_r4_RA_wire;
    logic decode_stage_r_csr_tdata1_r5_RE_wire;
    logic [2:0] decode_stage_r_csr_tdata1_r5_RA_wire;
    logic decode_stage_r_csr_tdata1_r6_RE_wire;
    logic [2:0] decode_stage_r_csr_tdata1_r6_RA_wire;
    logic decode_stage_r_csr_tdata1_r7_RE_wire;
    logic [2:0] decode_stage_r_csr_tdata1_r7_RA_wire;
    logic execute_stage_r_csr_tdata1_w_WE_wire;
    logic [2:0] execute_stage_r_csr_tdata1_w_WA_wire;
    logic [31:0] execute_stage_r_csr_tdata1_w_D_wire;
    logic [31:0] r_csr_tdata1_r_Q_wire;
    logic [31:0] r_csr_tdata1_r0_Q_wire;
    logic [31:0] r_csr_tdata1_r1_Q_wire;
    logic [31:0] r_csr_tdata1_r2_Q_wire;
    logic [31:0] r_csr_tdata1_r3_Q_wire;
    logic [31:0] r_csr_tdata1_r4_Q_wire;
    logic [31:0] r_csr_tdata1_r5_Q_wire;
    logic [31:0] r_csr_tdata1_r6_Q_wire;
    logic [31:0] r_csr_tdata1_r7_Q_wire;
    logic execute_stage_r_csr_tdata2_r_RE_wire;
    logic [2:0] execute_stage_r_csr_tdata2_r_RA_wire;
    logic decode_stage_r_csr_tdata2_r0_RE_wire;
    logic [2:0] decode_stage_r_csr_tdata2_r0_RA_wire;
    logic decode_stage_r_csr_tdata2_r1_RE_wire;
    logic [2:0] decode_stage_r_csr_tdata2_r1_RA_wire;
    logic decode_stage_r_csr_tdata2_r2_RE_wire;
    logic [2:0] decode_stage_r_csr_tdata2_r2_RA_wire;
    logic decode_stage_r_csr_tdata2_r3_RE_wire;
    logic [2:0] decode_stage_r_csr_tdata2_r3_RA_wire;
    logic decode_stage_r_csr_tdata2_r4_RE_wire;
    logic [2:0] decode_stage_r_csr_tdata2_r4_RA_wire;
    logic decode_stage_r_csr_tdata2_r5_RE_wire;
    logic [2:0] decode_stage_r_csr_tdata2_r5_RA_wire;
    logic decode_stage_r_csr_tdata2_r6_RE_wire;
    logic [2:0] decode_stage_r_csr_tdata2_r6_RA_wire;
    logic decode_stage_r_csr_tdata2_r7_RE_wire;
    logic [2:0] decode_stage_r_csr_tdata2_r7_RA_wire;
    logic execute_stage_r_csr_tdata2_w_WE_wire;
    logic [2:0] execute_stage_r_csr_tdata2_w_WA_wire;
    logic [31:0] execute_stage_r_csr_tdata2_w_D_wire;
    logic [31:0] r_csr_tdata2_r_Q_wire;
    logic [31:0] r_csr_tdata2_r0_Q_wire;
    logic [31:0] r_csr_tdata2_r1_Q_wire;
    logic [31:0] r_csr_tdata2_r2_Q_wire;
    logic [31:0] r_csr_tdata2_r3_Q_wire;
    logic [31:0] r_csr_tdata2_r4_Q_wire;
    logic [31:0] r_csr_tdata2_r5_Q_wire;
    logic [31:0] r_csr_tdata2_r6_Q_wire;
    logic [31:0] r_csr_tdata2_r7_Q_wire;
    logic execute_stage_r_csr_minstret_WE_wire;
    logic [63:0] execute_stage_r_csr_minstret_D_wire;
    logic [63:0] r_csr_minstret_Q_wire;
    logic execute_stage_r_csr_mcycle_WE_wire;
    logic [63:0] execute_stage_r_csr_mcycle_D_wire;
    logic [63:0] r_csr_mcycle_Q_wire;
    logic execute_stage_r_csr_mcountinhibit_WE_wire;
    logic [31:0] execute_stage_r_csr_mcountinhibit_D_wire;
    logic [31:0] r_csr_mcountinhibit_Q_wire;
    logic execute_stage_r_csr_mcounteren_WE_wire;
    logic [31:0] execute_stage_r_csr_mcounteren_D_wire;
    logic [31:0] r_csr_mcounteren_Q_wire;
    logic execute_stage_r_csr_mpicflag_WE_wire;
    logic [31:0] execute_stage_r_csr_mpicflag_D_wire;
    logic [31:0] r_csr_mpicflag_Q_wire;
    logic execute_stage_r_csr_mpicmask_WE_wire;
    logic [31:0] execute_stage_r_csr_mpicmask_D_wire;
    logic [31:0] r_csr_mpicmask_Q_wire;
    logic execute_stage_r_csr_mpicflag1_WE_wire;
    logic [31:0] execute_stage_r_csr_mpicflag1_D_wire;
    logic [31:0] r_csr_mpicflag1_Q_wire;
    logic execute_stage_r_csr_mpicmask1_WE_wire;
    logic [31:0] execute_stage_r_csr_mpicmask1_D_wire;
    logic [31:0] r_csr_mpicmask1_Q_wire;
    logic execute_stage_r_csr_mpicflag2_WE_wire;
    logic [31:0] execute_stage_r_csr_mpicflag2_D_wire;
    logic [31:0] r_csr_mpicflag2_Q_wire;
    logic execute_stage_r_csr_mpicmask2_WE_wire;
    logic [31:0] execute_stage_r_csr_mpicmask2_D_wire;
    logic [31:0] r_csr_mpicmask2_Q_wire;
    logic execute_stage_r_csr_mpicflag3_WE_wire;
    logic [31:0] execute_stage_r_csr_mpicflag3_D_wire;
    logic [31:0] r_csr_mpicflag3_Q_wire;
    logic execute_stage_r_csr_mpicmask3_WE_wire;
    logic [31:0] execute_stage_r_csr_mpicmask3_D_wire;
    logic [31:0] r_csr_mpicmask3_Q_wire;
    logic execute_stage_r_csr_mitcmen_WE_wire;
    logic execute_stage_r_csr_mitcmen_D_wire;
    logic r_csr_mitcmen_Q_wire;
    logic execute_stage_r_csr_mdtcmen_WE_wire;
    logic execute_stage_r_csr_mdtcmen_D_wire;
    logic r_csr_mdtcmen_Q_wire;
    logic execute_stage_r_csr_mip_WE_wire;
    logic [31:0] execute_stage_r_csr_mip_D_wire;
    logic [31:0] r_csr_mip_Q_wire;
    logic execute_stage_r_csr_mie_WE_wire;
    logic [31:0] execute_stage_r_csr_mie_D_wire;
    logic [31:0] r_csr_mie_Q_wire;
    logic execute_stage_r_csr_mtval_WE_wire;
    logic [31:0] execute_stage_r_csr_mtval_D_wire;
    logic [31:0] r_csr_mtval_Q_wire;
    logic execute_stage_r_csr_mepc_WE_wire;
    logic [31:0] execute_stage_r_csr_mepc_D_wire;
    logic [31:0] r_csr_mepc_Q_wire;
    logic execute_stage_r_csr_mcause_WE_wire;
    logic [31:0] execute_stage_r_csr_mcause_D_wire;
    logic [31:0] r_csr_mcause_Q_wire;
    logic execute_stage_r_csr_mexcause_WE_wire;
    logic [31:0] execute_stage_r_csr_mexcause_D_wire;
    logic [31:0] r_csr_mexcause_Q_wire;
    logic execute_stage_r_csr_mscratch_WE_wire;
    logic [31:0] execute_stage_r_csr_mscratch_D_wire;
    logic [31:0] r_csr_mscratch_Q_wire;
    logic execute_stage_r_csr_mtvec_WE_wire;
    logic [31:0] execute_stage_r_csr_mtvec_D_wire;
    logic [31:0] r_csr_mtvec_Q_wire;
    logic execute_stage_r_csr_mstatus_WE_wire;
    logic [31:0] execute_stage_r_csr_mstatus_D_wire;
    logic [31:0] r_csr_mstatus_Q_wire;
    logic execute_stage_r_csr_pmpaddr0_WE_wire;
    logic [31:0] execute_stage_r_csr_pmpaddr0_D_wire;
    logic [31:0] r_csr_pmpaddr0_Q_wire;
    logic execute_stage_r_csr_pmpaddr1_WE_wire;
    logic [31:0] execute_stage_r_csr_pmpaddr1_D_wire;
    logic [31:0] r_csr_pmpaddr1_Q_wire;
    logic execute_stage_r_csr_pmpaddr2_WE_wire;
    logic [31:0] execute_stage_r_csr_pmpaddr2_D_wire;
    logic [31:0] r_csr_pmpaddr2_Q_wire;
    logic execute_stage_r_csr_pmpaddr3_WE_wire;
    logic [31:0] execute_stage_r_csr_pmpaddr3_D_wire;
    logic [31:0] r_csr_pmpaddr3_Q_wire;
    logic execute_stage_r_csr_pmpaddr4_WE_wire;
    logic [31:0] execute_stage_r_csr_pmpaddr4_D_wire;
    logic [31:0] r_csr_pmpaddr4_Q_wire;
    logic execute_stage_r_csr_pmpaddr5_WE_wire;
    logic [31:0] execute_stage_r_csr_pmpaddr5_D_wire;
    logic [31:0] r_csr_pmpaddr5_Q_wire;
    logic execute_stage_r_csr_pmpaddr6_WE_wire;
    logic [31:0] execute_stage_r_csr_pmpaddr6_D_wire;
    logic [31:0] r_csr_pmpaddr6_Q_wire;
    logic execute_stage_r_csr_pmpaddr7_WE_wire;
    logic [31:0] execute_stage_r_csr_pmpaddr7_D_wire;
    logic [31:0] r_csr_pmpaddr7_Q_wire;
    logic execute_stage_r_csr_pmpaddr8_WE_wire;
    logic [31:0] execute_stage_r_csr_pmpaddr8_D_wire;
    logic [31:0] r_csr_pmpaddr8_Q_wire;
    logic execute_stage_r_csr_pmpaddr9_WE_wire;
    logic [31:0] execute_stage_r_csr_pmpaddr9_D_wire;
    logic [31:0] r_csr_pmpaddr9_Q_wire;
    logic execute_stage_r_csr_pmpaddr10_WE_wire;
    logic [31:0] execute_stage_r_csr_pmpaddr10_D_wire;
    logic [31:0] r_csr_pmpaddr10_Q_wire;
    logic execute_stage_r_csr_pmpaddr11_WE_wire;
    logic [31:0] execute_stage_r_csr_pmpaddr11_D_wire;
    logic [31:0] r_csr_pmpaddr11_Q_wire;
    logic execute_stage_r_csr_pmpaddr12_WE_wire;
    logic [31:0] execute_stage_r_csr_pmpaddr12_D_wire;
    logic [31:0] r_csr_pmpaddr12_Q_wire;
    logic execute_stage_r_csr_pmpaddr13_WE_wire;
    logic [31:0] execute_stage_r_csr_pmpaddr13_D_wire;
    logic [31:0] r_csr_pmpaddr13_Q_wire;
    logic execute_stage_r_csr_pmpaddr14_WE_wire;
    logic [31:0] execute_stage_r_csr_pmpaddr14_D_wire;
    logic [31:0] r_csr_pmpaddr14_Q_wire;
    logic execute_stage_r_csr_pmpaddr15_WE_wire;
    logic [31:0] execute_stage_r_csr_pmpaddr15_D_wire;
    logic [31:0] r_csr_pmpaddr15_Q_wire;
    logic execute_stage_r_csr_pmpcfg0_WE_wire;
    logic [31:0] execute_stage_r_csr_pmpcfg0_D_wire;
    logic [31:0] r_csr_pmpcfg0_Q_wire;
    logic execute_stage_r_csr_pmpcfg1_WE_wire;
    logic [31:0] execute_stage_r_csr_pmpcfg1_D_wire;
    logic [31:0] r_csr_pmpcfg1_Q_wire;
    logic execute_stage_r_csr_pmpcfg2_WE_wire;
    logic [31:0] execute_stage_r_csr_pmpcfg2_D_wire;
    logic [31:0] r_csr_pmpcfg2_Q_wire;
    logic execute_stage_r_csr_pmpcfg3_WE_wire;
    logic [31:0] execute_stage_r_csr_pmpcfg3_D_wire;
    logic [31:0] r_csr_pmpcfg3_Q_wire;
    logic execute_stage_r_prv_WE_wire;
    logic [1:0] execute_stage_r_prv_D_wire;
    logic [1:0] r_prv_Q_wire;
    logic execute_stage_r_csr_fcsr_WE_wire;
    logic [31:0] execute_stage_r_csr_fcsr_D_wire;
    logic [31:0] r_csr_fcsr_Q_wire;
    logic main_r_reset_init_WE_wire;
    logic main_r_reset_init_D_wire;
    logic r_reset_init_Q_wire;
    logic main_r_syscall_addr_WE_wire;
    logic [31:0] main_r_syscall_addr_D_wire;
    logic [31:0] r_syscall_addr_Q_wire;
    logic fetch_stage_r_PC_WE_wire;
    logic [31:0] fetch_stage_r_PC_D_wire;
    logic [31:0] r_PC_Q_wire;
    logic [4:0] decode_stage_rf_gpr_r0_RA_wire;
    logic decode_stage_rf_gpr_r0_RE_wire;
    logic [4:0] execute_stage_rf_gpr_r1_RA_wire;
    logic execute_stage_rf_gpr_r1_RE_wire;
    logic [4:0] execute_stage_rf_gpr_r2_RA_wire;
    logic execute_stage_rf_gpr_r2_RE_wire;
    logic [31:0] execute_stage_rf_gpr_w0_D_wire;
    logic [4:0] execute_stage_rf_gpr_w0_WA_wire;
    logic execute_stage_rf_gpr_w0_WE_wire;
    logic [31:0] execute_stage_rf_gpr_w1_D_wire;
    logic [4:0] execute_stage_rf_gpr_w1_WA_wire;
    logic execute_stage_rf_gpr_w1_WE_wire;
    logic [31:0] rf_gpr_r0_Q_wire;
    logic [31:0] rf_gpr_r1_Q_wire;
    logic [31:0] rf_gpr_r2_Q_wire;
    logic execute_stage_rf_fr_r1_RE_wire;
    logic [4:0] execute_stage_rf_fr_r1_RA_wire;
    logic execute_stage_rf_fr_r2_RE_wire;
    logic [4:0] execute_stage_rf_fr_r2_RA_wire;
    logic execute_stage_rf_fr_r3_RE_wire;
    logic [4:0] execute_stage_rf_fr_r3_RA_wire;
    logic execute_stage_rf_fr_w_WE_wire;
    logic [4:0] execute_stage_rf_fr_w_WA_wire;
    logic [31:0] execute_stage_rf_fr_w_D_wire;
    logic [31:0] rf_fr_r1_Q_wire;
    logic [31:0] rf_fr_r2_Q_wire;
    logic [31:0] rf_fr_r3_Q_wire;
    logic execute_stage_r_wfi_ce_WE_wire;
    logic execute_stage_r_wfi_ce_D_wire;
    logic r_wfi_ce_Q_wire;
    logic control_fpu_CONTROL_CLEAR_Q_wire;
    logic control_fpu_CONTROL_STALL_Q_wire;
    logic control_fpu_ROB_CLEAR_Q_wire;
    logic fetch_stage_ifu_s_bus_busy_o_Q_wire;
    logic [31:0] main_execute_stage_ira_r_return_address_D_wire;
    logic main_execute_stage_ira_r_return_address_WE_wire;
    logic [63:0] perf_r_mhpmcounter10_Q_wire;
    logic [63:0] perf_r_mhpmcounter12_Q_wire;
    logic [63:0] perf_r_mhpmcounter13_Q_wire;
    logic [63:0] perf_r_mhpmcounter14_Q_wire;
    logic [63:0] perf_r_mhpmcounter15_Q_wire;
    logic [63:0] perf_r_mhpmcounter3_Q_wire;
    logic [63:0] perf_r_mhpmcounter4_Q_wire;
    logic [63:0] perf_r_mhpmcounter5_Q_wire;
    logic [63:0] perf_r_mhpmcounter6_Q_wire;
    logic [63:0] perf_r_mhpmcounter9_Q_wire;
    logic pipe_add_sub_COMPUTE_CLEAR_Q_wire;
    logic pipe_add_sub_COMPUTE_STALL_Q_wire;
    logic pipe_add_sub_POSTNORM_CLEAR_Q_wire;
    logic pipe_add_sub_POSTNORM_STALL_Q_wire;
    logic pipe_add_sub_ROUNDING_CLEAR_Q_wire;
    logic pipe_add_sub_ROUNDING_STALL_Q_wire;
    logic pipe_f2i_F2I_CLEAR_Q_wire;
    logic pipe_f2i_F2I_STALL_Q_wire;
    logic pipe_fmul_MUL_CLEAR_Q_wire;
    logic pipe_fmul_POSTNORM1_CLEAR_Q_wire;
    logic pipe_fmul_POSTNORM2_CLEAR_Q_wire;
    logic pipe_fmul_ROUNDING_CLEAR_Q_wire;
    logic pipe_fused_ADDSUB_CLEAR_Q_wire;
    logic pipe_fused_POSTNORM_ADDSUB_CLEAR_Q_wire;
    logic pipe_fused_POSTNORM_MUL1_CLEAR_Q_wire;
    logic pipe_fused_POSTNORM_MUL2_CLEAR_Q_wire;
    logic pipe_fused_PRENORM_ADDSUB_CLEAR_Q_wire;
    logic pipe_fused_ROUNDING_CLEAR_Q_wire;
    logic pipe_fused_WAIT_MUL_CLEAR_Q_wire;
    logic pipe_i2f_COMPUTE_CLEAR_Q_wire;
    logic pipe_i2f_COMPUTE_STALL_Q_wire;
    logic pipe_i2f_ROUNDING_CLEAR_Q_wire;
    logic pipe_i2f_ROUNDING_STALL_Q_wire;
    logic pipe_sqrt_div_SQRT_DIV_CLEAR_Q_wire;
    logic pl_lsu_FIN_CLEAR_Q_wire;
    logic pl_lsu_FIN_STALL_Q_wire;
    logic execute_stage_bru_s_branch_bht_update_o_Q_wire;
    logic execute_stage_bru_s_is_jump_o_Q_wire;
    logic [31:0] execute_stage_bru_s_rd_data_o_Q_wire;
    logic execute_stage_control_fpu_CONTROL_CLEAR_D_wire;
    logic execute_stage_control_fpu_CONTROL_STALL_D_wire;
    logic execute_stage_control_fpu_ROB_CLEAR_D_wire;
    logic [31:0] execute_stage_crf_s_csr_addr_o_Q_wire;
    logic execute_stage_crf_s_csr_valid_o_Q_wire;
    logic [12:0] execute_stage_crf_s_hpm_inhibit_o_Q_wire;
    logic execute_stage_crf_s_perf_inhibit_o_Q_wire;
    logic [31:0] execute_stage_crf_s_trap_addr_o_Q_wire;
    logic execute_stage_crf_s_trap_valid_o_Q_wire;
    logic execute_stage_halt_ACT_wire;
    logic [31:0] execute_stage_lsu_pmp_r_pmp0_napot_mask_Q_wire;
    logic [31:0] execute_stage_lsu_pmp_r_pmp10_napot_mask_Q_wire;
    logic [31:0] execute_stage_lsu_pmp_r_pmp11_napot_mask_Q_wire;
    logic [31:0] execute_stage_lsu_pmp_r_pmp12_napot_mask_Q_wire;
    logic [31:0] execute_stage_lsu_pmp_r_pmp13_napot_mask_Q_wire;
    logic [31:0] execute_stage_lsu_pmp_r_pmp14_napot_mask_Q_wire;
    logic [31:0] execute_stage_lsu_pmp_r_pmp15_napot_mask_Q_wire;
    logic [31:0] execute_stage_lsu_pmp_r_pmp1_napot_mask_Q_wire;
    logic [31:0] execute_stage_lsu_pmp_r_pmp2_napot_mask_Q_wire;
    logic [31:0] execute_stage_lsu_pmp_r_pmp3_napot_mask_Q_wire;
    logic [31:0] execute_stage_lsu_pmp_r_pmp4_napot_mask_Q_wire;
    logic [31:0] execute_stage_lsu_pmp_r_pmp5_napot_mask_Q_wire;
    logic [31:0] execute_stage_lsu_pmp_r_pmp6_napot_mask_Q_wire;
    logic [31:0] execute_stage_lsu_pmp_r_pmp7_napot_mask_Q_wire;
    logic [31:0] execute_stage_lsu_pmp_r_pmp8_napot_mask_Q_wire;
    logic [31:0] execute_stage_lsu_pmp_r_pmp9_napot_mask_Q_wire;
    logic [31:0] execute_stage_ocd_s_ocd_addr_o_Q_wire;
    logic execute_stage_ocd_s_ocd_busy_o_Q_wire;
    logic execute_stage_ocd_s_ocd_progbuf_mode_o_Q_wire;
    logic execute_stage_ocd_s_ocd_valid_o_Q_wire;
    logic execute_stage_pipe_add_sub_COMPUTE_CLEAR_D_wire;
    logic execute_stage_pipe_add_sub_COMPUTE_STALL_D_wire;
    logic execute_stage_pipe_add_sub_POSTNORM_CLEAR_D_wire;
    logic execute_stage_pipe_add_sub_POSTNORM_STALL_D_wire;
    logic execute_stage_pipe_add_sub_ROUNDING_CLEAR_D_wire;
    logic execute_stage_pipe_add_sub_ROUNDING_STALL_D_wire;
    logic execute_stage_pipe_f2i_F2I_CLEAR_D_wire;
    logic execute_stage_pipe_f2i_F2I_STALL_D_wire;
    logic execute_stage_pipe_fmul_MUL_CLEAR_D_wire;
    logic execute_stage_pipe_fmul_POSTNORM1_CLEAR_D_wire;
    logic execute_stage_pipe_fmul_POSTNORM2_CLEAR_D_wire;
    logic execute_stage_pipe_fmul_ROUNDING_CLEAR_D_wire;
    logic execute_stage_pipe_fused_ADDSUB_CLEAR_D_wire;
    logic execute_stage_pipe_fused_POSTNORM_ADDSUB_CLEAR_D_wire;
    logic execute_stage_pipe_fused_POSTNORM_MUL1_CLEAR_D_wire;
    logic execute_stage_pipe_fused_POSTNORM_MUL2_CLEAR_D_wire;
    logic execute_stage_pipe_fused_PRENORM_ADDSUB_CLEAR_D_wire;
    logic execute_stage_pipe_fused_ROUNDING_CLEAR_D_wire;
    logic execute_stage_pipe_fused_WAIT_MUL_CLEAR_D_wire;
    logic execute_stage_pipe_i2f_COMPUTE_CLEAR_D_wire;
    logic execute_stage_pipe_i2f_COMPUTE_STALL_D_wire;
    logic execute_stage_pipe_i2f_ROUNDING_CLEAR_D_wire;
    logic execute_stage_pipe_i2f_ROUNDING_STALL_D_wire;
    logic execute_stage_pipe_sqrt_div_SQRT_DIV_CLEAR_D_wire;
    logic execute_stage_pl_lsu_FIN_CLEAR_D_wire;
    logic execute_stage_pl_lsu_FIN_STALL_D_wire;
    logic decode_stage_fetch_stage_ifb_s_flush_i_D_wire;
    logic decode_stage_fetch_stage_ifb_s_pop_i_D_wire;
    logic pl_ifu_FIN_CLEAR_Q_wire;
    logic pl_ifu_FIN_STALL_Q_wire;
    logic [31:0] fetch_stage_ifb_s_addr_o_Q_wire;
    logic [31:0] fetch_stage_ifb_s_bp_addr_o_Q_wire;
    logic [1:0] fetch_stage_ifb_s_bp_taken_o_Q_wire;
    logic [31:0] fetch_stage_ifb_s_data_o_Q_wire;
    logic fetch_stage_ifb_s_empty_o_Q_wire;
    logic [4:0] fetch_stage_ifb_s_exc_type_o_Q_wire;
    logic fetch_stage_ifb_s_exc_valid_o_Q_wire;
    logic fetch_stage_ifb_s_full_o_Q_wire;
    logic [1:0] fetch_stage_ifb_s_valid_o_Q_wire;
    logic fetch_stage_ifu_s_ifu_busy_o_Q_wire;
    logic fetch_stage_pl_ifu_FIN_CLEAR_D_wire;
    logic fetch_stage_pl_ifu_FIN_STALL_D_wire;
    logic main_perf_s_branch_miss_i_D_wire;
    logic main_perf_s_csr_flush_i_D_wire;
    logic main_perf_s_data_stall_i_D_wire;
    logic main_perf_s_div_stall_i_D_wire;
    logic main_perf_s_exc_flush_i_D_wire;
    logic main_perf_s_flush_i_D_wire;
    logic main_perf_s_fpu_stall_i_D_wire;
    logic [12:0] main_perf_s_hpm_inhibit_i_D_wire;
    logic main_perf_s_ifu_stall_i_D_wire;
    logic main_perf_s_inhibit_i_D_wire;
    logic main_perf_s_int_flush_i_D_wire;
    logic main_perf_s_lsu_stall_i_D_wire;
    logic [11:0] main_perf_s_perf_waddr_i_D_wire;
    logic [31:0] main_perf_s_perf_wdata_i_D_wire;
    logic [1:0] main_perf_s_perf_we_i_D_wire;
    logic main_plc_s_ex1_clear_i_D_wire;
    logic main_plc_s_ex1_stall_i_D_wire;
    logic main_plc_s_ex_clear_i_D_wire;
    logic main_plc_s_ex_stall_i_D_wire;
    logic main_plc_s_flush_i_D_wire;
    logic main_plc_s_id_clear_i_D_wire;
    logic plc_pipe_EX1_CLEAR_D_wire;
    logic plc_pipe_EX1_STALL_D_wire;
    logic plc_pipe_EX_CLEAR_D_wire;
    logic plc_pipe_EX_STALL_D_wire;
    logic plc_pipe_FE_STALL_D_wire;

    // child instances inside ASIP core:
    // instance of 's_fpu_ce' CodAL signal/wire: (parent port driver(s))
    assign s_fpu_ce_Q = s_fpu_ce;
    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd4),
        .DEFAULT_VALUE(4'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex1_fu (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX1_CLEAR_Q_wire),
        .STALL(pipe_EX1_STALL_Q_wire),
        .WE(execute_stage_r_ex1_fu_WE_wire),
        .D(execute_stage_r_ex1_fu_D_wire),
        .Q(r_ex1_fu_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex1_rd_addr (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX1_CLEAR_Q_wire),
        .STALL(pipe_EX1_STALL_Q_wire),
        .WE(execute_stage_r_ex1_rd_addr_WE_wire),
        .D(execute_stage_r_ex1_rd_addr_D_wire),
        .Q(r_ex1_rd_addr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex1_instr_addr (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX1_CLEAR_Q_wire),
        .STALL(pipe_EX1_STALL_Q_wire),
        .WE(execute_stage_r_ex1_instr_addr_WE_wire),
        .D(execute_stage_r_ex1_instr_addr_D_wire),
        .Q(r_ex1_instr_addr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex1_is_rvc (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX1_CLEAR_Q_wire),
        .STALL(pipe_EX1_STALL_Q_wire),
        .WE(execute_stage_r_ex1_is_rvc_WE_wire),
        .D(execute_stage_r_ex1_is_rvc_D_wire),
        .Q(r_ex1_is_rvc_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_fe_bp_addr (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .STALL(pipe_FE_STALL_Q_wire),
        .WE(fetch_stage_r_fe_bp_addr_WE_wire),
        .D(fetch_stage_r_fe_bp_addr_D_wire),
        .Q(r_fe_bp_addr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_fe_bp_taken (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .STALL(pipe_FE_STALL_Q_wire),
        .WE(fetch_stage_r_fe_bp_taken_WE_wire),
        .D(fetch_stage_r_fe_bp_taken_D_wire),
        .Q(r_fe_bp_taken_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_instr_addr (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(decode_stage_r_ex_instr_addr_WE_wire),
        .D(decode_stage_r_ex_instr_addr_D_wire),
        .Q(r_ex_instr_addr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_instr_valid (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(decode_stage_r_ex_instr_valid_WE_wire),
        .D(decode_stage_r_ex_instr_valid_D_wire),
        .Q(r_ex_instr_valid_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd8),
        .DEFAULT_VALUE(8'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_op (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(decode_stage_r_ex_op_WE_wire),
        .D(decode_stage_r_ex_op_D_wire),
        .Q(r_ex_op_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd4),
        .DEFAULT_VALUE(4'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_fu (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(decode_stage_r_ex_fu_WE_wire),
        .D(decode_stage_r_ex_fu_D_wire),
        .Q(r_ex_fu_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_fu_s1_source (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(decode_stage_r_ex_fu_s1_source_WE_wire),
        .D(decode_stage_r_ex_fu_s1_source_D_wire),
        .Q(r_ex_fu_s1_source_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_fu_s2_source (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(decode_stage_r_ex_fu_s2_source_WE_wire),
        .D(decode_stage_r_ex_fu_s2_source_D_wire),
        .Q(r_ex_fu_s2_source_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_rs1_addr (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(decode_stage_r_ex_rs1_addr_WE_wire),
        .D(decode_stage_r_ex_rs1_addr_D_wire),
        .Q(r_ex_rs1_addr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_rs2_addr (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(decode_stage_r_ex_rs2_addr_WE_wire),
        .D(decode_stage_r_ex_rs2_addr_D_wire),
        .Q(r_ex_rs2_addr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_rd_addr (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(decode_stage_r_ex_rd_addr_WE_wire),
        .D(decode_stage_r_ex_rd_addr_D_wire),
        .Q(r_ex_rd_addr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_imm (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(decode_stage_r_ex_imm_WE_wire),
        .D(decode_stage_r_ex_imm_D_wire),
        .Q(r_ex_imm_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_is_rvc (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(decode_stage_r_ex_is_rvc_WE_wire),
        .D(decode_stage_r_ex_is_rvc_D_wire),
        .Q(r_ex_is_rvc_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_lsu_addr (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(decode_stage_r_ex_lsu_addr_WE_wire),
        .D(decode_stage_r_ex_lsu_addr_D_wire),
        .Q(r_ex_lsu_addr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd12),
        .DEFAULT_VALUE(12'h000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_csr_addr (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(decode_stage_r_ex_csr_addr_WE_wire),
        .D(decode_stage_r_ex_csr_addr_D_wire),
        .Q(r_ex_csr_addr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_exc_type (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(decode_stage_r_ex_exc_type_WE_wire),
        .D(decode_stage_r_ex_exc_type_D_wire),
        .Q(r_ex_exc_type_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_exc_valid (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(decode_stage_r_ex_exc_valid_WE_wire),
        .D(decode_stage_r_ex_exc_valid_D_wire),
        .Q(r_ex_exc_valid_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_exc_tval (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(decode_stage_r_ex_exc_tval_WE_wire),
        .D(decode_stage_r_ex_exc_tval_D_wire),
        .Q(r_ex_exc_tval_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_bp_taken (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(decode_stage_r_ex_bp_taken_WE_wire),
        .D(decode_stage_r_ex_bp_taken_D_wire),
        .Q(r_ex_bp_taken_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_bp_noincr (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(decode_stage_r_ex_bp_noincr_WE_wire),
        .D(decode_stage_r_ex_bp_noincr_D_wire),
        .Q(r_ex_bp_noincr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_bp_addr (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(decode_stage_r_ex_bp_addr_WE_wire),
        .D(decode_stage_r_ex_bp_addr_D_wire),
        .Q(r_ex_bp_addr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_rm (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(decode_stage_r_ex_rm_WE_wire),
        .D(decode_stage_r_ex_rm_D_wire),
        .Q(r_ex_rm_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_rs3_addr (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(decode_stage_r_ex_rs3_addr_WE_wire),
        .D(decode_stage_r_ex_rs3_addr_D_wire),
        .Q(r_ex_rs3_addr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_fu_s3_source (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(decode_stage_r_ex_fu_s3_source_WE_wire),
        .D(decode_stage_r_ex_fu_s3_source_D_wire),
        .Q(r_ex_fu_s3_source_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_fpu_op (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(decode_stage_r_ex_fpu_op_WE_wire),
        .D(decode_stage_r_ex_fpu_op_D_wire),
        .Q(r_ex_fpu_op_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_nmi_i (
        .CLK(CLK),
        .RST(RST),
        .WE(execute_stage_r_nmi_i_WE_wire),
        .D(execute_stage_r_nmi_i_D_wire),
        .Q(r_nmi_i_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_nmi_mtval (
        .CLK(CLK),
        .RST(RST),
        .WE(execute_stage_r_nmi_mtval_WE_wire),
        .D(execute_stage_r_nmi_mtval_D_wire),
        .Q(r_nmi_mtval_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_nmi_source (
        .CLK(CLK),
        .RST(RST),
        .WE(execute_stage_r_nmi_source_WE_wire),
        .D(execute_stage_r_nmi_source_D_wire),
        .Q(r_nmi_source_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b1),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_cpu_stall (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(main_r_cpu_stall_WE_wire),
        .D(main_r_cpu_stall_D_wire),
        .Q(r_cpu_stall_Q_wire)
    );

    // instance of 's_dm_active' CodAL signal/wire: (single driver)
    assign s_dm_active = s_dm_active_D;
    // instance of 's_dm_active' CodAL signal/wire: (parent port driver(s))
    assign s_dm_active_Q = s_dm_active;
    // instance of 's_dm_halt' CodAL signal/wire: (single driver)
    assign s_dm_halt = s_dm_halt_D;
    // instance of 's_dm_progbuf_en' CodAL signal/wire: (single driver)
    assign s_dm_progbuf_en = s_dm_progbuf_en_D;
    // instance of 's_dm_progbuf_exc' CodAL signal/wire: (parent port driver(s))
    assign s_dm_progbuf_exc_Q = s_dm_progbuf_exc;
    // instance of 's_dm_progbuf_done' CodAL signal/wire: (parent port driver(s))
    assign s_dm_progbuf_done_Q = s_dm_progbuf_done;
    // instance of 's_hart_halted' CodAL signal/wire: (parent port driver(s))
    assign s_hart_halted_Q = s_hart_halted;
    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h40000403),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_dcsr (
        .CLK(s_dm_active_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_dcsr_WE_wire),
        .D(execute_stage_r_csr_dcsr_D_wire),
        .Q(r_csr_dcsr_Q_wire)
    );

    // register instance:
    bsc_d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h20000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_dpc (
        .CLK(s_dm_active_ICLK),
        .RST(RST),
        .BSC_D(r_csr_dpc_BSC_D),
        .BSC_UPDATE(r_csr_dpc_BSC_UPDATE),
        .D(execute_stage_r_csr_dpc_D_wire),
        .DEBUG_MODE(r_csr_dpc_DEBUG_MODE),
        .WE(execute_stage_r_csr_dpc_WE_wire),
        .BSC_Q(r_csr_dpc_BSC_Q),
        .Q(r_csr_dpc_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_tselect (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_tselect_WE_wire),
        .D(execute_stage_r_csr_tselect_D_wire),
        .Q(r_csr_tselect_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_tcontrol (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_tcontrol_WE_wire),
        .D(execute_stage_r_csr_tcontrol_D_wire),
        .Q(r_csr_tcontrol_Q_wire)
    );

    // CodAL register file instance:
    codix_berkelium_ca_core_r_csr_tdata1_t r_csr_tdata1 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .r_RE(execute_stage_r_csr_tdata1_r_RE_wire),
        .r_RA(execute_stage_r_csr_tdata1_r_RA_wire),
        .r0_RE(decode_stage_r_csr_tdata1_r0_RE_wire),
        .r0_RA(decode_stage_r_csr_tdata1_r0_RA_wire),
        .r1_RE(decode_stage_r_csr_tdata1_r1_RE_wire),
        .r1_RA(decode_stage_r_csr_tdata1_r1_RA_wire),
        .r2_RE(decode_stage_r_csr_tdata1_r2_RE_wire),
        .r2_RA(decode_stage_r_csr_tdata1_r2_RA_wire),
        .r3_RE(decode_stage_r_csr_tdata1_r3_RE_wire),
        .r3_RA(decode_stage_r_csr_tdata1_r3_RA_wire),
        .r4_RE(decode_stage_r_csr_tdata1_r4_RE_wire),
        .r4_RA(decode_stage_r_csr_tdata1_r4_RA_wire),
        .r5_RE(decode_stage_r_csr_tdata1_r5_RE_wire),
        .r5_RA(decode_stage_r_csr_tdata1_r5_RA_wire),
        .r6_RE(decode_stage_r_csr_tdata1_r6_RE_wire),
        .r6_RA(decode_stage_r_csr_tdata1_r6_RA_wire),
        .r7_RE(decode_stage_r_csr_tdata1_r7_RE_wire),
        .r7_RA(decode_stage_r_csr_tdata1_r7_RA_wire),
        .w_WE(execute_stage_r_csr_tdata1_w_WE_wire),
        .w_WA(execute_stage_r_csr_tdata1_w_WA_wire),
        .w_D(execute_stage_r_csr_tdata1_w_D_wire),
        .r_Q(r_csr_tdata1_r_Q_wire),
        .r0_Q(r_csr_tdata1_r0_Q_wire),
        .r1_Q(r_csr_tdata1_r1_Q_wire),
        .r2_Q(r_csr_tdata1_r2_Q_wire),
        .r3_Q(r_csr_tdata1_r3_Q_wire),
        .r4_Q(r_csr_tdata1_r4_Q_wire),
        .r5_Q(r_csr_tdata1_r5_Q_wire),
        .r6_Q(r_csr_tdata1_r6_Q_wire),
        .r7_Q(r_csr_tdata1_r7_Q_wire)
    );

    // CodAL register file instance:
    codix_berkelium_ca_core_r_csr_tdata2_t r_csr_tdata2 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .r_RE(execute_stage_r_csr_tdata2_r_RE_wire),
        .r_RA(execute_stage_r_csr_tdata2_r_RA_wire),
        .r0_RE(decode_stage_r_csr_tdata2_r0_RE_wire),
        .r0_RA(decode_stage_r_csr_tdata2_r0_RA_wire),
        .r1_RE(decode_stage_r_csr_tdata2_r1_RE_wire),
        .r1_RA(decode_stage_r_csr_tdata2_r1_RA_wire),
        .r2_RE(decode_stage_r_csr_tdata2_r2_RE_wire),
        .r2_RA(decode_stage_r_csr_tdata2_r2_RA_wire),
        .r3_RE(decode_stage_r_csr_tdata2_r3_RE_wire),
        .r3_RA(decode_stage_r_csr_tdata2_r3_RA_wire),
        .r4_RE(decode_stage_r_csr_tdata2_r4_RE_wire),
        .r4_RA(decode_stage_r_csr_tdata2_r4_RA_wire),
        .r5_RE(decode_stage_r_csr_tdata2_r5_RE_wire),
        .r5_RA(decode_stage_r_csr_tdata2_r5_RA_wire),
        .r6_RE(decode_stage_r_csr_tdata2_r6_RE_wire),
        .r6_RA(decode_stage_r_csr_tdata2_r6_RA_wire),
        .r7_RE(decode_stage_r_csr_tdata2_r7_RE_wire),
        .r7_RA(decode_stage_r_csr_tdata2_r7_RA_wire),
        .w_WE(execute_stage_r_csr_tdata2_w_WE_wire),
        .w_WA(execute_stage_r_csr_tdata2_w_WA_wire),
        .w_D(execute_stage_r_csr_tdata2_w_D_wire),
        .r_Q(r_csr_tdata2_r_Q_wire),
        .r0_Q(r_csr_tdata2_r0_Q_wire),
        .r1_Q(r_csr_tdata2_r1_Q_wire),
        .r2_Q(r_csr_tdata2_r2_Q_wire),
        .r3_Q(r_csr_tdata2_r3_Q_wire),
        .r4_Q(r_csr_tdata2_r4_Q_wire),
        .r5_Q(r_csr_tdata2_r5_Q_wire),
        .r6_Q(r_csr_tdata2_r6_Q_wire),
        .r7_Q(r_csr_tdata2_r7_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd64),
        .DEFAULT_VALUE(64'h0000000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_minstret (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_minstret_WE_wire),
        .D(execute_stage_r_csr_minstret_D_wire),
        .Q(r_csr_minstret_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd64),
        .DEFAULT_VALUE(64'h0000000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_mcycle (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_mcycle_WE_wire),
        .D(execute_stage_r_csr_mcycle_D_wire),
        .Q(r_csr_mcycle_Q_wire)
    );

    // sparse register instance:
    d_ff_sparse_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0),
        .WRITE_MASK(32'h0000f67d)
    ) r_csr_mcountinhibit (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_mcountinhibit_WE_wire),
        .D(execute_stage_r_csr_mcountinhibit_D_wire),
        .Q(r_csr_mcountinhibit_Q_wire)
    );

    // sparse register instance:
    d_ff_sparse_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0),
        .WRITE_MASK(32'h0000f67d)
    ) r_csr_mcounteren (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_mcounteren_WE_wire),
        .D(execute_stage_r_csr_mcounteren_D_wire),
        .Q(r_csr_mcounteren_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_mpicflag (
        .CLK(CLK),
        .RST(RST),
        .WE(execute_stage_r_csr_mpicflag_WE_wire),
        .D(execute_stage_r_csr_mpicflag_D_wire),
        .Q(r_csr_mpicflag_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_mpicmask (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_mpicmask_WE_wire),
        .D(execute_stage_r_csr_mpicmask_D_wire),
        .Q(r_csr_mpicmask_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_mpicflag1 (
        .CLK(CLK),
        .RST(RST),
        .WE(execute_stage_r_csr_mpicflag1_WE_wire),
        .D(execute_stage_r_csr_mpicflag1_D_wire),
        .Q(r_csr_mpicflag1_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_mpicmask1 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_mpicmask1_WE_wire),
        .D(execute_stage_r_csr_mpicmask1_D_wire),
        .Q(r_csr_mpicmask1_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_mpicflag2 (
        .CLK(CLK),
        .RST(RST),
        .WE(execute_stage_r_csr_mpicflag2_WE_wire),
        .D(execute_stage_r_csr_mpicflag2_D_wire),
        .Q(r_csr_mpicflag2_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_mpicmask2 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_mpicmask2_WE_wire),
        .D(execute_stage_r_csr_mpicmask2_D_wire),
        .Q(r_csr_mpicmask2_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_mpicflag3 (
        .CLK(CLK),
        .RST(RST),
        .WE(execute_stage_r_csr_mpicflag3_WE_wire),
        .D(execute_stage_r_csr_mpicflag3_D_wire),
        .Q(r_csr_mpicflag3_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_mpicmask3 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_mpicmask3_WE_wire),
        .D(execute_stage_r_csr_mpicmask3_D_wire),
        .Q(r_csr_mpicmask3_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_mitcmen (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_mitcmen_WE_wire),
        .D(execute_stage_r_csr_mitcmen_D_wire),
        .Q(r_csr_mitcmen_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_mdtcmen (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_mdtcmen_WE_wire),
        .D(execute_stage_r_csr_mdtcmen_D_wire),
        .Q(r_csr_mdtcmen_Q_wire)
    );

    // sparse register instance:
    d_ff_sparse_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0),
        .WRITE_MASK(32'h00000888)
    ) r_csr_mip (
        .CLK(CLK),
        .RST(RST),
        .WE(execute_stage_r_csr_mip_WE_wire),
        .D(execute_stage_r_csr_mip_D_wire),
        .Q(r_csr_mip_Q_wire)
    );

    // sparse register instance:
    d_ff_sparse_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0),
        .WRITE_MASK(32'h00000888)
    ) r_csr_mie (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_mie_WE_wire),
        .D(execute_stage_r_csr_mie_D_wire),
        .Q(r_csr_mie_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_mtval (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_mtval_WE_wire),
        .D(execute_stage_r_csr_mtval_D_wire),
        .Q(r_csr_mtval_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_mepc (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_mepc_WE_wire),
        .D(execute_stage_r_csr_mepc_D_wire),
        .Q(r_csr_mepc_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_mcause (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_mcause_WE_wire),
        .D(execute_stage_r_csr_mcause_D_wire),
        .Q(r_csr_mcause_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_mexcause (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_mexcause_WE_wire),
        .D(execute_stage_r_csr_mexcause_D_wire),
        .Q(r_csr_mexcause_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_mscratch (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_mscratch_WE_wire),
        .D(execute_stage_r_csr_mscratch_D_wire),
        .Q(r_csr_mscratch_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_mtvec (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_mtvec_WE_wire),
        .D(execute_stage_r_csr_mtvec_D_wire),
        .Q(r_csr_mtvec_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00002000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_mstatus (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_mstatus_WE_wire),
        .D(execute_stage_r_csr_mstatus_D_wire),
        .Q(r_csr_mstatus_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_pmpaddr0 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_pmpaddr0_WE_wire),
        .D(execute_stage_r_csr_pmpaddr0_D_wire),
        .Q(r_csr_pmpaddr0_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_pmpaddr1 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_pmpaddr1_WE_wire),
        .D(execute_stage_r_csr_pmpaddr1_D_wire),
        .Q(r_csr_pmpaddr1_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_pmpaddr2 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_pmpaddr2_WE_wire),
        .D(execute_stage_r_csr_pmpaddr2_D_wire),
        .Q(r_csr_pmpaddr2_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_pmpaddr3 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_pmpaddr3_WE_wire),
        .D(execute_stage_r_csr_pmpaddr3_D_wire),
        .Q(r_csr_pmpaddr3_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_pmpaddr4 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_pmpaddr4_WE_wire),
        .D(execute_stage_r_csr_pmpaddr4_D_wire),
        .Q(r_csr_pmpaddr4_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_pmpaddr5 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_pmpaddr5_WE_wire),
        .D(execute_stage_r_csr_pmpaddr5_D_wire),
        .Q(r_csr_pmpaddr5_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_pmpaddr6 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_pmpaddr6_WE_wire),
        .D(execute_stage_r_csr_pmpaddr6_D_wire),
        .Q(r_csr_pmpaddr6_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_pmpaddr7 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_pmpaddr7_WE_wire),
        .D(execute_stage_r_csr_pmpaddr7_D_wire),
        .Q(r_csr_pmpaddr7_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_pmpaddr8 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_pmpaddr8_WE_wire),
        .D(execute_stage_r_csr_pmpaddr8_D_wire),
        .Q(r_csr_pmpaddr8_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_pmpaddr9 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_pmpaddr9_WE_wire),
        .D(execute_stage_r_csr_pmpaddr9_D_wire),
        .Q(r_csr_pmpaddr9_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_pmpaddr10 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_pmpaddr10_WE_wire),
        .D(execute_stage_r_csr_pmpaddr10_D_wire),
        .Q(r_csr_pmpaddr10_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_pmpaddr11 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_pmpaddr11_WE_wire),
        .D(execute_stage_r_csr_pmpaddr11_D_wire),
        .Q(r_csr_pmpaddr11_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_pmpaddr12 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_pmpaddr12_WE_wire),
        .D(execute_stage_r_csr_pmpaddr12_D_wire),
        .Q(r_csr_pmpaddr12_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_pmpaddr13 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_pmpaddr13_WE_wire),
        .D(execute_stage_r_csr_pmpaddr13_D_wire),
        .Q(r_csr_pmpaddr13_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_pmpaddr14 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_pmpaddr14_WE_wire),
        .D(execute_stage_r_csr_pmpaddr14_D_wire),
        .Q(r_csr_pmpaddr14_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_pmpaddr15 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_pmpaddr15_WE_wire),
        .D(execute_stage_r_csr_pmpaddr15_D_wire),
        .Q(r_csr_pmpaddr15_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_pmpcfg0 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_pmpcfg0_WE_wire),
        .D(execute_stage_r_csr_pmpcfg0_D_wire),
        .Q(r_csr_pmpcfg0_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_pmpcfg1 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_pmpcfg1_WE_wire),
        .D(execute_stage_r_csr_pmpcfg1_D_wire),
        .Q(r_csr_pmpcfg1_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_pmpcfg2 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_pmpcfg2_WE_wire),
        .D(execute_stage_r_csr_pmpcfg2_D_wire),
        .Q(r_csr_pmpcfg2_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_csr_pmpcfg3 (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_pmpcfg3_WE_wire),
        .D(execute_stage_r_csr_pmpcfg3_D_wire),
        .Q(r_csr_pmpcfg3_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h3),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_prv (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_prv_WE_wire),
        .D(execute_stage_r_prv_D_wire),
        .Q(r_prv_Q_wire)
    );

    // sparse register instance:
    d_ff_sparse_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0),
        .WRITE_MASK(32'h000000ff)
    ) r_csr_fcsr (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(execute_stage_r_csr_fcsr_WE_wire),
        .D(execute_stage_r_csr_fcsr_D_wire),
        .Q(r_csr_fcsr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b1),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_reset_init (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(main_r_reset_init_WE_wire),
        .D(main_r_reset_init_D_wire),
        .Q(r_reset_init_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_syscall_addr (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(main_r_syscall_addr_WE_wire),
        .D(main_r_syscall_addr_D_wire),
        .Q(r_syscall_addr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h20000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_PC (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(fetch_stage_r_PC_WE_wire),
        .D(fetch_stage_r_PC_D_wire),
        .Q(r_PC_Q_wire)
    );

    // CodAL register file with BSC support instance:
    codix_berkelium_ca_core_rf_gpr_t rf_gpr (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .BSC_A(rf_gpr_BSC_A),
        .BSC_D(rf_gpr_BSC_D),
        .BSC_UPDATE(rf_gpr_BSC_UPDATE),
        .DEBUG_MODE(rf_gpr_DEBUG_MODE),
        .r0_RA(decode_stage_rf_gpr_r0_RA_wire),
        .r0_RE(decode_stage_rf_gpr_r0_RE_wire),
        .r1_RA(execute_stage_rf_gpr_r1_RA_wire),
        .r1_RE(execute_stage_rf_gpr_r1_RE_wire),
        .r2_RA(execute_stage_rf_gpr_r2_RA_wire),
        .r2_RE(execute_stage_rf_gpr_r2_RE_wire),
        .w0_D(execute_stage_rf_gpr_w0_D_wire),
        .w0_WA(execute_stage_rf_gpr_w0_WA_wire),
        .w0_WE(execute_stage_rf_gpr_w0_WE_wire),
        .w1_D(execute_stage_rf_gpr_w1_D_wire),
        .w1_WA(execute_stage_rf_gpr_w1_WA_wire),
        .w1_WE(execute_stage_rf_gpr_w1_WE_wire),
        .BSC_Q(rf_gpr_BSC_Q),
        .r0_Q(rf_gpr_r0_Q_wire),
        .r1_Q(rf_gpr_r1_Q_wire),
        .r2_Q(rf_gpr_r2_Q_wire)
    );

    // CodAL register file instance:
    codix_berkelium_ca_core_rf_fr_t rf_fr (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .r1_RE(execute_stage_rf_fr_r1_RE_wire),
        .r1_RA(execute_stage_rf_fr_r1_RA_wire),
        .r2_RE(execute_stage_rf_fr_r2_RE_wire),
        .r2_RA(execute_stage_rf_fr_r2_RA_wire),
        .r3_RE(execute_stage_rf_fr_r3_RE_wire),
        .r3_RA(execute_stage_rf_fr_r3_RA_wire),
        .w_WE(execute_stage_rf_fr_w_WE_wire),
        .w_WA(execute_stage_rf_fr_w_WA_wire),
        .w_D(execute_stage_rf_fr_w_D_wire),
        .r1_Q(rf_fr_r1_Q_wire),
        .r2_Q(rf_fr_r2_Q_wire),
        .r3_Q(rf_fr_r3_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b1),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wfi_ce (
        .CLK(CLK),
        .RST(RST),
        .WE(execute_stage_r_wfi_ce_WE_wire),
        .D(execute_stage_r_wfi_ce_D_wire),
        .Q(r_wfi_ce_Q_wire)
    );
    assign r_wfi_ce_Q = r_wfi_ce_Q_wire;

    // CodAL module instance:
    codix_berkelium_ca_core_execute_stage_t #(
        .nmi_handler_p(nmi_handler_p),
        .itcm_size_p(itcm_size_p),
        .itcm_baddr_p(itcm_baddr_p),
        .dtcm_size_p(dtcm_size_p),
        .dtcm_baddr_p(dtcm_baddr_p),
        .cache_base_p(cache_base_p),
        .hart_id_p(hart_id_p),
        .pma_base0_p(pma_base0_p),
        .pma_mask0_p(pma_mask0_p),
        .pma_enable_p(pma_enable_p),
        .pma_base1_p(pma_base1_p),
        .pma_mask1_p(pma_mask1_p),
        .pma_base2_p(pma_base2_p),
        .pma_mask2_p(pma_mask2_p),
        .pma_base3_p(pma_base3_p),
        .pma_mask3_p(pma_mask3_p),
        .pma_base4_p(pma_base4_p),
        .pma_mask4_p(pma_mask4_p),
        .pma_base5_p(pma_base5_p),
        .pma_mask5_p(pma_mask5_p),
        .pma_base6_p(pma_base6_p),
        .pma_mask6_p(pma_mask6_p),
        .pma_base7_p(pma_base7_p),
        .pma_mask7_p(pma_mask7_p),
        .pma_base8_p(pma_base8_p),
        .pma_mask8_p(pma_mask8_p),
        .pma_base9_p(pma_base9_p),
        .pma_mask9_p(pma_mask9_p),
        .pma_base10_p(pma_base10_p),
        .pma_mask10_p(pma_mask10_p),
        .pma_base11_p(pma_base11_p),
        .pma_mask11_p(pma_mask11_p),
        .pma_base12_p(pma_base12_p),
        .pma_mask12_p(pma_mask12_p),
        .pma_base13_p(pma_base13_p),
        .pma_mask13_p(pma_mask13_p),
        .pma_base14_p(pma_base14_p),
        .pma_mask14_p(pma_mask14_p),
        .pma_base15_p(pma_base15_p),
        .pma_mask15_p(pma_mask15_p),
        .pma_cfg15_p(pma_cfg15_p),
        .pma_cfg14_p(pma_cfg14_p),
        .pma_cfg13_p(pma_cfg13_p),
        .pma_cfg12_p(pma_cfg12_p),
        .pma_cfg11_p(pma_cfg11_p),
        .pma_cfg10_p(pma_cfg10_p),
        .pma_cfg9_p(pma_cfg9_p),
        .pma_cfg8_p(pma_cfg8_p),
        .pma_cfg7_p(pma_cfg7_p),
        .pma_cfg6_p(pma_cfg6_p),
        .pma_cfg5_p(pma_cfg5_p),
        .pma_cfg4_p(pma_cfg4_p),
        .pma_cfg3_p(pma_cfg3_p),
        .pma_cfg2_p(pma_cfg2_p),
        .pma_cfg1_p(pma_cfg1_p),
        .pma_cfg0_p(pma_cfg0_p),
        .progbuf_base_p(progbuf_base_p)
    ) execute_stage (
        .execute_stage_div_s_div_ce_i_ICLK(execute_stage_div_s_div_ce_i_ICLK),
        .execute_stage_fpu_add_sub_s_add_sub_ce_ICLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .execute_stage_fpu_float2int_s_f2i_ce_ICLK(execute_stage_fpu_float2int_s_f2i_ce_ICLK),
        .execute_stage_fpu_fmul_s_fmul_ce_ICLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .execute_stage_fpu_fused_s_fused_ce_ICLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .execute_stage_fpu_int2float_s_i2f_ce_ICLK(execute_stage_fpu_int2float_s_i2f_ce_ICLK),
        .execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .execute_stage_lsu_s_load_ce_ICLK(execute_stage_lsu_s_load_ce_ICLK),
        .execute_stage_lsu_s_lsu_ce_ICLK(execute_stage_lsu_s_lsu_ce_ICLK),
        .execute_stage_lsu_s_store_ce_ICLK(execute_stage_lsu_s_store_ce_ICLK),
        .r_wfi_ce_ICLK(r_wfi_ce_ICLK),
        .s_fpu_ce_ICLK(s_fpu_ce_ICLK),
        .RST(RST),
        .control_fpu_CONTROL_CLEAR_Q(control_fpu_CONTROL_CLEAR_Q_wire),
        .control_fpu_CONTROL_STALL_Q(control_fpu_CONTROL_STALL_Q_wire),
        .control_fpu_ROB_CLEAR_Q(control_fpu_ROB_CLEAR_Q_wire),
        .fetch_stage_ifu_s_bus_busy_o_Q(fetch_stage_ifu_s_bus_busy_o_Q_wire),
        .i1_if_cpu_ldst_HRDATA(i1_if_cpu_ldst_HRDATA),
        .i1_if_cpu_ldst_HREADY(i1_if_cpu_ldst_HREADY),
        .i1_if_cpu_ldst_HRESP(i1_if_cpu_ldst_HRESP),
        .ira_r_return_address_D(main_execute_stage_ira_r_return_address_D_wire),
        .ira_r_return_address_WE(main_execute_stage_ira_r_return_address_WE_wire),
        .p_dtcm_en_Q(p_dtcm_en_Q),
        .p_int_Q(p_int_Q),
        .p_itcm_en_Q(p_itcm_en_Q),
        .p_msip_Q(p_msip_Q),
        .p_mtip_Q(p_mtip_Q),
        .p_nmi_mtval_Q(p_nmi_mtval_Q),
        .p_nmi_Q(p_nmi_Q),
        .perf_r_mhpmcounter10_Q(perf_r_mhpmcounter10_Q_wire),
        .perf_r_mhpmcounter12_Q(perf_r_mhpmcounter12_Q_wire),
        .perf_r_mhpmcounter13_Q(perf_r_mhpmcounter13_Q_wire),
        .perf_r_mhpmcounter14_Q(perf_r_mhpmcounter14_Q_wire),
        .perf_r_mhpmcounter15_Q(perf_r_mhpmcounter15_Q_wire),
        .perf_r_mhpmcounter3_Q(perf_r_mhpmcounter3_Q_wire),
        .perf_r_mhpmcounter4_Q(perf_r_mhpmcounter4_Q_wire),
        .perf_r_mhpmcounter5_Q(perf_r_mhpmcounter5_Q_wire),
        .perf_r_mhpmcounter6_Q(perf_r_mhpmcounter6_Q_wire),
        .perf_r_mhpmcounter9_Q(perf_r_mhpmcounter9_Q_wire),
        .pipe_add_sub_COMPUTE_CLEAR_Q(pipe_add_sub_COMPUTE_CLEAR_Q_wire),
        .pipe_add_sub_COMPUTE_STALL_Q(pipe_add_sub_COMPUTE_STALL_Q_wire),
        .pipe_add_sub_POSTNORM_CLEAR_Q(pipe_add_sub_POSTNORM_CLEAR_Q_wire),
        .pipe_add_sub_POSTNORM_STALL_Q(pipe_add_sub_POSTNORM_STALL_Q_wire),
        .pipe_add_sub_ROUNDING_CLEAR_Q(pipe_add_sub_ROUNDING_CLEAR_Q_wire),
        .pipe_add_sub_ROUNDING_STALL_Q(pipe_add_sub_ROUNDING_STALL_Q_wire),
        .pipe_f2i_F2I_CLEAR_Q(pipe_f2i_F2I_CLEAR_Q_wire),
        .pipe_f2i_F2I_STALL_Q(pipe_f2i_F2I_STALL_Q_wire),
        .pipe_fmul_MUL_CLEAR_Q(pipe_fmul_MUL_CLEAR_Q_wire),
        .pipe_fmul_POSTNORM1_CLEAR_Q(pipe_fmul_POSTNORM1_CLEAR_Q_wire),
        .pipe_fmul_POSTNORM2_CLEAR_Q(pipe_fmul_POSTNORM2_CLEAR_Q_wire),
        .pipe_fmul_ROUNDING_CLEAR_Q(pipe_fmul_ROUNDING_CLEAR_Q_wire),
        .pipe_fused_ADDSUB_CLEAR_Q(pipe_fused_ADDSUB_CLEAR_Q_wire),
        .pipe_fused_POSTNORM_ADDSUB_CLEAR_Q(pipe_fused_POSTNORM_ADDSUB_CLEAR_Q_wire),
        .pipe_fused_POSTNORM_MUL1_CLEAR_Q(pipe_fused_POSTNORM_MUL1_CLEAR_Q_wire),
        .pipe_fused_POSTNORM_MUL2_CLEAR_Q(pipe_fused_POSTNORM_MUL2_CLEAR_Q_wire),
        .pipe_fused_PRENORM_ADDSUB_CLEAR_Q(pipe_fused_PRENORM_ADDSUB_CLEAR_Q_wire),
        .pipe_fused_ROUNDING_CLEAR_Q(pipe_fused_ROUNDING_CLEAR_Q_wire),
        .pipe_fused_WAIT_MUL_CLEAR_Q(pipe_fused_WAIT_MUL_CLEAR_Q_wire),
        .pipe_i2f_COMPUTE_CLEAR_Q(pipe_i2f_COMPUTE_CLEAR_Q_wire),
        .pipe_i2f_COMPUTE_STALL_Q(pipe_i2f_COMPUTE_STALL_Q_wire),
        .pipe_i2f_ROUNDING_CLEAR_Q(pipe_i2f_ROUNDING_CLEAR_Q_wire),
        .pipe_i2f_ROUNDING_STALL_Q(pipe_i2f_ROUNDING_STALL_Q_wire),
        .pipe_sqrt_div_SQRT_DIV_CLEAR_Q(pipe_sqrt_div_SQRT_DIV_CLEAR_Q_wire),
        .pl_lsu_FIN_CLEAR_Q(pl_lsu_FIN_CLEAR_Q_wire),
        .pl_lsu_FIN_STALL_Q(pl_lsu_FIN_STALL_Q_wire),
        .r_csr_dcsr_Q(r_csr_dcsr_Q_wire),
        .r_csr_dpc_Q(r_csr_dpc_Q_wire),
        .r_csr_fcsr_Q(r_csr_fcsr_Q_wire),
        .r_csr_mcause_Q(r_csr_mcause_Q_wire),
        .r_csr_mcounteren_Q(r_csr_mcounteren_Q_wire),
        .r_csr_mcountinhibit_Q(r_csr_mcountinhibit_Q_wire),
        .r_csr_mcycle_Q(r_csr_mcycle_Q_wire),
        .r_csr_mdtcmen_Q(r_csr_mdtcmen_Q_wire),
        .r_csr_mepc_Q(r_csr_mepc_Q_wire),
        .r_csr_mexcause_Q(r_csr_mexcause_Q_wire),
        .r_csr_mie_Q(r_csr_mie_Q_wire),
        .r_csr_minstret_Q(r_csr_minstret_Q_wire),
        .r_csr_mip_Q(r_csr_mip_Q_wire),
        .r_csr_mitcmen_Q(r_csr_mitcmen_Q_wire),
        .r_csr_mpicflag1_Q(r_csr_mpicflag1_Q_wire),
        .r_csr_mpicflag2_Q(r_csr_mpicflag2_Q_wire),
        .r_csr_mpicflag3_Q(r_csr_mpicflag3_Q_wire),
        .r_csr_mpicflag_Q(r_csr_mpicflag_Q_wire),
        .r_csr_mpicmask1_Q(r_csr_mpicmask1_Q_wire),
        .r_csr_mpicmask2_Q(r_csr_mpicmask2_Q_wire),
        .r_csr_mpicmask3_Q(r_csr_mpicmask3_Q_wire),
        .r_csr_mpicmask_Q(r_csr_mpicmask_Q_wire),
        .r_csr_mscratch_Q(r_csr_mscratch_Q_wire),
        .r_csr_mstatus_Q(r_csr_mstatus_Q_wire),
        .r_csr_mtval_Q(r_csr_mtval_Q_wire),
        .r_csr_mtvec_Q(r_csr_mtvec_Q_wire),
        .r_csr_pmpaddr0_Q(r_csr_pmpaddr0_Q_wire),
        .r_csr_pmpaddr10_Q(r_csr_pmpaddr10_Q_wire),
        .r_csr_pmpaddr11_Q(r_csr_pmpaddr11_Q_wire),
        .r_csr_pmpaddr12_Q(r_csr_pmpaddr12_Q_wire),
        .r_csr_pmpaddr13_Q(r_csr_pmpaddr13_Q_wire),
        .r_csr_pmpaddr14_Q(r_csr_pmpaddr14_Q_wire),
        .r_csr_pmpaddr15_Q(r_csr_pmpaddr15_Q_wire),
        .r_csr_pmpaddr1_Q(r_csr_pmpaddr1_Q_wire),
        .r_csr_pmpaddr2_Q(r_csr_pmpaddr2_Q_wire),
        .r_csr_pmpaddr3_Q(r_csr_pmpaddr3_Q_wire),
        .r_csr_pmpaddr4_Q(r_csr_pmpaddr4_Q_wire),
        .r_csr_pmpaddr5_Q(r_csr_pmpaddr5_Q_wire),
        .r_csr_pmpaddr6_Q(r_csr_pmpaddr6_Q_wire),
        .r_csr_pmpaddr7_Q(r_csr_pmpaddr7_Q_wire),
        .r_csr_pmpaddr8_Q(r_csr_pmpaddr8_Q_wire),
        .r_csr_pmpaddr9_Q(r_csr_pmpaddr9_Q_wire),
        .r_csr_pmpcfg0_Q(r_csr_pmpcfg0_Q_wire),
        .r_csr_pmpcfg1_Q(r_csr_pmpcfg1_Q_wire),
        .r_csr_pmpcfg2_Q(r_csr_pmpcfg2_Q_wire),
        .r_csr_pmpcfg3_Q(r_csr_pmpcfg3_Q_wire),
        .r_csr_tcontrol_Q(r_csr_tcontrol_Q_wire),
        .r_csr_tdata1_r_Q(r_csr_tdata1_r_Q_wire),
        .r_csr_tdata2_r_Q(r_csr_tdata2_r_Q_wire),
        .r_csr_tselect_Q(r_csr_tselect_Q_wire),
        .r_ex1_fu_Q(r_ex1_fu_Q_wire),
        .r_ex1_instr_addr_Q(r_ex1_instr_addr_Q_wire),
        .r_ex1_is_rvc_Q(r_ex1_is_rvc_Q_wire),
        .r_ex1_rd_addr_Q(r_ex1_rd_addr_Q_wire),
        .r_ex_bp_addr_Q(r_ex_bp_addr_Q_wire),
        .r_ex_bp_taken_Q(r_ex_bp_taken_Q_wire),
        .r_ex_csr_addr_Q(r_ex_csr_addr_Q_wire),
        .r_ex_exc_tval_Q(r_ex_exc_tval_Q_wire),
        .r_ex_exc_type_Q(r_ex_exc_type_Q_wire),
        .r_ex_exc_valid_Q(r_ex_exc_valid_Q_wire),
        .r_ex_fpu_op_Q(r_ex_fpu_op_Q_wire),
        .r_ex_fu_Q(r_ex_fu_Q_wire),
        .r_ex_fu_s1_source_Q(r_ex_fu_s1_source_Q_wire),
        .r_ex_fu_s2_source_Q(r_ex_fu_s2_source_Q_wire),
        .r_ex_fu_s3_source_Q(r_ex_fu_s3_source_Q_wire),
        .r_ex_imm_Q(r_ex_imm_Q_wire),
        .r_ex_instr_addr_Q(r_ex_instr_addr_Q_wire),
        .r_ex_instr_valid_Q(r_ex_instr_valid_Q_wire),
        .r_ex_is_rvc_Q(r_ex_is_rvc_Q_wire),
        .r_ex_lsu_addr_Q(r_ex_lsu_addr_Q_wire),
        .r_ex_op_Q(r_ex_op_Q_wire),
        .r_ex_rd_addr_Q(r_ex_rd_addr_Q_wire),
        .r_ex_rm_Q(r_ex_rm_Q_wire),
        .r_ex_rs1_addr_Q(r_ex_rs1_addr_Q_wire),
        .r_ex_rs2_addr_Q(r_ex_rs2_addr_Q_wire),
        .r_ex_rs3_addr_Q(r_ex_rs3_addr_Q_wire),
        .r_nmi_i_Q(r_nmi_i_Q_wire),
        .r_nmi_mtval_Q(r_nmi_mtval_Q_wire),
        .r_nmi_source_Q(r_nmi_source_Q_wire),
        .r_prv_Q(r_prv_Q_wire),
        .r_reset_init_Q(r_reset_init_Q_wire),
        .r_syscall_addr_Q(r_syscall_addr_Q_wire),
        .r_wfi_ce_Q(r_wfi_ce_Q_wire),
        .rf_fr_r1_Q(rf_fr_r1_Q_wire),
        .rf_fr_r2_Q(rf_fr_r2_Q_wire),
        .rf_fr_r3_Q(rf_fr_r3_Q_wire),
        .rf_gpr_r1_Q(rf_gpr_r1_Q_wire),
        .rf_gpr_r2_Q(rf_gpr_r2_Q_wire),
        .s_dm_active_Q(s_dm_active),
        .s_dm_halt_Q(s_dm_halt),
        .s_dm_progbuf_en_Q(s_dm_progbuf_en),
        .s_eviction_error_Q(s_eviction_error),
        .s_ex_bp_restart_Q(s_ex_bp_restart),
        .s_ex_branch_miss_Q(s_ex_branch_miss),
        .s_ex_branch_target_addr_Q(s_ex_branch_target_addr),
        .s_ex_fpu_busy_Q(s_ex_fpu_busy),
        .s_ex_stall_Q(s_ex_stall),
        .s_flush_Q(s_flush),
        .s_rd0_addr_Q(s_rd0_addr),
        .s_rd0_data_Q(s_rd0_data),
        .s_rd0_we_Q(s_rd0_we),
        .s_rd0_write_Q(s_rd0_write),
        .s_rd1_addr_Q(s_rd1_addr),
        .s_rd1_data_Q(s_rd1_data),
        .s_rd1_we_Q(s_rd1_we),
        .s_rd1_write_Q(s_rd1_write),
        .bru_s_branch_bht_update_o_Q(execute_stage_bru_s_branch_bht_update_o_Q_wire),
        .bru_s_is_jump_o_Q(execute_stage_bru_s_is_jump_o_Q_wire),
        .bru_s_rd_data_o_Q(execute_stage_bru_s_rd_data_o_Q_wire),
        .control_fpu_CONTROL_CLEAR_D(execute_stage_control_fpu_CONTROL_CLEAR_D_wire),
        .control_fpu_CONTROL_STALL_D(execute_stage_control_fpu_CONTROL_STALL_D_wire),
        .control_fpu_ROB_CLEAR_D(execute_stage_control_fpu_ROB_CLEAR_D_wire),
        .crf_s_csr_addr_o_Q(execute_stage_crf_s_csr_addr_o_Q_wire),
        .crf_s_csr_valid_o_Q(execute_stage_crf_s_csr_valid_o_Q_wire),
        .crf_s_hpm_inhibit_o_Q(execute_stage_crf_s_hpm_inhibit_o_Q_wire),
        .crf_s_perf_inhibit_o_Q(execute_stage_crf_s_perf_inhibit_o_Q_wire),
        .crf_s_trap_addr_o_Q(execute_stage_crf_s_trap_addr_o_Q_wire),
        .crf_s_trap_valid_o_Q(execute_stage_crf_s_trap_valid_o_Q_wire),
        .div_s_div_ce_i_Q(execute_stage_div_s_div_ce_i_Q),
        .fpu_add_sub_s_add_sub_ce_Q(execute_stage_fpu_add_sub_s_add_sub_ce_Q),
        .fpu_float2int_s_f2i_ce_Q(execute_stage_fpu_float2int_s_f2i_ce_Q),
        .fpu_fmul_s_fmul_ce_Q(execute_stage_fpu_fmul_s_fmul_ce_Q),
        .fpu_fused_s_fused_ce_Q(execute_stage_fpu_fused_s_fused_ce_Q),
        .fpu_int2float_s_i2f_ce_Q(execute_stage_fpu_int2float_s_i2f_ce_Q),
        .fpu_sqrt_div_s_sqrt_div_ce_Q(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_Q),
        .halt_ACT(execute_stage_halt_ACT_wire),
        .i1_if_cpu_ldst_HADDR(i1_if_cpu_ldst_HADDR),
        .i1_if_cpu_ldst_HBURST(i1_if_cpu_ldst_HBURST),
        .i1_if_cpu_ldst_HMASTLOCK(i1_if_cpu_ldst_HMASTLOCK),
        .i1_if_cpu_ldst_HPROT(i1_if_cpu_ldst_HPROT),
        .i1_if_cpu_ldst_HSIZE(i1_if_cpu_ldst_HSIZE),
        .i1_if_cpu_ldst_HTRANS(i1_if_cpu_ldst_HTRANS),
        .i1_if_cpu_ldst_HWDATA(i1_if_cpu_ldst_HWDATA),
        .i1_if_cpu_ldst_HWRITE(i1_if_cpu_ldst_HWRITE),
        .lsu_pmp_r_pmp0_napot_mask_Q(execute_stage_lsu_pmp_r_pmp0_napot_mask_Q_wire),
        .lsu_pmp_r_pmp10_napot_mask_Q(execute_stage_lsu_pmp_r_pmp10_napot_mask_Q_wire),
        .lsu_pmp_r_pmp11_napot_mask_Q(execute_stage_lsu_pmp_r_pmp11_napot_mask_Q_wire),
        .lsu_pmp_r_pmp12_napot_mask_Q(execute_stage_lsu_pmp_r_pmp12_napot_mask_Q_wire),
        .lsu_pmp_r_pmp13_napot_mask_Q(execute_stage_lsu_pmp_r_pmp13_napot_mask_Q_wire),
        .lsu_pmp_r_pmp14_napot_mask_Q(execute_stage_lsu_pmp_r_pmp14_napot_mask_Q_wire),
        .lsu_pmp_r_pmp15_napot_mask_Q(execute_stage_lsu_pmp_r_pmp15_napot_mask_Q_wire),
        .lsu_pmp_r_pmp1_napot_mask_Q(execute_stage_lsu_pmp_r_pmp1_napot_mask_Q_wire),
        .lsu_pmp_r_pmp2_napot_mask_Q(execute_stage_lsu_pmp_r_pmp2_napot_mask_Q_wire),
        .lsu_pmp_r_pmp3_napot_mask_Q(execute_stage_lsu_pmp_r_pmp3_napot_mask_Q_wire),
        .lsu_pmp_r_pmp4_napot_mask_Q(execute_stage_lsu_pmp_r_pmp4_napot_mask_Q_wire),
        .lsu_pmp_r_pmp5_napot_mask_Q(execute_stage_lsu_pmp_r_pmp5_napot_mask_Q_wire),
        .lsu_pmp_r_pmp6_napot_mask_Q(execute_stage_lsu_pmp_r_pmp6_napot_mask_Q_wire),
        .lsu_pmp_r_pmp7_napot_mask_Q(execute_stage_lsu_pmp_r_pmp7_napot_mask_Q_wire),
        .lsu_pmp_r_pmp8_napot_mask_Q(execute_stage_lsu_pmp_r_pmp8_napot_mask_Q_wire),
        .lsu_pmp_r_pmp9_napot_mask_Q(execute_stage_lsu_pmp_r_pmp9_napot_mask_Q_wire),
        .lsu_s_load_ce_Q(execute_stage_lsu_s_load_ce_Q),
        .lsu_s_lsu_ce_Q(execute_stage_lsu_s_lsu_ce_Q),
        .lsu_s_store_ce_Q(execute_stage_lsu_s_store_ce_Q),
        .ocd_s_ocd_addr_o_Q(execute_stage_ocd_s_ocd_addr_o_Q_wire),
        .ocd_s_ocd_busy_o_Q(execute_stage_ocd_s_ocd_busy_o_Q_wire),
        .ocd_s_ocd_progbuf_mode_o_Q(execute_stage_ocd_s_ocd_progbuf_mode_o_Q_wire),
        .ocd_s_ocd_valid_o_Q(execute_stage_ocd_s_ocd_valid_o_Q_wire),
        .pipe_add_sub_COMPUTE_CLEAR_D(execute_stage_pipe_add_sub_COMPUTE_CLEAR_D_wire),
        .pipe_add_sub_COMPUTE_STALL_D(execute_stage_pipe_add_sub_COMPUTE_STALL_D_wire),
        .pipe_add_sub_POSTNORM_CLEAR_D(execute_stage_pipe_add_sub_POSTNORM_CLEAR_D_wire),
        .pipe_add_sub_POSTNORM_STALL_D(execute_stage_pipe_add_sub_POSTNORM_STALL_D_wire),
        .pipe_add_sub_ROUNDING_CLEAR_D(execute_stage_pipe_add_sub_ROUNDING_CLEAR_D_wire),
        .pipe_add_sub_ROUNDING_STALL_D(execute_stage_pipe_add_sub_ROUNDING_STALL_D_wire),
        .pipe_f2i_F2I_CLEAR_D(execute_stage_pipe_f2i_F2I_CLEAR_D_wire),
        .pipe_f2i_F2I_STALL_D(execute_stage_pipe_f2i_F2I_STALL_D_wire),
        .pipe_fmul_MUL_CLEAR_D(execute_stage_pipe_fmul_MUL_CLEAR_D_wire),
        .pipe_fmul_POSTNORM1_CLEAR_D(execute_stage_pipe_fmul_POSTNORM1_CLEAR_D_wire),
        .pipe_fmul_POSTNORM2_CLEAR_D(execute_stage_pipe_fmul_POSTNORM2_CLEAR_D_wire),
        .pipe_fmul_ROUNDING_CLEAR_D(execute_stage_pipe_fmul_ROUNDING_CLEAR_D_wire),
        .pipe_fused_ADDSUB_CLEAR_D(execute_stage_pipe_fused_ADDSUB_CLEAR_D_wire),
        .pipe_fused_POSTNORM_ADDSUB_CLEAR_D(execute_stage_pipe_fused_POSTNORM_ADDSUB_CLEAR_D_wire),
        .pipe_fused_POSTNORM_MUL1_CLEAR_D(execute_stage_pipe_fused_POSTNORM_MUL1_CLEAR_D_wire),
        .pipe_fused_POSTNORM_MUL2_CLEAR_D(execute_stage_pipe_fused_POSTNORM_MUL2_CLEAR_D_wire),
        .pipe_fused_PRENORM_ADDSUB_CLEAR_D(execute_stage_pipe_fused_PRENORM_ADDSUB_CLEAR_D_wire),
        .pipe_fused_ROUNDING_CLEAR_D(execute_stage_pipe_fused_ROUNDING_CLEAR_D_wire),
        .pipe_fused_WAIT_MUL_CLEAR_D(execute_stage_pipe_fused_WAIT_MUL_CLEAR_D_wire),
        .pipe_i2f_COMPUTE_CLEAR_D(execute_stage_pipe_i2f_COMPUTE_CLEAR_D_wire),
        .pipe_i2f_COMPUTE_STALL_D(execute_stage_pipe_i2f_COMPUTE_STALL_D_wire),
        .pipe_i2f_ROUNDING_CLEAR_D(execute_stage_pipe_i2f_ROUNDING_CLEAR_D_wire),
        .pipe_i2f_ROUNDING_STALL_D(execute_stage_pipe_i2f_ROUNDING_STALL_D_wire),
        .pipe_sqrt_div_SQRT_DIV_CLEAR_D(execute_stage_pipe_sqrt_div_SQRT_DIV_CLEAR_D_wire),
        .pl_lsu_FIN_CLEAR_D(execute_stage_pl_lsu_FIN_CLEAR_D_wire),
        .pl_lsu_FIN_STALL_D(execute_stage_pl_lsu_FIN_STALL_D_wire),
        .r_csr_dcsr_D(execute_stage_r_csr_dcsr_D_wire),
        .r_csr_dcsr_WE(execute_stage_r_csr_dcsr_WE_wire),
        .r_csr_dpc_D(execute_stage_r_csr_dpc_D_wire),
        .r_csr_dpc_WE(execute_stage_r_csr_dpc_WE_wire),
        .r_csr_fcsr_D(execute_stage_r_csr_fcsr_D_wire),
        .r_csr_fcsr_WE(execute_stage_r_csr_fcsr_WE_wire),
        .r_csr_mcause_D(execute_stage_r_csr_mcause_D_wire),
        .r_csr_mcause_WE(execute_stage_r_csr_mcause_WE_wire),
        .r_csr_mcounteren_D(execute_stage_r_csr_mcounteren_D_wire),
        .r_csr_mcounteren_WE(execute_stage_r_csr_mcounteren_WE_wire),
        .r_csr_mcountinhibit_D(execute_stage_r_csr_mcountinhibit_D_wire),
        .r_csr_mcountinhibit_WE(execute_stage_r_csr_mcountinhibit_WE_wire),
        .r_csr_mcycle_D(execute_stage_r_csr_mcycle_D_wire),
        .r_csr_mcycle_WE(execute_stage_r_csr_mcycle_WE_wire),
        .r_csr_mdtcmen_D(execute_stage_r_csr_mdtcmen_D_wire),
        .r_csr_mdtcmen_WE(execute_stage_r_csr_mdtcmen_WE_wire),
        .r_csr_mepc_D(execute_stage_r_csr_mepc_D_wire),
        .r_csr_mepc_WE(execute_stage_r_csr_mepc_WE_wire),
        .r_csr_mexcause_D(execute_stage_r_csr_mexcause_D_wire),
        .r_csr_mexcause_WE(execute_stage_r_csr_mexcause_WE_wire),
        .r_csr_mie_D(execute_stage_r_csr_mie_D_wire),
        .r_csr_mie_WE(execute_stage_r_csr_mie_WE_wire),
        .r_csr_minstret_D(execute_stage_r_csr_minstret_D_wire),
        .r_csr_minstret_WE(execute_stage_r_csr_minstret_WE_wire),
        .r_csr_mip_D(execute_stage_r_csr_mip_D_wire),
        .r_csr_mip_WE(execute_stage_r_csr_mip_WE_wire),
        .r_csr_mitcmen_D(execute_stage_r_csr_mitcmen_D_wire),
        .r_csr_mitcmen_WE(execute_stage_r_csr_mitcmen_WE_wire),
        .r_csr_mpicflag1_D(execute_stage_r_csr_mpicflag1_D_wire),
        .r_csr_mpicflag1_WE(execute_stage_r_csr_mpicflag1_WE_wire),
        .r_csr_mpicflag2_D(execute_stage_r_csr_mpicflag2_D_wire),
        .r_csr_mpicflag2_WE(execute_stage_r_csr_mpicflag2_WE_wire),
        .r_csr_mpicflag3_D(execute_stage_r_csr_mpicflag3_D_wire),
        .r_csr_mpicflag3_WE(execute_stage_r_csr_mpicflag3_WE_wire),
        .r_csr_mpicflag_D(execute_stage_r_csr_mpicflag_D_wire),
        .r_csr_mpicflag_WE(execute_stage_r_csr_mpicflag_WE_wire),
        .r_csr_mpicmask1_D(execute_stage_r_csr_mpicmask1_D_wire),
        .r_csr_mpicmask1_WE(execute_stage_r_csr_mpicmask1_WE_wire),
        .r_csr_mpicmask2_D(execute_stage_r_csr_mpicmask2_D_wire),
        .r_csr_mpicmask2_WE(execute_stage_r_csr_mpicmask2_WE_wire),
        .r_csr_mpicmask3_D(execute_stage_r_csr_mpicmask3_D_wire),
        .r_csr_mpicmask3_WE(execute_stage_r_csr_mpicmask3_WE_wire),
        .r_csr_mpicmask_D(execute_stage_r_csr_mpicmask_D_wire),
        .r_csr_mpicmask_WE(execute_stage_r_csr_mpicmask_WE_wire),
        .r_csr_mscratch_D(execute_stage_r_csr_mscratch_D_wire),
        .r_csr_mscratch_WE(execute_stage_r_csr_mscratch_WE_wire),
        .r_csr_mstatus_D(execute_stage_r_csr_mstatus_D_wire),
        .r_csr_mstatus_WE(execute_stage_r_csr_mstatus_WE_wire),
        .r_csr_mtval_D(execute_stage_r_csr_mtval_D_wire),
        .r_csr_mtval_WE(execute_stage_r_csr_mtval_WE_wire),
        .r_csr_mtvec_D(execute_stage_r_csr_mtvec_D_wire),
        .r_csr_mtvec_WE(execute_stage_r_csr_mtvec_WE_wire),
        .r_csr_pmpaddr0_D(execute_stage_r_csr_pmpaddr0_D_wire),
        .r_csr_pmpaddr0_WE(execute_stage_r_csr_pmpaddr0_WE_wire),
        .r_csr_pmpaddr10_D(execute_stage_r_csr_pmpaddr10_D_wire),
        .r_csr_pmpaddr10_WE(execute_stage_r_csr_pmpaddr10_WE_wire),
        .r_csr_pmpaddr11_D(execute_stage_r_csr_pmpaddr11_D_wire),
        .r_csr_pmpaddr11_WE(execute_stage_r_csr_pmpaddr11_WE_wire),
        .r_csr_pmpaddr12_D(execute_stage_r_csr_pmpaddr12_D_wire),
        .r_csr_pmpaddr12_WE(execute_stage_r_csr_pmpaddr12_WE_wire),
        .r_csr_pmpaddr13_D(execute_stage_r_csr_pmpaddr13_D_wire),
        .r_csr_pmpaddr13_WE(execute_stage_r_csr_pmpaddr13_WE_wire),
        .r_csr_pmpaddr14_D(execute_stage_r_csr_pmpaddr14_D_wire),
        .r_csr_pmpaddr14_WE(execute_stage_r_csr_pmpaddr14_WE_wire),
        .r_csr_pmpaddr15_D(execute_stage_r_csr_pmpaddr15_D_wire),
        .r_csr_pmpaddr15_WE(execute_stage_r_csr_pmpaddr15_WE_wire),
        .r_csr_pmpaddr1_D(execute_stage_r_csr_pmpaddr1_D_wire),
        .r_csr_pmpaddr1_WE(execute_stage_r_csr_pmpaddr1_WE_wire),
        .r_csr_pmpaddr2_D(execute_stage_r_csr_pmpaddr2_D_wire),
        .r_csr_pmpaddr2_WE(execute_stage_r_csr_pmpaddr2_WE_wire),
        .r_csr_pmpaddr3_D(execute_stage_r_csr_pmpaddr3_D_wire),
        .r_csr_pmpaddr3_WE(execute_stage_r_csr_pmpaddr3_WE_wire),
        .r_csr_pmpaddr4_D(execute_stage_r_csr_pmpaddr4_D_wire),
        .r_csr_pmpaddr4_WE(execute_stage_r_csr_pmpaddr4_WE_wire),
        .r_csr_pmpaddr5_D(execute_stage_r_csr_pmpaddr5_D_wire),
        .r_csr_pmpaddr5_WE(execute_stage_r_csr_pmpaddr5_WE_wire),
        .r_csr_pmpaddr6_D(execute_stage_r_csr_pmpaddr6_D_wire),
        .r_csr_pmpaddr6_WE(execute_stage_r_csr_pmpaddr6_WE_wire),
        .r_csr_pmpaddr7_D(execute_stage_r_csr_pmpaddr7_D_wire),
        .r_csr_pmpaddr7_WE(execute_stage_r_csr_pmpaddr7_WE_wire),
        .r_csr_pmpaddr8_D(execute_stage_r_csr_pmpaddr8_D_wire),
        .r_csr_pmpaddr8_WE(execute_stage_r_csr_pmpaddr8_WE_wire),
        .r_csr_pmpaddr9_D(execute_stage_r_csr_pmpaddr9_D_wire),
        .r_csr_pmpaddr9_WE(execute_stage_r_csr_pmpaddr9_WE_wire),
        .r_csr_pmpcfg0_D(execute_stage_r_csr_pmpcfg0_D_wire),
        .r_csr_pmpcfg0_WE(execute_stage_r_csr_pmpcfg0_WE_wire),
        .r_csr_pmpcfg1_D(execute_stage_r_csr_pmpcfg1_D_wire),
        .r_csr_pmpcfg1_WE(execute_stage_r_csr_pmpcfg1_WE_wire),
        .r_csr_pmpcfg2_D(execute_stage_r_csr_pmpcfg2_D_wire),
        .r_csr_pmpcfg2_WE(execute_stage_r_csr_pmpcfg2_WE_wire),
        .r_csr_pmpcfg3_D(execute_stage_r_csr_pmpcfg3_D_wire),
        .r_csr_pmpcfg3_WE(execute_stage_r_csr_pmpcfg3_WE_wire),
        .r_csr_tcontrol_D(execute_stage_r_csr_tcontrol_D_wire),
        .r_csr_tcontrol_WE(execute_stage_r_csr_tcontrol_WE_wire),
        .r_csr_tdata1_r_RA(execute_stage_r_csr_tdata1_r_RA_wire),
        .r_csr_tdata1_r_RE(execute_stage_r_csr_tdata1_r_RE_wire),
        .r_csr_tdata1_w_D(execute_stage_r_csr_tdata1_w_D_wire),
        .r_csr_tdata1_w_WA(execute_stage_r_csr_tdata1_w_WA_wire),
        .r_csr_tdata1_w_WE(execute_stage_r_csr_tdata1_w_WE_wire),
        .r_csr_tdata2_r_RA(execute_stage_r_csr_tdata2_r_RA_wire),
        .r_csr_tdata2_r_RE(execute_stage_r_csr_tdata2_r_RE_wire),
        .r_csr_tdata2_w_D(execute_stage_r_csr_tdata2_w_D_wire),
        .r_csr_tdata2_w_WA(execute_stage_r_csr_tdata2_w_WA_wire),
        .r_csr_tdata2_w_WE(execute_stage_r_csr_tdata2_w_WE_wire),
        .r_csr_tselect_D(execute_stage_r_csr_tselect_D_wire),
        .r_csr_tselect_WE(execute_stage_r_csr_tselect_WE_wire),
        .r_ex1_fu_D(execute_stage_r_ex1_fu_D_wire),
        .r_ex1_fu_WE(execute_stage_r_ex1_fu_WE_wire),
        .r_ex1_instr_addr_D(execute_stage_r_ex1_instr_addr_D_wire),
        .r_ex1_instr_addr_WE(execute_stage_r_ex1_instr_addr_WE_wire),
        .r_ex1_is_rvc_D(execute_stage_r_ex1_is_rvc_D_wire),
        .r_ex1_is_rvc_WE(execute_stage_r_ex1_is_rvc_WE_wire),
        .r_ex1_rd_addr_D(execute_stage_r_ex1_rd_addr_D_wire),
        .r_ex1_rd_addr_WE(execute_stage_r_ex1_rd_addr_WE_wire),
        .r_nmi_i_D(execute_stage_r_nmi_i_D_wire),
        .r_nmi_i_WE(execute_stage_r_nmi_i_WE_wire),
        .r_nmi_mtval_D(execute_stage_r_nmi_mtval_D_wire),
        .r_nmi_mtval_WE(execute_stage_r_nmi_mtval_WE_wire),
        .r_nmi_source_D(execute_stage_r_nmi_source_D_wire),
        .r_nmi_source_WE(execute_stage_r_nmi_source_WE_wire),
        .r_prv_D(execute_stage_r_prv_D_wire),
        .r_prv_WE(execute_stage_r_prv_WE_wire),
        .r_wfi_ce_D(execute_stage_r_wfi_ce_D_wire),
        .r_wfi_ce_WE(execute_stage_r_wfi_ce_WE_wire),
        .rf_fr_r1_RA(execute_stage_rf_fr_r1_RA_wire),
        .rf_fr_r1_RE(execute_stage_rf_fr_r1_RE_wire),
        .rf_fr_r2_RA(execute_stage_rf_fr_r2_RA_wire),
        .rf_fr_r2_RE(execute_stage_rf_fr_r2_RE_wire),
        .rf_fr_r3_RA(execute_stage_rf_fr_r3_RA_wire),
        .rf_fr_r3_RE(execute_stage_rf_fr_r3_RE_wire),
        .rf_fr_w_D(execute_stage_rf_fr_w_D_wire),
        .rf_fr_w_WA(execute_stage_rf_fr_w_WA_wire),
        .rf_fr_w_WE(execute_stage_rf_fr_w_WE_wire),
        .rf_gpr_r1_RA(execute_stage_rf_gpr_r1_RA_wire),
        .rf_gpr_r1_RE(execute_stage_rf_gpr_r1_RE_wire),
        .rf_gpr_r2_RA(execute_stage_rf_gpr_r2_RA_wire),
        .rf_gpr_r2_RE(execute_stage_rf_gpr_r2_RE_wire),
        .rf_gpr_w0_D(execute_stage_rf_gpr_w0_D_wire),
        .rf_gpr_w0_WA(execute_stage_rf_gpr_w0_WA_wire),
        .rf_gpr_w0_WE(execute_stage_rf_gpr_w0_WE_wire),
        .rf_gpr_w1_D(execute_stage_rf_gpr_w1_D_wire),
        .rf_gpr_w1_WA(execute_stage_rf_gpr_w1_WA_wire),
        .rf_gpr_w1_WE(execute_stage_rf_gpr_w1_WE_wire),
        .s_dm_progbuf_done_D(s_dm_progbuf_done),
        .s_dm_progbuf_exc_D(s_dm_progbuf_exc),
        .s_ex1_clear_D(s_ex1_clear),
        .s_ex1_stall_D(s_ex1_stall),
        .s_ex_bp_flush_D(s_ex_bp_flush),
        .s_ex_bp_flush_line_D(s_ex_bp_flush_line),
        .s_ex_bp_restart_D(s_ex_bp_restart),
        .s_ex_branch_bht_update_D(s_ex_branch_bht_update),
        .s_ex_branch_btb_update_D(s_ex_branch_btb_update),
        .s_ex_branch_instr_addr_D(s_ex_branch_instr_addr),
        .s_ex_branch_is_rvc_D(s_ex_branch_is_rvc),
        .s_ex_branch_miss_D(s_ex_branch_miss),
        .s_ex_branch_offset_D(s_ex_branch_offset),
        .s_ex_branch_taken_D(s_ex_branch_taken),
        .s_ex_branch_target_addr_D(s_ex_branch_target_addr),
        .s_ex_clear_D(s_ex_clear),
        .s_ex_fence_valid_D(s_ex_fence_valid),
        .s_ex_fpu_busy_D(s_ex_fpu_busy),
        .s_ex_p0_addr_D(s_ex_p0_addr),
        .s_ex_p0_we_D(s_ex_p0_we),
        .s_ex_p1_addr_D(s_ex_p1_addr),
        .s_ex_p1_we_D(s_ex_p1_we),
        .s_ex_progbuf_mode_D(s_ex_progbuf_mode),
        .s_ex_rd_addr_D(s_ex_rd_addr),
        .s_ex_rd_data_D(s_ex_rd_data),
        .s_ex_rd_we_D(s_ex_rd_we),
        .s_ex_return_link_D(s_ex_return_link),
        .s_ex_return_update_D(s_ex_return_update),
        .s_ex_stall_D(s_ex_stall),
        .s_flush_D(s_flush),
        .s_fpu_ce_D(s_fpu_ce),
        .s_fpu_dst_regs_D(s_fpu_dst_regs),
        .s_hart_halted_D(s_hart_halted),
        .s_perf_branch_miss_D(s_perf_branch_miss),
        .s_perf_csr_flush_D(s_perf_csr_flush),
        .s_perf_div_stall_D(s_perf_div_stall),
        .s_perf_exc_flush_D(s_perf_exc_flush),
        .s_perf_fpu_stall_D(s_perf_fpu_stall),
        .s_perf_int_flush_D(s_perf_int_flush),
        .s_perf_lsu_stall_D(s_perf_lsu_stall),
        .s_perf_waddr_D(s_perf_waddr),
        .s_perf_wdata_D(s_perf_wdata),
        .s_perf_we_D(s_perf_we),
        .s_progbuf_mode_active_D(s_progbuf_mode_active),
        .s_rd0_addr_D(s_rd0_addr),
        .s_rd0_data_D(s_rd0_data),
        .s_rd0_we_D(s_rd0_we),
        .s_rd0_write_D(s_rd0_write),
        .s_rd1_addr_D(s_rd1_addr),
        .s_rd1_data_D(s_rd1_data),
        .s_rd1_we_D(s_rd1_we),
        .s_rd1_write_D(s_rd1_write),
        .s_wfi_prevent_fetch_D(s_wfi_prevent_fetch)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_fetch_stage_t #(
        .pma_base0_p(pma_base0_p),
        .pma_mask0_p(pma_mask0_p),
        .pma_enable_p(pma_enable_p),
        .pma_base1_p(pma_base1_p),
        .pma_mask1_p(pma_mask1_p),
        .pma_base2_p(pma_base2_p),
        .pma_mask2_p(pma_mask2_p),
        .pma_base3_p(pma_base3_p),
        .pma_mask3_p(pma_mask3_p),
        .pma_base4_p(pma_base4_p),
        .pma_mask4_p(pma_mask4_p),
        .pma_base5_p(pma_base5_p),
        .pma_mask5_p(pma_mask5_p),
        .pma_base6_p(pma_base6_p),
        .pma_mask6_p(pma_mask6_p),
        .pma_base7_p(pma_base7_p),
        .pma_mask7_p(pma_mask7_p),
        .pma_base8_p(pma_base8_p),
        .pma_mask8_p(pma_mask8_p),
        .pma_base9_p(pma_base9_p),
        .pma_mask9_p(pma_mask9_p),
        .pma_base10_p(pma_base10_p),
        .pma_mask10_p(pma_mask10_p),
        .pma_base11_p(pma_base11_p),
        .pma_mask11_p(pma_mask11_p),
        .pma_base12_p(pma_base12_p),
        .pma_mask12_p(pma_mask12_p),
        .pma_base13_p(pma_base13_p),
        .pma_mask13_p(pma_mask13_p),
        .pma_base14_p(pma_base14_p),
        .pma_mask14_p(pma_mask14_p),
        .pma_base15_p(pma_base15_p),
        .pma_mask15_p(pma_mask15_p),
        .pma_cfg15_p(pma_cfg15_p),
        .pma_cfg14_p(pma_cfg14_p),
        .pma_cfg13_p(pma_cfg13_p),
        .pma_cfg12_p(pma_cfg12_p),
        .pma_cfg11_p(pma_cfg11_p),
        .pma_cfg10_p(pma_cfg10_p),
        .pma_cfg9_p(pma_cfg9_p),
        .pma_cfg8_p(pma_cfg8_p),
        .pma_cfg7_p(pma_cfg7_p),
        .pma_cfg6_p(pma_cfg6_p),
        .pma_cfg5_p(pma_cfg5_p),
        .pma_cfg4_p(pma_cfg4_p),
        .pma_cfg3_p(pma_cfg3_p),
        .pma_cfg2_p(pma_cfg2_p),
        .pma_cfg1_p(pma_cfg1_p),
        .pma_cfg0_p(pma_cfg0_p)
    ) fetch_stage (
        .fetch_stage_bp_bht_s_is_branch_i_ICLK(fetch_stage_bp_bht_s_is_branch_i_ICLK),
        .fetch_stage_bp_btb_s_is_branch_i_ICLK(fetch_stage_bp_btb_s_is_branch_i_ICLK),
        .fetch_stage_bp_btb_s_is_jump_i_ICLK(fetch_stage_bp_btb_s_is_jump_i_ICLK),
        .r_wfi_ce_ICLK(r_wfi_ce_ICLK),
        .RST(RST),
        .execute_stage_bru_s_branch_bht_update_o_Q(execute_stage_bru_s_branch_bht_update_o_Q_wire),
        .execute_stage_bru_s_is_jump_o_Q(execute_stage_bru_s_is_jump_o_Q_wire),
        .execute_stage_bru_s_rd_data_o_Q(execute_stage_bru_s_rd_data_o_Q_wire),
        .execute_stage_crf_s_csr_addr_o_Q(execute_stage_crf_s_csr_addr_o_Q_wire),
        .execute_stage_crf_s_csr_valid_o_Q(execute_stage_crf_s_csr_valid_o_Q_wire),
        .execute_stage_crf_s_trap_addr_o_Q(execute_stage_crf_s_trap_addr_o_Q_wire),
        .execute_stage_crf_s_trap_valid_o_Q(execute_stage_crf_s_trap_valid_o_Q_wire),
        .execute_stage_lsu_pmp_r_pmp0_napot_mask_Q(execute_stage_lsu_pmp_r_pmp0_napot_mask_Q_wire),
        .execute_stage_lsu_pmp_r_pmp10_napot_mask_Q(execute_stage_lsu_pmp_r_pmp10_napot_mask_Q_wire),
        .execute_stage_lsu_pmp_r_pmp11_napot_mask_Q(execute_stage_lsu_pmp_r_pmp11_napot_mask_Q_wire),
        .execute_stage_lsu_pmp_r_pmp12_napot_mask_Q(execute_stage_lsu_pmp_r_pmp12_napot_mask_Q_wire),
        .execute_stage_lsu_pmp_r_pmp13_napot_mask_Q(execute_stage_lsu_pmp_r_pmp13_napot_mask_Q_wire),
        .execute_stage_lsu_pmp_r_pmp14_napot_mask_Q(execute_stage_lsu_pmp_r_pmp14_napot_mask_Q_wire),
        .execute_stage_lsu_pmp_r_pmp15_napot_mask_Q(execute_stage_lsu_pmp_r_pmp15_napot_mask_Q_wire),
        .execute_stage_lsu_pmp_r_pmp1_napot_mask_Q(execute_stage_lsu_pmp_r_pmp1_napot_mask_Q_wire),
        .execute_stage_lsu_pmp_r_pmp2_napot_mask_Q(execute_stage_lsu_pmp_r_pmp2_napot_mask_Q_wire),
        .execute_stage_lsu_pmp_r_pmp3_napot_mask_Q(execute_stage_lsu_pmp_r_pmp3_napot_mask_Q_wire),
        .execute_stage_lsu_pmp_r_pmp4_napot_mask_Q(execute_stage_lsu_pmp_r_pmp4_napot_mask_Q_wire),
        .execute_stage_lsu_pmp_r_pmp5_napot_mask_Q(execute_stage_lsu_pmp_r_pmp5_napot_mask_Q_wire),
        .execute_stage_lsu_pmp_r_pmp6_napot_mask_Q(execute_stage_lsu_pmp_r_pmp6_napot_mask_Q_wire),
        .execute_stage_lsu_pmp_r_pmp7_napot_mask_Q(execute_stage_lsu_pmp_r_pmp7_napot_mask_Q_wire),
        .execute_stage_lsu_pmp_r_pmp8_napot_mask_Q(execute_stage_lsu_pmp_r_pmp8_napot_mask_Q_wire),
        .execute_stage_lsu_pmp_r_pmp9_napot_mask_Q(execute_stage_lsu_pmp_r_pmp9_napot_mask_Q_wire),
        .execute_stage_ocd_s_ocd_addr_o_Q(execute_stage_ocd_s_ocd_addr_o_Q_wire),
        .execute_stage_ocd_s_ocd_busy_o_Q(execute_stage_ocd_s_ocd_busy_o_Q_wire),
        .execute_stage_ocd_s_ocd_progbuf_mode_o_Q(execute_stage_ocd_s_ocd_progbuf_mode_o_Q_wire),
        .execute_stage_ocd_s_ocd_valid_o_Q(execute_stage_ocd_s_ocd_valid_o_Q_wire),
        .i1_if_cpu_fetch_HRDATA(i1_if_cpu_fetch_HRDATA),
        .i1_if_cpu_fetch_HREADY(i1_if_cpu_fetch_HREADY),
        .i1_if_cpu_fetch_HRESP(i1_if_cpu_fetch_HRESP),
        .ifb_s_flush_i_D(decode_stage_fetch_stage_ifb_s_flush_i_D_wire),
        .ifb_s_pop_i_D(decode_stage_fetch_stage_ifb_s_pop_i_D_wire),
        .p_boot_addr_Q(p_boot_addr_Q),
        .pl_ifu_FIN_CLEAR_Q(pl_ifu_FIN_CLEAR_Q_wire),
        .pl_ifu_FIN_STALL_Q(pl_ifu_FIN_STALL_Q_wire),
        .r_cpu_stall_Q(r_cpu_stall_Q_wire),
        .r_csr_pmpaddr0_Q(r_csr_pmpaddr0_Q_wire),
        .r_csr_pmpaddr10_Q(r_csr_pmpaddr10_Q_wire),
        .r_csr_pmpaddr11_Q(r_csr_pmpaddr11_Q_wire),
        .r_csr_pmpaddr12_Q(r_csr_pmpaddr12_Q_wire),
        .r_csr_pmpaddr13_Q(r_csr_pmpaddr13_Q_wire),
        .r_csr_pmpaddr14_Q(r_csr_pmpaddr14_Q_wire),
        .r_csr_pmpaddr15_Q(r_csr_pmpaddr15_Q_wire),
        .r_csr_pmpaddr1_Q(r_csr_pmpaddr1_Q_wire),
        .r_csr_pmpaddr2_Q(r_csr_pmpaddr2_Q_wire),
        .r_csr_pmpaddr3_Q(r_csr_pmpaddr3_Q_wire),
        .r_csr_pmpaddr4_Q(r_csr_pmpaddr4_Q_wire),
        .r_csr_pmpaddr5_Q(r_csr_pmpaddr5_Q_wire),
        .r_csr_pmpaddr6_Q(r_csr_pmpaddr6_Q_wire),
        .r_csr_pmpaddr7_Q(r_csr_pmpaddr7_Q_wire),
        .r_csr_pmpaddr8_Q(r_csr_pmpaddr8_Q_wire),
        .r_csr_pmpaddr9_Q(r_csr_pmpaddr9_Q_wire),
        .r_csr_pmpcfg0_Q(r_csr_pmpcfg0_Q_wire),
        .r_csr_pmpcfg1_Q(r_csr_pmpcfg1_Q_wire),
        .r_csr_pmpcfg2_Q(r_csr_pmpcfg2_Q_wire),
        .r_csr_pmpcfg3_Q(r_csr_pmpcfg3_Q_wire),
        .r_ex_bp_noincr_Q(r_ex_bp_noincr_Q_wire),
        .r_fe_bp_addr_Q(r_fe_bp_addr_Q_wire),
        .r_fe_bp_taken_Q(r_fe_bp_taken_Q_wire),
        .r_PC_Q(r_PC_Q_wire),
        .r_prv_Q(r_prv_Q_wire),
        .r_reset_init_Q(r_reset_init_Q_wire),
        .r_wfi_ce_Q(r_wfi_ce_Q_wire),
        .s_ex_bp_flush_line_Q(s_ex_bp_flush_line),
        .s_ex_bp_flush_Q(s_ex_bp_flush),
        .s_ex_branch_bht_update_Q(s_ex_branch_bht_update),
        .s_ex_branch_btb_update_Q(s_ex_branch_btb_update),
        .s_ex_branch_instr_addr_Q(s_ex_branch_instr_addr),
        .s_ex_branch_is_rvc_Q(s_ex_branch_is_rvc),
        .s_ex_branch_miss_Q(s_ex_branch_miss),
        .s_ex_branch_offset_Q(s_ex_branch_offset),
        .s_ex_branch_taken_Q(s_ex_branch_taken),
        .s_ex_branch_target_addr_Q(s_ex_branch_target_addr),
        .s_ex_fence_valid_Q(s_ex_fence_valid),
        .s_ex_return_link_Q(s_ex_return_link),
        .s_ex_return_update_Q(s_ex_return_update),
        .s_fe_flush_Q(s_fe_flush),
        .s_flush_Q(s_flush),
        .s_wfi_prevent_fetch_Q(s_wfi_prevent_fetch),
        .bp_bht_s_is_branch_i_Q(fetch_stage_bp_bht_s_is_branch_i_Q),
        .bp_btb_s_is_branch_i_Q(fetch_stage_bp_btb_s_is_branch_i_Q),
        .bp_btb_s_is_jump_i_Q(fetch_stage_bp_btb_s_is_jump_i_Q),
        .i1_if_cpu_fetch_HADDR(i1_if_cpu_fetch_HADDR),
        .i1_if_cpu_fetch_HBURST(i1_if_cpu_fetch_HBURST),
        .i1_if_cpu_fetch_HMASTLOCK(i1_if_cpu_fetch_HMASTLOCK),
        .i1_if_cpu_fetch_HPROT(i1_if_cpu_fetch_HPROT),
        .i1_if_cpu_fetch_HSIZE(i1_if_cpu_fetch_HSIZE),
        .i1_if_cpu_fetch_HTRANS(i1_if_cpu_fetch_HTRANS),
        .i1_if_cpu_fetch_HWRITE(i1_if_cpu_fetch_HWRITE),
        .ifb_s_addr_o_Q(fetch_stage_ifb_s_addr_o_Q_wire),
        .ifb_s_bp_addr_o_Q(fetch_stage_ifb_s_bp_addr_o_Q_wire),
        .ifb_s_bp_taken_o_Q(fetch_stage_ifb_s_bp_taken_o_Q_wire),
        .ifb_s_data_o_Q(fetch_stage_ifb_s_data_o_Q_wire),
        .ifb_s_empty_o_Q(fetch_stage_ifb_s_empty_o_Q_wire),
        .ifb_s_exc_type_o_Q(fetch_stage_ifb_s_exc_type_o_Q_wire),
        .ifb_s_exc_valid_o_Q(fetch_stage_ifb_s_exc_valid_o_Q_wire),
        .ifb_s_full_o_Q(fetch_stage_ifb_s_full_o_Q_wire),
        .ifb_s_valid_o_Q(fetch_stage_ifb_s_valid_o_Q_wire),
        .ifu_s_bus_busy_o_Q(fetch_stage_ifu_s_bus_busy_o_Q_wire),
        .ifu_s_ifu_busy_o_Q(fetch_stage_ifu_s_ifu_busy_o_Q_wire),
        .pl_ifu_FIN_CLEAR_D(fetch_stage_pl_ifu_FIN_CLEAR_D_wire),
        .pl_ifu_FIN_STALL_D(fetch_stage_pl_ifu_FIN_STALL_D_wire),
        .r_fe_bp_addr_D(fetch_stage_r_fe_bp_addr_D_wire),
        .r_fe_bp_addr_WE(fetch_stage_r_fe_bp_addr_WE_wire),
        .r_fe_bp_taken_D(fetch_stage_r_fe_bp_taken_D_wire),
        .r_fe_bp_taken_WE(fetch_stage_r_fe_bp_taken_WE_wire),
        .r_PC_D(fetch_stage_r_PC_D_wire),
        .r_PC_WE(fetch_stage_r_PC_WE_wire),
        .s_fe_flush_D(s_fe_flush),
        .s_perf_ifu_stall_D(s_perf_ifu_stall)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_decode_stage_t decode_stage (
        .r_wfi_ce_ICLK(r_wfi_ce_ICLK),
        .RST(RST),
        .fetch_stage_ifb_s_addr_o_Q(fetch_stage_ifb_s_addr_o_Q_wire),
        .fetch_stage_ifb_s_bp_addr_o_Q(fetch_stage_ifb_s_bp_addr_o_Q_wire),
        .fetch_stage_ifb_s_bp_taken_o_Q(fetch_stage_ifb_s_bp_taken_o_Q_wire),
        .fetch_stage_ifb_s_data_o_Q(fetch_stage_ifb_s_data_o_Q_wire),
        .fetch_stage_ifb_s_empty_o_Q(fetch_stage_ifb_s_empty_o_Q_wire),
        .fetch_stage_ifb_s_exc_type_o_Q(fetch_stage_ifb_s_exc_type_o_Q_wire),
        .fetch_stage_ifb_s_exc_valid_o_Q(fetch_stage_ifb_s_exc_valid_o_Q_wire),
        .fetch_stage_ifb_s_valid_o_Q(fetch_stage_ifb_s_valid_o_Q_wire),
        .r_csr_mstatus_Q(r_csr_mstatus_Q_wire[14:13]),
        .r_csr_tcontrol_Q(r_csr_tcontrol_Q_wire[3]),
        .r_csr_tdata1_r0_Q(r_csr_tdata1_r0_Q_wire),
        .r_csr_tdata1_r1_Q(r_csr_tdata1_r1_Q_wire),
        .r_csr_tdata1_r2_Q(r_csr_tdata1_r2_Q_wire),
        .r_csr_tdata1_r3_Q(r_csr_tdata1_r3_Q_wire),
        .r_csr_tdata1_r4_Q(r_csr_tdata1_r4_Q_wire),
        .r_csr_tdata1_r5_Q(r_csr_tdata1_r5_Q_wire),
        .r_csr_tdata1_r6_Q(r_csr_tdata1_r6_Q_wire),
        .r_csr_tdata1_r7_Q(r_csr_tdata1_r7_Q_wire),
        .r_csr_tdata2_r0_Q(r_csr_tdata2_r0_Q_wire),
        .r_csr_tdata2_r1_Q(r_csr_tdata2_r1_Q_wire),
        .r_csr_tdata2_r2_Q(r_csr_tdata2_r2_Q_wire),
        .r_csr_tdata2_r3_Q(r_csr_tdata2_r3_Q_wire),
        .r_csr_tdata2_r4_Q(r_csr_tdata2_r4_Q_wire),
        .r_csr_tdata2_r5_Q(r_csr_tdata2_r5_Q_wire),
        .r_csr_tdata2_r6_Q(r_csr_tdata2_r6_Q_wire),
        .r_csr_tdata2_r7_Q(r_csr_tdata2_r7_Q_wire),
        .r_prv_Q(r_prv_Q_wire),
        .rf_gpr_r0_Q(rf_gpr_r0_Q_wire),
        .s_ex_p0_addr_Q(s_ex_p0_addr),
        .s_ex_p0_we_Q(s_ex_p0_we),
        .s_ex_p1_addr_Q(s_ex_p1_addr),
        .s_ex_p1_we_Q(s_ex_p1_we),
        .s_ex_progbuf_mode_Q(s_ex_progbuf_mode),
        .s_ex_rd_addr_Q(s_ex_rd_addr),
        .s_ex_rd_data_Q(s_ex_rd_data),
        .s_ex_rd_we_Q(s_ex_rd_we),
        .s_ex_stall_Q(s_ex_stall),
        .s_flush_Q(s_flush),
        .s_fpu_dst_regs_Q(s_fpu_dst_regs),
        .s_id_instr_addr_Q(s_id_instr_addr),
        .s_id_stall_Q(s_id_stall),
        .s_progbuf_mode_active_Q(s_progbuf_mode_active),
        .fetch_stage_ifb_s_flush_i_D(decode_stage_fetch_stage_ifb_s_flush_i_D_wire),
        .fetch_stage_ifb_s_pop_i_D(decode_stage_fetch_stage_ifb_s_pop_i_D_wire),
        .r_csr_tdata1_r0_RA(decode_stage_r_csr_tdata1_r0_RA_wire),
        .r_csr_tdata1_r0_RE(decode_stage_r_csr_tdata1_r0_RE_wire),
        .r_csr_tdata1_r1_RA(decode_stage_r_csr_tdata1_r1_RA_wire),
        .r_csr_tdata1_r1_RE(decode_stage_r_csr_tdata1_r1_RE_wire),
        .r_csr_tdata1_r2_RA(decode_stage_r_csr_tdata1_r2_RA_wire),
        .r_csr_tdata1_r2_RE(decode_stage_r_csr_tdata1_r2_RE_wire),
        .r_csr_tdata1_r3_RA(decode_stage_r_csr_tdata1_r3_RA_wire),
        .r_csr_tdata1_r3_RE(decode_stage_r_csr_tdata1_r3_RE_wire),
        .r_csr_tdata1_r4_RA(decode_stage_r_csr_tdata1_r4_RA_wire),
        .r_csr_tdata1_r4_RE(decode_stage_r_csr_tdata1_r4_RE_wire),
        .r_csr_tdata1_r5_RA(decode_stage_r_csr_tdata1_r5_RA_wire),
        .r_csr_tdata1_r5_RE(decode_stage_r_csr_tdata1_r5_RE_wire),
        .r_csr_tdata1_r6_RA(decode_stage_r_csr_tdata1_r6_RA_wire),
        .r_csr_tdata1_r6_RE(decode_stage_r_csr_tdata1_r6_RE_wire),
        .r_csr_tdata1_r7_RA(decode_stage_r_csr_tdata1_r7_RA_wire),
        .r_csr_tdata1_r7_RE(decode_stage_r_csr_tdata1_r7_RE_wire),
        .r_csr_tdata2_r0_RA(decode_stage_r_csr_tdata2_r0_RA_wire),
        .r_csr_tdata2_r0_RE(decode_stage_r_csr_tdata2_r0_RE_wire),
        .r_csr_tdata2_r1_RA(decode_stage_r_csr_tdata2_r1_RA_wire),
        .r_csr_tdata2_r1_RE(decode_stage_r_csr_tdata2_r1_RE_wire),
        .r_csr_tdata2_r2_RA(decode_stage_r_csr_tdata2_r2_RA_wire),
        .r_csr_tdata2_r2_RE(decode_stage_r_csr_tdata2_r2_RE_wire),
        .r_csr_tdata2_r3_RA(decode_stage_r_csr_tdata2_r3_RA_wire),
        .r_csr_tdata2_r3_RE(decode_stage_r_csr_tdata2_r3_RE_wire),
        .r_csr_tdata2_r4_RA(decode_stage_r_csr_tdata2_r4_RA_wire),
        .r_csr_tdata2_r4_RE(decode_stage_r_csr_tdata2_r4_RE_wire),
        .r_csr_tdata2_r5_RA(decode_stage_r_csr_tdata2_r5_RA_wire),
        .r_csr_tdata2_r5_RE(decode_stage_r_csr_tdata2_r5_RE_wire),
        .r_csr_tdata2_r6_RA(decode_stage_r_csr_tdata2_r6_RA_wire),
        .r_csr_tdata2_r6_RE(decode_stage_r_csr_tdata2_r6_RE_wire),
        .r_csr_tdata2_r7_RA(decode_stage_r_csr_tdata2_r7_RA_wire),
        .r_csr_tdata2_r7_RE(decode_stage_r_csr_tdata2_r7_RE_wire),
        .r_ex_bp_addr_D(decode_stage_r_ex_bp_addr_D_wire),
        .r_ex_bp_addr_WE(decode_stage_r_ex_bp_addr_WE_wire),
        .r_ex_bp_noincr_D(decode_stage_r_ex_bp_noincr_D_wire),
        .r_ex_bp_noincr_WE(decode_stage_r_ex_bp_noincr_WE_wire),
        .r_ex_bp_taken_D(decode_stage_r_ex_bp_taken_D_wire),
        .r_ex_bp_taken_WE(decode_stage_r_ex_bp_taken_WE_wire),
        .r_ex_csr_addr_D(decode_stage_r_ex_csr_addr_D_wire),
        .r_ex_csr_addr_WE(decode_stage_r_ex_csr_addr_WE_wire),
        .r_ex_exc_tval_D(decode_stage_r_ex_exc_tval_D_wire),
        .r_ex_exc_tval_WE(decode_stage_r_ex_exc_tval_WE_wire),
        .r_ex_exc_type_D(decode_stage_r_ex_exc_type_D_wire),
        .r_ex_exc_type_WE(decode_stage_r_ex_exc_type_WE_wire),
        .r_ex_exc_valid_D(decode_stage_r_ex_exc_valid_D_wire),
        .r_ex_exc_valid_WE(decode_stage_r_ex_exc_valid_WE_wire),
        .r_ex_fpu_op_D(decode_stage_r_ex_fpu_op_D_wire),
        .r_ex_fpu_op_WE(decode_stage_r_ex_fpu_op_WE_wire),
        .r_ex_fu_D(decode_stage_r_ex_fu_D_wire),
        .r_ex_fu_s1_source_D(decode_stage_r_ex_fu_s1_source_D_wire),
        .r_ex_fu_s1_source_WE(decode_stage_r_ex_fu_s1_source_WE_wire),
        .r_ex_fu_s2_source_D(decode_stage_r_ex_fu_s2_source_D_wire),
        .r_ex_fu_s2_source_WE(decode_stage_r_ex_fu_s2_source_WE_wire),
        .r_ex_fu_s3_source_D(decode_stage_r_ex_fu_s3_source_D_wire),
        .r_ex_fu_s3_source_WE(decode_stage_r_ex_fu_s3_source_WE_wire),
        .r_ex_fu_WE(decode_stage_r_ex_fu_WE_wire),
        .r_ex_imm_D(decode_stage_r_ex_imm_D_wire),
        .r_ex_imm_WE(decode_stage_r_ex_imm_WE_wire),
        .r_ex_instr_addr_D(decode_stage_r_ex_instr_addr_D_wire),
        .r_ex_instr_addr_WE(decode_stage_r_ex_instr_addr_WE_wire),
        .r_ex_instr_valid_D(decode_stage_r_ex_instr_valid_D_wire),
        .r_ex_instr_valid_WE(decode_stage_r_ex_instr_valid_WE_wire),
        .r_ex_is_rvc_D(decode_stage_r_ex_is_rvc_D_wire),
        .r_ex_is_rvc_WE(decode_stage_r_ex_is_rvc_WE_wire),
        .r_ex_lsu_addr_D(decode_stage_r_ex_lsu_addr_D_wire),
        .r_ex_lsu_addr_WE(decode_stage_r_ex_lsu_addr_WE_wire),
        .r_ex_op_D(decode_stage_r_ex_op_D_wire),
        .r_ex_op_WE(decode_stage_r_ex_op_WE_wire),
        .r_ex_rd_addr_D(decode_stage_r_ex_rd_addr_D_wire),
        .r_ex_rd_addr_WE(decode_stage_r_ex_rd_addr_WE_wire),
        .r_ex_rm_D(decode_stage_r_ex_rm_D_wire),
        .r_ex_rm_WE(decode_stage_r_ex_rm_WE_wire),
        .r_ex_rs1_addr_D(decode_stage_r_ex_rs1_addr_D_wire),
        .r_ex_rs1_addr_WE(decode_stage_r_ex_rs1_addr_WE_wire),
        .r_ex_rs2_addr_D(decode_stage_r_ex_rs2_addr_D_wire),
        .r_ex_rs2_addr_WE(decode_stage_r_ex_rs2_addr_WE_wire),
        .r_ex_rs3_addr_D(decode_stage_r_ex_rs3_addr_D_wire),
        .r_ex_rs3_addr_WE(decode_stage_r_ex_rs3_addr_WE_wire),
        .rf_gpr_r0_RA(decode_stage_rf_gpr_r0_RA_wire),
        .rf_gpr_r0_RE(decode_stage_rf_gpr_r0_RE_wire),
        .s_id_clear_D(s_id_clear),
        .s_id_instr_addr_D(s_id_instr_addr),
        .s_id_stall_D(s_id_stall),
        .s_perf_data_stall_D(s_perf_data_stall)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_perf_t perf (
        .r_wfi_ce_ICLK(r_wfi_ce_ICLK),
        .RST(RST),
        .s_branch_miss_i_D(main_perf_s_branch_miss_i_D_wire),
        .s_csr_flush_i_D(main_perf_s_csr_flush_i_D_wire),
        .s_data_stall_i_D(main_perf_s_data_stall_i_D_wire),
        .s_div_stall_i_D(main_perf_s_div_stall_i_D_wire),
        .s_exc_flush_i_D(main_perf_s_exc_flush_i_D_wire),
        .s_flush_i_D(main_perf_s_flush_i_D_wire),
        .s_fpu_stall_i_D(main_perf_s_fpu_stall_i_D_wire),
        .s_hpm_inhibit_i_D(main_perf_s_hpm_inhibit_i_D_wire),
        .s_ifu_stall_i_D(main_perf_s_ifu_stall_i_D_wire),
        .s_inhibit_i_D(main_perf_s_inhibit_i_D_wire),
        .s_int_flush_i_D(main_perf_s_int_flush_i_D_wire),
        .s_lsu_stall_i_D(main_perf_s_lsu_stall_i_D_wire),
        .s_perf_waddr_i_D(main_perf_s_perf_waddr_i_D_wire),
        .s_perf_wdata_i_D(main_perf_s_perf_wdata_i_D_wire),
        .s_perf_we_i_D(main_perf_s_perf_we_i_D_wire),
        .r_mhpmcounter10_Q(perf_r_mhpmcounter10_Q_wire),
        .r_mhpmcounter12_Q(perf_r_mhpmcounter12_Q_wire),
        .r_mhpmcounter13_Q(perf_r_mhpmcounter13_Q_wire),
        .r_mhpmcounter14_Q(perf_r_mhpmcounter14_Q_wire),
        .r_mhpmcounter15_Q(perf_r_mhpmcounter15_Q_wire),
        .r_mhpmcounter3_Q(perf_r_mhpmcounter3_Q_wire),
        .r_mhpmcounter4_Q(perf_r_mhpmcounter4_Q_wire),
        .r_mhpmcounter5_Q(perf_r_mhpmcounter5_Q_wire),
        .r_mhpmcounter6_Q(perf_r_mhpmcounter6_Q_wire),
        .r_mhpmcounter9_Q(perf_r_mhpmcounter9_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_plc_t plc (
        .fetch_stage_ifb_s_full_o_Q(fetch_stage_ifb_s_full_o_Q_wire),
        .fetch_stage_ifu_s_ifu_busy_o_Q(fetch_stage_ifu_s_ifu_busy_o_Q_wire),
        .s_ex1_clear_i_D(main_plc_s_ex1_clear_i_D_wire),
        .s_ex1_stall_i_D(main_plc_s_ex1_stall_i_D_wire),
        .s_ex_clear_i_D(main_plc_s_ex_clear_i_D_wire),
        .s_ex_stall_i_D(main_plc_s_ex_stall_i_D_wire),
        .s_flush_i_D(main_plc_s_flush_i_D_wire),
        .s_id_clear_i_D(main_plc_s_id_clear_i_D_wire),
        .pipe_EX1_CLEAR_D(plc_pipe_EX1_CLEAR_D_wire),
        .pipe_EX1_STALL_D(plc_pipe_EX1_STALL_D_wire),
        .pipe_EX_CLEAR_D(plc_pipe_EX_CLEAR_D_wire),
        .pipe_EX_STALL_D(plc_pipe_EX_STALL_D_wire),
        .pipe_FE_STALL_D(plc_pipe_FE_STALL_D_wire)
    );

    // functional unit instance:
    codix_berkelium_ca_core_halt_t halt (
        .ACT(execute_stage_halt_ACT_wire),
        .codasip_halt_wire_D(codasip_halt_wire_D)
    );

    // functional unit instance:
    codix_berkelium_ca_core_main_t main (
        .execute_stage_crf_s_hpm_inhibit_o_Q(execute_stage_crf_s_hpm_inhibit_o_Q_wire),
        .execute_stage_crf_s_perf_inhibit_o_Q(execute_stage_crf_s_perf_inhibit_o_Q_wire),
        .p_boot_addr_Q(p_boot_addr_Q),
        .p_eviction_error_Q(p_eviction_error_Q),
        .p_cpu_stall_Q(p_cpu_stall_Q),
        .r_cpu_stall_Q(r_cpu_stall_Q_wire),
        .r_csr_mdtcmen_Q(r_csr_mdtcmen_Q_wire),
        .r_csr_mitcmen_Q(r_csr_mitcmen_Q_wire),
        .r_reset_init_Q(r_reset_init_Q_wire),
        .r_wfi_ce_Q(r_wfi_ce_Q_wire),
        .s_ex1_clear_Q(s_ex1_clear),
        .s_ex1_stall_Q(s_ex1_stall),
        .s_ex_clear_Q(s_ex_clear),
        .s_ex_stall_Q(s_ex_stall),
        .s_flush_Q(s_flush),
        .s_id_clear_Q(s_id_clear),
        .s_perf_branch_miss_Q(s_perf_branch_miss),
        .s_perf_csr_flush_Q(s_perf_csr_flush),
        .s_perf_data_stall_Q(s_perf_data_stall),
        .s_perf_div_stall_Q(s_perf_div_stall),
        .s_perf_exc_flush_Q(s_perf_exc_flush),
        .s_perf_fpu_stall_Q(s_perf_fpu_stall),
        .s_perf_ifu_stall_Q(s_perf_ifu_stall),
        .s_perf_int_flush_Q(s_perf_int_flush),
        .s_perf_lsu_stall_Q(s_perf_lsu_stall),
        .s_perf_waddr_Q(s_perf_waddr),
        .s_perf_wdata_Q(s_perf_wdata),
        .s_perf_we_Q(s_perf_we),
        .execute_stage_ira_r_return_address_D(main_execute_stage_ira_r_return_address_D_wire),
        .execute_stage_ira_r_return_address_WE(main_execute_stage_ira_r_return_address_WE_wire),
        .i1_p_dtcm_en(i1_p_dtcm_en),
        .i1_p_itcm_en(i1_p_itcm_en),
        .p_wfi_D(p_wfi_D),
        .perf_s_branch_miss_i_D(main_perf_s_branch_miss_i_D_wire),
        .perf_s_csr_flush_i_D(main_perf_s_csr_flush_i_D_wire),
        .perf_s_data_stall_i_D(main_perf_s_data_stall_i_D_wire),
        .perf_s_div_stall_i_D(main_perf_s_div_stall_i_D_wire),
        .perf_s_exc_flush_i_D(main_perf_s_exc_flush_i_D_wire),
        .perf_s_flush_i_D(main_perf_s_flush_i_D_wire),
        .perf_s_fpu_stall_i_D(main_perf_s_fpu_stall_i_D_wire),
        .perf_s_hpm_inhibit_i_D(main_perf_s_hpm_inhibit_i_D_wire),
        .perf_s_ifu_stall_i_D(main_perf_s_ifu_stall_i_D_wire),
        .perf_s_inhibit_i_D(main_perf_s_inhibit_i_D_wire),
        .perf_s_int_flush_i_D(main_perf_s_int_flush_i_D_wire),
        .perf_s_lsu_stall_i_D(main_perf_s_lsu_stall_i_D_wire),
        .perf_s_perf_waddr_i_D(main_perf_s_perf_waddr_i_D_wire),
        .perf_s_perf_wdata_i_D(main_perf_s_perf_wdata_i_D_wire),
        .perf_s_perf_we_i_D(main_perf_s_perf_we_i_D_wire),
        .plc_s_ex1_clear_i_D(main_plc_s_ex1_clear_i_D_wire),
        .plc_s_ex1_stall_i_D(main_plc_s_ex1_stall_i_D_wire),
        .plc_s_ex_clear_i_D(main_plc_s_ex_clear_i_D_wire),
        .plc_s_ex_stall_i_D(main_plc_s_ex_stall_i_D_wire),
        .plc_s_flush_i_D(main_plc_s_flush_i_D_wire),
        .plc_s_id_clear_i_D(main_plc_s_id_clear_i_D_wire),
        .r_cpu_stall_D(main_r_cpu_stall_D_wire),
        .r_cpu_stall_WE(main_r_cpu_stall_WE_wire),
        .r_reset_init_D(main_r_reset_init_D_wire),
        .r_reset_init_WE(main_r_reset_init_WE_wire),
        .r_syscall_addr_D(main_r_syscall_addr_D_wire),
        .r_syscall_addr_WE(main_r_syscall_addr_WE_wire),
        .s_eviction_error_D(s_eviction_error)
    );

    // pipeline controller instance:
    codix_berkelium_ca_core_control_fpu_t control_fpu (
        .CONTROL_CLEAR_D(execute_stage_control_fpu_CONTROL_CLEAR_D_wire),
        .CONTROL_STALL_D(execute_stage_control_fpu_CONTROL_STALL_D_wire),
        .ROB_CLEAR_D(execute_stage_control_fpu_ROB_CLEAR_D_wire),
        .CONTROL_CLEAR_Q(control_fpu_CONTROL_CLEAR_Q_wire),
        .CONTROL_STALL_Q(control_fpu_CONTROL_STALL_Q_wire),
        .ROB_CLEAR_Q(control_fpu_ROB_CLEAR_Q_wire)
    );

    // pipeline controller instance:
    codix_berkelium_ca_core_pipe_add_sub_t pipe_add_sub (
        .COMPUTE_CLEAR_D(execute_stage_pipe_add_sub_COMPUTE_CLEAR_D_wire),
        .COMPUTE_STALL_D(execute_stage_pipe_add_sub_COMPUTE_STALL_D_wire),
        .POSTNORM_CLEAR_D(execute_stage_pipe_add_sub_POSTNORM_CLEAR_D_wire),
        .POSTNORM_STALL_D(execute_stage_pipe_add_sub_POSTNORM_STALL_D_wire),
        .ROUNDING_CLEAR_D(execute_stage_pipe_add_sub_ROUNDING_CLEAR_D_wire),
        .ROUNDING_STALL_D(execute_stage_pipe_add_sub_ROUNDING_STALL_D_wire),
        .COMPUTE_CLEAR_Q(pipe_add_sub_COMPUTE_CLEAR_Q_wire),
        .COMPUTE_STALL_Q(pipe_add_sub_COMPUTE_STALL_Q_wire),
        .POSTNORM_CLEAR_Q(pipe_add_sub_POSTNORM_CLEAR_Q_wire),
        .POSTNORM_STALL_Q(pipe_add_sub_POSTNORM_STALL_Q_wire),
        .ROUNDING_CLEAR_Q(pipe_add_sub_ROUNDING_CLEAR_Q_wire),
        .ROUNDING_STALL_Q(pipe_add_sub_ROUNDING_STALL_Q_wire)
    );

    // pipeline controller instance:
    codix_berkelium_ca_core_pipe_sqrt_div_t pipe_sqrt_div (
        .SQRT_DIV_CLEAR_D(execute_stage_pipe_sqrt_div_SQRT_DIV_CLEAR_D_wire),
        .SQRT_DIV_CLEAR_Q(pipe_sqrt_div_SQRT_DIV_CLEAR_Q_wire)
    );

    // pipeline controller instance:
    codix_berkelium_ca_core_pipe_f2i_t pipe_f2i (
        .F2I_CLEAR_D(execute_stage_pipe_f2i_F2I_CLEAR_D_wire),
        .F2I_STALL_D(execute_stage_pipe_f2i_F2I_STALL_D_wire),
        .F2I_CLEAR_Q(pipe_f2i_F2I_CLEAR_Q_wire),
        .F2I_STALL_Q(pipe_f2i_F2I_STALL_Q_wire)
    );

    // pipeline controller instance:
    codix_berkelium_ca_core_pipe_fused_t pipe_fused (
        .ADDSUB_CLEAR_D(execute_stage_pipe_fused_ADDSUB_CLEAR_D_wire),
        .POSTNORM_ADDSUB_CLEAR_D(execute_stage_pipe_fused_POSTNORM_ADDSUB_CLEAR_D_wire),
        .POSTNORM_MUL1_CLEAR_D(execute_stage_pipe_fused_POSTNORM_MUL1_CLEAR_D_wire),
        .POSTNORM_MUL2_CLEAR_D(execute_stage_pipe_fused_POSTNORM_MUL2_CLEAR_D_wire),
        .PRENORM_ADDSUB_CLEAR_D(execute_stage_pipe_fused_PRENORM_ADDSUB_CLEAR_D_wire),
        .ROUNDING_CLEAR_D(execute_stage_pipe_fused_ROUNDING_CLEAR_D_wire),
        .WAIT_MUL_CLEAR_D(execute_stage_pipe_fused_WAIT_MUL_CLEAR_D_wire),
        .ADDSUB_CLEAR_Q(pipe_fused_ADDSUB_CLEAR_Q_wire),
        .POSTNORM_ADDSUB_CLEAR_Q(pipe_fused_POSTNORM_ADDSUB_CLEAR_Q_wire),
        .POSTNORM_MUL1_CLEAR_Q(pipe_fused_POSTNORM_MUL1_CLEAR_Q_wire),
        .POSTNORM_MUL2_CLEAR_Q(pipe_fused_POSTNORM_MUL2_CLEAR_Q_wire),
        .PRENORM_ADDSUB_CLEAR_Q(pipe_fused_PRENORM_ADDSUB_CLEAR_Q_wire),
        .ROUNDING_CLEAR_Q(pipe_fused_ROUNDING_CLEAR_Q_wire),
        .WAIT_MUL_CLEAR_Q(pipe_fused_WAIT_MUL_CLEAR_Q_wire)
    );

    // pipeline controller instance:
    codix_berkelium_ca_core_pipe_i2f_t pipe_i2f (
        .COMPUTE_CLEAR_D(execute_stage_pipe_i2f_COMPUTE_CLEAR_D_wire),
        .COMPUTE_STALL_D(execute_stage_pipe_i2f_COMPUTE_STALL_D_wire),
        .ROUNDING_CLEAR_D(execute_stage_pipe_i2f_ROUNDING_CLEAR_D_wire),
        .ROUNDING_STALL_D(execute_stage_pipe_i2f_ROUNDING_STALL_D_wire),
        .COMPUTE_CLEAR_Q(pipe_i2f_COMPUTE_CLEAR_Q_wire),
        .COMPUTE_STALL_Q(pipe_i2f_COMPUTE_STALL_Q_wire),
        .ROUNDING_CLEAR_Q(pipe_i2f_ROUNDING_CLEAR_Q_wire),
        .ROUNDING_STALL_Q(pipe_i2f_ROUNDING_STALL_Q_wire)
    );

    // pipeline controller instance:
    codix_berkelium_ca_core_pipe_fmul_t pipe_fmul (
        .MUL_CLEAR_D(execute_stage_pipe_fmul_MUL_CLEAR_D_wire),
        .POSTNORM1_CLEAR_D(execute_stage_pipe_fmul_POSTNORM1_CLEAR_D_wire),
        .POSTNORM2_CLEAR_D(execute_stage_pipe_fmul_POSTNORM2_CLEAR_D_wire),
        .ROUNDING_CLEAR_D(execute_stage_pipe_fmul_ROUNDING_CLEAR_D_wire),
        .MUL_CLEAR_Q(pipe_fmul_MUL_CLEAR_Q_wire),
        .POSTNORM1_CLEAR_Q(pipe_fmul_POSTNORM1_CLEAR_Q_wire),
        .POSTNORM2_CLEAR_Q(pipe_fmul_POSTNORM2_CLEAR_Q_wire),
        .ROUNDING_CLEAR_Q(pipe_fmul_ROUNDING_CLEAR_Q_wire)
    );

    // pipeline controller instance:
    codix_berkelium_ca_core_pl_ifu_t pl_ifu (
        .FIN_CLEAR_D(fetch_stage_pl_ifu_FIN_CLEAR_D_wire),
        .FIN_STALL_D(fetch_stage_pl_ifu_FIN_STALL_D_wire),
        .FIN_CLEAR_Q(pl_ifu_FIN_CLEAR_Q_wire),
        .FIN_STALL_Q(pl_ifu_FIN_STALL_Q_wire)
    );

    // pipeline controller instance:
    codix_berkelium_ca_core_pl_lsu_t pl_lsu (
        .FIN_CLEAR_D(execute_stage_pl_lsu_FIN_CLEAR_D_wire),
        .FIN_STALL_D(execute_stage_pl_lsu_FIN_STALL_D_wire),
        .FIN_CLEAR_Q(pl_lsu_FIN_CLEAR_Q_wire),
        .FIN_STALL_Q(pl_lsu_FIN_STALL_Q_wire)
    );

    // pipeline controller instance:
    codix_berkelium_ca_core_pipe_t pipe (
        .EX1_CLEAR_D(plc_pipe_EX1_CLEAR_D_wire),
        .EX1_STALL_D(plc_pipe_EX1_STALL_D_wire),
        .EX_CLEAR_D(plc_pipe_EX_CLEAR_D_wire),
        .EX_STALL_D(plc_pipe_EX_STALL_D_wire),
        .FE_STALL_D(plc_pipe_FE_STALL_D_wire),
        .EX1_CLEAR_Q(pipe_EX1_CLEAR_Q_wire),
        .EX1_STALL_Q(pipe_EX1_STALL_Q_wire),
        .EX_CLEAR_Q(pipe_EX_CLEAR_Q_wire),
        .EX_STALL_Q(pipe_EX_STALL_Q_wire),
        .FE_STALL_Q(pipe_FE_STALL_Q_wire)
    );

endmodule: codix_berkelium_ca_core_t
