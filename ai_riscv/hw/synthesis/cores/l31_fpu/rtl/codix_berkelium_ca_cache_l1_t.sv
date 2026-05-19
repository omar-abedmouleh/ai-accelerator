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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_cache_l1_t' Codasip cache.
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

module codix_berkelium_ca_cache_l1_t #(
    parameter [31:0] dcache_size_p = 32'h00004000,
    parameter [31:0] dcache_linesize_p = 32'h00000020,
    parameter [31:0] dcache_numway_p = 32'h00000002,
    parameter [31:0] icache_size_p = 32'h00004000,
    parameter [31:0] icache_linesize_p = 32'h00000020,
    parameter [31:0] icache_numway_p = 32'h00000002
) (
    input  logic CLK,
    input  logic RST,
    input  logic [(dcache_linesize_p * dcache_numway_p * 32'd8)-1:0] cache_l1_dcache_data_sram_RDATA,
    input  logic [(dcache_numway_p)-1:0] cache_l1_dcache_dirty_sram_RDATA,
    input  logic [(dcache_numway_p * (32'd32 - $clog2(dcache_size_p / dcache_numway_p) + 32'd1))-1:0] cache_l1_dcache_tags_sram_RDATA,
    input  logic [(icache_linesize_p * icache_numway_p * 32'd8)-1:0] cache_l1_icache_data_sram_RDATA,
    input  logic [(icache_numway_p * (32'd32 - $clog2(icache_size_p / icache_numway_p) + 32'd1))-1:0] cache_l1_icache_tags_sram_RDATA,
    input  logic [31:0] if_fetch_master_HRDATA,
    input  logic if_fetch_master_HREADY,
    input  logic if_fetch_master_HRESP,
    input  logic [31:0] if_fetch_slave_HADDR,
    input  logic [2:0] if_fetch_slave_HBURST,
    input  logic if_fetch_slave_HMASTLOCK,
    input  logic [3:0] if_fetch_slave_HPROT,
    input  logic if_fetch_slave_HREADY,
    input  logic if_fetch_slave_HSEL,
    input  logic [2:0] if_fetch_slave_HSIZE,
    input  logic [1:0] if_fetch_slave_HTRANS,
    input  logic if_fetch_slave_HWRITE,
    input  logic [31:0] if_ldst_master_HRDATA,
    input  logic if_ldst_master_HREADY,
    input  logic if_ldst_master_HRESP,
    input  logic [31:0] if_ldst_slave_HADDR,
    input  logic [2:0] if_ldst_slave_HBURST,
    input  logic if_ldst_slave_HMASTLOCK,
    input  logic [3:0] if_ldst_slave_HPROT,
    input  logic if_ldst_slave_HREADY,
    input  logic if_ldst_slave_HSEL,
    input  logic [2:0] if_ldst_slave_HSIZE,
    input  logic [1:0] if_ldst_slave_HTRANS,
    input  logic [31:0] if_ldst_slave_HWDATA,
    input  logic if_ldst_slave_HWRITE,
    output logic BUSY,
    output logic EVICTION_ERROR,
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
    output logic [31:0] if_fetch_master_HADDR,
    output logic [2:0] if_fetch_master_HBURST,
    output logic if_fetch_master_HMASTLOCK,
    output logic [3:0] if_fetch_master_HPROT,
    output logic [2:0] if_fetch_master_HSIZE,
    output logic [1:0] if_fetch_master_HTRANS,
    output logic if_fetch_master_HWRITE,
    output logic [31:0] if_fetch_slave_HRDATA,
    output logic if_fetch_slave_HREADYOUT,
    output logic if_fetch_slave_HRESP,
    output logic [31:0] if_ldst_master_HADDR,
    output logic [2:0] if_ldst_master_HBURST,
    output logic if_ldst_master_HMASTLOCK,
    output logic [3:0] if_ldst_master_HPROT,
    output logic [2:0] if_ldst_master_HSIZE,
    output logic [1:0] if_ldst_master_HTRANS,
    output logic [31:0] if_ldst_master_HWDATA,
    output logic if_ldst_master_HWRITE,
    output logic [31:0] if_ldst_slave_HRDATA,
    output logic if_ldst_slave_HREADYOUT,
    output logic if_ldst_slave_HRESP
);
    // additional declarations:
    logic core_DCACHE_SRAM_LINE_DATA_CS;
    logic core_DCACHE_SRAM_LINE_DATA_RW;
    logic [($clog2((dcache_size_p / dcache_linesize_p) / dcache_numway_p))-1:0] core_DCACHE_SRAM_LINE_DATA_A;
    logic [(dcache_linesize_p * dcache_numway_p)-1:0] core_DCACHE_SRAM_LINE_DATA_WSTRB;
    logic [(dcache_linesize_p * dcache_numway_p * 32'd8)-1:0] core_DCACHE_SRAM_LINE_DATA_WDATA;
    logic [(dcache_linesize_p * dcache_numway_p * 32'd8)-1:0] core_DCACHE_SRAM_LINE_DATA_RDATA;
    logic core_DCACHE_SRAM_TAG_CS;
    logic core_DCACHE_SRAM_TAG_RW;
    logic [($clog2((dcache_size_p / dcache_linesize_p) / dcache_numway_p))-1:0] core_DCACHE_SRAM_TAG_A;
    logic [(dcache_numway_p)-1:0] core_DCACHE_SRAM_TAG_WSTRB;
    logic [(dcache_numway_p * (32'd32 - $clog2(dcache_size_p / dcache_numway_p) + 32'd1))-1:0] core_DCACHE_SRAM_TAG_WDATA;
    logic [(dcache_numway_p * (32'd32 - $clog2(dcache_size_p / dcache_numway_p) + 32'd1))-1:0] core_DCACHE_SRAM_TAG_RDATA;
    logic core_DCACHE_SRAM_DIRTY_CS;
    logic core_DCACHE_SRAM_DIRTY_RW;
    logic [($clog2((dcache_size_p / dcache_linesize_p) / dcache_numway_p))-1:0] core_DCACHE_SRAM_DIRTY_A;
    logic [(dcache_numway_p)-1:0] core_DCACHE_SRAM_DIRTY_WSTRB;
    logic [(dcache_numway_p)-1:0] core_DCACHE_SRAM_DIRTY_WDATA;
    logic [(dcache_numway_p)-1:0] core_DCACHE_SRAM_DIRTY_RDATA;
    logic core_ICACHE_SRAM_LINE_DATA_CS;
    logic core_ICACHE_SRAM_LINE_DATA_RW;
    logic [($clog2((icache_size_p / icache_linesize_p) / icache_numway_p))-1:0] core_ICACHE_SRAM_LINE_DATA_A;
    logic [(icache_linesize_p * icache_numway_p)-1:0] core_ICACHE_SRAM_LINE_DATA_WSTRB;
    logic [(icache_linesize_p * icache_numway_p * 32'd8)-1:0] core_ICACHE_SRAM_LINE_DATA_WDATA;
    logic [(icache_linesize_p * icache_numway_p * 32'd8)-1:0] core_ICACHE_SRAM_LINE_DATA_RDATA;
    logic core_ICACHE_SRAM_TAG_CS;
    logic core_ICACHE_SRAM_TAG_RW;
    logic [($clog2((icache_size_p / icache_linesize_p) / icache_numway_p))-1:0] core_ICACHE_SRAM_TAG_A;
    logic [(icache_numway_p)-1:0] core_ICACHE_SRAM_TAG_WSTRB;
    logic [(icache_numway_p * (32'd32 - $clog2(icache_size_p / icache_numway_p) + 32'd1))-1:0] core_ICACHE_SRAM_TAG_WDATA;
    logic [(icache_numway_p * (32'd32 - $clog2(icache_size_p / icache_numway_p) + 32'd1))-1:0] core_ICACHE_SRAM_TAG_RDATA;

    // child instances inside Codasip cache:
    // Codasip cache template instance:
    codasip_idcache_platform_ahb_t #(
        .RESET_LEVEL(1'd0),
        .RESET_SYNC(1'd0),
        .CSU_BASE_ADDR(32'sd65536),
        .ICACHE_NUM_WAYS(icache_numway_p),
        .ICACHE_SIZE(icache_size_p),
        .ICACHE_LINE_SIZE(icache_linesize_p),
        .ICACHE_IS_LITTLE(1'd1),
        .ICACHE_ADDR_BITS(32'd32),
        .ICACHE_DATA_BITS(32'd32),
        .ICACHE_MASTER_ADDR_BITS(32'd32),
        .ICACHE_MASTER_DATA_BITS(32'd32),
        .ICACHE_SRAM_ADDR_BITS($clog2((icache_size_p / icache_linesize_p) / icache_numway_p)),
        .ICACHE_SRAM_TAG_BITS(32'd32 - $clog2(icache_size_p / icache_numway_p) + 32'd1),
        .DCACHE_NUM_WAYS(dcache_numway_p),
        .DCACHE_SIZE(dcache_size_p),
        .DCACHE_LINE_SIZE(dcache_linesize_p),
        .DCACHE_IS_LITTLE(1'd1),
        .DCACHE_ADDR_BITS(32'd32),
        .DCACHE_DATA_BITS(32'd32),
        .DCACHE_MASTER_ADDR_BITS(32'd32),
        .DCACHE_MASTER_DATA_BITS(32'd32),
        .DCACHE_SRAM_ADDR_BITS($clog2((dcache_size_p / dcache_linesize_p) / dcache_numway_p)),
        .DCACHE_SRAM_TAG_BITS(32'd32 - $clog2(dcache_size_p / dcache_numway_p) + 32'd1)
    ) core (
        .WFI_BUSY(BUSY),
        .EVICTION_ERROR(EVICTION_ERROR),
        .CLK(CLK),
        .RST(RST),
        .DCACHE_SRAM_LINE_DATA_CS(core_DCACHE_SRAM_LINE_DATA_CS),
        .DCACHE_SRAM_LINE_DATA_RW(core_DCACHE_SRAM_LINE_DATA_RW),
        .DCACHE_SRAM_LINE_DATA_A(core_DCACHE_SRAM_LINE_DATA_A),
        .DCACHE_SRAM_LINE_DATA_WSTRB(core_DCACHE_SRAM_LINE_DATA_WSTRB),
        .DCACHE_SRAM_LINE_DATA_WDATA(core_DCACHE_SRAM_LINE_DATA_WDATA),
        .DCACHE_SRAM_LINE_DATA_RDATA(core_DCACHE_SRAM_LINE_DATA_RDATA),
        .DCACHE_SRAM_TAG_CS(core_DCACHE_SRAM_TAG_CS),
        .DCACHE_SRAM_TAG_RW(core_DCACHE_SRAM_TAG_RW),
        .DCACHE_SRAM_TAG_A(core_DCACHE_SRAM_TAG_A),
        .DCACHE_SRAM_TAG_WSTRB(core_DCACHE_SRAM_TAG_WSTRB),
        .DCACHE_SRAM_TAG_WDATA(core_DCACHE_SRAM_TAG_WDATA),
        .DCACHE_SRAM_TAG_RDATA(core_DCACHE_SRAM_TAG_RDATA),
        .DCACHE_SRAM_DIRTY_CS(core_DCACHE_SRAM_DIRTY_CS),
        .DCACHE_SRAM_DIRTY_RW(core_DCACHE_SRAM_DIRTY_RW),
        .DCACHE_SRAM_DIRTY_A(core_DCACHE_SRAM_DIRTY_A),
        .DCACHE_SRAM_DIRTY_WSTRB(core_DCACHE_SRAM_DIRTY_WSTRB),
        .DCACHE_SRAM_DIRTY_WDATA(core_DCACHE_SRAM_DIRTY_WDATA),
        .DCACHE_SRAM_DIRTY_RDATA(core_DCACHE_SRAM_DIRTY_RDATA),
        .ICACHE_SRAM_LINE_DATA_CS(core_ICACHE_SRAM_LINE_DATA_CS),
        .ICACHE_SRAM_LINE_DATA_RW(core_ICACHE_SRAM_LINE_DATA_RW),
        .ICACHE_SRAM_LINE_DATA_A(core_ICACHE_SRAM_LINE_DATA_A),
        .ICACHE_SRAM_LINE_DATA_WSTRB(core_ICACHE_SRAM_LINE_DATA_WSTRB),
        .ICACHE_SRAM_LINE_DATA_WDATA(core_ICACHE_SRAM_LINE_DATA_WDATA),
        .ICACHE_SRAM_LINE_DATA_RDATA(core_ICACHE_SRAM_LINE_DATA_RDATA),
        .ICACHE_SRAM_TAG_CS(core_ICACHE_SRAM_TAG_CS),
        .ICACHE_SRAM_TAG_RW(core_ICACHE_SRAM_TAG_RW),
        .ICACHE_SRAM_TAG_A(core_ICACHE_SRAM_TAG_A),
        .ICACHE_SRAM_TAG_WSTRB(core_ICACHE_SRAM_TAG_WSTRB),
        .ICACHE_SRAM_TAG_WDATA(core_ICACHE_SRAM_TAG_WDATA),
        .ICACHE_SRAM_TAG_RDATA(core_ICACHE_SRAM_TAG_RDATA),
        .DCACHE_HADDR(if_ldst_slave_HADDR),
        .DCACHE_HBURST(if_ldst_slave_HBURST),
        .DCACHE_HMASTLOCK(if_ldst_slave_HMASTLOCK),
        .DCACHE_HPROT(if_ldst_slave_HPROT),
        .DCACHE_HSIZE(if_ldst_slave_HSIZE),
        .DCACHE_HTRANS(if_ldst_slave_HTRANS),
        .DCACHE_HWRITE(if_ldst_slave_HWRITE),
        .DCACHE_HRESP(if_ldst_slave_HRESP),
        .DCACHE_HSEL(if_ldst_slave_HSEL),
        .DCACHE_HREADY(if_ldst_slave_HREADY),
        .DCACHE_HREADYOUT(if_ldst_slave_HREADYOUT),
        .DCACHE_HRDATA(if_ldst_slave_HRDATA),
        .DCACHE_HWDATA(if_ldst_slave_HWDATA),
        .DCACHE_MASTER_HADDR(if_ldst_master_HADDR),
        .DCACHE_MASTER_HBURST(if_ldst_master_HBURST),
        .DCACHE_MASTER_HMASTLOCK(if_ldst_master_HMASTLOCK),
        .DCACHE_MASTER_HPROT(if_ldst_master_HPROT),
        .DCACHE_MASTER_HSIZE(if_ldst_master_HSIZE),
        .DCACHE_MASTER_HTRANS(if_ldst_master_HTRANS),
        .DCACHE_MASTER_HWRITE(if_ldst_master_HWRITE),
        .DCACHE_MASTER_HRESP(if_ldst_master_HRESP),
        .DCACHE_MASTER_HREADY(if_ldst_master_HREADY),
        .DCACHE_MASTER_HRDATA(if_ldst_master_HRDATA),
        .DCACHE_MASTER_HWDATA(if_ldst_master_HWDATA),
        .ICACHE_HADDR(if_fetch_slave_HADDR),
        .ICACHE_HBURST(if_fetch_slave_HBURST),
        .ICACHE_HMASTLOCK(if_fetch_slave_HMASTLOCK),
        .ICACHE_HPROT(if_fetch_slave_HPROT),
        .ICACHE_HSIZE(if_fetch_slave_HSIZE),
        .ICACHE_HTRANS(if_fetch_slave_HTRANS),
        .ICACHE_HWRITE(if_fetch_slave_HWRITE),
        .ICACHE_HRESP(if_fetch_slave_HRESP),
        .ICACHE_HSEL(if_fetch_slave_HSEL),
        .ICACHE_HREADY(if_fetch_slave_HREADY),
        .ICACHE_HREADYOUT(if_fetch_slave_HREADYOUT),
        .ICACHE_HRDATA(if_fetch_slave_HRDATA),
        .ICACHE_MASTER_HADDR(if_fetch_master_HADDR),
        .ICACHE_MASTER_HBURST(if_fetch_master_HBURST),
        .ICACHE_MASTER_HMASTLOCK(if_fetch_master_HMASTLOCK),
        .ICACHE_MASTER_HPROT(if_fetch_master_HPROT),
        .ICACHE_MASTER_HSIZE(if_fetch_master_HSIZE),
        .ICACHE_MASTER_HTRANS(if_fetch_master_HTRANS),
        .ICACHE_MASTER_HWRITE(if_fetch_master_HWRITE),
        .ICACHE_MASTER_HRESP(if_fetch_master_HRESP),
        .ICACHE_MASTER_HREADY(if_fetch_master_HREADY),
        .ICACHE_MASTER_HRDATA(if_fetch_master_HRDATA)
    );

    // data-path code:
    assign cache_l1_dcache_data_sram_CS = core_DCACHE_SRAM_LINE_DATA_CS;
    assign cache_l1_dcache_data_sram_A = core_DCACHE_SRAM_LINE_DATA_A;
    assign cache_l1_dcache_data_sram_RW = core_DCACHE_SRAM_LINE_DATA_RW;
    assign cache_l1_dcache_data_sram_WSTRB = core_DCACHE_SRAM_LINE_DATA_WSTRB;
    assign cache_l1_dcache_data_sram_WDATA = core_DCACHE_SRAM_LINE_DATA_WDATA;
    assign core_DCACHE_SRAM_LINE_DATA_RDATA = cache_l1_dcache_data_sram_RDATA;
    assign cache_l1_dcache_tags_sram_CS = core_DCACHE_SRAM_TAG_CS;
    assign cache_l1_dcache_tags_sram_A = core_DCACHE_SRAM_TAG_A;
    assign cache_l1_dcache_tags_sram_RW = core_DCACHE_SRAM_TAG_RW;
    assign cache_l1_dcache_tags_sram_WSTRB = core_DCACHE_SRAM_TAG_WSTRB;
    assign cache_l1_dcache_tags_sram_WDATA = core_DCACHE_SRAM_TAG_WDATA;
    assign core_DCACHE_SRAM_TAG_RDATA = cache_l1_dcache_tags_sram_RDATA;
    assign cache_l1_dcache_dirty_sram_CS = core_DCACHE_SRAM_DIRTY_CS;
    assign cache_l1_dcache_dirty_sram_A = core_DCACHE_SRAM_DIRTY_A;
    assign cache_l1_dcache_dirty_sram_RW = core_DCACHE_SRAM_DIRTY_RW;
    assign cache_l1_dcache_dirty_sram_WSTRB = core_DCACHE_SRAM_DIRTY_WSTRB;
    assign cache_l1_dcache_dirty_sram_WDATA = core_DCACHE_SRAM_DIRTY_WDATA;
    assign core_DCACHE_SRAM_DIRTY_RDATA = cache_l1_dcache_dirty_sram_RDATA;
    assign cache_l1_icache_data_sram_CS = core_ICACHE_SRAM_LINE_DATA_CS;
    assign cache_l1_icache_data_sram_A = core_ICACHE_SRAM_LINE_DATA_A;
    assign cache_l1_icache_data_sram_RW = core_ICACHE_SRAM_LINE_DATA_RW;
    assign cache_l1_icache_data_sram_WSTRB = core_ICACHE_SRAM_LINE_DATA_WSTRB;
    assign cache_l1_icache_data_sram_WDATA = core_ICACHE_SRAM_LINE_DATA_WDATA;
    assign core_ICACHE_SRAM_LINE_DATA_RDATA = cache_l1_icache_data_sram_RDATA;
    assign cache_l1_icache_tags_sram_CS = core_ICACHE_SRAM_TAG_CS;
    assign cache_l1_icache_tags_sram_A = core_ICACHE_SRAM_TAG_A;
    assign cache_l1_icache_tags_sram_RW = core_ICACHE_SRAM_TAG_RW;
    assign cache_l1_icache_tags_sram_WSTRB = core_ICACHE_SRAM_TAG_WSTRB;
    assign cache_l1_icache_tags_sram_WDATA = core_ICACHE_SRAM_TAG_WDATA;
    assign core_ICACHE_SRAM_TAG_RDATA = cache_l1_icache_tags_sram_RDATA;
endmodule: codix_berkelium_ca_cache_l1_t
