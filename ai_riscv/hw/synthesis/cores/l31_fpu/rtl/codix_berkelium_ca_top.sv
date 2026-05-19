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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_top' ASIP top.
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

module codix_berkelium_ca_top #(
    parameter [31:0] progbuf_base_p = 32'h00020000,
    parameter [31:0] hart_id_p = 32'h00000000,
    parameter [31:0] itcm_size_p = 32'h00004000,
    parameter [31:0] dtcm_size_p = 32'h00004000,
    parameter [31:0] itcm_baddr_p = 32'h02000000,
    parameter [31:0] dtcm_baddr_p = 32'h03000000,
    parameter [31:0] nmi_handler_p = 32'h20000004,
    parameter [31:0] cache_base_p = 32'h00010000,
    parameter [15:0] pma_enable_p = 16'h003f,
    parameter [31:0] pma_base0_p = 32'h20000000,
    parameter [31:0] pma_mask0_p = 32'hffe00000,
    parameter [1:0] pma_cfg0_p = 2'h3,
    parameter [31:0] pma_base1_p = 32'h70010000,
    parameter [31:0] pma_mask1_p = 32'hffffff00,
    parameter [1:0] pma_cfg1_p = 2'h0,
    parameter [31:0] pma_base2_p = 32'h00020000,
    parameter [31:0] pma_mask2_p = 32'hfffffff0,
    parameter [1:0] pma_cfg2_p = 2'h0,
    parameter [31:0] pma_base3_p = 32'h00010000,
    parameter [31:0] pma_mask3_p = 32'hfffffe00,
    parameter [1:0] pma_cfg3_p = 2'h0,
    parameter [31:0] pma_base4_p = 32'h02000000,
    parameter [31:0] pma_mask4_p = 32'hffffc000,
    parameter [1:0] pma_cfg4_p = 2'h2,
    parameter [31:0] pma_base5_p = 32'h03000000,
    parameter [31:0] pma_mask5_p = 32'hffffc000,
    parameter [1:0] pma_cfg5_p = 2'h2,
    parameter [31:0] pma_base6_p = 32'h00000000,
    parameter [31:0] pma_mask6_p = 32'h00000000,
    parameter [1:0] pma_cfg6_p = 2'h0,
    parameter [31:0] pma_base7_p = 32'h00000000,
    parameter [31:0] pma_mask7_p = 32'h00000000,
    parameter [1:0] pma_cfg7_p = 2'h0,
    parameter [31:0] pma_base8_p = 32'h00000000,
    parameter [31:0] pma_mask8_p = 32'h00000000,
    parameter [1:0] pma_cfg8_p = 2'h0,
    parameter [31:0] pma_base9_p = 32'h00000000,
    parameter [31:0] pma_mask9_p = 32'h00000000,
    parameter [1:0] pma_cfg9_p = 2'h0,
    parameter [31:0] pma_base10_p = 32'h00000000,
    parameter [31:0] pma_mask10_p = 32'h00000000,
    parameter [1:0] pma_cfg10_p = 2'h0,
    parameter [31:0] pma_base11_p = 32'h00000000,
    parameter [31:0] pma_mask11_p = 32'h00000000,
    parameter [1:0] pma_cfg11_p = 2'h0,
    parameter [31:0] pma_base12_p = 32'h00000000,
    parameter [31:0] pma_mask12_p = 32'h00000000,
    parameter [1:0] pma_cfg12_p = 2'h0,
    parameter [31:0] pma_base13_p = 32'h00000000,
    parameter [31:0] pma_mask13_p = 32'h00000000,
    parameter [1:0] pma_cfg13_p = 2'h0,
    parameter [31:0] pma_base14_p = 32'h00000000,
    parameter [31:0] pma_mask14_p = 32'h00000000,
    parameter [1:0] pma_cfg14_p = 2'h0,
    parameter [31:0] pma_base15_p = 32'h00000000,
    parameter [31:0] pma_mask15_p = 32'h00000000,
    parameter [1:0] pma_cfg15_p = 2'h0,
    parameter [31:0] icache_size_p = 32'h00004000,
    parameter [31:0] icache_numway_p = 32'h00000002,
    parameter [31:0] icache_linesize_p = 32'h00000020,
    parameter [31:0] dcache_size_p = 32'h00004000,
    parameter [31:0] dcache_numway_p = 32'h00000002,
    parameter [31:0] dcache_linesize_p = 32'h00000020
) (
    input  logic CLK,
    input  logic TCK,
    input  logic RST,
    input  logic TRST,
    input  logic TMS,
    input  logic TDI,
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
    output logic dmactive,
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
    // additional declarations:
    logic [(dcache_linesize_p * dcache_numway_p * 32'd8)-1:0] cache_l1_dcache_data_sram_RDATA;
    logic [(dcache_numway_p)-1:0] cache_l1_dcache_dirty_sram_RDATA;
    logic [(dcache_numway_p * (32'd32 - $clog2(dcache_size_p / dcache_numway_p) + 32'd1))-1:0] cache_l1_dcache_tags_sram_RDATA;
    logic [(icache_linesize_p * icache_numway_p * 32'd8)-1:0] cache_l1_icache_data_sram_RDATA;
    logic [(icache_numway_p * (32'd32 - $clog2(icache_size_p / icache_numway_p) + 32'd1))-1:0] cache_l1_icache_tags_sram_RDATA;
    logic [31:0] idtcm_dtcm_mem_sram_if_slave_RDATA;
    logic [31:0] idtcm_itcm_mem_sram_if_slave_RDATA;
    logic [($clog2((dcache_size_p / dcache_linesize_p) / dcache_numway_p))-1:0] codix_berkelium_cache_l1_dcache_data_sram_A;
    logic codix_berkelium_cache_l1_dcache_data_sram_CS;
    logic codix_berkelium_cache_l1_dcache_data_sram_RW;
    logic [(dcache_linesize_p * dcache_numway_p * 32'd8)-1:0] codix_berkelium_cache_l1_dcache_data_sram_WDATA;
    logic [(dcache_linesize_p * dcache_numway_p)-1:0] codix_berkelium_cache_l1_dcache_data_sram_WSTRB;
    logic [($clog2((dcache_size_p / dcache_linesize_p) / dcache_numway_p))-1:0] codix_berkelium_cache_l1_dcache_dirty_sram_A;
    logic codix_berkelium_cache_l1_dcache_dirty_sram_CS;
    logic codix_berkelium_cache_l1_dcache_dirty_sram_RW;
    logic [(dcache_numway_p)-1:0] codix_berkelium_cache_l1_dcache_dirty_sram_WDATA;
    logic [(dcache_numway_p)-1:0] codix_berkelium_cache_l1_dcache_dirty_sram_WSTRB;
    logic [($clog2((dcache_size_p / dcache_linesize_p) / dcache_numway_p))-1:0] codix_berkelium_cache_l1_dcache_tags_sram_A;
    logic codix_berkelium_cache_l1_dcache_tags_sram_CS;
    logic codix_berkelium_cache_l1_dcache_tags_sram_RW;
    logic [(dcache_numway_p * (32'd32 - $clog2(dcache_size_p / dcache_numway_p) + 32'd1))-1:0] codix_berkelium_cache_l1_dcache_tags_sram_WDATA;
    logic [(dcache_numway_p)-1:0] codix_berkelium_cache_l1_dcache_tags_sram_WSTRB;
    logic [($clog2((icache_size_p / icache_linesize_p) / icache_numway_p))-1:0] codix_berkelium_cache_l1_icache_data_sram_A;
    logic codix_berkelium_cache_l1_icache_data_sram_CS;
    logic codix_berkelium_cache_l1_icache_data_sram_RW;
    logic [(icache_linesize_p * icache_numway_p * 32'd8)-1:0] codix_berkelium_cache_l1_icache_data_sram_WDATA;
    logic [(icache_linesize_p * icache_numway_p)-1:0] codix_berkelium_cache_l1_icache_data_sram_WSTRB;
    logic [($clog2((icache_size_p / icache_linesize_p) / icache_numway_p))-1:0] codix_berkelium_cache_l1_icache_tags_sram_A;
    logic codix_berkelium_cache_l1_icache_tags_sram_CS;
    logic codix_berkelium_cache_l1_icache_tags_sram_RW;
    logic [(icache_numway_p * (32'd32 - $clog2(icache_size_p / icache_numway_p) + 32'd1))-1:0] codix_berkelium_cache_l1_icache_tags_sram_WDATA;
    logic [(icache_numway_p)-1:0] codix_berkelium_cache_l1_icache_tags_sram_WSTRB;
    logic [($clog2(dtcm_size_p / 32'd4))-1:0] codix_berkelium_idtcm_dtcm_mem_sram_if_slave_A;
    logic codix_berkelium_idtcm_dtcm_mem_sram_if_slave_CS;
    logic codix_berkelium_idtcm_dtcm_mem_sram_if_slave_RW;
    logic [31:0] codix_berkelium_idtcm_dtcm_mem_sram_if_slave_WDATA;
    logic [3:0] codix_berkelium_idtcm_dtcm_mem_sram_if_slave_WSTRB;
    logic [($clog2(itcm_size_p / 32'd4))-1:0] codix_berkelium_idtcm_itcm_mem_sram_if_slave_A;
    logic codix_berkelium_idtcm_itcm_mem_sram_if_slave_CS;
    logic codix_berkelium_idtcm_itcm_mem_sram_if_slave_RW;
    logic [31:0] codix_berkelium_idtcm_itcm_mem_sram_if_slave_WDATA;
    logic [3:0] codix_berkelium_idtcm_itcm_mem_sram_if_slave_WSTRB;

    // child instances inside ASIP top:
    // ASIP instance:
    codix_berkelium_ca #(
        .dcache_size_p(dcache_size_p),
        .dcache_linesize_p(dcache_linesize_p),
        .dcache_numway_p(dcache_numway_p),
        .icache_size_p(icache_size_p),
        .icache_linesize_p(icache_linesize_p),
        .icache_numway_p(icache_numway_p),
        .itcm_baddr_p(itcm_baddr_p),
        .itcm_size_p(itcm_size_p),
        .dtcm_baddr_p(dtcm_baddr_p),
        .dtcm_size_p(dtcm_size_p),
        .progbuf_base_p(progbuf_base_p),
        .nmi_handler_p(nmi_handler_p),
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
        .pma_cfg0_p(pma_cfg0_p)
    ) codix_berkelium (
        .CLK(CLK),
        .TCK(TCK),
        .RST(RST),
        .TRST(TRST),
        .TMS(TMS),
        .TDI(TDI),
        .cache_l1_dcache_data_sram_RDATA(cache_l1_dcache_data_sram_RDATA),
        .cache_l1_dcache_dirty_sram_RDATA(cache_l1_dcache_dirty_sram_RDATA),
        .cache_l1_dcache_tags_sram_RDATA(cache_l1_dcache_tags_sram_RDATA),
        .cache_l1_icache_data_sram_RDATA(cache_l1_icache_data_sram_RDATA),
        .cache_l1_icache_tags_sram_RDATA(cache_l1_icache_tags_sram_RDATA),
        .idtcm_dtcm_mem_sram_if_slave_RDATA(idtcm_dtcm_mem_sram_if_slave_RDATA),
        .idtcm_itcm_mem_sram_if_slave_RDATA(idtcm_itcm_mem_sram_if_slave_RDATA),
        .if_fetch_HRDATA(if_fetch_HRDATA),
        .if_fetch_HREADY(if_fetch_HREADY),
        .if_fetch_HRESP(if_fetch_HRESP),
        .if_ldst_HRDATA(if_ldst_HRDATA),
        .if_ldst_HREADY(if_ldst_HREADY),
        .if_ldst_HRESP(if_ldst_HRESP),
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
        .p_boot_addr(p_boot_addr),
        .p_cpu_stall(p_cpu_stall),
        .p_dtcm_en(p_dtcm_en),
        .p_int(p_int),
        .p_itcm_en(p_itcm_en),
        .p_msip(p_msip),
        .p_mtip(p_mtip),
        .p_nmi(p_nmi),
        .p_nmi_mtval(p_nmi_mtval),
        .SCANMODE(SCANMODE),
        .TDO(TDO),
        .cache_l1_dcache_data_sram_A(codix_berkelium_cache_l1_dcache_data_sram_A),
        .cache_l1_dcache_data_sram_CS(codix_berkelium_cache_l1_dcache_data_sram_CS),
        .cache_l1_dcache_data_sram_RW(codix_berkelium_cache_l1_dcache_data_sram_RW),
        .cache_l1_dcache_data_sram_WDATA(codix_berkelium_cache_l1_dcache_data_sram_WDATA),
        .cache_l1_dcache_data_sram_WSTRB(codix_berkelium_cache_l1_dcache_data_sram_WSTRB),
        .cache_l1_dcache_dirty_sram_A(codix_berkelium_cache_l1_dcache_dirty_sram_A),
        .cache_l1_dcache_dirty_sram_CS(codix_berkelium_cache_l1_dcache_dirty_sram_CS),
        .cache_l1_dcache_dirty_sram_RW(codix_berkelium_cache_l1_dcache_dirty_sram_RW),
        .cache_l1_dcache_dirty_sram_WDATA(codix_berkelium_cache_l1_dcache_dirty_sram_WDATA),
        .cache_l1_dcache_dirty_sram_WSTRB(codix_berkelium_cache_l1_dcache_dirty_sram_WSTRB),
        .cache_l1_dcache_tags_sram_A(codix_berkelium_cache_l1_dcache_tags_sram_A),
        .cache_l1_dcache_tags_sram_CS(codix_berkelium_cache_l1_dcache_tags_sram_CS),
        .cache_l1_dcache_tags_sram_RW(codix_berkelium_cache_l1_dcache_tags_sram_RW),
        .cache_l1_dcache_tags_sram_WDATA(codix_berkelium_cache_l1_dcache_tags_sram_WDATA),
        .cache_l1_dcache_tags_sram_WSTRB(codix_berkelium_cache_l1_dcache_tags_sram_WSTRB),
        .cache_l1_icache_data_sram_A(codix_berkelium_cache_l1_icache_data_sram_A),
        .cache_l1_icache_data_sram_CS(codix_berkelium_cache_l1_icache_data_sram_CS),
        .cache_l1_icache_data_sram_RW(codix_berkelium_cache_l1_icache_data_sram_RW),
        .cache_l1_icache_data_sram_WDATA(codix_berkelium_cache_l1_icache_data_sram_WDATA),
        .cache_l1_icache_data_sram_WSTRB(codix_berkelium_cache_l1_icache_data_sram_WSTRB),
        .cache_l1_icache_tags_sram_A(codix_berkelium_cache_l1_icache_tags_sram_A),
        .cache_l1_icache_tags_sram_CS(codix_berkelium_cache_l1_icache_tags_sram_CS),
        .cache_l1_icache_tags_sram_RW(codix_berkelium_cache_l1_icache_tags_sram_RW),
        .cache_l1_icache_tags_sram_WDATA(codix_berkelium_cache_l1_icache_tags_sram_WDATA),
        .cache_l1_icache_tags_sram_WSTRB(codix_berkelium_cache_l1_icache_tags_sram_WSTRB),
        .dmactive(dmactive),
        .idtcm_dtcm_mem_sram_if_slave_A(codix_berkelium_idtcm_dtcm_mem_sram_if_slave_A),
        .idtcm_dtcm_mem_sram_if_slave_CS(codix_berkelium_idtcm_dtcm_mem_sram_if_slave_CS),
        .idtcm_dtcm_mem_sram_if_slave_RW(codix_berkelium_idtcm_dtcm_mem_sram_if_slave_RW),
        .idtcm_dtcm_mem_sram_if_slave_WDATA(codix_berkelium_idtcm_dtcm_mem_sram_if_slave_WDATA),
        .idtcm_dtcm_mem_sram_if_slave_WSTRB(codix_berkelium_idtcm_dtcm_mem_sram_if_slave_WSTRB),
        .idtcm_itcm_mem_sram_if_slave_A(codix_berkelium_idtcm_itcm_mem_sram_if_slave_A),
        .idtcm_itcm_mem_sram_if_slave_CS(codix_berkelium_idtcm_itcm_mem_sram_if_slave_CS),
        .idtcm_itcm_mem_sram_if_slave_RW(codix_berkelium_idtcm_itcm_mem_sram_if_slave_RW),
        .idtcm_itcm_mem_sram_if_slave_WDATA(codix_berkelium_idtcm_itcm_mem_sram_if_slave_WDATA),
        .idtcm_itcm_mem_sram_if_slave_WSTRB(codix_berkelium_idtcm_itcm_mem_sram_if_slave_WSTRB),
        .if_fetch_HADDR(if_fetch_HADDR),
        .if_fetch_HBURST(if_fetch_HBURST),
        .if_fetch_HMASTLOCK(if_fetch_HMASTLOCK),
        .if_fetch_HPROT(if_fetch_HPROT),
        .if_fetch_HSIZE(if_fetch_HSIZE),
        .if_fetch_HTRANS(if_fetch_HTRANS),
        .if_fetch_HWRITE(if_fetch_HWRITE),
        .if_ldst_HADDR(if_ldst_HADDR),
        .if_ldst_HBURST(if_ldst_HBURST),
        .if_ldst_HMASTLOCK(if_ldst_HMASTLOCK),
        .if_ldst_HPROT(if_ldst_HPROT),
        .if_ldst_HSIZE(if_ldst_HSIZE),
        .if_ldst_HTRANS(if_ldst_HTRANS),
        .if_ldst_HWDATA(if_ldst_HWDATA),
        .if_ldst_HWRITE(if_ldst_HWRITE),
        .if_slave_HRDATA(if_slave_HRDATA),
        .if_slave_HREADYOUT(if_slave_HREADYOUT),
        .if_slave_HRESP(if_slave_HRESP),
        .ndmreset(ndmreset),
        .p_wfi(p_wfi)
    );

    // Codasip SRAM logic instance:
    // default parameter values:
    // SIZE = 256
    // ADDR_BITS = 8
    // DATA_BITS = 512
    // BANK_DATA_BITS = 32
    // WSTRB_BITS = 64
    codix_berkelium_ca_cache_l1_dcache_data_sram_t #(
        .SIZE((dcache_size_p / dcache_linesize_p) / dcache_numway_p),
        .ADDR_BITS($clog2((dcache_size_p / dcache_linesize_p) / dcache_numway_p)),
        .DATA_BITS(dcache_linesize_p * dcache_numway_p * 32'd8),
        .BANK_DATA_BITS(32'd32),
        .WSTRB_BITS(dcache_linesize_p * dcache_numway_p)
    ) cache_l1_dcache_data_sram (
        .CLK(CLK),
        .A(codix_berkelium_cache_l1_dcache_data_sram_A),
        .CS(codix_berkelium_cache_l1_dcache_data_sram_CS),
        .RW(codix_berkelium_cache_l1_dcache_data_sram_RW),
        .WDATA(codix_berkelium_cache_l1_dcache_data_sram_WDATA),
        .WSTRB(codix_berkelium_cache_l1_dcache_data_sram_WSTRB),
        .RDATA(cache_l1_dcache_data_sram_RDATA)
    );

    // Codasip SRAM logic instance:
    // default parameter values:
    // SIZE = 256
    // ADDR_BITS = 8
    // DATA_BITS = 40
    // BANK_DATA_BITS = 20
    // WSTRB_BITS = 2
    codix_berkelium_ca_cache_l1_dcache_tags_sram_t #(
        .SIZE((dcache_size_p / dcache_linesize_p) / dcache_numway_p),
        .ADDR_BITS($clog2((dcache_size_p / dcache_linesize_p) / dcache_numway_p)),
        .DATA_BITS(dcache_numway_p * (32'd32 - $clog2(dcache_size_p / dcache_numway_p) + 32'd1)),
        .BANK_DATA_BITS(32'd32 - $clog2(dcache_size_p / dcache_numway_p) + 32'd1),
        .WSTRB_BITS(dcache_numway_p)
    ) cache_l1_dcache_tags_sram (
        .CLK(CLK),
        .A(codix_berkelium_cache_l1_dcache_tags_sram_A),
        .CS(codix_berkelium_cache_l1_dcache_tags_sram_CS),
        .RW(codix_berkelium_cache_l1_dcache_tags_sram_RW),
        .WDATA(codix_berkelium_cache_l1_dcache_tags_sram_WDATA),
        .WSTRB(codix_berkelium_cache_l1_dcache_tags_sram_WSTRB),
        .RDATA(cache_l1_dcache_tags_sram_RDATA)
    );

    // Codasip SRAM logic instance:
    // default parameter values:
    // SIZE = 256
    // ADDR_BITS = 8
    // DATA_BITS = 2
    // BANK_DATA_BITS = 2
    // WSTRB_BITS = 2
    codix_berkelium_ca_cache_l1_dcache_dirty_sram_t #(
        .SIZE((dcache_size_p / dcache_linesize_p) / dcache_numway_p),
        .ADDR_BITS($clog2((dcache_size_p / dcache_linesize_p) / dcache_numway_p)),
        .DATA_BITS(dcache_numway_p),
        .BANK_DATA_BITS(dcache_numway_p),
        .WSTRB_BITS(dcache_numway_p)
    ) cache_l1_dcache_dirty_sram (
        .CLK(CLK),
        .A(codix_berkelium_cache_l1_dcache_dirty_sram_A),
        .CS(codix_berkelium_cache_l1_dcache_dirty_sram_CS),
        .RW(codix_berkelium_cache_l1_dcache_dirty_sram_RW),
        .WDATA(codix_berkelium_cache_l1_dcache_dirty_sram_WDATA),
        .WSTRB(codix_berkelium_cache_l1_dcache_dirty_sram_WSTRB),
        .RDATA(cache_l1_dcache_dirty_sram_RDATA)
    );

    // Codasip SRAM logic instance:
    // default parameter values:
    // SIZE = 256
    // ADDR_BITS = 8
    // DATA_BITS = 512
    // BANK_DATA_BITS = 32
    // WSTRB_BITS = 64
    codix_berkelium_ca_cache_l1_icache_data_sram_t #(
        .SIZE((icache_size_p / icache_linesize_p) / icache_numway_p),
        .ADDR_BITS($clog2((icache_size_p / icache_linesize_p) / icache_numway_p)),
        .DATA_BITS(icache_linesize_p * icache_numway_p * 32'd8),
        .BANK_DATA_BITS(32'd32),
        .WSTRB_BITS(icache_linesize_p * icache_numway_p)
    ) cache_l1_icache_data_sram (
        .CLK(CLK),
        .A(codix_berkelium_cache_l1_icache_data_sram_A),
        .CS(codix_berkelium_cache_l1_icache_data_sram_CS),
        .RW(codix_berkelium_cache_l1_icache_data_sram_RW),
        .WDATA(codix_berkelium_cache_l1_icache_data_sram_WDATA),
        .WSTRB(codix_berkelium_cache_l1_icache_data_sram_WSTRB),
        .RDATA(cache_l1_icache_data_sram_RDATA)
    );

    // Codasip SRAM logic instance:
    // default parameter values:
    // SIZE = 256
    // ADDR_BITS = 8
    // DATA_BITS = 40
    // BANK_DATA_BITS = 20
    // WSTRB_BITS = 2
    codix_berkelium_ca_cache_l1_icache_tags_sram_t #(
        .SIZE((icache_size_p / icache_linesize_p) / icache_numway_p),
        .ADDR_BITS($clog2((icache_size_p / icache_linesize_p) / icache_numway_p)),
        .DATA_BITS(icache_numway_p * (32'd32 - $clog2(icache_size_p / icache_numway_p) + 32'd1)),
        .BANK_DATA_BITS(32'd32 - $clog2(icache_size_p / icache_numway_p) + 32'd1),
        .WSTRB_BITS(icache_numway_p)
    ) cache_l1_icache_tags_sram (
        .CLK(CLK),
        .A(codix_berkelium_cache_l1_icache_tags_sram_A),
        .CS(codix_berkelium_cache_l1_icache_tags_sram_CS),
        .RW(codix_berkelium_cache_l1_icache_tags_sram_RW),
        .WDATA(codix_berkelium_cache_l1_icache_tags_sram_WDATA),
        .WSTRB(codix_berkelium_cache_l1_icache_tags_sram_WSTRB),
        .RDATA(cache_l1_icache_tags_sram_RDATA)
    );

    // Codasip SRAM logic instance:
    // default parameter values:
    // SIZE = 4096
    // ADDR_BITS = 12
    codix_berkelium_ca_idtcm_itcm_mem_sram_t #(
        .SIZE(itcm_size_p / 32'd4),
        .ADDR_BITS($clog2(itcm_size_p / 32'd4))
    ) idtcm_itcm_mem_sram (
        .CLK(CLK),
        .if_slave_A(codix_berkelium_idtcm_itcm_mem_sram_if_slave_A),
        .if_slave_CS(codix_berkelium_idtcm_itcm_mem_sram_if_slave_CS),
        .if_slave_RW(codix_berkelium_idtcm_itcm_mem_sram_if_slave_RW),
        .if_slave_WDATA(codix_berkelium_idtcm_itcm_mem_sram_if_slave_WDATA),
        .if_slave_WSTRB(codix_berkelium_idtcm_itcm_mem_sram_if_slave_WSTRB),
        .if_slave_RDATA(idtcm_itcm_mem_sram_if_slave_RDATA)
    );

    // Codasip SRAM logic instance:
    // default parameter values:
    // SIZE = 4096
    // ADDR_BITS = 12
    codix_berkelium_ca_idtcm_dtcm_mem_sram_t #(
        .SIZE(dtcm_size_p / 32'd4),
        .ADDR_BITS($clog2(dtcm_size_p / 32'd4))
    ) idtcm_dtcm_mem_sram (
        .CLK(CLK),
        .if_slave_A(codix_berkelium_idtcm_dtcm_mem_sram_if_slave_A),
        .if_slave_CS(codix_berkelium_idtcm_dtcm_mem_sram_if_slave_CS),
        .if_slave_RW(codix_berkelium_idtcm_dtcm_mem_sram_if_slave_RW),
        .if_slave_WDATA(codix_berkelium_idtcm_dtcm_mem_sram_if_slave_WDATA),
        .if_slave_WSTRB(codix_berkelium_idtcm_dtcm_mem_sram_if_slave_WSTRB),
        .if_slave_RDATA(idtcm_dtcm_mem_sram_if_slave_RDATA)
    );

endmodule: codix_berkelium_ca_top
