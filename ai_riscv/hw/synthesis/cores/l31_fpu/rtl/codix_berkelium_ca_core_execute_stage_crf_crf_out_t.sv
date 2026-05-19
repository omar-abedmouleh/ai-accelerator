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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_crf_crf_out_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_crf_crf_out_t(
    input  logic [12:0] r_csr_mcountinhibit_Q,
    input  logic r_fce_wfi_valid_Q,
    input  logic r_wfi_ce_Q,
    input  logic [11:0] s_csr_addr_i_Q,
    input  logic s_exc_valid_Q,
    input  logic s_fce_ebreak_debug_entry_Q,
    input  logic s_fce_wfi_valid_Q,
    input  logic [31:0] s_fce_xret_addr_Q,
    input  logic s_fce_xret_valid_Q,
    input  logic s_inhibit_counters_Q,
    input  logic [31:0] s_instr_addr_i_Q,
    input  logic s_int_valid_pending_Q,
    input  logic s_int_valid_Q,
    input  logic [31:0] s_intexc_trap_addr_Q,
    input  logic s_intexc_trap_valid_Q,
    input  logic s_ocd_flush_i_Q,
    input  logic [31:0] s_read_csr_rdata_Q,
    input  logic [31:0] s_wire_perf_wdata_Q,
    input  logic s_write_csr_flush_Q,
    input  logic [1:0] s_write_perf_we_Q,
    output logic [31:0] s_csr_addr_o_D,
    output logic s_csr_flush_o_D,
    output logic s_csr_valid_o_D,
    output logic s_exc_flush_o_D,
    output logic s_flush_o_D,
    output logic [12:0] s_hpm_inhibit_o_D,
    output logic s_int_flush_o_D,
    output logic s_int_stall_o_D,
    output logic s_perf_inhibit_o_D,
    output logic [11:0] s_perf_waddr_o_D,
    output logic [31:0] s_perf_wdata_o_D,
    output logic [1:0] s_perf_we_o_D,
    output logic [31:0] s_rdata_o_D,
    output logic [31:0] s_trap_addr_o_D,
    output logic s_trap_valid_o_D,
    output logic s_wfi_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic csr_valid_B0;

    // data-path code:
    assign csr_valid_B0 = ((s_write_csr_flush_Q | s_fce_xret_valid_Q) | (r_fce_wfi_valid_Q & r_wfi_ce_Q));
    assign s_csr_addr_o_D = ((s_fce_xret_valid_Q) ? s_fce_xret_addr_Q : (s_instr_addr_i_Q + 32'h00000004));
    assign s_csr_flush_o_D = csr_valid_B0;
    assign s_csr_valid_o_D = csr_valid_B0;
    assign s_exc_flush_o_D = s_exc_valid_Q;
    assign s_flush_o_D = (((s_ocd_flush_i_Q | csr_valid_B0) | s_exc_valid_Q) | s_int_valid_Q);
    assign s_hpm_inhibit_o_D = r_csr_mcountinhibit_Q;
    assign s_int_flush_o_D = s_int_valid_Q;
    assign s_int_stall_o_D = s_int_valid_pending_Q;
    assign s_perf_inhibit_o_D = (s_fce_ebreak_debug_entry_Q | s_inhibit_counters_Q);
    assign s_perf_waddr_o_D = s_csr_addr_i_Q;
    assign s_perf_wdata_o_D = s_wire_perf_wdata_Q;
    assign s_perf_we_o_D = s_write_perf_we_Q;
    assign s_rdata_o_D = s_read_csr_rdata_Q;
    assign s_trap_addr_o_D = s_intexc_trap_addr_Q;
    assign s_trap_valid_o_D = s_intexc_trap_valid_Q;
    assign s_wfi_o_D = (s_fce_wfi_valid_Q & (~r_fce_wfi_valid_Q));
endmodule: codix_berkelium_ca_core_execute_stage_crf_crf_out_t
