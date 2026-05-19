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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_crf_write_instret_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_crf_write_instret_t(
    input  logic [63:0] r_csr_minstret_Q,
    input  logic r_fce_wfi_valid_Q,
    input  logic s_exc_valid_Q,
    input  logic [3:0] s_fu1_i_Q,
    input  logic s_inhibit_counters_Q,
    input  logic s_inhibit_instret_Q,
    input  logic s_instr_1_valid_i_Q,
    input  logic s_instr_valid_i_Q,
    input  logic s_int_valid_pending_Q,
    input  logic s_int_valid_Q,
    input  logic s_wfi_delay_Q,
    input  logic [31:0] s_write_csr_data_Q,
    input  logic s_write_instret_we_Q,
    input  logic s_write_instreth_we_Q,
    output logic [63:0] r_csr_minstret_D,
    output logic r_csr_minstret_WE
);
    // type, wire and constant declarations:
    // signal/wire
    logic codasip_tmp_var_0;
    // signal/wire
    logic codasip_tmp_var_1;
    // signal/wire
    logic codasip_tmp_var_2;
    // signal/wire
    logic codasip_tmp_var_3;
    // signal/wire
    logic i0_incr_B0;
    // signal/wire
    logic i1_incr_B0;

    // data-path code:
    assign i0_incr_B0 = (((((s_instr_valid_i_Q & (~r_fce_wfi_valid_Q)) & (~s_wfi_delay_Q)) & ((~s_exc_valid_Q) & (~s_int_valid_Q))) & (~s_inhibit_counters_Q)) & (~s_inhibit_instret_Q));
    assign i1_incr_B0 = (((s_instr_1_valid_i_Q & (~s_inhibit_counters_Q)) & ((s_int_valid_pending_Q & (s_fu1_i_Q == 4'h2)) | (~s_int_valid_pending_Q))) & (~s_inhibit_instret_Q));
    assign codasip_tmp_var_0 = s_write_instret_we_Q;
    assign codasip_tmp_var_1 = (!codasip_tmp_var_0) ? s_write_instreth_we_Q : 1'b0;
    assign codasip_tmp_var_2 = ((!codasip_tmp_var_1) && (!codasip_tmp_var_0)) ? (i0_incr_B0 & i1_incr_B0) : 1'b0;
    assign codasip_tmp_var_3 = (((!codasip_tmp_var_2) && (!codasip_tmp_var_1)) && (!codasip_tmp_var_0)) ? (i0_incr_B0 | i1_incr_B0) : 1'b0;
    assign r_csr_minstret_D = codasip_tmp_var_0 ? {r_csr_minstret_Q[63:32], s_write_csr_data_Q} :
        codasip_tmp_var_1 ? {s_write_csr_data_Q, r_csr_minstret_Q[31:0]} :
        codasip_tmp_var_2 ? (r_csr_minstret_Q + 64'h0000000000000002) :
        codasip_tmp_var_3 ? (r_csr_minstret_Q + 64'h0000000000000001) : 64'h0000000000000000;
    assign r_csr_minstret_WE = (((codasip_tmp_var_0 || codasip_tmp_var_1) || codasip_tmp_var_2) || codasip_tmp_var_3) ? 1'b1 : 1'b0;
endmodule: codix_berkelium_ca_core_execute_stage_crf_write_instret_t
