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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_ifb_t' CodAL module.
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

module codix_berkelium_ca_core_fetch_stage_ifb_t(
    input  logic r_wfi_ce_ICLK,
    input  logic RST,
    input  logic [31:0] s_addr_i_D,
    input  logic [31:0] s_bp_addr_i_D,
    input  logic [1:0] s_bp_taken_i_D,
    input  logic [31:0] s_data_i_D,
    input  logic [4:0] s_exc_type_i_D,
    input  logic s_exc_valid_i_D,
    input  logic s_flush_i_D,
    input  logic s_pop_i_D,
    input  logic s_push_i_D,
    input  logic [1:0] s_valid_i_D,
    output logic [31:0] s_addr_o_Q,
    output logic [31:0] s_bp_addr_o_Q,
    output logic [1:0] s_bp_taken_o_Q,
    output logic [31:0] s_data_o_Q,
    output logic s_empty_o_Q,
    output logic [4:0] s_exc_type_o_Q,
    output logic s_exc_valid_o_Q,
    output logic s_full_o_Q,
    output logic [1:0] s_valid_o_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic s_pop_i;
    // CodAL signal/wire
    logic s_push_i;
    // CodAL signal/wire
    logic s_flush_i;
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
    logic s_empty_o;
    // CodAL signal/wire
    logic s_full_o;
    // CodAL signal/wire
    logic [31:0] s_bp_addr_o;
    // CodAL signal/wire
    logic [1:0] s_bp_taken_o;
    // CodAL signal/wire
    logic [31:0] s_addr_o;
    // CodAL signal/wire
    logic [31:0] s_data_o;
    // CodAL signal/wire
    logic [1:0] s_valid_o;
    // CodAL signal/wire
    logic [4:0] s_exc_type_o;
    // CodAL signal/wire
    logic s_exc_valid_o;

    // additional declarations:
    logic ifb_update_fifo_s_clear_i_D_wire;
    logic [105:0] ifb_update_fifo_s_d_i_D_wire;
    logic ifb_update_fifo_s_re_i_D_wire;
    logic ifb_update_fifo_s_we_i_D_wire;
    logic fifo_s_empty_o_Q_wire;
    logic fifo_s_full_o_Q_wire;
    logic [105:0] fifo_s_q_o_Q_wire;

    // child instances inside CodAL module:
    // instance of 's_pop_i' CodAL signal/wire: (single driver)
    assign s_pop_i = s_pop_i_D;
    // instance of 's_push_i' CodAL signal/wire: (single driver)
    assign s_push_i = s_push_i_D;
    // instance of 's_flush_i' CodAL signal/wire: (single driver)
    assign s_flush_i = s_flush_i_D;
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
    // instance of 's_exc_type_i' CodAL signal/wire: (single driver)
    assign s_exc_type_i = s_exc_type_i_D;
    // instance of 's_exc_valid_i' CodAL signal/wire: (single driver)
    assign s_exc_valid_i = s_exc_valid_i_D;
    // instance of 's_empty_o' CodAL signal/wire: (parent port driver(s))
    assign s_empty_o_Q = s_empty_o;
    // instance of 's_full_o' CodAL signal/wire: (parent port driver(s))
    assign s_full_o_Q = s_full_o;
    // instance of 's_bp_addr_o' CodAL signal/wire: (parent port driver(s))
    assign s_bp_addr_o_Q = s_bp_addr_o;
    // instance of 's_bp_taken_o' CodAL signal/wire: (parent port driver(s))
    assign s_bp_taken_o_Q = s_bp_taken_o;
    // instance of 's_addr_o' CodAL signal/wire: (parent port driver(s))
    assign s_addr_o_Q = s_addr_o;
    // instance of 's_data_o' CodAL signal/wire: (parent port driver(s))
    assign s_data_o_Q = s_data_o;
    // instance of 's_valid_o' CodAL signal/wire: (parent port driver(s))
    assign s_valid_o_Q = s_valid_o;
    // instance of 's_exc_type_o' CodAL signal/wire: (parent port driver(s))
    assign s_exc_type_o_Q = s_exc_type_o;
    // instance of 's_exc_valid_o' CodAL signal/wire: (parent port driver(s))
    assign s_exc_valid_o_Q = s_exc_valid_o;
    // CodAL module instance:
    codix_berkelium_ca_core_fetch_stage_ifb_fifo_t fifo (
        .r_wfi_ce_ICLK(r_wfi_ce_ICLK),
        .RST(RST),
        .s_clear_i_D(ifb_update_fifo_s_clear_i_D_wire),
        .s_d_i_D(ifb_update_fifo_s_d_i_D_wire),
        .s_re_i_D(ifb_update_fifo_s_re_i_D_wire),
        .s_we_i_D(ifb_update_fifo_s_we_i_D_wire),
        .s_empty_o_Q(fifo_s_empty_o_Q_wire),
        .s_full_o_Q(fifo_s_full_o_Q_wire),
        .s_q_o_Q(fifo_s_q_o_Q_wire)
    );

    // functional unit instance:
    codix_berkelium_ca_core_fetch_stage_ifb_ifb_update_t ifb_update (
        .s_addr_i_Q(s_addr_i),
        .s_bp_addr_i_Q(s_bp_addr_i),
        .s_bp_taken_i_Q(s_bp_taken_i),
        .s_data_i_Q(s_data_i),
        .s_exc_type_i_Q(s_exc_type_i),
        .s_exc_valid_i_Q(s_exc_valid_i),
        .s_flush_i_Q(s_flush_i),
        .s_pop_i_Q(s_pop_i),
        .s_push_i_Q(s_push_i),
        .s_valid_i_Q(s_valid_i),
        .fifo_s_clear_i_D(ifb_update_fifo_s_clear_i_D_wire),
        .fifo_s_d_i_D(ifb_update_fifo_s_d_i_D_wire),
        .fifo_s_re_i_D(ifb_update_fifo_s_re_i_D_wire),
        .fifo_s_we_i_D(ifb_update_fifo_s_we_i_D_wire)
    );

    // functional unit instance:
    codix_berkelium_ca_core_fetch_stage_ifb_ifb_outputs_t ifb_outputs (
        .fifo_s_empty_o_Q(fifo_s_empty_o_Q_wire),
        .fifo_s_full_o_Q(fifo_s_full_o_Q_wire),
        .fifo_s_q_o_Q(fifo_s_q_o_Q_wire),
        .s_addr_o_D(s_addr_o),
        .s_bp_addr_o_D(s_bp_addr_o),
        .s_bp_taken_o_D(s_bp_taken_o),
        .s_data_o_D(s_data_o),
        .s_empty_o_D(s_empty_o),
        .s_exc_type_o_D(s_exc_type_o),
        .s_exc_valid_o_D(s_exc_valid_o),
        .s_full_o_D(s_full_o),
        .s_valid_o_D(s_valid_o)
    );

endmodule: codix_berkelium_ca_core_fetch_stage_ifb_t
