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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_bp_t' CodAL module.
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

module codix_berkelium_ca_core_fetch_stage_bp_t(
    input  logic fetch_stage_bp_bht_s_is_branch_i_ICLK,
    input  logic fetch_stage_bp_btb_s_is_branch_i_ICLK,
    input  logic fetch_stage_bp_btb_s_is_jump_i_ICLK,
    input  logic r_wfi_ce_ICLK,
    input  logic RST,
    input  logic s_branch_bht_update_i_D,
    input  logic s_branch_btb_update_i_D,
    input  logic [31:0] s_branch_instr_addr_i_D,
    input  logic s_branch_is_rvc_i_D,
    input  logic [31:0] s_branch_offset_i_D,
    input  logic s_flush_i_D,
    input  logic s_flush_line_i_D,
    input  logic [31:0] s_instr_addr_i_D,
    input  logic s_instr_valid_i_D,
    input  logic s_is_branch_i_D,
    input  logic s_is_jump_i_D,
    input  logic s_link_return_i_D,
    input  logic s_no_increment_i_D,
    input  logic [31:0] s_return_add_i_D,
    input  logic s_return_update_i_D,
    input  logic s_taken_i_D,
    output logic bht_s_is_branch_i_Q,
    output logic btb_s_is_branch_i_Q,
    output logic btb_s_is_jump_i_Q,
    output logic [31:0] s_addr_o_Q,
    output logic [1:0] s_taken_o_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic [31:0] s_instr_addr_i;
    // CodAL signal/wire
    logic [31:0] s_branch_instr_addr_i;
    // CodAL signal/wire
    logic [31:0] s_branch_offset_i;
    // CodAL signal/wire
    logic [31:0] s_return_add_i;
    // CodAL signal/wire
    logic s_instr_valid_i;
    // CodAL signal/wire
    logic s_taken_i;
    // CodAL signal/wire
    logic s_branch_bht_update_i;
    // CodAL signal/wire
    logic s_branch_btb_update_i;
    // CodAL signal/wire
    logic s_flush_i;
    // CodAL signal/wire
    logic s_flush_line_i;
    // CodAL signal/wire
    logic s_is_jump_i;
    // CodAL signal/wire
    logic s_branch_is_rvc_i;
    // CodAL signal/wire
    logic s_no_increment_i;
    // CodAL signal/wire
    logic s_return_update_i;
    // CodAL signal/wire
    logic s_link_return_i;
    // CodAL signal/wire
    logic s_is_branch_i;
    // CodAL signal/wire
    logic [31:0] s_addr_o;
    // CodAL signal/wire
    logic [1:0] s_taken_o;
    // CodAL signal/wire
    logic [31:0] s_branch_instr_add;
    // CodAL signal/wire
    logic [31:0] s_addr_offset;
    // CodAL signal/wire
    logic [20:0] s_offset;

    // additional declarations:
    logic compute_bht_s_branch_bht_update_i_D_wire;
    logic [31:0] compute_bht_s_branch_instr_addr_i_D_wire;
    logic compute_bht_s_flush_i_D_wire;
    logic [31:0] compute_bht_s_instr_addr_i_D_wire;
    logic compute_bht_s_is_branch_i_D_wire;
    logic compute_bht_s_predict_valid_i_D_wire;
    logic compute_bht_s_taken_i_D_wire;
    logic bht_s_taken_o_Q_wire;
    logic compute_btb_s_branch_btb_update_i_D_wire;
    logic [31:0] compute_btb_s_branch_instr_addr_i_D_wire;
    logic compute_btb_s_flush_i_D_wire;
    logic compute_btb_s_flush_line_i_D_wire;
    logic [31:0] compute_btb_s_instr_addr_i_D_wire;
    logic compute_btb_s_is_branch_i_D_wire;
    logic compute_btb_s_is_jump_i_D_wire;
    logic compute_btb_s_link_return_i_D_wire;
    logic [31:0] compute_btb_s_offset_i_D_wire;
    logic [31:0] compute_btb_s_return_add_i_D_wire;
    logic compute_btb_s_return_update_i_D_wire;
    logic [31:0] btb_s_addr_o_Q_wire;
    logic [31:0] btb_s_alt_addr_o_Q_wire;
    logic [1:0] btb_s_is_jump_o_Q_wire;
    logic btb_s_predict_valid_o_Q_wire;
    logic [1:0] btb_s_valid_o_Q_wire;

    // child instances inside CodAL module:
    // instance of 's_instr_addr_i' CodAL signal/wire: (single driver)
    assign s_instr_addr_i = s_instr_addr_i_D;
    // instance of 's_branch_instr_addr_i' CodAL signal/wire: (single driver)
    assign s_branch_instr_addr_i = s_branch_instr_addr_i_D;
    // instance of 's_branch_offset_i' CodAL signal/wire: (single driver)
    assign s_branch_offset_i = s_branch_offset_i_D;
    // instance of 's_return_add_i' CodAL signal/wire: (single driver)
    assign s_return_add_i = s_return_add_i_D;
    // instance of 's_instr_valid_i' CodAL signal/wire: (single driver)
    assign s_instr_valid_i = s_instr_valid_i_D;
    // instance of 's_taken_i' CodAL signal/wire: (single driver)
    assign s_taken_i = s_taken_i_D;
    // instance of 's_branch_bht_update_i' CodAL signal/wire: (single driver)
    assign s_branch_bht_update_i = s_branch_bht_update_i_D;
    // instance of 's_branch_btb_update_i' CodAL signal/wire: (single driver)
    assign s_branch_btb_update_i = s_branch_btb_update_i_D;
    // instance of 's_flush_i' CodAL signal/wire: (single driver)
    assign s_flush_i = s_flush_i_D;
    // instance of 's_flush_line_i' CodAL signal/wire: (single driver)
    assign s_flush_line_i = s_flush_line_i_D;
    // instance of 's_is_jump_i' CodAL signal/wire: (single driver)
    assign s_is_jump_i = s_is_jump_i_D;
    // instance of 's_branch_is_rvc_i' CodAL signal/wire: (single driver)
    assign s_branch_is_rvc_i = s_branch_is_rvc_i_D;
    // instance of 's_no_increment_i' CodAL signal/wire: (single driver)
    assign s_no_increment_i = s_no_increment_i_D;
    // instance of 's_return_update_i' CodAL signal/wire: (single driver)
    assign s_return_update_i = s_return_update_i_D;
    // instance of 's_link_return_i' CodAL signal/wire: (single driver)
    assign s_link_return_i = s_link_return_i_D;
    // instance of 's_is_branch_i' CodAL signal/wire: (single driver)
    assign s_is_branch_i = s_is_branch_i_D;
    // instance of 's_addr_o' CodAL signal/wire: (parent port driver(s))
    assign s_addr_o_Q = s_addr_o;
    // instance of 's_taken_o' CodAL signal/wire: (parent port driver(s))
    assign s_taken_o_Q = s_taken_o;
    // CodAL module instance:
    codix_berkelium_ca_core_fetch_stage_bp_bht_t bht (
        .fetch_stage_bp_bht_s_is_branch_i_ICLK(fetch_stage_bp_bht_s_is_branch_i_ICLK),
        .RST(RST),
        .s_branch_bht_update_i_D(compute_bht_s_branch_bht_update_i_D_wire),
        .s_branch_instr_addr_i_D(compute_bht_s_branch_instr_addr_i_D_wire),
        .s_flush_i_D(compute_bht_s_flush_i_D_wire),
        .s_instr_addr_i_D(compute_bht_s_instr_addr_i_D_wire),
        .s_is_branch_i_D(compute_bht_s_is_branch_i_D_wire),
        .s_predict_valid_i_D(compute_bht_s_predict_valid_i_D_wire),
        .s_taken_i_D(compute_bht_s_taken_i_D_wire),
        .s_is_branch_i_Q(bht_s_is_branch_i_Q),
        .s_taken_o_Q(bht_s_taken_o_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_fetch_stage_bp_btb_t btb (
        .fetch_stage_bp_btb_s_is_branch_i_ICLK(fetch_stage_bp_btb_s_is_branch_i_ICLK),
        .fetch_stage_bp_btb_s_is_jump_i_ICLK(fetch_stage_bp_btb_s_is_jump_i_ICLK),
        .r_wfi_ce_ICLK(r_wfi_ce_ICLK),
        .RST(RST),
        .s_branch_btb_update_i_D(compute_btb_s_branch_btb_update_i_D_wire),
        .s_branch_instr_addr_i_D(compute_btb_s_branch_instr_addr_i_D_wire),
        .s_flush_i_D(compute_btb_s_flush_i_D_wire),
        .s_flush_line_i_D(compute_btb_s_flush_line_i_D_wire),
        .s_instr_addr_i_D(compute_btb_s_instr_addr_i_D_wire),
        .s_is_branch_i_D(compute_btb_s_is_branch_i_D_wire),
        .s_is_jump_i_D(compute_btb_s_is_jump_i_D_wire),
        .s_link_return_i_D(compute_btb_s_link_return_i_D_wire),
        .s_offset_i_D(compute_btb_s_offset_i_D_wire),
        .s_return_add_i_D(compute_btb_s_return_add_i_D_wire),
        .s_return_update_i_D(compute_btb_s_return_update_i_D_wire),
        .s_addr_o_Q(btb_s_addr_o_Q_wire),
        .s_alt_addr_o_Q(btb_s_alt_addr_o_Q_wire),
        .s_is_branch_i_Q(btb_s_is_branch_i_Q),
        .s_is_jump_i_Q(btb_s_is_jump_i_Q),
        .s_is_jump_o_Q(btb_s_is_jump_o_Q_wire),
        .s_predict_valid_o_Q(btb_s_predict_valid_o_Q_wire),
        .s_valid_o_Q(btb_s_valid_o_Q_wire)
    );

    // functional unit instance:
    codix_berkelium_ca_core_fetch_stage_bp_compute_t compute (
        .bht_s_taken_o_Q(bht_s_taken_o_Q_wire),
        .btb_s_addr_o_Q(btb_s_addr_o_Q_wire),
        .btb_s_alt_addr_o_Q(btb_s_alt_addr_o_Q_wire),
        .btb_s_is_jump_o_Q(btb_s_is_jump_o_Q_wire),
        .btb_s_predict_valid_o_Q(btb_s_predict_valid_o_Q_wire),
        .btb_s_valid_o_Q(btb_s_valid_o_Q_wire),
        .s_addr_offset_Q(s_addr_offset),
        .s_branch_bht_update_i_Q(s_branch_bht_update_i),
        .s_branch_btb_update_i_Q(s_branch_btb_update_i),
        .s_branch_instr_add_Q(s_branch_instr_add),
        .s_branch_instr_addr_i_Q(s_branch_instr_addr_i),
        .s_branch_is_rvc_i_Q(s_branch_is_rvc_i),
        .s_branch_offset_i_Q(s_branch_offset_i[20:0]),
        .s_flush_i_Q(s_flush_i),
        .s_flush_line_i_Q(s_flush_line_i),
        .s_instr_addr_i_Q(s_instr_addr_i),
        .s_instr_valid_i_Q(s_instr_valid_i),
        .s_is_branch_i_Q(s_is_branch_i),
        .s_is_jump_i_Q(s_is_jump_i),
        .s_link_return_i_Q(s_link_return_i),
        .s_no_increment_i_Q(s_no_increment_i),
        .s_offset_Q(s_offset),
        .s_return_add_i_Q(s_return_add_i),
        .s_return_update_i_Q(s_return_update_i),
        .s_taken_i_Q(s_taken_i),
        .bht_s_branch_bht_update_i_D(compute_bht_s_branch_bht_update_i_D_wire),
        .bht_s_branch_instr_addr_i_D(compute_bht_s_branch_instr_addr_i_D_wire),
        .bht_s_flush_i_D(compute_bht_s_flush_i_D_wire),
        .bht_s_instr_addr_i_D(compute_bht_s_instr_addr_i_D_wire),
        .bht_s_is_branch_i_D(compute_bht_s_is_branch_i_D_wire),
        .bht_s_predict_valid_i_D(compute_bht_s_predict_valid_i_D_wire),
        .bht_s_taken_i_D(compute_bht_s_taken_i_D_wire),
        .btb_s_branch_btb_update_i_D(compute_btb_s_branch_btb_update_i_D_wire),
        .btb_s_branch_instr_addr_i_D(compute_btb_s_branch_instr_addr_i_D_wire),
        .btb_s_flush_i_D(compute_btb_s_flush_i_D_wire),
        .btb_s_flush_line_i_D(compute_btb_s_flush_line_i_D_wire),
        .btb_s_instr_addr_i_D(compute_btb_s_instr_addr_i_D_wire),
        .btb_s_is_branch_i_D(compute_btb_s_is_branch_i_D_wire),
        .btb_s_is_jump_i_D(compute_btb_s_is_jump_i_D_wire),
        .btb_s_link_return_i_D(compute_btb_s_link_return_i_D_wire),
        .btb_s_offset_i_D(compute_btb_s_offset_i_D_wire),
        .btb_s_return_add_i_D(compute_btb_s_return_add_i_D_wire),
        .btb_s_return_update_i_D(compute_btb_s_return_update_i_D_wire),
        .s_addr_o_D(s_addr_o),
        .s_addr_offset_D(s_addr_offset),
        .s_branch_instr_add_D(s_branch_instr_add),
        .s_offset_D(s_offset),
        .s_taken_o_D(s_taken_o)
    );

endmodule: codix_berkelium_ca_core_fetch_stage_bp_t
