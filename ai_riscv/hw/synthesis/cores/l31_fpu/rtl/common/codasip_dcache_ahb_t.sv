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
 *  \file   codasip_dcache_ahb_t.v
 *  \author Jakub Drbal
 *  \email  support@codasip.com
 *  \date   Wed Sep 2 2015
 *  \brief  data cache top module
 */

module codasip_dcache_ahb_t #(
    // master interface constants
    parameter integer DCACHE_MASTER_ADDR_BITS = 32'sd32, // address bit-width
    parameter integer DCACHE_MASTER_DATA_BITS = 32'sd16, // data bit-width
    // control status interface
    parameter integer DCACHE_TAG_BITS         = 32'sd21, // address bit-width
    parameter integer DCACHE_INDEX_BITS       = 32'sd7,  // write strobes bit-width
    // cache interface constants
    parameter integer DCACHE_ADDR_BITS        = 32'sd32, // address bit-width
    parameter integer DCACHE_DATA_BITS        = 32'sd16, // data bit-width
    // number of ways/sets - associativity, default value is 2-way
    parameter integer DCACHE_NUM_WAYS         = 32'sd2,
    // cache size in bytes, default value is 4kB
    parameter integer DCACHE_SIZE             = 32'sd4096,
    // cache line size in bytes, default value is 16B
    parameter integer DCACHE_LINE_SIZE        = 32'sd16,
    // endianness, default value is LITTLE
    parameter [0:0]   DCACHE_IS_LITTLE        = 1'b0,
    // active level of reset
    parameter [0:0]   RESET_LEVEL             = 1'b0,
    // synchronous reset
    parameter [0:0]   RESET_SYNC              = 1'b1
)(
    input wire                                            CLK,
    input wire                                            RST,
    // CLB interface
    input wire  [DCACHE_ADDR_BITS-1:0]                    DCACHE_HADDR,
    input wire  [2:0]                                     DCACHE_HBURST,
    input wire                                            DCACHE_HMASTLOCK,
    input wire  [3:0]                                     DCACHE_HPROT,
    input wire  [2:0]                                     DCACHE_HSIZE,
    input wire  [1:0]                                     DCACHE_HTRANS,
    input wire  [DCACHE_DATA_BITS-1:0]                    DCACHE_HWDATA,
    input wire                                            DCACHE_HWRITE,
    input wire                                            DCACHE_HREADY,
    input wire                                            DCACHE_HSEL,
    output wire [DCACHE_DATA_BITS-1:0]                    DCACHE_HRDATA,
    output wire                                           DCACHE_HREADYOUT,
    output wire                                           DCACHE_HRESP,
    // control status interface
    input wire  [2:0]                                     CS_REQ,
    input wire                                            CS_REQVAL,
    input wire  [DCACHE_TAG_BITS-1:0]                     CS_TAG,
    input wire  [DCACHE_INDEX_BITS-1:0]                   CS_INDEX,
    input wire  [3:0]                                     CS_HPROT,
    input wire                                            CS_HMASTLOCK,
    output wire                                           CS_DONE,
    input wire                                            CS_WT,
    input wire                                            CS_CSR,
    output wire                                           CS_HIT,
    output wire                                           CS_MIS,
    output wire                                           CS_MEM_ERROR,
    // WFI busy
    output wire                                           WFI_BUSY,
    // ahb read/write interface connected to memory
    output wire [DCACHE_MASTER_ADDR_BITS-1:0]             DCACHE_MASTER_HADDR,
    output wire [2:0]                                     DCACHE_MASTER_HBURST,
    output wire                                           DCACHE_MASTER_HMASTLOCK,
    output wire [3:0]                                     DCACHE_MASTER_HPROT,
    output wire [2:0]                                     DCACHE_MASTER_HSIZE,
    output wire [1:0]                                     DCACHE_MASTER_HTRANS,
    output wire [DCACHE_MASTER_DATA_BITS-1:0]             DCACHE_MASTER_HWDATA,
    output wire                                           DCACHE_MASTER_HWRITE,
    input wire  [DCACHE_MASTER_DATA_BITS-1:0]             DCACHE_MASTER_HRDATA,
    input wire                                            DCACHE_MASTER_HREADY,
    input wire                                            DCACHE_MASTER_HRESP,
    ////SRAM interfaces////
    // SRAM interface for TAG RAMs
    output wire                                           DCACHE_SRAM_TAG_CS,
    output wire                                           DCACHE_SRAM_TAG_RW,
    output wire [DCACHE_INDEX_BITS-1:0]                   DCACHE_SRAM_TAG_A,
    output wire [DCACHE_NUM_WAYS-1:0]                     DCACHE_SRAM_TAG_WSTRB,
    output wire [DCACHE_NUM_WAYS*(DCACHE_TAG_BITS+1)-1:0] DCACHE_SRAM_TAG_WDATA,
    input wire  [DCACHE_NUM_WAYS*(DCACHE_TAG_BITS+1)-1:0] DCACHE_SRAM_TAG_RDATA,
    // SRAM interface for DATA RAMs (cache lines)
    output wire                                           DCACHE_SRAM_LINE_DATA_CS,
    output wire                                           DCACHE_SRAM_LINE_DATA_RW,
    output wire [DCACHE_INDEX_BITS-1:0]                   DCACHE_SRAM_LINE_DATA_A,
    output wire [DCACHE_NUM_WAYS*DCACHE_LINE_SIZE-1:0]    DCACHE_SRAM_LINE_DATA_WSTRB,
    output wire [DCACHE_NUM_WAYS*DCACHE_LINE_SIZE*8-1:0]  DCACHE_SRAM_LINE_DATA_WDATA,
    input wire  [DCACHE_NUM_WAYS*DCACHE_LINE_SIZE*8-1:0]  DCACHE_SRAM_LINE_DATA_RDATA,
    // SRAM interface for Dirty bits
    output wire                                           DCACHE_SRAM_DIRTY_CS,
    output wire                                           DCACHE_SRAM_DIRTY_RW,
    output wire [DCACHE_INDEX_BITS-1:0]                   DCACHE_SRAM_DIRTY_A,
    output wire [DCACHE_NUM_WAYS-1:0]                     DCACHE_SRAM_DIRTY_WSTRB,
    output wire [DCACHE_NUM_WAYS-1:0]                     DCACHE_SRAM_DIRTY_WDATA,
    input wire  [DCACHE_NUM_WAYS-1:0]                     DCACHE_SRAM_DIRTY_RDATA
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
    // pragma coverage on
    // VCS coverage on

    // cache line bits in bytes
    localparam integer CACHE_LINE_BITS = DCACHE_LINE_SIZE*32'sd8;

    // number of lines per set/way
    localparam integer SET_LINE_COUNT = (DCACHE_SIZE / DCACHE_LINE_SIZE) / DCACHE_NUM_WAYS;

    // cache associativity
    localparam integer ASSOCIATIVITY = DCACHE_NUM_WAYS;

    // line size bits (offset bits)
    localparam integer OFFSET_BITS = log2(CACHE_LINE_BITS/DCACHE_DATA_BITS);
    
    // byte index bits
    localparam integer SBI_BITS = log2(DCACHE_DATA_BITS/32'sd8);

    // ucache signals
    wire [DCACHE_DATA_BITS-1:0]  uc_dp_datain;
    wire [DCACHE_DATA_BITS-1:0]  uc_dp_dataout;
    wire [DCACHE_TAG_BITS-1:0]   uc_dp_tag;
    wire [DCACHE_INDEX_BITS-1:0] uc_dp_index;
    wire [OFFSET_BITS-1:0]       uc_dp_offset;
    wire                         uc_dp_hit;
    wire                         uc_dp_aen;
    wire                         uc_dp_den;
    wire                         uc_dp_dwe;
    wire                         uc_dp_bwe;
    wire [(DCACHE_DATA_BITS/8)-1:0] uc_dp_ben;
    wire [CACHE_LINE_BITS-1:0]   uc_mp_datain;
    wire [CACHE_LINE_BITS-1:0]   uc_mp_dataout;
    wire [DCACHE_TAG_BITS-1:0]   uc_mp_tagin;
    wire [DCACHE_INDEX_BITS-1:0] uc_mp_indexin;
    wire                         uc_mp_hit;
    wire [ASSOCIATIVITY-1:0]     uc_mp_wayout;
    wire [DCACHE_TAG_BITS-1:0]   uc_mp_tagout;
    wire [DCACHE_INDEX_BITS-1:0] uc_mp_indexout;
    wire [ASSOCIATIVITY-1:0]     uc_mp_vbout;
    wire [ASSOCIATIVITY-1:0]     uc_mp_dbout;
    wire                         uc_mp_valid;
    wire                         uc_mp_aen;
    wire                         uc_mp_den;
    wire                         uc_mp_dwe;
    wire                         uc_mp_bwe;
    wire                         uc_mp_am;
    wire [ASSOCIATIVITY-1:0]     uc_mp_wayin;
    wire                         uc_mp_clr;
    wire [DCACHE_TAG_BITS-1:0]   uc_mp_tagwin;
    wire                         uc_mp_tagwe;
    wire                         uc_mp_dset;
    wire                         uc_mp_dclr;

    // switch signals
    wire                         swm_dp_statusin;
    wire                         swm_dp_ncreq;
    wire                         swm_dp_ncreqval;
    wire                         swm_dp_fereqval;
    wire                         swm_dp_dwe;
    wire [1:0]                   swm_dp_resp;
    wire                         swm_dp_respval;
    wire [DCACHE_DATA_BITS-1:0]  swm_dp_datain;
    wire [DCACHE_DATA_BITS-1:0]  swm_dp_dataout;
    wire                         swm_dp_dataoutval;
    wire [DCACHE_TAG_BITS-1:0]   swm_dp_tag;
    wire [DCACHE_INDEX_BITS-1:0] swm_dp_index;
    wire [OFFSET_BITS-1:0]       swm_dp_offset;
    wire [SBI_BITS-1:0]          swm_dp_sbi;
    wire [2:0]                   swm_dp_hsize;
    wire [3:0]                   swm_dp_hprot;
    wire                         swm_dp_hmastlock;

    // replacement controler signals
    wire                     rc_mp_en;
    wire [ASSOCIATIVITY-1:0] rc_mp_replway;

    // bus interface unit signals
    wire [CACHE_LINE_BITS-1:0]   lfb_dataout;
    wire                         lfb_dirtyflag;
    wire [DCACHE_TAG_BITS-1:0]   lfb_tagout;
    wire [DCACHE_INDEX_BITS-1:0] lfb_indexout;
    wire [3:0]                   lfb_hprotout;
    wire                         lfb_hmastlockout;
    wire                         lfb_full;
    wire                         lfb_clr;
    wire [CACHE_LINE_BITS-1:0]   eb_datain;
    wire [DCACHE_TAG_BITS-1:0]   eb_tagin;
    wire [DCACHE_INDEX_BITS-1:0] eb_indexin;
    wire [3:0]                   eb_hprotin;
    wire                         eb_hmastlockin;
    wire                         eb_empty;
    wire                         eb_clr;
    wire                         eb_we;
    wire                         evict_err;
    
    // WFI busy signals
    wire wfi_busy_mu;
    wire wfi_busy_pu;
    
    assign WFI_BUSY = wfi_busy_mu | wfi_busy_pu;
    assign CS_MEM_ERROR = evict_err;

    codasip_dcache_port_unit_ahb #(
        .CACHE_ADDR_BITS(DCACHE_ADDR_BITS),
        .CACHE_DATA_BITS(DCACHE_DATA_BITS),
        .TAG_BITS(DCACHE_TAG_BITS),
        .INDEX_BITS(DCACHE_INDEX_BITS),
        .OFFSET_BITS(OFFSET_BITS),
        .SBI_BITS(SBI_BITS),
        .CACHE_IS_LITTLE(DCACHE_IS_LITTLE),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    )
    i_dcache_port_unit_ahb (
        .CLK(CLK),
        .RST(RST),
        .WFI_BUSY(wfi_busy_pu),
        .CACHE_HADDR0(DCACHE_HADDR),
        .CACHE_HBURST0(DCACHE_HBURST),
        .CACHE_HMASTLOCK0(DCACHE_HMASTLOCK),
        .CACHE_HPROT0(DCACHE_HPROT),
        .CACHE_HSIZE0(DCACHE_HSIZE),
        .CACHE_HTRANS0(DCACHE_HTRANS),
        .CACHE_HWDATA0(DCACHE_HWDATA),
        .CACHE_HWRITE0(DCACHE_HWRITE),
        .CACHE_HREADYIN0(DCACHE_HREADY),
        .CACHE_HSEL0(DCACHE_HSEL),
        .CACHE_HRDATA0(DCACHE_HRDATA),
        .CACHE_HREADYOUT0(DCACHE_HREADYOUT),
        .CACHE_HRESP0(DCACHE_HRESP),
        .UC_DATAIN(uc_dp_dataout),
        .UC_DATAOUT(uc_dp_datain),
        .UC_TAG(uc_dp_tag),
        .UC_INDEX(uc_dp_index),
        .UC_OFFSET(uc_dp_offset),
        .UC_HIT(uc_dp_hit),
        .UC_AEN(uc_dp_aen),
        .UC_DEN(uc_dp_den),
        .UC_BEN(uc_dp_ben),
        .UC_DWE(uc_dp_dwe),
        .UC_BWE(uc_dp_bwe),
        .SWM_STATUSIN(swm_dp_statusin),
        .SWM_NCREQ(swm_dp_ncreq),
        .SWM_NCREQVAL(swm_dp_ncreqval),
        .SWM_FEREQVAL(swm_dp_fereqval),
        .SWM_DWE(swm_dp_dwe),
        .SWM_RESP(swm_dp_resp),
        .SWM_RESPVAL(swm_dp_respval),
        .SWM_TAG(swm_dp_tag),
        .SWM_INDEX(swm_dp_index),
        .SWM_OFFSET(swm_dp_offset),
        .SWM_SBI(swm_dp_sbi),
        .SWM_HSIZE(swm_dp_hsize),
        .SWM_HPROT(swm_dp_hprot),
        .SWM_HMASTLOCK(swm_dp_hmastlock),
        .SWM_DATAIN(swm_dp_dataout),
        .SWM_DATAINVAL(swm_dp_dataoutval),
        .SWM_DATAOUT(swm_dp_datain),
        .CC_WT(CS_WT),
        .CC_CSR(CS_CSR),
        .CC_HIT(CS_HIT),
        .CC_MIS(CS_MIS)
    );

    codasip_ucache #(
        .CACHE_DATA_BITS(DCACHE_DATA_BITS),
        .TAG_BITS(DCACHE_TAG_BITS),
        .INDEX_BITS(DCACHE_INDEX_BITS),
        .OFFSET_BITS(OFFSET_BITS),
        .ASSOCIATIVITY(ASSOCIATIVITY),
        .CACHE_LINE_BITS(CACHE_LINE_BITS),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    )
    i_ucache (
        .CLK(CLK),
        .RST(RST),
        .UC_DP_DATAIN(uc_dp_datain),
        .UC_DP_DATAOUT(uc_dp_dataout),
        .UC_DP_TAG(uc_dp_tag),
        .UC_DP_INDEX(uc_dp_index),
        .UC_DP_OFFSET(uc_dp_offset),
        .UC_DP_HIT(uc_dp_hit),
        .UC_DP_AEN(uc_dp_aen),
        .UC_DP_DEN(uc_dp_den),
        .UC_DP_BEN(uc_dp_ben),
        .UC_DP_DWE(uc_dp_dwe),
        .UC_DP_BWE(uc_dp_bwe),
        .UC_MP_DATAIN(uc_mp_datain),
        .UC_MP_DATAOUT(uc_mp_dataout),
        .UC_MP_TAGIN(uc_mp_tagin),
        .UC_MP_INDEXIN(uc_mp_indexin),
        .UC_MP_HIT(uc_mp_hit),
        .UC_MP_WAYOUT(uc_mp_wayout),
        .UC_MP_TAGOUT(uc_mp_tagout),
        .UC_MP_INDEXOUT(uc_mp_indexout),
        .UC_MP_VBOUT(uc_mp_vbout),
        .UC_MP_DBOUT(uc_mp_dbout),
        .UC_MP_VALID(uc_mp_valid),
        .UC_MP_AEN(uc_mp_aen),
        .UC_MP_DEN(uc_mp_den),
        .UC_MP_DWE(uc_mp_dwe),
        .UC_MP_BWE(uc_mp_bwe),
        .UC_MP_AM(uc_mp_am),
        .UC_MP_WAYIN(uc_mp_wayin),
        .UC_MP_CLR(uc_mp_clr),
        .UC_MP_TAGWIN(uc_mp_tagwin),
        .UC_MP_TAGWE(uc_mp_tagwe),
        .UC_MP_DSET(uc_mp_dset),
        .UC_MP_DCLR(uc_mp_dclr),
        .UC_CS_WT(CS_WT),
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

    codasip_replacement_policy_control #(
        .ASSOCIATIVITY(ASSOCIATIVITY),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    )
    i_replacement_policy_control (
        .CLK(CLK),
        .RST(RST),
        .RC_VBIN(uc_mp_vbout),
        .RC_MP_EN(rc_mp_en),
        .RC_MP_REPLWAY(rc_mp_replway)
    );

    codasip_dcache_maintenance_unit #(
        .TAG_BITS(DCACHE_TAG_BITS),
        .INDEX_BITS(DCACHE_INDEX_BITS),
        .ASSOCIATIVITY(ASSOCIATIVITY),
        .SET_LINE_COUNT(SET_LINE_COUNT),
        .CACHE_LINE_BITS(CACHE_LINE_BITS),
        .SEPARATE_RW_CHANNELS(1'b0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    )
    i_dcache_maintenance_unit (
        .CLK(CLK),
        .RST(RST),
        .WFI_BUSY(wfi_busy_mu),
        .CM_STATUSOUT(swm_dp_statusin),
        .CM_REQ(CS_REQ),
        .CM_REQVAL(CS_REQVAL),
        .CM_FEREQVAL(swm_dp_fereqval),
        .CM_TAGIN(CS_TAG),
        .CM_INDEXIN(CS_INDEX),
        .CM_HPROTIN(CS_HPROT),
        .CM_HMASTLOCKIN(CS_HMASTLOCK),
        .CM_DONE(CS_DONE),
        .LFB_DATAIN(lfb_dataout),
        .LFB_DIRTYFLAG(lfb_dirtyflag),
        .LFB_TAGIN(lfb_tagout),
        .LFB_INDEXIN(lfb_indexout),
        .LFB_HPROTIN(lfb_hprotout),
        .LFB_HMASTLOCKIN(lfb_hmastlockout),
        .LFB_FULL(lfb_full),
        .LFB_ERROR(swm_dp_resp[0]),
        .LFB_CLR(lfb_clr),
        .EB_DATAOUT(eb_datain),
        .EB_TAGOUT(eb_tagin),
        .EB_INDEXOUT(eb_indexin),
        .EB_HPROTOUT(eb_hprotin),
        .EB_HMASTLOCKOUT(eb_hmastlockin),
        .EB_EMPTY(eb_empty),
        .EB_CLR(eb_clr),
        .EB_WE(eb_we),
        .UC_DATAIN(uc_mp_dataout),
        .UC_DATAOUT(uc_mp_datain),
        .UC_TAGIN(uc_mp_tagin),
        .UC_INDEXIN(uc_mp_indexin),
        .UC_HIT(uc_mp_hit),
        .UC_WAYOUT(uc_mp_wayout),
        .UC_TAGOUT(uc_mp_tagout),
        .UC_INDEXOUT(uc_mp_indexout),
        .UC_DBOUT(uc_mp_dbout),
        .UC_VALID(uc_mp_valid),
        .UC_AEN(uc_mp_aen),
        .UC_DEN(uc_mp_den),
        .UC_DWE(uc_mp_dwe),
        .UC_BWE(uc_mp_bwe),
        .UC_AM(uc_mp_am),
        .UC_WAYIN(uc_mp_wayin),
        .UC_CLR(uc_mp_clr),
        .UC_TAGWIN(uc_mp_tagwin),
        .UC_TAGWE(uc_mp_tagwe),
        .UC_DSET(uc_mp_dset),
        .UC_DCLR(uc_mp_dclr),
        .RC_EN(rc_mp_en),
        .RC_REPLWAY(rc_mp_replway)
    );

    codasip_dcache_bus_interface_unit_ahb #(
        .RAM_DATA_BITS(DCACHE_MASTER_DATA_BITS),
        .RAM_ADDR_BITS(DCACHE_MASTER_ADDR_BITS),
        .CACHE_DATA_BITS(DCACHE_DATA_BITS),
        .TAG_BITS(DCACHE_TAG_BITS),
        .INDEX_BITS(DCACHE_INDEX_BITS),
        .OFFSET_BITS(OFFSET_BITS),
        .SBI_BITS(SBI_BITS),
        .CACHE_LINE_BITS(CACHE_LINE_BITS),
        .CACHE_IS_LITTLE(DCACHE_IS_LITTLE),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    )
    i_dcache_bus_interface_unit (
        .CLK(CLK),
        .RST(RST),
        .DCACHE_MASTER_HADDR0(DCACHE_MASTER_HADDR),
        .DCACHE_MASTER_HBURST0(DCACHE_MASTER_HBURST),
        .DCACHE_MASTER_HMASTLOCK0(DCACHE_MASTER_HMASTLOCK),
        .DCACHE_MASTER_HPROT0(DCACHE_MASTER_HPROT),
        .DCACHE_MASTER_HSIZE0(DCACHE_MASTER_HSIZE),
        .DCACHE_MASTER_HTRANS0(DCACHE_MASTER_HTRANS),
        .DCACHE_MASTER_HWDATA0(DCACHE_MASTER_HWDATA),
        .DCACHE_MASTER_HWRITE0(DCACHE_MASTER_HWRITE),
        .DCACHE_MASTER_HRDATA0(DCACHE_MASTER_HRDATA),
        .DCACHE_MASTER_HREADY0(DCACHE_MASTER_HREADY),
        .DCACHE_MASTER_HRESP0(DCACHE_MASTER_HRESP),
        .BIU_DATAIN(swm_dp_datain),
        .BIU_DATAOUT(swm_dp_dataout),
        .BIU_DATAOUTVAL(swm_dp_dataoutval),
        .BIU_TAGIN(swm_dp_tag),
        .BIU_INDEXIN(swm_dp_index),
        .BIU_OFFSETIN(swm_dp_offset),
        .BIU_SBI(swm_dp_sbi),
        .BIU_HSIZE(swm_dp_hsize),
        .BIU_HPROT(swm_dp_hprot),
        .BIU_HMASTLOCK(swm_dp_hmastlock),
        .BIU_NCREQ(swm_dp_ncreq),
        .BIU_NCREQVAL(swm_dp_ncreqval),
        .BIU_FEREQVAL(swm_dp_fereqval),
        .BIU_RESP(swm_dp_resp),
        .BIU_RESPVAL(swm_dp_respval),
        .BIU_EVICT_ERR(evict_err),
        .BIU_BEN(uc_dp_ben),
        .BIU_DWE(swm_dp_dwe),
        .LFB_DATAOUT(lfb_dataout),
        .LFB_DIRTYFLAG(lfb_dirtyflag),
        .LFB_TAGOUT(lfb_tagout),
        .LFB_INDEXOUT(lfb_indexout),
        .LFB_HPROTOUT(lfb_hprotout),
        .LFB_HMASTLOCKOUT(lfb_hmastlockout),
        .LFB_FULL(lfb_full),
        .LFB_CLR(lfb_clr),
        .EB_DATAIN(eb_datain),
        .EB_TAGIN(eb_tagin),
        .EB_INDEXIN(eb_indexin),
        .EB_HPROTIN(eb_hprotin),
        .EB_HMASTLOCKIN(eb_hmastlockin),
        .EB_EMPTY(eb_empty),
        .EB_CLR(eb_clr),
        .EB_WE(eb_we)
    );

endmodule
