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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_npc_get_next_addr_t' functional unit.
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

module codix_berkelium_ca_core_fetch_stage_npc_get_next_addr_t(
    input  logic [31:0] s_bp_addr_i_Q,
    input  logic s_bp_valid_i_Q,
    input  logic [31:0] s_branch_addr_i_Q,
    input  logic s_branch_valid_i_Q,
    input  logic [31:0] s_csr_addr_i_Q,
    input  logic s_csr_valid_i_Q,
    input  logic [31:0] s_ocd_addr_i_Q,
    input  logic s_ocd_valid_i_Q,
    input  logic [31:0] s_pc_addr_i_Q,
    input  logic s_stall_i_Q,
    input  logic [31:0] s_trap_addr_i_Q,
    input  logic s_trap_valid_i_Q,
    output logic [31:0] s_pc_addr_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic codasip_tmp_var_0;
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
    logic [29:0] npc_adder_B0;
    // signal/wire
    logic [31:0] npc_address_B0;
    // signal/wire
    logic [29:0] npc_source_B0;
    // signal/wire
    logic [31:0] s_pc_addr_o_D_ACT_wire;

    // data-path code:
    assign npc_source_B0 = s_pc_addr_i_Q[31:2];
    assign npc_adder_B0 = (npc_source_B0 + 30'h00000001);
    assign npc_address_B0 = {npc_adder_B0, 2'h0};
    assign codasip_tmp_var_0 = s_ocd_valid_i_Q;
    assign codasip_tmp_var_1 = (!codasip_tmp_var_0) ? s_trap_valid_i_Q : 1'b0;
    assign codasip_tmp_var_2 = ((!codasip_tmp_var_1) && (!codasip_tmp_var_0)) ? s_csr_valid_i_Q : 1'b0;
    assign codasip_tmp_var_3 = (((!codasip_tmp_var_2) && (!codasip_tmp_var_1)) && (!codasip_tmp_var_0)) ? s_branch_valid_i_Q : 1'b0;
    assign codasip_tmp_var_4 = ((((!codasip_tmp_var_3) && (!codasip_tmp_var_2)) && (!codasip_tmp_var_1)) && (!codasip_tmp_var_0)) ? s_stall_i_Q : 1'b0;
    assign codasip_tmp_var_5 = (((((!codasip_tmp_var_4) && (!codasip_tmp_var_3)) && (!codasip_tmp_var_2)) && (!codasip_tmp_var_1)) && (!codasip_tmp_var_0)) ? s_bp_valid_i_Q : 1'b0;
    assign s_pc_addr_o_D_ACT_wire = codasip_tmp_var_0 ? s_ocd_addr_i_Q :
        codasip_tmp_var_1 ? s_trap_addr_i_Q :
        codasip_tmp_var_2 ? s_csr_addr_i_Q :
        codasip_tmp_var_3 ? s_branch_addr_i_Q :
        codasip_tmp_var_4 ? s_pc_addr_i_Q :
        codasip_tmp_var_5 ? s_bp_addr_i_Q : npc_address_B0;
    assign s_pc_addr_o_D = s_pc_addr_o_D_ACT_wire;
endmodule: codix_berkelium_ca_core_fetch_stage_npc_get_next_addr_t
