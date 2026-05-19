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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_ifb_fifo_t' CodAL module.
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

module codix_berkelium_ca_core_fetch_stage_ifb_fifo_t(
    input  logic r_wfi_ce_ICLK,
    input  logic RST,
    input  logic s_clear_i_D,
    input  logic [105:0] s_d_i_D,
    input  logic s_re_i_D,
    input  logic s_we_i_D,
    output logic s_empty_o_Q,
    output logic s_full_o_Q,
    output logic [105:0] s_q_o_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic s_clear_i;
    // CodAL signal/wire
    logic s_re_i;
    // CodAL signal/wire
    logic s_we_i;
    // CodAL signal/wire
    logic [105:0] s_d_i;
    // CodAL signal/wire
    logic s_empty_o;
    // CodAL signal/wire
    logic s_full_o;
    // CodAL signal/wire
    logic [105:0] s_q_o;
    // CodAL signal/wire
    logic [1:0] s_read_ptr_inc;
    // CodAL signal/wire
    logic [1:0] s_read_ptr_inc2;
    // CodAL signal/wire
    logic [1:0] s_write_ptr_inc;
    // CodAL signal/wire
    logic [1:0] s_write_ptr_inc2;
    // CodAL signal/wire
    logic s_pop;
    // CodAL signal/wire
    logic s_push;
    // CodAL signal/wire
    logic s_afull_next;
    // CodAL signal/wire
    logic s_aempty_next;

    // additional declarations:
    logic outputs_rf_fifo_r_RE_wire;
    logic [1:0] outputs_rf_fifo_r_RA_wire;
    logic update_rf_fifo_w_WE_wire;
    logic [1:0] update_rf_fifo_w_WA_wire;
    logic [105:0] update_rf_fifo_w_D_wire;
    logic [105:0] rf_fifo_r_Q_wire;
    logic update_r_read_ptr_WE_wire;
    logic [1:0] update_r_read_ptr_D_wire;
    logic [1:0] r_read_ptr_Q_wire;
    logic update_r_write_ptr_WE_wire;
    logic [1:0] update_r_write_ptr_D_wire;
    logic [1:0] r_write_ptr_Q_wire;
    logic update_r_empty_WE_wire;
    logic update_r_empty_D_wire;
    logic r_empty_Q_wire;
    logic update_r_full_WE_wire;
    logic update_r_full_D_wire;
    logic r_full_Q_wire;
    logic update_r_aempty_WE_wire;
    logic update_r_aempty_D_wire;
    logic r_aempty_Q_wire;
    logic update_r_afull_WE_wire;
    logic update_r_afull_D_wire;
    logic r_afull_Q_wire;

    // child instances inside CodAL module:
    // instance of 's_clear_i' CodAL signal/wire: (single driver)
    assign s_clear_i = s_clear_i_D;
    // instance of 's_re_i' CodAL signal/wire: (single driver)
    assign s_re_i = s_re_i_D;
    // instance of 's_we_i' CodAL signal/wire: (single driver)
    assign s_we_i = s_we_i_D;
    // instance of 's_d_i' CodAL signal/wire: (single driver)
    assign s_d_i = s_d_i_D;
    // instance of 's_empty_o' CodAL signal/wire: (parent port driver(s))
    assign s_empty_o_Q = s_empty_o;
    // instance of 's_full_o' CodAL signal/wire: (parent port driver(s))
    assign s_full_o_Q = s_full_o;
    // instance of 's_q_o' CodAL signal/wire: (parent port driver(s))
    assign s_q_o_Q = s_q_o;
    // CodAL register file instance:
    codix_berkelium_ca_core_fetch_stage_ifb_fifo_rf_fifo_t rf_fifo (
        .CLK(r_wfi_ce_ICLK),
        .r_RE(outputs_rf_fifo_r_RE_wire),
        .r_RA(outputs_rf_fifo_r_RA_wire),
        .w_WE(update_rf_fifo_w_WE_wire),
        .w_WA(update_rf_fifo_w_WA_wire),
        .w_D(update_rf_fifo_w_D_wire),
        .r_Q(rf_fifo_r_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_read_ptr (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(update_r_read_ptr_WE_wire),
        .D(update_r_read_ptr_D_wire),
        .Q(r_read_ptr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_write_ptr (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(update_r_write_ptr_WE_wire),
        .D(update_r_write_ptr_D_wire),
        .Q(r_write_ptr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b1),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_empty (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(update_r_empty_WE_wire),
        .D(update_r_empty_D_wire),
        .Q(r_empty_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_full (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(update_r_full_WE_wire),
        .D(update_r_full_D_wire),
        .Q(r_full_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_aempty (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(update_r_aempty_WE_wire),
        .D(update_r_aempty_D_wire),
        .Q(r_aempty_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_afull (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(update_r_afull_WE_wire),
        .D(update_r_afull_D_wire),
        .Q(r_afull_Q_wire)
    );

    // functional unit instance:
    codix_berkelium_ca_core_fetch_stage_ifb_fifo_update_t update (
        .r_aempty_Q(r_aempty_Q_wire),
        .r_afull_Q(r_afull_Q_wire),
        .r_empty_Q(r_empty_Q_wire),
        .r_full_Q(r_full_Q_wire),
        .r_read_ptr_Q(r_read_ptr_Q_wire),
        .r_write_ptr_Q(r_write_ptr_Q_wire),
        .s_aempty_next_Q(s_aempty_next),
        .s_afull_next_Q(s_afull_next),
        .s_clear_i_Q(s_clear_i),
        .s_d_i_Q(s_d_i),
        .s_pop_Q(s_pop),
        .s_push_Q(s_push),
        .s_re_i_Q(s_re_i),
        .s_read_ptr_inc2_Q(s_read_ptr_inc2),
        .s_read_ptr_inc_Q(s_read_ptr_inc),
        .s_we_i_Q(s_we_i),
        .s_write_ptr_inc2_Q(s_write_ptr_inc2),
        .s_write_ptr_inc_Q(s_write_ptr_inc),
        .r_aempty_D(update_r_aempty_D_wire),
        .r_aempty_WE(update_r_aempty_WE_wire),
        .r_afull_D(update_r_afull_D_wire),
        .r_afull_WE(update_r_afull_WE_wire),
        .r_empty_D(update_r_empty_D_wire),
        .r_empty_WE(update_r_empty_WE_wire),
        .r_full_D(update_r_full_D_wire),
        .r_full_WE(update_r_full_WE_wire),
        .r_read_ptr_D(update_r_read_ptr_D_wire),
        .r_read_ptr_WE(update_r_read_ptr_WE_wire),
        .r_write_ptr_D(update_r_write_ptr_D_wire),
        .r_write_ptr_WE(update_r_write_ptr_WE_wire),
        .rf_fifo_w_D(update_rf_fifo_w_D_wire),
        .rf_fifo_w_WA(update_rf_fifo_w_WA_wire),
        .rf_fifo_w_WE(update_rf_fifo_w_WE_wire),
        .s_aempty_next_D(s_aempty_next),
        .s_afull_next_D(s_afull_next),
        .s_pop_D(s_pop),
        .s_push_D(s_push),
        .s_read_ptr_inc2_D(s_read_ptr_inc2),
        .s_read_ptr_inc_D(s_read_ptr_inc),
        .s_write_ptr_inc2_D(s_write_ptr_inc2),
        .s_write_ptr_inc_D(s_write_ptr_inc)
    );

    // functional unit instance:
    codix_berkelium_ca_core_fetch_stage_ifb_fifo_outputs_t outputs (
        .r_empty_Q(r_empty_Q_wire),
        .r_full_Q(r_full_Q_wire),
        .r_read_ptr_Q(r_read_ptr_Q_wire),
        .rf_fifo_r_Q(rf_fifo_r_Q_wire),
        .rf_fifo_r_RA(outputs_rf_fifo_r_RA_wire),
        .rf_fifo_r_RE(outputs_rf_fifo_r_RE_wire),
        .s_empty_o_D(s_empty_o),
        .s_full_o_D(s_full_o),
        .s_q_o_D(s_q_o)
    );

endmodule: codix_berkelium_ca_core_fetch_stage_ifb_fifo_t
