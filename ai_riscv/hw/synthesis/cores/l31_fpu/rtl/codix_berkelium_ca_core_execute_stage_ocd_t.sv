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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_ocd_t' CodAL module.
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

module codix_berkelium_ca_core_execute_stage_ocd_t #(
    parameter [31:0] progbuf_base_p = 32'h00020000
) (
    input  logic r_wfi_ce_ICLK,
    input  logic RST,
    input  logic [29:0] r_csr_dcsr_Q,
    input  logic [31:0] r_csr_dpc_Q,
    input  logic [1:0] r_prv_Q,
    input  logic s_dm_active_i_D,
    input  logic s_dm_halt_i_D,
    input  logic s_dm_halt_Q,
    input  logic s_dm_progbuf_en_i_D,
    input  logic [4:0] s_exc_type_i_D,
    input  logic s_exc_valid_i_D,
    input  logic [31:0] s_instr_addr_i_D,
    input  logic s_instr_commit_i_D,
    input  logic s_instr_valid_i_D,
    output logic s_dm_progbuf_done_o_Q,
    output logic s_dm_progbuf_exc_o_Q,
    output logic s_hart_halted_o_Q,
    output logic [31:0] s_ocd_addr_o_Q,
    output logic s_ocd_busy_o_Q,
    output logic [31:0] s_ocd_dcsr_o_Q,
    output logic s_ocd_debug_mode_req_o_Q,
    output logic [31:0] s_ocd_dpc_o_Q,
    output logic s_ocd_flush_o_Q,
    output logic s_ocd_progbuf_mode_o_Q,
    output logic s_ocd_step_commited_o_Q,
    output logic s_ocd_step_mode_o_Q,
    output logic s_ocd_user_mod_req_o_Q,
    output logic s_ocd_valid_o_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic [31:0] s_instr_addr_i;
    // CodAL signal/wire
    logic s_instr_valid_i;
    // CodAL signal/wire
    logic s_instr_commit_i;
    // CodAL signal/wire
    logic s_dm_active_i;
    // CodAL signal/wire
    logic s_dm_halt_i;
    // CodAL signal/wire
    logic s_dm_progbuf_en_i;
    // CodAL signal/wire
    logic s_exc_valid_i;
    // CodAL signal/wire
    logic [4:0] s_exc_type_i;
    // CodAL signal/wire
    logic s_hart_halted_o;
    // CodAL signal/wire
    logic s_dm_progbuf_done_o;
    // CodAL signal/wire
    logic s_dm_progbuf_exc_o;
    // CodAL signal/wire
    logic s_ocd_valid_o;
    // CodAL signal/wire
    logic [31:0] s_ocd_addr_o;
    // CodAL signal/wire
    logic s_ocd_busy_o;
    // CodAL signal/wire
    logic s_ocd_flush_o;
    // CodAL signal/wire
    logic s_ocd_progbuf_mode_o;
    // CodAL signal/wire
    logic s_ocd_debug_mode_req_o;
    // CodAL signal/wire
    logic s_ocd_user_mod_req_o;
    // CodAL signal/wire
    logic s_ocd_step_mode_o;
    // CodAL signal/wire
    logic s_ocd_step_commited_o;
    // CodAL signal/wire
    logic [31:0] s_ocd_dcsr_o;
    // CodAL signal/wire
    logic [31:0] s_ocd_dpc_o;
    // CodAL signal/wire
    logic [2:0] s_user_mode_value;
    // CodAL signal/wire
    logic [2:0] s_debug_req_value;
    // CodAL signal/wire
    logic [2:0] s_debug_after_req_value;
    // CodAL signal/wire
    logic [2:0] s_debug_mode_value;
    // CodAL signal/wire
    logic [2:0] s_progbuf_mode_value;
    // CodAL signal/wire
    logic s_debug_mode_before_req;
    // CodAL signal/wire
    logic s_state_user_mode;

    // additional declarations:
    logic ocd_fsm_r_debug_state_WE_wire;
    logic [2:0] ocd_fsm_r_debug_state_D_wire;
    logic [2:0] r_debug_state_Q_wire;
    logic ocd_fsm_r_step_cause_WE_wire;
    logic ocd_fsm_r_step_cause_D_wire;
    logic r_step_cause_Q_wire;

    // child instances inside CodAL module:
    // instance of 's_instr_addr_i' CodAL signal/wire: (single driver)
    assign s_instr_addr_i = s_instr_addr_i_D;
    // instance of 's_instr_valid_i' CodAL signal/wire: (single driver)
    assign s_instr_valid_i = s_instr_valid_i_D;
    // instance of 's_instr_commit_i' CodAL signal/wire: (single driver)
    assign s_instr_commit_i = s_instr_commit_i_D;
    // instance of 's_dm_active_i' CodAL signal/wire: (single driver)
    assign s_dm_active_i = s_dm_active_i_D;
    // instance of 's_dm_halt_i' CodAL signal/wire: (single driver)
    assign s_dm_halt_i = s_dm_halt_i_D;
    // instance of 's_dm_progbuf_en_i' CodAL signal/wire: (single driver)
    assign s_dm_progbuf_en_i = s_dm_progbuf_en_i_D;
    // instance of 's_exc_valid_i' CodAL signal/wire: (single driver)
    assign s_exc_valid_i = s_exc_valid_i_D;
    // instance of 's_exc_type_i' CodAL signal/wire: (single driver)
    assign s_exc_type_i = s_exc_type_i_D;
    // instance of 's_hart_halted_o' CodAL signal/wire: (parent port driver(s))
    assign s_hart_halted_o_Q = s_hart_halted_o;
    // instance of 's_dm_progbuf_done_o' CodAL signal/wire: (parent port driver(s))
    assign s_dm_progbuf_done_o_Q = s_dm_progbuf_done_o;
    // instance of 's_dm_progbuf_exc_o' CodAL signal/wire: (parent port driver(s))
    assign s_dm_progbuf_exc_o_Q = s_dm_progbuf_exc_o;
    // instance of 's_ocd_valid_o' CodAL signal/wire: (parent port driver(s))
    assign s_ocd_valid_o_Q = s_ocd_valid_o;
    // instance of 's_ocd_addr_o' CodAL signal/wire: (parent port driver(s))
    assign s_ocd_addr_o_Q = s_ocd_addr_o;
    // instance of 's_ocd_busy_o' CodAL signal/wire: (parent port driver(s))
    assign s_ocd_busy_o_Q = s_ocd_busy_o;
    // instance of 's_ocd_flush_o' CodAL signal/wire: (parent port driver(s))
    assign s_ocd_flush_o_Q = s_ocd_flush_o;
    // instance of 's_ocd_progbuf_mode_o' CodAL signal/wire: (parent port driver(s))
    assign s_ocd_progbuf_mode_o_Q = s_ocd_progbuf_mode_o;
    // instance of 's_ocd_debug_mode_req_o' CodAL signal/wire: (parent port driver(s))
    assign s_ocd_debug_mode_req_o_Q = s_ocd_debug_mode_req_o;
    // instance of 's_ocd_user_mod_req_o' CodAL signal/wire: (parent port driver(s))
    assign s_ocd_user_mod_req_o_Q = s_ocd_user_mod_req_o;
    // instance of 's_ocd_step_mode_o' CodAL signal/wire: (parent port driver(s))
    assign s_ocd_step_mode_o_Q = s_ocd_step_mode_o;
    // instance of 's_ocd_step_commited_o' CodAL signal/wire: (parent port driver(s))
    assign s_ocd_step_commited_o_Q = s_ocd_step_commited_o;
    // instance of 's_ocd_dcsr_o' CodAL signal/wire: (parent port driver(s))
    assign s_ocd_dcsr_o_Q = s_ocd_dcsr_o;
    // instance of 's_ocd_dpc_o' CodAL signal/wire: (parent port driver(s))
    assign s_ocd_dpc_o_Q = s_ocd_dpc_o;
    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_debug_state (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(ocd_fsm_r_debug_state_WE_wire),
        .D(ocd_fsm_r_debug_state_D_wire),
        .Q(r_debug_state_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_step_cause (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(ocd_fsm_r_step_cause_WE_wire),
        .D(ocd_fsm_r_step_cause_D_wire),
        .Q(r_step_cause_Q_wire)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_ocd_ocd_output_t ocd_output (
        .r_csr_dcsr_Q(r_csr_dcsr_Q[0]),
        .r_debug_state_Q(r_debug_state_Q_wire),
        .s_ocd_step_commited_o_D(s_ocd_step_commited_o),
        .s_ocd_step_mode_o_D(s_ocd_step_mode_o)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_ocd_compute_t #(
        .progbuf_base_p(progbuf_base_p)
    ) compute (
        .r_csr_dcsr_Q(r_csr_dcsr_Q),
        .r_csr_dpc_Q(r_csr_dpc_Q),
        .r_debug_state_Q(r_debug_state_Q_wire),
        .r_prv_Q(r_prv_Q),
        .r_step_cause_Q(r_step_cause_Q_wire),
        .s_debug_mode_before_req_Q(s_debug_mode_before_req),
        .s_dm_active_i_Q(s_dm_active_i),
        .s_dm_halt_i_Q(s_dm_halt_i),
        .s_dm_halt_Q(s_dm_halt_Q),
        .s_dm_progbuf_en_i_Q(s_dm_progbuf_en_i),
        .s_exc_type_i_Q(s_exc_type_i),
        .s_exc_valid_i_Q(s_exc_valid_i),
        .s_instr_addr_i_Q(s_instr_addr_i),
        .s_instr_valid_i_Q(s_instr_valid_i),
        .s_state_user_mode_Q(s_state_user_mode),
        .s_debug_after_req_value_D(s_debug_after_req_value),
        .s_debug_mode_before_req_D(s_debug_mode_before_req),
        .s_debug_mode_value_D(s_debug_mode_value),
        .s_debug_req_value_D(s_debug_req_value),
        .s_dm_progbuf_done_o_D(s_dm_progbuf_done_o),
        .s_dm_progbuf_exc_o_D(s_dm_progbuf_exc_o),
        .s_hart_halted_o_D(s_hart_halted_o),
        .s_ocd_addr_o_D(s_ocd_addr_o),
        .s_ocd_busy_o_D(s_ocd_busy_o),
        .s_ocd_dcsr_o_D(s_ocd_dcsr_o),
        .s_ocd_debug_mode_req_o_D(s_ocd_debug_mode_req_o),
        .s_ocd_dpc_o_D(s_ocd_dpc_o),
        .s_ocd_flush_o_D(s_ocd_flush_o),
        .s_ocd_progbuf_mode_o_D(s_ocd_progbuf_mode_o),
        .s_ocd_user_mod_req_o_D(s_ocd_user_mod_req_o),
        .s_ocd_valid_o_D(s_ocd_valid_o),
        .s_progbuf_mode_value_D(s_progbuf_mode_value),
        .s_state_user_mode_D(s_state_user_mode)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_ocd_ocd_fsm_t ocd_fsm (
        .r_csr_dcsr_Q(r_csr_dcsr_Q[0]),
        .r_debug_state_Q(r_debug_state_Q_wire),
        .r_step_cause_Q(r_step_cause_Q_wire),
        .s_debug_after_req_value_Q(s_debug_after_req_value),
        .s_debug_mode_before_req_Q(s_debug_mode_before_req),
        .s_debug_mode_value_Q(s_debug_mode_value),
        .s_debug_req_value_Q(s_debug_req_value),
        .s_instr_commit_i_Q(s_instr_commit_i),
        .s_progbuf_mode_value_Q(s_progbuf_mode_value),
        .s_state_user_mode_Q(s_state_user_mode),
        .s_user_mode_value_Q(s_user_mode_value),
        .r_debug_state_D(ocd_fsm_r_debug_state_D_wire),
        .r_debug_state_WE(ocd_fsm_r_debug_state_WE_wire),
        .r_step_cause_D(ocd_fsm_r_step_cause_D_wire),
        .r_step_cause_WE(ocd_fsm_r_step_cause_WE_wire),
        .s_user_mode_value_D(s_user_mode_value)
    );

endmodule: codix_berkelium_ca_core_execute_stage_ocd_t
