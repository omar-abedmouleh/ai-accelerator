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
 *  \brief   Contains module definition of the 'codix_berkelium_ca' ASIP.
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

module codix_berkelium_ca #(
    parameter [31:0] dcache_size_p = 32'h00004000,
    parameter [31:0] dcache_linesize_p = 32'h00000020,
    parameter [31:0] dcache_numway_p = 32'h00000002,
    parameter [31:0] icache_size_p = 32'h00004000,
    parameter [31:0] icache_linesize_p = 32'h00000020,
    parameter [31:0] icache_numway_p = 32'h00000002,
    parameter [31:0] itcm_baddr_p = 32'h02000000,
    parameter [31:0] itcm_size_p = 32'h00004000,
    parameter [31:0] dtcm_baddr_p = 32'h03000000,
    parameter [31:0] dtcm_size_p = 32'h00004000,
    parameter [31:0] progbuf_base_p = 32'h00020000,
    parameter [31:0] nmi_handler_p = 32'h20000004,
    parameter [31:0] cache_base_p = 32'h00010000,
    parameter [31:0] hart_id_p = 32'h00000000,
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
    input  logic CLK,
    input  logic TCK,
    input  logic RST,
    input  logic TRST,
    input  logic TMS,
    input  logic TDI,
    input  logic [(dcache_linesize_p * dcache_numway_p * 32'd8)-1:0] cache_l1_dcache_data_sram_RDATA,
    input  logic [(dcache_numway_p)-1:0] cache_l1_dcache_dirty_sram_RDATA,
    input  logic [(dcache_numway_p * (32'd32 - $clog2(dcache_size_p / dcache_numway_p) + 32'd1))-1:0] cache_l1_dcache_tags_sram_RDATA,
    input  logic [(icache_linesize_p * icache_numway_p * 32'd8)-1:0] cache_l1_icache_data_sram_RDATA,
    input  logic [(icache_numway_p * (32'd32 - $clog2(icache_size_p / icache_numway_p) + 32'd1))-1:0] cache_l1_icache_tags_sram_RDATA,
    input  logic [31:0] idtcm_dtcm_mem_sram_if_slave_RDATA,
    input  logic [31:0] idtcm_itcm_mem_sram_if_slave_RDATA,
    input  logic [31:0] if_fetch_HRDATA,
    input  logic if_fetch_HREADY,
    input  logic if_fetch_HRESP,
    input  logic [31:0] if_ldst_HRDATA,
    input  logic if_ldst_HREADY,
    input  logic if_ldst_HRESP,
    input  logic [31:0] if_slave_HADDR,
    input  logic [2:0] if_slave_HBURST,
    input  logic if_slave_HMASTLOCK,
    input  logic [3:0] if_slave_HPROT,
    input  logic if_slave_HREADY,
    input  logic if_slave_HSEL,
    input  logic [2:0] if_slave_HSIZE,
    input  logic [1:0] if_slave_HTRANS,
    input  logic [31:0] if_slave_HWDATA,
    input  logic if_slave_HWRITE,
    input  logic [31:0] p_boot_addr,
    input  logic p_cpu_stall,
    input  logic p_dtcm_en,
    input  logic [127:0] p_int,
    input  logic p_itcm_en,
    input  logic p_msip,
    input  logic p_mtip,
    input  logic p_nmi,
    input  logic [31:0] p_nmi_mtval,
    input  logic SCANMODE,
    output logic TDO,
    output logic [($clog2((dcache_size_p / dcache_linesize_p) / dcache_numway_p))-1:0] cache_l1_dcache_data_sram_A,
    output logic cache_l1_dcache_data_sram_CS,
    output logic cache_l1_dcache_data_sram_RW,
    output logic [(dcache_linesize_p * dcache_numway_p * 32'd8)-1:0] cache_l1_dcache_data_sram_WDATA,
    output logic [(dcache_linesize_p * dcache_numway_p)-1:0] cache_l1_dcache_data_sram_WSTRB,
    output logic [($clog2((dcache_size_p / dcache_linesize_p) / dcache_numway_p))-1:0] cache_l1_dcache_dirty_sram_A,
    output logic cache_l1_dcache_dirty_sram_CS,
    output logic cache_l1_dcache_dirty_sram_RW,
    output logic [(dcache_numway_p)-1:0] cache_l1_dcache_dirty_sram_WDATA,
    output logic [(dcache_numway_p)-1:0] cache_l1_dcache_dirty_sram_WSTRB,
    output logic [($clog2((dcache_size_p / dcache_linesize_p) / dcache_numway_p))-1:0] cache_l1_dcache_tags_sram_A,
    output logic cache_l1_dcache_tags_sram_CS,
    output logic cache_l1_dcache_tags_sram_RW,
    output logic [(dcache_numway_p * (32'd32 - $clog2(dcache_size_p / dcache_numway_p) + 32'd1))-1:0] cache_l1_dcache_tags_sram_WDATA,
    output logic [(dcache_numway_p)-1:0] cache_l1_dcache_tags_sram_WSTRB,
    output logic [($clog2((icache_size_p / icache_linesize_p) / icache_numway_p))-1:0] cache_l1_icache_data_sram_A,
    output logic cache_l1_icache_data_sram_CS,
    output logic cache_l1_icache_data_sram_RW,
    output logic [(icache_linesize_p * icache_numway_p * 32'd8)-1:0] cache_l1_icache_data_sram_WDATA,
    output logic [(icache_linesize_p * icache_numway_p)-1:0] cache_l1_icache_data_sram_WSTRB,
    output logic [($clog2((icache_size_p / icache_linesize_p) / icache_numway_p))-1:0] cache_l1_icache_tags_sram_A,
    output logic cache_l1_icache_tags_sram_CS,
    output logic cache_l1_icache_tags_sram_RW,
    output logic [(icache_numway_p * (32'd32 - $clog2(icache_size_p / icache_numway_p) + 32'd1))-1:0] cache_l1_icache_tags_sram_WDATA,
    output logic [(icache_numway_p)-1:0] cache_l1_icache_tags_sram_WSTRB,
    output logic dmactive,
    output logic [($clog2(dtcm_size_p / 32'd4))-1:0] idtcm_dtcm_mem_sram_if_slave_A,
    output logic idtcm_dtcm_mem_sram_if_slave_CS,
    output logic idtcm_dtcm_mem_sram_if_slave_RW,
    output logic [31:0] idtcm_dtcm_mem_sram_if_slave_WDATA,
    output logic [3:0] idtcm_dtcm_mem_sram_if_slave_WSTRB,
    output logic [($clog2(itcm_size_p / 32'd4))-1:0] idtcm_itcm_mem_sram_if_slave_A,
    output logic idtcm_itcm_mem_sram_if_slave_CS,
    output logic idtcm_itcm_mem_sram_if_slave_RW,
    output logic [31:0] idtcm_itcm_mem_sram_if_slave_WDATA,
    output logic [3:0] idtcm_itcm_mem_sram_if_slave_WSTRB,
    output logic [31:0] if_fetch_HADDR,
    output logic [2:0] if_fetch_HBURST,
    output logic if_fetch_HMASTLOCK,
    output logic [3:0] if_fetch_HPROT,
    output logic [2:0] if_fetch_HSIZE,
    output logic [1:0] if_fetch_HTRANS,
    output logic if_fetch_HWRITE,
    output logic [31:0] if_ldst_HADDR,
    output logic [2:0] if_ldst_HBURST,
    output logic if_ldst_HMASTLOCK,
    output logic [3:0] if_ldst_HPROT,
    output logic [2:0] if_ldst_HSIZE,
    output logic [1:0] if_ldst_HTRANS,
    output logic [31:0] if_ldst_HWDATA,
    output logic if_ldst_HWRITE,
    output logic [31:0] if_slave_HRDATA,
    output logic if_slave_HREADYOUT,
    output logic if_slave_HRESP,
    output logic ndmreset,
    output logic p_wfi
);
    // type, wire and constant declarations:
    // verilator lint_off UNUSED
    // signal/wire
    logic codasip_halt_wire;
    // verilator lint_on UNUSED

    // additional declarations:
    logic cache_l1_BUSY_wire;
    logic cache_l1_EVICTION_ERROR_wire;
    logic core_execute_stage_div_s_div_ce_i_Q_wire;
    logic core_execute_stage_fpu_add_sub_s_add_sub_ce_Q_wire;
    logic core_execute_stage_fpu_float2int_s_f2i_ce_Q_wire;
    logic core_execute_stage_fpu_fmul_s_fmul_ce_Q_wire;
    logic core_execute_stage_fpu_fused_s_fused_ce_Q_wire;
    logic core_execute_stage_fpu_int2float_s_i2f_ce_Q_wire;
    logic core_execute_stage_fpu_sqrt_div_s_sqrt_div_ce_Q_wire;
    logic core_execute_stage_lsu_s_load_ce_Q_wire;
    logic core_execute_stage_lsu_s_lsu_ce_Q_wire;
    logic core_execute_stage_lsu_s_store_ce_Q_wire;
    logic core_fetch_stage_bp_bht_s_is_branch_i_Q_wire;
    logic core_fetch_stage_bp_btb_s_is_branch_i_Q_wire;
    logic core_fetch_stage_bp_btb_s_is_jump_i_Q_wire;
    logic core_r_wfi_ce_Q_wire;
    logic core_s_dm_active_Q_wire;
    logic core_s_fpu_ce_Q_wire;
    logic pmu_cache_l1_ICLK_wire;
    logic pmu_execute_stage_div_s_div_ce_i_ICLK_wire;
    logic pmu_execute_stage_fpu_add_sub_s_add_sub_ce_ICLK_wire;
    logic pmu_execute_stage_fpu_float2int_s_f2i_ce_ICLK_wire;
    logic pmu_execute_stage_fpu_fmul_s_fmul_ce_ICLK_wire;
    logic pmu_execute_stage_fpu_fused_s_fused_ce_ICLK_wire;
    logic pmu_execute_stage_fpu_int2float_s_i2f_ce_ICLK_wire;
    logic pmu_execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK_wire;
    logic pmu_execute_stage_lsu_s_load_ce_ICLK_wire;
    logic pmu_execute_stage_lsu_s_lsu_ce_ICLK_wire;
    logic pmu_execute_stage_lsu_s_store_ce_ICLK_wire;
    logic pmu_fetch_stage_bp_bht_s_is_branch_i_ICLK_wire;
    logic pmu_fetch_stage_bp_btb_s_is_branch_i_ICLK_wire;
    logic pmu_fetch_stage_bp_btb_s_is_jump_i_ICLK_wire;
    logic pmu_ICLK_wire;
    logic pmu_r_wfi_ce_ICLK_wire;
    logic pmu_s_dm_active_ICLK_wire;
    logic pmu_s_fpu_ce_ICLK_wire;
    logic riscv_dm_RST_REQUEST_wire;
    logic codasip_IRST_gen_IRST_wire;
    logic [31:0] cache_l1_if_ldst_master_HADDR_wire;
    logic [2:0] cache_l1_if_ldst_master_HBURST_wire;
    logic cache_l1_if_ldst_master_HMASTLOCK_wire;
    logic [3:0] cache_l1_if_ldst_master_HPROT_wire;
    logic [2:0] cache_l1_if_ldst_master_HSIZE_wire;
    logic [1:0] cache_l1_if_ldst_master_HTRANS_wire;
    logic cache_l1_if_ldst_master_HWRITE_wire;
    logic [31:0] cache_l1_if_ldst_master_HWDATA_wire;
    logic if_ldst_HREADY_wire;
    logic if_ldst_HRESP_wire;
    logic [31:0] if_ldst_HRDATA_wire;
    logic [31:0] cache_l1_if_fetch_master_HADDR_wire;
    logic [2:0] cache_l1_if_fetch_master_HBURST_wire;
    logic cache_l1_if_fetch_master_HMASTLOCK_wire;
    logic [3:0] cache_l1_if_fetch_master_HPROT_wire;
    logic [2:0] cache_l1_if_fetch_master_HSIZE_wire;
    logic [1:0] cache_l1_if_fetch_master_HTRANS_wire;
    logic cache_l1_if_fetch_master_HWRITE_wire;
    logic if_fetch_HREADY_wire;
    logic if_fetch_HRESP_wire;
    logic [31:0] if_fetch_HRDATA_wire;
    logic [31:0] i1_if_fetch_HADDR_wire;
    logic [2:0] i1_if_fetch_HBURST_wire;
    logic i1_if_fetch_HMASTLOCK_wire;
    logic [3:0] i1_if_fetch_HPROT_wire;
    logic cache_l1_if_fetch_slave_HREADYOUT_wire;
    logic [2:0] i1_if_fetch_HSIZE_wire;
    logic [1:0] i1_if_fetch_HTRANS_wire;
    logic i1_if_fetch_HWRITE_wire;
    logic [31:0] i1_if_ldst_HADDR_wire;
    logic [2:0] i1_if_ldst_HBURST_wire;
    logic i1_if_ldst_HMASTLOCK_wire;
    logic [3:0] i1_if_ldst_HPROT_wire;
    logic cache_l1_if_ldst_slave_HREADYOUT_wire;
    logic [2:0] i1_if_ldst_HSIZE_wire;
    logic [1:0] i1_if_ldst_HTRANS_wire;
    logic [31:0] i1_if_ldst_HWDATA_wire;
    logic i1_if_ldst_HWRITE_wire;
    logic [31:0] cache_l1_if_fetch_slave_HRDATA_wire;
    logic cache_l1_if_fetch_slave_HRESP_wire;
    logic [31:0] cache_l1_if_ldst_slave_HRDATA_wire;
    logic cache_l1_if_ldst_slave_HRESP_wire;
    logic [31:0] codasip_i1_if_cpu_fetch_codasip_i1_if_cpu_fetch_HADDR_wire;
    logic [2:0] codasip_i1_if_cpu_fetch_codasip_i1_if_cpu_fetch_HBURST_wire;
    logic codasip_i1_if_cpu_fetch_codasip_i1_if_cpu_fetch_HMASTLOCK_wire;
    logic [3:0] codasip_i1_if_cpu_fetch_codasip_i1_if_cpu_fetch_HPROT_wire;
    logic [2:0] codasip_i1_if_cpu_fetch_codasip_i1_if_cpu_fetch_HSIZE_wire;
    logic [1:0] codasip_i1_if_cpu_fetch_codasip_i1_if_cpu_fetch_HTRANS_wire;
    logic codasip_i1_if_cpu_fetch_codasip_i1_if_cpu_fetch_HWRITE_wire;
    logic [31:0] core_i1_if_cpu_ldst_HADDR_wire;
    logic [2:0] core_i1_if_cpu_ldst_HBURST_wire;
    logic core_i1_if_cpu_ldst_HMASTLOCK_wire;
    logic [3:0] core_i1_if_cpu_ldst_HPROT_wire;
    logic [2:0] core_i1_if_cpu_ldst_HSIZE_wire;
    logic [1:0] core_i1_if_cpu_ldst_HTRANS_wire;
    logic [31:0] core_i1_if_cpu_ldst_HWDATA_wire;
    logic core_i1_if_cpu_ldst_HWRITE_wire;
    logic [31:0] idtcm_if_dtcm_ldst_HRDATA_wire;
    logic idtcm_if_dtcm_ldst_HREADY_wire;
    logic idtcm_if_dtcm_ldst_HRESP_wire;
    logic [31:0] idtcm_if_itcm_fetch_HRDATA_wire;
    logic idtcm_if_itcm_fetch_HREADY_wire;
    logic idtcm_if_itcm_fetch_HRESP_wire;
    logic [31:0] idtcm_if_itcm_ldst_HRDATA_wire;
    logic idtcm_if_itcm_ldst_HREADY_wire;
    logic idtcm_if_itcm_ldst_HRESP_wire;
    logic core_i1_p_dtcm_en_wire;
    logic core_i1_p_itcm_en_wire;
    logic [31:0] i1_if_cpu_fetch_HRDATA_wire;
    logic i1_if_cpu_fetch_HREADY_wire;
    logic i1_if_cpu_fetch_HRESP_wire;
    logic [31:0] i1_if_cpu_ldst_HRDATA_wire;
    logic i1_if_cpu_ldst_HREADY_wire;
    logic i1_if_cpu_ldst_HRESP_wire;
    logic [31:0] i1_if_dtcm_ldst_HADDR_wire;
    logic [2:0] i1_if_dtcm_ldst_HBURST_wire;
    logic i1_if_dtcm_ldst_HMASTLOCK_wire;
    logic [3:0] i1_if_dtcm_ldst_HPROT_wire;
    logic [2:0] i1_if_dtcm_ldst_HSIZE_wire;
    logic [1:0] i1_if_dtcm_ldst_HTRANS_wire;
    logic [31:0] i1_if_dtcm_ldst_HWDATA_wire;
    logic i1_if_dtcm_ldst_HWRITE_wire;
    logic [31:0] i1_if_itcm_fetch_HADDR_wire;
    logic [2:0] i1_if_itcm_fetch_HBURST_wire;
    logic i1_if_itcm_fetch_HMASTLOCK_wire;
    logic [3:0] i1_if_itcm_fetch_HPROT_wire;
    logic [2:0] i1_if_itcm_fetch_HSIZE_wire;
    logic [1:0] i1_if_itcm_fetch_HTRANS_wire;
    logic i1_if_itcm_fetch_HWRITE_wire;
    logic [31:0] i1_if_itcm_ldst_HADDR_wire;
    logic [2:0] i1_if_itcm_ldst_HBURST_wire;
    logic i1_if_itcm_ldst_HMASTLOCK_wire;
    logic [3:0] i1_if_itcm_ldst_HPROT_wire;
    logic [2:0] i1_if_itcm_ldst_HSIZE_wire;
    logic [1:0] i1_if_itcm_ldst_HTRANS_wire;
    logic [31:0] i1_if_itcm_ldst_HWDATA_wire;
    logic i1_if_itcm_ldst_HWRITE_wire;
    logic [31:0] core_i1_if_cpu_fetch_HADDR_wire;
    logic [2:0] core_i1_if_cpu_fetch_HBURST_wire;
    logic core_i1_if_cpu_fetch_HMASTLOCK_wire;
    logic [3:0] core_i1_if_cpu_fetch_HPROT_wire;
    logic [2:0] core_i1_if_cpu_fetch_HSIZE_wire;
    logic [1:0] core_i1_if_cpu_fetch_HTRANS_wire;
    logic core_i1_if_cpu_fetch_HWRITE_wire;
    logic [31:0] riscv_dm_codasip_i1_if_cpu_fetch_progbuf_Q_wire;
    logic [31:0] codasip_i1_if_cpu_fetch_HRDATA_wire;
    logic codasip_i1_if_cpu_fetch_HREADY_wire;
    logic codasip_i1_if_cpu_fetch_HRESP_wire;
    logic [1:0] codasip_i1_if_cpu_fetch_progbuf_RA_wire;
    logic codasip_i1_if_cpu_fetch_progbuf_RE_wire;
    logic [31:0] riscv_dm_core_r_csr_dpc_BSC_D_wire;
    logic riscv_dm_core_r_csr_dpc_BSC_UPDATE_wire;
    logic riscv_dm_core_r_csr_dpc_DEBUG_MODE_wire;
    logic [4:0] riscv_dm_core_rf_gpr_BSC_A_wire;
    logic [31:0] riscv_dm_core_rf_gpr_BSC_D_wire;
    logic riscv_dm_core_rf_gpr_BSC_UPDATE_wire;
    logic riscv_dm_core_rf_gpr_DEBUG_MODE_wire;
    logic riscv_dm_core_s_dm_active_D_wire;
    logic riscv_dm_core_s_dm_halt_D_wire;
    logic riscv_dm_core_s_dm_progbuf_en_D_wire;
    logic [31:0] core_r_csr_dpc_BSC_Q_wire;
    logic [31:0] core_rf_gpr_BSC_Q_wire;
    logic core_s_dm_progbuf_done_Q_wire;
    logic core_s_dm_progbuf_exc_Q_wire;
    logic core_s_hart_halted_Q_wire;

    // child instances inside ASIP:
    // Power management unit instance:
    codix_berkelium_ca_pmu_t pmu (
        .CLK(CLK),
        .RST(RST),
        .cache_l1_BUSY(cache_l1_BUSY_wire),
        .core_execute_stage_div_s_div_ce_i_Q(core_execute_stage_div_s_div_ce_i_Q_wire),
        .core_execute_stage_fpu_add_sub_s_add_sub_ce_Q(core_execute_stage_fpu_add_sub_s_add_sub_ce_Q_wire),
        .core_execute_stage_fpu_float2int_s_f2i_ce_Q(core_execute_stage_fpu_float2int_s_f2i_ce_Q_wire),
        .core_execute_stage_fpu_fmul_s_fmul_ce_Q(core_execute_stage_fpu_fmul_s_fmul_ce_Q_wire),
        .core_execute_stage_fpu_fused_s_fused_ce_Q(core_execute_stage_fpu_fused_s_fused_ce_Q_wire),
        .core_execute_stage_fpu_int2float_s_i2f_ce_Q(core_execute_stage_fpu_int2float_s_i2f_ce_Q_wire),
        .core_execute_stage_fpu_sqrt_div_s_sqrt_div_ce_Q(core_execute_stage_fpu_sqrt_div_s_sqrt_div_ce_Q_wire),
        .core_execute_stage_lsu_s_load_ce_Q(core_execute_stage_lsu_s_load_ce_Q_wire),
        .core_execute_stage_lsu_s_lsu_ce_Q(core_execute_stage_lsu_s_lsu_ce_Q_wire),
        .core_execute_stage_lsu_s_store_ce_Q(core_execute_stage_lsu_s_store_ce_Q_wire),
        .core_fetch_stage_bp_bht_s_is_branch_i_Q(core_fetch_stage_bp_bht_s_is_branch_i_Q_wire),
        .core_fetch_stage_bp_btb_s_is_branch_i_Q(core_fetch_stage_bp_btb_s_is_branch_i_Q_wire),
        .core_fetch_stage_bp_btb_s_is_jump_i_Q(core_fetch_stage_bp_btb_s_is_jump_i_Q_wire),
        .core_r_wfi_ce_Q(core_r_wfi_ce_Q_wire),
        .core_s_dm_active_Q(core_s_dm_active_Q_wire),
        .core_s_fpu_ce_Q(core_s_fpu_ce_Q_wire),
        .SCANMODE(SCANMODE),
        .cache_l1_ICLK(pmu_cache_l1_ICLK_wire),
        .execute_stage_div_s_div_ce_i_ICLK(pmu_execute_stage_div_s_div_ce_i_ICLK_wire),
        .execute_stage_fpu_add_sub_s_add_sub_ce_ICLK(pmu_execute_stage_fpu_add_sub_s_add_sub_ce_ICLK_wire),
        .execute_stage_fpu_float2int_s_f2i_ce_ICLK(pmu_execute_stage_fpu_float2int_s_f2i_ce_ICLK_wire),
        .execute_stage_fpu_fmul_s_fmul_ce_ICLK(pmu_execute_stage_fpu_fmul_s_fmul_ce_ICLK_wire),
        .execute_stage_fpu_fused_s_fused_ce_ICLK(pmu_execute_stage_fpu_fused_s_fused_ce_ICLK_wire),
        .execute_stage_fpu_int2float_s_i2f_ce_ICLK(pmu_execute_stage_fpu_int2float_s_i2f_ce_ICLK_wire),
        .execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK(pmu_execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK_wire),
        .execute_stage_lsu_s_load_ce_ICLK(pmu_execute_stage_lsu_s_load_ce_ICLK_wire),
        .execute_stage_lsu_s_lsu_ce_ICLK(pmu_execute_stage_lsu_s_lsu_ce_ICLK_wire),
        .execute_stage_lsu_s_store_ce_ICLK(pmu_execute_stage_lsu_s_store_ce_ICLK_wire),
        .fetch_stage_bp_bht_s_is_branch_i_ICLK(pmu_fetch_stage_bp_bht_s_is_branch_i_ICLK_wire),
        .fetch_stage_bp_btb_s_is_branch_i_ICLK(pmu_fetch_stage_bp_btb_s_is_branch_i_ICLK_wire),
        .fetch_stage_bp_btb_s_is_jump_i_ICLK(pmu_fetch_stage_bp_btb_s_is_jump_i_ICLK_wire),
        .ICLK(pmu_ICLK_wire),
        .r_wfi_ce_ICLK(pmu_r_wfi_ce_ICLK_wire),
        .s_dm_active_ICLK(pmu_s_dm_active_ICLK_wire),
        .s_fpu_ce_ICLK(pmu_s_fpu_ce_ICLK_wire)
    );

    // Reset encapsulation unit instance:
    codasip_reset_gen_t #(
        .RESET_LEVEL(1'b0)
    ) codasip_IRST_gen (
        .RST(RST),
        .RST_REQUEST(riscv_dm_RST_REQUEST_wire),
        .SCANMODE(SCANMODE),
        .IRST(codasip_IRST_gen_IRST_wire)
    );

    // CodAL interface instance:
    codix_berkelium_ca_if_ldst_t if_ldst (
        .if_ldst_HREADY(if_ldst_HREADY),
        .if_ldst_HRESP(if_ldst_HRESP),
        .if_ldst_HRDATA(if_ldst_HRDATA),
        .HADDR(cache_l1_if_ldst_master_HADDR_wire),
        .HBURST(cache_l1_if_ldst_master_HBURST_wire),
        .HMASTLOCK(cache_l1_if_ldst_master_HMASTLOCK_wire),
        .HPROT(cache_l1_if_ldst_master_HPROT_wire),
        .HSIZE(cache_l1_if_ldst_master_HSIZE_wire),
        .HTRANS(cache_l1_if_ldst_master_HTRANS_wire),
        .HWRITE(cache_l1_if_ldst_master_HWRITE_wire),
        .HWDATA(cache_l1_if_ldst_master_HWDATA_wire),
        .if_ldst_HADDR(if_ldst_HADDR),
        .if_ldst_HBURST(if_ldst_HBURST),
        .if_ldst_HMASTLOCK(if_ldst_HMASTLOCK),
        .if_ldst_HPROT(if_ldst_HPROT),
        .if_ldst_HSIZE(if_ldst_HSIZE),
        .if_ldst_HTRANS(if_ldst_HTRANS),
        .if_ldst_HWRITE(if_ldst_HWRITE),
        .if_ldst_HWDATA(if_ldst_HWDATA),
        .HREADY(if_ldst_HREADY_wire),
        .HRESP(if_ldst_HRESP_wire),
        .HRDATA(if_ldst_HRDATA_wire)
    );

    // CodAL interface instance:
    codix_berkelium_ca_if_fetch_t if_fetch (
        .if_fetch_HREADY(if_fetch_HREADY),
        .if_fetch_HRESP(if_fetch_HRESP),
        .if_fetch_HRDATA(if_fetch_HRDATA),
        .HADDR(cache_l1_if_fetch_master_HADDR_wire),
        .HBURST(cache_l1_if_fetch_master_HBURST_wire),
        .HMASTLOCK(cache_l1_if_fetch_master_HMASTLOCK_wire),
        .HPROT(cache_l1_if_fetch_master_HPROT_wire),
        .HSIZE(cache_l1_if_fetch_master_HSIZE_wire),
        .HTRANS(cache_l1_if_fetch_master_HTRANS_wire),
        .HWRITE(cache_l1_if_fetch_master_HWRITE_wire),
        .if_fetch_HADDR(if_fetch_HADDR),
        .if_fetch_HBURST(if_fetch_HBURST),
        .if_fetch_HMASTLOCK(if_fetch_HMASTLOCK),
        .if_fetch_HPROT(if_fetch_HPROT),
        .if_fetch_HSIZE(if_fetch_HSIZE),
        .if_fetch_HTRANS(if_fetch_HTRANS),
        .if_fetch_HWRITE(if_fetch_HWRITE),
        .HREADY(if_fetch_HREADY_wire),
        .HRESP(if_fetch_HRESP_wire),
        .HRDATA(if_fetch_HRDATA_wire)
    );

    // Codasip cache instance:
    codix_berkelium_ca_cache_l1_t #(
        .dcache_size_p(dcache_size_p),
        .dcache_linesize_p(dcache_linesize_p),
        .dcache_numway_p(dcache_numway_p),
        .icache_size_p(icache_size_p),
        .icache_linesize_p(icache_linesize_p),
        .icache_numway_p(icache_numway_p)
    ) cache_l1 (
        .CLK(pmu_cache_l1_ICLK_wire),
        .RST(codasip_IRST_gen_IRST_wire),
        .cache_l1_dcache_data_sram_RDATA(cache_l1_dcache_data_sram_RDATA),
        .cache_l1_dcache_dirty_sram_RDATA(cache_l1_dcache_dirty_sram_RDATA),
        .cache_l1_dcache_tags_sram_RDATA(cache_l1_dcache_tags_sram_RDATA),
        .cache_l1_icache_data_sram_RDATA(cache_l1_icache_data_sram_RDATA),
        .cache_l1_icache_tags_sram_RDATA(cache_l1_icache_tags_sram_RDATA),
        .if_fetch_master_HRDATA(if_fetch_HRDATA_wire),
        .if_fetch_master_HREADY(if_fetch_HREADY_wire),
        .if_fetch_master_HRESP(if_fetch_HRESP_wire),
        .if_fetch_slave_HADDR(i1_if_fetch_HADDR_wire),
        .if_fetch_slave_HBURST(i1_if_fetch_HBURST_wire),
        .if_fetch_slave_HMASTLOCK(i1_if_fetch_HMASTLOCK_wire),
        .if_fetch_slave_HPROT(i1_if_fetch_HPROT_wire),
        .if_fetch_slave_HREADY(cache_l1_if_fetch_slave_HREADYOUT_wire),
        .if_fetch_slave_HSEL(1'b1),
        .if_fetch_slave_HSIZE(i1_if_fetch_HSIZE_wire),
        .if_fetch_slave_HTRANS(i1_if_fetch_HTRANS_wire),
        .if_fetch_slave_HWRITE(i1_if_fetch_HWRITE_wire),
        .if_ldst_master_HRDATA(if_ldst_HRDATA_wire),
        .if_ldst_master_HREADY(if_ldst_HREADY_wire),
        .if_ldst_master_HRESP(if_ldst_HRESP_wire),
        .if_ldst_slave_HADDR(i1_if_ldst_HADDR_wire),
        .if_ldst_slave_HBURST(i1_if_ldst_HBURST_wire),
        .if_ldst_slave_HMASTLOCK(i1_if_ldst_HMASTLOCK_wire),
        .if_ldst_slave_HPROT(i1_if_ldst_HPROT_wire),
        .if_ldst_slave_HREADY(cache_l1_if_ldst_slave_HREADYOUT_wire),
        .if_ldst_slave_HSEL(1'b1),
        .if_ldst_slave_HSIZE(i1_if_ldst_HSIZE_wire),
        .if_ldst_slave_HTRANS(i1_if_ldst_HTRANS_wire),
        .if_ldst_slave_HWDATA(i1_if_ldst_HWDATA_wire),
        .if_ldst_slave_HWRITE(i1_if_ldst_HWRITE_wire),
        .BUSY(cache_l1_BUSY_wire),
        .EVICTION_ERROR(cache_l1_EVICTION_ERROR_wire),
        .cache_l1_dcache_data_sram_A(cache_l1_dcache_data_sram_A),
        .cache_l1_dcache_data_sram_CS(cache_l1_dcache_data_sram_CS),
        .cache_l1_dcache_data_sram_RW(cache_l1_dcache_data_sram_RW),
        .cache_l1_dcache_data_sram_WDATA(cache_l1_dcache_data_sram_WDATA),
        .cache_l1_dcache_data_sram_WSTRB(cache_l1_dcache_data_sram_WSTRB),
        .cache_l1_dcache_dirty_sram_A(cache_l1_dcache_dirty_sram_A),
        .cache_l1_dcache_dirty_sram_CS(cache_l1_dcache_dirty_sram_CS),
        .cache_l1_dcache_dirty_sram_RW(cache_l1_dcache_dirty_sram_RW),
        .cache_l1_dcache_dirty_sram_WDATA(cache_l1_dcache_dirty_sram_WDATA),
        .cache_l1_dcache_dirty_sram_WSTRB(cache_l1_dcache_dirty_sram_WSTRB),
        .cache_l1_dcache_tags_sram_A(cache_l1_dcache_tags_sram_A),
        .cache_l1_dcache_tags_sram_CS(cache_l1_dcache_tags_sram_CS),
        .cache_l1_dcache_tags_sram_RW(cache_l1_dcache_tags_sram_RW),
        .cache_l1_dcache_tags_sram_WDATA(cache_l1_dcache_tags_sram_WDATA),
        .cache_l1_dcache_tags_sram_WSTRB(cache_l1_dcache_tags_sram_WSTRB),
        .cache_l1_icache_data_sram_A(cache_l1_icache_data_sram_A),
        .cache_l1_icache_data_sram_CS(cache_l1_icache_data_sram_CS),
        .cache_l1_icache_data_sram_RW(cache_l1_icache_data_sram_RW),
        .cache_l1_icache_data_sram_WDATA(cache_l1_icache_data_sram_WDATA),
        .cache_l1_icache_data_sram_WSTRB(cache_l1_icache_data_sram_WSTRB),
        .cache_l1_icache_tags_sram_A(cache_l1_icache_tags_sram_A),
        .cache_l1_icache_tags_sram_CS(cache_l1_icache_tags_sram_CS),
        .cache_l1_icache_tags_sram_RW(cache_l1_icache_tags_sram_RW),
        .cache_l1_icache_tags_sram_WDATA(cache_l1_icache_tags_sram_WDATA),
        .cache_l1_icache_tags_sram_WSTRB(cache_l1_icache_tags_sram_WSTRB),
        .if_fetch_master_HADDR(cache_l1_if_fetch_master_HADDR_wire),
        .if_fetch_master_HBURST(cache_l1_if_fetch_master_HBURST_wire),
        .if_fetch_master_HMASTLOCK(cache_l1_if_fetch_master_HMASTLOCK_wire),
        .if_fetch_master_HPROT(cache_l1_if_fetch_master_HPROT_wire),
        .if_fetch_master_HSIZE(cache_l1_if_fetch_master_HSIZE_wire),
        .if_fetch_master_HTRANS(cache_l1_if_fetch_master_HTRANS_wire),
        .if_fetch_master_HWRITE(cache_l1_if_fetch_master_HWRITE_wire),
        .if_fetch_slave_HRDATA(cache_l1_if_fetch_slave_HRDATA_wire),
        .if_fetch_slave_HREADYOUT(cache_l1_if_fetch_slave_HREADYOUT_wire),
        .if_fetch_slave_HRESP(cache_l1_if_fetch_slave_HRESP_wire),
        .if_ldst_master_HADDR(cache_l1_if_ldst_master_HADDR_wire),
        .if_ldst_master_HBURST(cache_l1_if_ldst_master_HBURST_wire),
        .if_ldst_master_HMASTLOCK(cache_l1_if_ldst_master_HMASTLOCK_wire),
        .if_ldst_master_HPROT(cache_l1_if_ldst_master_HPROT_wire),
        .if_ldst_master_HSIZE(cache_l1_if_ldst_master_HSIZE_wire),
        .if_ldst_master_HTRANS(cache_l1_if_ldst_master_HTRANS_wire),
        .if_ldst_master_HWDATA(cache_l1_if_ldst_master_HWDATA_wire),
        .if_ldst_master_HWRITE(cache_l1_if_ldst_master_HWRITE_wire),
        .if_ldst_slave_HRDATA(cache_l1_if_ldst_slave_HRDATA_wire),
        .if_ldst_slave_HREADYOUT(cache_l1_if_ldst_slave_HREADYOUT_wire),
        .if_ldst_slave_HRESP(cache_l1_if_ldst_slave_HRESP_wire)
    );

    // Codasip interconnect instance:
    codix_berkelium_ca_i1_t #(
        .itcm_baddr_p(itcm_baddr_p),
        .itcm_size_p(itcm_size_p),
        .dtcm_baddr_p(dtcm_baddr_p),
        .dtcm_size_p(dtcm_size_p)
    ) i1 (
        .CLK(CLK),
        .RST(RST),
        .if_cpu_fetch_HADDR(codasip_i1_if_cpu_fetch_codasip_i1_if_cpu_fetch_HADDR_wire),
        .if_cpu_fetch_HBURST(codasip_i1_if_cpu_fetch_codasip_i1_if_cpu_fetch_HBURST_wire),
        .if_cpu_fetch_HMASTLOCK(codasip_i1_if_cpu_fetch_codasip_i1_if_cpu_fetch_HMASTLOCK_wire),
        .if_cpu_fetch_HPROT(codasip_i1_if_cpu_fetch_codasip_i1_if_cpu_fetch_HPROT_wire),
        .if_cpu_fetch_HSIZE(codasip_i1_if_cpu_fetch_codasip_i1_if_cpu_fetch_HSIZE_wire),
        .if_cpu_fetch_HTRANS(codasip_i1_if_cpu_fetch_codasip_i1_if_cpu_fetch_HTRANS_wire),
        .if_cpu_fetch_HWRITE(codasip_i1_if_cpu_fetch_codasip_i1_if_cpu_fetch_HWRITE_wire),
        .if_cpu_ldst_HADDR(core_i1_if_cpu_ldst_HADDR_wire),
        .if_cpu_ldst_HBURST(core_i1_if_cpu_ldst_HBURST_wire),
        .if_cpu_ldst_HMASTLOCK(core_i1_if_cpu_ldst_HMASTLOCK_wire),
        .if_cpu_ldst_HPROT(core_i1_if_cpu_ldst_HPROT_wire),
        .if_cpu_ldst_HSIZE(core_i1_if_cpu_ldst_HSIZE_wire),
        .if_cpu_ldst_HTRANS(core_i1_if_cpu_ldst_HTRANS_wire),
        .if_cpu_ldst_HWDATA(core_i1_if_cpu_ldst_HWDATA_wire),
        .if_cpu_ldst_HWRITE(core_i1_if_cpu_ldst_HWRITE_wire),
        .if_dtcm_ldst_HRDATA(idtcm_if_dtcm_ldst_HRDATA_wire),
        .if_dtcm_ldst_HREADY(idtcm_if_dtcm_ldst_HREADY_wire),
        .if_dtcm_ldst_HRESP(idtcm_if_dtcm_ldst_HRESP_wire),
        .if_fetch_HRDATA(cache_l1_if_fetch_slave_HRDATA_wire),
        .if_fetch_HREADY(cache_l1_if_fetch_slave_HREADYOUT_wire),
        .if_fetch_HRESP(cache_l1_if_fetch_slave_HRESP_wire),
        .if_itcm_fetch_HRDATA(idtcm_if_itcm_fetch_HRDATA_wire),
        .if_itcm_fetch_HREADY(idtcm_if_itcm_fetch_HREADY_wire),
        .if_itcm_fetch_HRESP(idtcm_if_itcm_fetch_HRESP_wire),
        .if_itcm_ldst_HRDATA(idtcm_if_itcm_ldst_HRDATA_wire),
        .if_itcm_ldst_HREADY(idtcm_if_itcm_ldst_HREADY_wire),
        .if_itcm_ldst_HRESP(idtcm_if_itcm_ldst_HRESP_wire),
        .if_ldst_HRDATA(cache_l1_if_ldst_slave_HRDATA_wire),
        .if_ldst_HREADY(cache_l1_if_ldst_slave_HREADYOUT_wire),
        .if_ldst_HRESP(cache_l1_if_ldst_slave_HRESP_wire),
        .p_dtcm_en(core_i1_p_dtcm_en_wire),
        .p_itcm_en(core_i1_p_itcm_en_wire),
        .if_cpu_fetch_HRDATA(i1_if_cpu_fetch_HRDATA_wire),
        .if_cpu_fetch_HREADY(i1_if_cpu_fetch_HREADY_wire),
        .if_cpu_fetch_HRESP(i1_if_cpu_fetch_HRESP_wire),
        .if_cpu_ldst_HRDATA(i1_if_cpu_ldst_HRDATA_wire),
        .if_cpu_ldst_HREADY(i1_if_cpu_ldst_HREADY_wire),
        .if_cpu_ldst_HRESP(i1_if_cpu_ldst_HRESP_wire),
        .if_dtcm_ldst_HADDR(i1_if_dtcm_ldst_HADDR_wire),
        .if_dtcm_ldst_HBURST(i1_if_dtcm_ldst_HBURST_wire),
        .if_dtcm_ldst_HMASTLOCK(i1_if_dtcm_ldst_HMASTLOCK_wire),
        .if_dtcm_ldst_HPROT(i1_if_dtcm_ldst_HPROT_wire),
        .if_dtcm_ldst_HSIZE(i1_if_dtcm_ldst_HSIZE_wire),
        .if_dtcm_ldst_HTRANS(i1_if_dtcm_ldst_HTRANS_wire),
        .if_dtcm_ldst_HWDATA(i1_if_dtcm_ldst_HWDATA_wire),
        .if_dtcm_ldst_HWRITE(i1_if_dtcm_ldst_HWRITE_wire),
        .if_fetch_HADDR(i1_if_fetch_HADDR_wire),
        .if_fetch_HBURST(i1_if_fetch_HBURST_wire),
        .if_fetch_HMASTLOCK(i1_if_fetch_HMASTLOCK_wire),
        .if_fetch_HPROT(i1_if_fetch_HPROT_wire),
        .if_fetch_HSIZE(i1_if_fetch_HSIZE_wire),
        .if_fetch_HTRANS(i1_if_fetch_HTRANS_wire),
        .if_fetch_HWRITE(i1_if_fetch_HWRITE_wire),
        .if_itcm_fetch_HADDR(i1_if_itcm_fetch_HADDR_wire),
        .if_itcm_fetch_HBURST(i1_if_itcm_fetch_HBURST_wire),
        .if_itcm_fetch_HMASTLOCK(i1_if_itcm_fetch_HMASTLOCK_wire),
        .if_itcm_fetch_HPROT(i1_if_itcm_fetch_HPROT_wire),
        .if_itcm_fetch_HSIZE(i1_if_itcm_fetch_HSIZE_wire),
        .if_itcm_fetch_HTRANS(i1_if_itcm_fetch_HTRANS_wire),
        .if_itcm_fetch_HWRITE(i1_if_itcm_fetch_HWRITE_wire),
        .if_itcm_ldst_HADDR(i1_if_itcm_ldst_HADDR_wire),
        .if_itcm_ldst_HBURST(i1_if_itcm_ldst_HBURST_wire),
        .if_itcm_ldst_HMASTLOCK(i1_if_itcm_ldst_HMASTLOCK_wire),
        .if_itcm_ldst_HPROT(i1_if_itcm_ldst_HPROT_wire),
        .if_itcm_ldst_HSIZE(i1_if_itcm_ldst_HSIZE_wire),
        .if_itcm_ldst_HTRANS(i1_if_itcm_ldst_HTRANS_wire),
        .if_itcm_ldst_HWDATA(i1_if_itcm_ldst_HWDATA_wire),
        .if_itcm_ldst_HWRITE(i1_if_itcm_ldst_HWRITE_wire),
        .if_ldst_HADDR(i1_if_ldst_HADDR_wire),
        .if_ldst_HBURST(i1_if_ldst_HBURST_wire),
        .if_ldst_HMASTLOCK(i1_if_ldst_HMASTLOCK_wire),
        .if_ldst_HPROT(i1_if_ldst_HPROT_wire),
        .if_ldst_HSIZE(i1_if_ldst_HSIZE_wire),
        .if_ldst_HTRANS(i1_if_ldst_HTRANS_wire),
        .if_ldst_HWDATA(i1_if_ldst_HWDATA_wire),
        .if_ldst_HWRITE(i1_if_ldst_HWRITE_wire)
    );

    // CodAL interface with Program Buffer access (RISC-V Debug specification) instance:
    codix_berkelium_ca_codasip_i1_if_cpu_fetch_t #(
        .BASE(progbuf_base_p)
    ) codasip_i1_if_cpu_fetch (
        .CLK(CLK),
        .RST(RST),
        .codasip_i1_if_cpu_fetch_HRDATA(i1_if_cpu_fetch_HRDATA_wire),
        .codasip_i1_if_cpu_fetch_HREADY(i1_if_cpu_fetch_HREADY_wire),
        .codasip_i1_if_cpu_fetch_HRESP(i1_if_cpu_fetch_HRESP_wire),
        .HADDR(core_i1_if_cpu_fetch_HADDR_wire),
        .HBURST(core_i1_if_cpu_fetch_HBURST_wire),
        .HMASTLOCK(core_i1_if_cpu_fetch_HMASTLOCK_wire),
        .HPROT(core_i1_if_cpu_fetch_HPROT_wire),
        .HSIZE(core_i1_if_cpu_fetch_HSIZE_wire),
        .HTRANS(core_i1_if_cpu_fetch_HTRANS_wire),
        .HWRITE(core_i1_if_cpu_fetch_HWRITE_wire),
        .progbuf_Q(riscv_dm_codasip_i1_if_cpu_fetch_progbuf_Q_wire),
        .codasip_i1_if_cpu_fetch_HADDR(codasip_i1_if_cpu_fetch_codasip_i1_if_cpu_fetch_HADDR_wire),
        .codasip_i1_if_cpu_fetch_HBURST(codasip_i1_if_cpu_fetch_codasip_i1_if_cpu_fetch_HBURST_wire),
        .codasip_i1_if_cpu_fetch_HMASTLOCK(codasip_i1_if_cpu_fetch_codasip_i1_if_cpu_fetch_HMASTLOCK_wire),
        .codasip_i1_if_cpu_fetch_HPROT(codasip_i1_if_cpu_fetch_codasip_i1_if_cpu_fetch_HPROT_wire),
        .codasip_i1_if_cpu_fetch_HSIZE(codasip_i1_if_cpu_fetch_codasip_i1_if_cpu_fetch_HSIZE_wire),
        .codasip_i1_if_cpu_fetch_HTRANS(codasip_i1_if_cpu_fetch_codasip_i1_if_cpu_fetch_HTRANS_wire),
        .codasip_i1_if_cpu_fetch_HWRITE(codasip_i1_if_cpu_fetch_codasip_i1_if_cpu_fetch_HWRITE_wire),
        .HRDATA(codasip_i1_if_cpu_fetch_HRDATA_wire),
        .HREADY(codasip_i1_if_cpu_fetch_HREADY_wire),
        .HRESP(codasip_i1_if_cpu_fetch_HRESP_wire),
        .progbuf_RA(codasip_i1_if_cpu_fetch_progbuf_RA_wire),
        .progbuf_RE(codasip_i1_if_cpu_fetch_progbuf_RE_wire)
    );

    // Codasip Tightly Coupled Memory instance:
    codix_berkelium_ca_idtcm_t #(
        .itcm_baddr_p(itcm_baddr_p),
        .itcm_size_p(itcm_size_p),
        .dtcm_baddr_p(dtcm_baddr_p),
        .dtcm_size_p(dtcm_size_p)
    ) idtcm (
        .CLK(pmu_ICLK_wire),
        .RST(codasip_IRST_gen_IRST_wire),
        .idtcm_dtcm_mem_sram_if_slave_RDATA(idtcm_dtcm_mem_sram_if_slave_RDATA),
        .idtcm_itcm_mem_sram_if_slave_RDATA(idtcm_itcm_mem_sram_if_slave_RDATA),
        .if_dtcm_ldst_HADDR(i1_if_dtcm_ldst_HADDR_wire),
        .if_dtcm_ldst_HBURST(i1_if_dtcm_ldst_HBURST_wire),
        .if_dtcm_ldst_HMASTLOCK(i1_if_dtcm_ldst_HMASTLOCK_wire),
        .if_dtcm_ldst_HPROT(i1_if_dtcm_ldst_HPROT_wire),
        .if_dtcm_ldst_HSIZE(i1_if_dtcm_ldst_HSIZE_wire),
        .if_dtcm_ldst_HTRANS(i1_if_dtcm_ldst_HTRANS_wire),
        .if_dtcm_ldst_HWDATA(i1_if_dtcm_ldst_HWDATA_wire),
        .if_dtcm_ldst_HWRITE(i1_if_dtcm_ldst_HWRITE_wire),
        .if_itcm_fetch_HADDR(i1_if_itcm_fetch_HADDR_wire),
        .if_itcm_fetch_HBURST(i1_if_itcm_fetch_HBURST_wire),
        .if_itcm_fetch_HMASTLOCK(i1_if_itcm_fetch_HMASTLOCK_wire),
        .if_itcm_fetch_HPROT(i1_if_itcm_fetch_HPROT_wire),
        .if_itcm_fetch_HSIZE(i1_if_itcm_fetch_HSIZE_wire),
        .if_itcm_fetch_HTRANS(i1_if_itcm_fetch_HTRANS_wire),
        .if_itcm_fetch_HWRITE(i1_if_itcm_fetch_HWRITE_wire),
        .if_itcm_ldst_HADDR(i1_if_itcm_ldst_HADDR_wire),
        .if_itcm_ldst_HBURST(i1_if_itcm_ldst_HBURST_wire),
        .if_itcm_ldst_HMASTLOCK(i1_if_itcm_ldst_HMASTLOCK_wire),
        .if_itcm_ldst_HPROT(i1_if_itcm_ldst_HPROT_wire),
        .if_itcm_ldst_HSIZE(i1_if_itcm_ldst_HSIZE_wire),
        .if_itcm_ldst_HTRANS(i1_if_itcm_ldst_HTRANS_wire),
        .if_itcm_ldst_HWDATA(i1_if_itcm_ldst_HWDATA_wire),
        .if_itcm_ldst_HWRITE(i1_if_itcm_ldst_HWRITE_wire),
        .if_slave_HADDR(if_slave_HADDR),
        .if_slave_HBURST(if_slave_HBURST),
        .if_slave_HMASTLOCK(if_slave_HMASTLOCK),
        .if_slave_HPROT(if_slave_HPROT),
        .if_slave_HREADY(if_slave_HREADY),
        .if_slave_HSEL(if_slave_HSEL),
        .if_slave_HSIZE(if_slave_HSIZE),
        .if_slave_HTRANS(if_slave_HTRANS),
        .if_slave_HWDATA(if_slave_HWDATA),
        .if_slave_HWRITE(if_slave_HWRITE),
        .idtcm_dtcm_mem_sram_if_slave_A(idtcm_dtcm_mem_sram_if_slave_A),
        .idtcm_dtcm_mem_sram_if_slave_CS(idtcm_dtcm_mem_sram_if_slave_CS),
        .idtcm_dtcm_mem_sram_if_slave_RW(idtcm_dtcm_mem_sram_if_slave_RW),
        .idtcm_dtcm_mem_sram_if_slave_WDATA(idtcm_dtcm_mem_sram_if_slave_WDATA),
        .idtcm_dtcm_mem_sram_if_slave_WSTRB(idtcm_dtcm_mem_sram_if_slave_WSTRB),
        .idtcm_itcm_mem_sram_if_slave_A(idtcm_itcm_mem_sram_if_slave_A),
        .idtcm_itcm_mem_sram_if_slave_CS(idtcm_itcm_mem_sram_if_slave_CS),
        .idtcm_itcm_mem_sram_if_slave_RW(idtcm_itcm_mem_sram_if_slave_RW),
        .idtcm_itcm_mem_sram_if_slave_WDATA(idtcm_itcm_mem_sram_if_slave_WDATA),
        .idtcm_itcm_mem_sram_if_slave_WSTRB(idtcm_itcm_mem_sram_if_slave_WSTRB),
        .if_dtcm_ldst_HRDATA(idtcm_if_dtcm_ldst_HRDATA_wire),
        .if_dtcm_ldst_HREADY(idtcm_if_dtcm_ldst_HREADY_wire),
        .if_dtcm_ldst_HRESP(idtcm_if_dtcm_ldst_HRESP_wire),
        .if_itcm_fetch_HRDATA(idtcm_if_itcm_fetch_HRDATA_wire),
        .if_itcm_fetch_HREADY(idtcm_if_itcm_fetch_HREADY_wire),
        .if_itcm_fetch_HRESP(idtcm_if_itcm_fetch_HRESP_wire),
        .if_itcm_ldst_HRDATA(idtcm_if_itcm_ldst_HRDATA_wire),
        .if_itcm_ldst_HREADY(idtcm_if_itcm_ldst_HREADY_wire),
        .if_itcm_ldst_HRESP(idtcm_if_itcm_ldst_HRESP_wire),
        .if_slave_HRDATA(if_slave_HRDATA),
        .if_slave_HREADYOUT(if_slave_HREADYOUT),
        .if_slave_HRESP(if_slave_HRESP)
    );

    // ASIP core instance:
    codix_berkelium_ca_core_t #(
        .nmi_handler_p(nmi_handler_p),
        .itcm_size_p(itcm_size_p),
        .itcm_baddr_p(itcm_baddr_p),
        .dtcm_size_p(dtcm_size_p),
        .dtcm_baddr_p(dtcm_baddr_p),
        .cache_base_p(cache_base_p),
        .hart_id_p(hart_id_p),
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
        .pma_cfg0_p(pma_cfg0_p),
        .progbuf_base_p(progbuf_base_p)
    ) core (
        .CLK(pmu_ICLK_wire),
        .execute_stage_div_s_div_ce_i_ICLK(pmu_execute_stage_div_s_div_ce_i_ICLK_wire),
        .execute_stage_fpu_add_sub_s_add_sub_ce_ICLK(pmu_execute_stage_fpu_add_sub_s_add_sub_ce_ICLK_wire),
        .execute_stage_fpu_float2int_s_f2i_ce_ICLK(pmu_execute_stage_fpu_float2int_s_f2i_ce_ICLK_wire),
        .execute_stage_fpu_fmul_s_fmul_ce_ICLK(pmu_execute_stage_fpu_fmul_s_fmul_ce_ICLK_wire),
        .execute_stage_fpu_fused_s_fused_ce_ICLK(pmu_execute_stage_fpu_fused_s_fused_ce_ICLK_wire),
        .execute_stage_fpu_int2float_s_i2f_ce_ICLK(pmu_execute_stage_fpu_int2float_s_i2f_ce_ICLK_wire),
        .execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK(pmu_execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK_wire),
        .execute_stage_lsu_s_load_ce_ICLK(pmu_execute_stage_lsu_s_load_ce_ICLK_wire),
        .execute_stage_lsu_s_lsu_ce_ICLK(pmu_execute_stage_lsu_s_lsu_ce_ICLK_wire),
        .execute_stage_lsu_s_store_ce_ICLK(pmu_execute_stage_lsu_s_store_ce_ICLK_wire),
        .fetch_stage_bp_bht_s_is_branch_i_ICLK(pmu_fetch_stage_bp_bht_s_is_branch_i_ICLK_wire),
        .fetch_stage_bp_btb_s_is_branch_i_ICLK(pmu_fetch_stage_bp_btb_s_is_branch_i_ICLK_wire),
        .fetch_stage_bp_btb_s_is_jump_i_ICLK(pmu_fetch_stage_bp_btb_s_is_jump_i_ICLK_wire),
        .r_wfi_ce_ICLK(pmu_r_wfi_ce_ICLK_wire),
        .s_dm_active_ICLK(pmu_s_dm_active_ICLK_wire),
        .s_fpu_ce_ICLK(pmu_s_fpu_ce_ICLK_wire),
        .RST(codasip_IRST_gen_IRST_wire),
        .i1_if_cpu_fetch_HRDATA(codasip_i1_if_cpu_fetch_HRDATA_wire),
        .i1_if_cpu_fetch_HREADY(codasip_i1_if_cpu_fetch_HREADY_wire),
        .i1_if_cpu_fetch_HRESP(codasip_i1_if_cpu_fetch_HRESP_wire),
        .i1_if_cpu_ldst_HRDATA(i1_if_cpu_ldst_HRDATA_wire),
        .i1_if_cpu_ldst_HREADY(i1_if_cpu_ldst_HREADY_wire),
        .i1_if_cpu_ldst_HRESP(i1_if_cpu_ldst_HRESP_wire),
        .p_boot_addr_Q(p_boot_addr[31:1]),
        .p_cpu_stall_Q(p_cpu_stall),
        .p_dtcm_en_Q(p_dtcm_en),
        .p_int_Q(p_int),
        .p_itcm_en_Q(p_itcm_en),
        .p_msip_Q(p_msip),
        .p_mtip_Q(p_mtip),
        .p_nmi_mtval_Q(p_nmi_mtval),
        .p_nmi_Q(p_nmi),
        .p_eviction_error_Q(cache_l1_EVICTION_ERROR_wire),
        .r_csr_dpc_BSC_D(riscv_dm_core_r_csr_dpc_BSC_D_wire),
        .r_csr_dpc_BSC_UPDATE(riscv_dm_core_r_csr_dpc_BSC_UPDATE_wire),
        .r_csr_dpc_DEBUG_MODE(riscv_dm_core_r_csr_dpc_DEBUG_MODE_wire),
        .rf_gpr_BSC_A(riscv_dm_core_rf_gpr_BSC_A_wire),
        .rf_gpr_BSC_D(riscv_dm_core_rf_gpr_BSC_D_wire),
        .rf_gpr_BSC_UPDATE(riscv_dm_core_rf_gpr_BSC_UPDATE_wire),
        .rf_gpr_DEBUG_MODE(riscv_dm_core_rf_gpr_DEBUG_MODE_wire),
        .s_dm_active_D(riscv_dm_core_s_dm_active_D_wire),
        .s_dm_halt_D(riscv_dm_core_s_dm_halt_D_wire),
        .s_dm_progbuf_en_D(riscv_dm_core_s_dm_progbuf_en_D_wire),
        .codasip_halt_wire_D(codasip_halt_wire),
        .execute_stage_div_s_div_ce_i_Q(core_execute_stage_div_s_div_ce_i_Q_wire),
        .execute_stage_fpu_add_sub_s_add_sub_ce_Q(core_execute_stage_fpu_add_sub_s_add_sub_ce_Q_wire),
        .execute_stage_fpu_float2int_s_f2i_ce_Q(core_execute_stage_fpu_float2int_s_f2i_ce_Q_wire),
        .execute_stage_fpu_fmul_s_fmul_ce_Q(core_execute_stage_fpu_fmul_s_fmul_ce_Q_wire),
        .execute_stage_fpu_fused_s_fused_ce_Q(core_execute_stage_fpu_fused_s_fused_ce_Q_wire),
        .execute_stage_fpu_int2float_s_i2f_ce_Q(core_execute_stage_fpu_int2float_s_i2f_ce_Q_wire),
        .execute_stage_fpu_sqrt_div_s_sqrt_div_ce_Q(core_execute_stage_fpu_sqrt_div_s_sqrt_div_ce_Q_wire),
        .execute_stage_lsu_s_load_ce_Q(core_execute_stage_lsu_s_load_ce_Q_wire),
        .execute_stage_lsu_s_lsu_ce_Q(core_execute_stage_lsu_s_lsu_ce_Q_wire),
        .execute_stage_lsu_s_store_ce_Q(core_execute_stage_lsu_s_store_ce_Q_wire),
        .fetch_stage_bp_bht_s_is_branch_i_Q(core_fetch_stage_bp_bht_s_is_branch_i_Q_wire),
        .fetch_stage_bp_btb_s_is_branch_i_Q(core_fetch_stage_bp_btb_s_is_branch_i_Q_wire),
        .fetch_stage_bp_btb_s_is_jump_i_Q(core_fetch_stage_bp_btb_s_is_jump_i_Q_wire),
        .i1_if_cpu_fetch_HADDR(core_i1_if_cpu_fetch_HADDR_wire),
        .i1_if_cpu_fetch_HBURST(core_i1_if_cpu_fetch_HBURST_wire),
        .i1_if_cpu_fetch_HMASTLOCK(core_i1_if_cpu_fetch_HMASTLOCK_wire),
        .i1_if_cpu_fetch_HPROT(core_i1_if_cpu_fetch_HPROT_wire),
        .i1_if_cpu_fetch_HSIZE(core_i1_if_cpu_fetch_HSIZE_wire),
        .i1_if_cpu_fetch_HTRANS(core_i1_if_cpu_fetch_HTRANS_wire),
        .i1_if_cpu_fetch_HWRITE(core_i1_if_cpu_fetch_HWRITE_wire),
        .i1_if_cpu_ldst_HADDR(core_i1_if_cpu_ldst_HADDR_wire),
        .i1_if_cpu_ldst_HBURST(core_i1_if_cpu_ldst_HBURST_wire),
        .i1_if_cpu_ldst_HMASTLOCK(core_i1_if_cpu_ldst_HMASTLOCK_wire),
        .i1_if_cpu_ldst_HPROT(core_i1_if_cpu_ldst_HPROT_wire),
        .i1_if_cpu_ldst_HSIZE(core_i1_if_cpu_ldst_HSIZE_wire),
        .i1_if_cpu_ldst_HTRANS(core_i1_if_cpu_ldst_HTRANS_wire),
        .i1_if_cpu_ldst_HWDATA(core_i1_if_cpu_ldst_HWDATA_wire),
        .i1_if_cpu_ldst_HWRITE(core_i1_if_cpu_ldst_HWRITE_wire),
        .i1_p_dtcm_en(core_i1_p_dtcm_en_wire),
        .i1_p_itcm_en(core_i1_p_itcm_en_wire),
        .p_wfi_D(p_wfi),
        .r_csr_dpc_BSC_Q(core_r_csr_dpc_BSC_Q_wire),
        .r_wfi_ce_Q(core_r_wfi_ce_Q_wire),
        .rf_gpr_BSC_Q(core_rf_gpr_BSC_Q_wire),
        .s_dm_active_Q(core_s_dm_active_Q_wire),
        .s_dm_progbuf_done_Q(core_s_dm_progbuf_done_Q_wire),
        .s_dm_progbuf_exc_Q(core_s_dm_progbuf_exc_Q_wire),
        .s_fpu_ce_Q(core_s_fpu_ce_Q_wire),
        .s_hart_halted_Q(core_s_hart_halted_Q_wire)
    );

    // RISC-V Debug - DM top unit instance:
    codix_berkelium_ca_riscv_dm_t riscv_dm (
        .CLK(CLK),
        .TCK(TCK),
        .RST(RST),
        .TRST(TRST),
        .TMS(TMS),
        .TDI(TDI),
        .codasip_i1_if_cpu_fetch_progbuf_RA(codasip_i1_if_cpu_fetch_progbuf_RA_wire),
        .codasip_i1_if_cpu_fetch_progbuf_RE(codasip_i1_if_cpu_fetch_progbuf_RE_wire),
        .core_r_csr_dpc_BSC_Q(core_r_csr_dpc_BSC_Q_wire),
        .core_rf_gpr_BSC_Q(core_rf_gpr_BSC_Q_wire),
        .core_s_dm_progbuf_done_Q(core_s_dm_progbuf_done_Q_wire),
        .core_s_dm_progbuf_exc_Q(core_s_dm_progbuf_exc_Q_wire),
        .core_s_hart_halted_Q(core_s_hart_halted_Q_wire),
        .SCANMODE(SCANMODE),
        .TDO(TDO),
        .codasip_i1_if_cpu_fetch_progbuf_Q(riscv_dm_codasip_i1_if_cpu_fetch_progbuf_Q_wire),
        .core_r_csr_dpc_BSC_D(riscv_dm_core_r_csr_dpc_BSC_D_wire),
        .core_r_csr_dpc_BSC_UPDATE(riscv_dm_core_r_csr_dpc_BSC_UPDATE_wire),
        .core_r_csr_dpc_DEBUG_MODE(riscv_dm_core_r_csr_dpc_DEBUG_MODE_wire),
        .core_rf_gpr_BSC_A(riscv_dm_core_rf_gpr_BSC_A_wire),
        .core_rf_gpr_BSC_D(riscv_dm_core_rf_gpr_BSC_D_wire),
        .core_rf_gpr_BSC_UPDATE(riscv_dm_core_rf_gpr_BSC_UPDATE_wire),
        .core_rf_gpr_DEBUG_MODE(riscv_dm_core_rf_gpr_DEBUG_MODE_wire),
        .core_s_dm_active_D(riscv_dm_core_s_dm_active_D_wire),
        .core_s_dm_halt_D(riscv_dm_core_s_dm_halt_D_wire),
        .core_s_dm_progbuf_en_D(riscv_dm_core_s_dm_progbuf_en_D_wire),
        .dmactive(dmactive),
        .ndmreset(ndmreset),
        .RST_REQUEST(riscv_dm_RST_REQUEST_wire)
    );

endmodule: codix_berkelium_ca
