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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_main_t' functional unit.
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

module codix_berkelium_ca_core_main_t(
    input  logic [12:0] execute_stage_crf_s_hpm_inhibit_o_Q,
    input  logic execute_stage_crf_s_perf_inhibit_o_Q,
    input  logic [30:0] p_boot_addr_Q,
    input  logic p_eviction_error_Q,
    input  logic p_cpu_stall_Q,
    input  logic r_cpu_stall_Q,
    input  logic r_csr_mdtcmen_Q,
    input  logic r_csr_mitcmen_Q,
    input  logic r_reset_init_Q,
    input  logic r_wfi_ce_Q,
    input  logic s_ex1_clear_Q,
    input  logic s_ex1_stall_Q,
    input  logic s_ex_clear_Q,
    input  logic s_ex_stall_Q,
    input  logic s_flush_Q,
    input  logic s_id_clear_Q,
    input  logic s_perf_branch_miss_Q,
    input  logic s_perf_csr_flush_Q,
    input  logic s_perf_data_stall_Q,
    input  logic s_perf_div_stall_Q,
    input  logic s_perf_exc_flush_Q,
    input  logic s_perf_fpu_stall_Q,
    input  logic s_perf_ifu_stall_Q,
    input  logic s_perf_int_flush_Q,
    input  logic s_perf_lsu_stall_Q,
    input  logic [11:0] s_perf_waddr_Q,
    input  logic [31:0] s_perf_wdata_Q,
    input  logic [1:0] s_perf_we_Q,
    output logic [31:0] execute_stage_ira_r_return_address_D,
    output logic execute_stage_ira_r_return_address_WE,
    output logic i1_p_dtcm_en,
    output logic i1_p_itcm_en,
    output logic p_wfi_D,
    output logic perf_s_branch_miss_i_D,
    output logic perf_s_csr_flush_i_D,
    output logic perf_s_data_stall_i_D,
    output logic perf_s_div_stall_i_D,
    output logic perf_s_exc_flush_i_D,
    output logic perf_s_flush_i_D,
    output logic perf_s_fpu_stall_i_D,
    output logic [12:0] perf_s_hpm_inhibit_i_D,
    output logic perf_s_ifu_stall_i_D,
    output logic perf_s_inhibit_i_D,
    output logic perf_s_int_flush_i_D,
    output logic perf_s_lsu_stall_i_D,
    output logic [11:0] perf_s_perf_waddr_i_D,
    output logic [31:0] perf_s_perf_wdata_i_D,
    output logic [1:0] perf_s_perf_we_i_D,
    output logic plc_s_ex1_clear_i_D,
    output logic plc_s_ex1_stall_i_D,
    output logic plc_s_ex_clear_i_D,
    output logic plc_s_ex_stall_i_D,
    output logic plc_s_flush_i_D,
    output logic plc_s_id_clear_i_D,
    output logic r_cpu_stall_D,
    output logic r_cpu_stall_WE,
    output logic r_reset_init_D,
    output logic r_reset_init_WE,
    output logic [31:0] r_syscall_addr_D,
    output logic r_syscall_addr_WE,
    output logic s_eviction_error_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic codasip_tmp_var_0;

    // data-path code:
    assign codasip_tmp_var_0 = r_reset_init_Q;
    assign execute_stage_ira_r_return_address_D = codasip_tmp_var_0 ? {p_boot_addr_Q, 1'b0} : 32'h00000000;
    assign execute_stage_ira_r_return_address_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign i1_p_dtcm_en = r_csr_mdtcmen_Q;
    assign i1_p_itcm_en = r_csr_mitcmen_Q;
    assign p_wfi_D = (!r_wfi_ce_Q);
    assign perf_s_branch_miss_i_D = s_perf_branch_miss_Q;
    assign perf_s_csr_flush_i_D = s_perf_csr_flush_Q;
    assign perf_s_data_stall_i_D = s_perf_data_stall_Q;
    assign perf_s_div_stall_i_D = s_perf_div_stall_Q;
    assign perf_s_exc_flush_i_D = s_perf_exc_flush_Q;
    assign perf_s_flush_i_D = s_flush_Q;
    assign perf_s_fpu_stall_i_D = s_perf_fpu_stall_Q;
    assign perf_s_hpm_inhibit_i_D = execute_stage_crf_s_hpm_inhibit_o_Q;
    assign perf_s_ifu_stall_i_D = s_perf_ifu_stall_Q;
    assign perf_s_inhibit_i_D = execute_stage_crf_s_perf_inhibit_o_Q;
    assign perf_s_int_flush_i_D = s_perf_int_flush_Q;
    assign perf_s_lsu_stall_i_D = s_perf_lsu_stall_Q;
    assign perf_s_perf_waddr_i_D = s_perf_waddr_Q;
    assign perf_s_perf_wdata_i_D = s_perf_wdata_Q;
    assign perf_s_perf_we_i_D = s_perf_we_Q;
    assign plc_s_ex1_clear_i_D = s_ex1_clear_Q;
    assign plc_s_ex1_stall_i_D = s_ex1_stall_Q;
    assign plc_s_ex_clear_i_D = s_ex_clear_Q;
    assign plc_s_ex_stall_i_D = s_ex_stall_Q;
    assign plc_s_flush_i_D = s_flush_Q;
    assign plc_s_id_clear_i_D = s_id_clear_Q;
    assign r_cpu_stall_D = (p_cpu_stall_Q & r_cpu_stall_Q);
    assign r_cpu_stall_WE = 1'b1;
    assign r_reset_init_D = 1'b0;
    assign r_reset_init_WE = 1'b1;
    assign r_syscall_addr_D = ({p_boot_addr_Q, 1'b0} + 32'h00000010);
    assign r_syscall_addr_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign s_eviction_error_D = p_eviction_error_Q;
endmodule: codix_berkelium_ca_core_main_t
