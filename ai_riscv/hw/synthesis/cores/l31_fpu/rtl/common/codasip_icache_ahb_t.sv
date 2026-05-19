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
 *  \file   codasip_icache_ahb_t.v
 *  \author Jakub Drbal
 *  \email  support@codasip.com
 *  \date   Wed Sep 2 2015
 *  \brief  instruction cache top module
 */

module codasip_icache_ahb_t #(
    // master interface constants
    parameter integer ICACHE_MASTER_ADDR_BITS = 32'sd32, // address bit-width
    parameter integer ICACHE_MASTER_DATA_BITS = 32'sd16, // data bit-width
    // control status interface
    parameter integer ICACHE_TAG_BITS         = 32'sd21, // address bit-width
    parameter integer ICACHE_INDEX_BITS       = 32'sd7,  // write strobes bit-width
    // cache interface constants
    parameter integer ICACHE_ADDR_BITS        = 32'sd32, // address bit-width
    parameter integer ICACHE_DATA_BITS        = 32'sd16, // data bit-width
    // number of ways/sets - associativity, default value is 2-way
    parameter integer ICACHE_NUM_WAYS         = 32'sd2,
    // cache size in bytes, default value is 4kB
    parameter integer ICACHE_SIZE             = 32'sd4096,
    // cache line size in bytes, default value is 16B
    parameter integer ICACHE_LINE_SIZE        = 32'sd16,
    // endianness, default value is LITTLE
    parameter [0:0]   ICACHE_IS_LITTLE        = 1'b1,
    // active level of reset
    parameter [0:0]   RESET_LEVEL             = 1'b0,
    // synchronous reset
    parameter [0:0]   RESET_SYNC              = 1'b1
)(
    input wire                                             CLK,
    input wire                                             RST,
    // AHB interface
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
    // control status interface
    input wire [1:0]                                       CS_REQ,
    input wire                                             CS_REQVAL,
    input wire [ICACHE_TAG_BITS-1:0]                       CS_TAG,
    input wire [ICACHE_INDEX_BITS-1:0]                     CS_INDEX,
    output wire                                            CS_DONE,
    output wire                                            CS_HIT,
    output wire                                            CS_MIS,
    // WFI busy
    output wire                                            WFI_BUSY,
    // AHB interface connected to memory
    output wire [ICACHE_MASTER_ADDR_BITS-1:0]              ICACHE_MASTER_HADDR,
    output wire [2:0]                                      ICACHE_MASTER_HBURST,
    output wire                                            ICACHE_MASTER_HMASTLOCK,
    output wire [3:0]                                      ICACHE_MASTER_HPROT,
    output wire [2:0]                                      ICACHE_MASTER_HSIZE,
    output wire [1:0]                                      ICACHE_MASTER_HTRANS,
    output wire                                            ICACHE_MASTER_HWRITE,
    input wire  [ICACHE_MASTER_DATA_BITS-1:0]              ICACHE_MASTER_HRDATA,
    input wire                                             ICACHE_MASTER_HREADY,
    input wire                                             ICACHE_MASTER_HRESP,
    //SRAM interfaces
    // SRAM interface for TAG RAMs
    output wire                                            ICACHE_SRAM_TAG_CS,
    output wire                                            ICACHE_SRAM_TAG_RW,
    output wire [ICACHE_INDEX_BITS-1:0]                    ICACHE_SRAM_TAG_A,
    output wire [ICACHE_NUM_WAYS-1:0]                      ICACHE_SRAM_TAG_WSTRB,
    output wire [ICACHE_NUM_WAYS*(ICACHE_TAG_BITS+1)-1:0]  ICACHE_SRAM_TAG_WDATA,
    input wire  [ICACHE_NUM_WAYS*(ICACHE_TAG_BITS+1)-1:0]  ICACHE_SRAM_TAG_RDATA,
    // SRAM interface for DATA RAMs (cache lines)
    output wire                                            ICACHE_SRAM_LINE_DATA_CS,
    output wire                                            ICACHE_SRAM_LINE_DATA_RW,
    output wire [ICACHE_INDEX_BITS-1:0]                    ICACHE_SRAM_LINE_DATA_A,
    output wire [ICACHE_NUM_WAYS*ICACHE_LINE_SIZE-1:0]     ICACHE_SRAM_LINE_DATA_WSTRB,
    output wire [ICACHE_NUM_WAYS*ICACHE_LINE_SIZE*8-1:0]   ICACHE_SRAM_LINE_DATA_WDATA,
    input wire  [ICACHE_NUM_WAYS*ICACHE_LINE_SIZE*8-1:0]   ICACHE_SRAM_LINE_DATA_RDATA
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
    localparam integer CACHE_LINE_BITS = ICACHE_LINE_SIZE*32'sd8;

    // number of lines per set/way
    localparam integer SET_LINE_COUNT = (ICACHE_SIZE / ICACHE_LINE_SIZE) / ICACHE_NUM_WAYS;

    // cache associativity
    localparam integer ASSOCIATIVITY = ICACHE_NUM_WAYS;

    // offset bits
    localparam integer OFFSET_BITS = log2(CACHE_LINE_BITS/ICACHE_DATA_BITS);
    
    // byte index bits
    localparam integer SBI_BITS = log2(ICACHE_DATA_BITS/32'sd8);

    // ucache signals
    wire [ICACHE_DATA_BITS-1:0]  uc_dp_dataout;
    wire [ICACHE_TAG_BITS-1:0]   uc_dp_tag;
    wire [ICACHE_INDEX_BITS-1:0] uc_dp_index;
    wire [OFFSET_BITS-1:0]       uc_dp_offset;
    wire                         uc_dp_hit;
    wire                         uc_dp_aen;
    wire                         uc_dp_den;
    wire                         uc_dp_bwe;
    wire [CACHE_LINE_BITS-1:0]   uc_mp_datain;
    wire [ICACHE_TAG_BITS-1:0]   uc_mp_tagin;
    wire [ICACHE_INDEX_BITS-1:0] uc_mp_indexin;
    wire                         uc_mp_hit;
    wire [ASSOCIATIVITY-1:0]     uc_mp_wayout;
    wire [ASSOCIATIVITY-1:0]     uc_mp_vbout;
    wire                         uc_mp_valid;
    wire                         uc_mp_aen;
    wire                         uc_mp_den;
    wire                         uc_mp_dwe;
    wire                         uc_mp_bwe;
    wire                         uc_mp_am;
    wire [ASSOCIATIVITY-1:0]     uc_mp_wayin;
    wire                         uc_mp_clr;
    wire [ICACHE_TAG_BITS-1:0]   uc_mp_tagwin;
    wire                         uc_mp_tagwe;

    // switch signals
    wire                         swm_dp_statusin;
    wire                         swm_dp_statusout;
    wire                         swm_dp_ncreqval;
    wire                         swm_dp_fereqval;
    wire                         swm_dp_respval;
    wire [ICACHE_DATA_BITS-1:0]  swm_dp_dataout;
    wire                         swm_dp_dataoutval;
    wire [ICACHE_TAG_BITS-1:0]   swm_dp_tag;
    wire [ICACHE_INDEX_BITS-1:0] swm_dp_index;
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
    wire [ICACHE_TAG_BITS-1:0]   lfb_tagout;
    wire [ICACHE_INDEX_BITS-1:0] lfb_indexout;
    wire                         lfb_full;
    wire                         lfb_error;
    
    // WFI busy signals
    wire wfi_busy_mu;
    wire wfi_busy_pu;
    
    assign WFI_BUSY = wfi_busy_mu | wfi_busy_pu;

    codasip_icache_port_unit_ahb #(
        .CACHE_ADDR_BITS(ICACHE_ADDR_BITS),
        .CACHE_DATA_BITS(ICACHE_DATA_BITS),
        .TAG_BITS(ICACHE_TAG_BITS),
        .INDEX_BITS(ICACHE_INDEX_BITS),
        .OFFSET_BITS(OFFSET_BITS),
        .SBI_BITS(SBI_BITS),
        .CACHE_IS_LITTLE(ICACHE_IS_LITTLE),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    )
    i_icache_port_unit_ahb (
        .CLK(CLK),
        .RST(RST),
        .WFI_BUSY(wfi_busy_pu),
        .CACHE_HADDR0(ICACHE_HADDR),
        .CACHE_HBURST0(ICACHE_HBURST),
        .CACHE_HMASTLOCK0(ICACHE_HMASTLOCK),
        .CACHE_HPROT0(ICACHE_HPROT),
        .CACHE_HSIZE0(ICACHE_HSIZE),
        .CACHE_HTRANS0(ICACHE_HTRANS),
        .CACHE_HWRITE0(ICACHE_HWRITE),
        .CACHE_HREADYIN0(ICACHE_HREADY),
        .CACHE_HSEL0(ICACHE_HSEL),
        .CACHE_HRDATA0(ICACHE_HRDATA),
        .CACHE_HREADYOUT0(ICACHE_HREADYOUT),
        .CACHE_HRESP0(ICACHE_HRESP),
        .UC_DATAIN(uc_dp_dataout),
        .UC_TAG(uc_dp_tag),
        .UC_INDEX(uc_dp_index),
        .UC_OFFSET(uc_dp_offset),
        .UC_HIT(uc_dp_hit),
        .UC_AEN(uc_dp_aen),
        .UC_DEN(uc_dp_den),
        .UC_BWE(uc_dp_bwe),
        .SWM_STATUSIN(swm_dp_statusin),
        .SWM_STATUSOUT(swm_dp_statusout),
        .SWM_NCREQVAL(swm_dp_ncreqval),
        .SWM_FEREQVAL(swm_dp_fereqval),
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
        .CC_REQVAL(CS_REQVAL),
        .CC_HIT(CS_HIT),
        .CC_MIS(CS_MIS)
    );

    codasip_ucache_ro #(
        .CACHE_DATA_BITS(ICACHE_DATA_BITS),
        .TAG_BITS(ICACHE_TAG_BITS),
        .INDEX_BITS(ICACHE_INDEX_BITS),
        .OFFSET_BITS(OFFSET_BITS),
        .ASSOCIATIVITY(ASSOCIATIVITY),
        .CACHE_LINE_BITS(CACHE_LINE_BITS),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    )
    i_ucache_ro (
        .CLK(CLK),
        .RST(RST),
        .UC_DP_DATAOUT(uc_dp_dataout),
        .UC_DP_TAG(uc_dp_tag),
        .UC_DP_INDEX(uc_dp_index),
        .UC_DP_OFFSET(uc_dp_offset),
        .UC_DP_HIT(uc_dp_hit),
        .UC_DP_AEN(uc_dp_aen),
        .UC_DP_DEN(uc_dp_den),
        .UC_DP_BWE(uc_dp_bwe),
        .UC_MP_DATAIN(uc_mp_datain),
        .UC_MP_TAGIN(uc_mp_tagin),
        .UC_MP_INDEXIN(uc_mp_indexin),
        .UC_MP_HIT(uc_mp_hit),
        .UC_MP_WAYOUT(uc_mp_wayout),
        .UC_MP_VBOUT(uc_mp_vbout),
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

    codasip_icache_maintenance_unit #(
        .TAG_BITS(ICACHE_TAG_BITS),
        .INDEX_BITS(ICACHE_INDEX_BITS),
        .ASSOCIATIVITY(ASSOCIATIVITY),
        .SET_LINE_COUNT(SET_LINE_COUNT),
        .CACHE_LINE_BITS(CACHE_LINE_BITS),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    )
    i_icache_maintenance_unit (
        .CLK(CLK),
        .RST(RST),
        .WFI_BUSY(wfi_busy_mu),
        .CM_STATUSOUT(swm_dp_statusin),
        .CM_STATUSIN(swm_dp_statusout),
        .CM_REQ(CS_REQ),
        .CM_REQVAL(CS_REQVAL),
        .CM_TAGIN(CS_TAG),
        .CM_INDEXIN(CS_INDEX),
        .CM_FEREQVAL(swm_dp_fereqval),
        .CM_DONE(CS_DONE),
        .LFB_DATAIN(lfb_dataout),
        .LFB_TAGIN(lfb_tagout),
        .LFB_INDEXIN(lfb_indexout),
        .LFB_FULL(lfb_full),
        .LFB_ERROR(lfb_error),
        .UC_DATAOUT(uc_mp_datain),
        .UC_TAGIN(uc_mp_tagin),
        .UC_INDEXIN(uc_mp_indexin),
        .UC_HIT(uc_mp_hit),
        .UC_WAYOUT(uc_mp_wayout),
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
        .RC_EN(rc_mp_en),
        .RC_REPLWAY(rc_mp_replway)
    );

    codasip_icache_bus_interface_unit_ahb #(
        .RAM_DATA_BITS(ICACHE_MASTER_DATA_BITS),
        .RAM_ADDR_BITS(ICACHE_MASTER_ADDR_BITS),
        .CACHE_DATA_BITS(ICACHE_DATA_BITS),
        .TAG_BITS(ICACHE_TAG_BITS),
        .INDEX_BITS(ICACHE_INDEX_BITS),
        .OFFSET_BITS(OFFSET_BITS),
        .SBI_BITS(SBI_BITS),
        .CACHE_LINE_BITS(CACHE_LINE_BITS),
        .CACHE_IS_LITTLE(ICACHE_IS_LITTLE),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    )
    i_icache_bus_interface_unit (
        .CLK(CLK),
        .RST(RST),
        .ICACHE_MASTER_HADDR0(ICACHE_MASTER_HADDR),
        .ICACHE_MASTER_HBURST0(ICACHE_MASTER_HBURST),
        .ICACHE_MASTER_HMASTLOCK0(ICACHE_MASTER_HMASTLOCK),
        .ICACHE_MASTER_HPROT0(ICACHE_MASTER_HPROT),
        .ICACHE_MASTER_HSIZE0(ICACHE_MASTER_HSIZE),
        .ICACHE_MASTER_HTRANS0(ICACHE_MASTER_HTRANS),
        .ICACHE_MASTER_HWRITE0(ICACHE_MASTER_HWRITE),
        .ICACHE_MASTER_HRDATA0(ICACHE_MASTER_HRDATA),
        .ICACHE_MASTER_HREADY0(ICACHE_MASTER_HREADY),
        .ICACHE_MASTER_HRESP0(ICACHE_MASTER_HRESP),
        .BIU_DATAOUT(swm_dp_dataout),
        .BIU_DATAOUTVAL(swm_dp_dataoutval),
        .BIU_TAGIN(swm_dp_tag),
        .BIU_INDEXIN(swm_dp_index),
        .BIU_OFFSETIN(swm_dp_offset),
        .BIU_SBI(swm_dp_sbi),
        .BIU_HSIZE(swm_dp_hsize),
        .BIU_HPROT(swm_dp_hprot),
        .BIU_HMASTLOCK(swm_dp_hmastlock),
        .BIU_NCREQVAL(swm_dp_ncreqval),
        .BIU_FEREQVAL(swm_dp_fereqval),
        .BIU_RESPVAL(swm_dp_respval),
        .LFB_DATAOUT(lfb_dataout),
        .LFB_TAGOUT(lfb_tagout),
        .LFB_INDEXOUT(lfb_indexout),
        .LFB_FULL(lfb_full),
        .LFB_ERROR(lfb_error)
    );

endmodule
