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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_decode_stage_tgm_t' CodAL module.
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

module codix_berkelium_ca_core_decode_stage_tgm_t(
    input  logic [31:0] s_fetch_addr_i_D,
    input  logic [31:0] s_ldst_addr_i_D,
    input  logic [7:0] s_ldst_cmd_i_D,
    input  logic s_progbuf_mode_i_D,
    input  logic [1:0] s_prv_i_D,
    input  logic tg_0_s_trigger_action_o_Q,
    input  logic tg_0_s_trigger_fire_o_Q,
    input  logic tg_1_s_trigger_action_o_Q,
    input  logic tg_1_s_trigger_fire_o_Q,
    input  logic tg_2_s_trigger_action_o_Q,
    input  logic tg_2_s_trigger_fire_o_Q,
    input  logic tg_3_s_trigger_action_o_Q,
    input  logic tg_3_s_trigger_fire_o_Q,
    input  logic tg_4_s_trigger_action_o_Q,
    input  logic tg_4_s_trigger_fire_o_Q,
    input  logic tg_5_s_trigger_action_o_Q,
    input  logic tg_5_s_trigger_fire_o_Q,
    input  logic tg_6_s_trigger_action_o_Q,
    input  logic tg_6_s_trigger_fire_o_Q,
    input  logic tg_7_s_trigger_action_o_Q,
    input  logic tg_7_s_trigger_fire_o_Q,
    output logic [4:0] s_trigger_action_o_Q,
    output logic s_trigger_fire_o_Q,
    output logic [31:0] tg_0_s_fetch_addr_i_D,
    output logic [31:0] tg_0_s_ldst_addr_i_D,
    output logic [7:0] tg_0_s_ldst_cmd_i_D,
    output logic [1:0] tg_0_s_prv_i_D,
    output logic [31:0] tg_1_s_fetch_addr_i_D,
    output logic [31:0] tg_1_s_ldst_addr_i_D,
    output logic [7:0] tg_1_s_ldst_cmd_i_D,
    output logic [1:0] tg_1_s_prv_i_D,
    output logic [31:0] tg_2_s_fetch_addr_i_D,
    output logic [31:0] tg_2_s_ldst_addr_i_D,
    output logic [7:0] tg_2_s_ldst_cmd_i_D,
    output logic [1:0] tg_2_s_prv_i_D,
    output logic [31:0] tg_3_s_fetch_addr_i_D,
    output logic [31:0] tg_3_s_ldst_addr_i_D,
    output logic [7:0] tg_3_s_ldst_cmd_i_D,
    output logic [1:0] tg_3_s_prv_i_D,
    output logic [31:0] tg_4_s_fetch_addr_i_D,
    output logic [31:0] tg_4_s_ldst_addr_i_D,
    output logic [7:0] tg_4_s_ldst_cmd_i_D,
    output logic [1:0] tg_4_s_prv_i_D,
    output logic [31:0] tg_5_s_fetch_addr_i_D,
    output logic [31:0] tg_5_s_ldst_addr_i_D,
    output logic [7:0] tg_5_s_ldst_cmd_i_D,
    output logic [1:0] tg_5_s_prv_i_D,
    output logic [31:0] tg_6_s_fetch_addr_i_D,
    output logic [31:0] tg_6_s_ldst_addr_i_D,
    output logic [7:0] tg_6_s_ldst_cmd_i_D,
    output logic [1:0] tg_6_s_prv_i_D,
    output logic [31:0] tg_7_s_fetch_addr_i_D,
    output logic [31:0] tg_7_s_ldst_addr_i_D,
    output logic [7:0] tg_7_s_ldst_cmd_i_D,
    output logic [1:0] tg_7_s_prv_i_D
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic [31:0] s_fetch_addr_i;
    // CodAL signal/wire
    logic [31:0] s_ldst_addr_i;
    // CodAL signal/wire
    logic [1:0] s_prv_i;
    // CodAL signal/wire
    logic [7:0] s_ldst_cmd_i;
    // CodAL signal/wire
    logic s_progbuf_mode_i;
    // CodAL signal/wire
    logic s_trigger_fire_o;
    // CodAL signal/wire
    logic [4:0] s_trigger_action_o;

    // child instances inside CodAL module:
    // instance of 's_fetch_addr_i' CodAL signal/wire: (single driver)
    assign s_fetch_addr_i = s_fetch_addr_i_D;
    // instance of 's_ldst_addr_i' CodAL signal/wire: (single driver)
    assign s_ldst_addr_i = s_ldst_addr_i_D;
    // instance of 's_prv_i' CodAL signal/wire: (single driver)
    assign s_prv_i = s_prv_i_D;
    // instance of 's_ldst_cmd_i' CodAL signal/wire: (single driver)
    assign s_ldst_cmd_i = s_ldst_cmd_i_D;
    // instance of 's_progbuf_mode_i' CodAL signal/wire: (single driver)
    assign s_progbuf_mode_i = s_progbuf_mode_i_D;
    // instance of 's_trigger_fire_o' CodAL signal/wire: (parent port driver(s))
    assign s_trigger_fire_o_Q = s_trigger_fire_o;
    // instance of 's_trigger_action_o' CodAL signal/wire: (parent port driver(s))
    assign s_trigger_action_o_Q = s_trigger_action_o;
    // functional unit instance:
    codix_berkelium_ca_core_decode_stage_tgm_ocd_trigger_t ocd_trigger (
        .s_fetch_addr_i_Q(s_fetch_addr_i),
        .s_ldst_addr_i_Q(s_ldst_addr_i),
        .s_ldst_cmd_i_Q(s_ldst_cmd_i),
        .s_progbuf_mode_i_Q(s_progbuf_mode_i),
        .s_prv_i_Q(s_prv_i),
        .tg_0_s_trigger_action_o_Q(tg_0_s_trigger_action_o_Q),
        .tg_0_s_trigger_fire_o_Q(tg_0_s_trigger_fire_o_Q),
        .tg_1_s_trigger_action_o_Q(tg_1_s_trigger_action_o_Q),
        .tg_1_s_trigger_fire_o_Q(tg_1_s_trigger_fire_o_Q),
        .tg_2_s_trigger_action_o_Q(tg_2_s_trigger_action_o_Q),
        .tg_2_s_trigger_fire_o_Q(tg_2_s_trigger_fire_o_Q),
        .tg_3_s_trigger_action_o_Q(tg_3_s_trigger_action_o_Q),
        .tg_3_s_trigger_fire_o_Q(tg_3_s_trigger_fire_o_Q),
        .tg_4_s_trigger_action_o_Q(tg_4_s_trigger_action_o_Q),
        .tg_4_s_trigger_fire_o_Q(tg_4_s_trigger_fire_o_Q),
        .tg_5_s_trigger_action_o_Q(tg_5_s_trigger_action_o_Q),
        .tg_5_s_trigger_fire_o_Q(tg_5_s_trigger_fire_o_Q),
        .tg_6_s_trigger_action_o_Q(tg_6_s_trigger_action_o_Q),
        .tg_6_s_trigger_fire_o_Q(tg_6_s_trigger_fire_o_Q),
        .tg_7_s_trigger_action_o_Q(tg_7_s_trigger_action_o_Q),
        .tg_7_s_trigger_fire_o_Q(tg_7_s_trigger_fire_o_Q),
        .s_trigger_action_o_D(s_trigger_action_o),
        .s_trigger_fire_o_D(s_trigger_fire_o),
        .tg_0_s_fetch_addr_i_D(tg_0_s_fetch_addr_i_D),
        .tg_0_s_ldst_addr_i_D(tg_0_s_ldst_addr_i_D),
        .tg_0_s_ldst_cmd_i_D(tg_0_s_ldst_cmd_i_D),
        .tg_0_s_prv_i_D(tg_0_s_prv_i_D),
        .tg_1_s_fetch_addr_i_D(tg_1_s_fetch_addr_i_D),
        .tg_1_s_ldst_addr_i_D(tg_1_s_ldst_addr_i_D),
        .tg_1_s_ldst_cmd_i_D(tg_1_s_ldst_cmd_i_D),
        .tg_1_s_prv_i_D(tg_1_s_prv_i_D),
        .tg_2_s_fetch_addr_i_D(tg_2_s_fetch_addr_i_D),
        .tg_2_s_ldst_addr_i_D(tg_2_s_ldst_addr_i_D),
        .tg_2_s_ldst_cmd_i_D(tg_2_s_ldst_cmd_i_D),
        .tg_2_s_prv_i_D(tg_2_s_prv_i_D),
        .tg_3_s_fetch_addr_i_D(tg_3_s_fetch_addr_i_D),
        .tg_3_s_ldst_addr_i_D(tg_3_s_ldst_addr_i_D),
        .tg_3_s_ldst_cmd_i_D(tg_3_s_ldst_cmd_i_D),
        .tg_3_s_prv_i_D(tg_3_s_prv_i_D),
        .tg_4_s_fetch_addr_i_D(tg_4_s_fetch_addr_i_D),
        .tg_4_s_ldst_addr_i_D(tg_4_s_ldst_addr_i_D),
        .tg_4_s_ldst_cmd_i_D(tg_4_s_ldst_cmd_i_D),
        .tg_4_s_prv_i_D(tg_4_s_prv_i_D),
        .tg_5_s_fetch_addr_i_D(tg_5_s_fetch_addr_i_D),
        .tg_5_s_ldst_addr_i_D(tg_5_s_ldst_addr_i_D),
        .tg_5_s_ldst_cmd_i_D(tg_5_s_ldst_cmd_i_D),
        .tg_5_s_prv_i_D(tg_5_s_prv_i_D),
        .tg_6_s_fetch_addr_i_D(tg_6_s_fetch_addr_i_D),
        .tg_6_s_ldst_addr_i_D(tg_6_s_ldst_addr_i_D),
        .tg_6_s_ldst_cmd_i_D(tg_6_s_ldst_cmd_i_D),
        .tg_6_s_prv_i_D(tg_6_s_prv_i_D),
        .tg_7_s_fetch_addr_i_D(tg_7_s_fetch_addr_i_D),
        .tg_7_s_ldst_addr_i_D(tg_7_s_ldst_addr_i_D),
        .tg_7_s_ldst_cmd_i_D(tg_7_s_ldst_cmd_i_D),
        .tg_7_s_prv_i_D(tg_7_s_prv_i_D)
    );

endmodule: codix_berkelium_ca_core_decode_stage_tgm_t
