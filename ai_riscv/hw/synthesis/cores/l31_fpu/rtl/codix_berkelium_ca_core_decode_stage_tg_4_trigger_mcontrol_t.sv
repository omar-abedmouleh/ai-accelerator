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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_decode_stage_tg_4_trigger_mcontrol_t' functional unit.
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

module codix_berkelium_ca_core_decode_stage_tg_4_trigger_mcontrol_t(
    input  logic r_csr_tcontrol_Q,
    input  logic [31:0] r_csr_tdata1_r4_Q,
    input  logic [31:0] r_csr_tdata2_r4_Q,
    input  logic [31:0] s_fetch_addr_i_Q,
    input  logic [31:0] s_ldst_addr_i_Q,
    input  logic [7:0] s_ldst_cmd_i_Q,
    input  logic [1:0] s_prv_i_Q,
    output logic [2:0] r_csr_tdata1_r4_RA,
    output logic r_csr_tdata1_r4_RE,
    output logic [2:0] r_csr_tdata2_r4_RA,
    output logic r_csr_tdata2_r4_RE,
    output logic s_trigger_action_o_D,
    output logic s_trigger_fire_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic access_type_en_B0;
    // signal/wire
    logic match_B0;
    // signal/wire
    logic match_rw_B0;
    // signal/wire
    logic match_x_B0;
    // signal/wire
    logic prv_en_B0;
    // signal/wire
    logic [31:0] s_trigger_match_data_B0;
    // signal/wire
    logic [31:0] s_trigger_tdata1_B0;
    // signal/wire
    logic type_r_en_B0;
    // signal/wire
    logic type_w_en_B0;
    // signal/wire
    logic type_x_en_B0;

    // data-path code:
    assign s_trigger_tdata1_B0 = r_csr_tdata1_r4_Q;
    assign s_trigger_match_data_B0 = r_csr_tdata2_r4_Q;
    assign prv_en_B0 = (((((s_prv_i_Q == 2'h0) && s_trigger_tdata1_B0[3]) || ((s_prv_i_Q == 2'h1) && s_trigger_tdata1_B0[4])) || (((s_prv_i_Q == 2'h3) && s_trigger_tdata1_B0[6]) && s_trigger_tdata1_B0[12])) || ((((s_prv_i_Q == 2'h3) && s_trigger_tdata1_B0[6]) && (!s_trigger_tdata1_B0[12])) && r_csr_tcontrol_Q));
    assign type_x_en_B0 = s_trigger_tdata1_B0[2];
    assign type_r_en_B0 = ((s_ldst_cmd_i_Q == 8'h02) && s_trigger_tdata1_B0[0]);
    assign type_w_en_B0 = ((s_ldst_cmd_i_Q == 8'h01) && s_trigger_tdata1_B0[1]);
    assign access_type_en_B0 = ((type_x_en_B0 | type_r_en_B0) | type_w_en_B0);
    assign match_x_B0 = (type_x_en_B0 & (s_fetch_addr_i_Q == s_trigger_match_data_B0));
    assign match_rw_B0 = ((type_r_en_B0 | type_w_en_B0) & (s_ldst_addr_i_Q == s_trigger_match_data_B0));
    assign match_B0 = (match_x_B0 | match_rw_B0);
    assign r_csr_tdata1_r4_RA = 3'h4;
    assign r_csr_tdata1_r4_RE = 1'b1;
    assign r_csr_tdata2_r4_RA = 3'h4;
    assign r_csr_tdata2_r4_RE = 1'b1;
    assign s_trigger_action_o_D = s_trigger_tdata1_B0[12];
    assign s_trigger_fire_o_D = ((prv_en_B0 && access_type_en_B0) && match_B0);
endmodule: codix_berkelium_ca_core_decode_stage_tg_4_trigger_mcontrol_t
