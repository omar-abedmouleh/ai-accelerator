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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_ira_update_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_ira_update_t(
    input  logic [31:0] s_ex0_branch_target_i_Q,
    input  logic [31:0] s_ex0_csr_addr_i_Q,
    input  logic [31:0] s_ex0_instr_addr_i_Q,
    input  logic [31:0] s_ex0_intexc_addr_i_Q,
    input  logic s_ex0_is_branch_i_Q,
    input  logic s_ex0_is_csr_i_Q,
    input  logic s_ex0_is_intexc_i_Q,
    input  logic s_ex0_is_rvc_i_Q,
    input  logic s_ex0_retired_i_Q,
    input  logic [31:0] s_ex1_instr_addr_i_Q,
    input  logic s_ex1_is_rvc_i_Q,
    input  logic s_ex1_retired_i_Q,
    input  logic [31:0] s_ocd_addr_i_Q,
    input  logic s_ocd_stop_count_i_Q,
    input  logic s_ocd_valid_i_Q,
    output logic [31:0] r_return_address_D,
    output logic r_return_address_WE
);
    // type, wire and constant declarations:
    // signal/wire
    logic [31:0] addr_0_B0;
    // signal/wire
    logic [31:0] addr_1_B0;
    // signal/wire
    logic [31:0] addr_B0;
    // signal/wire
    logic codasip_tmp_var_0;
    // signal/wire
    logic codasip_tmp_var_1;
    // signal/wire
    logic codasip_tmp_var_2;
    // signal/wire
    logic [2:0] size_0_B0;
    // signal/wire
    logic [2:0] size_1_B0;

    // data-path code:
    assign size_0_B0 = 3'(((s_ex0_is_rvc_i_Q) ? 32'h00000002 : 32'h00000004));
    assign size_1_B0 = 3'(((s_ex1_is_rvc_i_Q) ? 32'h00000002 : 32'h00000004));
    assign addr_0_B0 = (s_ex0_instr_addr_i_Q + 32'(size_0_B0));
    assign addr_1_B0 = (s_ex1_instr_addr_i_Q + 32'(size_1_B0));
    assign codasip_tmp_var_0 = s_ocd_valid_i_Q;
    assign codasip_tmp_var_1 = (!codasip_tmp_var_0) ? (s_ex0_retired_i_Q | s_ex0_is_intexc_i_Q) : 1'b0;
    assign addr_B0 = codasip_tmp_var_0 ? s_ocd_addr_i_Q :
        codasip_tmp_var_1 ? ((s_ex0_is_intexc_i_Q) ? s_ex0_intexc_addr_i_Q : ((s_ex0_is_csr_i_Q) ? s_ex0_csr_addr_i_Q : ((s_ex0_is_branch_i_Q) ? s_ex0_branch_target_i_Q : addr_0_B0))) : addr_1_B0;
    assign codasip_tmp_var_2 = ((((s_ex0_retired_i_Q | s_ex1_retired_i_Q) | s_ex0_is_intexc_i_Q) & (~s_ocd_stop_count_i_Q)) | s_ocd_valid_i_Q);
    assign r_return_address_D = codasip_tmp_var_2 ? addr_B0 : 32'h00000000;
    assign r_return_address_WE = codasip_tmp_var_2 ? 1'b1 : 1'b0;
endmodule: codix_berkelium_ca_core_execute_stage_ira_update_t
