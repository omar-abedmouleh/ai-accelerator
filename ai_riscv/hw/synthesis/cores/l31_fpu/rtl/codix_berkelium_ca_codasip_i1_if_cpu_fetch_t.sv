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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_codasip_i1_if_cpu_fetch_t' CodAL interface with Program Buffer access (RISC-V Debug specification).
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

module codix_berkelium_ca_codasip_i1_if_cpu_fetch_t #(
    parameter [31:0] BASE = 32'h00020000
) (
    input  logic CLK,
    input  logic RST,
    input  logic [31:0] codasip_i1_if_cpu_fetch_HRDATA,
    input  logic codasip_i1_if_cpu_fetch_HREADY,
    input  logic codasip_i1_if_cpu_fetch_HRESP,
    input  logic [31:0] HADDR,
    input  logic [2:0] HBURST,
    input  logic HMASTLOCK,
    input  logic [3:0] HPROT,
    input  logic [2:0] HSIZE,
    input  logic [1:0] HTRANS,
    input  logic HWRITE,
    input  logic [31:0] progbuf_Q,
    output logic [31:0] codasip_i1_if_cpu_fetch_HADDR,
    output logic [2:0] codasip_i1_if_cpu_fetch_HBURST,
    output logic codasip_i1_if_cpu_fetch_HMASTLOCK,
    output logic [3:0] codasip_i1_if_cpu_fetch_HPROT,
    output logic [2:0] codasip_i1_if_cpu_fetch_HSIZE,
    output logic [1:0] codasip_i1_if_cpu_fetch_HTRANS,
    output logic codasip_i1_if_cpu_fetch_HWRITE,
    output logic [31:0] HRDATA,
    output logic HREADY,
    output logic HRESP,
    output logic [1:0] progbuf_RA,
    output logic progbuf_RE
);
    // type, wire and constant declarations:
    // signal/wire
    logic progbuf_sel_wire;
    // signal/wire
    logic ready_wire;
    // signal/wire
    logic req_ready_wire;
    // signal/wire
    logic progbuf_req_ready_wire;
    // signal/wire
    logic [1:0] progbuf_A_wire;
    // signal/wire
    logic progbuf_rreq_ready_wire;
    // AMBA AHB no data transfer
    localparam logic [1:0] CP_AHB_IDLE = 2'h0;

    // additional declarations:
    logic progbuf_sel_reg_WE;
    logic progbuf_sel_reg_D;
    logic progbuf_sel_reg_Q;

    // child instances inside CodAL interface with Program Buffer access (RISC-V Debug specification):
    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) progbuf_sel_reg (
        .CLK(CLK),
        .RST(RST),
        .WE(progbuf_sel_reg_WE),
        .D(progbuf_sel_reg_D),
        .Q(progbuf_sel_reg_Q)
    );

    // data-path code:
    assign progbuf_sel_wire = (HADDR[31:4] == BASE[31:4]);
    assign progbuf_A_wire = HADDR[3:2];
    assign ready_wire = codasip_i1_if_cpu_fetch_HREADY;
    assign req_ready_wire = (ready_wire & HTRANS[1]);
    assign progbuf_req_ready_wire = (progbuf_sel_wire & req_ready_wire);
    assign progbuf_rreq_ready_wire = (progbuf_req_ready_wire == 1'b1);
    assign progbuf_sel_reg_D = progbuf_sel_wire;
    assign progbuf_sel_reg_WE = ready_wire;
    assign progbuf_RE = progbuf_rreq_ready_wire;
    assign progbuf_RA = progbuf_A_wire;
    assign codasip_i1_if_cpu_fetch_HADDR = HADDR;
    assign codasip_i1_if_cpu_fetch_HBURST = HBURST;
    assign codasip_i1_if_cpu_fetch_HMASTLOCK = HMASTLOCK;
    assign codasip_i1_if_cpu_fetch_HPROT = HPROT;
    assign codasip_i1_if_cpu_fetch_HSIZE = HSIZE;
    assign codasip_i1_if_cpu_fetch_HWRITE = HWRITE;
    assign codasip_i1_if_cpu_fetch_HTRANS = (progbuf_sel_wire == 1'b1) ? CP_AHB_IDLE : HTRANS;
    assign HRDATA = (progbuf_sel_reg_Q == 1'b1) ? progbuf_Q : codasip_i1_if_cpu_fetch_HRDATA;
    assign HREADY = codasip_i1_if_cpu_fetch_HREADY;
    assign HRESP = codasip_i1_if_cpu_fetch_HRESP;
endmodule: codix_berkelium_ca_codasip_i1_if_cpu_fetch_t
