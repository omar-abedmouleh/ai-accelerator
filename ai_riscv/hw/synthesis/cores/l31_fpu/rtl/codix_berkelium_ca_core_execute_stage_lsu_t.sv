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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_lsu_t' CodAL module.
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

module codix_berkelium_ca_core_execute_stage_lsu_t #(
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
    parameter [1:0] pma_cfg0_p = 2'h3,
    parameter [31:0] cache_base_p = 32'h00010000
) (
    input  logic execute_stage_lsu_s_load_ce_ICLK,
    input  logic execute_stage_lsu_s_lsu_ce_ICLK,
    input  logic execute_stage_lsu_s_store_ce_ICLK,
    input  logic r_wfi_ce_ICLK,
    input  logic RST,
    input  logic [31:0] i1_if_cpu_ldst_HRDATA,
    input  logic i1_if_cpu_ldst_HREADY,
    input  logic i1_if_cpu_ldst_HRESP,
    input  logic pl_lsu_FIN_CLEAR_Q,
    input  logic pl_lsu_FIN_STALL_Q,
    input  logic [11:0] pmp_s_csr_waddr_i_D,
    input  logic [31:0] pmp_s_csr_wdata_i_D,
    input  logic pmp_s_csr_we_i_D,
    input  logic [6:0] r_csr_mstatus_Q,
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
    input  logic [31:0] s_addr_i_D,
    input  logic s_clear_i_D,
    input  logic s_ocd_mmode_i_D,
    input  logic [7:0] s_op_i_D,
    input  logic [5:0] s_rd_addr_i_D,
    input  logic [31:0] s_syscall_addr_i_D,
    input  logic [31:0] s_wdata_i_D,
    output logic halt_ACT,
    output logic [31:0] i1_if_cpu_ldst_HADDR,
    output logic [2:0] i1_if_cpu_ldst_HBURST,
    output logic i1_if_cpu_ldst_HMASTLOCK,
    output logic [3:0] i1_if_cpu_ldst_HPROT,
    output logic [2:0] i1_if_cpu_ldst_HSIZE,
    output logic [1:0] i1_if_cpu_ldst_HTRANS,
    output logic [31:0] i1_if_cpu_ldst_HWDATA,
    output logic i1_if_cpu_ldst_HWRITE,
    output logic pl_lsu_FIN_CLEAR_D,
    output logic pl_lsu_FIN_STALL_D,
    output logic [31:0] pmp_r_pmp0_napot_mask_Q,
    output logic [31:0] pmp_r_pmp10_napot_mask_Q,
    output logic [31:0] pmp_r_pmp11_napot_mask_Q,
    output logic [31:0] pmp_r_pmp12_napot_mask_Q,
    output logic [31:0] pmp_r_pmp13_napot_mask_Q,
    output logic [31:0] pmp_r_pmp14_napot_mask_Q,
    output logic [31:0] pmp_r_pmp15_napot_mask_Q,
    output logic [31:0] pmp_r_pmp1_napot_mask_Q,
    output logic [31:0] pmp_r_pmp2_napot_mask_Q,
    output logic [31:0] pmp_r_pmp3_napot_mask_Q,
    output logic [31:0] pmp_r_pmp4_napot_mask_Q,
    output logic [31:0] pmp_r_pmp5_napot_mask_Q,
    output logic [31:0] pmp_r_pmp6_napot_mask_Q,
    output logic [31:0] pmp_r_pmp7_napot_mask_Q,
    output logic [31:0] pmp_r_pmp8_napot_mask_Q,
    output logic [31:0] pmp_r_pmp9_napot_mask_Q,
    output logic [31:0] r_csr_pmpaddr0_D,
    output logic r_csr_pmpaddr0_WE,
    output logic [31:0] r_csr_pmpaddr10_D,
    output logic r_csr_pmpaddr10_WE,
    output logic [31:0] r_csr_pmpaddr11_D,
    output logic r_csr_pmpaddr11_WE,
    output logic [31:0] r_csr_pmpaddr12_D,
    output logic r_csr_pmpaddr12_WE,
    output logic [31:0] r_csr_pmpaddr13_D,
    output logic r_csr_pmpaddr13_WE,
    output logic [31:0] r_csr_pmpaddr14_D,
    output logic r_csr_pmpaddr14_WE,
    output logic [31:0] r_csr_pmpaddr15_D,
    output logic r_csr_pmpaddr15_WE,
    output logic [31:0] r_csr_pmpaddr1_D,
    output logic r_csr_pmpaddr1_WE,
    output logic [31:0] r_csr_pmpaddr2_D,
    output logic r_csr_pmpaddr2_WE,
    output logic [31:0] r_csr_pmpaddr3_D,
    output logic r_csr_pmpaddr3_WE,
    output logic [31:0] r_csr_pmpaddr4_D,
    output logic r_csr_pmpaddr4_WE,
    output logic [31:0] r_csr_pmpaddr5_D,
    output logic r_csr_pmpaddr5_WE,
    output logic [31:0] r_csr_pmpaddr6_D,
    output logic r_csr_pmpaddr6_WE,
    output logic [31:0] r_csr_pmpaddr7_D,
    output logic r_csr_pmpaddr7_WE,
    output logic [31:0] r_csr_pmpaddr8_D,
    output logic r_csr_pmpaddr8_WE,
    output logic [31:0] r_csr_pmpaddr9_D,
    output logic r_csr_pmpaddr9_WE,
    output logic [31:0] r_csr_pmpcfg0_D,
    output logic r_csr_pmpcfg0_WE,
    output logic [31:0] r_csr_pmpcfg1_D,
    output logic r_csr_pmpcfg1_WE,
    output logic [31:0] r_csr_pmpcfg2_D,
    output logic r_csr_pmpcfg2_WE,
    output logic [31:0] r_csr_pmpcfg3_D,
    output logic r_csr_pmpcfg3_WE,
    output logic s_fin_busy_o_Q,
    output logic [1:0] s_fin_exc_extra_o_Q,
    output logic [31:0] s_fin_exc_tval_o_Q,
    output logic [4:0] s_fin_exc_type_o_Q,
    output logic s_fin_exc_valid_o_Q,
    output logic [7:0] s_fin_op_o_Q,
    output logic [5:0] s_fin_rd_addr_o_Q,
    output logic [31:0] s_fin_rd_data_o_Q,
    output logic s_fin_rd_valid_o_Q,
    output logic s_fin_rd_we_o_Q,
    output logic s_is_load_Q,
    output logic s_load_ce_Q,
    output logic s_lsu_ce_Q,
    output logic [1:0] s_req_exc_extra_o_Q,
    output logic [31:0] s_req_exc_tval_o_Q,
    output logic [4:0] s_req_exc_type_o_Q,
    output logic s_req_exc_valid_o_Q,
    output logic s_store_ce_Q,
    output logic s_waited_transfer_o_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic [7:0] s_op_i;
    // CodAL signal/wire
    logic [31:0] s_wdata_i;
    // CodAL signal/wire
    logic [31:0] s_addr_i;
    // CodAL signal/wire
    logic [5:0] s_rd_addr_i;
    // CodAL signal/wire
    logic s_clear_i;
    // CodAL signal/wire
    logic [31:0] s_syscall_addr_i;
    // CodAL signal/wire
    logic s_ocd_mmode_i;
    // CodAL signal/wire
    logic [4:0] s_req_exc_type_o;
    // CodAL signal/wire
    logic [1:0] s_req_exc_extra_o;
    // CodAL signal/wire
    logic s_req_exc_valid_o;
    // CodAL signal/wire
    logic [31:0] s_req_exc_tval_o;
    // CodAL signal/wire
    logic s_waited_transfer_o;
    // CodAL signal/wire
    logic [7:0] s_fin_op_o;
    // CodAL signal/wire
    logic [31:0] s_fin_rd_data_o;
    // CodAL signal/wire
    logic [5:0] s_fin_rd_addr_o;
    // CodAL signal/wire
    logic s_fin_rd_valid_o;
    // CodAL signal/wire
    logic s_fin_rd_we_o;
    // CodAL signal/wire
    logic s_fin_busy_o;
    // CodAL signal/wire
    logic s_fin_exc_valid_o;
    // CodAL signal/wire
    logic [31:0] s_fin_exc_tval_o;
    // CodAL signal/wire
    logic [4:0] s_fin_exc_type_o;
    // CodAL signal/wire
    logic [1:0] s_fin_exc_extra_o;
    // CodAL signal/wire
    logic s_pma_cacheable;
    // CodAL signal/wire
    logic s_pma_idempotent;
    // CodAL signal/wire
    logic s_exc_valid;
    // CodAL signal/wire
    logic [4:0] s_exc_type;
    // CodAL signal/wire
    logic s_exc_pma;
    // CodAL signal/wire
    logic s_is_load;
    // CodAL signal/wire
    logic s_is_store;
    // CodAL signal/wire
    logic s_is_fence;
    // CodAL signal/wire
    logic s_is_fence_i;
    // CodAL signal/wire
    logic s_fin_busy;
    // CodAL signal/wire
    logic [31:0] s_req_addr;
    // CodAL signal/wire
    logic [31:0] s_req_wdata;
    // CodAL signal/wire
    logic [7:0] s_req_op;
    // CodAL signal/wire
    logic s_req_do_load;
    // CodAL signal/wire
    logic [3:0] s_new_state;
    // CodAL signal/wire
    logic s_multicycle;
    // CodAL signal/wire
    logic s_fence_issued;
    // CodAL signal/wire
    logic s_lsu_ce;
    // CodAL signal/wire
    logic s_load_ce;
    // CodAL signal/wire
    logic s_store_ce;
    // CodAL signal/wire
    logic s_request_hready;
    // CodAL signal/wire
    logic s_syscall_done;
    // CodAL signal/wire
    logic s_syscall_halt;

    // additional declarations:
    logic compute_req_r_mc_exc_valid_WE_wire;
    logic compute_req_r_mc_exc_valid_D_wire;
    logic r_mc_exc_valid_Q_wire;
    logic compute_req_r_mc_pma_fault_WE_wire;
    logic compute_req_r_mc_pma_fault_D_wire;
    logic r_mc_pma_fault_Q_wire;
    logic compute_req_fsm_r_op_WE_wire;
    logic [7:0] compute_req_fsm_r_op_D_wire;
    logic [7:0] r_op_Q_wire;
    logic compute_req_r_data_addr_WE_wire;
    logic [31:0] compute_req_r_data_addr_D_wire;
    logic [31:0] r_data_addr_Q_wire;
    logic compute_req_r_rd_addr_WE_wire;
    logic [5:0] compute_req_r_rd_addr_D_wire;
    logic [5:0] r_rd_addr_Q_wire;
    logic compute_req_r_wdata_WE_wire;
    logic [31:0] compute_req_r_wdata_D_wire;
    logic [31:0] r_wdata_Q_wire;
    logic compute_req_r_is_store_WE_wire;
    logic compute_req_r_is_store_D_wire;
    logic r_is_store_Q_wire;
    logic compute_req_r_is_load_WE_wire;
    logic compute_req_r_is_load_D_wire;
    logic r_is_load_Q_wire;
    logic compute_req_r_valid_WE_wire;
    logic compute_req_r_valid_D_wire;
    logic r_valid_Q_wire;
    logic compute_req_r_state_WE_wire;
    logic [3:0] compute_req_r_state_D_wire;
    logic [3:0] r_state_Q_wire;
    logic compute_fin_r_hresp_WE_wire;
    logic compute_fin_r_hresp_D_wire;
    logic r_hresp_Q_wire;
    logic compute_req_r_waited_transfer_WE_wire;
    logic compute_req_r_waited_transfer_D_wire;
    logic r_waited_transfer_Q_wire;
    logic [31:0] compute_addr_check_pma_ldst_s_addr_i_D_wire;
    logic [1:0] compute_addr_check_pma_ldst_s_size_i_D_wire;
    logic pma_ldst_s_cacheable_o_Q_wire;
    logic pma_ldst_s_fault_o_Q_wire;
    logic pma_ldst_s_idempotent_o_Q_wire;
    logic pma_ldst_s_misaligned_o_Q_wire;
    logic [31:0] compute_addr_check_pmp_ldst_s_addr_i_D_wire;
    logic [1:0] compute_addr_check_pmp_ldst_s_prv_i_D_wire;
    logic compute_addr_check_pmp_ldst_s_valid_i_D_wire;
    logic compute_addr_check_pmp_ldst_s_write_i_D_wire;
    logic pmp_ldst_s_fault_o_Q_wire;

    // child instances inside CodAL module:
    // instance of 's_op_i' CodAL signal/wire: (single driver)
    assign s_op_i = s_op_i_D;
    // instance of 's_wdata_i' CodAL signal/wire: (single driver)
    assign s_wdata_i = s_wdata_i_D;
    // instance of 's_addr_i' CodAL signal/wire: (single driver)
    assign s_addr_i = s_addr_i_D;
    // instance of 's_rd_addr_i' CodAL signal/wire: (single driver)
    assign s_rd_addr_i = s_rd_addr_i_D;
    // instance of 's_clear_i' CodAL signal/wire: (single driver)
    assign s_clear_i = s_clear_i_D;
    // instance of 's_syscall_addr_i' CodAL signal/wire: (single driver)
    assign s_syscall_addr_i = s_syscall_addr_i_D;
    // instance of 's_ocd_mmode_i' CodAL signal/wire: (single driver)
    assign s_ocd_mmode_i = s_ocd_mmode_i_D;
    // instance of 's_req_exc_type_o' CodAL signal/wire: (parent port driver(s))
    assign s_req_exc_type_o_Q = s_req_exc_type_o;
    // instance of 's_req_exc_extra_o' CodAL signal/wire: (parent port driver(s))
    assign s_req_exc_extra_o_Q = s_req_exc_extra_o;
    // instance of 's_req_exc_valid_o' CodAL signal/wire: (parent port driver(s))
    assign s_req_exc_valid_o_Q = s_req_exc_valid_o;
    // instance of 's_req_exc_tval_o' CodAL signal/wire: (parent port driver(s))
    assign s_req_exc_tval_o_Q = s_req_exc_tval_o;
    // instance of 's_waited_transfer_o' CodAL signal/wire: (parent port driver(s))
    assign s_waited_transfer_o_Q = s_waited_transfer_o;
    // instance of 's_fin_op_o' CodAL signal/wire: (parent port driver(s))
    assign s_fin_op_o_Q = s_fin_op_o;
    // instance of 's_fin_rd_data_o' CodAL signal/wire: (parent port driver(s))
    assign s_fin_rd_data_o_Q = s_fin_rd_data_o;
    // instance of 's_fin_rd_addr_o' CodAL signal/wire: (parent port driver(s))
    assign s_fin_rd_addr_o_Q = s_fin_rd_addr_o;
    // instance of 's_fin_rd_valid_o' CodAL signal/wire: (parent port driver(s))
    assign s_fin_rd_valid_o_Q = s_fin_rd_valid_o;
    // instance of 's_fin_rd_we_o' CodAL signal/wire: (parent port driver(s))
    assign s_fin_rd_we_o_Q = s_fin_rd_we_o;
    // instance of 's_fin_busy_o' CodAL signal/wire: (parent port driver(s))
    assign s_fin_busy_o_Q = s_fin_busy_o;
    // instance of 's_fin_exc_valid_o' CodAL signal/wire: (parent port driver(s))
    assign s_fin_exc_valid_o_Q = s_fin_exc_valid_o;
    // instance of 's_fin_exc_tval_o' CodAL signal/wire: (parent port driver(s))
    assign s_fin_exc_tval_o_Q = s_fin_exc_tval_o;
    // instance of 's_fin_exc_type_o' CodAL signal/wire: (parent port driver(s))
    assign s_fin_exc_type_o_Q = s_fin_exc_type_o;
    // instance of 's_fin_exc_extra_o' CodAL signal/wire: (parent port driver(s))
    assign s_fin_exc_extra_o_Q = s_fin_exc_extra_o;
    // instance of 's_is_load' CodAL signal/wire: (parent port driver(s))
    assign s_is_load_Q = s_is_load;
    // instance of 's_lsu_ce' CodAL signal/wire: (parent port driver(s))
    assign s_lsu_ce_Q = s_lsu_ce;
    // instance of 's_load_ce' CodAL signal/wire: (parent port driver(s))
    assign s_load_ce_Q = s_load_ce;
    // instance of 's_store_ce' CodAL signal/wire: (parent port driver(s))
    assign s_store_ce_Q = s_store_ce;
    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_mc_exc_valid (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pl_lsu_FIN_CLEAR_Q),
        .STALL(pl_lsu_FIN_STALL_Q),
        .WE(compute_req_r_mc_exc_valid_WE_wire),
        .D(compute_req_r_mc_exc_valid_D_wire),
        .Q(r_mc_exc_valid_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_mc_pma_fault (
        .CLK(execute_stage_lsu_s_lsu_ce_ICLK),
        .RST(RST),
        .CLEAR(pl_lsu_FIN_CLEAR_Q),
        .STALL(pl_lsu_FIN_STALL_Q),
        .WE(compute_req_r_mc_pma_fault_WE_wire),
        .D(compute_req_r_mc_pma_fault_D_wire),
        .Q(r_mc_pma_fault_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd8),
        .DEFAULT_VALUE(8'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_op (
        .CLK(execute_stage_lsu_s_lsu_ce_ICLK),
        .RST(RST),
        .CLEAR(pl_lsu_FIN_CLEAR_Q),
        .STALL(pl_lsu_FIN_STALL_Q),
        .WE(compute_req_fsm_r_op_WE_wire),
        .D(compute_req_fsm_r_op_D_wire),
        .Q(r_op_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_data_addr (
        .CLK(execute_stage_lsu_s_lsu_ce_ICLK),
        .RST(RST),
        .CLEAR(pl_lsu_FIN_CLEAR_Q),
        .STALL(pl_lsu_FIN_STALL_Q),
        .WE(compute_req_r_data_addr_WE_wire),
        .D(compute_req_r_data_addr_D_wire),
        .Q(r_data_addr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rd_addr (
        .CLK(execute_stage_lsu_s_load_ce_ICLK),
        .RST(RST),
        .CLEAR(pl_lsu_FIN_CLEAR_Q),
        .STALL(pl_lsu_FIN_STALL_Q),
        .WE(compute_req_r_rd_addr_WE_wire),
        .D(compute_req_r_rd_addr_D_wire),
        .Q(r_rd_addr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wdata (
        .CLK(execute_stage_lsu_s_store_ce_ICLK),
        .RST(RST),
        .CLEAR(pl_lsu_FIN_CLEAR_Q),
        .STALL(pl_lsu_FIN_STALL_Q),
        .WE(compute_req_r_wdata_WE_wire),
        .D(compute_req_r_wdata_D_wire),
        .Q(r_wdata_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_is_store (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pl_lsu_FIN_CLEAR_Q),
        .STALL(pl_lsu_FIN_STALL_Q),
        .WE(compute_req_r_is_store_WE_wire),
        .D(compute_req_r_is_store_D_wire),
        .Q(r_is_store_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_is_load (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pl_lsu_FIN_CLEAR_Q),
        .STALL(pl_lsu_FIN_STALL_Q),
        .WE(compute_req_r_is_load_WE_wire),
        .D(compute_req_r_is_load_D_wire),
        .Q(r_is_load_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_valid (
        .CLK(execute_stage_lsu_s_load_ce_ICLK),
        .RST(RST),
        .CLEAR(pl_lsu_FIN_CLEAR_Q),
        .STALL(pl_lsu_FIN_STALL_Q),
        .WE(compute_req_r_valid_WE_wire),
        .D(compute_req_r_valid_D_wire),
        .Q(r_valid_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd4),
        .DEFAULT_VALUE(4'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_state (
        .CLK(r_wfi_ce_ICLK),
        .RST(RST),
        .CLEAR(pl_lsu_FIN_CLEAR_Q),
        .STALL(pl_lsu_FIN_STALL_Q),
        .WE(compute_req_r_state_WE_wire),
        .D(compute_req_r_state_D_wire),
        .Q(r_state_Q_wire)
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

    // CodAL module instance:
    codix_berkelium_ca_core_execute_stage_lsu_pma_t #(
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
        .ldst_s_addr_i_D(compute_addr_check_pma_ldst_s_addr_i_D_wire),
        .ldst_s_size_i_D(compute_addr_check_pma_ldst_s_size_i_D_wire),
        .ldst_s_cacheable_o_Q(pma_ldst_s_cacheable_o_Q_wire),
        .ldst_s_fault_o_Q(pma_ldst_s_fault_o_Q_wire),
        .ldst_s_idempotent_o_Q(pma_ldst_s_idempotent_o_Q_wire),
        .ldst_s_misaligned_o_Q(pma_ldst_s_misaligned_o_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_execute_stage_lsu_pmp_t pmp (
        .r_wfi_ce_ICLK(r_wfi_ce_ICLK),
        .RST(RST),
        .ldst_s_addr_i_D(compute_addr_check_pmp_ldst_s_addr_i_D_wire),
        .ldst_s_prv_i_D(compute_addr_check_pmp_ldst_s_prv_i_D_wire),
        .ldst_s_valid_i_D(compute_addr_check_pmp_ldst_s_valid_i_D_wire),
        .ldst_s_write_i_D(compute_addr_check_pmp_ldst_s_write_i_D_wire),
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
        .s_csr_waddr_i_D(pmp_s_csr_waddr_i_D),
        .s_csr_wdata_i_D(pmp_s_csr_wdata_i_D),
        .s_csr_we_i_D(pmp_s_csr_we_i_D),
        .ldst_s_fault_o_Q(pmp_ldst_s_fault_o_Q_wire),
        .r_csr_pmpaddr0_D(r_csr_pmpaddr0_D),
        .r_csr_pmpaddr0_WE(r_csr_pmpaddr0_WE),
        .r_csr_pmpaddr10_D(r_csr_pmpaddr10_D),
        .r_csr_pmpaddr10_WE(r_csr_pmpaddr10_WE),
        .r_csr_pmpaddr11_D(r_csr_pmpaddr11_D),
        .r_csr_pmpaddr11_WE(r_csr_pmpaddr11_WE),
        .r_csr_pmpaddr12_D(r_csr_pmpaddr12_D),
        .r_csr_pmpaddr12_WE(r_csr_pmpaddr12_WE),
        .r_csr_pmpaddr13_D(r_csr_pmpaddr13_D),
        .r_csr_pmpaddr13_WE(r_csr_pmpaddr13_WE),
        .r_csr_pmpaddr14_D(r_csr_pmpaddr14_D),
        .r_csr_pmpaddr14_WE(r_csr_pmpaddr14_WE),
        .r_csr_pmpaddr15_D(r_csr_pmpaddr15_D),
        .r_csr_pmpaddr15_WE(r_csr_pmpaddr15_WE),
        .r_csr_pmpaddr1_D(r_csr_pmpaddr1_D),
        .r_csr_pmpaddr1_WE(r_csr_pmpaddr1_WE),
        .r_csr_pmpaddr2_D(r_csr_pmpaddr2_D),
        .r_csr_pmpaddr2_WE(r_csr_pmpaddr2_WE),
        .r_csr_pmpaddr3_D(r_csr_pmpaddr3_D),
        .r_csr_pmpaddr3_WE(r_csr_pmpaddr3_WE),
        .r_csr_pmpaddr4_D(r_csr_pmpaddr4_D),
        .r_csr_pmpaddr4_WE(r_csr_pmpaddr4_WE),
        .r_csr_pmpaddr5_D(r_csr_pmpaddr5_D),
        .r_csr_pmpaddr5_WE(r_csr_pmpaddr5_WE),
        .r_csr_pmpaddr6_D(r_csr_pmpaddr6_D),
        .r_csr_pmpaddr6_WE(r_csr_pmpaddr6_WE),
        .r_csr_pmpaddr7_D(r_csr_pmpaddr7_D),
        .r_csr_pmpaddr7_WE(r_csr_pmpaddr7_WE),
        .r_csr_pmpaddr8_D(r_csr_pmpaddr8_D),
        .r_csr_pmpaddr8_WE(r_csr_pmpaddr8_WE),
        .r_csr_pmpaddr9_D(r_csr_pmpaddr9_D),
        .r_csr_pmpaddr9_WE(r_csr_pmpaddr9_WE),
        .r_csr_pmpcfg0_D(r_csr_pmpcfg0_D),
        .r_csr_pmpcfg0_WE(r_csr_pmpcfg0_WE),
        .r_csr_pmpcfg1_D(r_csr_pmpcfg1_D),
        .r_csr_pmpcfg1_WE(r_csr_pmpcfg1_WE),
        .r_csr_pmpcfg2_D(r_csr_pmpcfg2_D),
        .r_csr_pmpcfg2_WE(r_csr_pmpcfg2_WE),
        .r_csr_pmpcfg3_D(r_csr_pmpcfg3_D),
        .r_csr_pmpcfg3_WE(r_csr_pmpcfg3_WE),
        .r_pmp0_napot_mask_Q(pmp_r_pmp0_napot_mask_Q),
        .r_pmp10_napot_mask_Q(pmp_r_pmp10_napot_mask_Q),
        .r_pmp11_napot_mask_Q(pmp_r_pmp11_napot_mask_Q),
        .r_pmp12_napot_mask_Q(pmp_r_pmp12_napot_mask_Q),
        .r_pmp13_napot_mask_Q(pmp_r_pmp13_napot_mask_Q),
        .r_pmp14_napot_mask_Q(pmp_r_pmp14_napot_mask_Q),
        .r_pmp15_napot_mask_Q(pmp_r_pmp15_napot_mask_Q),
        .r_pmp1_napot_mask_Q(pmp_r_pmp1_napot_mask_Q),
        .r_pmp2_napot_mask_Q(pmp_r_pmp2_napot_mask_Q),
        .r_pmp3_napot_mask_Q(pmp_r_pmp3_napot_mask_Q),
        .r_pmp4_napot_mask_Q(pmp_r_pmp4_napot_mask_Q),
        .r_pmp5_napot_mask_Q(pmp_r_pmp5_napot_mask_Q),
        .r_pmp6_napot_mask_Q(pmp_r_pmp6_napot_mask_Q),
        .r_pmp7_napot_mask_Q(pmp_r_pmp7_napot_mask_Q),
        .r_pmp8_napot_mask_Q(pmp_r_pmp8_napot_mask_Q),
        .r_pmp9_napot_mask_Q(pmp_r_pmp9_napot_mask_Q)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_lsu_compute_fin_t compute_fin (
        .i1_if_cpu_ldst_HRDATA(i1_if_cpu_ldst_HRDATA),
        .i1_if_cpu_ldst_HREADY(i1_if_cpu_ldst_HREADY),
        .i1_if_cpu_ldst_HRESP(i1_if_cpu_ldst_HRESP),
        .r_data_addr_Q(r_data_addr_Q_wire),
        .r_hresp_Q(r_hresp_Q_wire),
        .r_is_load_Q(r_is_load_Q_wire),
        .r_is_store_Q(r_is_store_Q_wire),
        .r_mc_exc_valid_Q(r_mc_exc_valid_Q_wire),
        .r_mc_pma_fault_Q(r_mc_pma_fault_Q_wire),
        .r_op_Q(r_op_Q_wire),
        .r_rd_addr_Q(r_rd_addr_Q_wire),
        .r_state_Q(r_state_Q_wire),
        .r_valid_Q(r_valid_Q_wire),
        .r_waited_transfer_Q(r_waited_transfer_Q_wire),
        .r_wdata_Q(r_wdata_Q_wire),
        .s_fence_issued_Q(s_fence_issued),
        .s_fin_busy_Q(s_fin_busy),
        .s_multicycle_Q(s_multicycle),
        .s_syscall_halt_Q(s_syscall_halt),
        .halt_ACT(halt_ACT),
        .i1_if_cpu_ldst_HWDATA(i1_if_cpu_ldst_HWDATA),
        .r_hresp_D(compute_fin_r_hresp_D_wire),
        .r_hresp_WE(compute_fin_r_hresp_WE_wire),
        .s_fence_issued_D(s_fence_issued),
        .s_fin_busy_D(s_fin_busy),
        .s_fin_busy_o_D(s_fin_busy_o),
        .s_fin_exc_extra_o_D(s_fin_exc_extra_o),
        .s_fin_exc_tval_o_D(s_fin_exc_tval_o),
        .s_fin_exc_type_o_D(s_fin_exc_type_o),
        .s_fin_exc_valid_o_D(s_fin_exc_valid_o),
        .s_fin_op_o_D(s_fin_op_o),
        .s_fin_rd_addr_o_D(s_fin_rd_addr_o),
        .s_fin_rd_data_o_D(s_fin_rd_data_o),
        .s_fin_rd_valid_o_D(s_fin_rd_valid_o),
        .s_fin_rd_we_o_D(s_fin_rd_we_o),
        .s_multicycle_D(s_multicycle),
        .s_request_hready_D(s_request_hready),
        .s_syscall_done_D(s_syscall_done),
        .s_syscall_halt_D(s_syscall_halt),
        .s_waited_transfer_o_D(s_waited_transfer_o)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_lsu_compute_req_t compute_req (
        .r_hresp_Q(r_hresp_Q_wire),
        .r_rd_addr_Q(r_rd_addr_Q_wire),
        .r_state_Q(r_state_Q_wire),
        .r_waited_transfer_Q(r_waited_transfer_Q_wire),
        .s_clear_i_Q(s_clear_i),
        .s_exc_pma_Q(s_exc_pma),
        .s_exc_valid_Q(s_exc_valid),
        .s_fin_busy_Q(s_fin_busy),
        .s_is_fence_i_Q(s_is_fence_i),
        .s_is_fence_Q(s_is_fence),
        .s_multicycle_Q(s_multicycle),
        .s_new_state_Q(s_new_state),
        .s_pma_cacheable_Q(s_pma_cacheable),
        .s_pma_idempotent_Q(s_pma_idempotent),
        .s_rd_addr_i_Q(s_rd_addr_i),
        .s_req_addr_Q(s_req_addr),
        .s_req_do_load_Q(s_req_do_load),
        .s_req_op_Q(s_req_op),
        .s_req_wdata_Q(s_req_wdata),
        .s_request_hready_Q(s_request_hready),
        .i1_if_cpu_ldst_HADDR(i1_if_cpu_ldst_HADDR),
        .i1_if_cpu_ldst_HBURST(i1_if_cpu_ldst_HBURST),
        .i1_if_cpu_ldst_HMASTLOCK(i1_if_cpu_ldst_HMASTLOCK),
        .i1_if_cpu_ldst_HPROT(i1_if_cpu_ldst_HPROT),
        .i1_if_cpu_ldst_HSIZE(i1_if_cpu_ldst_HSIZE),
        .i1_if_cpu_ldst_HTRANS(i1_if_cpu_ldst_HTRANS),
        .i1_if_cpu_ldst_HWRITE(i1_if_cpu_ldst_HWRITE),
        .pl_lsu_FIN_CLEAR_D(pl_lsu_FIN_CLEAR_D),
        .pl_lsu_FIN_STALL_D(pl_lsu_FIN_STALL_D),
        .r_data_addr_D(compute_req_r_data_addr_D_wire),
        .r_data_addr_WE(compute_req_r_data_addr_WE_wire),
        .r_is_load_D(compute_req_r_is_load_D_wire),
        .r_is_load_WE(compute_req_r_is_load_WE_wire),
        .r_is_store_D(compute_req_r_is_store_D_wire),
        .r_is_store_WE(compute_req_r_is_store_WE_wire),
        .r_mc_exc_valid_D(compute_req_r_mc_exc_valid_D_wire),
        .r_mc_exc_valid_WE(compute_req_r_mc_exc_valid_WE_wire),
        .r_mc_pma_fault_D(compute_req_r_mc_pma_fault_D_wire),
        .r_mc_pma_fault_WE(compute_req_r_mc_pma_fault_WE_wire),
        .r_rd_addr_D(compute_req_r_rd_addr_D_wire),
        .r_rd_addr_WE(compute_req_r_rd_addr_WE_wire),
        .r_state_D(compute_req_r_state_D_wire),
        .r_state_WE(compute_req_r_state_WE_wire),
        .r_valid_D(compute_req_r_valid_D_wire),
        .r_valid_WE(compute_req_r_valid_WE_wire),
        .r_waited_transfer_D(compute_req_r_waited_transfer_D_wire),
        .r_waited_transfer_WE(compute_req_r_waited_transfer_WE_wire),
        .r_wdata_D(compute_req_r_wdata_D_wire),
        .r_wdata_WE(compute_req_r_wdata_WE_wire)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_lsu_compute_req_fsm_t #(
        .cache_base_p(cache_base_p)
    ) compute_req_fsm (
        .r_data_addr_Q(r_data_addr_Q_wire),
        .r_op_Q(r_op_Q_wire),
        .r_state_Q(r_state_Q_wire),
        .r_wdata_Q(r_wdata_Q_wire),
        .s_addr_i_Q(s_addr_i),
        .s_exc_valid_Q(s_exc_valid),
        .s_is_fence_i_Q(s_is_fence_i),
        .s_is_fence_Q(s_is_fence),
        .s_is_load_Q(s_is_load),
        .s_is_store_Q(s_is_store),
        .s_op_i_Q(s_op_i),
        .s_syscall_addr_i_Q(s_syscall_addr_i),
        .s_syscall_done_Q(s_syscall_done),
        .s_syscall_halt_Q(s_syscall_halt),
        .s_wdata_i_Q(s_wdata_i),
        .r_op_D(compute_req_fsm_r_op_D_wire),
        .r_op_WE(compute_req_fsm_r_op_WE_wire),
        .s_new_state_D(s_new_state),
        .s_req_addr_D(s_req_addr),
        .s_req_do_load_D(s_req_do_load),
        .s_req_op_D(s_req_op),
        .s_req_wdata_D(s_req_wdata)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_lsu_compute_addr_check_t #(
        .cache_base_p(cache_base_p)
    ) compute_addr_check (
        .pma_ldst_s_cacheable_o_Q(pma_ldst_s_cacheable_o_Q_wire),
        .pma_ldst_s_fault_o_Q(pma_ldst_s_fault_o_Q_wire),
        .pma_ldst_s_idempotent_o_Q(pma_ldst_s_idempotent_o_Q_wire),
        .pma_ldst_s_misaligned_o_Q(pma_ldst_s_misaligned_o_Q_wire),
        .pmp_ldst_s_fault_o_Q(pmp_ldst_s_fault_o_Q_wire),
        .r_csr_mstatus_Q(r_csr_mstatus_Q),
        .r_data_addr_Q(r_data_addr_Q_wire),
        .r_is_load_Q(r_is_load_Q_wire),
        .r_is_store_Q(r_is_store_Q_wire),
        .r_prv_Q(r_prv_Q),
        .r_state_Q(r_state_Q_wire),
        .s_addr_i_Q(s_addr_i),
        .s_exc_type_Q(s_exc_type),
        .s_exc_valid_Q(s_exc_valid),
        .s_fence_issued_Q(s_fence_issued),
        .s_is_fence_i_Q(s_is_fence_i),
        .s_is_fence_Q(s_is_fence),
        .s_is_load_Q(s_is_load),
        .s_is_store_Q(s_is_store),
        .s_multicycle_Q(s_multicycle),
        .s_ocd_mmode_i_Q(s_ocd_mmode_i),
        .s_op_i_Q(s_op_i),
        .pma_ldst_s_addr_i_D(compute_addr_check_pma_ldst_s_addr_i_D_wire),
        .pma_ldst_s_size_i_D(compute_addr_check_pma_ldst_s_size_i_D_wire),
        .pmp_ldst_s_addr_i_D(compute_addr_check_pmp_ldst_s_addr_i_D_wire),
        .pmp_ldst_s_prv_i_D(compute_addr_check_pmp_ldst_s_prv_i_D_wire),
        .pmp_ldst_s_valid_i_D(compute_addr_check_pmp_ldst_s_valid_i_D_wire),
        .pmp_ldst_s_write_i_D(compute_addr_check_pmp_ldst_s_write_i_D_wire),
        .s_exc_pma_D(s_exc_pma),
        .s_exc_type_D(s_exc_type),
        .s_exc_valid_D(s_exc_valid),
        .s_is_fence_D(s_is_fence),
        .s_is_fence_i_D(s_is_fence_i),
        .s_is_load_D(s_is_load),
        .s_is_store_D(s_is_store),
        .s_load_ce_D(s_load_ce),
        .s_lsu_ce_D(s_lsu_ce),
        .s_pma_cacheable_D(s_pma_cacheable),
        .s_pma_idempotent_D(s_pma_idempotent),
        .s_req_exc_extra_o_D(s_req_exc_extra_o),
        .s_req_exc_tval_o_D(s_req_exc_tval_o),
        .s_req_exc_type_o_D(s_req_exc_type_o),
        .s_req_exc_valid_o_D(s_req_exc_valid_o),
        .s_store_ce_D(s_store_ce)
    );

endmodule: codix_berkelium_ca_core_execute_stage_lsu_t
