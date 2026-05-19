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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_riscv_dm_t' RISC-V Debug - DM top unit.
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

module codix_berkelium_ca_riscv_dm_t(
    input  logic CLK,
    input  logic TCK,
    input  logic RST,
    input  logic TRST,
    input  logic TMS,
    input  logic TDI,
    input  logic [1:0] codasip_i1_if_cpu_fetch_progbuf_RA,
    input  logic codasip_i1_if_cpu_fetch_progbuf_RE,
    input  logic [31:0] core_r_csr_dpc_BSC_Q,
    input  logic [31:0] core_rf_gpr_BSC_Q,
    input  logic core_s_dm_progbuf_done_Q,
    input  logic core_s_dm_progbuf_exc_Q,
    input  logic core_s_hart_halted_Q,
    input  logic SCANMODE,
    output logic TDO,
    output logic [31:0] codasip_i1_if_cpu_fetch_progbuf_Q,
    output logic [31:0] core_r_csr_dpc_BSC_D,
    output logic core_r_csr_dpc_BSC_UPDATE,
    output logic core_r_csr_dpc_DEBUG_MODE,
    output logic [4:0] core_rf_gpr_BSC_A,
    output logic [31:0] core_rf_gpr_BSC_D,
    output logic core_rf_gpr_BSC_UPDATE,
    output logic core_rf_gpr_DEBUG_MODE,
    output logic core_s_dm_active_D,
    output logic core_s_dm_halt_D,
    output logic core_s_dm_progbuf_en_D,
    output logic dmactive,
    output logic ndmreset,
    output logic RST_REQUEST
);
    // type, wire and constant declarations:
    // signal/wire
    logic dmi_WE_wire;
    // signal/wire
    logic dmcontrol_WE_wire;
    // address of the Debug Module Control (dmcontrol) register
    localparam logic [6:0] DM_REG_DMCONTROL_IDX = 7'h10;

    // additional declarations:
    logic dmi_ACK;
    logic [31:0] dmi_RDATA;
    logic [6:0] dmi_ADDR;
    logic dmi_CS;
    logic [31:0] dmi_WDATA;
    logic dmi_WE;
    logic codasip_risv_dbg_IRST_gen_RST_REQUEST;
    logic codasip_risv_dbg_IRST_gen_IRST;
    logic codasip_risv_dbg_ICLK_gen_CLK_EN;
    logic codasip_risv_dbg_ICLK_gen_ICLK;
    logic dmcontrol_dmactive_reg_Q;
    logic dmcontrol_ndmreset_reg_Q;
    logic [6:0] dbg_dmi_ADDR;
    logic dbg_dmi_CS;
    logic [31:0] dbg_dmi_WDATA;
    logic dbg_dmi_WE;
    logic [31:0] dbg_dmi_RDATA;
    logic dmcontrol_dmactive_reg_WE;
    logic dmcontrol_dmactive_reg_D;
    logic dmcontrol_ndmreset_reg_WE;
    logic dmcontrol_ndmreset_reg_D;
    logic codasip_riscv_dbg_rst_request_reg_WE;
    logic codasip_riscv_dbg_rst_request_reg_D;
    logic codasip_riscv_dbg_rst_request_reg_Q;
    logic codasip_riscv_dbg_clk_en_reg_D;
    logic codasip_riscv_dbg_clk_en_reg_Q;
    logic dmi_RDATA_reg_WE;
    logic [31:0] dmi_RDATA_reg_D;
    logic [31:0] dmi_RDATA_reg_Q;
    logic dmi_ACK_reg_D;
    logic dmi_ACK_reg_Q;

    // child instances inside RISC-V Debug - DM top unit:
    // RISC-V Debug - DMI (Debug Module Interface) instance:
    codix_berkelium_ca_riscv_dm_dmi_t dmi (
        .CLK(CLK),
        .TCK(TCK),
        .RST(RST),
        .TRST(TRST),
        .TMS(TMS),
        .TDI(TDI),
        .ACK(dmi_ACK),
        .RDATA(dmi_RDATA),
        .SCANMODE(SCANMODE),
        .TDO(TDO),
        .ADDR(dmi_ADDR),
        .CS(dmi_CS),
        .WDATA(dmi_WDATA),
        .WE(dmi_WE)
    );

    // Reset encapsulation unit instance:
    codasip_reset_gen_t #(
        .RESET_LEVEL(1'b0)
    ) codasip_risv_dbg_IRST_gen (
        .RST(RST),
        .RST_REQUEST(codasip_risv_dbg_IRST_gen_RST_REQUEST),
        .SCANMODE(SCANMODE),
        .IRST(codasip_risv_dbg_IRST_gen_IRST)
    );

    // Clock gating unit instance:
    codasip_clock_gating_gen_t codasip_risv_dbg_ICLK_gen (
        .CLK(CLK),
        .CLK_EN(codasip_risv_dbg_ICLK_gen_CLK_EN),
        .SCANMODE(SCANMODE),
        .ICLK(codasip_risv_dbg_ICLK_gen_ICLK)
    );

    // RISC-V Debug - DM control and status logic instance:
    codix_berkelium_ca_riscv_dm_dbg_t dbg (
        .CLK(codasip_risv_dbg_ICLK_gen_ICLK),
        .RST(codasip_risv_dbg_IRST_gen_IRST),
        .codasip_i1_if_cpu_fetch_progbuf_RA(codasip_i1_if_cpu_fetch_progbuf_RA),
        .codasip_i1_if_cpu_fetch_progbuf_RE(codasip_i1_if_cpu_fetch_progbuf_RE),
        .core_r_csr_dpc_BSC_Q(core_r_csr_dpc_BSC_Q),
        .core_rf_gpr_BSC_Q(core_rf_gpr_BSC_Q),
        .core_s_dm_progbuf_done_Q(core_s_dm_progbuf_done_Q),
        .core_s_dm_progbuf_exc_Q(core_s_dm_progbuf_exc_Q),
        .core_s_hart_halted_Q(core_s_hart_halted_Q),
        .dmcontrol_dmactive_reg_Q(dmcontrol_dmactive_reg_Q),
        .dmcontrol_ndmreset_reg_Q(dmcontrol_ndmreset_reg_Q),
        .dmi_ADDR(dbg_dmi_ADDR),
        .dmi_CS(dbg_dmi_CS),
        .dmi_WDATA(dbg_dmi_WDATA),
        .dmi_WE(dbg_dmi_WE),
        .codasip_i1_if_cpu_fetch_progbuf_Q(codasip_i1_if_cpu_fetch_progbuf_Q),
        .core_r_csr_dpc_BSC_D(core_r_csr_dpc_BSC_D),
        .core_r_csr_dpc_BSC_UPDATE(core_r_csr_dpc_BSC_UPDATE),
        .core_r_csr_dpc_DEBUG_MODE(core_r_csr_dpc_DEBUG_MODE),
        .core_rf_gpr_BSC_A(core_rf_gpr_BSC_A),
        .core_rf_gpr_BSC_D(core_rf_gpr_BSC_D),
        .core_rf_gpr_BSC_UPDATE(core_rf_gpr_BSC_UPDATE),
        .core_rf_gpr_DEBUG_MODE(core_rf_gpr_DEBUG_MODE),
        .core_s_dm_halt_D(core_s_dm_halt_D),
        .core_s_dm_progbuf_en_D(core_s_dm_progbuf_en_D),
        .dmi_RDATA(dbg_dmi_RDATA)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) dmcontrol_dmactive_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(dmcontrol_dmactive_reg_WE),
        .D(dmcontrol_dmactive_reg_D),
        .Q(dmcontrol_dmactive_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) dmcontrol_ndmreset_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(dmcontrol_ndmreset_reg_WE),
        .D(dmcontrol_ndmreset_reg_D),
        .Q(dmcontrol_ndmreset_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b1),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) codasip_riscv_dbg_rst_request_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(codasip_riscv_dbg_rst_request_reg_WE),
        .D(codasip_riscv_dbg_rst_request_reg_D),
        .Q(codasip_riscv_dbg_rst_request_reg_Q)
    );

    // register instance:
    d_ff_rst_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b1),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) codasip_riscv_dbg_clk_en_reg (
        .CLK(CLK),
        .RST(RST),
        .D(codasip_riscv_dbg_clk_en_reg_D),
        .Q(codasip_riscv_dbg_clk_en_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) dmi_RDATA_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(dmi_RDATA_reg_WE),
        .D(dmi_RDATA_reg_D),
        .Q(dmi_RDATA_reg_Q)
    );

    // register instance:
    d_ff_rst_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) dmi_ACK_reg (
        .CLK(CLK),
        .RST(RST),
        .D(dmi_ACK_reg_D),
        .Q(dmi_ACK_reg_Q)
    );

    // data-path code:
    assign codasip_risv_dbg_ICLK_gen_CLK_EN = codasip_riscv_dbg_clk_en_reg_Q;
    assign codasip_risv_dbg_IRST_gen_RST_REQUEST = codasip_riscv_dbg_rst_request_reg_Q;
    assign dmi_WE_wire = (dmi_CS & dmi_WE);
    assign dmcontrol_WE_wire = ((dmi_WE_wire == 1'b1) && (dmi_ADDR == DM_REG_DMCONTROL_IDX));
    assign dmcontrol_ndmreset_reg_D = ((dmi_WDATA[1] & dmi_WDATA[0]) & dmcontrol_dmactive_reg_Q);
    assign dmcontrol_ndmreset_reg_WE = dmcontrol_WE_wire;
    assign dmcontrol_dmactive_reg_D = dmi_WDATA[0];
    assign dmcontrol_dmactive_reg_WE = dmcontrol_WE_wire;
    assign dmi_RDATA_reg_D = dbg_dmi_RDATA;
    assign dmi_RDATA_reg_WE = (dmi_CS & (~dmi_WE));
    assign dmi_ACK_reg_D = dmi_CS;
    assign dbg_dmi_WDATA = dmi_WDATA;
    assign dbg_dmi_ADDR = dmi_ADDR;
    assign dbg_dmi_CS = dmi_CS;
    assign dbg_dmi_WE = dmi_WE_wire;
    assign codasip_riscv_dbg_rst_request_reg_D = (~dmi_WDATA[0]);
    assign codasip_riscv_dbg_rst_request_reg_WE = dmcontrol_WE_wire;
    assign codasip_riscv_dbg_clk_en_reg_D = dmcontrol_dmactive_reg_Q;
    assign dmi_RDATA = dmi_RDATA_reg_Q;
    assign dmi_ACK = dmi_ACK_reg_Q;
    assign dmactive = dmcontrol_dmactive_reg_Q;
    assign core_s_dm_active_D = dmcontrol_dmactive_reg_Q;
    assign RST_REQUEST = dmcontrol_ndmreset_reg_Q;
    assign ndmreset = dmcontrol_ndmreset_reg_Q;
endmodule: codix_berkelium_ca_riscv_dm_t
