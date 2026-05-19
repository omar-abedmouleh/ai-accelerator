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
 *  \brief   Contains module definition of the 'codasip_arbiter_ahb3_lite_t' Arbiter between two AMBA 3 AHB-Lite master interfaces.
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

module codasip_arbiter_ahb3_lite_t #(
    parameter integer ADDR_BITS = 32'sh00000008,
    parameter integer DATA_BITS = 32'sh00000008
) (
    input  logic CLK,
    input  logic RST,
    input  logic [(DATA_BITS)-1:0] if_dst_HRDATA,
    input  logic if_dst_HREADY,
    input  logic if_dst_HRESP,
    input  logic [(ADDR_BITS)-1:0] if_src_hi_HADDR,
    input  logic [2:0] if_src_hi_HBURST,
    input  logic if_src_hi_HMASTLOCK,
    input  logic [3:0] if_src_hi_HPROT,
    input  logic [2:0] if_src_hi_HSIZE,
    input  logic [1:0] if_src_hi_HTRANS,
    input  logic [(DATA_BITS)-1:0] if_src_hi_HWDATA,
    input  logic if_src_hi_HWRITE,
    input  logic [(ADDR_BITS)-1:0] if_src_lo_HADDR,
    input  logic [2:0] if_src_lo_HBURST,
    input  logic if_src_lo_HMASTLOCK,
    input  logic [3:0] if_src_lo_HPROT,
    input  logic [2:0] if_src_lo_HSIZE,
    input  logic [1:0] if_src_lo_HTRANS,
    input  logic [(DATA_BITS)-1:0] if_src_lo_HWDATA,
    input  logic if_src_lo_HWRITE,
    output logic [(ADDR_BITS)-1:0] if_dst_HADDR,
    output logic [2:0] if_dst_HBURST,
    output logic if_dst_HMASTLOCK,
    output logic [3:0] if_dst_HPROT,
    output logic [2:0] if_dst_HSIZE,
    output logic [1:0] if_dst_HTRANS,
    output logic [(DATA_BITS)-1:0] if_dst_HWDATA,
    output logic if_dst_HWRITE,
    output logic [(DATA_BITS)-1:0] if_src_hi_HRDATA,
    output logic if_src_hi_HREADY,
    output logic if_src_hi_HRESP,
    output logic [(DATA_BITS)-1:0] if_src_lo_HRDATA,
    output logic if_src_lo_HREADY,
    output logic if_src_lo_HRESP
);
    // type, wire and constant declarations:
    // signal/wire
    logic state_idle_wire;
    // signal/wire
    logic state_transport_high_pri_wire;
    // signal/wire
    logic state_transport_low_pri_wire;
    // signal/wire
    logic buffer_main_WE_wire;
    // signal/wire
    logic buffer_clear_cnd1_wire;
    // signal/wire
    logic buffer_clear_cnd2_wire;
    // signal/wire
    logic buffer_clear_wire;
    // signal/wire
    logic buffer_hi_WE_cnd1_wire;
    // signal/wire
    logic buffer_hi_WE_cnd2_wire;
    // signal/wire
    logic buffer_hi_WE_cnd3_wire;
    // signal/wire
    logic buffer_hi_WE_cnd4_wire;
    // signal/wire
    logic buffer_hi_WE_wire;
    // signal/wire
    logic buffer_lo_WE_cnd1_wire;
    // signal/wire
    logic buffer_lo_WE_cnd2_wire;
    // signal/wire
    logic buffer_lo_WE_cnd3_wire;
    // signal/wire
    logic buffer_lo_WE_cnd4_wire;
    // signal/wire
    logic buffer_lo_WE_cnd5_wire;
    // signal/wire
    logic buffer_lo_WE_wire;
    // signal/wire
    logic hi_nonseq_wire;
    // signal/wire
    logic lo_nonseq_wire;
    // signal/wire
    logic hi_not_blocked_by_prev_lo_nonseq_wire;
    // signal/wire
    logic hi_start_new_trans_wire;
    // signal/wire
    logic lo_start_new_trans_wire;
    // signal/wire
    logic lo_start_buffered_trans_wire;
    // signal/wire
    logic lo_start_addr_phase_WE_cnd1_wire;
    // signal/wire
    logic lo_start_addr_phase_WE_cnd2_wire;
    // signal/wire
    logic lo_start_addr_phase_WE_cnd3_wire;
    // signal/wire
    logic lo_start_addr_phase_WE_wire;
    // signal/wire
    logic output_addr_phase_cnd1_wire;
    // signal/wire
    logic output_addr_phase_cnd2_wire;
    // signal/wire
    logic output_addr_phase_cnd3_wire;
    // signal/wire
    logic output_addr_phase_cnd4_wire;
    // signal/wire
    logic output_addr_phase_cnd5_wire;
    // signal/wire
    logic [1:0] if_dst_HTRANS_wire;
    // signal/wire
    logic [2:0] if_dst_HBURST_wire;
    // signal/wire
    logic if_dst_HMASTLOCK_wire;
    // FSM state register enumeration type
    typedef enum logic [1:0]
    {
        STATE_IDLE = 2'b00,
        STATE_TRANSPORT_HIGH_PRI = 2'b01,
        STATE_TRANSPORT_LOW_PRI = 2'b10
    } state_reg_type;

    // FSM state register (current state)
    state_reg_type state_reg_Q;
    // FSM state register (next state)
    state_reg_type state_reg_D;
    // AMBA AHB no data transfer
    localparam logic [1:0] CP_AHB_IDLE = 2'h0;
    // AMBA AHB single transfer or the first transfer of a burst
    localparam logic [1:0] CP_AHB_NONSEQ = 2'h2;
    // AMBA AHB single burst
    localparam logic [2:0] CP_AHB_SINGLE = 3'h0;
    // AMBA AHB waited transfer
    localparam logic CP_AHB_WAIT = 1'h0;
    // AMBA AHB previous transfer is complete
    localparam logic CP_AHB_READY = 1'h1;
    // AMBA AHB success
    localparam logic CP_AHB_OKAY = 1'h0;

    // additional declarations:
    logic lo_addr_phase_started_reg_WE;
    logic lo_addr_phase_started_reg_D;
    logic lo_addr_phase_started_reg_Q;
    logic prev_trans_locked_reg_WE;
    logic prev_trans_locked_reg_D;
    logic prev_trans_locked_reg_Q;
    logic trans_burst_reg_WE;
    logic trans_burst_reg_D;
    logic trans_burst_reg_Q;
    logic trans_error_reg_WE;
    logic trans_error_reg_D;
    logic trans_error_reg_Q;
    logic prev_trans_error_reg_WE;
    logic prev_trans_error_reg_D;
    logic prev_trans_error_reg_Q;
    logic buffer_full_reg_WE;
    logic buffer_full_reg_D;
    logic buffer_full_reg_Q;
    logic HADDR_buffer_reg_WE;
    logic [(ADDR_BITS)-1:0] HADDR_buffer_reg_D;
    logic [(ADDR_BITS)-1:0] HADDR_buffer_reg_Q;
    logic HBURST_buffer_reg_WE;
    logic [2:0] HBURST_buffer_reg_D;
    logic [2:0] HBURST_buffer_reg_Q;
    logic HMASTLOCK_buffer_reg_WE;
    logic HMASTLOCK_buffer_reg_D;
    logic HMASTLOCK_buffer_reg_Q;
    logic HPROT_buffer_reg_WE;
    logic [3:0] HPROT_buffer_reg_D;
    logic [3:0] HPROT_buffer_reg_Q;
    logic HSIZE_buffer_reg_WE;
    logic [2:0] HSIZE_buffer_reg_D;
    logic [2:0] HSIZE_buffer_reg_Q;
    logic HWRITE_buffer_reg_WE;
    logic HWRITE_buffer_reg_D;
    logic HWRITE_buffer_reg_Q;

    // FSM state register
    always_ff @( posedge CLK or negedge RST ) begin
        if ( RST == 1'b0 ) begin
            state_reg_Q <= STATE_IDLE;
        end else begin
            state_reg_Q <= state_reg_D;
        end
    end

    // FSM transitions (next state logic)
    always_comb begin
        unique case ( state_reg_Q )
            STATE_IDLE: begin
                if ( (hi_nonseq_wire == 1'b1) ) begin
                    state_reg_D = STATE_TRANSPORT_HIGH_PRI;
                end else if ( (lo_nonseq_wire == 1'b1) ) begin
                    state_reg_D = STATE_TRANSPORT_LOW_PRI;
                end else begin
                    state_reg_D = STATE_IDLE;
                end
            end
            STATE_TRANSPORT_HIGH_PRI: begin
                if ( ((if_dst_HREADY == CP_AHB_WAIT) || (((hi_start_new_trans_wire == 1'b1) && (prev_trans_error_reg_Q == 1'b0)) || (trans_error_reg_Q == 1'b1))) ) begin
                    state_reg_D = STATE_TRANSPORT_HIGH_PRI;
                end else if ( ((buffer_full_reg_Q == 1'b1) || (lo_nonseq_wire == 1'b1)) ) begin
                    state_reg_D = STATE_TRANSPORT_LOW_PRI;
                end else begin
                    state_reg_D = STATE_IDLE;
                end
            end
            STATE_TRANSPORT_LOW_PRI: begin
                if ( ((if_dst_HREADY == CP_AHB_WAIT) || (((lo_start_new_trans_wire == 1'b1) && (prev_trans_error_reg_Q == 1'b0)) || (trans_error_reg_Q == 1'b1))) ) begin
                    state_reg_D = STATE_TRANSPORT_LOW_PRI;
                end else if ( ((lo_start_buffered_trans_wire == 1'b1) || (hi_not_blocked_by_prev_lo_nonseq_wire == 1'b1)) ) begin
                    state_reg_D = STATE_TRANSPORT_HIGH_PRI;
                end else if ( (lo_nonseq_wire == 1'b1) ) begin
                    state_reg_D = STATE_TRANSPORT_LOW_PRI;
                end else begin
                    state_reg_D = STATE_IDLE;
                end
            end
            // FSM is complete, but not all 2-state values are used
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: begin
                state_reg_D = STATE_IDLE;
            end
            // pragma coverage on
            // VCS coverage on
        endcase
    end

    // child instances inside Arbiter between two AMBA 3 AHB-Lite master interfaces:
    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) lo_addr_phase_started_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(lo_addr_phase_started_reg_WE),
        .D(lo_addr_phase_started_reg_D),
        .Q(lo_addr_phase_started_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) prev_trans_locked_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(prev_trans_locked_reg_WE),
        .D(prev_trans_locked_reg_D),
        .Q(prev_trans_locked_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) trans_burst_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(trans_burst_reg_WE),
        .D(trans_burst_reg_D),
        .Q(trans_burst_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) trans_error_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(trans_error_reg_WE),
        .D(trans_error_reg_D),
        .Q(trans_error_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) prev_trans_error_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(prev_trans_error_reg_WE),
        .D(prev_trans_error_reg_D),
        .Q(prev_trans_error_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) buffer_full_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(buffer_full_reg_WE),
        .D(buffer_full_reg_D),
        .Q(buffer_full_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(ADDR_BITS),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) HADDR_buffer_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(HADDR_buffer_reg_WE),
        .D(HADDR_buffer_reg_D),
        .Q(HADDR_buffer_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) HBURST_buffer_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(HBURST_buffer_reg_WE),
        .D(HBURST_buffer_reg_D),
        .Q(HBURST_buffer_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) HMASTLOCK_buffer_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(HMASTLOCK_buffer_reg_WE),
        .D(HMASTLOCK_buffer_reg_D),
        .Q(HMASTLOCK_buffer_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd4),
        .DEFAULT_VALUE(4'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) HPROT_buffer_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(HPROT_buffer_reg_WE),
        .D(HPROT_buffer_reg_D),
        .Q(HPROT_buffer_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) HSIZE_buffer_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(HSIZE_buffer_reg_WE),
        .D(HSIZE_buffer_reg_D),
        .Q(HSIZE_buffer_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) HWRITE_buffer_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(HWRITE_buffer_reg_WE),
        .D(HWRITE_buffer_reg_D),
        .Q(HWRITE_buffer_reg_Q)
    );

    // data-path code:
    assign state_idle_wire = (state_reg_Q == STATE_IDLE);
    assign state_transport_high_pri_wire = (state_reg_Q == STATE_TRANSPORT_HIGH_PRI);
    assign state_transport_low_pri_wire = (state_reg_Q == STATE_TRANSPORT_LOW_PRI);
    assign hi_nonseq_wire = (if_src_hi_HTRANS == CP_AHB_NONSEQ);
    assign lo_nonseq_wire = (if_src_lo_HTRANS == CP_AHB_NONSEQ);
    assign hi_not_blocked_by_prev_lo_nonseq_wire = ((~lo_addr_phase_started_reg_Q) & hi_nonseq_wire);
    assign hi_start_new_trans_wire = (hi_not_blocked_by_prev_lo_nonseq_wire | (if_src_hi_HTRANS[0] | (prev_trans_locked_reg_Q & if_src_hi_HMASTLOCK)));
    assign lo_start_new_trans_wire = (if_src_lo_HTRANS[0] | (prev_trans_locked_reg_Q & if_src_lo_HMASTLOCK));
    assign lo_start_buffered_trans_wire = ((~lo_addr_phase_started_reg_Q) & buffer_full_reg_Q);
    assign buffer_hi_WE_cnd1_wire = (((state_transport_high_pri_wire & ((~hi_start_new_trans_wire) | prev_trans_error_reg_Q)) & (buffer_full_reg_Q & if_dst_HREADY)) & hi_nonseq_wire);
    assign buffer_hi_WE_cnd2_wire = ((state_transport_low_pri_wire & lo_start_new_trans_wire) & ((~buffer_full_reg_Q) & hi_nonseq_wire));
    assign buffer_hi_WE_cnd3_wire = (((state_transport_low_pri_wire & (~lo_start_new_trans_wire)) & ((~buffer_full_reg_Q) & (~if_dst_HREADY))) & hi_nonseq_wire);
    assign buffer_hi_WE_cnd4_wire = ((state_transport_low_pri_wire & (~lo_start_new_trans_wire)) & (lo_addr_phase_started_reg_Q & hi_nonseq_wire));
    assign buffer_hi_WE_wire = ((buffer_hi_WE_cnd1_wire | buffer_hi_WE_cnd2_wire) | (buffer_hi_WE_cnd3_wire | buffer_hi_WE_cnd4_wire));
    assign buffer_lo_WE_cnd1_wire = (state_idle_wire & (hi_nonseq_wire & lo_nonseq_wire));
    assign buffer_lo_WE_cnd2_wire = ((state_transport_high_pri_wire & hi_start_new_trans_wire) & ((~buffer_full_reg_Q) & lo_nonseq_wire));
    assign buffer_lo_WE_cnd3_wire = (((state_transport_high_pri_wire & (~hi_start_new_trans_wire)) & ((~buffer_full_reg_Q) & lo_nonseq_wire)) & (~if_dst_HREADY));
    assign buffer_lo_WE_cnd4_wire = (((state_transport_low_pri_wire & (~lo_start_new_trans_wire)) & (lo_start_buffered_trans_wire & if_dst_HREADY)) & lo_nonseq_wire);
    assign buffer_lo_WE_cnd5_wire = (((state_transport_low_pri_wire & (~lo_start_new_trans_wire)) & ((~lo_start_buffered_trans_wire) & hi_not_blocked_by_prev_lo_nonseq_wire)) & (if_dst_HREADY & lo_nonseq_wire));
    assign buffer_lo_WE_wire = (((buffer_lo_WE_cnd1_wire | buffer_lo_WE_cnd2_wire) | (buffer_lo_WE_cnd3_wire | buffer_lo_WE_cnd4_wire)) | buffer_lo_WE_cnd5_wire);
    assign buffer_main_WE_wire = (buffer_hi_WE_wire | buffer_lo_WE_wire);
    assign buffer_clear_cnd1_wire = ((((state_transport_high_pri_wire & (~hi_start_new_trans_wire)) & (buffer_full_reg_Q & if_dst_HREADY)) & (~hi_nonseq_wire)) & (~trans_error_reg_Q));
    assign buffer_clear_cnd2_wire = ((((state_transport_low_pri_wire & (~lo_start_new_trans_wire)) & (lo_start_buffered_trans_wire & if_dst_HREADY)) & (~lo_nonseq_wire)) & (~trans_error_reg_Q));
    assign buffer_clear_wire = (buffer_clear_cnd1_wire | buffer_clear_cnd2_wire);
    assign lo_start_addr_phase_WE_cnd1_wire = ((state_transport_high_pri_wire & (~hi_start_new_trans_wire)) & buffer_full_reg_Q);
    assign lo_start_addr_phase_WE_cnd2_wire = ((state_transport_high_pri_wire & (~hi_start_new_trans_wire)) & ((~buffer_full_reg_Q) & lo_nonseq_wire));
    assign lo_start_addr_phase_WE_cnd3_wire = (((state_transport_low_pri_wire & (~lo_start_new_trans_wire)) & ((~lo_start_buffered_trans_wire) & (~hi_not_blocked_by_prev_lo_nonseq_wire))) & lo_nonseq_wire);
    assign lo_start_addr_phase_WE_wire = ((lo_start_addr_phase_WE_cnd1_wire | lo_start_addr_phase_WE_cnd2_wire) | lo_start_addr_phase_WE_cnd3_wire);
    assign output_addr_phase_cnd1_wire = (state_idle_wire & hi_nonseq_wire);
    assign output_addr_phase_cnd2_wire = (state_transport_high_pri_wire & ((hi_start_new_trans_wire & (~prev_trans_error_reg_Q)) | trans_error_reg_Q));
    assign output_addr_phase_cnd3_wire = (state_transport_high_pri_wire & buffer_full_reg_Q);
    assign output_addr_phase_cnd4_wire = (((state_transport_low_pri_wire & (~lo_start_new_trans_wire)) & lo_start_buffered_trans_wire) & (~trans_error_reg_Q));
    assign output_addr_phase_cnd5_wire = (((state_transport_low_pri_wire & (~lo_start_new_trans_wire)) & hi_not_blocked_by_prev_lo_nonseq_wire) & (~trans_error_reg_Q));
    assign if_dst_HTRANS_wire = (output_addr_phase_cnd1_wire == 1'b1) ? CP_AHB_NONSEQ :
        (output_addr_phase_cnd2_wire == 1'b1) ? if_src_hi_HTRANS :
        (output_addr_phase_cnd3_wire == 1'b1) ? CP_AHB_NONSEQ :
        (output_addr_phase_cnd4_wire == 1'b1) ? CP_AHB_NONSEQ :
        (output_addr_phase_cnd5_wire == 1'b1) ? CP_AHB_NONSEQ : if_src_lo_HTRANS;
    assign if_dst_HBURST_wire = (output_addr_phase_cnd1_wire == 1'b1) ? if_src_hi_HBURST :
        (output_addr_phase_cnd2_wire == 1'b1) ? if_src_hi_HBURST :
        (output_addr_phase_cnd3_wire == 1'b1) ? HBURST_buffer_reg_Q :
        (output_addr_phase_cnd4_wire == 1'b1) ? HBURST_buffer_reg_Q :
        (output_addr_phase_cnd5_wire == 1'b1) ? if_src_hi_HBURST : if_src_lo_HBURST;
    assign if_dst_HMASTLOCK_wire = (output_addr_phase_cnd1_wire == 1'b1) ? if_src_hi_HMASTLOCK :
        (output_addr_phase_cnd2_wire == 1'b1) ? if_src_hi_HMASTLOCK :
        (output_addr_phase_cnd3_wire == 1'b1) ? HMASTLOCK_buffer_reg_Q :
        (output_addr_phase_cnd4_wire == 1'b1) ? HMASTLOCK_buffer_reg_Q :
        (output_addr_phase_cnd5_wire == 1'b1) ? if_src_hi_HMASTLOCK : if_src_lo_HMASTLOCK;
    assign buffer_full_reg_D = (buffer_clear_wire == 1'b1) ? 1'b0 : buffer_main_WE_wire;
    assign buffer_full_reg_WE = (buffer_clear_wire | buffer_main_WE_wire);
    assign lo_addr_phase_started_reg_D = (~if_dst_HREADY);
    assign lo_addr_phase_started_reg_WE = lo_start_addr_phase_WE_wire;
    assign trans_burst_reg_D = (if_dst_HBURST_wire != CP_AHB_SINGLE);
    assign trans_burst_reg_WE = (((if_dst_HREADY == 1'b1) && (if_dst_HRESP == 1'b0)) && (if_dst_HTRANS_wire == CP_AHB_NONSEQ));
    assign trans_error_reg_D = (((~if_dst_HREADY) & if_dst_HRESP) & trans_burst_reg_Q);
    assign trans_error_reg_WE = (if_dst_HREADY | if_dst_HRESP);
    assign prev_trans_error_reg_D = trans_error_reg_Q;
    assign prev_trans_error_reg_WE = ((if_dst_HTRANS_wire == CP_AHB_IDLE) || (prev_trans_error_reg_Q == 1'b1));
    assign prev_trans_locked_reg_D = if_dst_HMASTLOCK_wire;
    assign prev_trans_locked_reg_WE = ((if_dst_HREADY == CP_AHB_READY) && ((if_dst_HTRANS_wire != CP_AHB_IDLE) || ((if_dst_HMASTLOCK_wire == 1'b0) && (prev_trans_locked_reg_Q == 1'b1))));
    assign HADDR_buffer_reg_D = (buffer_hi_WE_wire == 1'b1) ? if_src_hi_HADDR : if_src_lo_HADDR;
    assign HADDR_buffer_reg_WE = buffer_main_WE_wire;
    assign HBURST_buffer_reg_D = (buffer_hi_WE_wire == 1'b1) ? if_src_hi_HBURST : if_src_lo_HBURST;
    assign HBURST_buffer_reg_WE = buffer_main_WE_wire;
    assign HMASTLOCK_buffer_reg_D = (buffer_hi_WE_wire == 1'b1) ? if_src_hi_HMASTLOCK : if_src_lo_HMASTLOCK;
    assign HMASTLOCK_buffer_reg_WE = buffer_main_WE_wire;
    assign HPROT_buffer_reg_D = (buffer_hi_WE_wire == 1'b1) ? if_src_hi_HPROT : if_src_lo_HPROT;
    assign HPROT_buffer_reg_WE = buffer_main_WE_wire;
    assign HWRITE_buffer_reg_D = (buffer_hi_WE_wire == 1'b1) ? if_src_hi_HWRITE : if_src_lo_HWRITE;
    assign HWRITE_buffer_reg_WE = buffer_main_WE_wire;
    assign HSIZE_buffer_reg_D = (buffer_hi_WE_wire == 1'b1) ? if_src_hi_HSIZE : if_src_lo_HSIZE;
    assign HSIZE_buffer_reg_WE = buffer_main_WE_wire;
    assign if_src_hi_HRDATA = if_dst_HRDATA;
    assign if_src_hi_HREADY = (state_transport_high_pri_wire == 1'b1) ? if_dst_HREADY : (~buffer_full_reg_Q);
    assign if_src_hi_HRESP = (state_transport_high_pri_wire == 1'b1) ? if_dst_HRESP : CP_AHB_OKAY;
    assign if_src_lo_HRDATA = if_dst_HRDATA;
    assign if_src_lo_HREADY = (state_transport_low_pri_wire == 1'b1) ? if_dst_HREADY : (~buffer_full_reg_Q);
    assign if_src_lo_HRESP = (state_transport_low_pri_wire == 1'b1) ? if_dst_HRESP : CP_AHB_OKAY;
    assign if_dst_HTRANS = if_dst_HTRANS_wire;
    assign if_dst_HMASTLOCK = if_dst_HMASTLOCK_wire;
    assign if_dst_HADDR = (output_addr_phase_cnd1_wire == 1'b1) ? if_src_hi_HADDR :
        (output_addr_phase_cnd2_wire == 1'b1) ? if_src_hi_HADDR :
        (output_addr_phase_cnd3_wire == 1'b1) ? HADDR_buffer_reg_Q :
        (output_addr_phase_cnd4_wire == 1'b1) ? HADDR_buffer_reg_Q :
        (output_addr_phase_cnd5_wire == 1'b1) ? if_src_hi_HADDR : if_src_lo_HADDR;
    assign if_dst_HBURST = if_dst_HBURST_wire;
    assign if_dst_HPROT = (output_addr_phase_cnd1_wire == 1'b1) ? if_src_hi_HPROT :
        (output_addr_phase_cnd2_wire == 1'b1) ? if_src_hi_HPROT :
        (output_addr_phase_cnd3_wire == 1'b1) ? HPROT_buffer_reg_Q :
        (output_addr_phase_cnd4_wire == 1'b1) ? HPROT_buffer_reg_Q :
        (output_addr_phase_cnd5_wire == 1'b1) ? if_src_hi_HPROT : if_src_lo_HPROT;
    assign if_dst_HSIZE = (output_addr_phase_cnd1_wire == 1'b1) ? if_src_hi_HSIZE :
        (output_addr_phase_cnd2_wire == 1'b1) ? if_src_hi_HSIZE :
        (output_addr_phase_cnd3_wire == 1'b1) ? HSIZE_buffer_reg_Q :
        (output_addr_phase_cnd4_wire == 1'b1) ? HSIZE_buffer_reg_Q :
        (output_addr_phase_cnd5_wire == 1'b1) ? if_src_hi_HSIZE : if_src_lo_HSIZE;
    assign if_dst_HWRITE = (output_addr_phase_cnd1_wire == 1'b1) ? if_src_hi_HWRITE :
        (output_addr_phase_cnd2_wire == 1'b1) ? if_src_hi_HWRITE :
        (output_addr_phase_cnd3_wire == 1'b1) ? HWRITE_buffer_reg_Q :
        (output_addr_phase_cnd4_wire == 1'b1) ? HWRITE_buffer_reg_Q :
        (output_addr_phase_cnd5_wire == 1'b1) ? if_src_hi_HWRITE : if_src_lo_HWRITE;
    assign if_dst_HWDATA = (state_transport_high_pri_wire == 1'b1) ? if_src_hi_HWDATA : if_src_lo_HWDATA;
endmodule: codasip_arbiter_ahb3_lite_t
