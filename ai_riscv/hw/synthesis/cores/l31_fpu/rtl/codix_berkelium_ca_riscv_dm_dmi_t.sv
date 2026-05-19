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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_riscv_dm_dmi_t' RISC-V Debug - DMI (Debug Module Interface).
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

module codix_berkelium_ca_riscv_dm_dmi_t(
    input  logic CLK,
    input  logic TCK,
    input  logic RST,
    input  logic TRST,
    input  logic TMS,
    input  logic TDI,
    input  logic ACK,
    input  logic [31:0] RDATA,
    input  logic SCANMODE,
    output logic TDO,
    output logic [6:0] ADDR,
    output logic CS,
    output logic [31:0] WDATA,
    output logic WE
);
    // type, wire and constant declarations:
    // FSM state register enumeration type
    typedef enum logic [1:0]
    {
        STATE_IDLE = 2'b00,
        STATE_TRANS = 2'b10,
        STATE_FAIL_BUSY = 2'b11
    } state_reg_type;

    // FSM state register (current state)
    state_reg_type state_reg_Q;
    // FSM state register (next state)
    state_reg_type state_reg_D;
    // signal/wire
    logic state_idle_wire;
    // signal/wire
    logic dtmcs_update_wire;
    // signal/wire
    logic dmi_update_wire;
    // signal/wire
    logic dmi_update_idle_state_wire;
    // signal/wire
    logic [1:0] dmi_op_dbg_wire;
    // DMI request still in progress (value of 'op' field of the 'dmi' register
    localparam logic [1:0] DMI_OP_DBG_IN_PROGRESS = 2'h3;
    // Read from address (read, value of 'op' field of the 'dmi' register)
    localparam logic [1:0] DMI_OP_DBG_READ = 2'h1;
    // DMI request in completed successfully (value of 'op' field of the 'dmi' register
    localparam logic [1:0] DMI_OP_DBG_SUCESS = 2'h0;
    // Write from address (write, value of 'op' field of the 'dmi' register)
    localparam logic [1:0] DMI_OP_DBG_WRITE = 2'h2;

    // additional declarations:
    logic [31:0] tap_dmi_data;
    logic [1:0] tap_dtmcs_dmistat;
    logic tap_CAPTURE_DR;
    logic tap_dmi_sel;
    logic tap_dtmcs_sel;
    logic [40:0] tap_shift_reg_data;
    logic tap_UPDATE_DR;
    logic [31:0] sync_data_from_clk_CLK;
    logic sync_data_from_clk_READY_CLK;
    logic sync_data_from_tck_READY_TCK;
    logic [39:0] sync_data_from_tck_TCK;
    logic sync_data_from_clk_DONE_TCK;
    logic [31:0] sync_data_from_clk_TCK;
    logic [39:0] sync_data_from_tck_CLK;
    logic sync_data_from_tck_DONE_CLK;
    logic dtmcs_dmireset_reg_D;
    logic dtmcs_dmireset_reg_Q;
    logic dmi_dbg_data_reg_WE;
    logic [38:0] dmi_dbg_data_reg_D;
    logic [38:0] dmi_dbg_data_reg_Q;
    logic dmi_dbg_req_reg_D;
    logic dmi_dbg_req_reg_Q;
    logic dmi_dbg_write_req_reg_WE;
    logic dmi_dbg_write_req_reg_D;
    logic dmi_dbg_write_req_reg_Q;

    // FSM state register
    always_ff @( posedge TCK or negedge TRST ) begin
        if ( TRST == 1'b0 ) begin
            state_reg_Q <= STATE_IDLE;
        end else begin
            state_reg_Q <= state_reg_D;
        end
    end

    // FSM transitions (next state logic)
    always_comb begin
        unique case ( state_reg_Q )
            STATE_IDLE: begin
                if ( (dmi_dbg_req_reg_Q == 1'b1) ) begin
                    state_reg_D = STATE_TRANS;
                end else begin
                    state_reg_D = STATE_IDLE;
                end
            end
            STATE_TRANS: begin
                if ( (tap_CAPTURE_DR == 1'b1) ) begin
                    state_reg_D = STATE_FAIL_BUSY;
                end else if ( (sync_data_from_clk_DONE_TCK == 1'b1) ) begin
                    state_reg_D = STATE_IDLE;
                end else begin
                    state_reg_D = STATE_TRANS;
                end
            end
            STATE_FAIL_BUSY: begin
                if ( (dtmcs_dmireset_reg_Q == 1'b1) ) begin
                    state_reg_D = STATE_IDLE;
                end else begin
                    state_reg_D = STATE_FAIL_BUSY;
                end
            end
            // FSM is complete, but not all 2-state values are used
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: begin
                state_reg_D = STATE_IDLE;
            end
            // pragma coverage on
            // VCS coverage on
        endcase
    end

    // child instances inside RISC-V Debug - DMI (Debug Module Interface):
    // RISC-V Debug - JTAG Test Access port specified by IEEE Std 1149.1-2001 instance:
    codix_berkelium_ca_riscv_dm_dmi_tap_t tap (
        .TCK(TCK),
        .TRST(TRST),
        .TMS(TMS),
        .TDI(TDI),
        .dmi_data(tap_dmi_data),
        .dtmcs_dmistat(tap_dtmcs_dmistat),
        .SCANMODE(SCANMODE),
        .TDO(TDO),
        .CAPTURE_DR(tap_CAPTURE_DR),
        .dmi_sel(tap_dmi_sel),
        .dtmcs_sel(tap_dtmcs_sel),
        .shift_reg_data(tap_shift_reg_data),
        .UPDATE_DR(tap_UPDATE_DR)
    );

    // RISC-V Debug - Clock domain crossing synchronization instance:
    codix_berkelium_ca_riscv_dm_dmi_sync_t sync (
        .CLK(CLK),
        .TCK(TCK),
        .RST(RST),
        .TRST(TRST),
        .data_from_clk_CLK(sync_data_from_clk_CLK),
        .data_from_clk_READY_CLK(sync_data_from_clk_READY_CLK),
        .data_from_tck_READY_TCK(sync_data_from_tck_READY_TCK),
        .data_from_tck_TCK(sync_data_from_tck_TCK),
        .data_from_clk_DONE_TCK(sync_data_from_clk_DONE_TCK),
        .data_from_clk_TCK(sync_data_from_clk_TCK),
        .data_from_tck_CLK(sync_data_from_tck_CLK),
        .data_from_tck_DONE_CLK(sync_data_from_tck_DONE_CLK)
    );

    // register instance:
    d_ff_rst_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) dtmcs_dmireset_reg (
        .CLK(TCK),
        .RST(TRST),
        .D(dtmcs_dmireset_reg_D),
        .Q(dtmcs_dmireset_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd39),
        .DEFAULT_VALUE(39'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) dmi_dbg_data_reg (
        .CLK(TCK),
        .RST(TRST),
        .WE(dmi_dbg_data_reg_WE),
        .D(dmi_dbg_data_reg_D),
        .Q(dmi_dbg_data_reg_Q)
    );

    // register instance:
    d_ff_rst_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) dmi_dbg_req_reg (
        .CLK(TCK),
        .RST(TRST),
        .D(dmi_dbg_req_reg_D),
        .Q(dmi_dbg_req_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) dmi_dbg_write_req_reg (
        .CLK(TCK),
        .RST(TRST),
        .WE(dmi_dbg_write_req_reg_WE),
        .D(dmi_dbg_write_req_reg_D),
        .Q(dmi_dbg_write_req_reg_Q)
    );

    // data-path code:
    assign state_idle_wire = (state_reg_Q == STATE_IDLE);
    assign dtmcs_update_wire = (tap_UPDATE_DR & tap_dtmcs_sel);
    assign dmi_update_wire = (tap_UPDATE_DR & tap_dmi_sel);
    assign dmi_update_idle_state_wire = (dmi_update_wire & state_idle_wire);
    assign dmi_op_dbg_wire = tap_shift_reg_data[1:0];
    assign dtmcs_dmireset_reg_D = (dtmcs_update_wire & tap_shift_reg_data[16]);
    assign dmi_dbg_data_reg_D = tap_shift_reg_data[40:2];
    assign dmi_dbg_data_reg_WE = dmi_update_wire;
    assign dmi_dbg_req_reg_D = ((dmi_update_idle_state_wire == 1'b1) && ((dmi_op_dbg_wire == DMI_OP_DBG_READ) || (dmi_op_dbg_wire == DMI_OP_DBG_WRITE)));
    assign dmi_dbg_write_req_reg_D = (dmi_op_dbg_wire == DMI_OP_DBG_WRITE);
    assign dmi_dbg_write_req_reg_WE = dmi_update_idle_state_wire;
    assign tap_dtmcs_dmistat = (state_idle_wire == 1'b1) ? DMI_OP_DBG_SUCESS : DMI_OP_DBG_IN_PROGRESS;
    assign tap_dmi_data = sync_data_from_clk_TCK;
    assign sync_data_from_clk_CLK = RDATA;
    assign sync_data_from_clk_READY_CLK = ACK;
    assign sync_data_from_tck_TCK = {dmi_dbg_data_reg_Q, dmi_dbg_write_req_reg_Q};
    assign sync_data_from_tck_READY_TCK = dmi_dbg_req_reg_Q;
    assign ADDR = sync_data_from_tck_CLK[39:33];
    assign WDATA = sync_data_from_tck_CLK[32:1];
    assign CS = sync_data_from_tck_DONE_CLK;
    assign WE = (sync_data_from_tck_CLK[0] & sync_data_from_tck_DONE_CLK);
endmodule: codix_berkelium_ca_riscv_dm_dmi_t
