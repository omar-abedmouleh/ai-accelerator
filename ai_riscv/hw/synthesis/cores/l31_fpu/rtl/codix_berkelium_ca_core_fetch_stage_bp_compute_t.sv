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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_bp_compute_t' functional unit.
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

module codix_berkelium_ca_core_fetch_stage_bp_compute_t(
    input  logic bht_s_taken_o_Q,
    input  logic [31:0] btb_s_addr_o_Q,
    input  logic [31:0] btb_s_alt_addr_o_Q,
    input  logic [1:0] btb_s_is_jump_o_Q,
    input  logic btb_s_predict_valid_o_Q,
    input  logic [1:0] btb_s_valid_o_Q,
    input  logic [31:0] s_addr_offset_Q,
    input  logic s_branch_bht_update_i_Q,
    input  logic s_branch_btb_update_i_Q,
    input  logic [31:0] s_branch_instr_add_Q,
    input  logic [31:0] s_branch_instr_addr_i_Q,
    input  logic s_branch_is_rvc_i_Q,
    input  logic [20:0] s_branch_offset_i_Q,
    input  logic s_flush_i_Q,
    input  logic s_flush_line_i_Q,
    input  logic [31:0] s_instr_addr_i_Q,
    input  logic s_instr_valid_i_Q,
    input  logic s_is_branch_i_Q,
    input  logic s_is_jump_i_Q,
    input  logic s_link_return_i_Q,
    input  logic s_no_increment_i_Q,
    input  logic [20:0] s_offset_Q,
    input  logic [31:0] s_return_add_i_Q,
    input  logic s_return_update_i_Q,
    input  logic s_taken_i_Q,
    output logic bht_s_branch_bht_update_i_D,
    output logic [31:0] bht_s_branch_instr_addr_i_D,
    output logic bht_s_flush_i_D,
    output logic [31:0] bht_s_instr_addr_i_D,
    output logic bht_s_is_branch_i_D,
    output logic bht_s_predict_valid_i_D,
    output logic bht_s_taken_i_D,
    output logic btb_s_branch_btb_update_i_D,
    output logic [31:0] btb_s_branch_instr_addr_i_D,
    output logic btb_s_flush_i_D,
    output logic btb_s_flush_line_i_D,
    output logic [31:0] btb_s_instr_addr_i_D,
    output logic btb_s_is_branch_i_D,
    output logic btb_s_is_jump_i_D,
    output logic btb_s_link_return_i_D,
    output logic [31:0] btb_s_offset_i_D,
    output logic [31:0] btb_s_return_add_i_D,
    output logic btb_s_return_update_i_D,
    output logic [31:0] s_addr_o_D,
    output logic [31:0] s_addr_offset_D,
    output logic [31:0] s_branch_instr_add_D,
    output logic [20:0] s_offset_D,
    output logic [1:0] s_taken_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic takenC_B0;
    // signal/wire
    logic taken_B0;
    // signal/wire
    logic ualig_adder_B0;
    // signal/wire
    logic unaligned_i_B0;
    // signal/wire
    logic valid1_B0;
    // signal/wire
    logic valid2_B0;

    // data-path code:
    assign unaligned_i_B0 = ((~s_branch_is_rvc_i_Q) & s_branch_instr_addr_i_Q[1]);
    assign ualig_adder_B0 = (unaligned_i_B0 & ((s_branch_bht_update_i_Q | s_is_jump_i_Q) | s_flush_line_i_Q));
    assign valid1_B0 = (((btb_s_valid_o_Q[0] & (~btb_s_is_jump_o_Q[0]))) ? bht_s_taken_o_Q : 1'b0);
    assign valid2_B0 = (((btb_s_valid_o_Q[1] & (~btb_s_is_jump_o_Q[1]))) ? bht_s_taken_o_Q : 1'b0);
    assign taken_B0 = (s_instr_valid_i_Q & (valid1_B0 || (btb_s_valid_o_Q[0] & btb_s_is_jump_o_Q[0])));
    assign takenC_B0 = (s_instr_valid_i_Q & (valid2_B0 || (btb_s_valid_o_Q[1] & btb_s_is_jump_o_Q[1])));
    assign bht_s_branch_bht_update_i_D = (s_branch_bht_update_i_Q & (~s_is_jump_i_Q));
    assign bht_s_branch_instr_addr_i_D = s_branch_instr_add_Q;
    assign bht_s_flush_i_D = s_flush_i_Q;
    assign bht_s_instr_addr_i_D = s_instr_addr_i_Q;
    assign bht_s_is_branch_i_D = s_is_branch_i_Q;
    assign bht_s_predict_valid_i_D = btb_s_predict_valid_o_Q;
    assign bht_s_taken_i_D = s_taken_i_Q;
    assign btb_s_branch_btb_update_i_D = s_branch_btb_update_i_Q;
    assign btb_s_branch_instr_addr_i_D = s_branch_instr_add_Q;
    assign btb_s_flush_i_D = s_flush_i_Q;
    assign btb_s_flush_line_i_D = s_flush_line_i_Q;
    assign btb_s_instr_addr_i_D = s_instr_addr_i_Q;
    assign btb_s_is_branch_i_D = s_is_branch_i_Q;
    assign btb_s_is_jump_i_D = s_is_jump_i_Q;
    assign btb_s_link_return_i_D = s_link_return_i_Q;
    assign btb_s_offset_i_D = s_addr_offset_Q;
    assign btb_s_return_add_i_D = s_return_add_i_Q;
    assign btb_s_return_update_i_D = s_return_update_i_Q;
    assign s_addr_o_D = ((taken_B0) ? btb_s_addr_o_Q : btb_s_alt_addr_o_Q);
    assign s_addr_offset_D = {{32'd11{s_offset_Q[20]}}, s_offset_Q};
    assign s_branch_instr_add_D = (s_branch_instr_addr_i_Q + (((ualig_adder_B0 & (~s_no_increment_i_Q))) ? 32'h00000002 : 32'h00000000));
    assign s_offset_D = (s_branch_offset_i_Q + unsigned'((((ualig_adder_B0 & (~s_no_increment_i_Q))) ? 21'sh1ffffe : 21'sh000000)));
    assign s_taken_o_D = {takenC_B0, taken_B0};
endmodule: codix_berkelium_ca_core_fetch_stage_bp_compute_t
