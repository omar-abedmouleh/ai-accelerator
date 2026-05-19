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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_riscv_dm_dbg_t' RISC-V Debug - DM control and status logic.
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

module codix_berkelium_ca_riscv_dm_dbg_t(
    input  logic CLK,
    input  logic RST,
    input  logic [1:0] codasip_i1_if_cpu_fetch_progbuf_RA,
    input  logic codasip_i1_if_cpu_fetch_progbuf_RE,
    input  logic [31:0] core_r_csr_dpc_BSC_Q,
    input  logic [31:0] core_rf_gpr_BSC_Q,
    input  logic core_s_dm_progbuf_done_Q,
    input  logic core_s_dm_progbuf_exc_Q,
    input  logic core_s_hart_halted_Q,
    input  logic dmcontrol_dmactive_reg_Q,
    input  logic dmcontrol_ndmreset_reg_Q,
    input  logic [6:0] dmi_ADDR,
    input  logic dmi_CS,
    input  logic [31:0] dmi_WDATA,
    input  logic dmi_WE,
    output logic [31:0] codasip_i1_if_cpu_fetch_progbuf_Q,
    output logic [31:0] core_r_csr_dpc_BSC_D,
    output logic core_r_csr_dpc_BSC_UPDATE,
    output logic core_r_csr_dpc_DEBUG_MODE,
    output logic [4:0] core_rf_gpr_BSC_A,
    output logic [31:0] core_rf_gpr_BSC_D,
    output logic core_rf_gpr_BSC_UPDATE,
    output logic core_rf_gpr_DEBUG_MODE,
    output logic core_s_dm_halt_D,
    output logic core_s_dm_progbuf_en_D,
    output logic [31:0] dmi_RDATA
);
    // type, wire and constant declarations:
    // FSM state register enumeration type
    typedef enum logic [2:0]
    {
        STATE_ABST_CMD_NOT_READY = 3'b000,
        STATE_ABST_CMD_IDLE = 3'b001,
        STATE_ABST_CMD_START = 3'b010,
        STATE_ABST_CMD_WAIT = 3'b011,
        STATE_ABST_CMD_DONE = 3'b100
    } state_reg_type;

    // FSM state register (current state)
    state_reg_type state_reg_Q;
    // FSM state register (next state)
    state_reg_type state_reg_D;
    // signal/wire
    logic data0_reg_sel_wire;
    // signal/wire
    logic dmcontrol_sel_wire;
    // signal/wire
    logic dmstatus_sel_wire;
    // signal/wire
    logic abstractcs_sel_wire;
    // signal/wire
    logic command_sel_wire;
    // signal/wire
    logic abstractauto_sel_wire;
    // signal/wire
    logic progbuf_sel_wire;
    // signal/wire
    logic haltsum0_sel_wire;
    // signal/wire
    logic codasip_r_csr_dpc_sel_wire;
    // signal/wire
    logic codasip_rf_gpr_sel_wire;
    // signal/wire
    logic codasip_rf_gpr_nonzero_idx_wire;
    // signal/wire
    logic acr_sel_any_wire;
    // signal/wire
    logic state_abst_cmd_idle_wire;
    // signal/wire
    logic state_abst_cmd_start_wire;
    // signal/wire
    logic state_abst_cmd_wait_wire;
    // signal/wire
    logic state_abst_cmd_done_wire;
    // signal/wire
    logic abstractcs_autoexecdata0_wire;
    // signal/wire
    logic abstractcs_autoexecdata_wire;
    // signal/wire
    logic abstractcs_cmderr_size_error_next_wire;
    // signal/wire
    logic abstractcs_cmderr_size_error_curr_wire;
    // signal/wire
    logic dmcontrol_WE_wire;
    // signal/wire
    logic command_WE_wire;
    // signal/wire
    logic abstractcs_WE_wire;
    // signal/wire
    logic data_regs_WE_wire;
    // signal/wire
    logic dmstatus_allhavereset_wire;
    // signal/wire
    logic dmstatus_anyhavereset_wire;
    // signal/wire
    logic dmstatus_allresumeack_wire;
    // signal/wire
    logic dmstatus_anyresumeack_wire;
    // signal/wire
    logic dmstatus_allhalted_wire;
    // signal/wire
    logic dmstatus_anyhalted_wire;
    // signal/wire
    logic dmstatus_allrunning_wire;
    // signal/wire
    logic dmstatus_anyrunning_wire;
    // signal/wire
    logic dmstatus_allnonexistent_wire;
    // signal/wire
    logic dmstatus_anynonexistent_wire;
    // signal/wire
    logic hartsel_halted_wire;
    // signal/wire
    logic abstractcs_is_error_wire;
    // signal/wire
    logic harts_ctrl_hart_halted_wire;
    // signal/wire
    logic harts_ctrl_hart_progbuf_done_wire;
    // signal/wire
    logic harts_ctrl_halted_wire;
    // signal/wire
    logic harts_ctrl_running_wire;
    // signal/wire
    logic harts_ctrl_resumeack_wire;
    // signal/wire
    logic harts_ctrl_DEBUG_MODE_wire;
    // signal/wire
    logic harts_ctrl_dm_halt_wire;
    // signal/wire
    logic dbg_cmd_valid_wire;
    // signal/wire
    logic dbg_cmd_trans_valid_wire;
    // signal/wire
    logic dbg_cmd_postexec_wire;
    // signal/wire
    logic dbg_resume_req_wire;
    // signal/wire
    logic dbg_haltreq_wire;
    // signal/wire
    logic harts_any_progbuf_exception_wire;
    // signal/wire
    logic resumereq_flag_wire;
    // signal/wire
    logic start_new_command_wire;
    // address of the Abstract Command Autoexec (abstractauto) register
    localparam logic [6:0] DM_REG_ABSTRACTAUTO_IDX = 7'h18;
    // address of the Abstract Control and Status (abstractcs) register
    localparam logic [6:0] DM_REG_ABSTRACTCS_IDX = 7'h16;
    // address of the Abstract Command (command) register
    localparam logic [6:0] DM_REG_COMMAND_IDX = 7'h17;
    // address of the 0 (data0) register
    localparam logic [6:0] DM_REG_DATA0_IDX = 7'h04;
    // address of the Debug Module Control (dmcontrol) register
    localparam logic [6:0] DM_REG_DMCONTROL_IDX = 7'h10;
    // address of the Debug Module Status (dmstatus) register
    localparam logic [6:0] DM_REG_DMSTATUS_IDX = 7'h11;
    // address of the Halt Summary 0 (haltsum0) register
    localparam logic [6:0] DM_REG_HALTSUM0_IDX = 7'h40;

    // additional declarations:
    logic dmstatus_havereset_reg_WE;
    logic dmstatus_havereset_reg_D;
    logic dmstatus_havereset_reg_Q;
    logic dmcontrol_haltreq_reg_WE;
    logic dmcontrol_haltreq_reg_D;
    logic dmcontrol_haltreq_reg_Q;
    logic dmcontrol_resumereq_reg_WE;
    logic dmcontrol_resumereq_reg_D;
    logic dmcontrol_resumereq_reg_Q;
    logic abstractcs_busy_reg_WE;
    logic abstractcs_busy_reg_D;
    logic abstractcs_busy_reg_Q;
    logic abstractcs_cmderr_reg_WE;
    logic [2:0] abstractcs_cmderr_reg_D;
    logic [2:0] abstractcs_cmderr_reg_Q;
    logic command_reg_WE;
    logic [31:0] command_reg_D;
    logic [31:0] command_reg_Q;
    logic abstractauto_reg_WE;
    logic abstractauto_reg_D;
    logic abstractauto_reg_Q;
    logic data0_reg_WE;
    logic [31:0] data0_reg_D;
    logic [31:0] data0_reg_Q;
    logic dmcontrol_WE_reg_D;
    logic dmcontrol_WE_reg_Q;
    logic dbg_cmd_done_reg_D;
    logic dbg_cmd_done_reg_Q;
    logic dbg_cmd_fail_reg_D;
    logic dbg_cmd_fail_reg_Q;
    logic dbg_rdata_reg_WE;
    logic [31:0] dbg_rdata_reg_D;
    logic [31:0] dbg_rdata_reg_Q;
    logic [1:0] progbuf_dbg_A;
    logic progbuf_dbg_CS;
    logic [31:0] progbuf_dbg_D;
    logic progbuf_dbg_WE;
    logic [31:0] progbuf_dbg_Q;

    // FSM state register
    always_ff @( posedge CLK or negedge RST ) begin
        if ( RST == 1'b0 ) begin
            state_reg_Q <= STATE_ABST_CMD_NOT_READY;
        end else begin
            state_reg_Q <= state_reg_D;
        end
    end

    // FSM transitions (next state logic)
    always_comb begin
        unique case ( state_reg_Q )
            STATE_ABST_CMD_NOT_READY: begin
                if ( ((dmcontrol_ndmreset_reg_Q == 1'b0) && (hartsel_halted_wire == 1'b1)) ) begin
                    state_reg_D = STATE_ABST_CMD_IDLE;
                end else begin
                    state_reg_D = STATE_ABST_CMD_NOT_READY;
                end
            end
            STATE_ABST_CMD_IDLE: begin
                if ( (((dmcontrol_ndmreset_reg_Q == 1'b1) || (resumereq_flag_wire == 1'b1)) || (hartsel_halted_wire == 1'b0)) ) begin
                    state_reg_D = STATE_ABST_CMD_NOT_READY;
                end else if ( (start_new_command_wire == 1'b1) ) begin
                    state_reg_D = STATE_ABST_CMD_START;
                end else begin
                    state_reg_D = STATE_ABST_CMD_IDLE;
                end
            end
            STATE_ABST_CMD_START: begin
                if ( (abstractcs_is_error_wire == 1'b1) ) begin
                    state_reg_D = STATE_ABST_CMD_DONE;
                end else begin
                    state_reg_D = STATE_ABST_CMD_WAIT;
                end
            end
            STATE_ABST_CMD_WAIT: begin
                if ( (dbg_cmd_done_reg_Q == 1'b1) ) begin
                    state_reg_D = STATE_ABST_CMD_DONE;
                end else begin
                    state_reg_D = STATE_ABST_CMD_WAIT;
                end
            end
            STATE_ABST_CMD_DONE: begin
                state_reg_D = STATE_ABST_CMD_IDLE;
            end
            // FSM is complete, but not all 2-state values are used
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: begin
                state_reg_D = STATE_ABST_CMD_NOT_READY;
            end
            // pragma coverage on
            // VCS coverage on
        endcase
    end

    // child instances inside RISC-V Debug - DM control and status logic:
    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) dmstatus_havereset_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(dmstatus_havereset_reg_WE),
        .D(dmstatus_havereset_reg_D),
        .Q(dmstatus_havereset_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) dmcontrol_haltreq_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(dmcontrol_haltreq_reg_WE),
        .D(dmcontrol_haltreq_reg_D),
        .Q(dmcontrol_haltreq_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) dmcontrol_resumereq_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(dmcontrol_resumereq_reg_WE),
        .D(dmcontrol_resumereq_reg_D),
        .Q(dmcontrol_resumereq_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) abstractcs_busy_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(abstractcs_busy_reg_WE),
        .D(abstractcs_busy_reg_D),
        .Q(abstractcs_busy_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) abstractcs_cmderr_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(abstractcs_cmderr_reg_WE),
        .D(abstractcs_cmderr_reg_D),
        .Q(abstractcs_cmderr_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) command_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(command_reg_WE),
        .D(command_reg_D),
        .Q(command_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) abstractauto_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(abstractauto_reg_WE),
        .D(abstractauto_reg_D),
        .Q(abstractauto_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) data0_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(data0_reg_WE),
        .D(data0_reg_D),
        .Q(data0_reg_Q)
    );

    // register instance:
    d_ff_rst_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) dmcontrol_WE_reg (
        .CLK(CLK),
        .RST(RST),
        .D(dmcontrol_WE_reg_D),
        .Q(dmcontrol_WE_reg_Q)
    );

    // register instance:
    d_ff_rst_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) dbg_cmd_done_reg (
        .CLK(CLK),
        .RST(RST),
        .D(dbg_cmd_done_reg_D),
        .Q(dbg_cmd_done_reg_Q)
    );

    // register instance:
    d_ff_rst_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) dbg_cmd_fail_reg (
        .CLK(CLK),
        .RST(RST),
        .D(dbg_cmd_fail_reg_D),
        .Q(dbg_cmd_fail_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) dbg_rdata_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(dbg_rdata_reg_WE),
        .D(dbg_rdata_reg_D),
        .Q(dbg_rdata_reg_Q)
    );

    // RISC-V Debug - DM and core state instance:
    codix_berkelium_ca_riscv_dm_dbg_hart_ctrl_t hart_ctrl_0 (
        .CLK(CLK),
        .RST(RST),
        .dbg_cmd_postexec(dbg_cmd_postexec_wire),
        .dbg_cmd_valid(dbg_cmd_valid_wire),
        .dbg_halt_req(dbg_haltreq_wire),
        .dbg_resume_req(dbg_resume_req_wire),
        .hart_halted(harts_ctrl_hart_halted_wire),
        .hart_progbuf_done(harts_ctrl_hart_progbuf_done_wire),
        .DEBUG_MODE(harts_ctrl_DEBUG_MODE_wire),
        .dm_halt(harts_ctrl_dm_halt_wire),
        .halted(harts_ctrl_halted_wire),
        .resumeack(harts_ctrl_resumeack_wire)
    );

    // RISC-V Debug - Program Buffer instance:
    codix_berkelium_ca_riscv_dm_dbg_progbuf_t progbuf (
        .CLK(CLK),
        .RST(RST),
        .codasip_i1_if_cpu_fetch_progbuf_RA(codasip_i1_if_cpu_fetch_progbuf_RA),
        .codasip_i1_if_cpu_fetch_progbuf_RE(codasip_i1_if_cpu_fetch_progbuf_RE),
        .dbg_A(progbuf_dbg_A),
        .dbg_CS(progbuf_dbg_CS),
        .dbg_D(progbuf_dbg_D),
        .dbg_WE(progbuf_dbg_WE),
        .codasip_i1_if_cpu_fetch_progbuf_Q(codasip_i1_if_cpu_fetch_progbuf_Q),
        .dbg_Q(progbuf_dbg_Q)
    );

    // data-path code:
    assign state_abst_cmd_idle_wire = (state_reg_Q == STATE_ABST_CMD_IDLE);
    assign state_abst_cmd_start_wire = (state_reg_Q == STATE_ABST_CMD_START);
    assign state_abst_cmd_wait_wire = (state_reg_Q == STATE_ABST_CMD_WAIT);
    assign state_abst_cmd_done_wire = (state_reg_Q == STATE_ABST_CMD_DONE);
    assign dmcontrol_sel_wire = (dmi_ADDR == DM_REG_DMCONTROL_IDX);
    assign dmstatus_sel_wire = (dmi_ADDR == DM_REG_DMSTATUS_IDX);
    assign abstractcs_sel_wire = (dmi_ADDR == DM_REG_ABSTRACTCS_IDX);
    assign command_sel_wire = (dmi_ADDR == DM_REG_COMMAND_IDX);
    assign abstractauto_sel_wire = (dmi_ADDR == DM_REG_ABSTRACTAUTO_IDX);
    assign data0_reg_sel_wire = (dmi_ADDR == DM_REG_DATA0_IDX);
    assign progbuf_sel_wire = (dmi_ADDR[6:2] == 5'h08);
    assign haltsum0_sel_wire = (dmi_ADDR == DM_REG_HALTSUM0_IDX);
    assign dmcontrol_WE_wire = (dmcontrol_sel_wire & dmi_WE);
    assign command_WE_wire = ((command_sel_wire & dmi_WE) & state_abst_cmd_idle_wire);
    assign abstractcs_WE_wire = (abstractcs_sel_wire & dmi_WE);
    assign data_regs_WE_wire = ((dbg_cmd_done_reg_Q & (~command_reg_Q[16])) & state_abst_cmd_wait_wire);
    assign abstractcs_is_error_wire = (abstractcs_cmderr_reg_Q != 3'h0);
    assign abstractcs_autoexecdata0_wire = (abstractauto_reg_Q & data0_reg_sel_wire);
    assign abstractcs_autoexecdata_wire = (abstractcs_autoexecdata0_wire & dmi_CS);
    assign abstractcs_cmderr_size_error_next_wire = (dmi_WDATA[22:20] != 3'h2);
    assign abstractcs_cmderr_size_error_curr_wire = (command_reg_Q[22:20] != 3'h2);
    assign resumereq_flag_wire = (dmcontrol_WE_reg_Q & dmcontrol_resumereq_reg_Q);
    assign start_new_command_wire = (command_WE_wire | abstractcs_autoexecdata_wire);
    assign hartsel_halted_wire = harts_ctrl_halted_wire;
    assign dbg_cmd_valid_wire = (state_abst_cmd_start_wire & (~abstractcs_is_error_wire));
    assign dbg_cmd_trans_valid_wire = (dbg_cmd_valid_wire & command_reg_Q[17]);
    assign dbg_cmd_postexec_wire = command_reg_Q[18];
    assign dbg_haltreq_wire = dmcontrol_haltreq_reg_Q;
    assign dbg_resume_req_wire = (dmcontrol_ndmreset_reg_Q | resumereq_flag_wire);
    assign codasip_r_csr_dpc_sel_wire = ((dbg_cmd_trans_valid_wire == 1'b1) && (command_reg_Q[15:0] == 16'h07b1));
    assign codasip_rf_gpr_sel_wire = ((dbg_cmd_trans_valid_wire == 1'b1) && (command_reg_Q[15:5] == 11'h080));
    assign codasip_rf_gpr_nonzero_idx_wire = (command_reg_Q[4:0] != 5'h00);
    assign acr_sel_any_wire = (codasip_r_csr_dpc_sel_wire | codasip_rf_gpr_sel_wire);
    assign harts_ctrl_running_wire = (~harts_ctrl_halted_wire);
    assign dmstatus_allnonexistent_wire = 1'b0;
    assign dmstatus_anynonexistent_wire = 1'b0;
    assign dmstatus_allhavereset_wire = dmstatus_havereset_reg_Q;
    assign dmstatus_anyhavereset_wire = dmstatus_havereset_reg_Q;
    assign dmstatus_allresumeack_wire = harts_ctrl_resumeack_wire;
    assign dmstatus_anyresumeack_wire = harts_ctrl_resumeack_wire;
    assign dmstatus_allhalted_wire = harts_ctrl_halted_wire;
    assign dmstatus_anyhalted_wire = harts_ctrl_halted_wire;
    assign dmstatus_allrunning_wire = harts_ctrl_running_wire;
    assign dmstatus_anyrunning_wire = harts_ctrl_running_wire;
    assign dmcontrol_haltreq_reg_D = dmi_WDATA[31];
    assign dmcontrol_haltreq_reg_WE = dmcontrol_WE_wire;
    assign dmcontrol_resumereq_reg_D = (dmi_WDATA[30] & (~dmi_WDATA[31]));
    assign dmcontrol_resumereq_reg_WE = dmcontrol_WE_wire;
    assign dmstatus_havereset_reg_D = (~dmi_WDATA[28]);
    assign dmstatus_havereset_reg_WE = (dmcontrol_WE_wire & (dmi_WDATA[28] | dmi_WDATA[1]));
    assign abstractcs_busy_reg_D = state_abst_cmd_idle_wire;
    assign abstractcs_busy_reg_WE = ((state_reg_D == STATE_ABST_CMD_START) || (state_abst_cmd_done_wire == 1'b1));
    assign abstractcs_cmderr_reg_D = ((abstractcs_busy_reg_Q == 1'b1) && ((dmi_WE == 1'b1) && ((abstractcs_sel_wire == 1'b1) || ((command_sel_wire == 1'b1) || (abstractauto_sel_wire == 1'b1))))) ? 3'h1 :
        ((abstractcs_busy_reg_Q == 1'b1) && ((dmi_CS == 1'b1) && ((data0_reg_sel_wire == 1'b1) || (progbuf_sel_wire == 1'b1)))) ? 3'h1 :
        (((dmi_WE == 1'b1) && (command_sel_wire == 1'b1)) && ((dmi_WDATA[31:24] != 8'h00) || ((dmi_WDATA[23] == 1'b1) || ((dmi_WDATA[19] == 1'b1) || ((dmi_WDATA[17] == 1'b1) && (abstractcs_cmderr_size_error_next_wire == 1'b1)))))) ? 3'h2 :
        ((abstractcs_autoexecdata_wire == 1'b1) && ((command_reg_Q[31:24] != 8'h00) || ((command_reg_Q[23] == 1'b1) || ((command_reg_Q[19] == 1'b1) || ((command_reg_Q[17] == 1'b1) && (abstractcs_cmderr_size_error_curr_wire == 1'b1)))))) ? 3'h2 :
        (dbg_cmd_fail_reg_Q == 1'b1) ? 3'h3 :
        ((state_abst_cmd_idle_wire == 1'b0) && (((dmi_WE == 1'b1) && (command_sel_wire == 1'b1)) || (abstractcs_autoexecdata_wire == 1'b1))) ? 3'h4 :
        (abstractcs_WE_wire == 1'b1) ? ((~dmi_WDATA[10:8]) & abstractcs_cmderr_reg_Q) : abstractcs_cmderr_reg_Q;
    assign abstractcs_cmderr_reg_WE = (abstractcs_WE_wire | (~abstractcs_is_error_wire));
    assign command_reg_D = dmi_WDATA;
    assign command_reg_WE = command_WE_wire;
    assign abstractauto_reg_D = dmi_WDATA[0];
    assign abstractauto_reg_WE = (abstractauto_sel_wire & dmi_WE);
    assign data0_reg_D = (data_regs_WE_wire == 1'b1) ? dbg_rdata_reg_Q : dmi_WDATA;
    assign data0_reg_WE = (((data0_reg_sel_wire & dmi_WE) & state_abst_cmd_idle_wire) | data_regs_WE_wire);
    assign dbg_cmd_done_reg_D = (((dbg_cmd_valid_wire & (~dbg_cmd_postexec_wire)) | (dbg_cmd_postexec_wire & harts_ctrl_hart_progbuf_done_wire)) != 1'b0);
    assign dbg_cmd_fail_reg_D = (((dbg_cmd_valid_wire & command_reg_Q[17]) & (~acr_sel_any_wire)) | harts_any_progbuf_exception_wire);
    assign dbg_rdata_reg_D = (codasip_r_csr_dpc_sel_wire == 1'b1) ? core_r_csr_dpc_BSC_Q :
        (codasip_rf_gpr_sel_wire == 1'b1) ? core_rf_gpr_BSC_Q : 32'h00000000;
    assign dbg_rdata_reg_WE = (acr_sel_any_wire | (~command_reg_Q[17]));
    assign dmcontrol_WE_reg_D = dmcontrol_WE_wire;
    assign harts_ctrl_hart_halted_wire = core_s_hart_halted_Q;
    assign harts_ctrl_hart_progbuf_done_wire = core_s_dm_progbuf_done_Q;
    assign harts_any_progbuf_exception_wire = core_s_dm_progbuf_exc_Q;
    assign progbuf_dbg_CS = (progbuf_sel_wire & dmi_CS);
    assign progbuf_dbg_WE = (progbuf_sel_wire & dmi_WE);
    assign progbuf_dbg_A = dmi_ADDR[1:0];
    assign progbuf_dbg_D = dmi_WDATA;
    assign dmi_RDATA = (data0_reg_sel_wire == 1'b1) ? data0_reg_Q :
        (dmcontrol_sel_wire == 1'b1) ? {30'h00000000, dmcontrol_ndmreset_reg_Q, dmcontrol_dmactive_reg_Q} :
        (dmstatus_sel_wire == 1'b1) ? {12'h000, dmstatus_allhavereset_wire, dmstatus_anyhavereset_wire, dmstatus_allresumeack_wire, dmstatus_anyresumeack_wire, dmstatus_allnonexistent_wire, dmstatus_anynonexistent_wire, 2'h0, dmstatus_allrunning_wire, dmstatus_anyrunning_wire, dmstatus_allhalted_wire, dmstatus_anyhalted_wire, 1'b1, 3'h0, 4'h2} :
        (abstractcs_sel_wire == 1'b1) ? {3'h0, 5'h04, 11'h000, abstractcs_busy_reg_Q, 1'b0, abstractcs_cmderr_reg_Q, 4'h0, 4'h1} :
        (abstractauto_sel_wire == 1'b1) ? {31'h00000000, abstractauto_reg_Q} :
        (progbuf_sel_wire == 1'b1) ? progbuf_dbg_Q :
        (haltsum0_sel_wire == 1'b1) ? {31'h00000000, harts_ctrl_halted_wire} : 32'h00000000;
    assign core_r_csr_dpc_DEBUG_MODE = harts_ctrl_DEBUG_MODE_wire;
    assign core_r_csr_dpc_BSC_UPDATE = (codasip_r_csr_dpc_sel_wire & command_reg_Q[16]);
    assign core_r_csr_dpc_BSC_D = data0_reg_Q;
    assign core_rf_gpr_DEBUG_MODE = harts_ctrl_DEBUG_MODE_wire;
    assign core_rf_gpr_BSC_UPDATE = ((codasip_rf_gpr_sel_wire & command_reg_Q[16]) & codasip_rf_gpr_nonzero_idx_wire);
    assign core_rf_gpr_BSC_D = data0_reg_Q;
    assign core_rf_gpr_BSC_A = command_reg_Q[4:0];
    assign core_s_dm_progbuf_en_D = (dbg_cmd_valid_wire & dbg_cmd_postexec_wire);
    assign core_s_dm_halt_D = harts_ctrl_dm_halt_wire;
endmodule: codix_berkelium_ca_riscv_dm_dbg_t
