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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_bp_btb_update_t' functional unit.
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

module codix_berkelium_ca_core_fetch_stage_bp_btb_update_t(
    input  logic [63:0] r_btb_valid_Q,
    input  logic [15:0] r_jtb_valid_Q,
    input  logic s_branch_btb_update_i_Q,
    input  logic [30:0] s_branch_instr_addr_i_Q,
    input  logic s_flush_i_Q,
    input  logic s_flush_line_i_Q,
    input  logic s_is_jump_i_Q,
    input  logic s_link_return_i_Q,
    input  logic [19:0] s_offset_i_Q,
    input  logic [30:0] s_return_add_i_Q,
    input  logic s_return_update_i_Q,
    output logic [63:0] r_btb_valid_D,
    output logic r_btb_valid_WE,
    output logic [15:0] r_jtb_valid_D,
    output logic r_jtb_valid_WE,
    output logic r_rab_valid_D,
    output logic r_rab_valid_WE,
    output logic [30:0] r_return_add_D,
    output logic r_return_add_WE,
    output logic [30:0] r_return_instr_D,
    output logic r_return_instr_WE,
    output logic [20:0] rf_btb_data_w0_D,
    output logic [5:0] rf_btb_data_w0_WA,
    output logic rf_btb_data_w0_WE,
    output logic [30:0] rf_jtb_data_w0_D,
    output logic [3:0] rf_jtb_data_w0_WA,
    output logic rf_jtb_data_w0_WE
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
    logic codasip_tmp_var_4;
    // signal/wire
    logic codasip_tmp_var_5;
    // signal/wire
    logic [5:0] index_B0;
    // signal/wire
    logic [3:0] jindex_B0;

    // data-path code:
    assign index_B0 = s_branch_instr_addr_i_Q[6:1];
    assign jindex_B0 = s_branch_instr_addr_i_Q[5:2];
    assign codasip_tmp_var_0 = (s_flush_i_Q | s_flush_line_i_Q);
    assign codasip_tmp_var_1 = codasip_tmp_var_0 ? s_flush_i_Q : 1'b0;
    assign codasip_tmp_var_2 = (!codasip_tmp_var_0) ? s_branch_btb_update_i_Q : 1'b0;
    assign codasip_tmp_var_3 = codasip_tmp_var_2 ? s_return_update_i_Q : 1'b0;
    assign codasip_tmp_var_4 = ((!codasip_tmp_var_3) && codasip_tmp_var_2) ? s_is_jump_i_Q : 1'b0;
    assign codasip_tmp_var_5 = codasip_tmp_var_4 ? s_link_return_i_Q : 1'b0;
    assign r_btb_valid_D = codasip_tmp_var_1 ? 64'h0000000000000000 :
        codasip_tmp_var_0 ? (r_btb_valid_Q & (~(64'h0000000000000001 << index_B0))) :
        (((!codasip_tmp_var_4) && (!codasip_tmp_var_3)) && codasip_tmp_var_2) ? (r_btb_valid_Q | (64'h0000000000000001 << index_B0)) : 64'h0000000000000000;
    assign r_btb_valid_WE = ((codasip_tmp_var_1 || codasip_tmp_var_0) || (((!codasip_tmp_var_4) && (!codasip_tmp_var_3)) && codasip_tmp_var_2)) ? 1'b1 : 1'b0;
    assign r_jtb_valid_D = codasip_tmp_var_1 ? 16'h0000 :
        codasip_tmp_var_0 ? (r_jtb_valid_Q & (~(16'h0001 << jindex_B0))) :
        codasip_tmp_var_4 ? (r_jtb_valid_Q | (16'h0001 << jindex_B0)) : 16'h0000;
    assign r_jtb_valid_WE = ((codasip_tmp_var_1 || codasip_tmp_var_0) || codasip_tmp_var_4) ? 1'b1 : 1'b0;
    assign r_rab_valid_D = codasip_tmp_var_0 ? 1'b0 :
        codasip_tmp_var_3 ? 1'b1 : 1'b0;
    assign r_rab_valid_WE = (codasip_tmp_var_0 || codasip_tmp_var_3) ? 1'b1 : 1'b0;
    assign r_return_add_D = s_return_add_i_Q;
    assign r_return_add_WE = codasip_tmp_var_5 ? 1'b1 : 1'b0;
    assign r_return_instr_D = s_branch_instr_addr_i_Q;
    assign r_return_instr_WE = codasip_tmp_var_3 ? 1'b1 : 1'b0;
    assign rf_btb_data_w0_D = {s_branch_instr_addr_i_Q[0], s_branch_instr_addr_i_Q[14:7], s_offset_i_Q[11:0]};
    assign rf_btb_data_w0_WA = index_B0;
    assign rf_btb_data_w0_WE = (((!codasip_tmp_var_4) && (!codasip_tmp_var_3)) && codasip_tmp_var_2) ? 1'b1 : 1'b0;
    assign rf_jtb_data_w0_D = {s_branch_instr_addr_i_Q[0], s_branch_instr_addr_i_Q[14:6], s_branch_instr_addr_i_Q[1], s_offset_i_Q};
    assign rf_jtb_data_w0_WA = jindex_B0;
    assign rf_jtb_data_w0_WE = codasip_tmp_var_4 ? 1'b1 : 1'b0;
endmodule: codix_berkelium_ca_core_fetch_stage_bp_btb_update_t
