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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_npc_t' CodAL module.
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

module codix_berkelium_ca_core_fetch_stage_npc_t(
    input  logic [31:0] s_bp_addr_i_D,
    input  logic s_bp_valid_i_D,
    input  logic [31:0] s_branch_addr_i_D,
    input  logic s_branch_valid_i_D,
    input  logic [31:0] s_csr_addr_i_D,
    input  logic s_csr_valid_i_D,
    input  logic [31:0] s_ocd_addr_i_D,
    input  logic s_ocd_valid_i_D,
    input  logic [31:0] s_pc_addr_i_D,
    input  logic s_stall_i_D,
    input  logic [31:0] s_trap_addr_i_D,
    input  logic s_trap_valid_i_D,
    output logic [31:0] s_ifu_addr_o_Q,
    output logic [1:0] s_ifu_valid_o_Q,
    output logic [31:0] s_pc_addr_o_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic [31:0] s_pc_addr_i;
    // CodAL signal/wire
    logic [31:0] s_trap_addr_i;
    // CodAL signal/wire
    logic [31:0] s_bp_addr_i;
    // CodAL signal/wire
    logic [31:0] s_branch_addr_i;
    // CodAL signal/wire
    logic [31:0] s_ocd_addr_i;
    // CodAL signal/wire
    logic [31:0] s_csr_addr_i;
    // CodAL signal/wire
    logic s_trap_valid_i;
    // CodAL signal/wire
    logic s_bp_valid_i;
    // CodAL signal/wire
    logic s_branch_valid_i;
    // CodAL signal/wire
    logic s_ocd_valid_i;
    // CodAL signal/wire
    logic s_csr_valid_i;
    // CodAL signal/wire
    logic s_stall_i;
    // CodAL signal/wire
    logic [31:0] s_ifu_addr_o;
    // CodAL signal/wire
    logic [31:0] s_pc_addr_o;
    // CodAL signal/wire
    logic [1:0] s_ifu_valid_o;

    // child instances inside CodAL module:
    // instance of 's_pc_addr_i' CodAL signal/wire: (single driver)
    assign s_pc_addr_i = s_pc_addr_i_D;
    // instance of 's_trap_addr_i' CodAL signal/wire: (single driver)
    assign s_trap_addr_i = s_trap_addr_i_D;
    // instance of 's_bp_addr_i' CodAL signal/wire: (single driver)
    assign s_bp_addr_i = s_bp_addr_i_D;
    // instance of 's_branch_addr_i' CodAL signal/wire: (single driver)
    assign s_branch_addr_i = s_branch_addr_i_D;
    // instance of 's_ocd_addr_i' CodAL signal/wire: (single driver)
    assign s_ocd_addr_i = s_ocd_addr_i_D;
    // instance of 's_csr_addr_i' CodAL signal/wire: (single driver)
    assign s_csr_addr_i = s_csr_addr_i_D;
    // instance of 's_trap_valid_i' CodAL signal/wire: (single driver)
    assign s_trap_valid_i = s_trap_valid_i_D;
    // instance of 's_bp_valid_i' CodAL signal/wire: (single driver)
    assign s_bp_valid_i = s_bp_valid_i_D;
    // instance of 's_branch_valid_i' CodAL signal/wire: (single driver)
    assign s_branch_valid_i = s_branch_valid_i_D;
    // instance of 's_ocd_valid_i' CodAL signal/wire: (single driver)
    assign s_ocd_valid_i = s_ocd_valid_i_D;
    // instance of 's_csr_valid_i' CodAL signal/wire: (single driver)
    assign s_csr_valid_i = s_csr_valid_i_D;
    // instance of 's_stall_i' CodAL signal/wire: (single driver)
    assign s_stall_i = s_stall_i_D;
    // instance of 's_ifu_addr_o' CodAL signal/wire: (parent port driver(s))
    assign s_ifu_addr_o_Q = s_ifu_addr_o;
    // instance of 's_pc_addr_o' CodAL signal/wire: (parent port driver(s))
    assign s_pc_addr_o_Q = s_pc_addr_o;
    // instance of 's_ifu_valid_o' CodAL signal/wire: (parent port driver(s))
    assign s_ifu_valid_o_Q = s_ifu_valid_o;
    // functional unit instance:
    codix_berkelium_ca_core_fetch_stage_npc_get_ifu_addr_t get_ifu_addr (
        .s_pc_addr_i_Q(s_pc_addr_i[31:1]),
        .s_ifu_addr_o_D(s_ifu_addr_o),
        .s_ifu_valid_o_D(s_ifu_valid_o)
    );

    // functional unit instance:
    codix_berkelium_ca_core_fetch_stage_npc_get_next_addr_t get_next_addr (
        .s_bp_addr_i_Q(s_bp_addr_i),
        .s_bp_valid_i_Q(s_bp_valid_i),
        .s_branch_addr_i_Q(s_branch_addr_i),
        .s_branch_valid_i_Q(s_branch_valid_i),
        .s_csr_addr_i_Q(s_csr_addr_i),
        .s_csr_valid_i_Q(s_csr_valid_i),
        .s_ocd_addr_i_Q(s_ocd_addr_i),
        .s_ocd_valid_i_Q(s_ocd_valid_i),
        .s_pc_addr_i_Q(s_pc_addr_i),
        .s_stall_i_Q(s_stall_i),
        .s_trap_addr_i_Q(s_trap_addr_i),
        .s_trap_valid_i_Q(s_trap_valid_i),
        .s_pc_addr_o_D(s_pc_addr_o)
    );

endmodule: codix_berkelium_ca_core_fetch_stage_npc_t
