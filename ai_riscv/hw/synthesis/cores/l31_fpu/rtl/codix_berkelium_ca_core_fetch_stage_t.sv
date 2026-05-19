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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_t' CodAL module.
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

module codix_berkelium_ca_core_fetch_stage_t #(
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
    parameter [1:0] pma_cfg0_p = 2'h3
) (
    input  logic fetch_stage_bp_bht_s_is_branch_i_ICLK,
    input  logic fetch_stage_bp_btb_s_is_branch_i_ICLK,
    input  logic fetch_stage_bp_btb_s_is_jump_i_ICLK,
    input  logic r_wfi_ce_ICLK,
    input  logic RST,
    input  logic execute_stage_bru_s_branch_bht_update_o_Q,
    input  logic execute_stage_bru_s_is_jump_o_Q,
    input  logic [31:0] execute_stage_bru_s_rd_data_o_Q,
    input  logic [31:0] execute_stage_crf_s_csr_addr_o_Q,
    input  logic execute_stage_crf_s_csr_valid_o_Q,
    input  logic [31:0] execute_stage_crf_s_trap_addr_o_Q,
    input  logic execute_stage_crf_s_trap_valid_o_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp0_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp10_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp11_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp12_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp13_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp14_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp15_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp1_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp2_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp3_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp4_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp5_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp6_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp7_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp8_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp9_napot_mask_Q,
    input  logic [31:0] execute_stage_ocd_s_ocd_addr_o_Q,
    input  logic execute_stage_ocd_s_ocd_busy_o_Q,
    input  logic execute_stage_ocd_s_ocd_progbuf_mode_o_Q,
    input  logic execute_stage_ocd_s_ocd_valid_o_Q,
    input  logic [31:0] i1_if_cpu_fetch_HRDATA,
    input  logic i1_if_cpu_fetch_HREADY,
    input  logic i1_if_cpu_fetch_HRESP,
    input  logic ifb_s_flush_i_D,
    input  logic ifb_s_pop_i_D,
    input  logic [30:0] p_boot_addr_Q,
    input  logic pl_ifu_FIN_CLEAR_Q,
    input  logic pl_ifu_FIN_STALL_Q,
    input  logic r_cpu_stall_Q,
    input  logic [31:0] r_csr_pmpaddr0_Q,
    input  logic [31:0] r_csr_pmpaddr10_Q,
    input  logic [31:0] r_csr_pmpaddr11_Q,
    input  logic [31:0] r_csr_pmpaddr12_Q,
    input  logic [31:0] r_csr_pmpaddr13_Q,
    input  logic [31:0] r_csr_pmpaddr14_Q,
    input  logic [31:0] r_csr_pmpaddr15_Q,
    input  logic [31:0] r_csr_pmpaddr1_Q,
    input  logic [31:0] r_csr_pmpaddr2_Q,
    input  logic [31:0] r_csr_pmpaddr3_Q,
    input  logic [31:0] r_csr_pmpaddr4_Q,
    input  logic [31:0] r_csr_pmpaddr5_Q,
    input  logic [31:0] r_csr_pmpaddr6_Q,
    input  logic [31:0] r_csr_pmpaddr7_Q,
    input  logic [31:0] r_csr_pmpaddr8_Q,
    input  logic [31:0] r_csr_pmpaddr9_Q,
    input  logic [31:0] r_csr_pmpcfg0_Q,
    input  logic [31:0] r_csr_pmpcfg1_Q,
    input  logic [31:0] r_csr_pmpcfg2_Q,
    input  logic [31:0] r_csr_pmpcfg3_Q,
    input  logic r_ex_bp_noincr_Q,
    input  logic [31:0] r_fe_bp_addr_Q,
    input  logic [1:0] r_fe_bp_taken_Q,
    input  logic [31:0] r_PC_Q,
    input  logic [1:0] r_prv_Q,
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
    output logic bp_bht_s_is_branch_i_Q,
    output logic bp_btb_s_is_branch_i_Q,
    output logic bp_btb_s_is_jump_i_Q,
    output logic [31:0] i1_if_cpu_fetch_HADDR,
    output logic [2:0] i1_if_cpu_fetch_HBURST,
    output logic i1_if_cpu_fetch_HMASTLOCK,
    output logic [3:0] i1_if_cpu_fetch_HPROT,
    output logic [2:0] i1_if_cpu_fetch_HSIZE,
    output logic [1:0] i1_if_cpu_fetch_HTRANS,
    output logic i1_if_cpu_fetch_HWRITE,
    output logic [31:0] ifb_s_addr_o_Q,
    output logic [31:0] ifb_s_bp_addr_o_Q,
    output logic [1:0] ifb_s_bp_taken_o_Q,
    output logic [31:0] ifb_s_data_o_Q,
    output logic ifb_s_empty_o_Q,
    output logic [4:0] ifb_s_exc_type_o_Q,
    output logic ifb_s_exc_valid_o_Q,
    output logic ifb_s_full_o_Q,
    output logic [1:0] ifb_s_valid_o_Q,
    output logic ifu_s_bus_busy_o_Q,
    output logic ifu_s_ifu_busy_o_Q,
    output logic pl_ifu_FIN_CLEAR_D,
    output logic pl_ifu_FIN_STALL_D,
    output logic [31:0] r_fe_bp_addr_D,
    output logic r_fe_bp_addr_WE,
    output logic [1:0] r_fe_bp_taken_D,
    output logic r_fe_bp_taken_WE,
    output logic [31:0] r_PC_D,
    output logic r_PC_WE,
    output logic s_fe_flush_D,
    output logic s_perf_ifu_stall_D
);
    // additional declarations:
    logic fe_bp_s_branch_bht_update_i_D_wire;
    logic fe_bp_s_branch_btb_update_i_D_wire;
    logic [31:0] fe_bp_s_branch_instr_addr_i_D_wire;
    logic fe_bp_s_branch_is_rvc_i_D_wire;
    logic [31:0] fe_bp_s_branch_offset_i_D_wire;
    logic fe_bp_s_flush_i_D_wire;
    logic fe_bp_s_flush_line_i_D_wire;
    logic [31:0] fe_bp_s_instr_addr_i_D_wire;
    logic fe_bp_s_instr_valid_i_D_wire;
    logic fe_bp_s_is_branch_i_D_wire;
    logic fe_bp_s_is_jump_i_D_wire;
    logic fe_bp_s_link_return_i_D_wire;
    logic fe_bp_s_no_increment_i_D_wire;
    logic [31:0] fe_bp_s_return_add_i_D_wire;
    logic fe_bp_s_return_update_i_D_wire;
    logic fe_bp_s_taken_i_D_wire;
    logic [31:0] bp_s_addr_o_Q_wire;
    logic [1:0] bp_s_taken_o_Q_wire;
    logic [31:0] fe_ifb_s_addr_i_D_wire;
    logic [31:0] fe_ifb_s_bp_addr_i_D_wire;
    logic [1:0] fe_ifb_s_bp_taken_i_D_wire;
    logic [31:0] fe_ifb_s_data_i_D_wire;
    logic [4:0] fe_ifb_s_exc_type_i_D_wire;
    logic fe_ifb_s_exc_valid_i_D_wire;
    logic fe_ifb_s_push_i_D_wire;
    logic [1:0] fe_ifb_s_valid_i_D_wire;
    logic ifb_s_full_o_Q_wire;
    logic fe_ifu_s_ack_i_D_wire;
    logic [31:0] fe_ifu_s_addr_i_D_wire;
    logic [1:0] fe_ifu_s_addr_valid_i_D_wire;
    logic fe_ifu_s_flush_i_D_wire;
    logic fe_ifu_s_ocd_progbuf_mode_i_D_wire;
    logic ifu_s_bus_busy_o_Q_wire;
    logic [31:0] ifu_s_data_addr_o_Q_wire;
    logic [31:0] ifu_s_data_o_Q_wire;
    logic [1:0] ifu_s_data_valid_o_Q_wire;
    logic [4:0] ifu_s_exc_type_o_Q_wire;
    logic ifu_s_exc_valid_o_Q_wire;
    logic ifu_s_ifu_busy_o_Q_wire;
    logic [31:0] fe_npc_s_bp_addr_i_D_wire;
    logic fe_npc_s_bp_valid_i_D_wire;
    logic [31:0] fe_npc_s_branch_addr_i_D_wire;
    logic fe_npc_s_branch_valid_i_D_wire;
    logic [31:0] fe_npc_s_csr_addr_i_D_wire;
    logic fe_npc_s_csr_valid_i_D_wire;
    logic [31:0] fe_npc_s_ocd_addr_i_D_wire;
    logic fe_npc_s_ocd_valid_i_D_wire;
    logic [31:0] fe_npc_s_pc_addr_i_D_wire;
    logic fe_npc_s_stall_i_D_wire;
    logic [31:0] fe_npc_s_trap_addr_i_D_wire;
    logic fe_npc_s_trap_valid_i_D_wire;
    logic [31:0] npc_s_ifu_addr_o_Q_wire;
    logic [1:0] npc_s_ifu_valid_o_Q_wire;
    logic [31:0] npc_s_pc_addr_o_Q_wire;

    // child instances inside CodAL module:
    // CodAL module instance:
    codix_berkelium_ca_core_fetch_stage_bp_t bp (
        .fetch_stage_bp_bht_s_is_branch_i_ICLK(fetch_stage_bp_bht_s_is_branch_i_ICLK),
        .fetch_stage_bp_btb_s_is_branch_i_ICLK(fetch_stage_bp_btb_s_is_branch_i_ICLK),
        .fetch_stage_bp_btb_s_is_jump_i_ICLK(fetch_stage_bp_btb_s_is_jump_i_ICLK),
        .r_wfi_ce_ICLK(r_wfi_ce_ICLK),
        .RST(RST),
        .s_branch_bht_update_i_D(fe_bp_s_branch_bht_update_i_D_wire),
        .s_branch_btb_update_i_D(fe_bp_s_branch_btb_update_i_D_wire),
        .s_branch_instr_addr_i_D(fe_bp_s_branch_instr_addr_i_D_wire),
        .s_branch_is_rvc_i_D(fe_bp_s_branch_is_rvc_i_D_wire),
        .s_branch_offset_i_D(fe_bp_s_branch_offset_i_D_wire),
        .s_flush_i_D(fe_bp_s_flush_i_D_wire),
        .s_flush_line_i_D(fe_bp_s_flush_line_i_D_wire),
        .s_instr_addr_i_D(fe_bp_s_instr_addr_i_D_wire),
        .s_instr_valid_i_D(fe_bp_s_instr_valid_i_D_wire),
        .s_is_branch_i_D(fe_bp_s_is_branch_i_D_wire),
        .s_is_jump_i_D(fe_bp_s_is_jump_i_D_wire),
        .s_link_return_i_D(fe_bp_s_link_return_i_D_wire),
        .s_no_increment_i_D(fe_bp_s_no_increment_i_D_wire),
        .s_return_add_i_D(fe_bp_s_return_add_i_D_wire),
        .s_return_update_i_D(fe_bp_s_return_update_i_D_wire),
        .s_taken_i_D(fe_bp_s_taken_i_D_wire),
        .bht_s_is_branch_i_Q(bp_bht_s_is_branch_i_Q),
        .btb_s_is_branch_i_Q(bp_btb_s_is_branch_i_Q),
        .btb_s_is_jump_i_Q(bp_btb_s_is_jump_i_Q),
        .s_addr_o_Q(bp_s_addr_o_Q_wire),
        .s_taken_o_Q(bp_s_taken_o_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_fetch_stage_ifb_t ifb (
        .r_wfi_ce_ICLK(r_wfi_ce_ICLK),
        .RST(RST),
        .s_addr_i_D(fe_ifb_s_addr_i_D_wire),
        .s_bp_addr_i_D(fe_ifb_s_bp_addr_i_D_wire),
        .s_bp_taken_i_D(fe_ifb_s_bp_taken_i_D_wire),
        .s_data_i_D(fe_ifb_s_data_i_D_wire),
        .s_exc_type_i_D(fe_ifb_s_exc_type_i_D_wire),
        .s_exc_valid_i_D(fe_ifb_s_exc_valid_i_D_wire),
        .s_flush_i_D(ifb_s_flush_i_D),
        .s_pop_i_D(ifb_s_pop_i_D),
        .s_push_i_D(fe_ifb_s_push_i_D_wire),
        .s_valid_i_D(fe_ifb_s_valid_i_D_wire),
        .s_addr_o_Q(ifb_s_addr_o_Q),
        .s_bp_addr_o_Q(ifb_s_bp_addr_o_Q),
        .s_bp_taken_o_Q(ifb_s_bp_taken_o_Q),
        .s_data_o_Q(ifb_s_data_o_Q),
        .s_empty_o_Q(ifb_s_empty_o_Q),
        .s_exc_type_o_Q(ifb_s_exc_type_o_Q),
        .s_exc_valid_o_Q(ifb_s_exc_valid_o_Q),
        .s_full_o_Q(ifb_s_full_o_Q_wire),
        .s_valid_o_Q(ifb_s_valid_o_Q)
    );
    assign ifb_s_full_o_Q = ifb_s_full_o_Q_wire;

    // CodAL module instance:
    codix_berkelium_ca_core_fetch_stage_ifu_t #(
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
    ) ifu (
        .r_wfi_ce_ICLK(r_wfi_ce_ICLK),
        .RST(RST),
        .execute_stage_lsu_pmp_r_pmp0_napot_mask_Q(execute_stage_lsu_pmp_r_pmp0_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp10_napot_mask_Q(execute_stage_lsu_pmp_r_pmp10_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp11_napot_mask_Q(execute_stage_lsu_pmp_r_pmp11_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp12_napot_mask_Q(execute_stage_lsu_pmp_r_pmp12_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp13_napot_mask_Q(execute_stage_lsu_pmp_r_pmp13_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp14_napot_mask_Q(execute_stage_lsu_pmp_r_pmp14_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp15_napot_mask_Q(execute_stage_lsu_pmp_r_pmp15_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp1_napot_mask_Q(execute_stage_lsu_pmp_r_pmp1_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp2_napot_mask_Q(execute_stage_lsu_pmp_r_pmp2_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp3_napot_mask_Q(execute_stage_lsu_pmp_r_pmp3_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp4_napot_mask_Q(execute_stage_lsu_pmp_r_pmp4_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp5_napot_mask_Q(execute_stage_lsu_pmp_r_pmp5_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp6_napot_mask_Q(execute_stage_lsu_pmp_r_pmp6_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp7_napot_mask_Q(execute_stage_lsu_pmp_r_pmp7_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp8_napot_mask_Q(execute_stage_lsu_pmp_r_pmp8_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp9_napot_mask_Q(execute_stage_lsu_pmp_r_pmp9_napot_mask_Q),
        .i1_if_cpu_fetch_HRDATA(i1_if_cpu_fetch_HRDATA),
        .i1_if_cpu_fetch_HREADY(i1_if_cpu_fetch_HREADY),
        .i1_if_cpu_fetch_HRESP(i1_if_cpu_fetch_HRESP),
        .pl_ifu_FIN_CLEAR_Q(pl_ifu_FIN_CLEAR_Q),
        .pl_ifu_FIN_STALL_Q(pl_ifu_FIN_STALL_Q),
        .r_csr_pmpaddr0_Q(r_csr_pmpaddr0_Q),
        .r_csr_pmpaddr10_Q(r_csr_pmpaddr10_Q),
        .r_csr_pmpaddr11_Q(r_csr_pmpaddr11_Q),
        .r_csr_pmpaddr12_Q(r_csr_pmpaddr12_Q),
        .r_csr_pmpaddr13_Q(r_csr_pmpaddr13_Q),
        .r_csr_pmpaddr14_Q(r_csr_pmpaddr14_Q),
        .r_csr_pmpaddr15_Q(r_csr_pmpaddr15_Q),
        .r_csr_pmpaddr1_Q(r_csr_pmpaddr1_Q),
        .r_csr_pmpaddr2_Q(r_csr_pmpaddr2_Q),
        .r_csr_pmpaddr3_Q(r_csr_pmpaddr3_Q),
        .r_csr_pmpaddr4_Q(r_csr_pmpaddr4_Q),
        .r_csr_pmpaddr5_Q(r_csr_pmpaddr5_Q),
        .r_csr_pmpaddr6_Q(r_csr_pmpaddr6_Q),
        .r_csr_pmpaddr7_Q(r_csr_pmpaddr7_Q),
        .r_csr_pmpaddr8_Q(r_csr_pmpaddr8_Q),
        .r_csr_pmpaddr9_Q(r_csr_pmpaddr9_Q),
        .r_csr_pmpcfg0_Q(r_csr_pmpcfg0_Q),
        .r_csr_pmpcfg1_Q(r_csr_pmpcfg1_Q),
        .r_csr_pmpcfg2_Q(r_csr_pmpcfg2_Q),
        .r_csr_pmpcfg3_Q(r_csr_pmpcfg3_Q),
        .r_prv_Q(r_prv_Q),
        .s_ack_i_D(fe_ifu_s_ack_i_D_wire),
        .s_addr_i_D(fe_ifu_s_addr_i_D_wire),
        .s_addr_valid_i_D(fe_ifu_s_addr_valid_i_D_wire),
        .s_flush_i_D(fe_ifu_s_flush_i_D_wire),
        .s_ocd_progbuf_mode_i_D(fe_ifu_s_ocd_progbuf_mode_i_D_wire),
        .i1_if_cpu_fetch_HADDR(i1_if_cpu_fetch_HADDR),
        .i1_if_cpu_fetch_HBURST(i1_if_cpu_fetch_HBURST),
        .i1_if_cpu_fetch_HMASTLOCK(i1_if_cpu_fetch_HMASTLOCK),
        .i1_if_cpu_fetch_HPROT(i1_if_cpu_fetch_HPROT),
        .i1_if_cpu_fetch_HSIZE(i1_if_cpu_fetch_HSIZE),
        .i1_if_cpu_fetch_HTRANS(i1_if_cpu_fetch_HTRANS),
        .i1_if_cpu_fetch_HWRITE(i1_if_cpu_fetch_HWRITE),
        .pl_ifu_FIN_CLEAR_D(pl_ifu_FIN_CLEAR_D),
        .pl_ifu_FIN_STALL_D(pl_ifu_FIN_STALL_D),
        .s_bus_busy_o_Q(ifu_s_bus_busy_o_Q_wire),
        .s_data_addr_o_Q(ifu_s_data_addr_o_Q_wire),
        .s_data_o_Q(ifu_s_data_o_Q_wire),
        .s_data_valid_o_Q(ifu_s_data_valid_o_Q_wire),
        .s_exc_type_o_Q(ifu_s_exc_type_o_Q_wire),
        .s_exc_valid_o_Q(ifu_s_exc_valid_o_Q_wire),
        .s_ifu_busy_o_Q(ifu_s_ifu_busy_o_Q_wire)
    );
    assign ifu_s_bus_busy_o_Q = ifu_s_bus_busy_o_Q_wire;
    assign ifu_s_ifu_busy_o_Q = ifu_s_ifu_busy_o_Q_wire;

    // CodAL module instance:
    codix_berkelium_ca_core_fetch_stage_npc_t npc (
        .s_bp_addr_i_D(fe_npc_s_bp_addr_i_D_wire),
        .s_bp_valid_i_D(fe_npc_s_bp_valid_i_D_wire),
        .s_branch_addr_i_D(fe_npc_s_branch_addr_i_D_wire),
        .s_branch_valid_i_D(fe_npc_s_branch_valid_i_D_wire),
        .s_csr_addr_i_D(fe_npc_s_csr_addr_i_D_wire),
        .s_csr_valid_i_D(fe_npc_s_csr_valid_i_D_wire),
        .s_ocd_addr_i_D(fe_npc_s_ocd_addr_i_D_wire),
        .s_ocd_valid_i_D(fe_npc_s_ocd_valid_i_D_wire),
        .s_pc_addr_i_D(fe_npc_s_pc_addr_i_D_wire),
        .s_stall_i_D(fe_npc_s_stall_i_D_wire),
        .s_trap_addr_i_D(fe_npc_s_trap_addr_i_D_wire),
        .s_trap_valid_i_D(fe_npc_s_trap_valid_i_D_wire),
        .s_ifu_addr_o_Q(npc_s_ifu_addr_o_Q_wire),
        .s_ifu_valid_o_Q(npc_s_ifu_valid_o_Q_wire),
        .s_pc_addr_o_Q(npc_s_pc_addr_o_Q_wire)
    );

    // functional unit instance:
    codix_berkelium_ca_core_fetch_stage_fe_t fe (
        .bp_s_addr_o_Q(bp_s_addr_o_Q_wire),
        .bp_s_taken_o_Q(bp_s_taken_o_Q_wire),
        .execute_stage_bru_s_branch_bht_update_o_Q(execute_stage_bru_s_branch_bht_update_o_Q),
        .execute_stage_bru_s_is_jump_o_Q(execute_stage_bru_s_is_jump_o_Q),
        .execute_stage_bru_s_rd_data_o_Q(execute_stage_bru_s_rd_data_o_Q),
        .execute_stage_crf_s_csr_addr_o_Q(execute_stage_crf_s_csr_addr_o_Q),
        .execute_stage_crf_s_csr_valid_o_Q(execute_stage_crf_s_csr_valid_o_Q),
        .execute_stage_crf_s_trap_addr_o_Q(execute_stage_crf_s_trap_addr_o_Q),
        .execute_stage_crf_s_trap_valid_o_Q(execute_stage_crf_s_trap_valid_o_Q),
        .execute_stage_ocd_s_ocd_addr_o_Q(execute_stage_ocd_s_ocd_addr_o_Q),
        .execute_stage_ocd_s_ocd_busy_o_Q(execute_stage_ocd_s_ocd_busy_o_Q),
        .execute_stage_ocd_s_ocd_progbuf_mode_o_Q(execute_stage_ocd_s_ocd_progbuf_mode_o_Q),
        .execute_stage_ocd_s_ocd_valid_o_Q(execute_stage_ocd_s_ocd_valid_o_Q),
        .ifb_s_full_o_Q(ifb_s_full_o_Q_wire),
        .ifu_s_bus_busy_o_Q(ifu_s_bus_busy_o_Q_wire),
        .ifu_s_data_addr_o_Q(ifu_s_data_addr_o_Q_wire),
        .ifu_s_data_o_Q(ifu_s_data_o_Q_wire),
        .ifu_s_data_valid_o_Q(ifu_s_data_valid_o_Q_wire),
        .ifu_s_exc_type_o_Q(ifu_s_exc_type_o_Q_wire),
        .ifu_s_exc_valid_o_Q(ifu_s_exc_valid_o_Q_wire),
        .ifu_s_ifu_busy_o_Q(ifu_s_ifu_busy_o_Q_wire),
        .npc_s_ifu_addr_o_Q(npc_s_ifu_addr_o_Q_wire),
        .npc_s_ifu_valid_o_Q(npc_s_ifu_valid_o_Q_wire),
        .npc_s_pc_addr_o_Q(npc_s_pc_addr_o_Q_wire),
        .p_boot_addr_Q(p_boot_addr_Q),
        .r_cpu_stall_Q(r_cpu_stall_Q),
        .r_ex_bp_noincr_Q(r_ex_bp_noincr_Q),
        .r_fe_bp_addr_Q(r_fe_bp_addr_Q),
        .r_fe_bp_taken_Q(r_fe_bp_taken_Q),
        .r_PC_Q(r_PC_Q),
        .r_reset_init_Q(r_reset_init_Q),
        .r_wfi_ce_Q(r_wfi_ce_Q),
        .s_ex_bp_flush_line_Q(s_ex_bp_flush_line_Q),
        .s_ex_bp_flush_Q(s_ex_bp_flush_Q),
        .s_ex_branch_bht_update_Q(s_ex_branch_bht_update_Q),
        .s_ex_branch_btb_update_Q(s_ex_branch_btb_update_Q),
        .s_ex_branch_instr_addr_Q(s_ex_branch_instr_addr_Q),
        .s_ex_branch_is_rvc_Q(s_ex_branch_is_rvc_Q),
        .s_ex_branch_miss_Q(s_ex_branch_miss_Q),
        .s_ex_branch_offset_Q(s_ex_branch_offset_Q),
        .s_ex_branch_taken_Q(s_ex_branch_taken_Q),
        .s_ex_branch_target_addr_Q(s_ex_branch_target_addr_Q),
        .s_ex_fence_valid_Q(s_ex_fence_valid_Q),
        .s_ex_return_link_Q(s_ex_return_link_Q),
        .s_ex_return_update_Q(s_ex_return_update_Q),
        .s_fe_flush_Q(s_fe_flush_Q),
        .s_flush_Q(s_flush_Q),
        .s_wfi_prevent_fetch_Q(s_wfi_prevent_fetch_Q),
        .bp_s_branch_bht_update_i_D(fe_bp_s_branch_bht_update_i_D_wire),
        .bp_s_branch_btb_update_i_D(fe_bp_s_branch_btb_update_i_D_wire),
        .bp_s_branch_instr_addr_i_D(fe_bp_s_branch_instr_addr_i_D_wire),
        .bp_s_branch_is_rvc_i_D(fe_bp_s_branch_is_rvc_i_D_wire),
        .bp_s_branch_offset_i_D(fe_bp_s_branch_offset_i_D_wire),
        .bp_s_flush_i_D(fe_bp_s_flush_i_D_wire),
        .bp_s_flush_line_i_D(fe_bp_s_flush_line_i_D_wire),
        .bp_s_instr_addr_i_D(fe_bp_s_instr_addr_i_D_wire),
        .bp_s_instr_valid_i_D(fe_bp_s_instr_valid_i_D_wire),
        .bp_s_is_branch_i_D(fe_bp_s_is_branch_i_D_wire),
        .bp_s_is_jump_i_D(fe_bp_s_is_jump_i_D_wire),
        .bp_s_link_return_i_D(fe_bp_s_link_return_i_D_wire),
        .bp_s_no_increment_i_D(fe_bp_s_no_increment_i_D_wire),
        .bp_s_return_add_i_D(fe_bp_s_return_add_i_D_wire),
        .bp_s_return_update_i_D(fe_bp_s_return_update_i_D_wire),
        .bp_s_taken_i_D(fe_bp_s_taken_i_D_wire),
        .ifb_s_addr_i_D(fe_ifb_s_addr_i_D_wire),
        .ifb_s_bp_addr_i_D(fe_ifb_s_bp_addr_i_D_wire),
        .ifb_s_bp_taken_i_D(fe_ifb_s_bp_taken_i_D_wire),
        .ifb_s_data_i_D(fe_ifb_s_data_i_D_wire),
        .ifb_s_exc_type_i_D(fe_ifb_s_exc_type_i_D_wire),
        .ifb_s_exc_valid_i_D(fe_ifb_s_exc_valid_i_D_wire),
        .ifb_s_push_i_D(fe_ifb_s_push_i_D_wire),
        .ifb_s_valid_i_D(fe_ifb_s_valid_i_D_wire),
        .ifu_s_ack_i_D(fe_ifu_s_ack_i_D_wire),
        .ifu_s_addr_i_D(fe_ifu_s_addr_i_D_wire),
        .ifu_s_addr_valid_i_D(fe_ifu_s_addr_valid_i_D_wire),
        .ifu_s_flush_i_D(fe_ifu_s_flush_i_D_wire),
        .ifu_s_ocd_progbuf_mode_i_D(fe_ifu_s_ocd_progbuf_mode_i_D_wire),
        .npc_s_bp_addr_i_D(fe_npc_s_bp_addr_i_D_wire),
        .npc_s_bp_valid_i_D(fe_npc_s_bp_valid_i_D_wire),
        .npc_s_branch_addr_i_D(fe_npc_s_branch_addr_i_D_wire),
        .npc_s_branch_valid_i_D(fe_npc_s_branch_valid_i_D_wire),
        .npc_s_csr_addr_i_D(fe_npc_s_csr_addr_i_D_wire),
        .npc_s_csr_valid_i_D(fe_npc_s_csr_valid_i_D_wire),
        .npc_s_ocd_addr_i_D(fe_npc_s_ocd_addr_i_D_wire),
        .npc_s_ocd_valid_i_D(fe_npc_s_ocd_valid_i_D_wire),
        .npc_s_pc_addr_i_D(fe_npc_s_pc_addr_i_D_wire),
        .npc_s_stall_i_D(fe_npc_s_stall_i_D_wire),
        .npc_s_trap_addr_i_D(fe_npc_s_trap_addr_i_D_wire),
        .npc_s_trap_valid_i_D(fe_npc_s_trap_valid_i_D_wire),
        .r_fe_bp_addr_D(r_fe_bp_addr_D),
        .r_fe_bp_addr_WE(r_fe_bp_addr_WE),
        .r_fe_bp_taken_D(r_fe_bp_taken_D),
        .r_fe_bp_taken_WE(r_fe_bp_taken_WE),
        .r_PC_D(r_PC_D),
        .r_PC_WE(r_PC_WE),
        .s_fe_flush_D(s_fe_flush_D),
        .s_perf_ifu_stall_D(s_perf_ifu_stall_D)
    );

endmodule: codix_berkelium_ca_core_fetch_stage_t
