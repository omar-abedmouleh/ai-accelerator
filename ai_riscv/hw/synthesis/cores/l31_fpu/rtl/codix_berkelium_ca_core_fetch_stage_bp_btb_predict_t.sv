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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_bp_btb_predict_t' functional unit.
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

module codix_berkelium_ca_core_fetch_stage_bp_btb_predict_t(
    input  logic [63:0] r_btb_valid_Q,
    input  logic [15:0] r_jtb_valid_Q,
    input  logic r_rab_valid_Q,
    input  logic [30:0] r_return_add_Q,
    input  logic [30:0] r_return_instr_Q,
    input  logic [20:0] rf_btb_data_p0_Q,
    input  logic [30:0] rf_jtb_data_p0_Q,
    input  logic [30:0] s_instr_addr_i_Q,
    output logic [5:0] rf_btb_data_p0_RA,
    output logic rf_btb_data_p0_RE,
    output logic [3:0] rf_jtb_data_p0_RA,
    output logic rf_jtb_data_p0_RE,
    output logic [31:0] s_addr_o_D,
    output logic [31:0] s_alt_addr_o_D,
    output logic [1:0] s_is_jump_o_D,
    output logic s_predict_valid_o_D,
    output logic [1:0] s_valid_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic aligned_branch_B0;
    // signal/wire
    logic aligned_jump_B0;
    // signal/wire
    logic aligned_return_B0;
    // signal/wire
    logic b_sign_B0;
    // signal/wire
    logic branch_instr_B0;
    // signal/wire
    logic branch_is_uc_B0;
    // signal/wire
    logic branch_valid_B0;
    // signal/wire
    logic codasip_tmp_var_0;
    // signal/wire
    logic codasip_tmp_var_1;
    // signal/wire
    logic codasip_tmp_var_2;
    // signal/wire
    logic codasip_tmp_var_3;
    // signal/wire
    logic [5:0] index_B0;
    // signal/wire
    logic [3:0] j_index_B0;
    // signal/wire
    logic [31:0] j_offset_B0;
    // signal/wire
    logic j_sign_B0;
    // signal/wire
    logic [31:0] j_target_B0;
    // signal/wire
    logic jump_instr_B0;
    // signal/wire
    logic jump_is_uc_B0;
    // signal/wire
    logic jump_valid_B0;
    // signal/wire
    logic match_B0;
    // signal/wire
    logic match_j_B0;
    // signal/wire
    logic match_r_B0;
    // signal/wire
    logic [31:0] offset_B0;
    // signal/wire
    logic return_instr_B0;
    // signal/wire
    logic [20:0] row_B0;
    // signal/wire
    logic [30:0] row_j_B0;
    // signal/wire
    logic [31:0] s_addr_o_D_ACT_wire;
    // signal/wire
    logic [31:0] s_alt_addr_o_D_ACT_wire;
    // signal/wire
    logic [31:0] target_B0;
    // signal/wire
    logic unaligned_branch_B0;
    // signal/wire
    logic unaligned_jump_B0;
    // signal/wire
    logic unaligned_return_B0;

    // additional declarations:
    logic tmp_codasip_conv_SHIFT_RIGHT_35_1;
    logic [63:0] tmp_codasip_conv_SHIFT_RIGHT_35_2;
    logic tmp_codasip_conv_SHIFT_RIGHT_102_3;
    logic [15:0] tmp_codasip_conv_SHIFT_RIGHT_102_4;

    // conversions for data-path:
    assign tmp_codasip_conv_SHIFT_RIGHT_35_2 = unsigned'((r_btb_valid_Q >> index_B0));
    assign tmp_codasip_conv_SHIFT_RIGHT_35_1 = tmp_codasip_conv_SHIFT_RIGHT_35_2[0];
    assign tmp_codasip_conv_SHIFT_RIGHT_102_4 = unsigned'((r_jtb_valid_Q >> j_index_B0));
    assign tmp_codasip_conv_SHIFT_RIGHT_102_3 = tmp_codasip_conv_SHIFT_RIGHT_102_4[0];
    // data-path code:
    assign index_B0 = s_instr_addr_i_Q[6:1];
    assign row_B0 = rf_btb_data_p0_Q;
    assign match_B0 = (s_instr_addr_i_Q[14:7] == row_B0[19:12]);
    assign branch_is_uc_B0 = row_B0[20];
    assign branch_valid_B0 = tmp_codasip_conv_SHIFT_RIGHT_35_1;
    assign branch_instr_B0 = (branch_valid_B0 & match_B0);
    assign match_r_B0 = (s_instr_addr_i_Q[30:1] == r_return_instr_Q[30:1]);
    assign return_instr_B0 = (match_r_B0 & r_rab_valid_Q);
    assign j_index_B0 = s_instr_addr_i_Q[5:2];
    assign row_j_B0 = rf_jtb_data_p0_Q;
    assign jump_is_uc_B0 = row_j_B0[30];
    assign match_j_B0 = ((s_instr_addr_i_Q[14:6] == row_j_B0[29:21]) & (s_instr_addr_i_Q[1] == row_j_B0[20]));
    assign jump_valid_B0 = tmp_codasip_conv_SHIFT_RIGHT_102_3;
    assign jump_instr_B0 = (jump_valid_B0 & match_j_B0);
    assign j_sign_B0 = row_j_B0[19];
    assign j_offset_B0 = {{32'd11{j_sign_B0}}, row_j_B0[19:0], 1'b0};
    assign j_target_B0 = (((jump_instr_B0) ? {s_instr_addr_i_Q[30:1], jump_is_uc_B0, 1'b0} : 32'h00000000) + unsigned'(((jump_instr_B0) ? signed'(j_offset_B0) : 32'sh00000000)));
    assign b_sign_B0 = row_B0[11];
    assign offset_B0 = {{32'd19{b_sign_B0}}, row_B0[11:0], 1'b0};
    assign target_B0 = (((branch_instr_B0) ? {s_instr_addr_i_Q[30:1], branch_is_uc_B0, 1'b0} : 32'h00000000) + unsigned'(((branch_instr_B0) ? signed'(offset_B0) : 32'sh00000000)));
    assign aligned_return_B0 = (((~s_instr_addr_i_Q[0]) & return_instr_B0) & (~r_return_instr_Q[0]));
    assign aligned_jump_B0 = ((~s_instr_addr_i_Q[0]) & ((jump_valid_B0) ? (jump_instr_B0 & (~jump_is_uc_B0)) : 1'b0));
    assign aligned_branch_B0 = ((~s_instr_addr_i_Q[0]) & ((branch_valid_B0) ? (branch_instr_B0 & (~branch_is_uc_B0)) : 1'b0));
    assign codasip_tmp_var_0 = (return_instr_B0 & (~r_return_instr_Q[0]));
    assign codasip_tmp_var_1 = (!codasip_tmp_var_0) ? (jump_instr_B0 & (~jump_is_uc_B0)) : 1'b0;
    assign s_addr_o_D_ACT_wire = codasip_tmp_var_0 ? {r_return_add_Q, 1'b0} :
        codasip_tmp_var_1 ? {j_target_B0[31:1], 1'b0} : {target_B0[31:1], 1'b0};
    assign unaligned_return_B0 = (return_instr_B0 & r_return_instr_Q[0]);
    assign unaligned_jump_B0 = ((jump_valid_B0) ? (jump_instr_B0 & jump_is_uc_B0) : 1'b0);
    assign unaligned_branch_B0 = ((branch_valid_B0) ? (branch_instr_B0 & branch_is_uc_B0) : 1'b0);
    assign codasip_tmp_var_2 = (return_instr_B0 & r_return_instr_Q[0]);
    assign codasip_tmp_var_3 = (!codasip_tmp_var_2) ? (jump_instr_B0 & jump_is_uc_B0) : 1'b0;
    assign s_alt_addr_o_D_ACT_wire = codasip_tmp_var_2 ? {r_return_add_Q, 1'b0} :
        codasip_tmp_var_3 ? {j_target_B0[31:1], 1'b0} : {target_B0[31:1], 1'b0};
    assign rf_btb_data_p0_RA = index_B0;
    assign rf_btb_data_p0_RE = 1'b1;
    assign rf_jtb_data_p0_RA = j_index_B0;
    assign rf_jtb_data_p0_RE = 1'b1;
    assign s_addr_o_D = s_addr_o_D_ACT_wire;
    assign s_alt_addr_o_D = s_alt_addr_o_D_ACT_wire;
    assign s_is_jump_o_D = {(unaligned_jump_B0 | unaligned_return_B0), (aligned_jump_B0 | aligned_return_B0)};
    assign s_predict_valid_o_D = branch_valid_B0;
    assign s_valid_o_D = {((unaligned_jump_B0 | unaligned_return_B0) | unaligned_branch_B0), ((aligned_jump_B0 | aligned_return_B0) | aligned_branch_B0)};
endmodule: codix_berkelium_ca_core_fetch_stage_bp_btb_predict_t
