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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_bp_btb_t' CodAL module.
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

module codix_berkelium_ca_core_fetch_stage_bp_btb_t(
    input  logic fetch_stage_bp_btb_s_is_branch_i_ICLK,
    input  logic fetch_stage_bp_btb_s_is_jump_i_ICLK,
    input  logic r_wfi_ce_ICLK,
    input  logic RST,
    input  logic s_branch_btb_update_i_D,
    input  logic [31:0] s_branch_instr_addr_i_D,
    input  logic s_flush_i_D,
    input  logic s_flush_line_i_D,
    input  logic [31:0] s_instr_addr_i_D,
    input  logic s_is_branch_i_D,
    input  logic s_is_jump_i_D,
    input  logic s_link_return_i_D,
    input  logic [31:0] s_offset_i_D,
    input  logic [31:0] s_return_add_i_D,
    input  logic s_return_update_i_D,
    output logic [31:0] s_addr_o_Q,
    output logic [31:0] s_alt_addr_o_Q,
    output logic s_is_branch_i_Q,
    output logic s_is_jump_i_Q,
    output logic [1:0] s_is_jump_o_Q,
    output logic s_predict_valid_o_Q,
    output logic [1:0] s_valid_o_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic [31:0] s_instr_addr_i;
    // CodAL signal/wire
    logic [31:0] s_branch_instr_addr_i;
    // CodAL signal/wire
    logic [31:0] s_offset_i;
    // CodAL signal/wire
    logic s_branch_btb_update_i;
    // CodAL signal/wire
    logic s_flush_i;
    // CodAL signal/wire
    logic s_flush_line_i;
    // CodAL signal/wire
    logic s_is_jump_i;
    // CodAL signal/wire
    logic s_is_branch_i;
    // CodAL signal/wire
    logic s_return_update_i;
    // CodAL signal/wire
    logic s_link_return_i;
    // CodAL signal/wire
    logic [31:0] s_return_add_i;
    // CodAL signal/wire
    logic [31:0] s_addr_o;
    // CodAL signal/wire
    logic [31:0] s_alt_addr_o;
    // CodAL signal/wire
    logic [1:0] s_valid_o;
    // CodAL signal/wire
    logic [1:0] s_is_jump_o;
    // CodAL signal/wire
    logic s_predict_valid_o;

    // additional declarations:
    logic update_r_btb_valid_WE_wire;
    logic [63:0] update_r_btb_valid_D_wire;
    logic [63:0] r_btb_valid_Q_wire;
    logic predict_rf_btb_data_p0_RE_wire;
    logic [5:0] predict_rf_btb_data_p0_RA_wire;
    logic update_rf_btb_data_w0_WE_wire;
    logic [5:0] update_rf_btb_data_w0_WA_wire;
    logic [20:0] update_rf_btb_data_w0_D_wire;
    logic [20:0] rf_btb_data_p0_Q_wire;
    logic update_r_jtb_valid_WE_wire;
    logic [15:0] update_r_jtb_valid_D_wire;
    logic [15:0] r_jtb_valid_Q_wire;
    logic predict_rf_jtb_data_p0_RE_wire;
    logic [3:0] predict_rf_jtb_data_p0_RA_wire;
    logic update_rf_jtb_data_w0_WE_wire;
    logic [3:0] update_rf_jtb_data_w0_WA_wire;
    logic [30:0] update_rf_jtb_data_w0_D_wire;
    logic [30:0] rf_jtb_data_p0_Q_wire;
    logic update_r_rab_valid_WE_wire;
    logic update_r_rab_valid_D_wire;
    logic r_rab_valid_Q_wire;
    logic update_r_return_add_WE_wire;
    logic [30:0] update_r_return_add_D_wire;
    logic [30:0] r_return_add_Q_wire;
    logic update_r_return_instr_WE_wire;
    logic [30:0] update_r_return_instr_D_wire;
    logic [30:0] r_return_instr_Q_wire;

    // child instances inside CodAL module:
    // instance of 's_instr_addr_i' CodAL signal/wire: (single driver)
    assign s_instr_addr_i = s_instr_addr_i_D;
    // instance of 's_branch_instr_addr_i' CodAL signal/wire: (single driver)
    assign s_branch_instr_addr_i = s_branch_instr_addr_i_D;
    // instance of 's_offset_i' CodAL signal/wire: (single driver)
    assign s_offset_i = s_offset_i_D;
    // instance of 's_branch_btb_update_i' CodAL signal/wire: (single driver)
    assign s_branch_btb_update_i = s_branch_btb_update_i_D;
    // instance of 's_flush_i' CodAL signal/wire: (single driver)
    assign s_flush_i = s_flush_i_D;
    // instance of 's_flush_line_i' CodAL signal/wire: (single driver)
    assign s_flush_line_i = s_flush_line_i_D;
    // instance of 's_is_jump_i' CodAL signal/wire: (single driver)
    assign s_is_jump_i = s_is_jump_i_D;
    // instance of 's_is_jump_i' CodAL signal/wire: (parent port driver(s))
    assign s_is_jump_i_Q = s_is_jump_i;
    // instance of 's_is_branch_i' CodAL signal/wire: (single driver)
    assign s_is_branch_i = s_is_branch_i_D;
    // instance of 's_is_branch_i' CodAL signal/wire: (parent port driver(s))
    assign s_is_branch_i_Q = s_is_branch_i;
    // instance of 's_return_update_i' CodAL signal/wire: (single driver)
    assign s_return_update_i = s_return_update_i_D;
    // instance of 's_link_return_i' CodAL signal/wire: (single driver)
    assign s_link_return_i = s_link_return_i_D;
    // instance of 's_return_add_i' CodAL signal/wire: (single driver)
    assign s_return_add_i = s_return_add_i_D;
    // instance of 's_addr_o' CodAL signal/wire: (parent port driver(s))
    assign s_addr_o_Q = s_addr_o;
    // instance of 's_alt_addr_o' CodAL signal/wire: (parent port driver(s))
    assign s_alt_addr_o_Q = s_alt_addr_o;
    // instance of 's_valid_o' CodAL signal/wire: (parent port driver(s))
    assign s_valid_o_Q = s_valid_o;
    // instance of 's_is_jump_o' CodAL signal/wire: (parent port driver(s))
    assign s_is_jump_o_Q = s_is_jump_o;
    // instance of 's_predict_valid_o' CodAL signal/wire: (parent port driver(s))
    assign s_predict_valid_o_Q = s_predict_valid_o;
    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd64),
        .DEFAULT_VALUE(64'h0000000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_btb_valid (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(update_r_btb_valid_WE_wire),
        .D(update_r_btb_valid_D_wire),
        .Q(r_btb_valid_Q_wire)
    );

    // CodAL register file instance:
    codix_berkelium_ca_core_fetch_stage_bp_btb_rf_btb_data_t rf_btb_data (
        .CLK(fetch_stage_bp_btb_s_is_branch_i_ICLK),
        .p0_RE(predict_rf_btb_data_p0_RE_wire),
        .p0_RA(predict_rf_btb_data_p0_RA_wire),
        .w0_WE(update_rf_btb_data_w0_WE_wire),
        .w0_WA(update_rf_btb_data_w0_WA_wire),
        .w0_D(update_rf_btb_data_w0_D_wire),
        .p0_Q(rf_btb_data_p0_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd16),
        .DEFAULT_VALUE(16'h0000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_jtb_valid (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(update_r_jtb_valid_WE_wire),
        .D(update_r_jtb_valid_D_wire),
        .Q(r_jtb_valid_Q_wire)
    );

    // CodAL register file instance:
    codix_berkelium_ca_core_fetch_stage_bp_btb_rf_jtb_data_t rf_jtb_data (
        .CLK(fetch_stage_bp_btb_s_is_jump_i_ICLK),
        .p0_RE(predict_rf_jtb_data_p0_RE_wire),
        .p0_RA(predict_rf_jtb_data_p0_RA_wire),
        .w0_WE(update_rf_jtb_data_w0_WE_wire),
        .w0_WA(update_rf_jtb_data_w0_WA_wire),
        .w0_D(update_rf_jtb_data_w0_D_wire),
        .p0_Q(rf_jtb_data_p0_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rab_valid (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(update_r_rab_valid_WE_wire),
        .D(update_r_rab_valid_D_wire),
        .Q(r_rab_valid_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd31),
        .DEFAULT_VALUE(31'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_return_add (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(update_r_return_add_WE_wire),
        .D(update_r_return_add_D_wire),
        .Q(r_return_add_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd31),
        .DEFAULT_VALUE(31'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_return_instr (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(update_r_return_instr_WE_wire),
        .D(update_r_return_instr_D_wire),
        .Q(r_return_instr_Q_wire)
    );

    // functional unit instance:
    codix_berkelium_ca_core_fetch_stage_bp_btb_update_t update (
        .r_btb_valid_Q(r_btb_valid_Q_wire),
        .r_jtb_valid_Q(r_jtb_valid_Q_wire),
        .s_branch_btb_update_i_Q(s_branch_btb_update_i),
        .s_branch_instr_addr_i_Q(s_branch_instr_addr_i[31:1]),
        .s_flush_i_Q(s_flush_i),
        .s_flush_line_i_Q(s_flush_line_i),
        .s_is_jump_i_Q(s_is_jump_i),
        .s_link_return_i_Q(s_link_return_i),
        .s_offset_i_Q(s_offset_i[20:1]),
        .s_return_add_i_Q(s_return_add_i[31:1]),
        .s_return_update_i_Q(s_return_update_i),
        .r_btb_valid_D(update_r_btb_valid_D_wire),
        .r_btb_valid_WE(update_r_btb_valid_WE_wire),
        .r_jtb_valid_D(update_r_jtb_valid_D_wire),
        .r_jtb_valid_WE(update_r_jtb_valid_WE_wire),
        .r_rab_valid_D(update_r_rab_valid_D_wire),
        .r_rab_valid_WE(update_r_rab_valid_WE_wire),
        .r_return_add_D(update_r_return_add_D_wire),
        .r_return_add_WE(update_r_return_add_WE_wire),
        .r_return_instr_D(update_r_return_instr_D_wire),
        .r_return_instr_WE(update_r_return_instr_WE_wire),
        .rf_btb_data_w0_D(update_rf_btb_data_w0_D_wire),
        .rf_btb_data_w0_WA(update_rf_btb_data_w0_WA_wire),
        .rf_btb_data_w0_WE(update_rf_btb_data_w0_WE_wire),
        .rf_jtb_data_w0_D(update_rf_jtb_data_w0_D_wire),
        .rf_jtb_data_w0_WA(update_rf_jtb_data_w0_WA_wire),
        .rf_jtb_data_w0_WE(update_rf_jtb_data_w0_WE_wire)
    );

    // functional unit instance:
    codix_berkelium_ca_core_fetch_stage_bp_btb_predict_t predict (
        .r_btb_valid_Q(r_btb_valid_Q_wire),
        .r_jtb_valid_Q(r_jtb_valid_Q_wire),
        .r_rab_valid_Q(r_rab_valid_Q_wire),
        .r_return_add_Q(r_return_add_Q_wire),
        .r_return_instr_Q(r_return_instr_Q_wire),
        .rf_btb_data_p0_Q(rf_btb_data_p0_Q_wire),
        .rf_jtb_data_p0_Q(rf_jtb_data_p0_Q_wire),
        .s_instr_addr_i_Q(s_instr_addr_i[31:1]),
        .rf_btb_data_p0_RA(predict_rf_btb_data_p0_RA_wire),
        .rf_btb_data_p0_RE(predict_rf_btb_data_p0_RE_wire),
        .rf_jtb_data_p0_RA(predict_rf_jtb_data_p0_RA_wire),
        .rf_jtb_data_p0_RE(predict_rf_jtb_data_p0_RE_wire),
        .s_addr_o_D(s_addr_o),
        .s_alt_addr_o_D(s_alt_addr_o),
        .s_is_jump_o_D(s_is_jump_o),
        .s_predict_valid_o_D(s_predict_valid_o),
        .s_valid_o_D(s_valid_o)
    );

endmodule: codix_berkelium_ca_core_fetch_stage_bp_btb_t
