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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_crf_t' CodAL module.
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

module codix_berkelium_ca_core_execute_stage_crf_t #(
    parameter [31:0] nmi_handler_p = 32'h20000004,
    parameter [31:0] itcm_size_p = 32'h00004000,
    parameter [31:0] itcm_baddr_p = 32'h02000000,
    parameter [31:0] dtcm_size_p = 32'h00004000,
    parameter [31:0] dtcm_baddr_p = 32'h03000000,
    parameter [31:0] cache_base_p = 32'h00010000,
    parameter [31:0] hart_id_p = 32'h00000000
) (
    input  logic r_wfi_ce_ICLK,
    input  logic RST,
    input  logic p_dtcm_en_Q,
    input  logic p_itcm_en_Q,
    input  logic [63:0] perf_r_mhpmcounter10_Q,
    input  logic [63:0] perf_r_mhpmcounter12_Q,
    input  logic [63:0] perf_r_mhpmcounter13_Q,
    input  logic [63:0] perf_r_mhpmcounter14_Q,
    input  logic [63:0] perf_r_mhpmcounter15_Q,
    input  logic [63:0] perf_r_mhpmcounter3_Q,
    input  logic [63:0] perf_r_mhpmcounter4_Q,
    input  logic [63:0] perf_r_mhpmcounter5_Q,
    input  logic [63:0] perf_r_mhpmcounter6_Q,
    input  logic [63:0] perf_r_mhpmcounter9_Q,
    input  logic [31:0] r_csr_dcsr_Q,
    input  logic [31:0] r_csr_dpc_Q,
    input  logic [31:0] r_csr_fcsr_Q,
    input  logic [31:0] r_csr_mcause_Q,
    input  logic [31:0] r_csr_mcounteren_Q,
    input  logic [31:0] r_csr_mcountinhibit_Q,
    input  logic [63:0] r_csr_mcycle_Q,
    input  logic r_csr_mdtcmen_Q,
    input  logic [31:0] r_csr_mepc_Q,
    input  logic [31:0] r_csr_mexcause_Q,
    input  logic [31:0] r_csr_mie_Q,
    input  logic [63:0] r_csr_minstret_Q,
    input  logic [31:0] r_csr_mip_Q,
    input  logic r_csr_mitcmen_Q,
    input  logic [31:0] r_csr_mpicflag1_Q,
    input  logic [31:0] r_csr_mpicflag2_Q,
    input  logic [31:0] r_csr_mpicflag3_Q,
    input  logic [31:0] r_csr_mpicflag_Q,
    input  logic [31:0] r_csr_mpicmask1_Q,
    input  logic [31:0] r_csr_mpicmask2_Q,
    input  logic [31:0] r_csr_mpicmask3_Q,
    input  logic [31:0] r_csr_mpicmask_Q,
    input  logic [31:0] r_csr_mscratch_Q,
    input  logic [31:0] r_csr_mstatus_Q,
    input  logic [31:0] r_csr_mtval_Q,
    input  logic [31:0] r_csr_mtvec_Q,
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
    input  logic [31:0] r_csr_tcontrol_Q,
    input  logic [31:0] r_csr_tdata1_r_Q,
    input  logic [31:0] r_csr_tdata2_r_Q,
    input  logic [31:0] r_csr_tselect_Q,
    input  logic [1:0] r_prv_Q,
    input  logic r_reset_init_Q,
    input  logic r_wfi_ce_Q,
    input  logic [11:0] s_csr_addr_i_D,
    input  logic s_csr_re_i_D,
    input  logic s_csr_valid_i_D,
    input  logic [31:0] s_csr_wdata_i_D,
    input  logic s_csr_we_i_D,
    input  logic [127:0] s_eip_i_D,
    input  logic [1:0] s_exc_extra_i_D,
    input  logic [31:0] s_exc_tval_i_D,
    input  logic [4:0] s_exc_type_i_D,
    input  logic s_exc_valid_i_D,
    input  logic [4:0] s_fflags_i_D,
    input  logic s_fs_context_change_i_D,
    input  logic [3:0] s_fu1_i_D,
    input  logic s_instr_1_valid_i_D,
    input  logic [31:0] s_instr_addr_i_D,
    input  logic s_instr_valid_excint_i_D,
    input  logic s_instr_valid_i_D,
    input  logic [31:0] s_int_addr_i_D,
    input  logic s_int_safe_to_take_i_D,
    input  logic s_nmi_i_D,
    input  logic [31:0] s_nmi_mtval_i_D,
    input  logic s_nmi_source_i_D,
    input  logic s_ocd_busy_i_D,
    input  logic [31:0] s_ocd_dcsr_i_D,
    input  logic s_ocd_debug_mode_req_i_D,
    input  logic [31:0] s_ocd_dpc_i_D,
    input  logic s_ocd_flush_i_D,
    input  logic s_ocd_progbuf_mode_i_D,
    input  logic s_ocd_user_mode_req_i_D,
    input  logic [7:0] s_op_i_D,
    input  logic s_sip_i_D,
    input  logic s_tip_i_D,
    input  logic s_wfi_delay_i_D,
    input  logic s_write_fflags_i_D,
    output logic [11:0] lsu_pmp_s_csr_waddr_i_D,
    output logic [31:0] lsu_pmp_s_csr_wdata_i_D,
    output logic lsu_pmp_s_csr_we_i_D,
    output logic [31:0] r_csr_dcsr_D,
    output logic r_csr_dcsr_WE,
    output logic [31:0] r_csr_dpc_D,
    output logic r_csr_dpc_WE,
    output logic [31:0] r_csr_fcsr_D,
    output logic r_csr_fcsr_WE,
    output logic [31:0] r_csr_mcause_D,
    output logic r_csr_mcause_WE,
    output logic [31:0] r_csr_mcounteren_D,
    output logic r_csr_mcounteren_WE,
    output logic [31:0] r_csr_mcountinhibit_D,
    output logic r_csr_mcountinhibit_WE,
    output logic [63:0] r_csr_mcycle_D,
    output logic r_csr_mcycle_WE,
    output logic r_csr_mdtcmen_D,
    output logic r_csr_mdtcmen_WE,
    output logic [31:0] r_csr_mepc_D,
    output logic r_csr_mepc_WE,
    output logic [31:0] r_csr_mexcause_D,
    output logic r_csr_mexcause_WE,
    output logic [31:0] r_csr_mie_D,
    output logic r_csr_mie_WE,
    output logic [63:0] r_csr_minstret_D,
    output logic r_csr_minstret_WE,
    output logic [31:0] r_csr_mip_D,
    output logic r_csr_mip_WE,
    output logic r_csr_mitcmen_D,
    output logic r_csr_mitcmen_WE,
    output logic [31:0] r_csr_mpicflag1_D,
    output logic r_csr_mpicflag1_WE,
    output logic [31:0] r_csr_mpicflag2_D,
    output logic r_csr_mpicflag2_WE,
    output logic [31:0] r_csr_mpicflag3_D,
    output logic r_csr_mpicflag3_WE,
    output logic [31:0] r_csr_mpicflag_D,
    output logic r_csr_mpicflag_WE,
    output logic [31:0] r_csr_mpicmask1_D,
    output logic r_csr_mpicmask1_WE,
    output logic [31:0] r_csr_mpicmask2_D,
    output logic r_csr_mpicmask2_WE,
    output logic [31:0] r_csr_mpicmask3_D,
    output logic r_csr_mpicmask3_WE,
    output logic [31:0] r_csr_mpicmask_D,
    output logic r_csr_mpicmask_WE,
    output logic [31:0] r_csr_mscratch_D,
    output logic r_csr_mscratch_WE,
    output logic [31:0] r_csr_mstatus_D,
    output logic r_csr_mstatus_WE,
    output logic [31:0] r_csr_mtval_D,
    output logic r_csr_mtval_WE,
    output logic [31:0] r_csr_mtvec_D,
    output logic r_csr_mtvec_WE,
    output logic [31:0] r_csr_tcontrol_D,
    output logic r_csr_tcontrol_WE,
    output logic [2:0] r_csr_tdata1_r_RA,
    output logic r_csr_tdata1_r_RE,
    output logic [31:0] r_csr_tdata1_w_D,
    output logic [2:0] r_csr_tdata1_w_WA,
    output logic r_csr_tdata1_w_WE,
    output logic [2:0] r_csr_tdata2_r_RA,
    output logic r_csr_tdata2_r_RE,
    output logic [31:0] r_csr_tdata2_w_D,
    output logic [2:0] r_csr_tdata2_w_WA,
    output logic r_csr_tdata2_w_WE,
    output logic [31:0] r_csr_tselect_D,
    output logic r_csr_tselect_WE,
    output logic r_fce_wfi_valid_Q,
    output logic [1:0] r_prv_D,
    output logic r_prv_WE,
    output logic [31:0] s_csr_addr_o_Q,
    output logic s_csr_flush_o_Q,
    output logic s_csr_valid_o_Q,
    output logic s_exc_flush_o_Q,
    output logic [4:0] s_exc_type_o_Q,
    output logic s_exc_valid_o_Q,
    output logic s_flush_o_Q,
    output logic [12:0] s_hpm_inhibit_o_Q,
    output logic s_instr_1_valid_i_Q,
    output logic s_int_flush_o_Q,
    output logic s_int_stall_o_Q,
    output logic [31:0] s_intexc_trap_addr_Q,
    output logic s_intexc_trap_valid_Q,
    output logic s_perf_inhibit_o_Q,
    output logic [11:0] s_perf_waddr_o_Q,
    output logic [31:0] s_perf_wdata_o_Q,
    output logic [1:0] s_perf_we_o_Q,
    output logic [31:0] s_rdata_o_Q,
    output logic s_take_nmi_o_Q,
    output logic [31:0] s_trap_addr_o_Q,
    output logic s_trap_valid_o_Q,
    output logic s_wfi_o_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic [7:0] s_op_i;
    // CodAL signal/wire
    logic [31:0] s_instr_addr_i;
    // CodAL signal/wire
    logic s_instr_valid_i;
    // CodAL signal/wire
    logic s_instr_1_valid_i;
    // CodAL signal/wire
    logic s_instr_valid_excint_i;
    // CodAL signal/wire
    logic [31:0] s_int_addr_i;
    // CodAL signal/wire
    logic s_int_safe_to_take_i;
    // CodAL signal/wire
    logic [3:0] s_fu1_i;
    // CodAL signal/wire
    logic s_wfi_delay_i;
    // CodAL signal/wire
    logic s_fs_context_change_i;
    // CodAL signal/wire
    logic s_write_fflags_i;
    // CodAL signal/wire
    logic [4:0] s_fflags_i;
    // CodAL signal/wire
    logic [11:0] s_csr_addr_i;
    // CodAL signal/wire
    logic [31:0] s_csr_wdata_i;
    // CodAL signal/wire
    logic s_csr_re_i;
    // CodAL signal/wire
    logic s_csr_we_i;
    // CodAL signal/wire
    logic s_csr_valid_i;
    // CodAL signal/wire
    logic s_tip_i;
    // CodAL signal/wire
    logic s_sip_i;
    // CodAL signal/wire
    logic [127:0] s_eip_i;
    // CodAL signal/wire
    logic s_nmi_i;
    // CodAL signal/wire
    logic [31:0] s_nmi_mtval_i;
    // CodAL signal/wire
    logic [31:0] s_ocd_dcsr_i;
    // CodAL signal/wire
    logic [31:0] s_ocd_dpc_i;
    // CodAL signal/wire
    logic s_ocd_debug_mode_req_i;
    // CodAL signal/wire
    logic s_ocd_user_mode_req_i;
    // CodAL signal/wire
    logic s_ocd_progbuf_mode_i;
    // CodAL signal/wire
    logic s_ocd_flush_i;
    // CodAL signal/wire
    logic s_ocd_busy_i;
    // CodAL signal/wire
    logic s_exc_valid_i;
    // CodAL signal/wire
    logic [4:0] s_exc_type_i;
    // CodAL signal/wire
    logic [1:0] s_exc_extra_i;
    // CodAL signal/wire
    logic [31:0] s_exc_tval_i;
    // CodAL signal/wire
    logic [31:0] s_rdata_o;
    // CodAL signal/wire
    logic s_flush_o;
    // CodAL signal/wire
    logic [31:0] s_csr_addr_o;
    // CodAL signal/wire
    logic s_csr_valid_o;
    // CodAL signal/wire
    logic [31:0] s_trap_addr_o;
    // CodAL signal/wire
    logic s_trap_valid_o;
    // CodAL signal/wire
    logic s_csr_flush_o;
    // CodAL signal/wire
    logic s_exc_flush_o;
    // CodAL signal/wire
    logic s_int_flush_o;
    // CodAL signal/wire
    logic [1:0] s_perf_we_o;
    // CodAL signal/wire
    logic [31:0] s_perf_wdata_o;
    // CodAL signal/wire
    logic [11:0] s_perf_waddr_o;
    // CodAL signal/wire
    logic s_int_stall_o;
    // CodAL signal/wire
    logic s_exc_valid_o;
    // CodAL signal/wire
    logic [4:0] s_exc_type_o;
    // CodAL signal/wire
    logic s_wfi_o;
    // CodAL signal/wire
    logic s_perf_inhibit_o;
    // CodAL signal/wire
    logic [12:0] s_hpm_inhibit_o;
    // CodAL signal/wire
    logic s_pmp_we_o;
    // CodAL signal/wire
    logic [11:0] s_pmp_waddr_o;
    // CodAL signal/wire
    logic [31:0] s_pmp_wdata_o;
    // CodAL signal/wire
    logic [31:0] s_read_csr_rdata;
    // CodAL signal/wire
    logic s_read_illegal;
    // CodAL signal/wire
    logic [31:0] s_fce_xret_addr;
    // CodAL signal/wire
    logic s_fce_xret_valid;
    // CodAL signal/wire
    logic [31:0] s_fce_mstatus;
    // CodAL signal/wire
    logic [31:0] s_fce_tcontrol;
    // CodAL signal/wire
    logic s_is_mret;
    // CodAL signal/wire
    logic [1:0] s_fce_prv;
    // CodAL signal/wire
    logic s_fce_exc_valid;
    // CodAL signal/wire
    logic [4:0] s_fce_exc_type;
    // CodAL signal/wire
    logic s_fce_ebreak;
    // CodAL signal/wire
    logic s_fce_ecall;
    // CodAL signal/wire
    logic s_fce_ebreak_debug_entry;
    // CodAL signal/wire
    logic s_fce_wfi_valid;
    // CodAL signal/wire
    logic s_wfi_delay;
    // CodAL signal/wire
    logic s_fce_illegal;
    // CodAL signal/wire
    logic s_fce_insufficient_permissions;
    // CodAL signal/wire
    logic s_int_valid;
    // CodAL signal/wire
    logic [4:0] s_int_type;
    // CodAL signal/wire
    logic s_exc_valid;
    // CodAL signal/wire
    logic [4:0] s_exc_type;
    // CodAL signal/wire
    logic s_intexc_trap_valid;
    // CodAL signal/wire
    logic [31:0] s_intexc_trap_addr;
    // CodAL signal/wire
    logic [31:0] s_intexc_mstatus;
    // CodAL signal/wire
    logic [31:0] s_intexc_cause;
    // CodAL signal/wire
    logic [31:0] s_intexc_tval;
    // CodAL signal/wire
    logic [31:0] s_intexc_epc;
    // CodAL signal/wire
    logic [31:0] s_intexc_tcontrol;
    // CodAL signal/wire
    logic s_intexc_valid;
    // CodAL signal/wire
    logic s_int_valid_pending;
    // CodAL signal/wire
    logic s_write_csr_en;
    // CodAL signal/wire
    logic [31:0] s_write_csr_data;
    // CodAL signal/wire
    logic [1:0] s_write_perf_we;
    // CodAL signal/wire
    logic s_write_cycle_we;
    // CodAL signal/wire
    logic s_write_instret_we;
    // CodAL signal/wire
    logic s_write_cycleh_we;
    // CodAL signal/wire
    logic s_write_instreth_we;
    // CodAL signal/wire
    logic [31:0] s_wire_perf_wdata;
    // CodAL signal/wire
    logic s_write_csr_flush;
    // CodAL signal/wire
    logic s_inhibit_cycle;
    // CodAL signal/wire
    logic s_inhibit_instret;
    // CodAL signal/wire
    logic s_inhibit_counters;
    // CodAL signal/wire
    logic s_write_mpicflag_we;
    // CodAL signal/wire
    logic s_write_mpicmask_we;
    // CodAL signal/wire
    logic s_write_mpicflag1_we;
    // CodAL signal/wire
    logic s_write_mpicmask1_we;
    // CodAL signal/wire
    logic s_write_mpicflag2_we;
    // CodAL signal/wire
    logic s_write_mpicmask2_we;
    // CodAL signal/wire
    logic s_write_mpicflag3_we;
    // CodAL signal/wire
    logic s_write_mpicmask3_we;
    // CodAL signal/wire
    logic s_take_nmi_o;
    // CodAL signal/wire
    logic s_nmi_source_i;

    // additional declarations:
    logic int_exc_r_fce_wfi_valid_WE_wire;
    logic int_exc_r_fce_wfi_valid_D_wire;
    logic r_fce_wfi_valid_Q_wire;
    logic [2:0] csr_read_r_csr_tdata1_r_RA_wire;
    logic csr_read_r_csr_tdata1_r_RE_wire;
    logic [2:0] csr_write_r_csr_tdata1_r_RA_wire;
    logic csr_write_r_csr_tdata1_r_RE_wire;

    // child instances inside CodAL module:
    // instance of 's_op_i' CodAL signal/wire: (single driver)
    assign s_op_i = s_op_i_D;
    // instance of 's_instr_addr_i' CodAL signal/wire: (single driver)
    assign s_instr_addr_i = s_instr_addr_i_D;
    // instance of 's_instr_valid_i' CodAL signal/wire: (single driver)
    assign s_instr_valid_i = s_instr_valid_i_D;
    // instance of 's_instr_1_valid_i' CodAL signal/wire: (single driver)
    assign s_instr_1_valid_i = s_instr_1_valid_i_D;
    // instance of 's_instr_1_valid_i' CodAL signal/wire: (parent port driver(s))
    assign s_instr_1_valid_i_Q = s_instr_1_valid_i;
    // instance of 's_instr_valid_excint_i' CodAL signal/wire: (single driver)
    assign s_instr_valid_excint_i = s_instr_valid_excint_i_D;
    // instance of 's_int_addr_i' CodAL signal/wire: (single driver)
    assign s_int_addr_i = s_int_addr_i_D;
    // instance of 's_int_safe_to_take_i' CodAL signal/wire: (single driver)
    assign s_int_safe_to_take_i = s_int_safe_to_take_i_D;
    // instance of 's_fu1_i' CodAL signal/wire: (single driver)
    assign s_fu1_i = s_fu1_i_D;
    // instance of 's_wfi_delay_i' CodAL signal/wire: (single driver)
    assign s_wfi_delay_i = s_wfi_delay_i_D;
    // instance of 's_fs_context_change_i' CodAL signal/wire: (single driver)
    assign s_fs_context_change_i = s_fs_context_change_i_D;
    // instance of 's_write_fflags_i' CodAL signal/wire: (single driver)
    assign s_write_fflags_i = s_write_fflags_i_D;
    // instance of 's_fflags_i' CodAL signal/wire: (single driver)
    assign s_fflags_i = s_fflags_i_D;
    // instance of 's_csr_addr_i' CodAL signal/wire: (single driver)
    assign s_csr_addr_i = s_csr_addr_i_D;
    // instance of 's_csr_wdata_i' CodAL signal/wire: (single driver)
    assign s_csr_wdata_i = s_csr_wdata_i_D;
    // instance of 's_csr_re_i' CodAL signal/wire: (single driver)
    assign s_csr_re_i = s_csr_re_i_D;
    // instance of 's_csr_we_i' CodAL signal/wire: (single driver)
    assign s_csr_we_i = s_csr_we_i_D;
    // instance of 's_csr_valid_i' CodAL signal/wire: (single driver)
    assign s_csr_valid_i = s_csr_valid_i_D;
    // instance of 's_tip_i' CodAL signal/wire: (single driver)
    assign s_tip_i = s_tip_i_D;
    // instance of 's_sip_i' CodAL signal/wire: (single driver)
    assign s_sip_i = s_sip_i_D;
    // instance of 's_eip_i' CodAL signal/wire: (single driver)
    assign s_eip_i = s_eip_i_D;
    // instance of 's_nmi_i' CodAL signal/wire: (single driver)
    assign s_nmi_i = s_nmi_i_D;
    // instance of 's_nmi_mtval_i' CodAL signal/wire: (single driver)
    assign s_nmi_mtval_i = s_nmi_mtval_i_D;
    // instance of 's_ocd_dcsr_i' CodAL signal/wire: (single driver)
    assign s_ocd_dcsr_i = s_ocd_dcsr_i_D;
    // instance of 's_ocd_dpc_i' CodAL signal/wire: (single driver)
    assign s_ocd_dpc_i = s_ocd_dpc_i_D;
    // instance of 's_ocd_debug_mode_req_i' CodAL signal/wire: (single driver)
    assign s_ocd_debug_mode_req_i = s_ocd_debug_mode_req_i_D;
    // instance of 's_ocd_user_mode_req_i' CodAL signal/wire: (single driver)
    assign s_ocd_user_mode_req_i = s_ocd_user_mode_req_i_D;
    // instance of 's_ocd_progbuf_mode_i' CodAL signal/wire: (single driver)
    assign s_ocd_progbuf_mode_i = s_ocd_progbuf_mode_i_D;
    // instance of 's_ocd_flush_i' CodAL signal/wire: (single driver)
    assign s_ocd_flush_i = s_ocd_flush_i_D;
    // instance of 's_ocd_busy_i' CodAL signal/wire: (single driver)
    assign s_ocd_busy_i = s_ocd_busy_i_D;
    // instance of 's_exc_valid_i' CodAL signal/wire: (single driver)
    assign s_exc_valid_i = s_exc_valid_i_D;
    // instance of 's_exc_type_i' CodAL signal/wire: (single driver)
    assign s_exc_type_i = s_exc_type_i_D;
    // instance of 's_exc_extra_i' CodAL signal/wire: (single driver)
    assign s_exc_extra_i = s_exc_extra_i_D;
    // instance of 's_exc_tval_i' CodAL signal/wire: (single driver)
    assign s_exc_tval_i = s_exc_tval_i_D;
    // instance of 's_rdata_o' CodAL signal/wire: (parent port driver(s))
    assign s_rdata_o_Q = s_rdata_o;
    // instance of 's_flush_o' CodAL signal/wire: (parent port driver(s))
    assign s_flush_o_Q = s_flush_o;
    // instance of 's_csr_addr_o' CodAL signal/wire: (parent port driver(s))
    assign s_csr_addr_o_Q = s_csr_addr_o;
    // instance of 's_csr_valid_o' CodAL signal/wire: (parent port driver(s))
    assign s_csr_valid_o_Q = s_csr_valid_o;
    // instance of 's_trap_addr_o' CodAL signal/wire: (parent port driver(s))
    assign s_trap_addr_o_Q = s_trap_addr_o;
    // instance of 's_trap_valid_o' CodAL signal/wire: (parent port driver(s))
    assign s_trap_valid_o_Q = s_trap_valid_o;
    // instance of 's_csr_flush_o' CodAL signal/wire: (parent port driver(s))
    assign s_csr_flush_o_Q = s_csr_flush_o;
    // instance of 's_exc_flush_o' CodAL signal/wire: (parent port driver(s))
    assign s_exc_flush_o_Q = s_exc_flush_o;
    // instance of 's_int_flush_o' CodAL signal/wire: (parent port driver(s))
    assign s_int_flush_o_Q = s_int_flush_o;
    // instance of 's_perf_we_o' CodAL signal/wire: (parent port driver(s))
    assign s_perf_we_o_Q = s_perf_we_o;
    // instance of 's_perf_wdata_o' CodAL signal/wire: (parent port driver(s))
    assign s_perf_wdata_o_Q = s_perf_wdata_o;
    // instance of 's_perf_waddr_o' CodAL signal/wire: (parent port driver(s))
    assign s_perf_waddr_o_Q = s_perf_waddr_o;
    // instance of 's_int_stall_o' CodAL signal/wire: (parent port driver(s))
    assign s_int_stall_o_Q = s_int_stall_o;
    // instance of 's_exc_valid_o' CodAL signal/wire: (parent port driver(s))
    assign s_exc_valid_o_Q = s_exc_valid_o;
    // instance of 's_exc_type_o' CodAL signal/wire: (parent port driver(s))
    assign s_exc_type_o_Q = s_exc_type_o;
    // instance of 's_wfi_o' CodAL signal/wire: (parent port driver(s))
    assign s_wfi_o_Q = s_wfi_o;
    // instance of 's_perf_inhibit_o' CodAL signal/wire: (parent port driver(s))
    assign s_perf_inhibit_o_Q = s_perf_inhibit_o;
    // instance of 's_hpm_inhibit_o' CodAL signal/wire: (parent port driver(s))
    assign s_hpm_inhibit_o_Q = s_hpm_inhibit_o;
    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_fce_wfi_valid (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(int_exc_r_fce_wfi_valid_WE_wire),
        .D(int_exc_r_fce_wfi_valid_D_wire),
        .Q(r_fce_wfi_valid_Q_wire)
    );
    assign r_fce_wfi_valid_Q = r_fce_wfi_valid_Q_wire;

    // instance of 's_intexc_trap_valid' CodAL signal/wire: (parent port driver(s))
    assign s_intexc_trap_valid_Q = s_intexc_trap_valid;
    // instance of 's_intexc_trap_addr' CodAL signal/wire: (parent port driver(s))
    assign s_intexc_trap_addr_Q = s_intexc_trap_addr;
    // instance of 's_take_nmi_o' CodAL signal/wire: (parent port driver(s))
    assign s_take_nmi_o_Q = s_take_nmi_o;
    // instance of 's_nmi_source_i' CodAL signal/wire: (single driver)
    assign s_nmi_source_i = s_nmi_source_i_D;
    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_crf_csr_function_t csr_function (
        .r_csr_dcsr_Q(r_csr_dcsr_Q[15:12]),
        .r_csr_mepc_Q(r_csr_mepc_Q),
        .r_csr_mstatus_Q(r_csr_mstatus_Q),
        .r_csr_tcontrol_Q(r_csr_tcontrol_Q[31:4]),
        .r_prv_Q(r_prv_Q),
        .s_csr_addr_i_Q(s_csr_addr_i[9:8]),
        .s_fce_illegal_Q(s_fce_illegal),
        .s_fce_insufficient_permissions_Q(s_fce_insufficient_permissions),
        .s_ocd_progbuf_mode_i_Q(s_ocd_progbuf_mode_i),
        .s_op_i_Q(s_op_i),
        .s_fce_ebreak_D(s_fce_ebreak),
        .s_fce_ebreak_debug_entry_D(s_fce_ebreak_debug_entry),
        .s_fce_ecall_D(s_fce_ecall),
        .s_fce_exc_type_D(s_fce_exc_type),
        .s_fce_exc_valid_D(s_fce_exc_valid),
        .s_fce_illegal_D(s_fce_illegal),
        .s_fce_insufficient_permissions_D(s_fce_insufficient_permissions),
        .s_fce_mstatus_D(s_fce_mstatus),
        .s_fce_prv_D(s_fce_prv),
        .s_fce_tcontrol_D(s_fce_tcontrol),
        .s_fce_wfi_valid_D(s_fce_wfi_valid),
        .s_fce_xret_addr_D(s_fce_xret_addr),
        .s_fce_xret_valid_D(s_fce_xret_valid),
        .s_is_mret_D(s_is_mret)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_crf_write_instret_t write_instret (
        .r_csr_minstret_Q(r_csr_minstret_Q),
        .r_fce_wfi_valid_Q(r_fce_wfi_valid_Q_wire),
        .s_exc_valid_Q(s_exc_valid),
        .s_fu1_i_Q(s_fu1_i),
        .s_inhibit_counters_Q(s_inhibit_counters),
        .s_inhibit_instret_Q(s_inhibit_instret),
        .s_instr_1_valid_i_Q(s_instr_1_valid_i),
        .s_instr_valid_i_Q(s_instr_valid_i),
        .s_int_valid_pending_Q(s_int_valid_pending),
        .s_int_valid_Q(s_int_valid),
        .s_wfi_delay_Q(s_wfi_delay),
        .s_write_csr_data_Q(s_write_csr_data),
        .s_write_instret_we_Q(s_write_instret_we),
        .s_write_instreth_we_Q(s_write_instreth_we),
        .r_csr_minstret_D(r_csr_minstret_D),
        .r_csr_minstret_WE(r_csr_minstret_WE)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_crf_crf_out_t crf_out (
        .r_csr_mcountinhibit_Q(r_csr_mcountinhibit_Q[15:3]),
        .r_fce_wfi_valid_Q(r_fce_wfi_valid_Q_wire),
        .r_wfi_ce_Q(r_wfi_ce_Q),
        .s_csr_addr_i_Q(s_csr_addr_i),
        .s_exc_valid_Q(s_exc_valid),
        .s_fce_ebreak_debug_entry_Q(s_fce_ebreak_debug_entry),
        .s_fce_wfi_valid_Q(s_fce_wfi_valid),
        .s_fce_xret_addr_Q(s_fce_xret_addr),
        .s_fce_xret_valid_Q(s_fce_xret_valid),
        .s_inhibit_counters_Q(s_inhibit_counters),
        .s_instr_addr_i_Q(s_instr_addr_i),
        .s_int_valid_pending_Q(s_int_valid_pending),
        .s_int_valid_Q(s_int_valid),
        .s_intexc_trap_addr_Q(s_intexc_trap_addr),
        .s_intexc_trap_valid_Q(s_intexc_trap_valid),
        .s_ocd_flush_i_Q(s_ocd_flush_i),
        .s_read_csr_rdata_Q(s_read_csr_rdata),
        .s_wire_perf_wdata_Q(s_wire_perf_wdata),
        .s_write_csr_flush_Q(s_write_csr_flush),
        .s_write_perf_we_Q(s_write_perf_we),
        .s_csr_addr_o_D(s_csr_addr_o),
        .s_csr_flush_o_D(s_csr_flush_o),
        .s_csr_valid_o_D(s_csr_valid_o),
        .s_exc_flush_o_D(s_exc_flush_o),
        .s_flush_o_D(s_flush_o),
        .s_hpm_inhibit_o_D(s_hpm_inhibit_o),
        .s_int_flush_o_D(s_int_flush_o),
        .s_int_stall_o_D(s_int_stall_o),
        .s_perf_inhibit_o_D(s_perf_inhibit_o),
        .s_perf_waddr_o_D(s_perf_waddr_o),
        .s_perf_wdata_o_D(s_perf_wdata_o),
        .s_perf_we_o_D(s_perf_we_o),
        .s_rdata_o_D(s_rdata_o),
        .s_trap_addr_o_D(s_trap_addr_o),
        .s_trap_valid_o_D(s_trap_valid_o),
        .s_wfi_o_D(s_wfi_o)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_crf_int_exc_t #(
        .nmi_handler_p(nmi_handler_p)
    ) int_exc (
        .r_csr_dcsr_Q(r_csr_dcsr_Q[11:2]),
        .r_csr_mie_Q(r_csr_mie_Q),
        .r_csr_mip_Q(r_csr_mip_Q),
        .r_csr_mstatus_Q(r_csr_mstatus_Q),
        .r_csr_mtvec_Q(r_csr_mtvec_Q),
        .r_csr_tcontrol_Q(r_csr_tcontrol_Q[3]),
        .r_fce_wfi_valid_Q(r_fce_wfi_valid_Q_wire),
        .r_prv_Q(r_prv_Q),
        .r_wfi_ce_Q(r_wfi_ce_Q),
        .s_csr_addr_i_Q(s_csr_addr_i),
        .s_csr_valid_i_Q(s_csr_valid_i),
        .s_csr_we_i_Q(s_csr_we_i),
        .s_exc_tval_i_Q(s_exc_tval_i),
        .s_exc_type_i_Q(s_exc_type_i),
        .s_exc_type_Q(s_exc_type),
        .s_exc_valid_i_Q(s_exc_valid_i),
        .s_exc_valid_Q(s_exc_valid),
        .s_fce_ebreak_Q(s_fce_ebreak),
        .s_fce_ecall_Q(s_fce_ecall),
        .s_fce_exc_type_Q(s_fce_exc_type),
        .s_fce_exc_valid_Q(s_fce_exc_valid),
        .s_fce_illegal_Q(s_fce_illegal),
        .s_fce_insufficient_permissions_Q(s_fce_insufficient_permissions),
        .s_fce_wfi_valid_Q(s_fce_wfi_valid),
        .s_instr_addr_i_Q(s_instr_addr_i),
        .s_instr_valid_excint_i_Q(s_instr_valid_excint_i),
        .s_int_addr_i_Q(s_int_addr_i),
        .s_int_safe_to_take_i_Q(s_int_safe_to_take_i),
        .s_int_type_Q(s_int_type),
        .s_int_valid_Q(s_int_valid),
        .s_intexc_valid_Q(s_intexc_valid),
        .s_nmi_i_Q(s_nmi_i),
        .s_nmi_mtval_i_Q(s_nmi_mtval_i),
        .s_nmi_source_i_Q(s_nmi_source_i),
        .s_ocd_busy_i_Q(s_ocd_busy_i),
        .s_ocd_progbuf_mode_i_Q(s_ocd_progbuf_mode_i),
        .s_op_i_Q(s_op_i),
        .s_read_illegal_Q(s_read_illegal),
        .s_wfi_delay_i_Q(s_wfi_delay_i),
        .r_fce_wfi_valid_D(int_exc_r_fce_wfi_valid_D_wire),
        .r_fce_wfi_valid_WE(int_exc_r_fce_wfi_valid_WE_wire),
        .s_exc_type_D(s_exc_type),
        .s_exc_type_o_D(s_exc_type_o),
        .s_exc_valid_D(s_exc_valid),
        .s_exc_valid_o_D(s_exc_valid_o),
        .s_int_type_D(s_int_type),
        .s_int_valid_D(s_int_valid),
        .s_int_valid_pending_D(s_int_valid_pending),
        .s_intexc_cause_D(s_intexc_cause),
        .s_intexc_epc_D(s_intexc_epc),
        .s_intexc_mstatus_D(s_intexc_mstatus),
        .s_intexc_tcontrol_D(s_intexc_tcontrol),
        .s_intexc_trap_addr_D(s_intexc_trap_addr),
        .s_intexc_trap_valid_D(s_intexc_trap_valid),
        .s_intexc_tval_D(s_intexc_tval),
        .s_intexc_valid_D(s_intexc_valid),
        .s_take_nmi_o_D(s_take_nmi_o),
        .s_wfi_delay_D(s_wfi_delay)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_crf_csr_read_t #(
        .itcm_size_p(itcm_size_p),
        .itcm_baddr_p(itcm_baddr_p),
        .dtcm_size_p(dtcm_size_p),
        .dtcm_baddr_p(dtcm_baddr_p),
        .cache_base_p(cache_base_p),
        .hart_id_p(hart_id_p)
    ) csr_read (
        .perf_r_mhpmcounter10_Q(perf_r_mhpmcounter10_Q),
        .perf_r_mhpmcounter12_Q(perf_r_mhpmcounter12_Q),
        .perf_r_mhpmcounter13_Q(perf_r_mhpmcounter13_Q),
        .perf_r_mhpmcounter14_Q(perf_r_mhpmcounter14_Q),
        .perf_r_mhpmcounter15_Q(perf_r_mhpmcounter15_Q),
        .perf_r_mhpmcounter3_Q(perf_r_mhpmcounter3_Q),
        .perf_r_mhpmcounter4_Q(perf_r_mhpmcounter4_Q),
        .perf_r_mhpmcounter5_Q(perf_r_mhpmcounter5_Q),
        .perf_r_mhpmcounter6_Q(perf_r_mhpmcounter6_Q),
        .perf_r_mhpmcounter9_Q(perf_r_mhpmcounter9_Q),
        .r_csr_dcsr_Q(r_csr_dcsr_Q),
        .r_csr_dpc_Q(r_csr_dpc_Q),
        .r_csr_fcsr_Q(r_csr_fcsr_Q),
        .r_csr_mcause_Q(r_csr_mcause_Q),
        .r_csr_mcounteren_Q(r_csr_mcounteren_Q),
        .r_csr_mcountinhibit_Q(r_csr_mcountinhibit_Q),
        .r_csr_mcycle_Q(r_csr_mcycle_Q),
        .r_csr_mdtcmen_Q(r_csr_mdtcmen_Q),
        .r_csr_mepc_Q(r_csr_mepc_Q[31:1]),
        .r_csr_mexcause_Q(r_csr_mexcause_Q),
        .r_csr_mie_Q(r_csr_mie_Q),
        .r_csr_minstret_Q(r_csr_minstret_Q),
        .r_csr_mip_Q(r_csr_mip_Q),
        .r_csr_mitcmen_Q(r_csr_mitcmen_Q),
        .r_csr_mpicflag1_Q(r_csr_mpicflag1_Q),
        .r_csr_mpicflag2_Q(r_csr_mpicflag2_Q),
        .r_csr_mpicflag3_Q(r_csr_mpicflag3_Q),
        .r_csr_mpicflag_Q(r_csr_mpicflag_Q),
        .r_csr_mpicmask1_Q(r_csr_mpicmask1_Q),
        .r_csr_mpicmask2_Q(r_csr_mpicmask2_Q),
        .r_csr_mpicmask3_Q(r_csr_mpicmask3_Q),
        .r_csr_mpicmask_Q(r_csr_mpicmask_Q),
        .r_csr_mscratch_Q(r_csr_mscratch_Q),
        .r_csr_mstatus_Q(r_csr_mstatus_Q[31:1]),
        .r_csr_mtval_Q(r_csr_mtval_Q),
        .r_csr_mtvec_Q(r_csr_mtvec_Q),
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
        .r_csr_tcontrol_Q(r_csr_tcontrol_Q),
        .r_csr_tdata1_r_Q(r_csr_tdata1_r_Q),
        .r_csr_tdata2_r_Q(r_csr_tdata2_r_Q),
        .r_csr_tselect_Q(r_csr_tselect_Q),
        .r_prv_Q(r_prv_Q),
        .s_csr_addr_i_Q(s_csr_addr_i),
        .s_csr_re_i_Q(s_csr_re_i),
        .r_csr_tdata1_r_RA(csr_read_r_csr_tdata1_r_RA_wire),
        .r_csr_tdata1_r_RE(csr_read_r_csr_tdata1_r_RE_wire),
        .r_csr_tdata2_r_RA(r_csr_tdata2_r_RA),
        .r_csr_tdata2_r_RE(r_csr_tdata2_r_RE),
        .s_read_csr_rdata_D(s_read_csr_rdata),
        .s_read_illegal_D(s_read_illegal)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_crf_csr_write_t csr_write (
        .p_dtcm_en_Q(p_dtcm_en_Q),
        .p_itcm_en_Q(p_itcm_en_Q),
        .r_csr_dcsr_Q(r_csr_dcsr_Q[10:0]),
        .r_csr_fcsr_Q(r_csr_fcsr_Q),
        .r_csr_mcountinhibit_Q(r_csr_mcountinhibit_Q[2:0]),
        .r_csr_mcycle_Q(r_csr_mcycle_Q),
        .r_csr_mip_Q(r_csr_mip_Q[7:3]),
        .r_csr_mpicflag1_Q(r_csr_mpicflag1_Q),
        .r_csr_mpicflag2_Q(r_csr_mpicflag2_Q),
        .r_csr_mpicflag3_Q(r_csr_mpicflag3_Q),
        .r_csr_mpicflag_Q(r_csr_mpicflag_Q),
        .r_csr_mpicmask1_Q(r_csr_mpicmask1_Q),
        .r_csr_mpicmask2_Q(r_csr_mpicmask2_Q),
        .r_csr_mpicmask3_Q(r_csr_mpicmask3_Q),
        .r_csr_mpicmask_Q(r_csr_mpicmask_Q),
        .r_csr_mstatus_Q(r_csr_mstatus_Q[30:0]),
        .r_csr_tdata1_r_Q(r_csr_tdata1_r_Q[27]),
        .r_csr_tselect_Q(r_csr_tselect_Q[2:0]),
        .r_fce_wfi_valid_Q(r_fce_wfi_valid_Q_wire),
        .r_prv_Q(r_prv_Q),
        .r_reset_init_Q(r_reset_init_Q),
        .r_wfi_ce_Q(r_wfi_ce_Q),
        .s_csr_addr_i_Q(s_csr_addr_i),
        .s_csr_valid_i_Q(s_csr_valid_i),
        .s_csr_wdata_i_Q(s_csr_wdata_i),
        .s_csr_we_i_Q(s_csr_we_i),
        .s_eip_i_Q(s_eip_i),
        .s_exc_extra_i_Q(s_exc_extra_i),
        .s_fce_ebreak_debug_entry_Q(s_fce_ebreak_debug_entry),
        .s_fce_mstatus_Q(s_fce_mstatus),
        .s_fce_prv_Q(s_fce_prv),
        .s_fce_tcontrol_Q(s_fce_tcontrol),
        .s_fce_xret_valid_Q(s_fce_xret_valid),
        .s_fflags_i_Q(s_fflags_i),
        .s_fs_context_change_i_Q(s_fs_context_change_i),
        .s_inhibit_counters_Q(s_inhibit_counters),
        .s_inhibit_cycle_Q(s_inhibit_cycle),
        .s_instr_addr_i_Q(s_instr_addr_i),
        .s_int_valid_Q(s_int_valid),
        .s_intexc_cause_Q(s_intexc_cause),
        .s_intexc_epc_Q(s_intexc_epc),
        .s_intexc_mstatus_Q(s_intexc_mstatus),
        .s_intexc_tcontrol_Q(s_intexc_tcontrol),
        .s_intexc_tval_Q(s_intexc_tval),
        .s_intexc_valid_Q(s_intexc_valid),
        .s_is_mret_Q(s_is_mret),
        .s_ocd_busy_i_Q(s_ocd_busy_i),
        .s_ocd_dcsr_i_Q(s_ocd_dcsr_i),
        .s_ocd_debug_mode_req_i_Q(s_ocd_debug_mode_req_i),
        .s_ocd_dpc_i_Q(s_ocd_dpc_i),
        .s_ocd_progbuf_mode_i_Q(s_ocd_progbuf_mode_i),
        .s_ocd_user_mode_req_i_Q(s_ocd_user_mode_req_i),
        .s_op_i_Q(s_op_i),
        .s_read_csr_rdata_Q(s_read_csr_rdata),
        .s_sip_i_Q(s_sip_i),
        .s_tip_i_Q(s_tip_i),
        .s_write_csr_data_Q(s_write_csr_data),
        .s_write_csr_en_Q(s_write_csr_en),
        .s_write_cycle_we_Q(s_write_cycle_we),
        .s_write_cycleh_we_Q(s_write_cycleh_we),
        .s_write_fflags_i_Q(s_write_fflags_i),
        .s_write_mpicflag1_we_Q(s_write_mpicflag1_we),
        .s_write_mpicflag2_we_Q(s_write_mpicflag2_we),
        .s_write_mpicflag3_we_Q(s_write_mpicflag3_we),
        .s_write_mpicflag_we_Q(s_write_mpicflag_we),
        .s_write_mpicmask1_we_Q(s_write_mpicmask1_we),
        .s_write_mpicmask2_we_Q(s_write_mpicmask2_we),
        .s_write_mpicmask3_we_Q(s_write_mpicmask3_we),
        .s_write_mpicmask_we_Q(s_write_mpicmask_we),
        .r_csr_dcsr_D(r_csr_dcsr_D),
        .r_csr_dcsr_WE(r_csr_dcsr_WE),
        .r_csr_dpc_D(r_csr_dpc_D),
        .r_csr_dpc_WE(r_csr_dpc_WE),
        .r_csr_fcsr_D(r_csr_fcsr_D),
        .r_csr_fcsr_WE(r_csr_fcsr_WE),
        .r_csr_mcause_D(r_csr_mcause_D),
        .r_csr_mcause_WE(r_csr_mcause_WE),
        .r_csr_mcounteren_D(r_csr_mcounteren_D),
        .r_csr_mcounteren_WE(r_csr_mcounteren_WE),
        .r_csr_mcountinhibit_D(r_csr_mcountinhibit_D),
        .r_csr_mcountinhibit_WE(r_csr_mcountinhibit_WE),
        .r_csr_mcycle_D(r_csr_mcycle_D),
        .r_csr_mcycle_WE(r_csr_mcycle_WE),
        .r_csr_mdtcmen_D(r_csr_mdtcmen_D),
        .r_csr_mdtcmen_WE(r_csr_mdtcmen_WE),
        .r_csr_mepc_D(r_csr_mepc_D),
        .r_csr_mepc_WE(r_csr_mepc_WE),
        .r_csr_mexcause_D(r_csr_mexcause_D),
        .r_csr_mexcause_WE(r_csr_mexcause_WE),
        .r_csr_mie_D(r_csr_mie_D),
        .r_csr_mie_WE(r_csr_mie_WE),
        .r_csr_mip_D(r_csr_mip_D),
        .r_csr_mip_WE(r_csr_mip_WE),
        .r_csr_mitcmen_D(r_csr_mitcmen_D),
        .r_csr_mitcmen_WE(r_csr_mitcmen_WE),
        .r_csr_mpicflag1_D(r_csr_mpicflag1_D),
        .r_csr_mpicflag1_WE(r_csr_mpicflag1_WE),
        .r_csr_mpicflag2_D(r_csr_mpicflag2_D),
        .r_csr_mpicflag2_WE(r_csr_mpicflag2_WE),
        .r_csr_mpicflag3_D(r_csr_mpicflag3_D),
        .r_csr_mpicflag3_WE(r_csr_mpicflag3_WE),
        .r_csr_mpicflag_D(r_csr_mpicflag_D),
        .r_csr_mpicflag_WE(r_csr_mpicflag_WE),
        .r_csr_mpicmask1_D(r_csr_mpicmask1_D),
        .r_csr_mpicmask1_WE(r_csr_mpicmask1_WE),
        .r_csr_mpicmask2_D(r_csr_mpicmask2_D),
        .r_csr_mpicmask2_WE(r_csr_mpicmask2_WE),
        .r_csr_mpicmask3_D(r_csr_mpicmask3_D),
        .r_csr_mpicmask3_WE(r_csr_mpicmask3_WE),
        .r_csr_mpicmask_D(r_csr_mpicmask_D),
        .r_csr_mpicmask_WE(r_csr_mpicmask_WE),
        .r_csr_mscratch_D(r_csr_mscratch_D),
        .r_csr_mscratch_WE(r_csr_mscratch_WE),
        .r_csr_mstatus_D(r_csr_mstatus_D),
        .r_csr_mstatus_WE(r_csr_mstatus_WE),
        .r_csr_mtval_D(r_csr_mtval_D),
        .r_csr_mtval_WE(r_csr_mtval_WE),
        .r_csr_mtvec_D(r_csr_mtvec_D),
        .r_csr_mtvec_WE(r_csr_mtvec_WE),
        .r_csr_tcontrol_D(r_csr_tcontrol_D),
        .r_csr_tcontrol_WE(r_csr_tcontrol_WE),
        .r_csr_tdata1_r_RA(csr_write_r_csr_tdata1_r_RA_wire),
        .r_csr_tdata1_r_RE(csr_write_r_csr_tdata1_r_RE_wire),
        .r_csr_tdata1_w_D(r_csr_tdata1_w_D),
        .r_csr_tdata1_w_WA(r_csr_tdata1_w_WA),
        .r_csr_tdata1_w_WE(r_csr_tdata1_w_WE),
        .r_csr_tdata2_w_D(r_csr_tdata2_w_D),
        .r_csr_tdata2_w_WA(r_csr_tdata2_w_WA),
        .r_csr_tdata2_w_WE(r_csr_tdata2_w_WE),
        .r_csr_tselect_D(r_csr_tselect_D),
        .r_csr_tselect_WE(r_csr_tselect_WE),
        .r_prv_D(r_prv_D),
        .r_prv_WE(r_prv_WE),
        .s_inhibit_counters_D(s_inhibit_counters),
        .s_inhibit_cycle_D(s_inhibit_cycle),
        .s_inhibit_instret_D(s_inhibit_instret),
        .s_pmp_waddr_o_D(s_pmp_waddr_o),
        .s_pmp_wdata_o_D(s_pmp_wdata_o),
        .s_pmp_we_o_D(s_pmp_we_o),
        .s_wire_perf_wdata_D(s_wire_perf_wdata),
        .s_write_csr_data_D(s_write_csr_data),
        .s_write_csr_en_D(s_write_csr_en),
        .s_write_csr_flush_D(s_write_csr_flush),
        .s_write_cycle_we_D(s_write_cycle_we),
        .s_write_cycleh_we_D(s_write_cycleh_we),
        .s_write_instret_we_D(s_write_instret_we),
        .s_write_instreth_we_D(s_write_instreth_we),
        .s_write_mpicflag1_we_D(s_write_mpicflag1_we),
        .s_write_mpicflag2_we_D(s_write_mpicflag2_we),
        .s_write_mpicflag3_we_D(s_write_mpicflag3_we),
        .s_write_mpicflag_we_D(s_write_mpicflag_we),
        .s_write_mpicmask1_we_D(s_write_mpicmask1_we),
        .s_write_mpicmask2_we_D(s_write_mpicmask2_we),
        .s_write_mpicmask3_we_D(s_write_mpicmask3_we),
        .s_write_mpicmask_we_D(s_write_mpicmask_we),
        .s_write_perf_we_D(s_write_perf_we)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_crf_phase2_t phase2 (
        .s_pmp_waddr_o_Q(s_pmp_waddr_o),
        .s_pmp_wdata_o_Q(s_pmp_wdata_o),
        .s_pmp_we_o_Q(s_pmp_we_o),
        .lsu_pmp_s_csr_waddr_i_D(lsu_pmp_s_csr_waddr_i_D),
        .lsu_pmp_s_csr_wdata_i_D(lsu_pmp_s_csr_wdata_i_D),
        .lsu_pmp_s_csr_we_i_D(lsu_pmp_s_csr_we_i_D)
    );

    // port mappings for CodAL module:
    assign r_csr_tdata1_r_RA = csr_read_r_csr_tdata1_r_RA_wire |
        csr_write_r_csr_tdata1_r_RA_wire;
    assign r_csr_tdata1_r_RE = csr_read_r_csr_tdata1_r_RE_wire |
        csr_write_r_csr_tdata1_r_RE_wire;
endmodule: codix_berkelium_ca_core_execute_stage_crf_t
