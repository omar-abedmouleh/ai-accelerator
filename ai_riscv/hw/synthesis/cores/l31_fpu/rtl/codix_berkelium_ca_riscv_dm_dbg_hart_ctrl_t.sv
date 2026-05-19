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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_riscv_dm_dbg_hart_ctrl_t' RISC-V Debug - DM and core state.
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

module codix_berkelium_ca_riscv_dm_dbg_hart_ctrl_t(
    input  logic CLK,
    input  logic RST,
    input  logic dbg_cmd_postexec,
    input  logic dbg_cmd_valid,
    input  logic dbg_halt_req,
    input  logic dbg_resume_req,
    input  logic hart_halted,
    input  logic hart_progbuf_done,
    output logic DEBUG_MODE,
    output logic dm_halt,
    output logic halted,
    output logic resumeack
);
    // type, wire and constant declarations:
    // FSM state register enumeration type
    typedef enum logic [2:0]
    {
        STATE_USER_MODE = 3'b000,
        STATE_USER_WAIT = 3'b001,
        STATE_DEBUG_WAIT = 3'b010,
        STATE_DEBUG_MODE = 3'b011,
        STATE_PROGBUF_MODE = 3'b100
    } state_reg_type;

    // FSM state register (current state)
    state_reg_type state_reg_Q;
    // FSM state register (next state)
    state_reg_type state_reg_D;
    // signal/wire
    logic state_user_wait_wire;
    // signal/wire
    logic state_debug_wait_wire;
    // signal/wire
    logic state_debug_mode_wire;
    // signal/wire
    logic state_progbuf_mode_wire;
    // signal/wire
    logic resumeack_wire;

    // additional declarations:
    logic resumeack_reg_WE;
    logic resumeack_reg_D;
    logic resumeack_reg_Q;
    logic halted_reg_D;
    logic halted_reg_Q;

    // FSM state register
    always_ff @( posedge CLK or negedge RST ) begin
        if ( RST == 1'b0 ) begin
            state_reg_Q <= STATE_USER_MODE;
        end else begin
            state_reg_Q <= state_reg_D;
        end
    end

    // FSM transitions (next state logic)
    always_comb begin
        unique case ( state_reg_Q )
            STATE_USER_MODE: begin
                if ( ((dbg_halt_req == 1'b1) || (hart_halted == 1'b1)) ) begin
                    state_reg_D = STATE_DEBUG_WAIT;
                end else begin
                    state_reg_D = STATE_USER_MODE;
                end
            end
            STATE_USER_WAIT: begin
                if ( (hart_halted == 1'b0) ) begin
                    state_reg_D = STATE_USER_MODE;
                end else begin
                    state_reg_D = STATE_USER_WAIT;
                end
            end
            STATE_DEBUG_WAIT: begin
                if ( (hart_halted == 1'b1) ) begin
                    state_reg_D = STATE_DEBUG_MODE;
                end else begin
                    state_reg_D = STATE_DEBUG_WAIT;
                end
            end
            STATE_DEBUG_MODE: begin
                if ( ((dbg_cmd_valid == 1'b1) && (dbg_cmd_postexec == 1'b1)) ) begin
                    state_reg_D = STATE_PROGBUF_MODE;
                end else if ( (dbg_resume_req == 1'b1) ) begin
                    state_reg_D = STATE_USER_WAIT;
                end else begin
                    state_reg_D = STATE_DEBUG_MODE;
                end
            end
            STATE_PROGBUF_MODE: begin
                if ( (hart_progbuf_done == 1'b1) ) begin
                    state_reg_D = STATE_DEBUG_MODE;
                end else begin
                    state_reg_D = STATE_PROGBUF_MODE;
                end
            end
            // FSM is complete, but not all 2-state values are used
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: begin
                state_reg_D = STATE_USER_MODE;
            end
            // pragma coverage on
            // VCS coverage on
        endcase
    end

    // child instances inside RISC-V Debug - DM and core state:
    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) resumeack_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(resumeack_reg_WE),
        .D(resumeack_reg_D),
        .Q(resumeack_reg_Q)
    );

    // register instance:
    d_ff_rst_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) halted_reg (
        .CLK(CLK),
        .RST(RST),
        .D(halted_reg_D),
        .Q(halted_reg_Q)
    );

    // data-path code:
    assign state_user_wait_wire = (state_reg_Q == STATE_USER_WAIT);
    assign state_debug_wait_wire = (state_reg_Q == STATE_DEBUG_WAIT);
    assign state_debug_mode_wire = (state_reg_Q == STATE_DEBUG_MODE);
    assign state_progbuf_mode_wire = (state_reg_Q == STATE_PROGBUF_MODE);
    assign resumeack_wire = (state_user_wait_wire & (~hart_halted));
    assign resumeack_reg_D = resumeack_wire;
    assign resumeack_reg_WE = (resumeack_wire | (resumeack_reg_Q & dbg_resume_req));
    assign halted_reg_D = (state_debug_mode_wire | state_progbuf_mode_wire);
    assign DEBUG_MODE = state_debug_mode_wire;
    assign dm_halt = (state_debug_wait_wire | state_debug_mode_wire);
    assign halted = halted_reg_Q;
    assign resumeack = resumeack_reg_Q;
endmodule: codix_berkelium_ca_riscv_dm_dbg_hart_ctrl_t
