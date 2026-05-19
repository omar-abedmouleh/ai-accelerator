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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_decode_stage_aligner_t' CodAL module.
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

module codix_berkelium_ca_core_decode_stage_aligner_t(
    input  logic r_wfi_ce_ICLK,
    input  logic RST,
    input  logic [31:0] s_addr_i_D,
    input  logic [31:0] s_bp_addr_i_D,
    input  logic [1:0] s_bp_taken_i_D,
    input  logic [31:0] s_data_i_D,
    input  logic [4:0] s_exc_type_i_D,
    input  logic s_exc_valid_i_D,
    input  logic s_flush_i_D,
    input  logic s_update_i_D,
    input  logic [1:0] s_valid_i_D,
    output logic [31:0] s_addr_o_Q,
    output logic [31:0] s_bp_addr_o_Q,
    output logic s_bp_rvi_noincr_o_Q,
    output logic s_bp_taken_o_Q,
    output logic [31:0] s_exc_tval_o_Q,
    output logic [4:0] s_exc_type_o_Q,
    output logic s_exc_valid_o_Q,
    output logic [31:0] s_instr_o_Q,
    output logic s_pop_o_Q,
    output logic s_rvc_instr_o_Q,
    output logic s_rvi_broken_o_Q,
    output logic [1:0] s_valid_i_Q,
    output logic s_valid_o_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic [31:0] s_bp_addr_i;
    // CodAL signal/wire
    logic [1:0] s_bp_taken_i;
    // CodAL signal/wire
    logic [31:0] s_addr_i;
    // CodAL signal/wire
    logic [31:0] s_data_i;
    // CodAL signal/wire
    logic [1:0] s_valid_i;
    // CodAL signal/wire
    logic [4:0] s_exc_type_i;
    // CodAL signal/wire
    logic s_exc_valid_i;
    // CodAL signal/wire
    logic s_flush_i;
    // CodAL signal/wire
    logic s_update_i;
    // CodAL signal/wire
    logic [31:0] s_bp_addr_o;
    // CodAL signal/wire
    logic s_bp_taken_o;
    // CodAL signal/wire
    logic s_rvi_broken_o;
    // CodAL signal/wire
    logic s_bp_rvi_noincr_o;
    // CodAL signal/wire
    logic [31:0] s_addr_o;
    // CodAL signal/wire
    logic [31:0] s_instr_o;
    // CodAL signal/wire
    logic s_rvc_instr_o;
    // CodAL signal/wire
    logic s_valid_o;
    // CodAL signal/wire
    logic s_pop_o;
    // CodAL signal/wire
    logic [4:0] s_exc_type_o;
    // CodAL signal/wire
    logic s_exc_valid_o;
    // CodAL signal/wire
    logic [31:0] s_exc_tval_o;
    // CodAL signal/wire
    logic [31:0] s_rem_bp_addr_d;
    // CodAL signal/wire
    logic s_rem_bp_taken_d;
    // CodAL signal/wire
    logic [31:0] s_rem_addr_d;
    // CodAL signal/wire
    logic [15:0] s_rem_data_d;
    // CodAL signal/wire
    logic s_rem_valid_d;
    // CodAL signal/wire
    logic [4:0] s_rem_exc_type_d;
    // CodAL signal/wire
    logic s_rem_exc_valid_d;

    // additional declarations:
    logic update_r_rem_bp_addr_WE_wire;
    logic [31:0] update_r_rem_bp_addr_D_wire;
    logic [31:0] r_rem_bp_addr_Q_wire;
    logic update_r_rem_bp_taken_WE_wire;
    logic update_r_rem_bp_taken_D_wire;
    logic r_rem_bp_taken_Q_wire;
    logic update_r_rem_addr_WE_wire;
    logic [31:0] update_r_rem_addr_D_wire;
    logic [31:0] r_rem_addr_Q_wire;
    logic update_r_rem_data_WE_wire;
    logic [15:0] update_r_rem_data_D_wire;
    logic [15:0] r_rem_data_Q_wire;
    logic update_r_rem_valid_WE_wire;
    logic update_r_rem_valid_D_wire;
    logic r_rem_valid_Q_wire;
    logic update_r_rem_exc_type_WE_wire;
    logic [4:0] update_r_rem_exc_type_D_wire;
    logic [4:0] r_rem_exc_type_Q_wire;
    logic update_r_rem_exc_valid_WE_wire;
    logic update_r_rem_exc_valid_D_wire;
    logic r_rem_exc_valid_Q_wire;

    // child instances inside CodAL module:
    // instance of 's_bp_addr_i' CodAL signal/wire: (single driver)
    assign s_bp_addr_i = s_bp_addr_i_D;
    // instance of 's_bp_taken_i' CodAL signal/wire: (single driver)
    assign s_bp_taken_i = s_bp_taken_i_D;
    // instance of 's_addr_i' CodAL signal/wire: (single driver)
    assign s_addr_i = s_addr_i_D;
    // instance of 's_data_i' CodAL signal/wire: (single driver)
    assign s_data_i = s_data_i_D;
    // instance of 's_valid_i' CodAL signal/wire: (single driver)
    assign s_valid_i = s_valid_i_D;
    // instance of 's_valid_i' CodAL signal/wire: (parent port driver(s))
    assign s_valid_i_Q = s_valid_i;
    // instance of 's_exc_type_i' CodAL signal/wire: (single driver)
    assign s_exc_type_i = s_exc_type_i_D;
    // instance of 's_exc_valid_i' CodAL signal/wire: (single driver)
    assign s_exc_valid_i = s_exc_valid_i_D;
    // instance of 's_flush_i' CodAL signal/wire: (single driver)
    assign s_flush_i = s_flush_i_D;
    // instance of 's_update_i' CodAL signal/wire: (single driver)
    assign s_update_i = s_update_i_D;
    // instance of 's_bp_addr_o' CodAL signal/wire: (parent port driver(s))
    assign s_bp_addr_o_Q = s_bp_addr_o;
    // instance of 's_bp_taken_o' CodAL signal/wire: (parent port driver(s))
    assign s_bp_taken_o_Q = s_bp_taken_o;
    // instance of 's_rvi_broken_o' CodAL signal/wire: (parent port driver(s))
    assign s_rvi_broken_o_Q = s_rvi_broken_o;
    // instance of 's_bp_rvi_noincr_o' CodAL signal/wire: (parent port driver(s))
    assign s_bp_rvi_noincr_o_Q = s_bp_rvi_noincr_o;
    // instance of 's_addr_o' CodAL signal/wire: (parent port driver(s))
    assign s_addr_o_Q = s_addr_o;
    // instance of 's_instr_o' CodAL signal/wire: (parent port driver(s))
    assign s_instr_o_Q = s_instr_o;
    // instance of 's_rvc_instr_o' CodAL signal/wire: (parent port driver(s))
    assign s_rvc_instr_o_Q = s_rvc_instr_o;
    // instance of 's_valid_o' CodAL signal/wire: (parent port driver(s))
    assign s_valid_o_Q = s_valid_o;
    // instance of 's_pop_o' CodAL signal/wire: (parent port driver(s))
    assign s_pop_o_Q = s_pop_o;
    // instance of 's_exc_type_o' CodAL signal/wire: (parent port driver(s))
    assign s_exc_type_o_Q = s_exc_type_o;
    // instance of 's_exc_valid_o' CodAL signal/wire: (parent port driver(s))
    assign s_exc_valid_o_Q = s_exc_valid_o;
    // instance of 's_exc_tval_o' CodAL signal/wire: (parent port driver(s))
    assign s_exc_tval_o_Q = s_exc_tval_o;
    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rem_bp_addr (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(update_r_rem_bp_addr_WE_wire),
        .D(update_r_rem_bp_addr_D_wire),
        .Q(r_rem_bp_addr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rem_bp_taken (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(update_r_rem_bp_taken_WE_wire),
        .D(update_r_rem_bp_taken_D_wire),
        .Q(r_rem_bp_taken_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rem_addr (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(update_r_rem_addr_WE_wire),
        .D(update_r_rem_addr_D_wire),
        .Q(r_rem_addr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd16),
        .DEFAULT_VALUE(16'h0000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rem_data (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(update_r_rem_data_WE_wire),
        .D(update_r_rem_data_D_wire),
        .Q(r_rem_data_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rem_valid (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(update_r_rem_valid_WE_wire),
        .D(update_r_rem_valid_D_wire),
        .Q(r_rem_valid_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rem_exc_type (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(update_r_rem_exc_type_WE_wire),
        .D(update_r_rem_exc_type_D_wire),
        .Q(r_rem_exc_type_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rem_exc_valid (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(update_r_rem_exc_valid_WE_wire),
        .D(update_r_rem_exc_valid_D_wire),
        .Q(r_rem_exc_valid_Q_wire)
    );

    // functional unit instance:
    codix_berkelium_ca_core_decode_stage_aligner_align_t align (
        .r_rem_addr_Q(r_rem_addr_Q_wire),
        .r_rem_bp_addr_Q(r_rem_bp_addr_Q_wire),
        .r_rem_bp_taken_Q(r_rem_bp_taken_Q_wire),
        .r_rem_data_Q(r_rem_data_Q_wire),
        .r_rem_exc_type_Q(r_rem_exc_type_Q_wire),
        .r_rem_exc_valid_Q(r_rem_exc_valid_Q_wire),
        .r_rem_valid_Q(r_rem_valid_Q_wire),
        .s_addr_i_Q(s_addr_i),
        .s_bp_addr_i_Q(s_bp_addr_i),
        .s_bp_taken_i_Q(s_bp_taken_i),
        .s_data_i_Q(s_data_i),
        .s_exc_type_i_Q(s_exc_type_i),
        .s_exc_valid_i_Q(s_exc_valid_i),
        .s_instr_o_Q(s_instr_o[1:0]),
        .s_valid_i_Q(s_valid_i),
        .s_valid_o_Q(s_valid_o),
        .s_addr_o_D(s_addr_o),
        .s_bp_addr_o_D(s_bp_addr_o),
        .s_bp_rvi_noincr_o_D(s_bp_rvi_noincr_o),
        .s_bp_taken_o_D(s_bp_taken_o),
        .s_exc_tval_o_D(s_exc_tval_o),
        .s_exc_type_o_D(s_exc_type_o),
        .s_exc_valid_o_D(s_exc_valid_o),
        .s_instr_o_D(s_instr_o),
        .s_pop_o_D(s_pop_o),
        .s_rem_addr_d_D(s_rem_addr_d),
        .s_rem_bp_addr_d_D(s_rem_bp_addr_d),
        .s_rem_bp_taken_d_D(s_rem_bp_taken_d),
        .s_rem_data_d_D(s_rem_data_d),
        .s_rem_exc_type_d_D(s_rem_exc_type_d),
        .s_rem_exc_valid_d_D(s_rem_exc_valid_d),
        .s_rem_valid_d_D(s_rem_valid_d),
        .s_rvc_instr_o_D(s_rvc_instr_o),
        .s_rvi_broken_o_D(s_rvi_broken_o),
        .s_valid_o_D(s_valid_o)
    );

    // functional unit instance:
    codix_berkelium_ca_core_decode_stage_aligner_update_t update (
        .s_flush_i_Q(s_flush_i),
        .s_rem_addr_d_Q(s_rem_addr_d),
        .s_rem_bp_addr_d_Q(s_rem_bp_addr_d),
        .s_rem_bp_taken_d_Q(s_rem_bp_taken_d),
        .s_rem_data_d_Q(s_rem_data_d),
        .s_rem_exc_type_d_Q(s_rem_exc_type_d),
        .s_rem_exc_valid_d_Q(s_rem_exc_valid_d),
        .s_rem_valid_d_Q(s_rem_valid_d),
        .s_update_i_Q(s_update_i),
        .s_valid_o_Q(s_valid_o),
        .r_rem_addr_D(update_r_rem_addr_D_wire),
        .r_rem_addr_WE(update_r_rem_addr_WE_wire),
        .r_rem_bp_addr_D(update_r_rem_bp_addr_D_wire),
        .r_rem_bp_addr_WE(update_r_rem_bp_addr_WE_wire),
        .r_rem_bp_taken_D(update_r_rem_bp_taken_D_wire),
        .r_rem_bp_taken_WE(update_r_rem_bp_taken_WE_wire),
        .r_rem_data_D(update_r_rem_data_D_wire),
        .r_rem_data_WE(update_r_rem_data_WE_wire),
        .r_rem_exc_type_D(update_r_rem_exc_type_D_wire),
        .r_rem_exc_type_WE(update_r_rem_exc_type_WE_wire),
        .r_rem_exc_valid_D(update_r_rem_exc_valid_D_wire),
        .r_rem_exc_valid_WE(update_r_rem_exc_valid_WE_wire),
        .r_rem_valid_D(update_r_rem_valid_D_wire),
        .r_rem_valid_WE(update_r_rem_valid_WE_wire)
    );

endmodule: codix_berkelium_ca_core_decode_stage_aligner_t
