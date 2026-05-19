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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_bru_t' CodAL module.
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

module codix_berkelium_ca_core_execute_stage_bru_t(
    input  logic compute_ACT,
    input  logic [31:0] s_bp_addr_i_D,
    input  logic s_bp_taken_i_D,
    input  logic [31:0] s_imm_i_D,
    input  logic [31:0] s_instr_addr_i_D,
    input  logic s_is_rvc_i_D,
    input  logic [7:0] s_op_i_D,
    input  logic [31:0] s_rs1_data_i_D,
    input  logic s_take_branch_i_D,
    output logic s_branch_bht_update_o_Q,
    output logic s_branch_btb_update_o_Q,
    output logic s_branch_miss_o_Q,
    output logic s_branch_taken_o_Q,
    output logic [31:0] s_branch_target_addr_o_Q,
    output logic s_is_jump_o_Q,
    output logic [31:0] s_rd_data_o_Q,
    output logic s_rd_we_o_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic [7:0] s_op_i;
    // CodAL signal/wire
    logic [31:0] s_rs1_data_i;
    // CodAL signal/wire
    logic [31:0] s_imm_i;
    // CodAL signal/wire
    logic s_is_rvc_i;
    // CodAL signal/wire
    logic [31:0] s_instr_addr_i;
    // CodAL signal/wire
    logic s_take_branch_i;
    // CodAL signal/wire
    logic [31:0] s_bp_addr_i;
    // CodAL signal/wire
    logic s_bp_taken_i;
    // CodAL signal/wire
    logic [31:0] s_branch_target_addr_o;
    // CodAL signal/wire
    logic s_branch_miss_o;
    // CodAL signal/wire
    logic s_is_jump_o;
    // CodAL signal/wire
    logic s_branch_taken_o;
    // CodAL signal/wire
    logic s_branch_bht_update_o;
    // CodAL signal/wire
    logic s_branch_btb_update_o;
    // CodAL signal/wire
    logic [31:0] s_rd_data_o;
    // CodAL signal/wire
    logic s_rd_we_o;

    // child instances inside CodAL module:
    // instance of 's_op_i' CodAL signal/wire: (single driver)
    assign s_op_i = s_op_i_D;
    // instance of 's_rs1_data_i' CodAL signal/wire: (single driver)
    assign s_rs1_data_i = s_rs1_data_i_D;
    // instance of 's_imm_i' CodAL signal/wire: (single driver)
    assign s_imm_i = s_imm_i_D;
    // instance of 's_is_rvc_i' CodAL signal/wire: (single driver)
    assign s_is_rvc_i = s_is_rvc_i_D;
    // instance of 's_instr_addr_i' CodAL signal/wire: (single driver)
    assign s_instr_addr_i = s_instr_addr_i_D;
    // instance of 's_take_branch_i' CodAL signal/wire: (single driver)
    assign s_take_branch_i = s_take_branch_i_D;
    // instance of 's_bp_addr_i' CodAL signal/wire: (single driver)
    assign s_bp_addr_i = s_bp_addr_i_D;
    // instance of 's_bp_taken_i' CodAL signal/wire: (single driver)
    assign s_bp_taken_i = s_bp_taken_i_D;
    // instance of 's_branch_target_addr_o' CodAL signal/wire: (parent port driver(s))
    assign s_branch_target_addr_o_Q = s_branch_target_addr_o;
    // instance of 's_branch_miss_o' CodAL signal/wire: (parent port driver(s))
    assign s_branch_miss_o_Q = s_branch_miss_o;
    // instance of 's_is_jump_o' CodAL signal/wire: (parent port driver(s))
    assign s_is_jump_o_Q = s_is_jump_o;
    // instance of 's_branch_taken_o' CodAL signal/wire: (parent port driver(s))
    assign s_branch_taken_o_Q = s_branch_taken_o;
    // instance of 's_branch_bht_update_o' CodAL signal/wire: (parent port driver(s))
    assign s_branch_bht_update_o_Q = s_branch_bht_update_o;
    // instance of 's_branch_btb_update_o' CodAL signal/wire: (parent port driver(s))
    assign s_branch_btb_update_o_Q = s_branch_btb_update_o;
    // instance of 's_rd_data_o' CodAL signal/wire: (parent port driver(s))
    assign s_rd_data_o_Q = s_rd_data_o;
    // instance of 's_rd_we_o' CodAL signal/wire: (parent port driver(s))
    assign s_rd_we_o_Q = s_rd_we_o;
    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_bru_compute_t compute (
        .ACT(compute_ACT),
        .s_bp_addr_i_Q(s_bp_addr_i),
        .s_bp_taken_i_Q(s_bp_taken_i),
        .s_branch_target_addr_o_Q(s_branch_target_addr_o),
        .s_imm_i_Q(s_imm_i),
        .s_instr_addr_i_Q(s_instr_addr_i),
        .s_is_rvc_i_Q(s_is_rvc_i),
        .s_op_i_Q(s_op_i),
        .s_rs1_data_i_Q(s_rs1_data_i),
        .s_take_branch_i_Q(s_take_branch_i),
        .s_branch_bht_update_o_D(s_branch_bht_update_o),
        .s_branch_btb_update_o_D(s_branch_btb_update_o),
        .s_branch_miss_o_D(s_branch_miss_o),
        .s_branch_taken_o_D(s_branch_taken_o),
        .s_branch_target_addr_o_D(s_branch_target_addr_o),
        .s_is_jump_o_D(s_is_jump_o),
        .s_rd_data_o_D(s_rd_data_o),
        .s_rd_we_o_D(s_rd_we_o)
    );

endmodule: codix_berkelium_ca_core_execute_stage_bru_t
