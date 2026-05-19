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
 *  \file   codasip_icache_bus_interface_unit_ahb.v
 *  \author Jakub Drbal
 *  \email  support@codasip.com
 *  \date   Wed Sep 2 2015
 *  \brief  switch between cache control and bus interface unit
 */

module codasip_icache_bus_interface_unit_ahb #(
    parameter integer RAM_DATA_BITS   = 32'sd32,
    parameter integer RAM_ADDR_BITS   = 32'sd32,
    parameter integer CACHE_DATA_BITS = 32'sd32,
    parameter integer TAG_BITS        = 32'sd20,
    parameter integer INDEX_BITS      = 32'sd7,
    parameter integer OFFSET_BITS     = 32'sd3,
    parameter integer SBI_BITS        = 32'sd2,
    parameter integer CACHE_LINE_BITS = 32'sd256,
    parameter [0:0]   CACHE_IS_LITTLE = 1'b0,
    parameter [0:0]   RESET_LEVEL     = 1'b0,
    parameter [0:0]   RESET_SYNC      = 1'b1
)(
    input wire CLK,
    input wire RST,
    // ahb port
    // standard data port/request interface
    output wire [RAM_ADDR_BITS-1:0]   ICACHE_MASTER_HADDR0,
    output wire [2:0]                 ICACHE_MASTER_HBURST0,
    output wire                       ICACHE_MASTER_HMASTLOCK0,
    output wire [3:0]                 ICACHE_MASTER_HPROT0,
    output wire [2:0]                 ICACHE_MASTER_HSIZE0,
    output wire [1:0]                 ICACHE_MASTER_HTRANS0,
    output wire                       ICACHE_MASTER_HWRITE0,
    input wire  [RAM_DATA_BITS-1:0]   ICACHE_MASTER_HRDATA0,
    input wire                        ICACHE_MASTER_HREADY0,
    input wire                        ICACHE_MASTER_HRESP0,
    // bus interface unit port
    // data
    output wire [CACHE_DATA_BITS-1:0] BIU_DATAOUT,
    output wire                       BIU_DATAOUTVAL,
    // address
    input wire [TAG_BITS-1:0]         BIU_TAGIN,
    input wire [INDEX_BITS-1:0]       BIU_INDEXIN,
    input wire [OFFSET_BITS-1:0]      BIU_OFFSETIN,
    input wire [SBI_BITS-1:0]         BIU_SBI,
    input wire [2:0]                  BIU_HSIZE,
    input wire [3:0]                  BIU_HPROT,
    input wire                        BIU_HMASTLOCK,
    // control
        // request
    input wire                        BIU_NCREQVAL,
    input wire                        BIU_FEREQVAL,
        // response
    output wire                       BIU_RESPVAL,
    // linefill buffer port
    // data
    output wire [CACHE_LINE_BITS-1:0] LFB_DATAOUT,
    // address
    output wire [TAG_BITS-1:0]        LFB_TAGOUT,
    output wire [INDEX_BITS-1:0]      LFB_INDEXOUT,
    // control
    output wire                       LFB_FULL,
    output wire                       LFB_ERROR
);
    // pragma coverage off
    // VCS coverage off

    // logarithm to the base of 2
    function automatic integer log2(input integer value);
        integer res;
    begin
        if (value == 32'sd1) begin
            res = 32'sd0;
        end else begin
            for (res = 32'sd0; value > 32'sd1; res = res + 32'sd1) begin
                value = value >> 32'd1;
            end
        end
        log2 = res;
    end
    endfunction

    // logarithm to the base of 2 (1 returns 1)
    function automatic integer log2x(input integer value);
        if (value == 32'sd1) begin
            log2x = 32'sd1;
        end else begin
            log2x = log2(value);
        end
    endfunction

    // burst type select
    function automatic [2:0] burst_select(input integer value);
        case (value)
            32'sd1: burst_select = 3'b000; // BURST_SINGLE
            32'sd4: burst_select = 3'b010; // BURST_WRAP4
            32'sd8: burst_select = 3'b100; // BURST_WRAP8
            32'sd16: burst_select = 3'b110; // BURST_WRAP16
            // different burst options are not supported
            default: burst_select = 3'b000;
        endcase
    endfunction

    // pragma coverage on
    // VCS coverage on

    localparam integer BYTE_BITS = 32'sd8;
    localparam integer BYTES_PER_RAM_WORD = RAM_DATA_BITS/BYTE_BITS;
    localparam integer RAM_SBI_BITS = log2(BYTES_PER_RAM_WORD);
    localparam integer RAM_WORDS_PER_LINE = CACHE_LINE_BITS/RAM_DATA_BITS;
    localparam integer RAM_OFFSET_BITS = log2x(RAM_WORDS_PER_LINE);
    // verilator lint_off WIDTH
    // AHB parameters
    localparam [2:0] HSIZE_VALUE = RAM_SBI_BITS;
    // verilator lint_on WIDTH
    localparam [2:0] HBURST_VALUE = burst_select(RAM_WORDS_PER_LINE);

    // FSM - state names (one-hot encoding)
    localparam [3:0] STATE_IDLE = 4'b0001;
    localparam [3:0] STATE_PHS_ADDR = 4'b0010;
    localparam [3:0] STATE_PHS_DATA = 4'b0100;
    localparam [3:0] STATE_FINISH = 4'b1000;

    // FSM state register
    wire [3:0] present_state;
    reg  [3:0] next_state;
    // FSM state decoding flags
    wire state_idle_wire;
    wire state_phs_addr_wire;
    wire state_phs_data_wire;
    wire state_finish_wire;

    // linefill buffer
    wire linefill_buffer_clr_wire;
    reg [RAM_DATA_BITS-1:0] linefill_buffer_data_wire;
    // bus master output registers
    wire [RAM_ADDR_BITS-1:0] haddr_Q;
    wire [TAG_BITS-1:0] addr_tag_reg_Q;
    wire [INDEX_BITS-1:0] addr_index_reg_Q;
    wire [RAM_SBI_BITS-1:0] addr_byte_index_reg_D;
    wire [RAM_SBI_BITS-1:0] addr_byte_index_reg_Q;
    wire [2:0] hburst_reg_Q;
    wire hmastlock_reg_Q;
    wire [3:0] hprot_reg_Q;
    wire [2:0] hsize_reg_D;
    wire [2:0] hsize_reg_Q;
    wire [1:0] htrans_reg_Q;
    // bus master input register
    wire hresp_delay_reg_Q;
    wire hresp_reg_WE;
    wire hresp_reg_Q;
    // word offset of currently processed data beat
    wire [RAM_OFFSET_BITS-1:0] data_offset_cnt_Q;
    // transfer helper signals
    wire trans_req_val_wire;
    wire trans_start_nc_req_wire;
    wire trans_init_regs_WE;
    wire trans_all_data_done_wire;
    wire trans_beat_done_wire;
    // select correct byte index based on the slave transfer size
    wire [RAM_SBI_BITS-1:0] byte_index_wire;

    // linefill buffer
    codasip_linefill_buffer_ro #(
        .RAM_DATA_BITS(RAM_DATA_BITS),
        .RAM_OFFSET_BITS(RAM_OFFSET_BITS),
        .CACHE_DATA_BITS(CACHE_DATA_BITS),
        .OFFSET_BITS(OFFSET_BITS),
        .CACHE_LINE_BITS(CACHE_LINE_BITS),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) linefill_buffer (
        .CLK(CLK),
        .RST(RST),
        .LFB_RAMWE(trans_beat_done_wire),
        .LFB_CLR(linefill_buffer_clr_wire),
        .LFB_CACHEOFFSET(BIU_OFFSETIN),
        .LFB_RAMOFFSET(data_offset_cnt_Q),
        .LFB_RAMDATAIN(linefill_buffer_data_wire),
        .LFB_CACHEDATAOUT(BIU_DATAOUT),
        .LFB_CACHEDATAOUTVAL(BIU_DATAOUTVAL),
        .LFB_DATAOUT(LFB_DATAOUT)
    );

    // address register - tag
    d_ff_rst_we_t #(
        .BIT_WIDTH(TAG_BITS),
        .DEFAULT_VALUE({TAG_BITS{1'b0}}),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) addr_tag_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(trans_init_regs_WE),
        .D(BIU_TAGIN),
        .Q(addr_tag_reg_Q)
    );

    // address register - cache line index
    d_ff_rst_we_t #(
        .BIT_WIDTH(INDEX_BITS),
        .DEFAULT_VALUE({INDEX_BITS{1'b0}}),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) addr_index_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(trans_init_regs_WE),
        .D(BIU_INDEXIN),
        .Q(addr_index_reg_Q)
    );

    // address register - byte index within the word
    d_ff_rst_we_t #(
        .BIT_WIDTH(RAM_SBI_BITS),
        .DEFAULT_VALUE({RAM_SBI_BITS{1'b0}}),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) addr_byte_index_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(trans_init_regs_WE),
        .D(addr_byte_index_reg_D),
        .Q(addr_byte_index_reg_Q)
    );

    // HMASTLOCK register
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) hmastlock_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(trans_init_regs_WE),
        .D(BIU_HMASTLOCK),
        .Q(hmastlock_reg_Q)
    );

    // HPROT register
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'd4),
        .DEFAULT_VALUE(4'h0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) hprot_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(trans_init_regs_WE),
        .D(BIU_HPROT),
        .Q(hprot_reg_Q)
    );

    // HSIZE register
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) hsize_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(trans_init_regs_WE),
        .D(hsize_reg_D),
        .Q(hsize_reg_Q)
    );

    // HRESP input register
    d_ff_rst_t #(
        .BIT_WIDTH(32'd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) hresp_delay_reg (
        .CLK(CLK),
        .RST(RST),
        .D(ICACHE_MASTER_HRESP0),
        .Q(hresp_delay_reg_Q)
    );

    // HRESP input register
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(RESET_LEVEL),
        .RESET_SYNC(RESET_SYNC)
    ) hresp_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(hresp_reg_WE),
        .D(ICACHE_MASTER_HRESP0),
        .Q(hresp_reg_Q)
    );

    // control fsm state register
    d_ff_rst_t #(
        .BIT_WIDTH(32'd4),
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
    always @(*) begin : state_dec
        case (present_state)
            STATE_IDLE: begin
                if (trans_req_val_wire == 1'b1) begin
                    next_state = STATE_PHS_ADDR;
                end else begin
                    next_state = STATE_IDLE;
                end
            end

            STATE_PHS_ADDR: begin
                next_state = STATE_PHS_DATA;
            end

            STATE_PHS_DATA: begin
                if (trans_all_data_done_wire == 1'b1) begin
                    next_state = STATE_FINISH;
                end else begin
                    next_state = STATE_PHS_DATA;
                end
            end

            STATE_FINISH: begin
                next_state = STATE_IDLE;
            end

            // disable code coverage for illegal branches, but leave the information for synthesis
            // pragma coverage off
            // VCS coverage off
            default: begin
                next_state = 4'hx;
            end
            // pragma coverage on
            // VCS coverage on
        endcase
    end

    // FSM state decoding flags
    assign state_idle_wire = present_state[0];
    assign state_phs_addr_wire = present_state[1];
    assign state_phs_data_wire = present_state[2];
    assign state_finish_wire = present_state[3];
    // internal signal drivers
    // BIU input requests must be mutually exclusive (in IDLE state)
    assign trans_req_val_wire = (BIU_NCREQVAL | BIU_FEREQVAL);
    assign trans_start_nc_req_wire = (state_idle_wire & BIU_NCREQVAL);
    // finished data phase for one beat of a transfer
    assign trans_beat_done_wire = (state_phs_data_wire & ICACHE_MASTER_HREADY0);
    // sample control registers when new transfer is requested
    assign trans_init_regs_WE = (state_idle_wire & trans_req_val_wire);

    generate if (RAM_WORDS_PER_LINE == 32'd1) begin : g_single_ram_word

        // always performing one beat per transaction, finished when slave is ready
        assign trans_all_data_done_wire = ICACHE_MASTER_HREADY0;
        // compute master offset from slave offset input
        assign data_offset_cnt_Q = {RAM_OFFSET_BITS{1'b0}};
        assign byte_index_wire = {BIU_OFFSETIN, BIU_SBI};
        // output signals
        assign haddr_Q = {addr_tag_reg_Q, addr_index_reg_Q, addr_byte_index_reg_Q};
        assign hburst_reg_Q = HBURST_VALUE;
        assign htrans_reg_Q = {state_phs_addr_wire, 1'b0};

    end else begin : g_multiple_ram_words

        // indicates whether the all addresses are accepted
        wire trans_all_addr_done_wire;
        wire [RAM_OFFSET_BITS-1:0] biu_offsetin_wire;
        // offset counters
        wire addr_offset_cnt_WE;
        wire [RAM_OFFSET_BITS-1:0] addr_offset_cnt_D;
        wire [RAM_OFFSET_BITS-1:0] addr_offset_cnt_Q;
        wire data_offset_cnt_WE;
        wire [RAM_OFFSET_BITS-1:0] data_offset_cnt_D;
        wire beat_cnt_reg_WE;
        wire [RAM_OFFSET_BITS-1:0] beat_cnt_reg_D;
        wire [RAM_OFFSET_BITS-1:0] beat_cnt_reg_Q;
        // bus master output register
        wire [2:0] hburst_reg_D;
        wire htrans_reg_WE;
        wire [1:0] htrans_reg_D;

        // HBURST register
        d_ff_rst_we_t #(
            .BIT_WIDTH(32'd3),
            .DEFAULT_VALUE(HBURST_VALUE),
            .RESET_LEVEL(RESET_LEVEL),
            .RESET_SYNC(RESET_SYNC)
        ) hburst_reg (
            .CLK(CLK),
            .RST(RST),
            .WE(trans_init_regs_WE),
            .D(hburst_reg_D),
            .Q(hburst_reg_Q)
        );

        // HTRANS register
        d_ff_rst_we_t #(
            .BIT_WIDTH(32'd2),
            .DEFAULT_VALUE(2'h0),
            .RESET_LEVEL(RESET_LEVEL),
            .RESET_SYNC(RESET_SYNC)
        ) htrans_reg (
            .CLK(CLK),
            .RST(RST),
            .WE(htrans_reg_WE),
            .D(htrans_reg_D),
            .Q(htrans_reg_Q)
        );

        // burst transfer - beat count register
        d_ff_rst_we_t #(
            .BIT_WIDTH(RAM_OFFSET_BITS),
            .DEFAULT_VALUE({RAM_OFFSET_BITS{1'b0}}),
            .RESET_LEVEL(RESET_LEVEL),
            .RESET_SYNC(RESET_SYNC)
        ) beat_cnt_reg (
            .CLK(CLK),
            .RST(RST),
            .WE(beat_cnt_reg_WE),
            .D(beat_cnt_reg_D),
            .Q(beat_cnt_reg_Q)
        );

        // address register/counter - word offset/index within the cache line
        d_ff_rst_we_t #(
            .BIT_WIDTH(RAM_OFFSET_BITS),
            .DEFAULT_VALUE({RAM_OFFSET_BITS{1'b0}}),
            .RESET_LEVEL(RESET_LEVEL),
            .RESET_SYNC(RESET_SYNC)
        ) addr_offset_cnt_reg (
            .CLK(CLK),
            .RST(RST),
            .WE(addr_offset_cnt_WE),
            .D(addr_offset_cnt_D),
            .Q(addr_offset_cnt_Q)
        );

        // data offset register/counter - offset of currently fetched word
        d_ff_rst_we_t #(
            .BIT_WIDTH(RAM_OFFSET_BITS),
            .DEFAULT_VALUE({RAM_OFFSET_BITS{1'b0}}),
            .RESET_LEVEL(RESET_LEVEL),
            .RESET_SYNC(RESET_SYNC)
        ) data_offset_cnt_reg (
            .CLK(CLK),
            .RST(RST),
            .WE(data_offset_cnt_WE),
            .D(data_offset_cnt_D),
            .Q(data_offset_cnt_Q)
        );

        // deassert HTRANS in data phase when:
        assign trans_all_addr_done_wire = ((state_phs_data_wire == 1'b1) &&
            // addresses for all the beats are done (beat counter is last but one) or
            (((ICACHE_MASTER_HREADY0 == 1'b1) && (beat_cnt_reg_Q == {{(RAM_OFFSET_BITS-1){1'b1}}, 1'b0})) || // RAM_WORDS_PER_LINE-2
            // there is an error on the bus (first error cycle)
            ((ICACHE_MASTER_HREADY0 == 1'b0) && (ICACHE_MASTER_HRESP0 == 1'b1))));
        // bus transaction is finished when:
        assign trans_all_data_done_wire = (ICACHE_MASTER_HREADY0 & (
            // all the beats are done (counter is all ones) or
            (&beat_cnt_reg_Q) |
            // doing non-cacheable transfer, single beat only or
            (~hprot_reg_Q[3]) |
            // there is an error on the bus
            hresp_delay_reg_Q));
        // recompute master/slave offsets (required when the master is wider then slave)
        assign {biu_offsetin_wire, byte_index_wire} = {BIU_OFFSETIN, BIU_SBI};

        // offset calculations
        assign addr_offset_cnt_D = (state_idle_wire == 1'b1) ? biu_offsetin_wire : (addr_offset_cnt_Q + 1'b1);
        assign addr_offset_cnt_WE = (trans_init_regs_WE | state_phs_addr_wire | trans_beat_done_wire);
        // set counter when starting new transfer (address phase), count beats when finishing the data phase
        assign data_offset_cnt_D = addr_offset_cnt_Q;
        assign data_offset_cnt_WE = (state_phs_addr_wire | trans_beat_done_wire);
        assign beat_cnt_reg_D = (state_phs_addr_wire == 1'b1) ? {RAM_OFFSET_BITS{1'b0}} : (beat_cnt_reg_Q + 1'b1);
        assign beat_cnt_reg_WE = (state_phs_addr_wire | trans_beat_done_wire);

        // output register drivers
        assign hburst_reg_D = (trans_start_nc_req_wire == 1'b1) ? 3'b000 : HBURST_VALUE;
        // HTRANS driver
        assign htrans_reg_D = (state_idle_wire == 1'b1) ? 2'b10 :
            // non-cacheable trasfer has one beat only (IDLE or SEQ)
            (state_phs_addr_wire == 1'b1) ? {32'd2{hprot_reg_Q[3]}} : 2'b00;
        assign htrans_reg_WE = (trans_init_regs_WE | state_phs_addr_wire | trans_all_addr_done_wire);
        // output address signal
        assign haddr_Q = {addr_tag_reg_Q, addr_index_reg_Q, addr_offset_cnt_Q, addr_byte_index_reg_Q};
        
    end endgenerate

    // internal register drivers
    // sample input HRESP for every data beat and clear once finished
    assign hresp_reg_WE = (trans_beat_done_wire | state_finish_wire);
    // output register drivers
    assign hsize_reg_D = (trans_start_nc_req_wire == 1'b1) ? BIU_HSIZE : HSIZE_VALUE;
    // byte offset is non-zero only for non-cacheable access
    assign addr_byte_index_reg_D = (byte_index_wire & {RAM_SBI_BITS{BIU_NCREQVAL}});

    // clear the buffer after bus error or after non-cacheable access
    assign linefill_buffer_clr_wire = ((state_phs_data_wire & hresp_delay_reg_Q) | state_finish_wire);
    // data bytes reordering from big endian to little endian
    generate if (CACHE_IS_LITTLE) begin
        always @(*) begin : data_bytes_little
            linefill_buffer_data_wire = ICACHE_MASTER_HRDATA0;
        end
    end else begin
        always @(*) begin : data_bytes_big
            integer i;
            for (i=0; i<BYTES_PER_RAM_WORD; i=i+1) begin
                linefill_buffer_data_wire[(BYTE_BITS*(BYTES_PER_RAM_WORD-i-1))+:BYTE_BITS] =
                    ICACHE_MASTER_HRDATA0[(BYTE_BITS*i)+:BYTE_BITS];
            end
        end
    end endgenerate

    // output port drivers
    assign BIU_RESPVAL = state_finish_wire;
    // line-fill buffer outputs
    assign LFB_ERROR = hresp_reg_Q;
    // finished the cacheable linefill transfer (all the beats)
    assign LFB_FULL = (state_finish_wire & hprot_reg_Q[3] & ~hresp_reg_Q);
    assign LFB_INDEXOUT = addr_index_reg_Q;
    assign LFB_TAGOUT = addr_tag_reg_Q;
    // bus master outputs
    assign ICACHE_MASTER_HADDR0 = haddr_Q;
    assign ICACHE_MASTER_HBURST0 = hburst_reg_Q;
    assign ICACHE_MASTER_HMASTLOCK0 = hmastlock_reg_Q;
    assign ICACHE_MASTER_HPROT0 = hprot_reg_Q;
    assign ICACHE_MASTER_HSIZE0 = hsize_reg_Q;
    assign ICACHE_MASTER_HTRANS0 = htrans_reg_Q;
    assign ICACHE_MASTER_HWRITE0 = 1'b0;

endmodule
