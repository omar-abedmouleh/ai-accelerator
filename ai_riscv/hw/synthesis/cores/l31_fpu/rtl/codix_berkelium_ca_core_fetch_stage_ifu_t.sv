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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_ifu_t' CodAL module.
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

module codix_berkelium_ca_core_fetch_stage_ifu_t #(
    parameter [31:0] pma_base0_p = 32'h20000000,
    parameter [31:0] pma_mask0_p = 32'hffe00000,
    parameter [15:0] pma_enable_p = 16'h003f,
    parameter [31:0] pma_base1_p = 32'h70010000,
    parameter [31:0] pma_mask1_p = 32'hffffff00,
    parameter [31:0] pma_base2_p = 32'h00020000,
    parameter [31:0] pma_mask2_p = 32'hfffffff0,
    parameter [31:0] pma_base3_p = 32'h00010000,
    parameter [31:0] pma_mask3_p = 32'hfffffe00,
    parameter [31:0] pma_base4_p = 32'h02000000,
    parameter [31:0] pma_mask4_p = 32'hffffc000,
    parameter [31:0] pma_base5_p = 32'h03000000,
    parameter [31:0] pma_mask5_p = 32'hffffc000,
    parameter [31:0] pma_base6_p = 32'h00000000,
    parameter [31:0] pma_mask6_p = 32'h00000000,
    parameter [31:0] pma_base7_p = 32'h00000000,
    parameter [31:0] pma_mask7_p = 32'h00000000,
    parameter [31:0] pma_base8_p = 32'h00000000,
    parameter [31:0] pma_mask8_p = 32'h00000000,
    parameter [31:0] pma_base9_p = 32'h00000000,
    parameter [31:0] pma_mask9_p = 32'h00000000,
    parameter [31:0] pma_base10_p = 32'h00000000,
    parameter [31:0] pma_mask10_p = 32'h00000000,
    parameter [31:0] pma_base11_p = 32'h00000000,
    parameter [31:0] pma_mask11_p = 32'h00000000,
    parameter [31:0] pma_base12_p = 32'h00000000,
    parameter [31:0] pma_mask12_p = 32'h00000000,
    parameter [31:0] pma_base13_p = 32'h00000000,
    parameter [31:0] pma_mask13_p = 32'h00000000,
    parameter [31:0] pma_base14_p = 32'h00000000,
    parameter [31:0] pma_mask14_p = 32'h00000000,
    parameter [31:0] pma_base15_p = 32'h00000000,
    parameter [31:0] pma_mask15_p = 32'h00000000,
    parameter [1:0] pma_cfg15_p = 2'h0,
    parameter [1:0] pma_cfg14_p = 2'h0,
    parameter [1:0] pma_cfg13_p = 2'h0,
    parameter [1:0] pma_cfg12_p = 2'h0,
    parameter [1:0] pma_cfg11_p = 2'h0,
    parameter [1:0] pma_cfg10_p = 2'h0,
    parameter [1:0] pma_cfg9_p = 2'h0,
    parameter [1:0] pma_cfg8_p = 2'h0,
    parameter [1:0] pma_cfg7_p = 2'h0,
    parameter [1:0] pma_cfg6_p = 2'h0,
    parameter [1:0] pma_cfg5_p = 2'h2,
    parameter [1:0] pma_cfg4_p = 2'h2,
    parameter [1:0] pma_cfg3_p = 2'h0,
    parameter [1:0] pma_cfg2_p = 2'h0,
    parameter [1:0] pma_cfg1_p = 2'h0,
    parameter [1:0] pma_cfg0_p = 2'h3
) (
    input  logic r_wfi_ce_ICLK,
    input  logic RST,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp0_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp10_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp11_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp12_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp13_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp14_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp15_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp1_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp2_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp3_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp4_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp5_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp6_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp7_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp8_napot_mask_Q,
    input  logic [31:0] execute_stage_lsu_pmp_r_pmp9_napot_mask_Q,
    input  logic [31:0] i1_if_cpu_fetch_HRDATA,
    input  logic i1_if_cpu_fetch_HREADY,
    input  logic i1_if_cpu_fetch_HRESP,
    input  logic pl_ifu_FIN_CLEAR_Q,
    input  logic pl_ifu_FIN_STALL_Q,
    input  logic [31:0] r_csr_pmpaddr0_Q,
    input  logic [31:0] r_csr_pmpaddr10_Q,
    input  logic [31:0] r_csr_pmpaddr11_Q,
    input  logic [31:0] r_csr_pmpaddr12_Q,
    input  logic [31:0] r_csr_pmpaddr13_Q,
    input  logic [31:0] r_csr_pmpaddr14_Q,
    input  logic [31:0] r_csr_pmpaddr15_Q,
    input  logic [31:0] r_csr_pmpaddr1_Q,
    input  logic [31:0] r_csr_pmpaddr2_Q,
    input  logic [31:0] r_csr_pmpaddr3_Q,
    input  logic [31:0] r_csr_pmpaddr4_Q,
    input  logic [31:0] r_csr_pmpaddr5_Q,
    input  logic [31:0] r_csr_pmpaddr6_Q,
    input  logic [31:0] r_csr_pmpaddr7_Q,
    input  logic [31:0] r_csr_pmpaddr8_Q,
    input  logic [31:0] r_csr_pmpaddr9_Q,
    input  logic [31:0] r_csr_pmpcfg0_Q,
    input  logic [31:0] r_csr_pmpcfg1_Q,
    input  logic [31:0] r_csr_pmpcfg2_Q,
    input  logic [31:0] r_csr_pmpcfg3_Q,
    input  logic [1:0] r_prv_Q,
    input  logic s_ack_i_D,
    input  logic [31:0] s_addr_i_D,
    input  logic [1:0] s_addr_valid_i_D,
    input  logic s_flush_i_D,
    input  logic s_ocd_progbuf_mode_i_D,
    output logic [31:0] i1_if_cpu_fetch_HADDR,
    output logic [2:0] i1_if_cpu_fetch_HBURST,
    output logic i1_if_cpu_fetch_HMASTLOCK,
    output logic [3:0] i1_if_cpu_fetch_HPROT,
    output logic [2:0] i1_if_cpu_fetch_HSIZE,
    output logic [1:0] i1_if_cpu_fetch_HTRANS,
    output logic i1_if_cpu_fetch_HWRITE,
    output logic pl_ifu_FIN_CLEAR_D,
    output logic pl_ifu_FIN_STALL_D,
    output logic s_bus_busy_o_Q,
    output logic [31:0] s_data_addr_o_Q,
    output logic [31:0] s_data_o_Q,
    output logic [1:0] s_data_valid_o_Q,
    output logic [4:0] s_exc_type_o_Q,
    output logic s_exc_valid_o_Q,
    output logic s_ifu_busy_o_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic [31:0] s_addr_i;
    // CodAL signal/wire
    logic [1:0] s_addr_valid_i;
    // CodAL signal/wire
    logic s_flush_i;
    // CodAL signal/wire
    logic s_ack_i;
    // CodAL signal/wire
    logic s_ocd_progbuf_mode_i;
    // CodAL signal/wire
    logic [31:0] s_data_addr_o;
    // CodAL signal/wire
    logic [1:0] s_data_valid_o;
    // CodAL signal/wire
    logic [31:0] s_data_o;
    // CodAL signal/wire
    logic [4:0] s_exc_type_o;
    // CodAL signal/wire
    logic s_exc_valid_o;
    // CodAL signal/wire
    logic s_ifu_busy_o;
    // CodAL signal/wire
    logic s_bus_busy_o;
    // CodAL signal/wire
    logic s_bus_busy;
    // CodAL signal/wire
    logic s_fin_busy;
    // CodAL signal/wire
    logic s_fin_full;
    // CodAL signal/wire
    logic s_request_hready;
    // CodAL signal/wire
    logic [31:0] s_fetch_hrdata_raw;
    // CodAL signal/wire
    logic s_fetch_hready;
    // CodAL signal/wire
    logic s_fetch_hresp;

    // additional declarations:
    logic compute_req_r_data_addr_WE_wire;
    logic [31:0] compute_req_r_data_addr_D_wire;
    logic [31:0] r_data_addr_Q_wire;
    logic compute_req_r_fault_pma_WE_wire;
    logic compute_req_r_fault_pma_D_wire;
    logic r_fault_pma_Q_wire;
    logic compute_req_r_fault_pmp_WE_wire;
    logic compute_req_r_fault_pmp_D_wire;
    logic r_fault_pmp_Q_wire;
    logic compute_req_r_addr_valid_WE_wire;
    logic [1:0] compute_req_r_addr_valid_D_wire;
    logic [1:0] r_addr_valid_Q_wire;
    logic compute_fin_r_fin_state_WE_wire;
    logic compute_fin_r_fin_state_D_wire;
    logic r_fin_state_Q_wire;
    logic compute_fin_r_data_WE_wire;
    logic [31:0] compute_fin_r_data_D_wire;
    logic [31:0] r_data_Q_wire;
    logic compute_fin_r_hresp_WE_wire;
    logic compute_fin_r_hresp_D_wire;
    logic r_hresp_Q_wire;
    logic compute_req_r_waited_transfer_WE_wire;
    logic compute_req_r_waited_transfer_D_wire;
    logic r_waited_transfer_Q_wire;
    logic compute_req_r_waited_hprot_WE_wire;
    logic [3:0] compute_req_r_waited_hprot_D_wire;
    logic [3:0] r_waited_hprot_Q_wire;
    logic compute_req_r_waited_addr_WE_wire;
    logic [31:0] compute_req_r_waited_addr_D_wire;
    logic [31:0] r_waited_addr_Q_wire;
    logic compute_req_r_waited_addr_valid_WE_wire;
    logic [1:0] compute_req_r_waited_addr_valid_D_wire;
    logic [1:0] r_waited_addr_valid_Q_wire;
    logic [31:0] compute_req_pma_fetch_s_addr_i_D_wire;
    logic pma_fetch_s_cacheable_o_Q_wire;
    logic pma_fetch_s_fault_o_Q_wire;
    logic pma_fetch_s_idempotent_o_Q_wire;
    logic [31:0] compute_req_pmp_fetch_s_addr_i_D_wire;
    logic [1:0] compute_req_pmp_fetch_s_prv_i_D_wire;
    logic pmp_fetch_s_fault_o_Q_wire;

    // child instances inside CodAL module:
    // instance of 's_addr_i' CodAL signal/wire: (single driver)
    assign s_addr_i = s_addr_i_D;
    // instance of 's_addr_valid_i' CodAL signal/wire: (single driver)
    assign s_addr_valid_i = s_addr_valid_i_D;
    // instance of 's_flush_i' CodAL signal/wire: (single driver)
    assign s_flush_i = s_flush_i_D;
    // instance of 's_ack_i' CodAL signal/wire: (single driver)
    assign s_ack_i = s_ack_i_D;
    // instance of 's_ocd_progbuf_mode_i' CodAL signal/wire: (single driver)
    assign s_ocd_progbuf_mode_i = s_ocd_progbuf_mode_i_D;
    // instance of 's_data_addr_o' CodAL signal/wire: (parent port driver(s))
    assign s_data_addr_o_Q = s_data_addr_o;
    // instance of 's_data_valid_o' CodAL signal/wire: (parent port driver(s))
    assign s_data_valid_o_Q = s_data_valid_o;
    // instance of 's_data_o' CodAL signal/wire: (parent port driver(s))
    assign s_data_o_Q = s_data_o;
    // instance of 's_exc_type_o' CodAL signal/wire: (parent port driver(s))
    assign s_exc_type_o_Q = s_exc_type_o;
    // instance of 's_exc_valid_o' CodAL signal/wire: (parent port driver(s))
    assign s_exc_valid_o_Q = s_exc_valid_o;
    // instance of 's_ifu_busy_o' CodAL signal/wire: (parent port driver(s))
    assign s_ifu_busy_o_Q = s_ifu_busy_o;
    // instance of 's_bus_busy_o' CodAL signal/wire: (parent port driver(s))
    assign s_bus_busy_o_Q = s_bus_busy_o;
    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_data_addr (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pl_ifu_FIN_CLEAR_Q),
        .STALL(pl_ifu_FIN_STALL_Q),
        .WE(compute_req_r_data_addr_WE_wire),
        .D(compute_req_r_data_addr_D_wire),
        .Q(r_data_addr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_fault_pma (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pl_ifu_FIN_CLEAR_Q),
        .STALL(pl_ifu_FIN_STALL_Q),
        .WE(compute_req_r_fault_pma_WE_wire),
        .D(compute_req_r_fault_pma_D_wire),
        .Q(r_fault_pma_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_fault_pmp (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pl_ifu_FIN_CLEAR_Q),
        .STALL(pl_ifu_FIN_STALL_Q),
        .WE(compute_req_r_fault_pmp_WE_wire),
        .D(compute_req_r_fault_pmp_D_wire),
        .Q(r_fault_pmp_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_addr_valid (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pl_ifu_FIN_CLEAR_Q),
        .STALL(pl_ifu_FIN_STALL_Q),
        .WE(compute_req_r_addr_valid_WE_wire),
        .D(compute_req_r_addr_valid_D_wire),
        .Q(r_addr_valid_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_fin_state (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(compute_fin_r_fin_state_WE_wire),
        .D(compute_fin_r_fin_state_D_wire),
        .Q(r_fin_state_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_data (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(compute_fin_r_data_WE_wire),
        .D(compute_fin_r_data_D_wire),
        .Q(r_data_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_hresp (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(compute_fin_r_hresp_WE_wire),
        .D(compute_fin_r_hresp_D_wire),
        .Q(r_hresp_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_waited_transfer (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(compute_req_r_waited_transfer_WE_wire),
        .D(compute_req_r_waited_transfer_D_wire),
        .Q(r_waited_transfer_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd4),
        .DEFAULT_VALUE(4'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_waited_hprot (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(compute_req_r_waited_hprot_WE_wire),
        .D(compute_req_r_waited_hprot_D_wire),
        .Q(r_waited_hprot_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_waited_addr (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(compute_req_r_waited_addr_WE_wire),
        .D(compute_req_r_waited_addr_D_wire),
        .Q(r_waited_addr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_waited_addr_valid (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .WE(compute_req_r_waited_addr_valid_WE_wire),
        .D(compute_req_r_waited_addr_valid_D_wire),
        .Q(r_waited_addr_valid_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_fetch_stage_ifu_pma_t #(
        .pma_base0_p(pma_base0_p),
        .pma_mask0_p(pma_mask0_p),
        .pma_enable_p(pma_enable_p),
        .pma_base1_p(pma_base1_p),
        .pma_mask1_p(pma_mask1_p),
        .pma_base2_p(pma_base2_p),
        .pma_mask2_p(pma_mask2_p),
        .pma_base3_p(pma_base3_p),
        .pma_mask3_p(pma_mask3_p),
        .pma_base4_p(pma_base4_p),
        .pma_mask4_p(pma_mask4_p),
        .pma_base5_p(pma_base5_p),
        .pma_mask5_p(pma_mask5_p),
        .pma_base6_p(pma_base6_p),
        .pma_mask6_p(pma_mask6_p),
        .pma_base7_p(pma_base7_p),
        .pma_mask7_p(pma_mask7_p),
        .pma_base8_p(pma_base8_p),
        .pma_mask8_p(pma_mask8_p),
        .pma_base9_p(pma_base9_p),
        .pma_mask9_p(pma_mask9_p),
        .pma_base10_p(pma_base10_p),
        .pma_mask10_p(pma_mask10_p),
        .pma_base11_p(pma_base11_p),
        .pma_mask11_p(pma_mask11_p),
        .pma_base12_p(pma_base12_p),
        .pma_mask12_p(pma_mask12_p),
        .pma_base13_p(pma_base13_p),
        .pma_mask13_p(pma_mask13_p),
        .pma_base14_p(pma_base14_p),
        .pma_mask14_p(pma_mask14_p),
        .pma_base15_p(pma_base15_p),
        .pma_mask15_p(pma_mask15_p),
        .pma_cfg15_p(pma_cfg15_p),
        .pma_cfg14_p(pma_cfg14_p),
        .pma_cfg13_p(pma_cfg13_p),
        .pma_cfg12_p(pma_cfg12_p),
        .pma_cfg11_p(pma_cfg11_p),
        .pma_cfg10_p(pma_cfg10_p),
        .pma_cfg9_p(pma_cfg9_p),
        .pma_cfg8_p(pma_cfg8_p),
        .pma_cfg7_p(pma_cfg7_p),
        .pma_cfg6_p(pma_cfg6_p),
        .pma_cfg5_p(pma_cfg5_p),
        .pma_cfg4_p(pma_cfg4_p),
        .pma_cfg3_p(pma_cfg3_p),
        .pma_cfg2_p(pma_cfg2_p),
        .pma_cfg1_p(pma_cfg1_p),
        .pma_cfg0_p(pma_cfg0_p)
    ) pma (
        .fetch_s_addr_i_D(compute_req_pma_fetch_s_addr_i_D_wire),
        .fetch_s_cacheable_o_Q(pma_fetch_s_cacheable_o_Q_wire),
        .fetch_s_fault_o_Q(pma_fetch_s_fault_o_Q_wire),
        .fetch_s_idempotent_o_Q(pma_fetch_s_idempotent_o_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_fetch_stage_ifu_pmp_t pmp (
        .execute_stage_lsu_pmp_r_pmp0_napot_mask_Q(execute_stage_lsu_pmp_r_pmp0_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp10_napot_mask_Q(execute_stage_lsu_pmp_r_pmp10_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp11_napot_mask_Q(execute_stage_lsu_pmp_r_pmp11_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp12_napot_mask_Q(execute_stage_lsu_pmp_r_pmp12_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp13_napot_mask_Q(execute_stage_lsu_pmp_r_pmp13_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp14_napot_mask_Q(execute_stage_lsu_pmp_r_pmp14_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp15_napot_mask_Q(execute_stage_lsu_pmp_r_pmp15_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp1_napot_mask_Q(execute_stage_lsu_pmp_r_pmp1_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp2_napot_mask_Q(execute_stage_lsu_pmp_r_pmp2_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp3_napot_mask_Q(execute_stage_lsu_pmp_r_pmp3_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp4_napot_mask_Q(execute_stage_lsu_pmp_r_pmp4_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp5_napot_mask_Q(execute_stage_lsu_pmp_r_pmp5_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp6_napot_mask_Q(execute_stage_lsu_pmp_r_pmp6_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp7_napot_mask_Q(execute_stage_lsu_pmp_r_pmp7_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp8_napot_mask_Q(execute_stage_lsu_pmp_r_pmp8_napot_mask_Q),
        .execute_stage_lsu_pmp_r_pmp9_napot_mask_Q(execute_stage_lsu_pmp_r_pmp9_napot_mask_Q),
        .fetch_s_addr_i_D(compute_req_pmp_fetch_s_addr_i_D_wire),
        .fetch_s_prv_i_D(compute_req_pmp_fetch_s_prv_i_D_wire),
        .r_csr_pmpaddr0_Q(r_csr_pmpaddr0_Q),
        .r_csr_pmpaddr10_Q(r_csr_pmpaddr10_Q),
        .r_csr_pmpaddr11_Q(r_csr_pmpaddr11_Q),
        .r_csr_pmpaddr12_Q(r_csr_pmpaddr12_Q),
        .r_csr_pmpaddr13_Q(r_csr_pmpaddr13_Q),
        .r_csr_pmpaddr14_Q(r_csr_pmpaddr14_Q),
        .r_csr_pmpaddr15_Q(r_csr_pmpaddr15_Q),
        .r_csr_pmpaddr1_Q(r_csr_pmpaddr1_Q),
        .r_csr_pmpaddr2_Q(r_csr_pmpaddr2_Q),
        .r_csr_pmpaddr3_Q(r_csr_pmpaddr3_Q),
        .r_csr_pmpaddr4_Q(r_csr_pmpaddr4_Q),
        .r_csr_pmpaddr5_Q(r_csr_pmpaddr5_Q),
        .r_csr_pmpaddr6_Q(r_csr_pmpaddr6_Q),
        .r_csr_pmpaddr7_Q(r_csr_pmpaddr7_Q),
        .r_csr_pmpaddr8_Q(r_csr_pmpaddr8_Q),
        .r_csr_pmpaddr9_Q(r_csr_pmpaddr9_Q),
        .r_csr_pmpcfg0_Q(r_csr_pmpcfg0_Q),
        .r_csr_pmpcfg1_Q(r_csr_pmpcfg1_Q),
        .r_csr_pmpcfg2_Q(r_csr_pmpcfg2_Q),
        .r_csr_pmpcfg3_Q(r_csr_pmpcfg3_Q),
        .fetch_s_fault_o_Q(pmp_fetch_s_fault_o_Q_wire)
    );

    // functional unit instance:
    codix_berkelium_ca_core_fetch_stage_ifu_compute_fin_t compute_fin (
        .r_addr_valid_Q(r_addr_valid_Q_wire),
        .r_data_addr_Q(r_data_addr_Q_wire),
        .r_data_Q(r_data_Q_wire),
        .r_fault_pma_Q(r_fault_pma_Q_wire),
        .r_fault_pmp_Q(r_fault_pmp_Q_wire),
        .r_fin_state_Q(r_fin_state_Q_wire),
        .r_hresp_Q(r_hresp_Q_wire),
        .s_ack_i_Q(s_ack_i),
        .s_bus_busy_Q(s_bus_busy),
        .s_exc_valid_o_Q(s_exc_valid_o),
        .s_fetch_hrdata_raw_Q(s_fetch_hrdata_raw),
        .s_fetch_hready_Q(s_fetch_hready),
        .s_fetch_hresp_Q(s_fetch_hresp),
        .s_fin_busy_Q(s_fin_busy),
        .s_fin_full_Q(s_fin_full),
        .s_flush_i_Q(s_flush_i),
        .r_data_D(compute_fin_r_data_D_wire),
        .r_data_WE(compute_fin_r_data_WE_wire),
        .r_fin_state_D(compute_fin_r_fin_state_D_wire),
        .r_fin_state_WE(compute_fin_r_fin_state_WE_wire),
        .r_hresp_D(compute_fin_r_hresp_D_wire),
        .r_hresp_WE(compute_fin_r_hresp_WE_wire),
        .s_data_addr_o_D(s_data_addr_o),
        .s_data_o_D(s_data_o),
        .s_data_valid_o_D(s_data_valid_o),
        .s_exc_type_o_D(s_exc_type_o),
        .s_exc_valid_o_D(s_exc_valid_o),
        .s_fin_busy_D(s_fin_busy),
        .s_fin_full_D(s_fin_full),
        .s_request_hready_D(s_request_hready)
    );

    // functional unit instance:
    codix_berkelium_ca_core_fetch_stage_ifu_compute_req_t compute_req (
        .pma_fetch_s_cacheable_o_Q(pma_fetch_s_cacheable_o_Q_wire),
        .pma_fetch_s_fault_o_Q(pma_fetch_s_fault_o_Q_wire),
        .pma_fetch_s_idempotent_o_Q(pma_fetch_s_idempotent_o_Q_wire),
        .pmp_fetch_s_fault_o_Q(pmp_fetch_s_fault_o_Q_wire),
        .r_prv_Q(r_prv_Q),
        .r_waited_addr_Q(r_waited_addr_Q_wire),
        .r_waited_addr_valid_Q(r_waited_addr_valid_Q_wire),
        .r_waited_hprot_Q(r_waited_hprot_Q_wire),
        .r_waited_transfer_Q(r_waited_transfer_Q_wire),
        .s_ack_i_Q(s_ack_i),
        .s_addr_i_Q(s_addr_i),
        .s_addr_valid_i_Q(s_addr_valid_i),
        .s_bus_busy_Q(s_bus_busy),
        .s_fin_busy_Q(s_fin_busy),
        .s_fin_full_Q(s_fin_full),
        .s_flush_i_Q(s_flush_i),
        .s_ocd_progbuf_mode_i_Q(s_ocd_progbuf_mode_i),
        .s_request_hready_Q(s_request_hready),
        .i1_if_cpu_fetch_HADDR(i1_if_cpu_fetch_HADDR),
        .i1_if_cpu_fetch_HBURST(i1_if_cpu_fetch_HBURST),
        .i1_if_cpu_fetch_HMASTLOCK(i1_if_cpu_fetch_HMASTLOCK),
        .i1_if_cpu_fetch_HPROT(i1_if_cpu_fetch_HPROT),
        .i1_if_cpu_fetch_HSIZE(i1_if_cpu_fetch_HSIZE),
        .i1_if_cpu_fetch_HTRANS(i1_if_cpu_fetch_HTRANS),
        .i1_if_cpu_fetch_HWRITE(i1_if_cpu_fetch_HWRITE),
        .pl_ifu_FIN_CLEAR_D(pl_ifu_FIN_CLEAR_D),
        .pl_ifu_FIN_STALL_D(pl_ifu_FIN_STALL_D),
        .pma_fetch_s_addr_i_D(compute_req_pma_fetch_s_addr_i_D_wire),
        .pmp_fetch_s_addr_i_D(compute_req_pmp_fetch_s_addr_i_D_wire),
        .pmp_fetch_s_prv_i_D(compute_req_pmp_fetch_s_prv_i_D_wire),
        .r_addr_valid_D(compute_req_r_addr_valid_D_wire),
        .r_addr_valid_WE(compute_req_r_addr_valid_WE_wire),
        .r_data_addr_D(compute_req_r_data_addr_D_wire),
        .r_data_addr_WE(compute_req_r_data_addr_WE_wire),
        .r_fault_pma_D(compute_req_r_fault_pma_D_wire),
        .r_fault_pma_WE(compute_req_r_fault_pma_WE_wire),
        .r_fault_pmp_D(compute_req_r_fault_pmp_D_wire),
        .r_fault_pmp_WE(compute_req_r_fault_pmp_WE_wire),
        .r_waited_addr_D(compute_req_r_waited_addr_D_wire),
        .r_waited_addr_valid_D(compute_req_r_waited_addr_valid_D_wire),
        .r_waited_addr_valid_WE(compute_req_r_waited_addr_valid_WE_wire),
        .r_waited_addr_WE(compute_req_r_waited_addr_WE_wire),
        .r_waited_hprot_D(compute_req_r_waited_hprot_D_wire),
        .r_waited_hprot_WE(compute_req_r_waited_hprot_WE_wire),
        .r_waited_transfer_D(compute_req_r_waited_transfer_D_wire),
        .r_waited_transfer_WE(compute_req_r_waited_transfer_WE_wire),
        .s_ifu_busy_o_D(s_ifu_busy_o)
    );

    // functional unit instance:
    codix_berkelium_ca_core_fetch_stage_ifu_check_bus_t check_bus (
        .i1_if_cpu_fetch_HRDATA(i1_if_cpu_fetch_HRDATA),
        .i1_if_cpu_fetch_HREADY(i1_if_cpu_fetch_HREADY),
        .i1_if_cpu_fetch_HRESP(i1_if_cpu_fetch_HRESP),
        .s_fetch_hready_Q(s_fetch_hready),
        .s_bus_busy_D(s_bus_busy),
        .s_bus_busy_o_D(s_bus_busy_o),
        .s_fetch_hrdata_raw_D(s_fetch_hrdata_raw),
        .s_fetch_hready_D(s_fetch_hready),
        .s_fetch_hresp_D(s_fetch_hresp)
    );

endmodule: codix_berkelium_ca_core_fetch_stage_ifu_t
