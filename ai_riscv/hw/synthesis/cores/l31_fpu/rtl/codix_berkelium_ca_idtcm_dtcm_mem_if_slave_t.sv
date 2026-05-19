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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_idtcm_dtcm_mem_if_slave_t' CodAL interface.
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

module codix_berkelium_ca_idtcm_dtcm_mem_if_slave_t #(
    parameter [31:0] SIZE = 32'h00004000,
    parameter integer ADDR_BITS = 32'sh0000000c
) (
    input  logic CLK,
    input  logic RST,
    input  logic [31:0] if_slave_HADDR,
    input  logic [2:0] if_slave_HSIZE,
    input  logic [1:0] if_slave_HTRANS,
    input  logic if_slave_HWRITE,
    input  logic if_slave_HSEL,
    input  logic if_slave_HREADY,
    input  logic [31:0] if_slave_HWDATA,
    input  logic [31:0] idtcm_dtcm_mem_sram_if_slave_RDATA,
    output logic if_slave_HREADYOUT,
    output logic if_slave_HRESP,
    output logic [31:0] if_slave_HRDATA,
    output logic idtcm_dtcm_mem_sram_if_slave_CS,
    output logic idtcm_dtcm_mem_sram_if_slave_RW,
    output logic [3:0] idtcm_dtcm_mem_sram_if_slave_WSTRB,
    output logic [31:0] idtcm_dtcm_mem_sram_if_slave_WDATA,
    output logic [(ADDR_BITS)-1:0] idtcm_dtcm_mem_sram_if_slave_A
);
    // type, wire and constant declarations:
    // signal/wire
    logic if_slave_rdy_wire;
    // signal/wire
    logic if_slave_err_wire;
    // signal/wire
    logic if_slave_err_sum_wire;
    // signal/wire
    logic if_slave_raw_wire;
    // signal/wire
    logic if_slave_rreq_wire;
    // signal/wire
    logic if_slave_RE_wire;
    // signal/wire
    logic if_slave_wreq_wire;
    // signal/wire
    logic if_slave_WE_wire;
    // signal/wire
    logic [3:0] if_slave_wstrb_mask_wire;
    // signal/wire
    logic [1:0] if_slave_wstrb_shift_count_wire;
    // signal/wire
    logic [3:0] if_slave_wstrb_wire;
    // signal/wire
    logic if_slave_HTRANS_act_wire;
    // signal/wire
    logic if_slave_req_wire;
    // signal/wire
    logic if_slave_vreq_wire;
    // signal/wire
    logic if_slave_ivreq_wire;
    // signal/wire
    logic if_slave_two_cycle_error_resp_wire;
    // AMBA AHB single transfer or the first transfer of a burst
    localparam logic [1:0] CP_AHB_NONSEQ = 2'h2;
    // AMBA AHB burst transfer
    localparam logic [1:0] CP_AHB_SEQ = 2'h3;
    // AMBA AHB read transfer
    localparam logic CP_AHB_READ = 1'h0;
    // AMBA AHB write transfer
    localparam logic CP_AHB_WRITE = 1'h1;
    // AMBA AHB 8-bit transfer (byte)
    localparam logic [2:0] CP_AHB_SIZE_8 = 3'h0;
    // AMBA AHB 16-bit transfer (halfword)
    localparam logic [2:0] CP_AHB_SIZE_16 = 3'h1;
    // AMBA AHB 32-bit transfer (word)
    localparam logic [2:0] CP_AHB_SIZE_32 = 3'h2;
    // AMBA AHB waited transfer
    localparam logic CP_AHB_WAIT = 1'h0;
    // AMBA AHB previous transfer is complete
    localparam logic CP_AHB_READY = 1'h1;
    // AMBA AHB success
    localparam logic CP_AHB_OKAY = 1'h0;
    // AMBA AHB error
    localparam logic CP_AHB_ERROR = 1'h1;

    // additional declarations:
    logic if_slave_raw_reg_D;
    logic if_slave_raw_reg_Q;
    logic if_slave_pending_write_reg_WE;
    logic if_slave_pending_write_reg_D;
    logic if_slave_pending_write_reg_Q;
    logic if_slave_addr_reg_WE;
    logic [(ADDR_BITS)-1:0] if_slave_addr_reg_D;
    logic [(ADDR_BITS)-1:0] if_slave_addr_reg_Q;
    logic if_slave_offset_reg_WE;
    logic [1:0] if_slave_offset_reg_D;
    logic [1:0] if_slave_offset_reg_Q;
    logic if_slave_size_reg_WE;
    logic [1:0] if_slave_size_reg_D;
    logic [1:0] if_slave_size_reg_Q;
    logic if_slave_HREADYOUT_reg_D;
    logic if_slave_HREADYOUT_reg_Q;
    logic if_slave_HRESP_reg_WE;
    logic if_slave_HRESP_reg_D;
    logic if_slave_HRESP_reg_Q;

    // child instances inside CodAL interface:
    // register instance:
    d_ff_rst_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) if_slave_raw_reg (
        .CLK(CLK),
        .RST(RST),
        .D(if_slave_raw_reg_D),
        .Q(if_slave_raw_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) if_slave_pending_write_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(if_slave_pending_write_reg_WE),
        .D(if_slave_pending_write_reg_D),
        .Q(if_slave_pending_write_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(ADDR_BITS),
        .DEFAULT_VALUE(12'h000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) if_slave_addr_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(if_slave_addr_reg_WE),
        .D(if_slave_addr_reg_D),
        .Q(if_slave_addr_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) if_slave_offset_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(if_slave_offset_reg_WE),
        .D(if_slave_offset_reg_D),
        .Q(if_slave_offset_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) if_slave_size_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(if_slave_size_reg_WE),
        .D(if_slave_size_reg_D),
        .Q(if_slave_size_reg_Q)
    );

    // register instance:
    d_ff_rst_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b1),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) if_slave_HREADYOUT_reg (
        .CLK(CLK),
        .RST(RST),
        .D(if_slave_HREADYOUT_reg_D),
        .Q(if_slave_HREADYOUT_reg_Q)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) if_slave_HRESP_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(if_slave_HRESP_reg_WE),
        .D(if_slave_HRESP_reg_D),
        .Q(if_slave_HRESP_reg_Q)
    );

    // data-path code:
    assign if_slave_rdy_wire = if_slave_HREADY;
    assign if_slave_err_wire = (!(((if_slave_HSIZE == CP_AHB_SIZE_8) || ((if_slave_HSIZE == CP_AHB_SIZE_16) && (if_slave_HADDR[0] == 1'b0))) || ((if_slave_HSIZE == CP_AHB_SIZE_32) && (if_slave_HADDR[1:0] == 2'h0))));
    assign if_slave_err_sum_wire = if_slave_err_wire;
    assign if_slave_HTRANS_act_wire = ((if_slave_HTRANS == CP_AHB_NONSEQ) || (if_slave_HTRANS == CP_AHB_SEQ));
    assign if_slave_req_wire = (if_slave_rdy_wire & if_slave_HSEL);
    assign if_slave_vreq_wire = ((if_slave_req_wire & if_slave_HTRANS_act_wire) & (~if_slave_err_sum_wire));
    assign if_slave_ivreq_wire = ((if_slave_req_wire & if_slave_HTRANS_act_wire) & if_slave_err_sum_wire);
    assign if_slave_rreq_wire = ((if_slave_vreq_wire == 1'b1) && (if_slave_HWRITE == CP_AHB_READ));
    assign if_slave_wreq_wire = ((if_slave_vreq_wire == 1'b1) && (if_slave_HWRITE == CP_AHB_WRITE));
    assign if_slave_two_cycle_error_resp_wire = ((if_slave_HREADYOUT_reg_Q == CP_AHB_WAIT) && (if_slave_HRESP_reg_Q == CP_AHB_ERROR));
    assign if_slave_WE_wire = (if_slave_HREADYOUT_reg_Q & if_slave_pending_write_reg_Q);
    assign if_slave_wstrb_mask_wire = (if_slave_size_reg_Q == 2'h0) ? 4'h1 :
        (if_slave_size_reg_Q == 2'h1) ? 4'h3 : 4'hf;
    assign if_slave_wstrb_shift_count_wire = if_slave_offset_reg_Q;
    always_comb begin
        unique case ( if_slave_wstrb_shift_count_wire )
            2'h0: if_slave_wstrb_wire = if_slave_wstrb_mask_wire;
            2'h1: if_slave_wstrb_wire = {if_slave_wstrb_mask_wire[2:0], 1'b0};
            2'h2: if_slave_wstrb_wire = {if_slave_wstrb_mask_wire[1:0], 2'h0};
            2'h3: if_slave_wstrb_wire = {if_slave_wstrb_mask_wire[0], 3'h0};
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: if_slave_wstrb_wire = 4'hx;
            // pragma translate_on
        endcase
    end
    assign if_slave_raw_wire = (if_slave_rreq_wire & if_slave_WE_wire);
    assign if_slave_RE_wire = (if_slave_rreq_wire & (~if_slave_raw_wire));
    assign if_slave_pending_write_reg_D = if_slave_wreq_wire;
    assign if_slave_pending_write_reg_WE = if_slave_rdy_wire;
    assign if_slave_raw_reg_D = if_slave_raw_wire;
    assign if_slave_addr_reg_D = if_slave_HADDR[((ADDR_BITS + 32'h00000002) - 32'h00000001):32'h00000002];
    assign if_slave_addr_reg_WE = if_slave_vreq_wire;
    assign if_slave_offset_reg_D = if_slave_HADDR[1:0];
    assign if_slave_offset_reg_WE = if_slave_vreq_wire;
    assign if_slave_size_reg_D = if_slave_HSIZE[1:0];
    assign if_slave_size_reg_WE = if_slave_vreq_wire;
    assign if_slave_HREADYOUT_reg_D = ((if_slave_HREADYOUT_reg_Q == CP_AHB_READY) && (if_slave_ivreq_wire == 1'b1)) ? CP_AHB_WAIT :
        (if_slave_raw_wire == 1'b1) ? CP_AHB_WAIT : CP_AHB_READY;
    assign if_slave_HRESP_reg_D = (if_slave_two_cycle_error_resp_wire == 1'b1) ? CP_AHB_ERROR :
        (if_slave_ivreq_wire == 1'b1) ? CP_AHB_ERROR : CP_AHB_OKAY;
    assign if_slave_HRESP_reg_WE = (~if_slave_raw_reg_Q);
    assign idtcm_dtcm_mem_sram_if_slave_CS = (if_slave_RE_wire | (if_slave_WE_wire | if_slave_raw_reg_Q));
    assign idtcm_dtcm_mem_sram_if_slave_RW = if_slave_WE_wire;
    assign idtcm_dtcm_mem_sram_if_slave_A = ((if_slave_RE_wire == 1'b1) && (if_slave_raw_reg_Q == 1'b0)) ? if_slave_HADDR[((ADDR_BITS + 32'h00000002) - 32'h00000001):32'h00000002] : if_slave_addr_reg_Q;
    assign idtcm_dtcm_mem_sram_if_slave_WSTRB = if_slave_wstrb_wire;
    assign idtcm_dtcm_mem_sram_if_slave_WDATA = if_slave_HWDATA;
    assign if_slave_HREADYOUT = if_slave_HREADYOUT_reg_Q;
    assign if_slave_HRESP = if_slave_HRESP_reg_Q;
    assign if_slave_HRDATA = idtcm_dtcm_mem_sram_if_slave_RDATA;
endmodule: codix_berkelium_ca_idtcm_dtcm_mem_if_slave_t
