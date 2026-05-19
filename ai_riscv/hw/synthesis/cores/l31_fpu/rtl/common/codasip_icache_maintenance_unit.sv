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
 *  \file   codasip_icache_maintenance_unit.v
 *  \author Jakub Drbal
 *  \email  support@codasip.com
 *  \date   Wed Sep 2 2015
 *  \brief  icache maintenance unit
 */

module codasip_icache_maintenance_unit #(
    parameter integer TAG_BITS        = 32'sd19,
    parameter integer INDEX_BITS      = 32'sd8,
    parameter integer ASSOCIATIVITY   = 32'sd4,
    parameter integer SET_LINE_COUNT  = 32'sd256,
    parameter integer CACHE_LINE_BITS = 32'sd256,
    parameter [0:0]   RESET_LEVEL     = 1'b0,
    parameter [0:0]   RESET_SYNC      = 1'b1
)(
    input wire                        CLK,
    input wire                        RST,
    // WFI busy
    output wire                       WFI_BUSY,
    // cache management port
    // status
    output reg                        CM_STATUSOUT,
    input  wire                       CM_STATUSIN,
    // request
    input wire [1:0]                  CM_REQ,
    input wire                        CM_REQVAL,
    // address
    input wire [TAG_BITS-1:0]         CM_TAGIN,
    input wire [INDEX_BITS-1:0]       CM_INDEXIN,
    // fetch request
    input  wire                       CM_FEREQVAL,
    // finish
    output reg                        CM_DONE,
    // linefill buffer port
    // data
    input wire [CACHE_LINE_BITS-1:0]  LFB_DATAIN,
    // address
    input wire [TAG_BITS-1:0]         LFB_TAGIN,
    input wire [INDEX_BITS-1:0]       LFB_INDEXIN,
    // control
    input  wire                       LFB_FULL,
    input  wire                       LFB_ERROR,
    // data management port
    // data in out
    output wire [CACHE_LINE_BITS-1:0] UC_DATAOUT,
    // input address
    output reg  [TAG_BITS-1:0]        UC_TAGIN,
    output reg  [INDEX_BITS-1:0]      UC_INDEXIN,
    // output infos
    input wire                        UC_HIT,
    input wire [ASSOCIATIVITY-1:0]    UC_WAYOUT,
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
    // replacement info port
    output reg                        RC_EN,
    input  wire [ASSOCIATIVITY-1:0]   RC_REPLWAY
);

    // request command type
    localparam [1:0] REQ_INVALIDATE      = 2'b00;
    localparam [1:0] REQ_INVALIDATE_LINE = 2'b01;
    //states
    localparam [2:0] STATE_IDLE              = 3'b000;
    localparam [2:0] STATE_LINE_ALLOC        = 3'b001;
    localparam [2:0] STATE_INVALIDATE_FIRST  = 3'b010;
    localparam [2:0] STATE_INVALIDATE_SECOND = 3'b011;
    localparam [2:0] STATE_INVALIDATE_LINE   = 3'b100;
    localparam [2:0] STATE_INVALIDATE_ALL    = 3'b101;
    // auxiliary constants
    // verilator lint_off WIDTH
    localparam [INDEX_BITS-1:0] LAST_INDEX = SET_LINE_COUNT - 32'd1;
    // verilator lint_on WIDTH

    wire [2:0] present_state;
    reg  [2:0] next_state;
    // counter signals
    wire [INDEX_BITS-1:0] index_cnt_val_D;
    wire [INDEX_BITS-1:0] index_cnt_val_Q;
    wire [INDEX_BITS-1:0] index_cnt_val_inc;
    reg                   index_cnt_WE;
    wire [INDEX_BITS-1:0] cm_indexin_Q;
    reg                   cm_indexin_WE;
    // auxiliary signals
    wire is_operation_accepted;
    wire is_last_index;
    
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

    // control fsm state register
    d_ff_rst_t #(
        .BIT_WIDTH(32'd3),
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
        next_state = present_state;

        case (present_state)
            STATE_IDLE: begin
                if (CM_FEREQVAL == 1'b1) begin
                    next_state = STATE_LINE_ALLOC;
                end
                else if (is_operation_accepted == 1'b1) begin
                    if (CM_REQ == REQ_INVALIDATE) begin
                        next_state = STATE_INVALIDATE_FIRST;
                    end
                    else if (CM_REQ == REQ_INVALIDATE_LINE) begin
                        next_state = STATE_INVALIDATE_LINE;
                    end
                    else begin // REQ_INVALIDATE_ALL
                        next_state = STATE_INVALIDATE_ALL;
                    end
                end else begin
                    next_state = STATE_IDLE;
                end
            end

            STATE_LINE_ALLOC: begin
                if (LFB_FULL == 1'b1 || LFB_ERROR == 1'b1) begin
                    next_state = STATE_IDLE;
                end else begin
                    next_state = STATE_LINE_ALLOC;
                end
            end

            STATE_INVALIDATE_FIRST: begin
                if (UC_HIT == 1'b1)
                    next_state = STATE_IDLE;
                else
                    next_state = STATE_INVALIDATE_SECOND;
            end

            STATE_INVALIDATE_SECOND: next_state = STATE_IDLE;

            STATE_INVALIDATE_LINE: next_state = STATE_IDLE;

            STATE_INVALIDATE_ALL: begin
                if (is_last_index == 1'b1) begin
                    next_state = STATE_IDLE;
                end else begin
                    next_state = STATE_INVALIDATE_ALL;
                end
            end

            // disable code coverage for illegal branches, but leave the information for synthesis
            // pragma coverage off
            // VCS coverage off
            default: begin
                next_state = 3'bxxx;
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
        cm_indexin_WE = 1'b0;

        case (present_state)
            STATE_IDLE: begin
                if (is_operation_accepted == 1'b1) begin
                    cm_indexin_WE = 1'b1;
                    if (CM_REQ == REQ_INVALIDATE) begin
                        UC_AEN = 1'b1;
                        UC_TAGIN = CM_TAGIN;
                        UC_INDEXIN = CM_INDEXIN;
                        UC_DEN = 1'b1;
                    end
                end
                else begin
                    UC_VALID = 1'b0;
                end
            end

            STATE_LINE_ALLOC: begin
                if (LFB_FULL == 1'b1) begin
                    UC_INDEXIN = LFB_INDEXIN;
                    UC_WAYIN = RC_REPLWAY;
                    UC_AEN = 1'b1;
                    UC_DEN = 1'b1;
                    UC_AM  = 1'b1;
                    UC_DWE = 1'b1;
                    UC_TAGWE = 1'b1;
                end
            end

            STATE_INVALIDATE_FIRST: begin
                if (UC_HIT == 1'b1) begin
                    UC_AM = 1'b1;
                    UC_WAYIN = UC_WAYOUT;
                    UC_INDEXIN = cm_indexin_Q;
                    UC_AEN   = 1'b1;
                    UC_TAGWE = 1'b1;
                    UC_CLR   = 1'b1;
                end else begin
                    UC_BWE = 1'b1;
                end
            end

            STATE_INVALIDATE_SECOND: begin
                if (UC_HIT == 1'b1) begin
                    UC_AM = 1'b1;
                    UC_WAYIN = UC_WAYOUT;
                    UC_INDEXIN = cm_indexin_Q;
                    UC_AEN   = 1'b1;
                    UC_TAGWE = 1'b1;
                    UC_CLR   = 1'b1;
                end
            end

            STATE_INVALIDATE_LINE: begin
                UC_INDEXIN = cm_indexin_Q;
                UC_AEN   = 1'b1;
                UC_TAGWE = 1'b1;
                UC_CLR   = 1'b1;
            end

            STATE_INVALIDATE_ALL: begin
                UC_INDEXIN = index_cnt_val_Q;
                UC_AEN   = 1'b1;
                UC_TAGWE = 1'b1;
                UC_CLR   = 1'b1;
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
        // counter
        index_cnt_WE = 1'b0;
        // finish
        CM_DONE = 1'b0;
        // replacement info port
        RC_EN = 1'b0;

        case (present_state)
            STATE_IDLE: begin
                CM_STATUSOUT = 1'b1;
                RC_EN = CM_FEREQVAL;
            end

            STATE_LINE_ALLOC: begin
                CM_DONE = 1'b0;
            end

            STATE_INVALIDATE_FIRST: begin
                CM_DONE = UC_HIT;
            end

            STATE_INVALIDATE_SECOND:
                CM_DONE = 1'b1;

            STATE_INVALIDATE_LINE:
                CM_DONE = 1'b1;

            STATE_INVALIDATE_ALL: begin
                index_cnt_WE = 1'b1;
                CM_DONE = is_last_index;
            end

            // disable code coverage for illegal branches, but leave the information for synthesis
            // pragma coverage off
            // VCS coverage off
            default: begin
                CM_STATUSOUT = 1'bx;
                index_cnt_WE = 1'bx;
                CM_DONE = 1'bx;
                RC_EN = 1'bx;
            end
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    
    // auxiliary signals
    assign is_operation_accepted = (CM_REQVAL == 1'b1) && (CM_STATUSIN == 1'b1);
    assign is_last_index = index_cnt_val_Q == LAST_INDEX;

    // counters
    assign index_cnt_val_inc  = index_cnt_val_Q + 1'b1;
    assign index_cnt_val_D    = (is_last_index == 1'b1) ? {INDEX_BITS{1'b0}} : index_cnt_val_inc;
    
    // output assignment
    assign UC_TAGWIN = ((present_state == STATE_IDLE) || (present_state == STATE_LINE_ALLOC)) ?
        LFB_TAGIN : {TAG_BITS{1'b0}};
    assign UC_DATAOUT = LFB_DATAIN;
    assign WFI_BUSY = ~(present_state == STATE_IDLE);

endmodule
