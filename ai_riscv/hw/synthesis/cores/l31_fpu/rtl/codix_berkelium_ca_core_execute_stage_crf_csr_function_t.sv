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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_crf_csr_function_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_crf_csr_function_t(
    input  logic [3:0] r_csr_dcsr_Q,
    input  logic [31:0] r_csr_mepc_Q,
    input  logic [31:0] r_csr_mstatus_Q,
    input  logic [27:0] r_csr_tcontrol_Q,
    input  logic [1:0] r_prv_Q,
    input  logic [1:0] s_csr_addr_i_Q,
    input  logic s_fce_illegal_Q,
    input  logic s_fce_insufficient_permissions_Q,
    input  logic s_ocd_progbuf_mode_i_Q,
    input  logic [7:0] s_op_i_Q,
    output logic s_fce_ebreak_D,
    output logic s_fce_ebreak_debug_entry_D,
    output logic s_fce_ecall_D,
    output logic [4:0] s_fce_exc_type_D,
    output logic s_fce_exc_valid_D,
    output logic s_fce_illegal_D,
    output logic s_fce_insufficient_permissions_D,
    output logic [31:0] s_fce_mstatus_D,
    output logic [1:0] s_fce_prv_D,
    output logic [31:0] s_fce_tcontrol_D,
    output logic s_fce_wfi_valid_D,
    output logic [31:0] s_fce_xret_addr_D,
    output logic s_fce_xret_valid_D,
    output logic s_is_mret_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic codasip_tmp_var_0;
    // signal/wire
    logic [7:0] codasip_tmp_var_1;
    // signal/wire
    logic [4:0] s_fce_exc_type_D_ACT_wire;
    // signal/wire
    logic s_fce_exc_valid_D_ACT_wire;

    // data-path code:
    assign codasip_tmp_var_0 = (!s_fce_insufficient_permissions_Q);
    assign codasip_tmp_var_1 = codasip_tmp_var_0 ? s_op_i_Q : 8'h00;
    assign s_fce_exc_valid_D_ACT_wire = ((codasip_tmp_var_1 == 8'h37) || (codasip_tmp_var_1 == 8'h38)) ? 1'b1 : 1'b0;
    assign s_fce_exc_type_D_ACT_wire = (codasip_tmp_var_1 == 8'h37) ? 5'h03 :
        (codasip_tmp_var_1 == 8'h38) ? 5'(unsigned'(4'({2'h2, r_prv_Q}))) : 5'h00;
    assign s_fce_ebreak_D = (codasip_tmp_var_1 == 8'h37) ? 1'b1 : 1'b0;
    assign s_fce_ebreak_debug_entry_D = (codasip_tmp_var_1 == 8'h37) ? (((r_prv_Q == 2'h3) & r_csr_dcsr_Q[3]) | ((r_prv_Q == 2'h0) & r_csr_dcsr_Q[0])) : 1'b0;
    assign s_fce_ecall_D = (codasip_tmp_var_1 == 8'h38) ? 1'b1 : 1'b0;
    assign s_fce_exc_type_D = s_fce_exc_type_D_ACT_wire;
    assign s_fce_exc_valid_D = s_fce_exc_valid_D_ACT_wire;
    assign s_fce_illegal_D = (codasip_tmp_var_1 == 8'h3e) ? ((r_prv_Q == 2'h0) && (r_csr_mstatus_Q[21] & (~s_ocd_progbuf_mode_i_Q))) : 1'b0;
    assign s_fce_insufficient_permissions_D = ((!s_ocd_progbuf_mode_i_Q) && ((s_op_i_Q != 8'h3e) && (r_prv_Q < s_csr_addr_i_Q)));
    assign s_fce_mstatus_D = (codasip_tmp_var_1 == 8'h3a) ? {r_csr_mstatus_Q[31:13], 2'h0, r_csr_mstatus_Q[10:8], 1'b1, r_csr_mstatus_Q[6:4], r_csr_mstatus_Q[7], r_csr_mstatus_Q[2:0]} : 32'h00000000;
    assign s_fce_prv_D = (codasip_tmp_var_1 == 8'h3a) ? r_csr_mstatus_Q[12:11] : 2'h0;
    assign s_fce_tcontrol_D = (codasip_tmp_var_1 == 8'h3a) ? {r_csr_tcontrol_Q, r_csr_tcontrol_Q[3], 3'h0} : 32'h00000000;
    assign s_fce_wfi_valid_D = (codasip_tmp_var_1 == 8'h3e) ? (~s_fce_illegal_Q) : 1'b0;
    assign s_fce_xret_addr_D = (codasip_tmp_var_1 == 8'h3a) ? r_csr_mepc_Q : 32'h00000000;
    assign s_fce_xret_valid_D = (codasip_tmp_var_1 == 8'h3a) ? 1'b1 : 1'b0;
    assign s_is_mret_D = (codasip_tmp_var_1 == 8'h3a) ? 1'b1 : 1'b0;
endmodule: codix_berkelium_ca_core_execute_stage_crf_csr_function_t
