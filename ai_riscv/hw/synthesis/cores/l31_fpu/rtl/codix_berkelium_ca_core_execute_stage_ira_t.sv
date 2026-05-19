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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_ira_t' CodAL module.
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

module codix_berkelium_ca_core_execute_stage_ira_t(
    input  logic r_wfi_ce_ICLK,
    input  logic RST,
    input  logic [31:0] r_return_address_D,
    input  logic r_return_address_WE,
    input  logic [31:0] s_ex0_branch_target_i_D,
    input  logic [31:0] s_ex0_csr_addr_i_D,
    input  logic [31:0] s_ex0_instr_addr_i_D,
    input  logic [31:0] s_ex0_intexc_addr_i_D,
    input  logic s_ex0_is_branch_i_D,
    input  logic s_ex0_is_csr_i_D,
    input  logic s_ex0_is_intexc_i_D,
    input  logic s_ex0_is_rvc_i_D,
    input  logic s_ex0_retired_i_D,
    input  logic [31:0] s_ex1_instr_addr_i_D,
    input  logic s_ex1_is_rvc_i_D,
    input  logic s_ex1_retired_i_D,
    input  logic [31:0] s_ocd_addr_i_D,
    input  logic s_ocd_stop_count_i_D,
    input  logic s_ocd_valid_i_D,
    output logic [31:0] r_return_address_Q,
    output logic s_ex0_retired_i_Q,
    output logic s_ex1_retired_i_Q,
    output logic [31:0] s_int_addr_o_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic s_ex0_retired_i;
    // CodAL signal/wire
    logic s_ex0_is_rvc_i;
    // CodAL signal/wire
    logic [31:0] s_ex0_instr_addr_i;
    // CodAL signal/wire
    logic s_ex0_is_branch_i;
    // CodAL signal/wire
    logic [31:0] s_ex0_branch_target_i;
    // CodAL signal/wire
    logic s_ex0_is_csr_i;
    // CodAL signal/wire
    logic [31:0] s_ex0_csr_addr_i;
    // CodAL signal/wire
    logic s_ex1_retired_i;
    // CodAL signal/wire
    logic s_ex1_is_rvc_i;
    // CodAL signal/wire
    logic [31:0] s_ex1_instr_addr_i;
    // CodAL signal/wire
    logic s_ex0_is_intexc_i;
    // CodAL signal/wire
    logic [31:0] s_ex0_intexc_addr_i;
    // CodAL signal/wire
    logic [31:0] s_ocd_addr_i;
    // CodAL signal/wire
    logic s_ocd_valid_i;
    // CodAL signal/wire
    logic s_ocd_stop_count_i;
    // CodAL signal/wire
    logic [31:0] s_int_addr_o;

    // additional declarations:
    logic r_return_address_WE_wire;
    logic update_r_return_address_WE_wire;
    logic [31:0] r_return_address_D_wire;
    logic [31:0] update_r_return_address_D_wire;
    logic [31:0] r_return_address_Q_wire;

    // child instances inside CodAL module:
    // instance of 's_ex0_retired_i' CodAL signal/wire: (single driver)
    assign s_ex0_retired_i = s_ex0_retired_i_D;
    // instance of 's_ex0_retired_i' CodAL signal/wire: (parent port driver(s))
    assign s_ex0_retired_i_Q = s_ex0_retired_i;
    // instance of 's_ex0_is_rvc_i' CodAL signal/wire: (single driver)
    assign s_ex0_is_rvc_i = s_ex0_is_rvc_i_D;
    // instance of 's_ex0_instr_addr_i' CodAL signal/wire: (single driver)
    assign s_ex0_instr_addr_i = s_ex0_instr_addr_i_D;
    // instance of 's_ex0_is_branch_i' CodAL signal/wire: (single driver)
    assign s_ex0_is_branch_i = s_ex0_is_branch_i_D;
    // instance of 's_ex0_branch_target_i' CodAL signal/wire: (single driver)
    assign s_ex0_branch_target_i = s_ex0_branch_target_i_D;
    // instance of 's_ex0_is_csr_i' CodAL signal/wire: (single driver)
    assign s_ex0_is_csr_i = s_ex0_is_csr_i_D;
    // instance of 's_ex0_csr_addr_i' CodAL signal/wire: (single driver)
    assign s_ex0_csr_addr_i = s_ex0_csr_addr_i_D;
    // instance of 's_ex1_retired_i' CodAL signal/wire: (single driver)
    assign s_ex1_retired_i = s_ex1_retired_i_D;
    // instance of 's_ex1_retired_i' CodAL signal/wire: (parent port driver(s))
    assign s_ex1_retired_i_Q = s_ex1_retired_i;
    // instance of 's_ex1_is_rvc_i' CodAL signal/wire: (single driver)
    assign s_ex1_is_rvc_i = s_ex1_is_rvc_i_D;
    // instance of 's_ex1_instr_addr_i' CodAL signal/wire: (single driver)
    assign s_ex1_instr_addr_i = s_ex1_instr_addr_i_D;
    // instance of 's_ex0_is_intexc_i' CodAL signal/wire: (single driver)
    assign s_ex0_is_intexc_i = s_ex0_is_intexc_i_D;
    // instance of 's_ex0_intexc_addr_i' CodAL signal/wire: (single driver)
    assign s_ex0_intexc_addr_i = s_ex0_intexc_addr_i_D;
    // instance of 's_ocd_addr_i' CodAL signal/wire: (single driver)
    assign s_ocd_addr_i = s_ocd_addr_i_D;
    // instance of 's_ocd_valid_i' CodAL signal/wire: (single driver)
    assign s_ocd_valid_i = s_ocd_valid_i_D;
    // instance of 's_ocd_stop_count_i' CodAL signal/wire: (single driver)
    assign s_ocd_stop_count_i = s_ocd_stop_count_i_D;
    // instance of 's_int_addr_o' CodAL signal/wire: (parent port driver(s))
    assign s_int_addr_o_Q = s_int_addr_o;
    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_return_address (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(r_return_address_WE_wire),
        .D(r_return_address_D_wire),
        .Q(r_return_address_Q_wire)
    );
    assign r_return_address_WE_wire = r_return_address_WE |
        update_r_return_address_WE_wire;
    assign r_return_address_D_wire = r_return_address_D |
        update_r_return_address_D_wire;
    assign r_return_address_Q = r_return_address_Q_wire;

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_ira_update_t update (
        .s_ex0_branch_target_i_Q(s_ex0_branch_target_i),
        .s_ex0_csr_addr_i_Q(s_ex0_csr_addr_i),
        .s_ex0_instr_addr_i_Q(s_ex0_instr_addr_i),
        .s_ex0_intexc_addr_i_Q(s_ex0_intexc_addr_i),
        .s_ex0_is_branch_i_Q(s_ex0_is_branch_i),
        .s_ex0_is_csr_i_Q(s_ex0_is_csr_i),
        .s_ex0_is_intexc_i_Q(s_ex0_is_intexc_i),
        .s_ex0_is_rvc_i_Q(s_ex0_is_rvc_i),
        .s_ex0_retired_i_Q(s_ex0_retired_i),
        .s_ex1_instr_addr_i_Q(s_ex1_instr_addr_i),
        .s_ex1_is_rvc_i_Q(s_ex1_is_rvc_i),
        .s_ex1_retired_i_Q(s_ex1_retired_i),
        .s_ocd_addr_i_Q(s_ocd_addr_i),
        .s_ocd_stop_count_i_Q(s_ocd_stop_count_i),
        .s_ocd_valid_i_Q(s_ocd_valid_i),
        .r_return_address_D(update_r_return_address_D_wire),
        .r_return_address_WE(update_r_return_address_WE_wire)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_ira_outputs_t outputs (
        .r_return_address_Q(r_return_address_Q_wire),
        .s_int_addr_o_D(s_int_addr_o)
    );

endmodule: codix_berkelium_ca_core_execute_stage_ira_t
