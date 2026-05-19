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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_bp_bht_predict_t' functional unit.
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

module codix_berkelium_ca_core_fetch_stage_bp_bht_predict_t(
    input  logic [1:0] rf_bht_data_p0_Q,
    input  logic [6:0] s_instr_addr_i_Q,
    input  logic s_p0_data_Q,
    input  logic s_predict_valid_i_Q,
    output logic [6:0] rf_bht_data_p0_RA,
    output logic rf_bht_data_p0_RE,
    output logic [1:0] s_p0_data_D,
    output logic s_taken_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic codasip_tmp_var_0;
    // signal/wire
    logic [6:0] index_B0;
    // signal/wire
    logic s_taken_o_D_ACT_wire;

    // data-path code:
    assign index_B0 = s_instr_addr_i_Q;
    assign codasip_tmp_var_0 = s_predict_valid_i_Q;
    assign s_taken_o_D_ACT_wire = codasip_tmp_var_0 ? s_p0_data_Q : 1'b0;
    assign rf_bht_data_p0_RA = index_B0;
    assign rf_bht_data_p0_RE = 1'b1;
    assign s_p0_data_D = rf_bht_data_p0_Q;
    assign s_taken_o_D = s_taken_o_D_ACT_wire;
endmodule: codix_berkelium_ca_core_fetch_stage_bp_bht_predict_t
