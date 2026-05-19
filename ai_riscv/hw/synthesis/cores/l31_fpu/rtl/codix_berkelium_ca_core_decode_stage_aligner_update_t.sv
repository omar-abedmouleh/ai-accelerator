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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_decode_stage_aligner_update_t' functional unit.
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

module codix_berkelium_ca_core_decode_stage_aligner_update_t(
    input  logic s_flush_i_Q,
    input  logic [31:0] s_rem_addr_d_Q,
    input  logic [31:0] s_rem_bp_addr_d_Q,
    input  logic s_rem_bp_taken_d_Q,
    input  logic [15:0] s_rem_data_d_Q,
    input  logic [4:0] s_rem_exc_type_d_Q,
    input  logic s_rem_exc_valid_d_Q,
    input  logic s_rem_valid_d_Q,
    input  logic s_update_i_Q,
    input  logic s_valid_o_Q,
    output logic [31:0] r_rem_addr_D,
    output logic r_rem_addr_WE,
    output logic [31:0] r_rem_bp_addr_D,
    output logic r_rem_bp_addr_WE,
    output logic r_rem_bp_taken_D,
    output logic r_rem_bp_taken_WE,
    output logic [15:0] r_rem_data_D,
    output logic r_rem_data_WE,
    output logic [4:0] r_rem_exc_type_D,
    output logic r_rem_exc_type_WE,
    output logic r_rem_exc_valid_D,
    output logic r_rem_exc_valid_WE,
    output logic r_rem_valid_D,
    output logic r_rem_valid_WE
);
    // type, wire and constant declarations:
    // signal/wire
    logic codasip_tmp_var_0;
    // signal/wire
    logic codasip_tmp_var_1;

    // data-path code:
    assign codasip_tmp_var_0 = s_flush_i_Q;
    assign codasip_tmp_var_1 = (!codasip_tmp_var_0) ? (s_update_i_Q | (~s_valid_o_Q)) : 1'b0;
    assign r_rem_addr_D = codasip_tmp_var_0 ? 32'h00000000 :
        codasip_tmp_var_1 ? s_rem_addr_d_Q : 32'h00000000;
    assign r_rem_addr_WE = (codasip_tmp_var_0 || codasip_tmp_var_1) ? 1'b1 : 1'b0;
    assign r_rem_bp_addr_D = codasip_tmp_var_0 ? 32'h00000000 :
        codasip_tmp_var_1 ? s_rem_bp_addr_d_Q : 32'h00000000;
    assign r_rem_bp_addr_WE = (codasip_tmp_var_0 || codasip_tmp_var_1) ? 1'b1 : 1'b0;
    assign r_rem_bp_taken_D = codasip_tmp_var_0 ? 1'b0 :
        codasip_tmp_var_1 ? s_rem_bp_taken_d_Q : 1'b0;
    assign r_rem_bp_taken_WE = (codasip_tmp_var_0 || codasip_tmp_var_1) ? 1'b1 : 1'b0;
    assign r_rem_data_D = codasip_tmp_var_0 ? 16'h0000 :
        codasip_tmp_var_1 ? s_rem_data_d_Q : 16'h0000;
    assign r_rem_data_WE = (codasip_tmp_var_0 || codasip_tmp_var_1) ? 1'b1 : 1'b0;
    assign r_rem_exc_type_D = codasip_tmp_var_0 ? 5'h00 :
        codasip_tmp_var_1 ? s_rem_exc_type_d_Q : 5'h00;
    assign r_rem_exc_type_WE = (codasip_tmp_var_0 || codasip_tmp_var_1) ? 1'b1 : 1'b0;
    assign r_rem_exc_valid_D = codasip_tmp_var_0 ? 1'b0 :
        codasip_tmp_var_1 ? s_rem_exc_valid_d_Q : 1'b0;
    assign r_rem_exc_valid_WE = (codasip_tmp_var_0 || codasip_tmp_var_1) ? 1'b1 : 1'b0;
    assign r_rem_valid_D = codasip_tmp_var_0 ? 1'b0 :
        codasip_tmp_var_1 ? s_rem_valid_d_Q : 1'b0;
    assign r_rem_valid_WE = (codasip_tmp_var_0 || codasip_tmp_var_1) ? 1'b1 : 1'b0;
endmodule: codix_berkelium_ca_core_decode_stage_aligner_update_t
