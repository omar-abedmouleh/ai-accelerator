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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_decode_stage_tg_5_t' CodAL module.
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

module codix_berkelium_ca_core_decode_stage_tg_5_t(
    input  logic r_csr_tcontrol_Q,
    input  logic [31:0] r_csr_tdata1_r5_Q,
    input  logic [31:0] r_csr_tdata2_r5_Q,
    input  logic [31:0] s_fetch_addr_i_D,
    input  logic [31:0] s_ldst_addr_i_D,
    input  logic [7:0] s_ldst_cmd_i_D,
    input  logic [1:0] s_prv_i_D,
    output logic [2:0] r_csr_tdata1_r5_RA,
    output logic r_csr_tdata1_r5_RE,
    output logic [2:0] r_csr_tdata2_r5_RA,
    output logic r_csr_tdata2_r5_RE,
    output logic s_trigger_action_o_Q,
    output logic s_trigger_fire_o_Q
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
    logic s_trigger_fire_o;
    // CodAL signal/wire
    logic s_trigger_action_o;

    // child instances inside CodAL module:
    // instance of 's_fetch_addr_i' CodAL signal/wire: (single driver)
    assign s_fetch_addr_i = s_fetch_addr_i_D;
    // instance of 's_ldst_addr_i' CodAL signal/wire: (single driver)
    assign s_ldst_addr_i = s_ldst_addr_i_D;
    // instance of 's_prv_i' CodAL signal/wire: (single driver)
    assign s_prv_i = s_prv_i_D;
    // instance of 's_ldst_cmd_i' CodAL signal/wire: (single driver)
    assign s_ldst_cmd_i = s_ldst_cmd_i_D;
    // instance of 's_trigger_fire_o' CodAL signal/wire: (parent port driver(s))
    assign s_trigger_fire_o_Q = s_trigger_fire_o;
    // instance of 's_trigger_action_o' CodAL signal/wire: (parent port driver(s))
    assign s_trigger_action_o_Q = s_trigger_action_o;
    // functional unit instance:
    codix_berkelium_ca_core_decode_stage_tg_5_trigger_mcontrol_t trigger_mcontrol (
        .r_csr_tcontrol_Q(r_csr_tcontrol_Q),
        .r_csr_tdata1_r5_Q(r_csr_tdata1_r5_Q),
        .r_csr_tdata2_r5_Q(r_csr_tdata2_r5_Q),
        .s_fetch_addr_i_Q(s_fetch_addr_i),
        .s_ldst_addr_i_Q(s_ldst_addr_i),
        .s_ldst_cmd_i_Q(s_ldst_cmd_i),
        .s_prv_i_Q(s_prv_i),
        .r_csr_tdata1_r5_RA(r_csr_tdata1_r5_RA),
        .r_csr_tdata1_r5_RE(r_csr_tdata1_r5_RE),
        .r_csr_tdata2_r5_RA(r_csr_tdata2_r5_RA),
        .r_csr_tdata2_r5_RE(r_csr_tdata2_r5_RE),
        .s_trigger_action_o_D(s_trigger_action_o),
        .s_trigger_fire_o_D(s_trigger_fire_o)
    );

endmodule: codix_berkelium_ca_core_decode_stage_tg_5_t
