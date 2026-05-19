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
 *  \file   codasip_dcache_maintenance_unit.v
 *  \author Jakub Drbal
 *  \email  support@codasip.com
 *  \date   Wed Sep 2 2015
 *  \brief  cache maintenance controler
 */

module codasip_dcache_maintenance_unit #(
    parameter integer TAG_BITS        = 32'sd19,
    parameter integer INDEX_BITS      = 32'sd8,
    parameter integer ASSOCIATIVITY   = 32'sd4,
    parameter integer SET_LINE_COUNT  = 32'sd256,
    parameter integer CACHE_LINE_BITS = 32'sd256,
    parameter [0:0]   SEPARATE_RW_CHANNELS = 1'b0,
    parameter [0:0]   RESET_LEVEL     = 1'b0,
    parameter [0:0]   RESET_SYNC      = 1'b1
)(
    input  wire                       CLK,
    input  wire                       RST,
    // WFI busy
    output wire                       WFI_BUSY,
    // cache management port
    // status
    output reg                        CM_STATUSOUT,
    // request
    input  wire [2:0]                 CM_REQ,
    input  wire                       CM_REQVAL,
    // address
    input  wire [TAG_BITS-1:0]        CM_TAGIN,
    input  wire [INDEX_BITS-1:0]      CM_INDEXIN,
    input  wire [3:0]                 CM_HPROTIN,
    input  wire                       CM_HMASTLOCKIN,
    // fetch request
    input  wire                       CM_FEREQVAL,
    // response
    output reg                        CM_DONE,
    // linefill buffer port
    // data
    input  wire [CACHE_LINE_BITS-1:0] LFB_DATAIN,
    input  wire                       LFB_DIRTYFLAG,
    // address
    input  wire [TAG_BITS-1:0]        LFB_TAGIN,
    input  wire [INDEX_BITS-1:0]      LFB_INDEXIN,
    input  wire [3:0]                 LFB_HPROTIN,
    input  wire                       LFB_HMASTLOCKIN,
    // control
    input  wire                       LFB_FULL,
    input  wire                       LFB_ERROR,
    output reg                        LFB_CLR,
    // eviction buffer port
    // data
    output wire [CACHE_LINE_BITS-1:0] EB_DATAOUT,
    // address
    output reg  [TAG_BITS-1:0]        EB_TAGOUT,
    output reg  [INDEX_BITS-1:0]      EB_INDEXOUT,
    output reg  [3:0]                 EB_HPROTOUT,
    output reg                        EB_HMASTLOCKOUT,
    // control
    input  wire                       EB_EMPTY,
    input  wire                       EB_CLR,
    output reg                        EB_WE,
    // data management port
    // data in out
    input  wire [CACHE_LINE_BITS-1:0] UC_DATAIN,
    output wire [CACHE_LINE_BITS-1:0] UC_DATAOUT,
    // input address
    output reg  [TAG_BITS-1:0]        UC_TAGIN,
    output reg  [INDEX_BITS-1:0]      UC_INDEXIN,
    // output infos
    input  wire                       UC_HIT,
    input  wire [ASSOCIATIVITY-1:0]   UC_WAYOUT,
    input  wire [TAG_BITS-1:0]        UC_TAGOUT,
    input  wire [INDEX_BITS-1:0]      UC_INDEXOUT,
    input  wire [ASSOCIATIVITY-1:0]   UC_DBOUT,
    // control signals
    output reg                        UC_VALID,
    output reg                        UC_AEN,
    output reg                        UC_DEN,
    output reg                        UC_DWE,
    output reg                        UC_BWE,
    // tags management port
    output reg                        UC_AM,
    output reg  [ASSOCIATIVITY-1:0]   UC_WAYIN,
    output reg                        UC_CLR,
    output wire [TAG_BITS-1:0]        UC_TAGWIN,
    output reg                        UC_TAGWE,
    output reg                        UC_DSET,
    output reg                        UC_DCLR,
    // replacement info port
    output reg                        RC_EN,
    input  wire [ASSOCIATIVITY-1:0]   RC_REPLWAY
);

    // request command type
    localparam [2:0] REQ_INVALIDATE      = 3'b000;
    localparam [2:0] REQ_INVALIDATE_LINE = 3'b001;
    localparam [2:0] REQ_INVALIDATE_ALL  = 3'b010;
    localparam [2:0] REQ_FLUSH           = 3'b011;
    localparam [2:0] REQ_FLUSH_LINE      = 3'b100;
    localparam [2:0] REQ_FLUSH_ALL       = 3'b101;
    localparam [2:0] REQ_ALLOCATE        = 3'b110;
    // states
    localparam [3:0] STATE_IDLE              = 4'b0000;
    localparam [3:0] STATE_LINE_ALLOC        = 4'b0001;
    localparam [3:0] STATE_LINE_ALLOC_FINISH = 4'b0010;
    localparam [3:0] STATE_FLUSH_FIRST       = 4'b0011;
    localparam [3:0] STATE_FLUSH_SECOND      = 4'b0100;
    localparam [3:0] STATE_FLUSH_LINE        = 4'b0101;
    localparam [3:0] STATE_FLUSH_ALL         = 4'b0110;
    localparam [3:0] STATE_EBUFF_WRITE       = 4'b0111;
    localparam [3:0] STATE_INVALIDATE_FIRST  = 4'b1000;
    localparam [3:0] STATE_INVALIDATE_SECOND = 4'b1001;
    localparam [3:0] STATE_INVALIDATE_ALL    = 4'b1010;
    localparam [3:0] STATE_FLUSH_FINISH      = 4'b1011;
    // auxiliary constants
    // verilator lint_off WIDTH
    localparam [INDEX_BITS-1:0] LAST_INDEX = SET_LINE_COUNT - 32'd1;
    localparam [ASSOCIATIVITY-1:0] DEFAULT_WAY_INDEX = 32'd1;
    // verilator lint_on WIDTH

    wire [3:0] present_state;
    reg  [3:0] next_state;
    wire [3:0] ebuff_write_allocate_next_state;
    wire [3:0] ebuff_write_flush_line_next_state;
    // request signals
    reg  [2:0] req_D;
    wire [2:0] req_Q;
    // LFB error signals
    wire lfb_err_D;
    wire lfb_err_Q;
    wire lfb_err_WE;
    reg  lfb_err_clr;
    // counter signals
    wire [ASSOCIATIVITY-1:0] way_cnt_val_D;
    wire [ASSOCIATIVITY-1:0] way_cnt_val_Q;
    wire [ASSOCIATIVITY-1:0] way_cnt_val_inc;
    reg                      way_cnt_WE;
    reg                      way_cnt_clr;
    wire [INDEX_BITS-1:0] index_cnt_val_D;
    wire [INDEX_BITS-1:0] index_cnt_val_Q;
    wire [INDEX_BITS-1:0] index_cnt_val_inc;
    reg                   index_cnt_WE;
    wire [INDEX_BITS-1:0] cm_indexin_Q;
    reg                   cm_indexin_WE;
    // flush dbits raw conflict
    reg                   is_raw_conflict_D;
    wire                  is_raw_conflict_Q;
    // auxiliary signals
    wire is_dirty_wayout;
    wire is_dirty_waycnt;
    wire is_dirty_replway;
    wire is_last_way;
    wire is_last_index;
    wire is_hit_and_dirty;
    wire line_loading_is_done;
    wire is_hit_and_not_dirty;
    wire dirty_and_eb_is_empty;
    wire dirty_and_eb_is_full;
    wire is_curr_line_valid_index;
    wire is_curr_line_valid_count;
    wire last_way_not_dirty;
    wire last_way_last_index;
    wire last_way_not_last_index;

    // cm index register
    d_ff_rst_we_t #(
        .BIT_WIDTH(INDEX_BITS),
        .DEFAULT_VALUE({INDEX_BITS{1'b0}}),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) cm_indexin_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(cm_indexin_WE),
        .D(CM_INDEXIN),
        .Q(cm_indexin_Q)
    );

    // way counter register
    d_ff_rst_we_t #(
        .BIT_WIDTH(ASSOCIATIVITY),
        .DEFAULT_VALUE(DEFAULT_WAY_INDEX),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) way_counter_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(way_cnt_WE),
        .D(way_cnt_val_D),
        .Q(way_cnt_val_Q)
    );

    // index counter register
    d_ff_rst_we_t #(
        .BIT_WIDTH(INDEX_BITS),
        .DEFAULT_VALUE({INDEX_BITS{1'b0}}),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) index_counter_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(index_cnt_WE),
        .D(index_cnt_val_D),
        .Q(index_cnt_val_Q)
    );

    // dbits raw conflict register
    d_ff_rst_t #(
        .BIT_WIDTH(32'd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) dbits_raw_conflict_reg (
        .CLK(CLK),
        .RST(RST),
        .D(is_raw_conflict_D),
        .Q(is_raw_conflict_Q)
    );

    // request register
    d_ff_rst_t #(
        .BIT_WIDTH(32'd3),
        .DEFAULT_VALUE(REQ_INVALIDATE),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) req_reg (
        .CLK(CLK),
        .RST(RST),
        .D(req_D),
        .Q(req_Q)
    );
    
    // LFB error register
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) lbf_err_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(lfb_err_WE),
        .D(lfb_err_D),
        .Q(lfb_err_Q)
    );
    
    // control fsm state register
    d_ff_rst_t #(
        .BIT_WIDTH(32'd4),
        .DEFAULT_VALUE(STATE_INVALIDATE_ALL),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) state_reg (
        .CLK(CLK),
        .RST(RST),
        .D(next_state),
        .Q(present_state)
    );

    // control fsm transition logic
    always @(*)
    begin : state_dec
        case (present_state)
            STATE_IDLE: begin
                next_state = STATE_IDLE;
                if (CM_FEREQVAL == 1'b1) begin
                    next_state = STATE_LINE_ALLOC;
                end
                else if (CM_REQVAL == 1'b1) begin
                    case (CM_REQ)
                        REQ_FLUSH:
                            next_state = STATE_FLUSH_FIRST;
                        REQ_INVALIDATE:
                            next_state = STATE_INVALIDATE_FIRST;
                        REQ_FLUSH_LINE:
                            next_state = STATE_FLUSH_LINE;
                        REQ_FLUSH_ALL:
                            next_state = STATE_FLUSH_ALL;
                        REQ_INVALIDATE_LINE,
                        REQ_INVALIDATE_ALL:
                            next_state = STATE_INVALIDATE_ALL;
                        // disable code coverage for illegal branches, but leave the information for synthesis
                        // pragma coverage off
                        // VCS coverage off
                        default: begin
                            next_state = 4'bxxxx;
                        end
                        // pragma coverage on
                        // VCS coverage on
                    endcase
                end
            end

            STATE_LINE_ALLOC: begin
                if (is_dirty_replway == 1'b1) begin
                    if (EB_EMPTY == 1'b1) begin
                        next_state = STATE_LINE_ALLOC_FINISH;
                    end
                    else begin
                        next_state = STATE_EBUFF_WRITE;
                    end
                end
                else begin
                    next_state = STATE_LINE_ALLOC_FINISH;
                end
            end

            STATE_LINE_ALLOC_FINISH: begin
                if (line_loading_is_done == 1'b1) begin
                    next_state = STATE_IDLE;
                end
                else begin
                    next_state = STATE_LINE_ALLOC_FINISH;
                end
            end

            STATE_FLUSH_FIRST: begin
                if (is_hit_and_dirty == 1'b1) begin
                    if (EB_EMPTY == 1'b1) begin
                        next_state = STATE_FLUSH_FINISH;
                    end
                    else begin
                        next_state = STATE_EBUFF_WRITE;
                    end
                end
                else if (UC_HIT == 1'b0) begin
                    next_state = STATE_FLUSH_SECOND;
                end else if (EB_EMPTY == 1'b1) begin
                    next_state = STATE_IDLE;
                end else begin
                    next_state = STATE_FLUSH_FINISH;
                end
            end

            STATE_FLUSH_SECOND: begin
                if (is_hit_and_dirty == 1'b1) begin
                    if (EB_EMPTY == 1'b1) begin
                        next_state = STATE_FLUSH_FINISH;
                    end
                    else begin
                        next_state = STATE_EBUFF_WRITE;
                    end
                end else if (EB_EMPTY == 1'b1) begin
                    next_state = STATE_IDLE;
                end else begin
                    next_state = STATE_FLUSH_FINISH;
                end
            end

            STATE_FLUSH_LINE: begin
                next_state = STATE_FLUSH_LINE;
                if (is_curr_line_valid_index == 1'b1) begin
                    if (dirty_and_eb_is_full == 1'b1)
                        next_state = STATE_EBUFF_WRITE;
                    else if (last_way_not_dirty == 1'b1)
                        next_state = STATE_FLUSH_FINISH;
                end
            end

            STATE_FLUSH_ALL: begin
                next_state = STATE_FLUSH_ALL;
                if (is_curr_line_valid_count == 1'b1) begin
                    if (dirty_and_eb_is_full == 1'b1)
                        next_state = STATE_EBUFF_WRITE;
                    else if (is_last_index == 1'b1 && last_way_not_dirty == 1'b1)
                        next_state = STATE_FLUSH_FINISH;
                end
            end

            STATE_EBUFF_WRITE: begin
                next_state = STATE_EBUFF_WRITE;
                if (EB_EMPTY == 1'b1) begin
                    case (req_Q)
                        REQ_ALLOCATE:
                            next_state = ebuff_write_allocate_next_state;
                        REQ_FLUSH:
                            next_state = STATE_FLUSH_FINISH;
                        REQ_FLUSH_LINE:
                            next_state = ebuff_write_flush_line_next_state;
                        REQ_FLUSH_ALL: begin
                            if (last_way_last_index == 1'b1) begin
                                next_state = STATE_FLUSH_FINISH;
                            end
                            else begin
                                next_state = STATE_FLUSH_ALL;
                            end
                        end
                        // disable code coverage for illegal branches, but leave the information for synthesis
                        // pragma coverage off
                        // VCS coverage off
                        default: begin
                            next_state = 4'bxxxx;
                        end
                        // pragma coverage on
                        // VCS coverage on
                    endcase
                end
            end

            STATE_INVALIDATE_FIRST: begin
                if (UC_HIT == 1'b1)
                    next_state = STATE_IDLE;
                else
                    next_state = STATE_INVALIDATE_SECOND;
            end

            STATE_INVALIDATE_SECOND: begin
                next_state = STATE_IDLE;
            end

            STATE_INVALIDATE_ALL: begin
                if (req_Q == REQ_INVALIDATE_LINE) begin
                    next_state = STATE_IDLE;
                end
                else if (is_last_index == 1'b1) begin
                    next_state = STATE_IDLE;
                end
                else begin
                    next_state = STATE_INVALIDATE_ALL;
                end
            end

            STATE_FLUSH_FINISH: begin
                if (EB_EMPTY == 1'b1) begin
                    next_state = STATE_IDLE;
                end else begin
                    next_state = STATE_FLUSH_FINISH;
                end
            end

            // disable code coverage for illegal branches, but leave the information for synthesis
            // pragma coverage off
            // VCS coverage off
            default: begin
                next_state = 4'bxxxx;
            end
            // pragma coverage on
            // VCS coverage on
        endcase
    end

    // control fsm output logic - ucache signals
    always @(*)
    begin : ucache_output_dec
        // ucache
        UC_TAGIN   = {TAG_BITS{1'b0}};
        UC_INDEXIN = {INDEX_BITS{1'b0}};
        UC_VALID   = 1'b1;
        UC_AEN     = 1'b0;
        UC_DEN     = 1'b0;
        UC_DWE     = 1'b0;
        UC_BWE     = 1'b0;
        UC_AM      = 1'b0;
        UC_WAYIN   = {ASSOCIATIVITY{1'b0}};
        UC_CLR     = 1'b0;
        UC_TAGWE   = 1'b0;
        UC_DSET    = 1'b0;
        UC_DCLR    = 1'b0;
        is_raw_conflict_D = 1'b0;
        cm_indexin_WE = 1'b0;

        case (present_state)
            STATE_IDLE: begin
                if (CM_FEREQVAL == 1'b1) begin
                    UC_AM = 1'b1;
                    UC_INDEXIN = LFB_INDEXIN;
                    UC_AEN = 1'b1;
                    UC_DEN = 1'b1;
                end
                else if (CM_REQVAL == 1'b1) begin
                    cm_indexin_WE = 1'b1;
                    case (CM_REQ)
                        REQ_FLUSH: begin
                            UC_AEN = 1'b1;
                            UC_DEN = 1'b1;
                            UC_TAGIN = CM_TAGIN;
                            UC_INDEXIN = CM_INDEXIN;
                        end
                        REQ_INVALIDATE: begin
                            UC_AEN = 1'b1;
                            UC_DEN = 1'b1;
                            UC_TAGIN = CM_TAGIN;
                            UC_INDEXIN = CM_INDEXIN;
                        end
                        REQ_FLUSH_LINE: begin
                            UC_AM = 1'b1;
                            UC_AEN = 1'b1;
                            UC_DEN = 1'b1;
                            UC_INDEXIN = CM_INDEXIN;
                        end
                        REQ_FLUSH_ALL: begin
                            UC_AM = 1'b1;
                            UC_AEN = 1'b1;
                            UC_DEN = 1'b1;
                            UC_INDEXIN = index_cnt_val_Q;
                        end
                        REQ_INVALIDATE_LINE,
                        REQ_INVALIDATE_ALL: begin
                            UC_INDEXIN = {INDEX_BITS{1'b0}};
                        end
                        // disable code coverage for illegal branches, but leave the information for synthesis
                        // pragma coverage off
                        // VCS coverage off
                        default: begin
                            UC_INDEXIN = {INDEX_BITS{1'bx}};
                        end
                        // pragma coverage on
                        // VCS coverage on
                    endcase
                end
                else begin
                    UC_VALID = 1'b0;
                end
            end

            STATE_LINE_ALLOC: begin
                UC_INDEXIN = LFB_INDEXIN;
                UC_WAYIN = RC_REPLWAY;
                if (is_dirty_replway == 1'b1) begin
                    UC_AM  = 1'b1;
                    if (EB_EMPTY == 1'b1) begin
                        UC_DCLR = 1'b1;
                    end
                    else if (EB_CLR == 1'b1) begin
                        UC_AEN = 1'b1;
                        UC_DEN = 1'b1;
                    end
                end
            end

            STATE_LINE_ALLOC_FINISH: begin
                UC_INDEXIN = LFB_INDEXIN;
                UC_WAYIN = RC_REPLWAY;
                if (LFB_FULL == 1'b1) begin
                    UC_TAGIN = LFB_TAGIN;
                    UC_AEN = 1'b1;
                    UC_DEN = 1'b1;
                    UC_AM  = 1'b1;
                    UC_DSET = LFB_DIRTYFLAG;
                    UC_DCLR = ~LFB_DIRTYFLAG;
                    UC_DWE = 1'b1;
                    UC_TAGWE = 1'b1;
                end
            end

            STATE_FLUSH_FIRST: begin
                if (is_hit_and_dirty == 1'b1) begin
                    if (EB_EMPTY == 1'b1) begin
                        UC_INDEXIN = cm_indexin_Q;
                        UC_WAYIN = UC_WAYOUT;
                        UC_AM = 1'b1;
                        UC_DCLR = 1'b1;
                    end
                    else if (EB_CLR == 1'b1) begin
                        UC_AEN = 1'b1;
                        UC_DEN = 1'b1;
                        UC_TAGIN = CM_TAGIN;
                        UC_INDEXIN = cm_indexin_Q;
                    end
                end
                else if (UC_HIT == 1'b0) begin
                    UC_BWE = 1'b1;
                end
            end

            STATE_FLUSH_SECOND: begin
                if (is_hit_and_dirty == 1'b1) begin
                    if (EB_EMPTY == 1'b1) begin
                        UC_INDEXIN = cm_indexin_Q;
                        UC_WAYIN = UC_WAYOUT;
                        UC_AM = 1'b1;
                        UC_DCLR = 1'b1;
                    end
                    else if (EB_CLR == 1'b1) begin
                        UC_AEN = 1'b1;
                        UC_DEN = 1'b1;
                        UC_TAGIN = CM_TAGIN;
                        UC_INDEXIN = cm_indexin_Q;
                    end
                end
            end

            STATE_FLUSH_LINE: begin
                UC_AM = 1'b1;
                UC_WAYIN = way_cnt_val_Q;
                UC_INDEXIN = cm_indexin_Q;
                if (is_curr_line_valid_index == 1'b0) begin
                    UC_BWE = 1'b1;
                end
                else begin
                    UC_DCLR = is_dirty_waycnt;
                end
            end

            STATE_FLUSH_ALL: begin
                UC_AM = 1'b1;
                UC_WAYIN = way_cnt_val_Q;
                UC_AEN = 1'b1;
                UC_DEN = 1'b1;
                if (is_curr_line_valid_count == 1'b1) begin
                    UC_INDEXIN = index_cnt_val_inc;
                    UC_BWE = (~is_raw_conflict_Q) & (is_last_way) & (~is_dirty_waycnt);
                    if (is_dirty_waycnt == 1'b1) begin
                        UC_DCLR = 1'b1;
                        is_raw_conflict_D = 1'b1;
                        UC_INDEXIN = index_cnt_val_Q;
                    end
                end
                else begin
                    UC_INDEXIN = index_cnt_val_Q;
                    UC_BWE = (is_raw_conflict_Q == 1'b0);
                end
            end

            STATE_EBUFF_WRITE: begin
                // EBUFF clear = EB can be written in next cycle; prepare data
                // EBUFF empty = EB can be written
                case (req_Q)
                    REQ_ALLOCATE: begin
                        UC_WAYIN = RC_REPLWAY;
                        if (EB_CLR == 1'b1) begin
                            UC_AEN = 1'b1;
                            UC_DEN = 1'b1;
                            UC_AM = 1'b1;
                            UC_INDEXIN = LFB_INDEXIN;
                        end else if (EB_EMPTY == 1'b1) begin
                            UC_INDEXIN = LFB_INDEXIN;
                            UC_AM = 1'b1;
                            UC_DCLR = 1'b1;
                        end
                    end
                    REQ_FLUSH: begin
                        UC_WAYIN = UC_WAYOUT;
                        if (EB_CLR == 1'b1) begin
                            UC_AEN = 1'b1;
                            UC_DEN = 1'b1;
                            UC_TAGIN = CM_TAGIN;
                            UC_INDEXIN = cm_indexin_Q;
                        end else if (EB_EMPTY == 1'b1) begin
                            UC_INDEXIN = cm_indexin_Q;
                            UC_AM = 1'b1;
                            UC_DCLR = 1'b1;
                        end
                    end
                    REQ_FLUSH_LINE: begin
                        UC_WAYIN = way_cnt_val_Q;
                        UC_INDEXIN = cm_indexin_Q;
                        UC_AM = EB_CLR | (EB_EMPTY & (~is_last_way));
                    end
                    REQ_FLUSH_ALL: begin
                        UC_WAYIN = way_cnt_val_Q;
                        if (EB_CLR == 1'b1) begin
                            UC_AEN = 1'b1;
                            UC_DEN = 1'b1;
                            UC_AM = 1'b1;
                            if (last_way_not_last_index == 1'b1)
                                UC_INDEXIN = index_cnt_val_inc;
                            else
                                UC_INDEXIN = index_cnt_val_Q;
                        end else if (EB_EMPTY == 1'b1) begin
                            UC_AEN = 1'b1;
                            UC_DEN = 1'b1;
                            UC_AM = 1'b1;
                            if (last_way_not_last_index == 1'b1) begin
                                UC_INDEXIN = index_cnt_val_inc;
                                UC_BWE = 1'b1;
                            end
                            else begin
                                UC_INDEXIN = index_cnt_val_Q;
                            end
                        end
                    end
                    // disable code coverage for illegal branches, but leave the information for synthesis
                    // pragma coverage off
                    // VCS coverage off
                    default: begin
                        UC_CLR = 1'bx;
                    end
                    // pragma coverage on
                    // VCS coverage on
                endcase
            end

            STATE_INVALIDATE_FIRST: begin
                if (UC_HIT == 1'b1) begin
                    UC_AM = 1'b1;
                    UC_WAYIN = UC_WAYOUT;
                    UC_INDEXIN = cm_indexin_Q;
                    UC_AEN = 1'b1;
                    UC_TAGWE = 1'b1;
                    UC_CLR = 1'b1;
                    UC_DCLR = 1'b1;
                end else begin
                    UC_BWE = 1'b1;
                end
            end

            STATE_INVALIDATE_SECOND: begin
                if (UC_HIT == 1'b1) begin
                    UC_AM = 1'b1;
                    UC_WAYIN = UC_WAYOUT;
                    UC_INDEXIN = cm_indexin_Q;
                    UC_AEN = 1'b1;
                    UC_TAGWE = 1'b1;
                    UC_CLR = 1'b1;
                    UC_DCLR = 1'b1;
                end
            end

            STATE_INVALIDATE_ALL: begin
                if (req_Q == REQ_INVALIDATE_LINE) begin
                    UC_INDEXIN = cm_indexin_Q;
                    UC_AEN   = 1'b1;
                    UC_TAGWE = 1'b1;
                    UC_CLR   = 1'b1;
                    UC_DCLR  = 1'b1;
                end
                else begin
                    UC_INDEXIN = index_cnt_val_Q;
                    UC_AEN   = 1'b1;
                    UC_TAGWE = 1'b1;
                    UC_CLR   = 1'b1;
                    UC_DCLR  = 1'b1;
                end
            end

            STATE_FLUSH_FINISH: begin
                UC_DEN = 1'b0;
            end

            // disable code coverage for illegal branches, but leave the information for synthesis
            // pragma coverage off
            // VCS coverage off
            default: begin
                UC_TAGIN   = {TAG_BITS{1'bx}};
                UC_INDEXIN = {INDEX_BITS{1'bx}};
                UC_VALID   = 1'bx;
                UC_AEN     = 1'bx;
                UC_DEN     = 1'bx;
                UC_DWE     = 1'bx;
                UC_BWE     = 1'bx;
                UC_AM      = 1'bx;
                UC_WAYIN   = {ASSOCIATIVITY{1'bx}};
                UC_CLR     = 1'bx;
                UC_TAGWE   = 1'bx;
                UC_DSET    = 1'bx;
                UC_DCLR    = 1'bx;
                is_raw_conflict_D = 1'bx;
                cm_indexin_WE = 1'bx;
            end
            // pragma coverage on
            // VCS coverage on

        endcase
    end

    // control fsm output logic - other signals
    always @(*)
    begin : others_output_dec
        // status out
        CM_STATUSOUT = 1'b0;
        // request register
        req_D = req_Q;
        // counters
        way_cnt_WE = 1'b0;
        way_cnt_clr = 1'b0;
        index_cnt_WE = 1'b0;
        // management port
        CM_DONE = 1'b0;
        // linefill buffer
        LFB_CLR = 1'b0;
        lfb_err_clr = 1'b0;
        // eviction buffer
        EB_TAGOUT   = {TAG_BITS{1'b0}};
        EB_INDEXOUT = {INDEX_BITS{1'b0}};
        EB_HPROTOUT = 4'b0000;
        EB_HMASTLOCKOUT = 1'b0;
        EB_WE = 1'b0;
        // replacement info port
        RC_EN = 1'b0;

        case (present_state)
            STATE_IDLE: begin
                lfb_err_clr = (lfb_err_Q | LFB_ERROR);
                CM_STATUSOUT = 1'b1;
                if (CM_FEREQVAL == 1'b1) begin
                    RC_EN = 1'b1;
                    req_D = REQ_ALLOCATE;
                end
                else if (CM_REQVAL == 1'b1) begin
                    req_D = CM_REQ;
                end
            end

            STATE_LINE_ALLOC: begin
                if ((is_dirty_replway == 1'b1) && (EB_EMPTY == 1'b1)) begin
                    // EBUFF can be written, clear dbit and write EB
                    EB_TAGOUT = UC_TAGOUT;
                    EB_INDEXOUT = LFB_INDEXIN;
                    EB_HPROTOUT = LFB_HPROTIN;
                    EB_HMASTLOCKOUT = LFB_HMASTLOCKIN;
                    EB_WE = 1'b1;
                end
            end

            STATE_LINE_ALLOC_FINISH: begin
                LFB_CLR = LFB_FULL;
                lfb_err_clr = (lfb_err_Q | LFB_ERROR);
            end

            STATE_FLUSH_FIRST: begin
                EB_TAGOUT   = CM_TAGIN;
                EB_INDEXOUT = cm_indexin_Q;
                EB_HPROTOUT = CM_HPROTIN;
                EB_HMASTLOCKOUT = CM_HMASTLOCKIN;
                if ((is_hit_and_dirty == 1'b1) && (EB_EMPTY == 1'b1)) begin
                    EB_WE = 1'b1;
                end
                else if (is_hit_and_not_dirty == 1'b1) begin
                    CM_DONE = EB_EMPTY;
                end
            end

            STATE_FLUSH_SECOND: begin
                EB_TAGOUT   = CM_TAGIN;
                EB_INDEXOUT = cm_indexin_Q;
                EB_HPROTOUT = CM_HPROTIN;
                EB_HMASTLOCKOUT = CM_HMASTLOCKIN;
                if (is_hit_and_dirty == 1'b1) begin
                    EB_WE = EB_EMPTY;
                end
                else begin
                    CM_DONE = EB_EMPTY;
                end
            end

            STATE_FLUSH_LINE: begin
                EB_TAGOUT = UC_TAGOUT;
                EB_INDEXOUT = cm_indexin_Q;
                EB_HPROTOUT = CM_HPROTIN;
                EB_HMASTLOCKOUT = CM_HMASTLOCKIN;
                EB_WE = is_curr_line_valid_index & dirty_and_eb_is_empty;
                if ((is_curr_line_valid_index == 1'b1) && (is_dirty_waycnt == 1'b0)) begin
                    way_cnt_WE = 1'b1;
                    way_cnt_clr = is_last_way;
                end
            end

            STATE_FLUSH_ALL: begin
                EB_TAGOUT = UC_TAGOUT;
                EB_INDEXOUT = index_cnt_val_Q;
                EB_HPROTOUT = CM_HPROTIN;
                EB_HMASTLOCKOUT = CM_HMASTLOCKIN;
                if (is_curr_line_valid_count == 1'b1) begin
                    if (dirty_and_eb_is_empty == 1'b1) begin
                        EB_WE = 1'b1;
                    end
                    else if (is_dirty_waycnt == 1'b0) begin
                        way_cnt_WE = 1'b1;
                        if (is_last_way == 1'b1) begin
                            way_cnt_clr = 1'b1;
                            index_cnt_WE = 1'b1;
                        end
                    end
                end
            end

            STATE_EBUFF_WRITE: begin
                case (req_Q)
                    REQ_ALLOCATE: begin
                        EB_TAGOUT   = UC_TAGOUT;
                        EB_INDEXOUT = LFB_INDEXIN;
                        EB_HPROTOUT = LFB_HPROTIN;
                        EB_HMASTLOCKOUT = LFB_HMASTLOCKIN;
                    end
                    REQ_FLUSH: begin
                        EB_TAGOUT   = CM_TAGIN;
                        EB_INDEXOUT = cm_indexin_Q;
                        EB_HPROTOUT = CM_HPROTIN;
                        EB_HMASTLOCKOUT = CM_HMASTLOCKIN;
                    end
                    REQ_FLUSH_LINE: begin
                        EB_TAGOUT   = UC_TAGOUT;
                        EB_INDEXOUT = cm_indexin_Q;
                        EB_HPROTOUT = CM_HPROTIN;
                        EB_HMASTLOCKOUT = CM_HMASTLOCKIN;
                    end
                    REQ_FLUSH_ALL: begin
                        EB_TAGOUT   = UC_TAGOUT;
                        EB_INDEXOUT = index_cnt_val_Q;
                        EB_HPROTOUT = CM_HPROTIN;
                        EB_HMASTLOCKOUT = CM_HMASTLOCKIN;
                    end
                    // disable code coverage for illegal branches, but leave the information for synthesis
                    // pragma coverage off
                    // VCS coverage off
                    default: begin
                        EB_TAGOUT   = {TAG_BITS{1'bx}};
                        EB_INDEXOUT = {INDEX_BITS{1'bx}};
                        EB_HPROTOUT = 4'bxxxx;
                        EB_HMASTLOCKOUT = 1'bx;
                    end
                    // pragma coverage on
                    // VCS coverage on
                endcase
                if (EB_EMPTY == 1'b1) begin
                    case (req_Q)
                        REQ_ALLOCATE: begin
                            EB_WE = 1'b1;
                            lfb_err_clr = (lfb_err_Q | LFB_ERROR);
                        end
                        REQ_FLUSH: begin
                            EB_WE = 1'b1;
                        end
                        REQ_FLUSH_LINE: begin
                            EB_WE = 1'b1;
                            way_cnt_WE = 1'b1;
                            if (is_last_way == 1'b1) begin
                                way_cnt_clr = 1'b1;
                            end
                        end
                        REQ_FLUSH_ALL: begin
                            EB_WE = 1'b1;
                            way_cnt_WE = 1'b1;
                            if (is_last_way == 1'b1) begin
                                way_cnt_clr = 1'b1;
                                index_cnt_WE = 1'b1;
                            end
                        end
                        // disable code coverage for illegal branches, but leave the information for synthesis
                        // pragma coverage off
                        // VCS coverage off
                        default: begin
                            CM_DONE = 1'bx;
                        end
                        // pragma coverage on
                        // VCS coverage on
                    endcase
                end
            end

            STATE_INVALIDATE_FIRST: begin
                CM_DONE = UC_HIT;
            end

            STATE_INVALIDATE_SECOND: begin
                CM_DONE = 1'b1;
            end

            STATE_INVALIDATE_ALL: begin
                if (req_Q == REQ_INVALIDATE_LINE) begin
                    CM_DONE = 1'b1;
                end
                else begin
                    index_cnt_WE = 1'b1;
                    CM_DONE = is_last_index;
                end
            end

            STATE_FLUSH_FINISH: begin
                CM_DONE = EB_EMPTY;
            end

            // disable code coverage for illegal branches, but leave the information for synthesis
            // pragma coverage off
            // VCS coverage off
            default: begin
                CM_STATUSOUT = 1'bx;
                req_D = 3'bxxx;
                way_cnt_WE = 1'bx;
                way_cnt_clr = 1'bx;
                index_cnt_WE = 1'bx;
                CM_DONE = 1'bx;
                LFB_CLR = 1'bx;
                lfb_err_clr = 1'bx;
                EB_TAGOUT   = {TAG_BITS{1'bx}};
                EB_INDEXOUT = {INDEX_BITS{1'bx}};
                EB_HPROTOUT = 4'bxxxx;
                EB_HMASTLOCKOUT = 1'bx;
                EB_WE = 1'bx;
                RC_EN = 1'bx;
            end
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    
    generate if (SEPARATE_RW_CHANNELS == 1'b0) begin
        // AHB3-Lite
        assign ebuff_write_allocate_next_state = STATE_LINE_ALLOC_FINISH;
    end else begin
        // AXI4/AXI4-Lite
        assign ebuff_write_allocate_next_state = ((LFB_ERROR == 1'b1) || (lfb_err_Q == 1'b1)) ? STATE_IDLE : STATE_LINE_ALLOC_FINISH;
    end endgenerate
    
    generate if (ASSOCIATIVITY == 32'd1) begin
        // Directly mapped
        assign ebuff_write_flush_line_next_state = STATE_FLUSH_FINISH;
    end else begin
        // Associative
        assign ebuff_write_flush_line_next_state = (is_last_way == 1'b1) ? STATE_FLUSH_FINISH : STATE_FLUSH_LINE;
    end endgenerate
    
    // auxiliary signals
    assign is_dirty_wayout          = (UC_DBOUT & UC_WAYOUT) != {ASSOCIATIVITY{1'b0}};
    assign is_dirty_waycnt          = (UC_DBOUT & way_cnt_val_Q) != {ASSOCIATIVITY{1'b0}};
    assign is_dirty_replway         = (UC_DBOUT & RC_REPLWAY) != {ASSOCIATIVITY{1'b0}};
    assign is_hit_and_dirty         = UC_HIT & is_dirty_wayout;
    assign is_hit_and_not_dirty     = UC_HIT & ~is_dirty_wayout;
    assign is_last_way              = way_cnt_val_Q[ASSOCIATIVITY-1];
    assign is_last_index            = (index_cnt_val_Q == LAST_INDEX);
    assign line_loading_is_done     = LFB_FULL | LFB_ERROR | lfb_err_Q;
    assign dirty_and_eb_is_empty    = is_dirty_waycnt & EB_EMPTY;
    assign dirty_and_eb_is_full     = is_dirty_waycnt & ~EB_EMPTY;
    assign is_curr_line_valid_index = (UC_INDEXOUT == cm_indexin_Q);
    assign is_curr_line_valid_count = (UC_INDEXOUT == index_cnt_val_Q);
    assign last_way_not_dirty       = is_last_way & ~is_dirty_waycnt;
    assign last_way_last_index      = is_last_way & is_last_index;
    assign last_way_not_last_index  = is_last_way & ~is_last_index;
    
    // counters
    assign way_cnt_val_inc   = way_cnt_val_Q << 1;
    assign index_cnt_val_inc = index_cnt_val_Q + 1'b1;
    assign way_cnt_val_D     = (way_cnt_clr == 1'b1) ? DEFAULT_WAY_INDEX : way_cnt_val_inc;
    assign index_cnt_val_D   = (is_last_index == 1'b1) ? {INDEX_BITS{1'b0}} : index_cnt_val_inc;
    
    // LFB error register
    assign lfb_err_D = (lfb_err_clr == 1'b1) ? 1'b0 : LFB_ERROR;
    assign lfb_err_WE = lfb_err_clr | LFB_ERROR;
    
    // output assignment
    assign UC_TAGWIN = ((present_state == STATE_INVALIDATE_FIRST) || (present_state == STATE_INVALIDATE_SECOND) ||
        (present_state == STATE_INVALIDATE_ALL)) ? {TAG_BITS{1'b0}} : LFB_TAGIN;
    assign UC_DATAOUT = LFB_DATAIN;
    assign EB_DATAOUT = UC_DATAIN;
    assign WFI_BUSY = ~(present_state == STATE_IDLE) | ~EB_EMPTY;

endmodule
