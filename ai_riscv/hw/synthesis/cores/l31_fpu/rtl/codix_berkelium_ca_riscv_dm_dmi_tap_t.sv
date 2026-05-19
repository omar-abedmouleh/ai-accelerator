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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_riscv_dm_dmi_tap_t' RISC-V Debug - JTAG Test Access port specified by IEEE Std 1149.1-2001.
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

module codix_berkelium_ca_riscv_dm_dmi_tap_t(
    input  logic TCK,
    input  logic TRST,
    input  logic TMS,
    input  logic TDI,
    input  logic [31:0] dmi_data,
    input  logic [1:0] dtmcs_dmistat,
    input  logic SCANMODE,
    output logic TDO,
    output logic CAPTURE_DR,
    output logic dmi_sel,
    output logic dtmcs_sel,
    output logic [40:0] shift_reg_data,
    output logic UPDATE_DR
);
    // type, wire and constant declarations:
    // signal/wire
    logic state_capture_dr_wire;
    // signal/wire
    logic state_shift_dr_wire;
    // signal/wire
    logic state_update_dr_wire;
    // signal/wire
    logic state_capture_ir_wire;
    // signal/wire
    logic state_shift_ir_wire;
    // signal/wire
    logic idcode_sel_wire;
    // signal/wire
    logic dtmcs_sel_wire;
    // signal/wire
    logic dmi_sel_wire;
    // FSM state register enumeration type
    typedef enum logic [3:0]
    {
        STATE_TEST_LOGIC_RESET = 4'b0000,
        STATE_RUN_TEST_IDLE = 4'b0001,
        STATE_SELECT_DR = 4'b0010,
        STATE_SELECT_IR = 4'b0011,
        STATE_CAPTURE_DR = 4'b0100,
        STATE_SHIFT_DR = 4'b0101,
        STATE_EXIT1_DR = 4'b0110,
        STATE_PAUSE_DR = 4'b0111,
        STATE_EXIT2_DR = 4'b1000,
        STATE_UPDATE_DR = 4'b1001,
        STATE_CAPTURE_IR = 4'b1010,
        STATE_SHIFT_IR = 4'b1011,
        STATE_EXIT1_IR = 4'b1100,
        STATE_PAUSE_IR = 4'b1101,
        STATE_EXIT2_IR = 4'b1110,
        STATE_UPDATE_IR = 4'b1111
    } state_reg_type;

    // FSM state register (current state)
    state_reg_type state_reg_Q;
    // FSM state register (next state)
    state_reg_type state_reg_D;
    // the size of address in 'dmi'
    localparam logic [5:0] DTMCS_ABITS = 6'h07;
    // hint to the debugger specifying how long to stay in Run-Teset/Idle
    localparam logic [2:0] DTMCS_IDLE = 3'h7;
    // Implementation compliant with the RISC-V Debug 0.13 specification
    localparam logic [3:0] DTMCS_VERSION = 4'h1;
    // value of the 'BYPASS' instruction
    localparam logic [4:0] INSTR_BYPASS0 = 5'h00;
    // value of the 'BYPASS' instruction
    localparam logic [4:0] INSTR_BYPASS1 = 5'h1f;
    // value of the 'Debug Module Interface Access (dmi)' instruction
    localparam logic [4:0] INSTR_DMI = 5'h11;
    // value of the 'DTM Control and Status (dtmcs)' instruction
    localparam logic [4:0] INSTR_DTMCS = 5'h10;
    // value of the 'IDCODE' instruction
    localparam logic [4:0] INSTR_IDCODE = 5'h01;
    // JTAG TAP identification
    localparam logic [31:0] JTAG_ID = 32'h10001a07;

    // additional declarations:
    logic TCKn_gen_ICLK;
    logic instr_reg_WE;
    logic [4:0] instr_reg_D;
    logic [4:0] instr_reg_Q;
    logic shift_reg_WE;
    logic [40:0] shift_reg_D;
    logic [40:0] shift_reg_Q;
    logic TDO_reg_CLK;
    logic TDO_reg_D;
    logic TDO_reg_Q;

    // FSM state register
    always_ff @( posedge TCK or negedge TRST ) begin
        if ( TRST == 1'b0 ) begin
            state_reg_Q <= STATE_TEST_LOGIC_RESET;
        end else begin
            state_reg_Q <= state_reg_D;
        end
    end

    // FSM transitions (next state logic)
    always_comb begin
        unique case ( state_reg_Q )
            STATE_TEST_LOGIC_RESET: begin
                if ( (TMS == 1'b1) ) begin
                    state_reg_D = STATE_TEST_LOGIC_RESET;
                end else begin
                    state_reg_D = STATE_RUN_TEST_IDLE;
                end
            end
            STATE_RUN_TEST_IDLE: begin
                if ( (TMS == 1'b1) ) begin
                    state_reg_D = STATE_SELECT_DR;
                end else begin
                    state_reg_D = STATE_RUN_TEST_IDLE;
                end
            end
            STATE_SELECT_DR: begin
                if ( (TMS == 1'b1) ) begin
                    state_reg_D = STATE_SELECT_IR;
                end else begin
                    state_reg_D = STATE_CAPTURE_DR;
                end
            end
            STATE_SELECT_IR: begin
                if ( (TMS == 1'b1) ) begin
                    state_reg_D = STATE_TEST_LOGIC_RESET;
                end else begin
                    state_reg_D = STATE_CAPTURE_IR;
                end
            end
            STATE_CAPTURE_DR: begin
                if ( (TMS == 1'b1) ) begin
                    state_reg_D = STATE_EXIT1_DR;
                end else begin
                    state_reg_D = STATE_SHIFT_DR;
                end
            end
            STATE_SHIFT_DR: begin
                if ( (TMS == 1'b1) ) begin
                    state_reg_D = STATE_EXIT1_DR;
                end else begin
                    state_reg_D = STATE_SHIFT_DR;
                end
            end
            STATE_EXIT1_DR: begin
                if ( (TMS == 1'b1) ) begin
                    state_reg_D = STATE_UPDATE_DR;
                end else begin
                    state_reg_D = STATE_PAUSE_DR;
                end
            end
            STATE_PAUSE_DR: begin
                if ( (TMS == 1'b1) ) begin
                    state_reg_D = STATE_EXIT2_DR;
                end else begin
                    state_reg_D = STATE_PAUSE_DR;
                end
            end
            STATE_EXIT2_DR: begin
                if ( (TMS == 1'b1) ) begin
                    state_reg_D = STATE_UPDATE_DR;
                end else begin
                    state_reg_D = STATE_SHIFT_DR;
                end
            end
            STATE_UPDATE_DR: begin
                if ( (TMS == 1'b1) ) begin
                    state_reg_D = STATE_SELECT_DR;
                end else begin
                    state_reg_D = STATE_RUN_TEST_IDLE;
                end
            end
            STATE_CAPTURE_IR: begin
                if ( (TMS == 1'b1) ) begin
                    state_reg_D = STATE_EXIT1_IR;
                end else begin
                    state_reg_D = STATE_SHIFT_IR;
                end
            end
            STATE_SHIFT_IR: begin
                if ( (TMS == 1'b1) ) begin
                    state_reg_D = STATE_EXIT1_IR;
                end else begin
                    state_reg_D = STATE_SHIFT_IR;
                end
            end
            STATE_EXIT1_IR: begin
                if ( (TMS == 1'b1) ) begin
                    state_reg_D = STATE_UPDATE_IR;
                end else begin
                    state_reg_D = STATE_PAUSE_IR;
                end
            end
            STATE_PAUSE_IR: begin
                if ( (TMS == 1'b1) ) begin
                    state_reg_D = STATE_EXIT2_IR;
                end else begin
                    state_reg_D = STATE_PAUSE_IR;
                end
            end
            STATE_EXIT2_IR: begin
                if ( (TMS == 1'b1) ) begin
                    state_reg_D = STATE_UPDATE_IR;
                end else begin
                    state_reg_D = STATE_SHIFT_IR;
                end
            end
            STATE_UPDATE_IR: begin
                if ( (TMS == 1'b1) ) begin
                    state_reg_D = STATE_SELECT_DR;
                end else begin
                    state_reg_D = STATE_RUN_TEST_IDLE;
                end
            end
            // fully defined FSM (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: begin
                state_reg_D = STATE_TEST_LOGIC_RESET;
            end
            // pragma translate_on
        endcase
    end

    // child instances inside RISC-V Debug - JTAG Test Access port specified by IEEE Std 1149.1-2001:
    // Inverted clock generation unit instance:
    codasip_clock_inv_gen_t TCKn_gen (
        .CLK(TCK),
        .SCANMODE(SCANMODE),
        .ICLK(TCKn_gen_ICLK)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h01),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) instr_reg (
        .CLK(TCK),
        .RST(TRST),
        .WE(instr_reg_WE),
        .D(instr_reg_D),
        .Q(instr_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd41),
        .DEFAULT_VALUE(41'h00000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) shift_reg (
        .CLK(TCK),
        .RST(TRST),
        .WE(shift_reg_WE),
        .D(shift_reg_D),
        .Q(shift_reg_Q)
    );

    // register instance:
    d_ff_rst_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) TDO_reg (
        .CLK(TDO_reg_CLK),
        .RST(TRST),
        .D(TDO_reg_D),
        .Q(TDO_reg_Q)
    );

    // data-path code:
    assign TDO_reg_CLK = TCKn_gen_ICLK;
    assign state_capture_dr_wire = (state_reg_Q == STATE_CAPTURE_DR);
    assign state_shift_dr_wire = (state_reg_Q == STATE_SHIFT_DR);
    assign state_update_dr_wire = (state_reg_Q == STATE_UPDATE_DR);
    assign state_capture_ir_wire = (state_reg_Q == STATE_CAPTURE_IR);
    assign state_shift_ir_wire = (state_reg_Q == STATE_SHIFT_IR);
    assign idcode_sel_wire = (instr_reg_Q == INSTR_IDCODE);
    assign dtmcs_sel_wire = (instr_reg_Q == INSTR_DTMCS);
    assign dmi_sel_wire = (instr_reg_Q == INSTR_DMI);
    assign instr_reg_D = (state_reg_Q == STATE_TEST_LOGIC_RESET) ? INSTR_IDCODE :
        (shift_reg_Q[4:0] == INSTR_BYPASS0) ? INSTR_BYPASS1 : shift_reg_Q[4:0];
    assign instr_reg_WE = ((state_reg_Q == STATE_TEST_LOGIC_RESET) || (state_reg_Q == STATE_UPDATE_IR));
    assign shift_reg_D = ((state_capture_dr_wire == 1'b1) && (dmi_sel_wire == 1'b1)) ? {7'h00, dmi_data, dtmcs_dmistat} :
        ((state_capture_dr_wire == 1'b1) && (dtmcs_sel_wire == 1'b1)) ? {26'h0000000, DTMCS_IDLE, dtmcs_dmistat, DTMCS_ABITS, DTMCS_VERSION} :
        ((state_capture_dr_wire == 1'b1) && (idcode_sel_wire == 1'b1)) ? {9'h000, JTAG_ID} :
        ((state_shift_dr_wire == 1'b1) && (dmi_sel_wire == 1'b1)) ? {TDI, shift_reg_Q[40:1]} :
        ((state_shift_dr_wire == 1'b1) && ((dtmcs_sel_wire == 1'b1) || (idcode_sel_wire == 1'b1))) ? {9'h000, TDI, shift_reg_Q[31:1]} :
        (state_shift_dr_wire == 1'b1) ? {40'h0000000000, TDI} :
        (state_capture_ir_wire == 1'b1) ? 41'h00000000001 :
        (state_shift_ir_wire == 1'b1) ? {36'h000000000, TDI, shift_reg_Q[4:1]} : shift_reg_Q;
    assign shift_reg_WE = ((state_capture_dr_wire | state_shift_dr_wire) | (state_capture_ir_wire | state_shift_ir_wire));
    assign TDO_reg_D = shift_reg_Q[0];
    assign TDO = TDO_reg_Q;
    assign shift_reg_data = shift_reg_Q;
    assign CAPTURE_DR = state_capture_dr_wire;
    assign UPDATE_DR = state_update_dr_wire;
    assign dtmcs_sel = dtmcs_sel_wire;
    assign dmi_sel = dmi_sel_wire;
endmodule: codix_berkelium_ca_riscv_dm_dmi_tap_t
