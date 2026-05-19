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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_bp_bht_t' CodAL module.
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

module codix_berkelium_ca_core_fetch_stage_bp_bht_t(
    input  logic fetch_stage_bp_bht_s_is_branch_i_ICLK,
    input  logic RST,
    input  logic s_branch_bht_update_i_D,
    input  logic [31:0] s_branch_instr_addr_i_D,
    input  logic s_flush_i_D,
    input  logic [31:0] s_instr_addr_i_D,
    input  logic s_is_branch_i_D,
    input  logic s_predict_valid_i_D,
    input  logic s_taken_i_D,
    output logic s_is_branch_i_Q,
    output logic s_taken_o_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic [31:0] s_instr_addr_i;
    // CodAL signal/wire
    logic s_taken_i;
    // CodAL signal/wire
    logic [31:0] s_branch_instr_addr_i;
    // CodAL signal/wire
    logic s_branch_bht_update_i;
    // CodAL signal/wire
    logic s_flush_i;
    // CodAL signal/wire
    logic s_predict_valid_i;
    // CodAL signal/wire
    logic s_is_branch_i;
    // CodAL signal/wire
    logic s_taken_o;
    // CodAL signal/wire
    logic [1:0] s_p0_data;

    // additional declarations:
    logic predict_rf_bht_data_p0_RE_wire;
    logic [6:0] predict_rf_bht_data_p0_RA_wire;
    logic update_rf_bht_data_u0_RE_wire;
    logic [6:0] update_rf_bht_data_u0_RA_wire;
    logic update_rf_bht_data_w0_WE_wire;
    logic [6:0] update_rf_bht_data_w0_WA_wire;
    logic [1:0] update_rf_bht_data_w0_D_wire;
    logic [1:0] rf_bht_data_p0_Q_wire;
    logic [1:0] rf_bht_data_u0_Q_wire;

    // child instances inside CodAL module:
    // instance of 's_instr_addr_i' CodAL signal/wire: (single driver)
    assign s_instr_addr_i = s_instr_addr_i_D;
    // instance of 's_taken_i' CodAL signal/wire: (single driver)
    assign s_taken_i = s_taken_i_D;
    // instance of 's_branch_instr_addr_i' CodAL signal/wire: (single driver)
    assign s_branch_instr_addr_i = s_branch_instr_addr_i_D;
    // instance of 's_branch_bht_update_i' CodAL signal/wire: (single driver)
    assign s_branch_bht_update_i = s_branch_bht_update_i_D;
    // instance of 's_flush_i' CodAL signal/wire: (single driver)
    assign s_flush_i = s_flush_i_D;
    // instance of 's_predict_valid_i' CodAL signal/wire: (single driver)
    assign s_predict_valid_i = s_predict_valid_i_D;
    // instance of 's_is_branch_i' CodAL signal/wire: (single driver)
    assign s_is_branch_i = s_is_branch_i_D;
    // instance of 's_is_branch_i' CodAL signal/wire: (parent port driver(s))
    assign s_is_branch_i_Q = s_is_branch_i;
    // instance of 's_taken_o' CodAL signal/wire: (parent port driver(s))
    assign s_taken_o_Q = s_taken_o;
    // CodAL register file instance:
    codix_berkelium_ca_core_fetch_stage_bp_bht_rf_bht_data_t rf_bht_data (
        .CLK(fetch_stage_bp_bht_s_is_branch_i_ICLK),
        .RST(RST),
        .p0_RE(predict_rf_bht_data_p0_RE_wire),
        .p0_RA(predict_rf_bht_data_p0_RA_wire),
        .u0_RE(update_rf_bht_data_u0_RE_wire),
        .u0_RA(update_rf_bht_data_u0_RA_wire),
        .w0_WE(update_rf_bht_data_w0_WE_wire),
        .w0_WA(update_rf_bht_data_w0_WA_wire),
        .w0_D(update_rf_bht_data_w0_D_wire),
        .p0_Q(rf_bht_data_p0_Q_wire),
        .u0_Q(rf_bht_data_u0_Q_wire)
    );

    // functional unit instance:
    codix_berkelium_ca_core_fetch_stage_bp_bht_update_t update (
        .rf_bht_data_u0_Q(rf_bht_data_u0_Q_wire),
        .s_branch_bht_update_i_Q(s_branch_bht_update_i),
        .s_branch_instr_addr_i_Q(s_branch_instr_addr_i[8:2]),
        .s_flush_i_Q(s_flush_i),
        .s_taken_i_Q(s_taken_i),
        .rf_bht_data_u0_RA(update_rf_bht_data_u0_RA_wire),
        .rf_bht_data_u0_RE(update_rf_bht_data_u0_RE_wire),
        .rf_bht_data_w0_D(update_rf_bht_data_w0_D_wire),
        .rf_bht_data_w0_WA(update_rf_bht_data_w0_WA_wire),
        .rf_bht_data_w0_WE(update_rf_bht_data_w0_WE_wire)
    );

    // functional unit instance:
    codix_berkelium_ca_core_fetch_stage_bp_bht_predict_t predict (
        .rf_bht_data_p0_Q(rf_bht_data_p0_Q_wire),
        .s_instr_addr_i_Q(s_instr_addr_i[8:2]),
        .s_p0_data_Q(s_p0_data[1]),
        .s_predict_valid_i_Q(s_predict_valid_i),
        .rf_bht_data_p0_RA(predict_rf_bht_data_p0_RA_wire),
        .rf_bht_data_p0_RE(predict_rf_bht_data_p0_RE_wire),
        .s_p0_data_D(s_p0_data),
        .s_taken_o_D(s_taken_o)
    );

endmodule: codix_berkelium_ca_core_fetch_stage_bp_bht_t
