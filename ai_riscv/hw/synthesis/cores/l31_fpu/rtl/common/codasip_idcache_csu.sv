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
 *  \file   codasip_idcache_csu.v
 *  \author Jakub Drbal
 *  \email  support@codasip.com
 *  \date   Tue Nov 20 2018
 *  \brief  control/status unit for icache and dcache
 */

module codasip_idcache_csu  #(
    // icache info
    parameter integer ICACHE_SIZE       = 32'sd4096,
    parameter integer ICACHE_NUM_WAYS   = 32'sd2,
    parameter integer ICACHE_LINE_SIZE  = 32'sd64,
    parameter integer ICACHE_TAG_BITS   = 32'sd21,
    parameter integer ICACHE_INDEX_BITS = 32'sd5,
    // dcache info
    parameter integer DCACHE_SIZE       = 32'sd4096,
    parameter integer DCACHE_NUM_WAYS   = 32'sd2,
    parameter integer DCACHE_LINE_SIZE  = 32'sd64,
    parameter integer DCACHE_TAG_BITS   = 32'sd21,
    parameter integer DCACHE_INDEX_BITS = 32'sd5,
    // interface constants
    parameter integer CACHE_ADDR_BITS   = 32'sd32,
    parameter integer CACHE_DATA_BITS   = 32'sd32,
    // control/status unit address and size
    parameter [CACHE_ADDR_BITS-1:0] CSU_BASE_ADDR = {CACHE_ADDR_BITS{1'b0}},
    // reset
    parameter [0:0] RESET_LEVEL       = 1'b0,
    parameter [0:0] RESET_SYNC        = 1'b1
)(
    input wire                          CLK,
    input wire                          RST,
    // WFI busy
    output wire                         WFI_BUSY,
    // eviction error
    output wire                         EVICTION_ERROR,
    // AHB interface input
    input wire [CACHE_ADDR_BITS-1:0]    CSIN_HADDR,
    input wire                          CSIN_HMASTLOCK,
    input wire [3:0]                    CSIN_HPROT,
    input wire [2:0]                    CSIN_HSIZE,
    // only bit 1 is used
    // verilator lint_off UNUSED
    input wire [1:0]                    CSIN_HTRANS,
    // verilator lint_on UNUSED
    input wire [CACHE_DATA_BITS-1:0]    CSIN_HWDATA,
    input wire                          CSIN_HWRITE,
    input wire                          CSIN_HREADYIN,
    input wire                          CSIN_HSEL,
    output wire [CACHE_DATA_BITS-1:0]   CSIN_HRDATA,
    output wire                         CSIN_HREADYOUT,
    output wire                         CSIN_HRESP,
    // AHB interface output
    output wire                         CSOUT_HREADYIN,
    input wire [CACHE_DATA_BITS-1:0]    CSOUT_HRDATA,
    input wire                          CSOUT_HREADYOUT,
    input wire                          CSOUT_HRESP,
    // icache
    // request
    output reg  [1:0]                   ICACHE_CS_REQ,
    output reg                          ICACHE_CS_REQVAL,
    // address
    output wire [ICACHE_TAG_BITS-1:0]   ICACHE_CS_TAG,
    output wire [ICACHE_INDEX_BITS-1:0] ICACHE_CS_INDEX,
    // finish
    input wire                          ICACHE_CS_DONE,
    // performance info
    input wire                          ICACHE_CS_HIT,
    input wire                          ICACHE_CS_MIS,
    // dcache
    // request
    output reg  [2:0]                   DCACHE_CS_REQ,
    output reg                          DCACHE_CS_REQVAL,
    // address
    output wire [DCACHE_TAG_BITS-1:0]   DCACHE_CS_TAG,
    output wire [DCACHE_INDEX_BITS-1:0] DCACHE_CS_INDEX,
    output wire [3:0]                   DCACHE_CS_HPROT,
    output wire                         DCACHE_CS_HMASTLOCK,
    // finish
    input wire                          DCACHE_CS_DONE,
    // write through
    output wire                         DCACHE_CS_WT,
    // cancel request that went into csr region
    output wire                         DCACHE_CS_CSR,
    // performance info
    input wire                          DCACHE_CS_HIT,
    input wire                          DCACHE_CS_MIS,
    input wire                          DCACHE_CS_MEM_ERROR
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

    // byte bit-width common for RAM and CACHE
    localparam integer BYTE_BITS = 32'sd8;
    // cache info
    // verilator lint_off WIDTH
    localparam [CACHE_DATA_BITS-1:0] CACHE_TYPE    = 32'sd3;
    localparam [CACHE_DATA_BITS-1:0] CACHE_VERSION = 32'sd4;
    localparam [CACHE_DATA_BITS-1:0] ICACHE_SIZE_CONSTR = ICACHE_SIZE;
    localparam [CACHE_DATA_BITS-1:0] ICACHE_NUM_WAYS_CONSTR = ICACHE_NUM_WAYS;
    localparam [CACHE_DATA_BITS-1:0] ICACHE_LINE_SIZE_CONSTR = ICACHE_LINE_SIZE;
    localparam [CACHE_DATA_BITS-1:0] DCACHE_SIZE_CONSTR = DCACHE_SIZE;
    localparam [CACHE_DATA_BITS-1:0] DCACHE_NUM_WAYS_CONSTR = DCACHE_NUM_WAYS;
    localparam [CACHE_DATA_BITS-1:0] DCACHE_LINE_SIZE_CONSTR = DCACHE_LINE_SIZE;
    // verilator lint_on WIDTH
    // request command type
    localparam [2:0] CMD_INVALIDATE_ADR  = 3'b000;
    localparam [2:0] CMD_INVALIDATE_LINE = 3'b001;
    localparam [2:0] CMD_INVALIDATE_ALL  = 3'b010;
    localparam [2:0] CMD_FLUSH_ADR       = 3'b011;
    localparam [2:0] CMD_FLUSH_LINE      = 3'b100;
    localparam [2:0] CMD_FLUSH_ALL       = 3'b101;
    // state type
    localparam [1:0] STATE_IDLE     = 2'b00;
    localparam [1:0] STATE_REQUEST  = 2'b01;
    localparam [1:0] STATE_CONTROL  = 2'b10;
    localparam [1:0] STATE_ERROR    = 2'b11;
    // auxiliary parameters
    localparam integer CSR_BITS = 32'sd7;
    localparam integer BYTES_PER_WORD = CACHE_DATA_BITS / BYTE_BITS;
    localparam integer SBI_BITS = log2(BYTES_PER_WORD);
    localparam integer OFFSET_LSB_IDX = SBI_BITS;
    localparam integer BASE_ADDR_LSB_IDX = OFFSET_LSB_IDX + CSR_BITS;
    // verilator lint_off WIDTH
    localparam [CACHE_ADDR_BITS-BASE_ADDR_LSB_IDX-1:0] CSU_BASE_ADDR_CONSTR = CSU_BASE_ADDR >> BASE_ADDR_LSB_IDX;
    // verilator lint_on WIDTH
    // tag and index LSB indexes
    localparam integer ICACHE_INDEX_LSB_IDX = log2(ICACHE_LINE_SIZE);
    localparam integer DCACHE_INDEX_LSB_IDX = log2(DCACHE_LINE_SIZE);
    localparam integer ICACHE_TAG_LSB_IDX = ICACHE_INDEX_LSB_IDX + ICACHE_INDEX_BITS;
    localparam integer DCACHE_TAG_LSB_IDX = DCACHE_INDEX_LSB_IDX + DCACHE_INDEX_BITS;
    localparam integer ICACHE_ADDR_BITS = ICACHE_TAG_LSB_IDX + ICACHE_TAG_BITS;
    // verilator lint_off WIDTH
    localparam [2:0] HSIZE_MAX_SUPPORTED_VALUE = log2(BYTES_PER_WORD);
    // verilator lint_on WIDTH
    // addresses
    // cache type/size
    localparam [CSR_BITS-1:0] CSR_TS_BASE          = 7'd0;
    localparam [CSR_BITS-1:0] CSR_CACHE_TYPE       = CSR_TS_BASE + 7'd0;
    localparam [CSR_BITS-1:0] CSR_CACHE_VERSION    = CSR_TS_BASE + 7'd1;
    localparam [CSR_BITS-1:0] CSR_ICACHE_SIZE      = CSR_TS_BASE + 7'd2;
    localparam [CSR_BITS-1:0] CSR_ICACHE_NUM_WAYS  = CSR_TS_BASE + 7'd3;
    localparam [CSR_BITS-1:0] CSR_ICACHE_LINE_SIZE = CSR_TS_BASE + 7'd4;
    localparam [CSR_BITS-1:0] CSR_DCACHE_SIZE      = CSR_TS_BASE + 7'd5;
    localparam [CSR_BITS-1:0] CSR_DCACHE_NUM_WAYS  = CSR_TS_BASE + 7'd6;
    localparam [CSR_BITS-1:0] CSR_DCACHE_LINE_SIZE = CSR_TS_BASE + 7'd7;
    // icache/dcache conters
    localparam [CSR_BITS-1:0] CSR_CNT_BASE         = 7'd32; // == 7'h20;
    localparam [CSR_BITS-1:0] CSR_ICACHE_HIT_CNT   = CSR_CNT_BASE + 7'd0;
    localparam [CSR_BITS-1:0] CSR_ICACHE_MIS_CNT   = CSR_CNT_BASE + 7'd1;
    localparam [CSR_BITS-1:0] CSR_DCACHE_HIT_CNT   = CSR_CNT_BASE + 7'd2;
    localparam [CSR_BITS-1:0] CSR_DCACHE_MIS_CNT   = CSR_CNT_BASE + 7'd3;
    // CSR_CNT_BASE + 7'd4 is now reserved (used to be ICACHE_MEM_ERROR)
    localparam [CSR_BITS-1:0] CSR_DCACHE_MEM_ERROR = CSR_CNT_BASE + 7'd5;
    // cache settings - remaining addresses are reserved (used to be NC regions)
    localparam [CSR_BITS-1:0] CSR_SET_BASE             = 7'd48; // == 7'h30;
    localparam [CSR_BITS-1:0] CSR_DCACHE_WRITETHROUGH  = CSR_SET_BASE + 7'd0;
    // cache operation
    localparam [CSR_BITS-1:0] CSR_OP_BASE                = 7'd80; // == 7'h50;
    localparam [CSR_BITS-1:0] CSR_ICACHE_INVALIDATE_ADR  = CSR_OP_BASE + 7'd0;
    localparam [CSR_BITS-1:0] CSR_ICACHE_INVALIDATE_LINE = CSR_OP_BASE + 7'd1;
    localparam [CSR_BITS-1:0] CSR_ICACHE_INVALIDATE_ALL  = CSR_OP_BASE + 7'd2;
    localparam [CSR_BITS-1:0] CSR_DCACHE_INVALIDATE_ADR  = CSR_OP_BASE + 7'd3;
    localparam [CSR_BITS-1:0] CSR_DCACHE_INVALIDATE_LINE = CSR_OP_BASE + 7'd4;
    localparam [CSR_BITS-1:0] CSR_DCACHE_INVALIDATE_ALL  = CSR_OP_BASE + 7'd5;
    localparam [CSR_BITS-1:0] CSR_DCACHE_FLUSH_ADR       = CSR_OP_BASE + 7'd6;
    localparam [CSR_BITS-1:0] CSR_DCACHE_FLUSH_LINE      = CSR_OP_BASE + 7'd7;
    localparam [CSR_BITS-1:0] CSR_DCACHE_FLUSH_ALL       = CSR_OP_BASE + 7'd8;
    localparam [CSR_BITS-1:0] CSR_IDCACHE_CLEAR_COUNTERS = 7'd112; // == 7'h70;

    // address and transfer registers
    wire ahb_trans_inc_D;
    wire ahb_trans_inc_Q;
    wire [BASE_ADDR_LSB_IDX-1:0] csu_addr_Q;
    wire csu_addr_space_D;
    wire csu_addr_space_Q;
    wire [2:0] csu_size_Q;
    wire [3:0] csu_hprot_Q;
    wire csu_hmastlock_Q;
    wire csu_write_Q;
    // address decoder and error conditions
    wire [CACHE_ADDR_BITS-1:0] dcache_address;
    wire [ICACHE_ADDR_BITS-1:0] icache_address;
    wire [ICACHE_INDEX_BITS-1:0] icache_index;
    wire [DCACHE_INDEX_BITS-1:0] dcache_index;
    wire line_cmd;
    wire [CSR_BITS-1:0] regs_index;
    wire error;
    wire csu_request;
    // control operations
    reg  [2:0] cmd_reg_D;
    wire [2:0] cmd_reg_Q;
    wire icache_control_cmd;
    wire dcache_control_cmd;
    wire control_cmd;
    reg  cmd_cache_WE;
    reg  cmd_cache_select_D;
    wire cmd_cache_select_Q;
    // read data
    wire [CACHE_DATA_BITS-1:0] regs_data;
    // performance counters
    wire [CACHE_DATA_BITS-1:0] icache_hit_miss_cnt_src;
    wire [CACHE_DATA_BITS-1:0] icache_hit_miss_cnt_D;
    wire [CACHE_DATA_BITS-1:0] icache_hit_cnt_D;
    wire [CACHE_DATA_BITS-1:0] icache_hit_cnt_Q;
    wire [CACHE_DATA_BITS-1:0] icache_miss_cnt_D;
    wire [CACHE_DATA_BITS-1:0] icache_miss_cnt_Q;
    wire icache_hit_cnt_WE;
    wire icache_miss_cnt_WE;
    wire [CACHE_DATA_BITS-1:0] dcache_hit_miss_cnt_src;
    wire [CACHE_DATA_BITS-1:0] dcache_hit_miss_cnt_D;
    wire [CACHE_DATA_BITS-1:0] dcache_hit_cnt_D;
    wire [CACHE_DATA_BITS-1:0] dcache_hit_cnt_Q;
    wire [CACHE_DATA_BITS-1:0] dcache_miss_cnt_D;
    wire [CACHE_DATA_BITS-1:0] dcache_miss_cnt_Q;
    wire dcache_mem_error_D;
    wire dcache_mem_error_Q;
    wire dcache_hit_cnt_WE;
    wire dcache_miss_cnt_WE;
    wire dcache_mem_error_WE;
    wire perf_cnt_clear;
    // write through register
    wire wt_reg_Q;
    wire wt_reg_accessed;
    reg  wt_reg_WE;
    // fsm
    reg  [1:0] next_state;
    wire [1:0] present_state;
    // output signals
    reg  error_out;
    reg  ready_out;
    // eviction error pulse generation
    wire eviction_error_delay_reg_Q;
    wire eviction_error_rising_edge;

    // haddr register
    d_ff_rst_we_t #(
        .BIT_WIDTH(BASE_ADDR_LSB_IDX),
        .DEFAULT_VALUE({BASE_ADDR_LSB_IDX{1'b0}}),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) csu_haddr_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(ahb_trans_inc_D),
        .D(CSIN_HADDR[BASE_ADDR_LSB_IDX-1:0]),
        .Q(csu_addr_Q)
    );
    
    // CSU address space register
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) csu_addr_space_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(ahb_trans_inc_D),
        .D(csu_addr_space_D),
        .Q(csu_addr_space_Q)
    );

    // hsize register
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'd3),
        .DEFAULT_VALUE(3'd0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) csu_hsize_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(ahb_trans_inc_D),
        .D(CSIN_HSIZE),
        .Q(csu_size_Q)
    );

    // hprot register
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'd4),
        .DEFAULT_VALUE(4'd0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) csu_hprot_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(ahb_trans_inc_D),
        .D(CSIN_HPROT),
        .Q(csu_hprot_Q)
    );

    // hmastlock register
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) csu_hmastlock_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(ahb_trans_inc_D),
        .D(CSIN_HMASTLOCK),
        .Q(csu_hmastlock_Q)
    );

    // hwrite register
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) csu_hwrite_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(ahb_trans_inc_D),
        .D(CSIN_HWRITE),
        .Q(csu_write_Q)
    );

    // incoming transaction register
    d_ff_rst_t #(
        .BIT_WIDTH(32'd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) csu_req_reg (
        .CLK(CLK),
        .RST(RST),
        .D(ahb_trans_inc_D),
        .Q(ahb_trans_inc_Q)
    );

    // command register
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'd3),
        .DEFAULT_VALUE(3'd0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) cmd_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(cmd_cache_WE),
        .D(cmd_reg_D),
        .Q(cmd_reg_Q)
    );

    // cs select register
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) cmd_cache_select_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(cmd_cache_WE),
        .D(cmd_cache_select_D),
        .Q(cmd_cache_select_Q)
    );

    // icache hit counter register
    d_ff_rst_we_t #(
        .BIT_WIDTH(CACHE_DATA_BITS),
        .DEFAULT_VALUE({CACHE_DATA_BITS{1'b0}}),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) icache_hit_cnt_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(icache_hit_cnt_WE),
        .D(icache_hit_cnt_D),
        .Q(icache_hit_cnt_Q)
    );

    // icache miss counter register
    d_ff_rst_we_t #(
        .BIT_WIDTH(CACHE_DATA_BITS),
        .DEFAULT_VALUE({CACHE_DATA_BITS{1'b0}}),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) icache_miss_cnt_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(icache_miss_cnt_WE),
        .D(icache_miss_cnt_D),
        .Q(icache_miss_cnt_Q)
    );

    // dcache hit counter register
    d_ff_rst_we_t #(
        .BIT_WIDTH(CACHE_DATA_BITS),
        .DEFAULT_VALUE({CACHE_DATA_BITS{1'b0}}),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) dcache_hit_cnt_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(dcache_hit_cnt_WE),
        .D(dcache_hit_cnt_D),
        .Q(dcache_hit_cnt_Q)
    );

    // dcache miss counter register
    d_ff_rst_we_t #(
        .BIT_WIDTH(CACHE_DATA_BITS),
        .DEFAULT_VALUE({CACHE_DATA_BITS{1'b0}}),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) dcache_mis_cnt_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(dcache_miss_cnt_WE),
        .D(dcache_miss_cnt_D),
        .Q(dcache_miss_cnt_Q)
    );

    // dcache mem error flag register
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) dcache_mem_error_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(dcache_mem_error_WE),
        .D(dcache_mem_error_D),
        .Q(dcache_mem_error_Q)
    );

    // write through register
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) wt_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(wt_reg_WE),
        .D(CSIN_HWDATA[0]),
        .Q(wt_reg_Q)
    );
    
    // eviction error delay register
    d_ff_rst_t #(
        .BIT_WIDTH(32'd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) eviction_error_delay_reg (
        .CLK(CLK),
        .RST(RST),
        .D(DCACHE_CS_MEM_ERROR),
        .Q(eviction_error_delay_reg_Q)
    );
    
    // control fsm state register
    d_ff_rst_t #(
        .BIT_WIDTH(32'd2),
        .DEFAULT_VALUE(STATE_IDLE),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) state_reg (
        .CLK(CLK),
        .RST(RST),
        .D(next_state),
        .Q(present_state)
    );

    // control fsm transition logic
    always @(*) begin : next_state_dec
        case (present_state)
            STATE_IDLE: begin
                if (ahb_trans_inc_D == 1'b1) begin
                    next_state = STATE_REQUEST;
                end
                else begin
                    next_state = STATE_IDLE;
                end
            end
            STATE_REQUEST: begin
                if (csu_request == 1'b1) begin
                    if (error == 1'b1) begin
                        next_state = STATE_ERROR;
                    end
                    else if (control_cmd == 1'b1) begin
                        next_state = STATE_CONTROL;
                    end
                    else if (ahb_trans_inc_D == 1'b1) begin
                        next_state = STATE_REQUEST;
                    end
                    else begin
                        next_state = STATE_IDLE;
                    end
                end
                else if (ahb_trans_inc_D == 1'b1) begin
                    next_state = STATE_REQUEST;
                end
                else begin
                    next_state = STATE_IDLE;
                end
            end
            STATE_CONTROL: begin
                if (cmd_cache_select_Q == 1'b0) begin   // icache control command
                    if (ICACHE_CS_DONE == 1'b1) begin
                        if (ahb_trans_inc_D == 1'b1) begin
                            next_state = STATE_REQUEST;
                        end
                        else begin
                            next_state = STATE_IDLE;
                        end
                    end
                    else begin
                        next_state = STATE_CONTROL;
                    end
                end
                else begin                          // dcache control command
                    if (DCACHE_CS_DONE == 1'b1) begin
                        if (ahb_trans_inc_D == 1'b1) begin
                            next_state = STATE_REQUEST;
                        end
                        else begin
                            next_state = STATE_IDLE;
                        end
                    end
                    else begin
                        next_state = STATE_CONTROL;
                    end
                end
            end
            STATE_ERROR: begin
                if (ahb_trans_inc_D == 1'b1) begin
                    next_state = STATE_REQUEST;
                end
                else begin
                    next_state = STATE_IDLE;
                end
            end
            // remove default case in a fully defined switch for synthesis
            // pragma translate_off
            default : next_state = 2'bxx;
            // pragma translate_on
        endcase
    end

    // control fsm output logic
    always @(*) begin : fsm_output_dec
        // AHB ready and error signals
        ready_out = 1'b0;
        error_out = 1'b0;
        // write through
        wt_reg_WE = 1'b0;
        // cache control signal
        ICACHE_CS_REQ = 2'd0;
        DCACHE_CS_REQ = 3'd0;
        ICACHE_CS_REQVAL = 1'b0;
        DCACHE_CS_REQVAL = 1'b0;
        cmd_cache_WE = 1'b0;
        cmd_cache_select_D = 1'b0;

        case (present_state)
            STATE_IDLE: begin
                ready_out = 1'b1;
            end
            STATE_REQUEST: begin
                if (csu_request == 1'b1) begin
                    if (error == 1'b1) begin
                        error_out = 1'b1;
                    end
                    else if (control_cmd == 1'b1) begin
                        if (icache_control_cmd == 1'b1) begin
                            ICACHE_CS_REQ = cmd_reg_D[1:0];
                            ICACHE_CS_REQVAL = 1'b1;
                            cmd_cache_WE = 1'b1;
                            cmd_cache_select_D = 1'b0;
                        end
                        else begin
                            DCACHE_CS_REQ = cmd_reg_D;
                            DCACHE_CS_REQVAL = 1'b1;
                            cmd_cache_WE = 1'b1;
                            cmd_cache_select_D = 1'b1;
                        end
                    end
                    else begin
                        ready_out = 1'b1;
                        wt_reg_WE = (csu_write_Q & wt_reg_accessed);
                    end
                end
                else begin
                    ready_out = 1'b1;
                end
            end
            STATE_CONTROL: begin
                if (cmd_cache_select_Q == 1'b0) begin   // icache control command
                    ICACHE_CS_REQ = cmd_reg_Q[1:0];
                    ICACHE_CS_REQVAL = 1'b1;
                    ready_out = ICACHE_CS_DONE;
                end
                else begin                          // dcache control command
                    DCACHE_CS_REQ = cmd_reg_Q;
                    DCACHE_CS_REQVAL = 1'b1;
                    ready_out = DCACHE_CS_DONE;
                end
            end
            STATE_ERROR: begin
                ready_out = 1'b1;
                error_out = 1'b1;
            end
            // remove default case in a fully defined switch for synthesis
            // pragma translate_off
            default: begin
                ready_out = 1'bx;
                error_out = 1'bx;
                wt_reg_WE = 1'bx;
                ICACHE_CS_REQ = 2'bxx;
                DCACHE_CS_REQ = 3'bxxx;
                ICACHE_CS_REQVAL = 1'bx;
                DCACHE_CS_REQVAL = 1'bx;
                cmd_cache_WE = 1'bx;
                cmd_cache_select_D = 1'bx;
            end
            // pragma translate_on
        endcase
    end
    
    // address and transfer
    assign ahb_trans_inc_D = (CSIN_HTRANS[1] == 1'b1 && ready_out == 1'b1 &&
        CSOUT_HREADYOUT == 1'b1 && CSIN_HREADYIN == 1'b1 && CSIN_HSEL == 1'b1);
    assign csu_addr_space_D = (CSIN_HADDR[CACHE_ADDR_BITS-1:BASE_ADDR_LSB_IDX] == CSU_BASE_ADDR_CONSTR);

    // address decoder - index and tag for control operations   
    assign icache_address = CSIN_HWDATA[ICACHE_ADDR_BITS-1:0];
    assign dcache_address = CSIN_HWDATA[CACHE_ADDR_BITS-1:0];
    assign icache_index = icache_address[ICACHE_INDEX_LSB_IDX+:ICACHE_INDEX_BITS];
    assign dcache_index = dcache_address[DCACHE_INDEX_LSB_IDX+:DCACHE_INDEX_BITS];

    assign line_cmd = (cmd_cache_WE == 1'b1) ? 
        (cmd_reg_D == CMD_INVALIDATE_LINE || cmd_reg_D == CMD_FLUSH_LINE) :
        (cmd_reg_Q == CMD_INVALIDATE_LINE || cmd_reg_Q == CMD_FLUSH_LINE);
        
    assign ICACHE_CS_INDEX = (line_cmd == 1'b1) ? icache_address[ICACHE_INDEX_BITS-1:0] : icache_index;
    assign DCACHE_CS_INDEX = (line_cmd == 1'b1) ? dcache_address[DCACHE_INDEX_BITS-1:0] : dcache_index;
    assign ICACHE_CS_TAG = icache_address[ICACHE_TAG_LSB_IDX+:ICACHE_TAG_BITS];
    assign DCACHE_CS_TAG = dcache_address[DCACHE_TAG_LSB_IDX+:DCACHE_TAG_BITS];

    // register index calculation
    assign regs_index = csu_addr_Q[OFFSET_LSB_IDX+:CSR_BITS];

    // alignment check
    assign error = (csu_addr_Q[SBI_BITS-1:0] != {SBI_BITS{1'b0}}) ||
            (csu_size_Q != HSIZE_MAX_SUPPORTED_VALUE);

    // CSU region comparator
    assign csu_request = (ahb_trans_inc_Q & csu_addr_space_Q);

    // control request decoder
    // control commands
    always @(*) begin : control_req_dec
        case (regs_index)
            CSR_ICACHE_INVALIDATE_ADR:  cmd_reg_D = CMD_INVALIDATE_ADR;
            CSR_ICACHE_INVALIDATE_LINE: cmd_reg_D = CMD_INVALIDATE_LINE;
            CSR_ICACHE_INVALIDATE_ALL:  cmd_reg_D = CMD_INVALIDATE_ALL;
            CSR_DCACHE_INVALIDATE_ADR:  cmd_reg_D = CMD_INVALIDATE_ADR;
            CSR_DCACHE_INVALIDATE_LINE: cmd_reg_D = CMD_INVALIDATE_LINE;
            CSR_DCACHE_INVALIDATE_ALL:  cmd_reg_D = CMD_INVALIDATE_ALL;
            CSR_DCACHE_FLUSH_ADR:       cmd_reg_D = CMD_FLUSH_ADR;
            CSR_DCACHE_FLUSH_LINE:      cmd_reg_D = CMD_FLUSH_LINE;
            CSR_DCACHE_FLUSH_ALL:       cmd_reg_D = CMD_FLUSH_ALL;
            // assign X as a "dont-care" value to let synthesis tool select optimal assignment
            default:                    cmd_reg_D = 3'bxxx;
        endcase
    end
    
    // control commands
    assign icache_control_cmd =
        (regs_index == CSR_ICACHE_INVALIDATE_ADR) ||
        (regs_index == CSR_ICACHE_INVALIDATE_LINE) ||
        (regs_index == CSR_ICACHE_INVALIDATE_ALL);
    assign dcache_control_cmd =
        (regs_index == CSR_DCACHE_INVALIDATE_ADR) ||
        (regs_index == CSR_DCACHE_INVALIDATE_LINE) ||
        (regs_index == CSR_DCACHE_INVALIDATE_ALL) ||
        (regs_index == CSR_DCACHE_FLUSH_ADR) ||
        (regs_index == CSR_DCACHE_FLUSH_LINE) ||
        (regs_index == CSR_DCACHE_FLUSH_ALL);
    assign control_cmd = (csu_write_Q == 1'b1) &&
        (icache_control_cmd == 1'b1 || dcache_control_cmd == 1'b1);

    // clear performance counters
    assign perf_cnt_clear = (regs_index == CSR_IDCACHE_CLEAR_COUNTERS) && (csu_request == 1'b1) &&
        (csu_write_Q == 1'b1);

    // prepare read data from regs       
    assign regs_data =
        ({CACHE_DATA_BITS{(regs_index == CSR_CACHE_TYPE)}} & CACHE_TYPE) |
        ({CACHE_DATA_BITS{(regs_index == CSR_CACHE_VERSION)}} & CACHE_VERSION) |
        ({CACHE_DATA_BITS{(regs_index == CSR_ICACHE_SIZE)}} & ICACHE_SIZE_CONSTR) |
        ({CACHE_DATA_BITS{(regs_index == CSR_ICACHE_NUM_WAYS)}} & ICACHE_NUM_WAYS_CONSTR) |
        ({CACHE_DATA_BITS{(regs_index == CSR_ICACHE_LINE_SIZE)}} & ICACHE_LINE_SIZE_CONSTR) |
        ({CACHE_DATA_BITS{(regs_index == CSR_DCACHE_SIZE)}} & DCACHE_SIZE_CONSTR) |
        ({CACHE_DATA_BITS{(regs_index == CSR_DCACHE_NUM_WAYS)}} & DCACHE_NUM_WAYS_CONSTR) |
        ({CACHE_DATA_BITS{(regs_index == CSR_DCACHE_LINE_SIZE)}} & DCACHE_LINE_SIZE_CONSTR) |
        ({CACHE_DATA_BITS{(regs_index == CSR_ICACHE_HIT_CNT)}} & icache_hit_cnt_Q) |
        ({CACHE_DATA_BITS{(regs_index == CSR_ICACHE_MIS_CNT)}} & icache_miss_cnt_Q) |
        ({CACHE_DATA_BITS{(regs_index == CSR_DCACHE_HIT_CNT)}} & dcache_hit_cnt_Q) |
        ({CACHE_DATA_BITS{(regs_index == CSR_DCACHE_MIS_CNT)}} & dcache_miss_cnt_Q) |
        ({CACHE_DATA_BITS{(regs_index == CSR_DCACHE_MEM_ERROR)}} & {{CACHE_DATA_BITS-1{1'b0}}, dcache_mem_error_Q}) |
        ({CACHE_DATA_BITS{(regs_index == CSR_DCACHE_WRITETHROUGH)}} & {{CACHE_DATA_BITS-1{1'b0}}, wt_reg_Q});

    // prepare write data to regs
    // performance counters
    assign icache_hit_miss_cnt_src = ICACHE_CS_HIT ? icache_hit_cnt_Q : icache_miss_cnt_Q;
    assign icache_hit_miss_cnt_D = perf_cnt_clear ? {CACHE_DATA_BITS{1'b0}} : (icache_hit_miss_cnt_src + 1'b1);
    assign icache_hit_cnt_D = icache_hit_miss_cnt_D;
    assign icache_miss_cnt_D = icache_hit_miss_cnt_D;

    assign dcache_hit_miss_cnt_src = DCACHE_CS_HIT ? dcache_hit_cnt_Q : dcache_miss_cnt_Q;
    assign dcache_hit_miss_cnt_D = perf_cnt_clear ? {CACHE_DATA_BITS{1'b0}} : (dcache_hit_miss_cnt_src + 1'b1);
    assign dcache_hit_cnt_D = dcache_hit_miss_cnt_D;
    assign dcache_miss_cnt_D = dcache_hit_miss_cnt_D;
    assign dcache_mem_error_D = ~perf_cnt_clear;

    // write-through register
    assign wt_reg_accessed = (regs_index == CSR_DCACHE_WRITETHROUGH);

    // control and status registers
    // performance counters
    assign icache_hit_cnt_WE = perf_cnt_clear | ICACHE_CS_HIT;
    assign icache_miss_cnt_WE = perf_cnt_clear | ICACHE_CS_MIS;

    assign dcache_hit_cnt_WE = perf_cnt_clear | DCACHE_CS_HIT;
    assign dcache_miss_cnt_WE = perf_cnt_clear | DCACHE_CS_MIS;
    assign dcache_mem_error_WE = perf_cnt_clear | DCACHE_CS_MEM_ERROR;
    
    // eviction error output pulse generation
    assign eviction_error_rising_edge = DCACHE_CS_MEM_ERROR & ~eviction_error_delay_reg_Q;

    // CSU outputs
    assign DCACHE_CS_WT    = wt_reg_Q;
    assign DCACHE_CS_CSR   = csu_request;
    assign DCACHE_CS_HPROT = csu_hprot_Q;
    assign DCACHE_CS_HMASTLOCK = csu_hmastlock_Q;
    assign CSOUT_HREADYIN  = CSIN_HREADYIN & ready_out;
    assign CSIN_HRDATA     = (csu_request == 1'b1) ? regs_data : CSOUT_HRDATA;
    assign CSIN_HREADYOUT  = ready_out & CSOUT_HREADYOUT;
    assign CSIN_HRESP      = (error_out == 1'b1) ? 1'b1 : CSOUT_HRESP;
    assign WFI_BUSY        = ~(next_state == STATE_IDLE);
    assign EVICTION_ERROR  = eviction_error_rising_edge;

endmodule
