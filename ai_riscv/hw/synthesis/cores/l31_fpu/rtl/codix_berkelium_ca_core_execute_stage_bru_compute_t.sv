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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_bru_compute_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_bru_compute_t(
    input  logic ACT,
    input  logic [31:0] s_bp_addr_i_Q,
    input  logic s_bp_taken_i_Q,
    input  logic [31:0] s_branch_target_addr_o_Q,
    input  logic [31:0] s_imm_i_Q,
    input  logic [31:0] s_instr_addr_i_Q,
    input  logic s_is_rvc_i_Q,
    input  logic [7:0] s_op_i_Q,
    input  logic [31:0] s_rs1_data_i_Q,
    input  logic s_take_branch_i_Q,
    output logic s_branch_bht_update_o_D,
    output logic s_branch_btb_update_o_D,
    output logic s_branch_miss_o_D,
    output logic s_branch_taken_o_D,
    output logic [31:0] s_branch_target_addr_o_D,
    output logic s_is_jump_o_D,
    output logic [31:0] s_rd_data_o_D,
    output logic s_rd_we_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic [31:0] base_addr_B0;
    // signal/wire
    logic [31:0] bp_addr_B0;
    // signal/wire
    logic branch_taken_B0;
    // signal/wire
    logic is_branch_B0;
    // signal/wire
    logic is_jump_B0;
    // signal/wire
    logic is_valid_B0;
    // signal/wire
    logic miss_predict_B0;
    // signal/wire
    logic [31:0] nxt_pc_B0;
    // signal/wire
    logic [31:0] target_addr_B0;
    // signal/wire
    logic [31:0] tmp_addr_B0;

    // data-path code:
    assign is_branch_B0 = ((((((s_op_i_Q == 8'h0c) || (s_op_i_Q == 8'h0d)) || (s_op_i_Q == 8'h0e)) || (s_op_i_Q == 8'h0f)) || (s_op_i_Q == 8'h0a)) || (s_op_i_Q == 8'h0b));
    assign is_jump_B0 = ((s_op_i_Q == 8'h47) || (s_op_i_Q == 8'h48));
    assign is_valid_B0 = (is_branch_B0 || is_jump_B0);
    assign base_addr_B0 = (((s_op_i_Q == 8'h47)) ? s_rs1_data_i_Q : s_instr_addr_i_Q);
    assign nxt_pc_B0 = (s_instr_addr_i_Q + unsigned'(((s_is_rvc_i_Q) ? 32'sh00000002 : 32'sh00000004)));
    assign tmp_addr_B0 = (base_addr_B0 + unsigned'(signed'(s_imm_i_Q)));
    assign target_addr_B0 = {tmp_addr_B0[31:1], 1'b0};
    assign branch_taken_B0 = s_take_branch_i_Q;
    assign bp_addr_B0 = ((s_bp_taken_i_Q) ? s_bp_addr_i_Q : nxt_pc_B0);
    assign miss_predict_B0 = (bp_addr_B0 != s_branch_target_addr_o_Q);
    assign s_branch_bht_update_o_D = (ACT == 1'b1) ? is_branch_B0 : 1'b0;
    assign s_branch_btb_update_o_D = (ACT == 1'b1) ? (is_valid_B0 & branch_taken_B0) : 1'b0;
    assign s_branch_miss_o_D = (ACT == 1'b1) ? miss_predict_B0 : 1'b0;
    assign s_branch_taken_o_D = (ACT == 1'b1) ? branch_taken_B0 : 1'b0;
    assign s_branch_target_addr_o_D = (ACT == 1'b1) ? ((branch_taken_B0) ? target_addr_B0 : nxt_pc_B0) : 32'h00000000;
    assign s_is_jump_o_D = (ACT == 1'b1) ? is_jump_B0 : 1'b0;
    assign s_rd_data_o_D = (ACT == 1'b1) ? nxt_pc_B0 : 32'h00000000;
    assign s_rd_we_o_D = (ACT == 1'b1) ? is_jump_B0 : 1'b0;
endmodule: codix_berkelium_ca_core_execute_stage_bru_compute_t
