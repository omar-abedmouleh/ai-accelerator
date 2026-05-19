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
 *  \file   codasip_icache_port_unit_ahb.v
 *  \author Jakub Drbal
 *  \email  support@codasip.com
 *  \date   Wed Sep 2 2015
 *  \brief  interface for communication with processor
 */

module codasip_icache_port_unit_ahb #(
    parameter integer CACHE_ADDR_BITS = 32'sd32,
    parameter integer CACHE_DATA_BITS = 32'sd32,
    parameter integer TAG_BITS        = 32'sd20,
    parameter integer INDEX_BITS      = 32'sd7,
    parameter integer OFFSET_BITS     = 32'sd3,
    parameter integer SBI_BITS        = 32'sd2,
    parameter [0:0] CACHE_IS_LITTLE   = 1'b0,
    parameter [0:0] RESET_LEVEL       = 1'b0,
    parameter [0:0] RESET_SYNC        = 1'b1
)(
    input wire                        CLK,
    input wire                        RST,
    // WFI busy
    output wire                       WFI_BUSY,
    // AHB interface
    input wire [CACHE_ADDR_BITS-1:0]  CACHE_HADDR0,
    // currently the signal is unused, but it is integral part of the interface
    // verilator lint_off UNUSED
    input wire [2:0]                  CACHE_HBURST0,
    // verilator lint_on UNUSED
    input wire                        CACHE_HMASTLOCK0,
    input wire [3:0]                  CACHE_HPROT0,
    input wire [2:0]                  CACHE_HSIZE0,
    // currently only bit 1 is used
    // verilator lint_off UNUSED
    input wire [1:0]                  CACHE_HTRANS0,
    // verilator lint_on UNUSED
    input wire                        CACHE_HWRITE0,
    input wire                        CACHE_HREADYIN0,
    input wire                        CACHE_HSEL0,
    output reg [CACHE_DATA_BITS-1:0]  CACHE_HRDATA0,
    output reg                        CACHE_HREADYOUT0,
    output reg                        CACHE_HRESP0,
    // ucache interface
    // data in out
    input wire [CACHE_DATA_BITS-1:0]  UC_DATAIN,
    // input address
    output wire [TAG_BITS-1:0]        UC_TAG,
    output wire [INDEX_BITS-1:0]      UC_INDEX,
    output wire [OFFSET_BITS-1:0]     UC_OFFSET,
    // output infos
    input wire                        UC_HIT,
    // control signals
    output reg                        UC_AEN,
    output reg                        UC_DEN,
    output reg                        UC_BWE,
    // switch interface
    // status
    input wire                        SWM_STATUSIN,
    output reg                        SWM_STATUSOUT,
    // request
        // noncacheable
    output reg                        SWM_NCREQVAL,
        // fetch
    output reg                        SWM_FEREQVAL,
    // response
    input wire                        SWM_RESPVAL,
    // input address
    output wire [TAG_BITS-1:0]        SWM_TAG,
    output wire [INDEX_BITS-1:0]      SWM_INDEX,
    output wire [OFFSET_BITS-1:0]     SWM_OFFSET,
    output wire [SBI_BITS-1:0]        SWM_SBI,
    output wire [2:0]                 SWM_HSIZE,
    output wire [3:0]                 SWM_HPROT,
    output wire                       SWM_HMASTLOCK,
    // data in/out
    input wire [CACHE_DATA_BITS-1:0]  SWM_DATAIN,
    input wire                        SWM_DATAINVAL,
    // control interface
    // control request asserted
    input wire                        CC_REQVAL,
    // performance info
    output reg                        CC_HIT,
    output reg                        CC_MIS
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
    
    localparam integer BYTE_BITS      = 32'sd8;
    localparam integer BYTES_PER_WORD = (CACHE_DATA_BITS/BYTE_BITS);
    localparam integer OFFSET_LSB_IDX = SBI_BITS;
    localparam integer INDEX_LSB_IDX  = (OFFSET_LSB_IDX + OFFSET_BITS);
    localparam integer TAG_LSB_IDX    = (INDEX_LSB_IDX + INDEX_BITS);
    // verilator lint_off WIDTH
    localparam [2:0] MAX_HSIZE = log2(BYTES_PER_WORD);
    localparam [SBI_BITS-1:0] MASK = BYTES_PER_WORD - 32'sd1;
    // verilator lint_on WIDTH
    //states
    localparam [2:0] STATE_IDLE           = 3'b000;
    localparam [2:0] STATE_FIRST_ERROR    = 3'b001;
    localparam [2:0] STATE_SECOND_ERROR   = 3'b010;
    localparam [2:0] STATE_FIRST_HIT      = 3'b011;
    localparam [2:0] STATE_SECOND_HIT     = 3'b100;
    localparam [2:0] STATE_MISS           = 3'b101;
    localparam [2:0] STATE_NCREQ          = 3'b110;

    // fsm states
    wire [2:0] present_state;
    reg  [2:0] next_state;
    // error signal
    wire aligned;
    wire error;
    // address signal
    wire [TAG_BITS-1:0]    tag_D;
    wire [INDEX_BITS-1:0]  index_D;
    wire [OFFSET_BITS-1:0] offset_D;
    wire [SBI_BITS-1:0]    sbi_D;
    // request registered signals
    wire                   req_WE;
    wire                   req_Q;
    wire                   req_D;
    wire [TAG_BITS-1:0]    tag_Q;
    wire [INDEX_BITS-1:0]  index_Q;
    wire [OFFSET_BITS-1:0] offset_Q;
    wire [SBI_BITS-1:0]    sbi_Q;
    wire [2:0]             hsize_Q;
    wire [3:0]             hprot_Q;
    wire                   hmastlock_Q;
    // data without decoded subblock
    wire [CACHE_DATA_BITS-1:0] data_out;
    // load to register enable signals
    reg  req_load_en;
    reg  req_clr_en;
    // auxiliary signals
    wire is_new_transaction;
    wire is_new_hit;
    wire no_error_no_cc;
    wire registered_address;
    
    // request register
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) req_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(req_WE),
        .D(req_D),
        .Q(req_Q)
    );

    // tag register
    d_ff_rst_we_t #(
        .BIT_WIDTH(TAG_BITS),
        .DEFAULT_VALUE({TAG_BITS{1'b0}}),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) tag_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(req_load_en),
        .D(tag_D),
        .Q(tag_Q)
    );

    // index register
    d_ff_rst_we_t #(
        .BIT_WIDTH(INDEX_BITS),
        .DEFAULT_VALUE({INDEX_BITS{1'b0}}),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) index_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(req_load_en),
        .D(index_D),
        .Q(index_Q)
    );

    // offset register
    d_ff_rst_we_t #(
        .BIT_WIDTH(OFFSET_BITS),
        .DEFAULT_VALUE({OFFSET_BITS{1'b0}}),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) offset_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(req_load_en),
        .D(offset_D),
        .Q(offset_Q)
    );

    // sbi register
    d_ff_rst_we_t #(
        .BIT_WIDTH(SBI_BITS),
        .DEFAULT_VALUE({SBI_BITS{1'b0}}),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) sbi_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(req_load_en),
        .D(sbi_D),
        .Q(sbi_Q)
    );

    // hsize register
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'd3),
        .DEFAULT_VALUE(3'b000),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) hsize_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(req_load_en),
        .D(CACHE_HSIZE0),
        .Q(hsize_Q)
    );
    
    // hprot register
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'd4),
        .DEFAULT_VALUE(4'b0000),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) hprot_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(req_load_en),
        .D(CACHE_HPROT0),
        .Q(hprot_Q)
    );
    
    // hmastlock register
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) hmastlock_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(req_load_en),
        .D(CACHE_HMASTLOCK0),
        .Q(hmastlock_Q)
    );

    // control fsm state register
    d_ff_rst_t #(
        .BIT_WIDTH(32'd3),
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
    always @(*)
    begin : next_state_dec
        next_state = present_state;

        case (present_state)
            STATE_IDLE: begin
                if (is_new_hit == 1'b1) begin
                    if (req_Q == 1'b1) begin
                        next_state = STATE_FIRST_HIT;
                    end
                    else begin
                        if (is_new_transaction == 1'b1) begin
                            if (error == 1'b1) begin
                                next_state = STATE_FIRST_ERROR;
                            end
                            else begin
                                next_state = STATE_FIRST_HIT;
                            end
                        end
                    end
                end
                else if ((req_Q == 1'b0) && (is_new_transaction == 1'b1) && (error == 1'b1)) begin
                    next_state = STATE_FIRST_ERROR;
                end
            end

            STATE_FIRST_ERROR: begin
                next_state = STATE_SECOND_ERROR;
            end

            STATE_SECOND_ERROR: begin
                if (is_new_transaction == 1'b1) begin
                    if (error == 1'b1) begin
                        next_state = STATE_FIRST_ERROR;
                    end
                    else if (is_new_hit == 1'b1) begin
                        next_state = STATE_FIRST_HIT;
                    end
                    else begin
                        next_state = STATE_IDLE;
                    end
                end
                else begin
                    next_state = STATE_IDLE;
                end
            end

            STATE_FIRST_HIT: begin
                if (hprot_Q[3] == 1'b0) begin
                    next_state = STATE_NCREQ;
                end
                else begin
                    if (UC_HIT == 1'b1) begin
                        if (is_new_transaction == 1'b1) begin
                            if (error == 1'b1) begin
                                next_state = STATE_FIRST_ERROR;
                            end
                            else if (CC_REQVAL == 1'b0) begin
                                next_state = STATE_FIRST_HIT;
                            end
                            else begin
                                next_state = STATE_IDLE;
                            end
                        end
                        else begin
                            next_state = STATE_IDLE;
                        end
                    end
                    else begin
                        next_state = STATE_SECOND_HIT;
                    end
                end
            end

            STATE_SECOND_HIT: begin
                if (UC_HIT == 1'b1) begin
                    if (is_new_transaction == 1'b1) begin
                        if (error == 1'b1) begin
                            next_state = STATE_FIRST_ERROR;
                        end
                        else if (CC_REQVAL == 1'b0) begin
                            next_state = STATE_FIRST_HIT;
                        end
                        else begin
                            next_state = STATE_IDLE;
                        end
                    end
                    else begin
                        next_state = STATE_IDLE;
                    end
                end
                else begin
                    next_state = STATE_MISS;
                end
            end

            STATE_MISS: begin
                if (SWM_DATAINVAL == 1'b1) begin
                    if (is_new_transaction == 1'b1) begin
                        if (error == 1'b1) begin
                            next_state = STATE_FIRST_ERROR;
                        end
                        else begin
                            next_state = STATE_IDLE;
                        end
                    end
                    else begin
                        next_state = STATE_IDLE;
                    end
                end
                else if (SWM_RESPVAL == 1'b1) begin
                    next_state = STATE_SECOND_ERROR;
                end
            end

            STATE_NCREQ: begin
                if (SWM_DATAINVAL == 1'b1) begin
                    if (is_new_transaction == 1'b1) begin
                        if (error == 1'b1) begin
                            next_state = STATE_FIRST_ERROR;
                        end
                        else if (CC_REQVAL == 1'b0) begin
                            next_state = STATE_FIRST_HIT;
                        end
                        else begin
                            next_state = STATE_IDLE;
                        end
                    end
                    else begin
                        next_state = STATE_IDLE;
                    end
                end
                else if (SWM_RESPVAL == 1'b1) begin
                    next_state = STATE_SECOND_ERROR;
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
    
    // control fsm output logic
    always @(*)
    begin : fsm_output_dec
        CACHE_HREADYOUT0 = 1'b0;
        CACHE_HRESP0 = 1'b0;
        UC_AEN = 1'b0;
        UC_DEN = 1'b0;
        UC_BWE = 1'b0;
        SWM_STATUSOUT = 1'b0;
        SWM_NCREQVAL = 1'b0;
        SWM_FEREQVAL = 1'b0;
        CC_HIT = 1'b0;
        CC_MIS = 1'b0;
        req_load_en = 1'b0;
        req_clr_en = 1'b0;

        case (present_state)
            STATE_IDLE: begin
                SWM_STATUSOUT = 1'b1;
                if (is_new_hit == 1'b1) begin
                    if (req_Q == 1'b1) begin
                        UC_AEN = 1'b1;
                        UC_DEN = 1'b1;
                    end
                    else begin
                        CACHE_HREADYOUT0 = 1'b1;
                        if (is_new_transaction == 1'b1) begin
                            req_load_en = ~error;
                            if (error == 1'b0) begin
                                UC_AEN = 1'b1;
                                UC_DEN = 1'b1;
                            end
                        end
                    end
                end
                else if (req_Q == 1'b0) begin
                    CACHE_HREADYOUT0 = 1'b1;
                    if (is_new_transaction == 1'b1) begin
                        req_load_en = ~error;
                    end
                end
            end

            STATE_FIRST_ERROR: begin
                CACHE_HRESP0 = 1'b1;
            end

            STATE_SECOND_ERROR: begin
                CACHE_HREADYOUT0 = 1'b1;
                CACHE_HRESP0 = 1'b1;
                if (is_new_transaction == 1'b1) begin
                    req_load_en = ~error;
                    if ((error == 1'b0) && (is_new_hit == 1'b1)) begin
                        UC_AEN = 1'b1;
                        UC_DEN = 1'b1;
                    end
                end
                else begin
                    req_clr_en = 1'b1;
                end
            end

            STATE_FIRST_HIT: begin
                if (hprot_Q[3] == 1'b0) begin
                    SWM_NCREQVAL = 1'b1;
                end
                else begin
                    if (UC_HIT == 1'b1) begin
                        CC_HIT = 1'b1;
                        SWM_STATUSOUT = 1'b1;
                        CACHE_HREADYOUT0 = 1'b1;
                        if (is_new_transaction == 1'b1) begin
                            req_load_en = ~error;
                            if (no_error_no_cc == 1'b1) begin
                                UC_AEN = 1'b1;
                                UC_DEN = 1'b1;
                            end
                        end
                        else begin
                            req_clr_en = 1'b1;
                        end
                    end
                    else begin
                        UC_BWE = 1'b1;
                    end
                end
            end

            STATE_SECOND_HIT: begin
                if (UC_HIT == 1'b1) begin
                    CC_HIT = 1'b1;
                    SWM_STATUSOUT = 1'b1;
                    CACHE_HREADYOUT0 = 1'b1;
                    if (is_new_transaction == 1'b1) begin
                        req_load_en = ~error;
                        if (no_error_no_cc == 1'b1) begin
                            UC_AEN = 1'b1;
                            UC_DEN = 1'b1;
                        end
                    end
                    else begin
                        req_clr_en = 1'b1;
                    end
                end
                else begin
                    CC_MIS = 1'b1;
                    SWM_FEREQVAL = 1'b1;
                end
            end

            STATE_MISS: begin
                SWM_FEREQVAL = 1'b1;
                if (SWM_DATAINVAL == 1'b1) begin
                    CACHE_HREADYOUT0 = 1'b1;
                    if (is_new_transaction == 1'b1) begin
                        req_load_en = ~error;
                    end
                    else begin
                        req_clr_en = 1'b1;
                    end
                end
                else if (SWM_RESPVAL == 1'b1) begin
                    CACHE_HRESP0 = 1'b1;
                end
            end

            STATE_NCREQ: begin
                SWM_NCREQVAL = 1'b1;
                if (SWM_DATAINVAL == 1'b1) begin
                    CACHE_HREADYOUT0 = 1'b1;
                    if (is_new_transaction == 1'b1) begin
                        req_load_en = ~error;
                        if (no_error_no_cc == 1'b1) begin
                            UC_AEN = 1'b1;
                            UC_DEN = 1'b1;
                        end
                    end
                    else begin
                        req_clr_en = 1'b1;
                    end
                end
                else if (SWM_RESPVAL == 1'b1) begin
                    CACHE_HRESP0 = 1'b1;
                end
            end

            // disable code coverage for illegal branches, but leave the information for synthesis
            // pragma coverage off
            // VCS coverage off
            default: begin
                req_load_en = 1'bx;
                req_clr_en = 1'bx;
            end
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    
    // split address to tag, index and offset
    assign tag_D = CACHE_HADDR0[TAG_LSB_IDX+:TAG_BITS];
    assign index_D = CACHE_HADDR0[INDEX_LSB_IDX+:INDEX_BITS];
    assign offset_D = CACHE_HADDR0[OFFSET_LSB_IDX+:OFFSET_BITS];
    assign sbi_D = CACHE_HADDR0[SBI_BITS-1:0]; 

    // auxiliary signals
    assign data_out = ((present_state == STATE_FIRST_HIT) || (present_state == STATE_SECOND_HIT)) ? UC_DATAIN : SWM_DATAIN;
    assign is_new_transaction = (CACHE_HTRANS0[1] == 1'b1) && (CACHE_HREADYIN0 == 1'b1) && (CACHE_HSEL0 == 1'b1);
    assign is_new_hit = (SWM_STATUSIN == 1'b1) && (CC_REQVAL == 1'b0);
    assign no_error_no_cc = (error == 1'b0) && (CC_REQVAL == 1'b0);
    assign registered_address = ((present_state == STATE_IDLE) && (req_Q == 1'b1));

    // error condition decode
    assign aligned = ((sbi_D << (MAX_HSIZE - CACHE_HSIZE0)) & MASK) == {SBI_BITS{1'b0}};
    assign error = !((CACHE_HWRITE0 == 1'b0) && (CACHE_HSIZE0 <= MAX_HSIZE) && (aligned == 1'b1));

    // request register
    assign req_D = req_clr_en ? 1'b0 : 1'b1;
    assign req_WE = req_clr_en | req_load_en;

    // encode subblock
    generate if (CACHE_IS_LITTLE)
        always @(*)
        begin : subblock_data_little
            CACHE_HRDATA0 = data_out;
        end
    else
        always @(*)
        begin : subblock_data_big
            integer i;
            for (i=0; i<BYTES_PER_WORD; i=i+1) begin
                CACHE_HRDATA0[((BYTES_PER_WORD-i-1)*BYTE_BITS)+:BYTE_BITS] =
                    data_out[(i*BYTE_BITS)+:BYTE_BITS];
            end
        end
    endgenerate
    
    // output assignments
    assign UC_TAG = (registered_address == 1'b1) ? tag_Q : tag_D;
    assign UC_INDEX = (registered_address == 1'b1) ? index_Q : index_D;
    assign UC_OFFSET = (registered_address == 1'b1) ? offset_Q : offset_D;
    assign SWM_TAG = tag_Q;
    assign SWM_INDEX = index_Q;
    assign SWM_OFFSET = offset_Q;
    assign SWM_SBI = sbi_Q;
    assign SWM_HSIZE = hsize_Q;
    assign SWM_HPROT = hprot_Q;
    assign SWM_HMASTLOCK = hmastlock_Q;
    assign WFI_BUSY = ~(next_state == STATE_IDLE) | is_new_transaction;

endmodule
