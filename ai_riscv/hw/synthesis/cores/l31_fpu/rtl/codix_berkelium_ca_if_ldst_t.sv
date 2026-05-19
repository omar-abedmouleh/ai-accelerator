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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_if_ldst_t' CodAL interface.
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

module codix_berkelium_ca_if_ldst_t(
    input  logic if_ldst_HREADY,
    input  logic if_ldst_HRESP,
    input  logic [31:0] if_ldst_HRDATA,
    input  logic [31:0] HADDR,
    input  logic [2:0] HBURST,
    input  logic HMASTLOCK,
    input  logic [3:0] HPROT,
    input  logic [2:0] HSIZE,
    input  logic [1:0] HTRANS,
    input  logic HWRITE,
    input  logic [31:0] HWDATA,
    output logic [31:0] if_ldst_HADDR,
    output logic [2:0] if_ldst_HBURST,
    output logic if_ldst_HMASTLOCK,
    output logic [3:0] if_ldst_HPROT,
    output logic [2:0] if_ldst_HSIZE,
    output logic [1:0] if_ldst_HTRANS,
    output logic if_ldst_HWRITE,
    output logic [31:0] if_ldst_HWDATA,
    output logic HREADY,
    output logic HRESP,
    output logic [31:0] HRDATA
);
    // data-path code:
    assign if_ldst_HADDR = HADDR;
    assign if_ldst_HBURST = HBURST;
    assign if_ldst_HMASTLOCK = HMASTLOCK;
    assign if_ldst_HPROT = HPROT;
    assign if_ldst_HSIZE = HSIZE;
    assign if_ldst_HTRANS = HTRANS;
    assign if_ldst_HWRITE = HWRITE;
    assign HRESP = if_ldst_HRESP;
    assign HREADY = if_ldst_HREADY;
    assign HRDATA = if_ldst_HRDATA;
    assign if_ldst_HWDATA = HWDATA;
endmodule: codix_berkelium_ca_if_ldst_t
