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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_lsu_compute_addr_check_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_lsu_compute_addr_check_t #(
    parameter [31:0] cache_base_p = 32'h00010000
) (
    input  logic pma_ldst_s_cacheable_o_Q,
    input  logic pma_ldst_s_fault_o_Q,
    input  logic pma_ldst_s_idempotent_o_Q,
    input  logic pma_ldst_s_misaligned_o_Q,
    input  logic pmp_ldst_s_fault_o_Q,
    input  logic [6:0] r_csr_mstatus_Q,
    input  logic [31:0] r_data_addr_Q,
    input  logic r_is_load_Q,
    input  logic r_is_store_Q,
    input  logic [1:0] r_prv_Q,
    input  logic [3:0] r_state_Q,
    input  logic [31:0] s_addr_i_Q,
    input  logic [4:0] s_exc_type_Q,
    input  logic s_exc_valid_Q,
    input  logic s_fence_issued_Q,
    input  logic s_is_fence_i_Q,
    input  logic s_is_fence_Q,
    input  logic s_is_load_Q,
    input  logic s_is_store_Q,
    input  logic s_multicycle_Q,
    input  logic s_ocd_mmode_i_Q,
    input  logic [7:0] s_op_i_Q,
    output logic [31:0] pma_ldst_s_addr_i_D,
    output logic [1:0] pma_ldst_s_size_i_D,
    output logic [31:0] pmp_ldst_s_addr_i_D,
    output logic [1:0] pmp_ldst_s_prv_i_D,
    output logic pmp_ldst_s_valid_i_D,
    output logic pmp_ldst_s_write_i_D,
    output logic s_exc_pma_D,
    output logic [4:0] s_exc_type_D,
    output logic s_exc_valid_D,
    output logic s_is_fence_D,
    output logic s_is_fence_i_D,
    output logic s_is_load_D,
    output logic s_is_store_D,
    output logic s_load_ce_D,
    output logic s_lsu_ce_D,
    output logic s_pma_cacheable_D,
    output logic s_pma_idempotent_D,
    output logic [1:0] s_req_exc_extra_o_D,
    output logic [31:0] s_req_exc_tval_o_D,
    output logic [4:0] s_req_exc_type_o_D,
    output logic s_req_exc_valid_o_D,
    output logic s_store_ce_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic codasip_tmp_var_0;
    // signal/wire
    logic [7:0] codasip_tmp_var_1;
    // signal/wire
    logic [7:0] codasip_tmp_var_2;
    // signal/wire
    logic [4:0] fault_type_B0;
    // signal/wire
    logic lsu_op_valid_B0;
    // signal/wire
    logic [4:0] misaligned_type_B0;
    // signal/wire
    logic pma_fault_B0;
    // signal/wire
    logic pma_misaligned_B0;
    // signal/wire
    logic pmp_fault_B0;
    // signal/wire
    logic [31:0] request_add_B0;
    // signal/wire
    logic s_is_fence_D_ACT_wire;
    // signal/wire
    logic s_is_fence_i_D_ACT_wire;
    // signal/wire
    logic s_is_load_D_ACT_wire;
    // signal/wire
    logic s_is_store_D_ACT_wire;
    // signal/wire
    logic [1:0] size_B0;

    // data-path code:
    assign codasip_tmp_var_0 = s_multicycle_Q;
    assign codasip_tmp_var_1 = (!codasip_tmp_var_0) ? s_op_i_Q : 8'h00;
    assign s_is_load_D_ACT_wire = codasip_tmp_var_0 ? 1'b0 :
        ((((((codasip_tmp_var_1 == 8'h14) || (codasip_tmp_var_1 == 8'h13)) || (codasip_tmp_var_1 == 8'h12)) || (codasip_tmp_var_1 == 8'h11)) || (codasip_tmp_var_1 == 8'h10)) || (codasip_tmp_var_1 == 8'h19)) ? 1'b1 : 1'b0;
    assign s_is_store_D_ACT_wire = codasip_tmp_var_0 ? 1'b1 :
        ((((((codasip_tmp_var_1 == 8'h14) || (codasip_tmp_var_1 == 8'h13)) || (codasip_tmp_var_1 == 8'h12)) || (codasip_tmp_var_1 == 8'h11)) || (codasip_tmp_var_1 == 8'h10)) || (codasip_tmp_var_1 == 8'h19)) ? 1'b0 :
        ((((codasip_tmp_var_1 == 8'h17) || (codasip_tmp_var_1 == 8'h16)) || (codasip_tmp_var_1 == 8'h15)) || (codasip_tmp_var_1 == 8'h1b)) ? 1'b1 : 1'b0;
    assign codasip_tmp_var_2 = (!codasip_tmp_var_0) ? s_op_i_Q : 8'h00;
    assign size_B0 = codasip_tmp_var_0 ? 2'h2 :
        (((codasip_tmp_var_2 == 8'h14) || (codasip_tmp_var_2 == 8'h11)) || (codasip_tmp_var_2 == 8'h16)) ? 2'h1 :
        ((((codasip_tmp_var_2 == 8'h1b) || (codasip_tmp_var_2 == 8'h19)) || (codasip_tmp_var_2 == 8'h12)) || (codasip_tmp_var_2 == 8'h17)) ? 2'h2 : 2'h0;
    assign request_add_B0 = codasip_tmp_var_0 ? (((r_state_Q == 4'h1)) ? {cache_base_p[31:9], 9'h160} : (((r_state_Q == 4'h2)) ? {cache_base_p[31:9], 9'h154} : (((r_state_Q == 4'h3)) ? {cache_base_p[31:9], 9'h148} : r_data_addr_Q))) : s_addr_i_Q;
    assign lsu_op_valid_B0 = ((((s_is_load_Q | s_is_store_Q) | s_is_fence_Q) | s_is_fence_i_Q) | s_multicycle_Q);
    assign pma_fault_B0 = pma_ldst_s_fault_o_Q;
    assign pma_misaligned_B0 = pma_ldst_s_misaligned_o_Q;
    assign pmp_fault_B0 = pmp_ldst_s_fault_o_Q;
    assign misaligned_type_B0 = ((s_is_load_Q) ? 5'h04 : 5'h06);
    assign fault_type_B0 = ((s_is_load_Q) ? 5'h05 : 5'h07);
    assign s_is_fence_D_ACT_wire = codasip_tmp_var_0 ? 1'b0 : (s_op_i_Q == 8'h1c);
    assign s_is_fence_i_D_ACT_wire = codasip_tmp_var_0 ? 1'b0 : (s_op_i_Q == 8'h1d);
    assign pma_ldst_s_addr_i_D = request_add_B0;
    assign pma_ldst_s_size_i_D = size_B0;
    assign pmp_ldst_s_addr_i_D = (request_add_B0 >> 32'sh00000002);
    assign pmp_ldst_s_prv_i_D = ((s_ocd_mmode_i_Q) ? 2'h3 : (((r_csr_mstatus_Q[6] == 1'b1)) ? r_csr_mstatus_Q[1:0] : r_prv_Q));
    assign pmp_ldst_s_valid_i_D = (s_is_store_Q || s_is_load_Q);
    assign pmp_ldst_s_write_i_D = s_is_store_Q;
    assign s_exc_pma_D = pma_fault_B0;
    assign s_exc_type_D = ((pma_misaligned_B0) ? misaligned_type_B0 : fault_type_B0);
    assign s_exc_valid_D = (((pmp_fault_B0 | pma_fault_B0) | pma_misaligned_B0) & (s_is_store_Q | s_is_load_Q));
    assign s_is_fence_D = s_is_fence_D_ACT_wire;
    assign s_is_fence_i_D = s_is_fence_i_D_ACT_wire;
    assign s_is_load_D = s_is_load_D_ACT_wire;
    assign s_is_store_D = s_is_store_D_ACT_wire;
    assign s_load_ce_D = (s_is_load_Q | r_is_load_Q);
    assign s_lsu_ce_D = (((lsu_op_valid_B0 | r_is_load_Q) | r_is_store_Q) | s_fence_issued_Q);
    assign s_pma_cacheable_D = pma_ldst_s_cacheable_o_Q;
    assign s_pma_idempotent_D = pma_ldst_s_idempotent_o_Q;
    assign s_req_exc_extra_o_D = ((pma_misaligned_B0) ? 2'h0 : ((pma_fault_B0) ? 2'h2 : 2'h3));
    assign s_req_exc_tval_o_D = request_add_B0;
    assign s_req_exc_type_o_D = s_exc_type_Q;
    assign s_req_exc_valid_o_D = (s_exc_valid_Q & (~s_multicycle_Q));
    assign s_store_ce_D = (((((s_is_store_Q | s_is_fence_Q) | s_is_fence_i_Q) | r_is_store_Q) | s_fence_issued_Q) | s_multicycle_Q);
endmodule: codix_berkelium_ca_core_execute_stage_lsu_compute_addr_check_t
