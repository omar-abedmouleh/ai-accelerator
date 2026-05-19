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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_decode_stage_tgm_ocd_trigger_t' functional unit.
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

module codix_berkelium_ca_core_decode_stage_tgm_ocd_trigger_t(
    input  logic [31:0] s_fetch_addr_i_Q,
    input  logic [31:0] s_ldst_addr_i_Q,
    input  logic [7:0] s_ldst_cmd_i_Q,
    input  logic s_progbuf_mode_i_Q,
    input  logic [1:0] s_prv_i_Q,
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
    output logic [4:0] s_trigger_action_o_D,
    output logic s_trigger_fire_o_D,
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
    // signal/wire
    logic [1:0] ldst_cmd_B0;

    // data-path code:
    assign ldst_cmd_B0 = ((((s_ldst_cmd_i_Q == 8'h19) || ((s_ldst_cmd_i_Q <= 8'h14) && (s_ldst_cmd_i_Q >= 8'h10)))) ? 2'h2 : ((((s_ldst_cmd_i_Q == 8'h1b) || ((s_ldst_cmd_i_Q >= 8'h15) && (s_ldst_cmd_i_Q <= 8'h17)))) ? 2'h1 : 2'h0));
    assign s_trigger_action_o_D = ((((((((((tg_7_s_trigger_action_o_Q & tg_7_s_trigger_fire_o_Q) | (tg_6_s_trigger_action_o_Q & tg_6_s_trigger_fire_o_Q)) | (tg_5_s_trigger_action_o_Q & tg_5_s_trigger_fire_o_Q)) | (tg_4_s_trigger_action_o_Q & tg_4_s_trigger_fire_o_Q)) | (tg_3_s_trigger_action_o_Q & tg_3_s_trigger_fire_o_Q)) | (tg_2_s_trigger_action_o_Q & tg_2_s_trigger_fire_o_Q)) | (tg_1_s_trigger_action_o_Q & tg_1_s_trigger_fire_o_Q)) | (tg_0_s_trigger_action_o_Q & tg_0_s_trigger_fire_o_Q))) ? 5'h19 : 5'h1a);
    assign s_trigger_fire_o_D = ((~s_progbuf_mode_i_Q) & (((((((tg_7_s_trigger_fire_o_Q | tg_6_s_trigger_fire_o_Q) | tg_5_s_trigger_fire_o_Q) | tg_4_s_trigger_fire_o_Q) | tg_3_s_trigger_fire_o_Q) | tg_2_s_trigger_fire_o_Q) | tg_1_s_trigger_fire_o_Q) | tg_0_s_trigger_fire_o_Q));
    assign tg_0_s_fetch_addr_i_D = s_fetch_addr_i_Q;
    assign tg_0_s_ldst_addr_i_D = s_ldst_addr_i_Q;
    assign tg_0_s_ldst_cmd_i_D = 8'(ldst_cmd_B0);
    assign tg_0_s_prv_i_D = s_prv_i_Q;
    assign tg_1_s_fetch_addr_i_D = s_fetch_addr_i_Q;
    assign tg_1_s_ldst_addr_i_D = s_ldst_addr_i_Q;
    assign tg_1_s_ldst_cmd_i_D = 8'(ldst_cmd_B0);
    assign tg_1_s_prv_i_D = s_prv_i_Q;
    assign tg_2_s_fetch_addr_i_D = s_fetch_addr_i_Q;
    assign tg_2_s_ldst_addr_i_D = s_ldst_addr_i_Q;
    assign tg_2_s_ldst_cmd_i_D = 8'(ldst_cmd_B0);
    assign tg_2_s_prv_i_D = s_prv_i_Q;
    assign tg_3_s_fetch_addr_i_D = s_fetch_addr_i_Q;
    assign tg_3_s_ldst_addr_i_D = s_ldst_addr_i_Q;
    assign tg_3_s_ldst_cmd_i_D = 8'(ldst_cmd_B0);
    assign tg_3_s_prv_i_D = s_prv_i_Q;
    assign tg_4_s_fetch_addr_i_D = s_fetch_addr_i_Q;
    assign tg_4_s_ldst_addr_i_D = s_ldst_addr_i_Q;
    assign tg_4_s_ldst_cmd_i_D = 8'(ldst_cmd_B0);
    assign tg_4_s_prv_i_D = s_prv_i_Q;
    assign tg_5_s_fetch_addr_i_D = s_fetch_addr_i_Q;
    assign tg_5_s_ldst_addr_i_D = s_ldst_addr_i_Q;
    assign tg_5_s_ldst_cmd_i_D = 8'(ldst_cmd_B0);
    assign tg_5_s_prv_i_D = s_prv_i_Q;
    assign tg_6_s_fetch_addr_i_D = s_fetch_addr_i_Q;
    assign tg_6_s_ldst_addr_i_D = s_ldst_addr_i_Q;
    assign tg_6_s_ldst_cmd_i_D = 8'(ldst_cmd_B0);
    assign tg_6_s_prv_i_D = s_prv_i_Q;
    assign tg_7_s_fetch_addr_i_D = s_fetch_addr_i_Q;
    assign tg_7_s_ldst_addr_i_D = s_ldst_addr_i_Q;
    assign tg_7_s_ldst_cmd_i_D = 8'(ldst_cmd_B0);
    assign tg_7_s_prv_i_D = s_prv_i_Q;
endmodule: codix_berkelium_ca_core_decode_stage_tgm_ocd_trigger_t
