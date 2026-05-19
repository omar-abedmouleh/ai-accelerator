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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_decode_stage_aligner_align_t' functional unit.
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

module codix_berkelium_ca_core_decode_stage_aligner_align_t(
    input  logic [31:0] r_rem_addr_Q,
    input  logic [31:0] r_rem_bp_addr_Q,
    input  logic r_rem_bp_taken_Q,
    input  logic [15:0] r_rem_data_Q,
    input  logic [4:0] r_rem_exc_type_Q,
    input  logic r_rem_exc_valid_Q,
    input  logic r_rem_valid_Q,
    input  logic [31:0] s_addr_i_Q,
    input  logic [31:0] s_bp_addr_i_Q,
    input  logic [1:0] s_bp_taken_i_Q,
    input  logic [31:0] s_data_i_Q,
    input  logic [4:0] s_exc_type_i_Q,
    input  logic s_exc_valid_i_Q,
    input  logic [1:0] s_instr_o_Q,
    input  logic [1:0] s_valid_i_Q,
    input  logic s_valid_o_Q,
    output logic [31:0] s_addr_o_D,
    output logic [31:0] s_bp_addr_o_D,
    output logic s_bp_rvi_noincr_o_D,
    output logic s_bp_taken_o_D,
    output logic [31:0] s_exc_tval_o_D,
    output logic [4:0] s_exc_type_o_D,
    output logic s_exc_valid_o_D,
    output logic [31:0] s_instr_o_D,
    output logic s_pop_o_D,
    output logic [31:0] s_rem_addr_d_D,
    output logic [31:0] s_rem_bp_addr_d_D,
    output logic s_rem_bp_taken_d_D,
    output logic [15:0] s_rem_data_d_D,
    output logic [4:0] s_rem_exc_type_d_D,
    output logic s_rem_exc_valid_d_D,
    output logic s_rem_valid_d_D,
    output logic s_rvc_instr_o_D,
    output logic s_rvi_broken_o_D,
    output logic s_valid_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic [31:0] addr_0_B0;
    // signal/wire
    logic [31:0] addr_1_B0;
    // signal/wire
    logic bp_error_0_B0;
    // signal/wire
    logic bp_error_1_B0;
    // signal/wire
    logic [1:0] codasip_tmp_var_0;
    // signal/wire
    logic codasip_tmp_var_1;
    // signal/wire
    logic codasip_tmp_var_2;
    // signal/wire
    logic codasip_tmp_var_3;
    // signal/wire
    logic codasip_tmp_var_4;
    // signal/wire
    logic codasip_tmp_var_5;
    // signal/wire
    logic codasip_tmp_var_6;
    // signal/wire
    logic codasip_tmp_var_7;
    // signal/wire
    logic rvc_0_B0;
    // signal/wire
    logic rvc_1_B0;
    // signal/wire
    logic rvc_rem_B0;
    // signal/wire
    logic [31:0] s_addr_o_D_ACT_wire;
    // signal/wire
    logic [31:0] s_bp_addr_o_D_ACT_wire;
    // signal/wire
    logic s_bp_taken_o_D_ACT_wire;
    // signal/wire
    logic [31:0] s_exc_tval_o_D_ACT_wire;
    // signal/wire
    logic [4:0] s_exc_type_o_D_ACT_wire;
    // signal/wire
    logic s_exc_valid_o_D_ACT_wire;
    // signal/wire
    logic [31:0] s_instr_o_D_ACT_wire;
    // signal/wire
    logic s_pop_o_D_ACT_wire;
    // signal/wire
    logic [31:0] s_rem_addr_d_D_ACT_wire;
    // signal/wire
    logic [31:0] s_rem_bp_addr_d_D_ACT_wire;
    // signal/wire
    logic s_rem_bp_taken_d_D_ACT_wire;
    // signal/wire
    logic [15:0] s_rem_data_d_D_ACT_wire;
    // signal/wire
    logic [4:0] s_rem_exc_type_d_D_ACT_wire;
    // signal/wire
    logic s_rem_exc_valid_d_D_ACT_wire;
    // signal/wire
    logic s_rem_valid_d_D_ACT_wire;
    // signal/wire
    logic s_valid_o_D_ACT_wire;

    // data-path code:
    assign rvc_0_B0 = (s_data_i_Q[1:0] != 2'h3);
    assign rvc_1_B0 = (s_data_i_Q[17:16] != 2'h3);
    assign rvc_rem_B0 = (r_rem_data_Q[1:0] != 2'h3);
    assign addr_0_B0 = s_addr_i_Q;
    assign addr_1_B0 = {s_addr_i_Q[31:2], 2'h2};
    assign bp_error_0_B0 = (((r_rem_valid_Q & (~rvc_rem_B0)) & r_rem_bp_taken_Q) & (s_valid_i_Q != 2'h0));
    assign bp_error_1_B0 = ((((~r_rem_valid_Q) & (~rvc_0_B0)) & s_bp_taken_i_Q[1]) & ((s_valid_i_Q == 2'h3) | (s_valid_i_Q == 2'h1)));
    assign codasip_tmp_var_0 = s_valid_i_Q;
    assign codasip_tmp_var_1 = (codasip_tmp_var_0 == 2'h0) ? (r_rem_valid_Q && rvc_rem_B0) : 1'b0;
    assign codasip_tmp_var_2 = (codasip_tmp_var_0 == 2'h2) ? (r_rem_valid_Q && rvc_rem_B0) : 1'b0;
    assign s_rem_bp_addr_d_D_ACT_wire = ((!codasip_tmp_var_1) && (codasip_tmp_var_0 == 2'h0)) ? r_rem_bp_addr_Q :
        (((codasip_tmp_var_2 || (((!codasip_tmp_var_4) && (!codasip_tmp_var_3)) && (codasip_tmp_var_0 == 2'h2))) || ((!codasip_tmp_var_6) && codasip_tmp_var_5)) || codasip_tmp_var_7) ? s_bp_addr_i_Q : 32'h00000000;
    assign s_rem_bp_taken_d_D_ACT_wire = ((!codasip_tmp_var_1) && (codasip_tmp_var_0 == 2'h0)) ? r_rem_bp_taken_Q :
        (((codasip_tmp_var_2 || (((!codasip_tmp_var_4) && (!codasip_tmp_var_3)) && (codasip_tmp_var_0 == 2'h2))) || ((!codasip_tmp_var_6) && codasip_tmp_var_5)) || codasip_tmp_var_7) ? s_bp_taken_i_Q[1] : 1'b0;
    assign s_rem_addr_d_D_ACT_wire = ((!codasip_tmp_var_1) && (codasip_tmp_var_0 == 2'h0)) ? r_rem_addr_Q :
        (((codasip_tmp_var_2 || (((!codasip_tmp_var_4) && (!codasip_tmp_var_3)) && (codasip_tmp_var_0 == 2'h2))) || ((!codasip_tmp_var_6) && codasip_tmp_var_5)) || codasip_tmp_var_7) ? addr_1_B0 : 32'h00000000;
    assign s_rem_data_d_D_ACT_wire = ((!codasip_tmp_var_1) && (codasip_tmp_var_0 == 2'h0)) ? r_rem_data_Q :
        (((codasip_tmp_var_2 || (((!codasip_tmp_var_4) && (!codasip_tmp_var_3)) && (codasip_tmp_var_0 == 2'h2))) || ((!codasip_tmp_var_6) && codasip_tmp_var_5)) || codasip_tmp_var_7) ? s_data_i_Q[31:16] : 16'h0000;
    assign s_rem_valid_d_D_ACT_wire = ((!codasip_tmp_var_1) && (codasip_tmp_var_0 == 2'h0)) ? r_rem_valid_Q :
        (((codasip_tmp_var_2 || (((!codasip_tmp_var_4) && (!codasip_tmp_var_3)) && (codasip_tmp_var_0 == 2'h2))) || ((!codasip_tmp_var_6) && codasip_tmp_var_5)) || codasip_tmp_var_7) ? 1'b1 : 1'b0;
    assign s_rem_exc_type_d_D_ACT_wire = ((!codasip_tmp_var_1) && (codasip_tmp_var_0 == 2'h0)) ? r_rem_exc_type_Q :
        (((codasip_tmp_var_2 || (((!codasip_tmp_var_4) && (!codasip_tmp_var_3)) && (codasip_tmp_var_0 == 2'h2))) || ((!codasip_tmp_var_6) && codasip_tmp_var_5)) || codasip_tmp_var_7) ? s_exc_type_i_Q : 5'h00;
    assign s_rem_exc_valid_d_D_ACT_wire = ((!codasip_tmp_var_1) && (codasip_tmp_var_0 == 2'h0)) ? r_rem_exc_valid_Q :
        (((codasip_tmp_var_2 || (((!codasip_tmp_var_4) && (!codasip_tmp_var_3)) && (codasip_tmp_var_0 == 2'h2))) || ((!codasip_tmp_var_6) && codasip_tmp_var_5)) || codasip_tmp_var_7) ? s_exc_valid_i_Q : 1'b0;
    assign codasip_tmp_var_3 = ((!codasip_tmp_var_2) && (codasip_tmp_var_0 == 2'h2)) ? r_rem_valid_Q : 1'b0;
    assign codasip_tmp_var_4 = (((!codasip_tmp_var_3) && (!codasip_tmp_var_2)) && (codasip_tmp_var_0 == 2'h2)) ? rvc_1_B0 : 1'b0;
    assign codasip_tmp_var_5 = (codasip_tmp_var_0 == 2'h3) ? r_rem_valid_Q : 1'b0;
    assign codasip_tmp_var_6 = codasip_tmp_var_5 ? rvc_rem_B0 : 1'b0;
    assign s_valid_o_D_ACT_wire = (((codasip_tmp_var_1 || codasip_tmp_var_2) || codasip_tmp_var_3) || codasip_tmp_var_4) ? 1'b1 :
        (codasip_tmp_var_0 == 2'h2) ? 1'b0 :
        (((codasip_tmp_var_6 || codasip_tmp_var_5) || codasip_tmp_var_7) || (codasip_tmp_var_0 == 2'h3)) ? 1'b1 : 1'b0;
    assign s_bp_addr_o_D_ACT_wire = (codasip_tmp_var_1 || codasip_tmp_var_2) ? r_rem_bp_addr_Q :
        codasip_tmp_var_3 ? 32'h00000000 :
        codasip_tmp_var_4 ? s_bp_addr_i_Q :
        codasip_tmp_var_6 ? r_rem_bp_addr_Q :
        ((codasip_tmp_var_5 || codasip_tmp_var_7) || (codasip_tmp_var_0 == 2'h3)) ? s_bp_addr_i_Q : 32'h00000000;
    assign s_bp_taken_o_D_ACT_wire = (codasip_tmp_var_1 || codasip_tmp_var_2) ? r_rem_bp_taken_Q :
        codasip_tmp_var_3 ? 1'b0 :
        codasip_tmp_var_4 ? s_bp_taken_i_Q[1] :
        codasip_tmp_var_6 ? r_rem_bp_taken_Q :
        ((codasip_tmp_var_5 || codasip_tmp_var_7) || (codasip_tmp_var_0 == 2'h3)) ? s_bp_taken_i_Q[0] : 1'b0;
    assign s_pop_o_D_ACT_wire = codasip_tmp_var_1 ? 1'b0 :
        (((codasip_tmp_var_2 || codasip_tmp_var_3) || codasip_tmp_var_4) || (codasip_tmp_var_0 == 2'h2)) ? 1'b1 :
        codasip_tmp_var_6 ? 1'b0 :
        ((codasip_tmp_var_5 || codasip_tmp_var_7) || (codasip_tmp_var_0 == 2'h3)) ? 1'b1 : 1'b0;
    assign codasip_tmp_var_7 = ((!codasip_tmp_var_5) && (codasip_tmp_var_0 == 2'h3)) ? rvc_0_B0 : 1'b0;
    assign s_addr_o_D_ACT_wire = ((codasip_tmp_var_1 || codasip_tmp_var_2) || codasip_tmp_var_3) ? r_rem_addr_Q :
        codasip_tmp_var_4 ? addr_1_B0 :
        (codasip_tmp_var_6 || codasip_tmp_var_5) ? r_rem_addr_Q :
        (codasip_tmp_var_7 || (codasip_tmp_var_0 == 2'h3)) ? addr_0_B0 : 32'h00000000;
    assign s_exc_type_o_D_ACT_wire = (codasip_tmp_var_1 || codasip_tmp_var_2) ? r_rem_exc_type_Q :
        codasip_tmp_var_3 ? 5'h00 :
        codasip_tmp_var_4 ? s_exc_type_i_Q :
        codasip_tmp_var_6 ? r_rem_exc_type_Q :
        codasip_tmp_var_5 ? ((r_rem_exc_valid_Q) ? r_rem_exc_type_Q : s_exc_type_i_Q) :
        (codasip_tmp_var_7 || (codasip_tmp_var_0 == 2'h3)) ? s_exc_type_i_Q : 5'h00;
    assign s_exc_valid_o_D_ACT_wire = (codasip_tmp_var_1 || codasip_tmp_var_2) ? r_rem_exc_valid_Q :
        codasip_tmp_var_3 ? 1'b0 :
        codasip_tmp_var_4 ? s_exc_valid_i_Q :
        codasip_tmp_var_6 ? r_rem_exc_valid_Q :
        codasip_tmp_var_5 ? (r_rem_exc_valid_Q | s_exc_valid_i_Q) :
        (codasip_tmp_var_7 || (codasip_tmp_var_0 == 2'h3)) ? s_exc_valid_i_Q : 1'b0;
    assign s_exc_tval_o_D_ACT_wire = (codasip_tmp_var_1 || codasip_tmp_var_2) ? {r_rem_addr_Q[31:2], 2'h2} :
        codasip_tmp_var_3 ? 32'h00000000 :
        codasip_tmp_var_4 ? addr_0_B0 :
        codasip_tmp_var_6 ? {r_rem_addr_Q[31:2], 2'h2} :
        codasip_tmp_var_5 ? ((r_rem_exc_valid_Q) ? {r_rem_addr_Q[31:2], 2'h2} : addr_0_B0) :
        (codasip_tmp_var_7 || (codasip_tmp_var_0 == 2'h3)) ? addr_0_B0 : 32'h00000000;
    assign s_instr_o_D_ACT_wire = ((codasip_tmp_var_1 || codasip_tmp_var_2) || codasip_tmp_var_3) ? {16'h0000, r_rem_data_Q} :
        codasip_tmp_var_4 ? {16'h0000, s_data_i_Q[31:16]} :
        codasip_tmp_var_6 ? {16'h0000, r_rem_data_Q} :
        codasip_tmp_var_5 ? {s_data_i_Q[15:0], r_rem_data_Q} :
        codasip_tmp_var_7 ? {16'h0000, s_data_i_Q[15:0]} :
        (codasip_tmp_var_0 == 2'h3) ? s_data_i_Q : 32'h00000000;
    assign s_addr_o_D = s_addr_o_D_ACT_wire;
    assign s_bp_addr_o_D = s_bp_addr_o_D_ACT_wire;
    assign s_bp_rvi_noincr_o_D = bp_error_0_B0;
    assign s_bp_taken_o_D = s_bp_taken_o_D_ACT_wire;
    assign s_exc_tval_o_D = s_exc_tval_o_D_ACT_wire;
    assign s_exc_type_o_D = s_exc_type_o_D_ACT_wire;
    assign s_exc_valid_o_D = s_exc_valid_o_D_ACT_wire;
    assign s_instr_o_D = s_instr_o_D_ACT_wire;
    assign s_pop_o_D = s_pop_o_D_ACT_wire;
    assign s_rem_addr_d_D = s_rem_addr_d_D_ACT_wire;
    assign s_rem_bp_addr_d_D = s_rem_bp_addr_d_D_ACT_wire;
    assign s_rem_bp_taken_d_D = s_rem_bp_taken_d_D_ACT_wire;
    assign s_rem_data_d_D = s_rem_data_d_D_ACT_wire;
    assign s_rem_exc_type_d_D = s_rem_exc_type_d_D_ACT_wire;
    assign s_rem_exc_valid_d_D = s_rem_exc_valid_d_D_ACT_wire;
    assign s_rem_valid_d_D = s_rem_valid_d_D_ACT_wire;
    assign s_rvc_instr_o_D = (s_valid_o_Q && (s_instr_o_Q != 2'h3));
    assign s_rvi_broken_o_D = (bp_error_0_B0 | bp_error_1_B0);
    assign s_valid_o_D = s_valid_o_D_ACT_wire;
endmodule: codix_berkelium_ca_core_decode_stage_aligner_align_t
