/**
 *  Codasip s.r.o.
 *
 *  CONFIDENTIAL
 *
 *  Copyright 2021 Codasip s.r.o.
 *
 *  All Rights Reserved.
 *
 *  NOTICE: All information contained in this file, is and shall remain the property of
 *  Codasip s.r.o. and its suppliers, if any.
 *
 *  The intellectual and technical concepts contained herein are confidential and proprietary to
 *  Codasip s.r.o. and are protected by trade secret and copyright law. In addition, elements of the
 *  technical concepts may be patent pending.
 *
 *  This file is part of the Codasip Studio product. No part of the Studio product, including this
 *  file, may be use, copied, modified, or distributed except in accordance with the terms contained
 *  in Codasip license agreement under which you obtained this file.
 *
 *  \file   codasip_idcache_platform_ahb_t.v
 *  \author Jakub Drbal
 *  \email  support@codasip.com
 *  \date   Tue Nov 20 2018
 *  \brief  platform for instruction and data cache
 */

module codasip_idcache_platform_ahb_t #(
    // icache
    // number of ways/sets - associativity, default value is 4-way
    parameter integer ICACHE_NUM_WAYS         = 32'sd4,
    // cache size in bytes, default value is 16kB
    parameter integer ICACHE_SIZE             = 32'sd16384,
    // cache line size in bytes, default value is 32B
    parameter integer ICACHE_LINE_SIZE        = 32'sd32,
    // endianness, default value is BIG
    parameter [0:0]   ICACHE_IS_LITTLE        = 1'b0,
    // cache interface constants
    parameter integer ICACHE_ADDR_BITS        = 32'sd32, // address bit-width
    parameter integer ICACHE_DATA_BITS        = 32'sd32, // data bit-width
    // master interface constants
    parameter integer ICACHE_MASTER_ADDR_BITS = 32'sd32, // address bit-width
    parameter integer ICACHE_MASTER_DATA_BITS = 32'sd32, // data bit-width
    // cache sram interface constants
    parameter integer ICACHE_SRAM_ADDR_BITS   = 32'sd7,
    parameter integer ICACHE_SRAM_TAG_BITS    = 32'sd21,
    // dcache
    // number of ways/sets - associativity, default value is 4-way
    parameter integer DCACHE_NUM_WAYS         = 32'sd4,
    // cache size in bytes, default value is 16kB
    parameter integer DCACHE_SIZE             = 32'sd16384,
    // cache line size in bytes, default value is 32B
    parameter integer DCACHE_LINE_SIZE        = 32'sd32,
    // endianness, default value is BIG
    parameter [0:0]   DCACHE_IS_LITTLE        = 1'b0,
    // cache interface constants
    parameter integer DCACHE_ADDR_BITS        = 32'sd32, // address bit-width
    parameter integer DCACHE_DATA_BITS        = 32'sd32, // data bit-width
    // master interface constants
    parameter integer DCACHE_MASTER_ADDR_BITS = 32'sd32, // address bit-width
    parameter integer DCACHE_MASTER_DATA_BITS = 32'sd32, // data bit-width
    // cache sram interface constants
    parameter integer DCACHE_SRAM_ADDR_BITS   = 32'sd7,
    parameter integer DCACHE_SRAM_TAG_BITS    = 32'sd21,
    // common
    // active level of reset
    parameter [0:0] RESET_LEVEL = 1'b0,
    // synchronous reset
    parameter [0:0] RESET_SYNC  = 1'b1,
    // control/status unit base address
    parameter [DCACHE_ADDR_BITS-1:0] CSU_BASE_ADDR = {DCACHE_ADDR_BITS{1'b0}}
)(
    input wire                                             CLK,
    input wire                                             RST,
    // WFI busy
    output wire                                            WFI_BUSY,
    // eviction error
    output wire                                            EVICTION_ERROR,
    // icache AHB interface
    input wire [ICACHE_ADDR_BITS-1:0]                      ICACHE_HADDR,
    input wire [2:0]                                       ICACHE_HBURST,
    input wire                                             ICACHE_HMASTLOCK,
    input wire [3:0]                                       ICACHE_HPROT,
    input wire [2:0]                                       ICACHE_HSIZE,
    input wire [1:0]                                       ICACHE_HTRANS,
    input wire                                             ICACHE_HWRITE,
    input wire                                             ICACHE_HREADY,
    input wire                                             ICACHE_HSEL,
    output wire [ICACHE_DATA_BITS-1:0]                     ICACHE_HRDATA,
    output wire                                            ICACHE_HREADYOUT,
    output wire                                            ICACHE_HRESP,
    // dcache AHB interface
    input wire [DCACHE_ADDR_BITS-1:0]                      DCACHE_HADDR,
    input wire [2:0]                                       DCACHE_HBURST,
    input wire                                             DCACHE_HMASTLOCK,
    input wire [3:0]                                       DCACHE_HPROT,
    input wire [2:0]                                       DCACHE_HSIZE,
    input wire [1:0]                                       DCACHE_HTRANS,
    input wire [DCACHE_DATA_BITS-1:0]                      DCACHE_HWDATA,
    input wire                                             DCACHE_HWRITE,
    input wire                                             DCACHE_HREADY,
    input wire                                             DCACHE_HSEL,
    output wire [DCACHE_DATA_BITS-1:0]                     DCACHE_HRDATA,
    output wire                                            DCACHE_HREADYOUT,
    output wire                                            DCACHE_HRESP,
    // AHB read-only icache interface connected to memory
    output wire [ICACHE_MASTER_ADDR_BITS -1:0]             ICACHE_MASTER_HADDR,
    output wire [2:0]                                      ICACHE_MASTER_HBURST,
    output wire                                            ICACHE_MASTER_HMASTLOCK,
    output wire [3:0]                                      ICACHE_MASTER_HPROT,
    output wire [2:0]                                      ICACHE_MASTER_HSIZE,
    output wire [1:0]                                      ICACHE_MASTER_HTRANS,
    output wire                                            ICACHE_MASTER_HWRITE,
    input wire [ICACHE_MASTER_DATA_BITS -1:0]              ICACHE_MASTER_HRDATA,
    input wire                                             ICACHE_MASTER_HREADY,
    input wire                                             ICACHE_MASTER_HRESP,
    // AHB read/write dcache interface connected to memory
    output wire [DCACHE_MASTER_ADDR_BITS -1:0]             DCACHE_MASTER_HADDR,
    output wire [2:0]                                      DCACHE_MASTER_HBURST,
    output wire                                            DCACHE_MASTER_HMASTLOCK,
    output wire [3:0]                                      DCACHE_MASTER_HPROT,
    output wire [2:0]                                      DCACHE_MASTER_HSIZE,
    output wire [1:0]                                      DCACHE_MASTER_HTRANS,
    output wire [DCACHE_MASTER_DATA_BITS -1:0]             DCACHE_MASTER_HWDATA,
    output wire                                            DCACHE_MASTER_HWRITE,
    input wire [DCACHE_MASTER_DATA_BITS -1:0]              DCACHE_MASTER_HRDATA,
    input wire                                             DCACHE_MASTER_HREADY,
    input wire                                             DCACHE_MASTER_HRESP,
    // SRAM interface for TAG RAMs
    output wire                                            ICACHE_SRAM_TAG_CS,
    output wire                                            ICACHE_SRAM_TAG_RW,
    output wire [ICACHE_SRAM_ADDR_BITS-1:0]                ICACHE_SRAM_TAG_A,
    output wire [ICACHE_NUM_WAYS-1:0]                      ICACHE_SRAM_TAG_WSTRB,
    output wire [ICACHE_NUM_WAYS*ICACHE_SRAM_TAG_BITS-1:0] ICACHE_SRAM_TAG_WDATA,
    input wire  [ICACHE_NUM_WAYS*ICACHE_SRAM_TAG_BITS-1:0] ICACHE_SRAM_TAG_RDATA,
    // SRAM interface for DATA RAMs (cache lines)
    output wire                                            ICACHE_SRAM_LINE_DATA_CS,
    output wire                                            ICACHE_SRAM_LINE_DATA_RW,
    output wire [ICACHE_SRAM_ADDR_BITS-1:0]                ICACHE_SRAM_LINE_DATA_A,
    output wire [ICACHE_NUM_WAYS*ICACHE_LINE_SIZE-1:0]     ICACHE_SRAM_LINE_DATA_WSTRB,
    output wire [ICACHE_NUM_WAYS*ICACHE_LINE_SIZE*8-1:0]   ICACHE_SRAM_LINE_DATA_WDATA,
    input wire  [ICACHE_NUM_WAYS*ICACHE_LINE_SIZE*8-1:0]   ICACHE_SRAM_LINE_DATA_RDATA,
    // SRAM interface for TAG RAMs
    output wire                                            DCACHE_SRAM_TAG_CS,
    output wire                                            DCACHE_SRAM_TAG_RW,
    output wire [DCACHE_SRAM_ADDR_BITS-1:0]                DCACHE_SRAM_TAG_A,
    output wire [DCACHE_NUM_WAYS-1:0]                      DCACHE_SRAM_TAG_WSTRB,
    output wire [DCACHE_NUM_WAYS*DCACHE_SRAM_TAG_BITS-1:0] DCACHE_SRAM_TAG_WDATA,
    input wire  [DCACHE_NUM_WAYS*DCACHE_SRAM_TAG_BITS-1:0] DCACHE_SRAM_TAG_RDATA,
    // SRAM interface for DATA RAMs (cache lines)
    output wire                                            DCACHE_SRAM_LINE_DATA_CS,
    output wire                                            DCACHE_SRAM_LINE_DATA_RW,
    output wire [DCACHE_SRAM_ADDR_BITS-1:0]                DCACHE_SRAM_LINE_DATA_A,
    output wire [DCACHE_NUM_WAYS*DCACHE_LINE_SIZE-1:0]     DCACHE_SRAM_LINE_DATA_WSTRB,
    output wire [DCACHE_NUM_WAYS*DCACHE_LINE_SIZE*8-1:0]   DCACHE_SRAM_LINE_DATA_WDATA,
    input wire  [DCACHE_NUM_WAYS*DCACHE_LINE_SIZE*8-1:0]   DCACHE_SRAM_LINE_DATA_RDATA,
    // SRAM interface for TAG RAMs
    output wire                                            DCACHE_SRAM_DIRTY_CS,
    output wire                                            DCACHE_SRAM_DIRTY_RW,
    output wire [DCACHE_SRAM_ADDR_BITS-1:0]                DCACHE_SRAM_DIRTY_A,
    output wire [DCACHE_NUM_WAYS-1:0]                      DCACHE_SRAM_DIRTY_WSTRB,
    output wire [DCACHE_NUM_WAYS-1:0]                      DCACHE_SRAM_DIRTY_WDATA,
    input wire  [DCACHE_NUM_WAYS-1:0]                      DCACHE_SRAM_DIRTY_RDATA
);

    // pragma coverage off
    // VCS coverage off
    // logarithm to the base of 2
    function integer log2;
        input [31:0] value;
        integer res;
    begin
        for (res = 0; value > 1; res = res + 1) begin
            value = value >> 1;
        end
        log2 = res;
    end
    endfunction

    // logarithm to the base of 2 (1 returns 1)
    function integer log2x;
        input [31:0] value;
        integer res;
    begin
        if (value == 32'd1) begin
            res = 32'd1;
        end else begin
            res = log2(value);
        end
        log2x = res;
    end
    endfunction
    // pragma coverage on
    // VCS coverage on

    // pragma translate_off
    function automatic [0:0] codasip_onehot;
        input [31:0] value;
        integer ii;
        integer count;
    begin
        count = 32'sd0;
        for (ii = 32'sd0; ii < 32'sd32; ii = ii + 32'sd1) begin
            count = count + $signed({31'b0,value[ii]});
        end
        codasip_onehot = (count == 32'sd1);
    end
    endfunction // codasip_onehot
    // pragma translate_on

    // icache constants
    localparam integer ICACHE_TAG_BITS = ICACHE_ADDR_BITS - log2(ICACHE_SIZE / ICACHE_NUM_WAYS);
    localparam integer ICACHE_INDEX_BITS = log2x((ICACHE_SIZE / ICACHE_LINE_SIZE) / ICACHE_NUM_WAYS);

    // dcache constants
    localparam integer DCACHE_TAG_BITS = DCACHE_ADDR_BITS - log2(DCACHE_SIZE / DCACHE_NUM_WAYS);
    localparam integer DCACHE_INDEX_BITS = log2x((DCACHE_SIZE / DCACHE_LINE_SIZE) / DCACHE_NUM_WAYS);

    // dcache signals
    wire                        csout_hreadyin;
    wire [DCACHE_DATA_BITS-1:0] csout_hrdata;
    wire                        csout_hreadyout;
    wire                        csout_hresp;
    wire                        cs_wfi_busy;

    // control signals
    wire [1:0]                   icache_cs_req;
    wire                         icache_cs_reqval;
    wire [ICACHE_TAG_BITS-1:0]   icache_cs_tag;
    wire [ICACHE_INDEX_BITS-1:0] icache_cs_index;
    wire                         icache_cs_done;
    wire                         icache_cs_hreadyout;
    wire                         icache_cs_hit;
    wire                         icache_cs_mis;
    wire                         icache_wfi_busy;

    wire [2:0]                   dcache_cs_req;
    wire                         dcache_cs_reqval;
    wire [DCACHE_TAG_BITS-1:0]   dcache_cs_tag;
    wire [DCACHE_INDEX_BITS-1:0] dcache_cs_index;
    wire [3:0]                   dcache_cs_hprot;
    wire                         dcache_cs_hmastlock;
    wire                         dcache_cs_done;
    wire                         dcache_cs_wt;
    wire                         dcache_cs_csr;
    wire                         dcache_cs_hit;
    wire                         dcache_cs_mis;
    wire                         dcache_cs_mem_error;
    wire                         dcache_wfi_busy;

    assign WFI_BUSY = icache_wfi_busy | dcache_wfi_busy | cs_wfi_busy;

    codasip_idcache_csu #(
        .ICACHE_SIZE(ICACHE_SIZE),
        .ICACHE_NUM_WAYS(ICACHE_NUM_WAYS),
        .ICACHE_LINE_SIZE(ICACHE_LINE_SIZE),
        .ICACHE_TAG_BITS(ICACHE_TAG_BITS),
        .ICACHE_INDEX_BITS(ICACHE_INDEX_BITS),
        .DCACHE_SIZE(DCACHE_SIZE),
        .DCACHE_NUM_WAYS(DCACHE_NUM_WAYS),
        .DCACHE_LINE_SIZE(DCACHE_LINE_SIZE),
        .DCACHE_TAG_BITS(DCACHE_TAG_BITS),
        .DCACHE_INDEX_BITS(DCACHE_INDEX_BITS),
        .CACHE_ADDR_BITS(DCACHE_ADDR_BITS),
        .CACHE_DATA_BITS(DCACHE_DATA_BITS),
        .CSU_BASE_ADDR(CSU_BASE_ADDR),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    )
    i_codasip_idcache_csu (
        .CLK(CLK),
        .RST(RST),
        .WFI_BUSY(cs_wfi_busy),
        .EVICTION_ERROR(EVICTION_ERROR),
        .CSIN_HADDR(DCACHE_HADDR),
        .CSIN_HMASTLOCK(DCACHE_HMASTLOCK),
        .CSIN_HPROT(DCACHE_HPROT),
        .CSIN_HSIZE(DCACHE_HSIZE),
        .CSIN_HTRANS(DCACHE_HTRANS),
        .CSIN_HWDATA(DCACHE_HWDATA),
        .CSIN_HWRITE(DCACHE_HWRITE),
        .CSIN_HREADYIN(DCACHE_HREADY),
        .CSIN_HSEL(DCACHE_HSEL),
        .CSIN_HRDATA(DCACHE_HRDATA),
        .CSIN_HREADYOUT(DCACHE_HREADYOUT),
        .CSIN_HRESP(DCACHE_HRESP),
        .CSOUT_HREADYIN(csout_hreadyin),
        .CSOUT_HRDATA(csout_hrdata),
        .CSOUT_HREADYOUT(csout_hreadyout),
        .CSOUT_HRESP(csout_hresp),
        .ICACHE_CS_REQ(icache_cs_req),
        .ICACHE_CS_REQVAL(icache_cs_reqval),
        .ICACHE_CS_TAG(icache_cs_tag),
        .ICACHE_CS_INDEX(icache_cs_index),
        .ICACHE_CS_DONE(icache_cs_done),
        .ICACHE_CS_HIT(icache_cs_hit),
        .ICACHE_CS_MIS(icache_cs_mis),
        .DCACHE_CS_REQ(dcache_cs_req),
        .DCACHE_CS_REQVAL(dcache_cs_reqval),
        .DCACHE_CS_TAG(dcache_cs_tag),
        .DCACHE_CS_INDEX(dcache_cs_index),
        .DCACHE_CS_HPROT(dcache_cs_hprot),
        .DCACHE_CS_HMASTLOCK(dcache_cs_hmastlock),
        .DCACHE_CS_DONE(dcache_cs_done),
        .DCACHE_CS_WT(dcache_cs_wt),
        .DCACHE_CS_CSR(dcache_cs_csr),
        .DCACHE_CS_HIT(dcache_cs_hit),
        .DCACHE_CS_MIS(dcache_cs_mis),
        .DCACHE_CS_MEM_ERROR(dcache_cs_mem_error)
    );

    assign ICACHE_HREADYOUT = icache_cs_hreadyout;

    codasip_icache_ahb_t #(
        .ICACHE_MASTER_ADDR_BITS(ICACHE_MASTER_ADDR_BITS),
        .ICACHE_MASTER_DATA_BITS(ICACHE_MASTER_DATA_BITS),
        .ICACHE_TAG_BITS(ICACHE_TAG_BITS),
        .ICACHE_INDEX_BITS(ICACHE_INDEX_BITS),
        .ICACHE_ADDR_BITS(ICACHE_ADDR_BITS),
        .ICACHE_DATA_BITS(ICACHE_DATA_BITS),
        .ICACHE_NUM_WAYS(ICACHE_NUM_WAYS),
        .ICACHE_SIZE(ICACHE_SIZE),
        .ICACHE_LINE_SIZE(ICACHE_LINE_SIZE),
        .ICACHE_IS_LITTLE(ICACHE_IS_LITTLE),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    )
    i_codasip_icache_t (
        .CLK(CLK),
        .RST(RST),
        .ICACHE_HADDR(ICACHE_HADDR),
        .ICACHE_HBURST(ICACHE_HBURST),
        .ICACHE_HMASTLOCK(ICACHE_HMASTLOCK),
        .ICACHE_HPROT(ICACHE_HPROT),
        .ICACHE_HSIZE(ICACHE_HSIZE),
        .ICACHE_HTRANS(ICACHE_HTRANS),
        .ICACHE_HWRITE(ICACHE_HWRITE),
        .ICACHE_HREADY(ICACHE_HREADY),
        .ICACHE_HSEL(ICACHE_HSEL),
        .ICACHE_HRDATA(ICACHE_HRDATA),
        .ICACHE_HREADYOUT(icache_cs_hreadyout),
        .ICACHE_HRESP(ICACHE_HRESP),
        .CS_REQ(icache_cs_req),
        .CS_REQVAL(icache_cs_reqval),
        .CS_TAG(icache_cs_tag),
        .CS_INDEX(icache_cs_index),
        .CS_DONE(icache_cs_done),
        .CS_HIT(icache_cs_hit),
        .CS_MIS(icache_cs_mis),
        .WFI_BUSY(icache_wfi_busy),
        .ICACHE_MASTER_HADDR(ICACHE_MASTER_HADDR),
        .ICACHE_MASTER_HBURST(ICACHE_MASTER_HBURST),
        .ICACHE_MASTER_HMASTLOCK(ICACHE_MASTER_HMASTLOCK),
        .ICACHE_MASTER_HPROT(ICACHE_MASTER_HPROT),
        .ICACHE_MASTER_HSIZE(ICACHE_MASTER_HSIZE),
        .ICACHE_MASTER_HTRANS(ICACHE_MASTER_HTRANS),
        .ICACHE_MASTER_HWRITE(ICACHE_MASTER_HWRITE),
        .ICACHE_MASTER_HRDATA(ICACHE_MASTER_HRDATA),
        .ICACHE_MASTER_HREADY(ICACHE_MASTER_HREADY),
        .ICACHE_MASTER_HRESP(ICACHE_MASTER_HRESP),
        .ICACHE_SRAM_TAG_CS(ICACHE_SRAM_TAG_CS),
        .ICACHE_SRAM_TAG_RW(ICACHE_SRAM_TAG_RW),
        .ICACHE_SRAM_TAG_A(ICACHE_SRAM_TAG_A),
        .ICACHE_SRAM_TAG_WSTRB(ICACHE_SRAM_TAG_WSTRB),
        .ICACHE_SRAM_TAG_WDATA(ICACHE_SRAM_TAG_WDATA),
        .ICACHE_SRAM_TAG_RDATA(ICACHE_SRAM_TAG_RDATA),
        .ICACHE_SRAM_LINE_DATA_CS(ICACHE_SRAM_LINE_DATA_CS),
        .ICACHE_SRAM_LINE_DATA_RW(ICACHE_SRAM_LINE_DATA_RW),
        .ICACHE_SRAM_LINE_DATA_A(ICACHE_SRAM_LINE_DATA_A),
        .ICACHE_SRAM_LINE_DATA_WSTRB(ICACHE_SRAM_LINE_DATA_WSTRB),
        .ICACHE_SRAM_LINE_DATA_WDATA(ICACHE_SRAM_LINE_DATA_WDATA),
        .ICACHE_SRAM_LINE_DATA_RDATA(ICACHE_SRAM_LINE_DATA_RDATA)
    );

    codasip_dcache_ahb_t #(
        .DCACHE_MASTER_ADDR_BITS(DCACHE_MASTER_ADDR_BITS),
        .DCACHE_MASTER_DATA_BITS(DCACHE_MASTER_DATA_BITS),
        .DCACHE_TAG_BITS(DCACHE_TAG_BITS),
        .DCACHE_INDEX_BITS(DCACHE_INDEX_BITS),
        .DCACHE_ADDR_BITS(DCACHE_ADDR_BITS),
        .DCACHE_DATA_BITS(DCACHE_DATA_BITS),
        .DCACHE_NUM_WAYS(DCACHE_NUM_WAYS),
        .DCACHE_SIZE(DCACHE_SIZE),
        .DCACHE_LINE_SIZE(DCACHE_LINE_SIZE),
        .DCACHE_IS_LITTLE(DCACHE_IS_LITTLE),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    )
    i_codasip_dcache_t (
        .CLK(CLK),
        .RST(RST),
        .DCACHE_HADDR(DCACHE_HADDR),
        .DCACHE_HBURST(DCACHE_HBURST),
        .DCACHE_HMASTLOCK(DCACHE_HMASTLOCK),
        .DCACHE_HPROT(DCACHE_HPROT),
        .DCACHE_HSIZE(DCACHE_HSIZE),
        .DCACHE_HTRANS(DCACHE_HTRANS),
        .DCACHE_HWDATA(DCACHE_HWDATA),
        .DCACHE_HWRITE(DCACHE_HWRITE),
        .DCACHE_HREADY(csout_hreadyin),
        .DCACHE_HSEL(DCACHE_HSEL),
        .DCACHE_HRDATA(csout_hrdata),
        .DCACHE_HREADYOUT(csout_hreadyout),
        .DCACHE_HRESP(csout_hresp),
        .CS_REQ(dcache_cs_req),
        .CS_REQVAL(dcache_cs_reqval),
        .CS_TAG(dcache_cs_tag),
        .CS_INDEX(dcache_cs_index),
        .CS_HPROT(dcache_cs_hprot),
        .CS_HMASTLOCK(dcache_cs_hmastlock),
        .CS_DONE(dcache_cs_done),
        .CS_WT(dcache_cs_wt),
        .CS_CSR(dcache_cs_csr),
        .CS_HIT(dcache_cs_hit),
        .CS_MIS(dcache_cs_mis),
        .CS_MEM_ERROR(dcache_cs_mem_error),
        .WFI_BUSY(dcache_wfi_busy),
        .DCACHE_MASTER_HADDR(DCACHE_MASTER_HADDR),
        .DCACHE_MASTER_HBURST(DCACHE_MASTER_HBURST),
        .DCACHE_MASTER_HMASTLOCK(DCACHE_MASTER_HMASTLOCK),
        .DCACHE_MASTER_HPROT(DCACHE_MASTER_HPROT),
        .DCACHE_MASTER_HSIZE(DCACHE_MASTER_HSIZE),
        .DCACHE_MASTER_HTRANS(DCACHE_MASTER_HTRANS),
        .DCACHE_MASTER_HWDATA(DCACHE_MASTER_HWDATA),
        .DCACHE_MASTER_HWRITE(DCACHE_MASTER_HWRITE),
        .DCACHE_MASTER_HRDATA(DCACHE_MASTER_HRDATA),
        .DCACHE_MASTER_HREADY(DCACHE_MASTER_HREADY),
        .DCACHE_MASTER_HRESP(DCACHE_MASTER_HRESP),
        .DCACHE_SRAM_TAG_CS(DCACHE_SRAM_TAG_CS),
        .DCACHE_SRAM_TAG_RW(DCACHE_SRAM_TAG_RW),
        .DCACHE_SRAM_TAG_A(DCACHE_SRAM_TAG_A),
        .DCACHE_SRAM_TAG_WSTRB(DCACHE_SRAM_TAG_WSTRB),
        .DCACHE_SRAM_TAG_WDATA(DCACHE_SRAM_TAG_WDATA),
        .DCACHE_SRAM_TAG_RDATA(DCACHE_SRAM_TAG_RDATA),
        .DCACHE_SRAM_LINE_DATA_CS(DCACHE_SRAM_LINE_DATA_CS),
        .DCACHE_SRAM_LINE_DATA_RW(DCACHE_SRAM_LINE_DATA_RW),
        .DCACHE_SRAM_LINE_DATA_A(DCACHE_SRAM_LINE_DATA_A),
        .DCACHE_SRAM_LINE_DATA_WSTRB(DCACHE_SRAM_LINE_DATA_WSTRB),
        .DCACHE_SRAM_LINE_DATA_WDATA(DCACHE_SRAM_LINE_DATA_WDATA),
        .DCACHE_SRAM_LINE_DATA_RDATA(DCACHE_SRAM_LINE_DATA_RDATA),
        .DCACHE_SRAM_DIRTY_CS(DCACHE_SRAM_DIRTY_CS),
        .DCACHE_SRAM_DIRTY_RW(DCACHE_SRAM_DIRTY_RW),
        .DCACHE_SRAM_DIRTY_A(DCACHE_SRAM_DIRTY_A),
        .DCACHE_SRAM_DIRTY_WSTRB(DCACHE_SRAM_DIRTY_WSTRB),
        .DCACHE_SRAM_DIRTY_WDATA(DCACHE_SRAM_DIRTY_WDATA),
        .DCACHE_SRAM_DIRTY_RDATA(DCACHE_SRAM_DIRTY_RDATA)
    );

    // pragma translate_off
    initial begin
        if ((ICACHE_NUM_WAYS != 32'sd1) && (ICACHE_NUM_WAYS != 32'sd2) && (ICACHE_NUM_WAYS != 32'sd4) && (ICACHE_NUM_WAYS != 32'sd8) && (ICACHE_NUM_WAYS != 32'sd16)) begin
            $display("Fatal error in '%m' cache configuration, ICACHE number of ways must be 1, 2, 4, 8 or 16, actual value=%0d!", ICACHE_NUM_WAYS);
            $finish(32'd2);
        end

        if (!codasip_onehot(ICACHE_SIZE) || (ICACHE_SIZE < 32'sd2048) || (ICACHE_SIZE > 32'sd262144)) begin
            $display("Fatal error in '%m' cache configuration, ICACHE size must be a power of two and between 0x800 and 0x40000, actual value=0x%0h!", ICACHE_SIZE);
            $finish(32'd2);
        end

        if (!codasip_onehot(ICACHE_LINE_SIZE) || (ICACHE_LINE_SIZE < (32'sd4*(ICACHE_DATA_BITS/32'sd8))) || (ICACHE_LINE_SIZE > (32'sd16*(ICACHE_DATA_BITS/32'sd8)))) begin
            $display("Fatal error in '%m' cache configuration, ICACHE line size must be a power of two and between 4 and 16 multiple of ICACHE slave data, actual value=%0d!", ICACHE_LINE_SIZE);
            $finish(32'd2);
        end

        if ((ICACHE_ADDR_BITS < 32'sd32) || (ICACHE_ADDR_BITS > 32'sd64)) begin
            $display("Fatal error in '%m' cache configuration, ICACHE slave address width must be between 32 and 64, actual value=%0d!", ICACHE_ADDR_BITS);
            $finish(32'd2);
        end

        if (!codasip_onehot(ICACHE_DATA_BITS) || (ICACHE_DATA_BITS < 32'sd32) || (ICACHE_DATA_BITS > 32'sd1024)) begin
            $display("Fatal error in '%m' cache configuration, ICACHE slave data width must be a power of two and between 32 and 1024, actual value=%0d!", ICACHE_DATA_BITS);
            $finish(32'd2);
        end

        if (DCACHE_DATA_BITS < ICACHE_ADDR_BITS) begin
            $display("Fatal error in '%m' cache configuration, DCACHE slave data must be equal or wider than ICACHE slave address!");
            $finish(32'd2);
        end

        if (((ICACHE_MASTER_ADDR_BITS < 32'sd32) || (ICACHE_MASTER_ADDR_BITS > 32'sd64)) || (ICACHE_MASTER_ADDR_BITS < ICACHE_ADDR_BITS)) begin
            $display("Fatal error in '%m' cache configuration, ICACHE master address width must be between 32 and 64 and wider or equal to ICACHE slave address, actual value=%0d!", ICACHE_MASTER_ADDR_BITS);
            $finish(32'd2);
        end

        if (!codasip_onehot(ICACHE_MASTER_DATA_BITS) || (ICACHE_MASTER_DATA_BITS < 32'sd32) || (ICACHE_MASTER_DATA_BITS > 32'sd1024)) begin
            $display("Fatal error in '%m' cache configuration, ICACHE master data width must be a power of two and between 32 and 1024, actual value=%0d!", ICACHE_MASTER_DATA_BITS);
            $finish(32'd2);
        end

        if (ICACHE_MASTER_DATA_BITS < ICACHE_DATA_BITS) begin
            $display("Fatal error in '%m' cache configuration, ICACHE master data must be equal or wider than ICACHE slave data!");
            $finish(32'd2);
        end

        if ((ICACHE_LINE_SIZE != (ICACHE_MASTER_DATA_BITS/32'sd8)) && (ICACHE_LINE_SIZE != (32'sd4*(ICACHE_MASTER_DATA_BITS/32'sd8))) && (ICACHE_LINE_SIZE != (32'sd8*(ICACHE_MASTER_DATA_BITS/32'sd8))) && (ICACHE_LINE_SIZE != (32'sd16*(ICACHE_MASTER_DATA_BITS/32'sd8)))) begin
            $display("Fatal error in '%m' cache configuration, ICACHE line size must be a 1, 4, 8 or 16 multiple of ICACHE master data!");
            $finish(32'd2);
        end

        if (ICACHE_SRAM_ADDR_BITS != log2((ICACHE_SIZE/ICACHE_LINE_SIZE)/ICACHE_NUM_WAYS)) begin
            $display("Fatal error in '%m' cache configuration, ICACHE SRAM address width must be equal to ICACHE line index width, which is %0d, actual value=%0d!", log2((ICACHE_SIZE/ICACHE_LINE_SIZE)/ICACHE_NUM_WAYS), ICACHE_SRAM_ADDR_BITS);
            $finish(32'd2);
        end

        if (ICACHE_SRAM_TAG_BITS != (ICACHE_ADDR_BITS-log2(ICACHE_SIZE/ICACHE_NUM_WAYS)+32'sd1)) begin
            $display("Fatal error in '%m' cache configuration, ICACHE SRAM tag width must be equal to ICACHE tag width with valid bit, which is %0d, actual value=%0d!", (ICACHE_ADDR_BITS-log2(ICACHE_SIZE/ICACHE_NUM_WAYS)+32'sd1), ICACHE_SRAM_TAG_BITS);
            $finish(32'd2);
        end

        if ((DCACHE_NUM_WAYS != 32'sd1) && (DCACHE_NUM_WAYS != 32'sd2) && (DCACHE_NUM_WAYS != 32'sd4) && (DCACHE_NUM_WAYS != 32'sd8) && (DCACHE_NUM_WAYS != 32'sd16)) begin
            $display("Fatal error in '%m' cache configuration, DCACHE number of ways must be 1, 2, 4, 8 or 16, actual value=%0d!", DCACHE_NUM_WAYS);
            $finish(32'd2);
        end

        if (!codasip_onehot(DCACHE_SIZE) || (DCACHE_SIZE < 32'sd2048) || (DCACHE_SIZE > 32'sd262144)) begin
            $display("Fatal error in '%m' cache configuration, DCACHE size must be a power of two and between 0x800 and 20x40000, actual value=0x%0h!", DCACHE_SIZE);
            $finish(32'd2);
        end

        if (!codasip_onehot(DCACHE_LINE_SIZE) || (DCACHE_LINE_SIZE < (32'sd4*(DCACHE_DATA_BITS/32'sd8))) || (DCACHE_LINE_SIZE > (32'sd16*(DCACHE_DATA_BITS/32'sd8)))) begin
            $display("Fatal error in '%m' cache configuration, DCACHE line size must be a power of two and between 4 and 16 multiple of DCACHE slave data, actual value=%0d!", DCACHE_LINE_SIZE);
            $finish(32'd2);
        end

        if ((DCACHE_ADDR_BITS < 32'sd32) || (DCACHE_ADDR_BITS > 32'sd64)) begin
            $display("Fatal error in '%m' cache configuration, DCACHE slave address width must be between 32 and 64, actual value=%0d!", DCACHE_ADDR_BITS);
            $finish(32'd2);
        end

        if (!codasip_onehot(DCACHE_DATA_BITS) || (DCACHE_DATA_BITS < 32'sd32) || (DCACHE_DATA_BITS > 32'sd1024)) begin
            $display("Fatal error in '%m' cache configuration, DCACHE slave data width must be a power of two and between 32 and 1024, actual value=%0d!", DCACHE_DATA_BITS);
            $finish(32'd2);
        end

        if (DCACHE_DATA_BITS < DCACHE_ADDR_BITS) begin
            $display("Fatal error in '%m' cache configuration, DCACHE slave data must be equal or wider than DCACHE slave address!");
            $finish(32'd2);
        end

        if (((DCACHE_MASTER_ADDR_BITS < 32'sd32) || (DCACHE_MASTER_ADDR_BITS > 32'sd64)) || (DCACHE_MASTER_ADDR_BITS < DCACHE_ADDR_BITS)) begin
            $display("Fatal error in '%m' cache configuration, DCACHE master address width must be between 32 and 64 and wider or equal to DCACHE slave address, actual value=%0d!", DCACHE_MASTER_ADDR_BITS);
            $finish(32'd2);
        end

        if (!codasip_onehot(DCACHE_MASTER_DATA_BITS) || (DCACHE_MASTER_DATA_BITS < 32'sd32) || (DCACHE_MASTER_DATA_BITS > 32'sd1024)) begin
            $display("Fatal error in '%m' cache configuration, DCACHE master data width must be a power of two and between 32 and 1024, actual value=%0d!", DCACHE_MASTER_DATA_BITS);
            $finish(32'd2);
        end

        if (DCACHE_MASTER_DATA_BITS < DCACHE_DATA_BITS) begin
            $display("Fatal error in '%m' cache configuration, DCACHE master data must be equal or wider than DCACHE slave data!");
            $finish(32'd2);
        end

        if ((DCACHE_LINE_SIZE != (DCACHE_MASTER_DATA_BITS/32'sd8)) && (DCACHE_LINE_SIZE != (32'sd4*(DCACHE_MASTER_DATA_BITS/32'sd8))) && (DCACHE_LINE_SIZE != (32'sd8*(DCACHE_MASTER_DATA_BITS/32'sd8))) && (DCACHE_LINE_SIZE != (32'sd16*(DCACHE_MASTER_DATA_BITS/32'sd8)))) begin
            $display("Fatal error in '%m' cache configuration, DCACHE line size must be a 1, 4, 8 or 16 multiple of DCACHE master data!");
            $finish(32'd2);
        end

        if (DCACHE_SRAM_ADDR_BITS != log2((DCACHE_SIZE/DCACHE_LINE_SIZE)/DCACHE_NUM_WAYS)) begin
            $display("Fatal error in '%m' cache configuration, DCACHE SRAM address width must be equal to DCACHE line index width, which is %0d, actual value=%0d!", log2((DCACHE_SIZE/DCACHE_LINE_SIZE)/DCACHE_NUM_WAYS), DCACHE_SRAM_ADDR_BITS);
            $finish(32'd2);
        end

        if (DCACHE_SRAM_TAG_BITS != (DCACHE_ADDR_BITS-log2(DCACHE_SIZE/DCACHE_NUM_WAYS)+32'sd1)) begin
            $display("Fatal error in '%m' cache configuration, DCACHE SRAM tag width must be equal to DCACHE tag width with valid bit, which is %0d, actual value=%0d!", (DCACHE_ADDR_BITS-log2(DCACHE_SIZE/DCACHE_NUM_WAYS)+32'sd1), DCACHE_SRAM_TAG_BITS);
            $finish(32'd2);
        end

        if ((CSU_BASE_ADDR%32'd1024 != 32'd0) || (CSU_BASE_ADDR%(32'sd128*(DCACHE_DATA_BITS/32'sd8)) != 32'd0)) begin
            $display("Fatal error in '%m' cache configuration, CSU base address must be aligned to max(1024, 0x80*bytes_per_word)!");
            $finish(32'd2);
        end
    end
    // pragma translate_on

endmodule
