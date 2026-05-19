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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_bp_bht_update_t' functional unit.
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

module codix_berkelium_ca_core_fetch_stage_bp_bht_update_t(
    input  logic [1:0] rf_bht_data_u0_Q,
    input  logic s_branch_bht_update_i_Q,
    input  logic [6:0] s_branch_instr_addr_i_Q,
    input  logic s_flush_i_Q,
    input  logic s_taken_i_Q,
    output logic [6:0] rf_bht_data_u0_RA,
    output logic rf_bht_data_u0_RE,
    output logic [1:0] rf_bht_data_w0_D,
    output logic [6:0] rf_bht_data_w0_WA,
    output logic rf_bht_data_w0_WE
);
    // type, wire and constant declarations:
    // signal/wire
    logic codasip_tmp_var_0;
    // signal/wire
    logic [6:0] index_B0;
    // signal/wire
    logic [1:0] new_pred_B0;
    // signal/wire
    logic [2:0] op_B0;
    // signal/wire
    logic [1:0] pred_B0;
    // signal/wire
    logic [2:0] res_sat_B0;

    // data-path code:
    assign codasip_tmp_var_0 = ((~s_flush_i_Q) & s_branch_bht_update_i_Q);
    assign index_B0 = codasip_tmp_var_0 ? s_branch_instr_addr_i_Q : 7'h00;
    assign pred_B0 = codasip_tmp_var_0 ? rf_bht_data_u0_Q : 2'h0;
    assign op_B0 = codasip_tmp_var_0 ? ((s_taken_i_Q) ? 3'h1 : (((pred_B0 == 2'h0)) ? 3'h0 : 3'h7)) : 3'h0;
    assign res_sat_B0 = codasip_tmp_var_0 ? (3'(pred_B0) + op_B0) : 3'h0;
    assign new_pred_B0 = codasip_tmp_var_0 ? (((res_sat_B0 > 3'h3)) ? 2'h3 : 2'(res_sat_B0)) : 2'h0;
    assign rf_bht_data_u0_RA = index_B0;
    assign rf_bht_data_u0_RE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign rf_bht_data_w0_D = new_pred_B0;
    assign rf_bht_data_w0_WA = index_B0;
    assign rf_bht_data_w0_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
endmodule: codix_berkelium_ca_core_fetch_stage_bp_bht_update_t
