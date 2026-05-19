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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_div_t' CodAL module.
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

module codix_berkelium_ca_core_execute_stage_div_t(
    input  logic execute_stage_div_s_div_ce_i_ICLK,
    input  logic RST,
    input  logic div_compute_ACT,
    input  logic s_div_ce_i_D,
    input  logic s_flush_i_D,
    input  logic [7:0] s_op_i_D,
    input  logic [31:0] s_s1_data_i_D,
    input  logic [31:0] s_s2_data_i_D,
    output logic s_busy_o_Q,
    output logic s_div_ce_i_Q,
    output logic [31:0] s_rd_data_o_Q,
    output logic s_rd_valid_o_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic [7:0] s_op_i;
    // CodAL signal/wire
    logic [31:0] s_s1_data_i;
    // CodAL signal/wire
    logic [31:0] s_s2_data_i;
    // CodAL signal/wire
    logic s_flush_i;
    // CodAL signal/wire
    logic s_div_ce_i;
    // CodAL signal/wire
    logic [31:0] s_rd_data_o;
    // CodAL signal/wire
    logic s_rd_valid_o;
    // CodAL signal/wire
    logic s_busy_o;

    // additional declarations:
    logic div_compute_r_state_WE_wire;
    logic [1:0] div_compute_r_state_D_wire;
    logic [1:0] r_state_Q_wire;
    logic div_compute_r_counter_WE_wire;
    logic [5:0] div_compute_r_counter_D_wire;
    logic [5:0] r_counter_Q_wire;
    logic div_compute_r_op_WE_wire;
    logic [7:0] div_compute_r_op_D_wire;
    logic [7:0] r_op_Q_wire;
    logic div_compute_r_sign_WE_wire;
    logic div_compute_r_sign_D_wire;
    logic r_sign_Q_wire;
    logic div_compute_r_den_WE_wire;
    logic [32:0] div_compute_r_den_D_wire;
    logic [32:0] r_den_Q_wire;
    logic div_compute_r_div_WE_wire;
    logic [32:0] div_compute_r_div_D_wire;
    logic [32:0] r_div_Q_wire;
    logic div_compute_r_rem_WE_wire;
    logic [32:0] div_compute_r_rem_D_wire;
    logic [32:0] r_rem_Q_wire;

    // child instances inside CodAL module:
    // instance of 's_op_i' CodAL signal/wire: (single driver)
    assign s_op_i = s_op_i_D;
    // instance of 's_s1_data_i' CodAL signal/wire: (single driver)
    assign s_s1_data_i = s_s1_data_i_D;
    // instance of 's_s2_data_i' CodAL signal/wire: (single driver)
    assign s_s2_data_i = s_s2_data_i_D;
    // instance of 's_flush_i' CodAL signal/wire: (single driver)
    assign s_flush_i = s_flush_i_D;
    // instance of 's_div_ce_i' CodAL signal/wire: (single driver)
    assign s_div_ce_i = s_div_ce_i_D;
    // instance of 's_div_ce_i' CodAL signal/wire: (parent port driver(s))
    assign s_div_ce_i_Q = s_div_ce_i;
    // instance of 's_rd_data_o' CodAL signal/wire: (parent port driver(s))
    assign s_rd_data_o_Q = s_rd_data_o;
    // instance of 's_rd_valid_o' CodAL signal/wire: (parent port driver(s))
    assign s_rd_valid_o_Q = s_rd_valid_o;
    // instance of 's_busy_o' CodAL signal/wire: (parent port driver(s))
    assign s_busy_o_Q = s_busy_o;
    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_state (
        .CLK(execute_stage_div_s_div_ce_i_ICLK),
        .RST(RST),
        .WE(div_compute_r_state_WE_wire),
        .D(div_compute_r_state_D_wire),
        .Q(r_state_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_counter (
        .CLK(execute_stage_div_s_div_ce_i_ICLK),
        .RST(RST),
        .WE(div_compute_r_counter_WE_wire),
        .D(div_compute_r_counter_D_wire),
        .Q(r_counter_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd8),
        .DEFAULT_VALUE(8'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_op (
        .CLK(execute_stage_div_s_div_ce_i_ICLK),
        .RST(RST),
        .WE(div_compute_r_op_WE_wire),
        .D(div_compute_r_op_D_wire),
        .Q(r_op_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_sign (
        .CLK(execute_stage_div_s_div_ce_i_ICLK),
        .RST(RST),
        .WE(div_compute_r_sign_WE_wire),
        .D(div_compute_r_sign_D_wire),
        .Q(r_sign_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd33),
        .DEFAULT_VALUE(33'h000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_den (
        .CLK(execute_stage_div_s_div_ce_i_ICLK),
        .RST(RST),
        .WE(div_compute_r_den_WE_wire),
        .D(div_compute_r_den_D_wire),
        .Q(r_den_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd33),
        .DEFAULT_VALUE(33'h000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_div (
        .CLK(execute_stage_div_s_div_ce_i_ICLK),
        .RST(RST),
        .WE(div_compute_r_div_WE_wire),
        .D(div_compute_r_div_D_wire),
        .Q(r_div_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd33),
        .DEFAULT_VALUE(33'h000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rem (
        .CLK(execute_stage_div_s_div_ce_i_ICLK),
        .RST(RST),
        .WE(div_compute_r_rem_WE_wire),
        .D(div_compute_r_rem_D_wire),
        .Q(r_rem_Q_wire)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_div_div_compute_t div_compute (
        .ACT(div_compute_ACT),
        .r_counter_Q(r_counter_Q_wire),
        .r_den_Q(r_den_Q_wire),
        .r_div_Q(r_div_Q_wire),
        .r_rem_Q(r_rem_Q_wire),
        .r_state_Q(r_state_Q_wire),
        .s_flush_i_Q(s_flush_i),
        .s_op_i_Q(s_op_i),
        .s_s1_data_i_Q(s_s1_data_i),
        .s_s2_data_i_Q(s_s2_data_i),
        .r_counter_D(div_compute_r_counter_D_wire),
        .r_counter_WE(div_compute_r_counter_WE_wire),
        .r_den_D(div_compute_r_den_D_wire),
        .r_den_WE(div_compute_r_den_WE_wire),
        .r_div_D(div_compute_r_div_D_wire),
        .r_div_WE(div_compute_r_div_WE_wire),
        .r_op_D(div_compute_r_op_D_wire),
        .r_op_WE(div_compute_r_op_WE_wire),
        .r_rem_D(div_compute_r_rem_D_wire),
        .r_rem_WE(div_compute_r_rem_WE_wire),
        .r_sign_D(div_compute_r_sign_D_wire),
        .r_sign_WE(div_compute_r_sign_WE_wire),
        .r_state_D(div_compute_r_state_D_wire),
        .r_state_WE(div_compute_r_state_WE_wire)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_div_div_outputs_t div_outputs (
        .r_counter_Q(r_counter_Q_wire),
        .r_div_Q(r_div_Q_wire),
        .r_op_Q(r_op_Q_wire),
        .r_rem_Q(r_rem_Q_wire),
        .r_sign_Q(r_sign_Q_wire),
        .r_state_Q(r_state_Q_wire),
        .s_busy_o_D(s_busy_o),
        .s_rd_data_o_D(s_rd_data_o),
        .s_rd_valid_o_D(s_rd_valid_o)
    );

endmodule: codix_berkelium_ca_core_execute_stage_div_t
