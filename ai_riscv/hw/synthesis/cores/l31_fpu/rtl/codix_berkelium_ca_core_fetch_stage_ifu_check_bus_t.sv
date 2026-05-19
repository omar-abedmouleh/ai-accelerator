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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_ifu_check_bus_t' functional unit.
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

module codix_berkelium_ca_core_fetch_stage_ifu_check_bus_t(
    input  logic [31:0] i1_if_cpu_fetch_HRDATA,
    input  logic i1_if_cpu_fetch_HREADY,
    input  logic i1_if_cpu_fetch_HRESP,
    input  logic s_fetch_hready_Q,
    output logic s_bus_busy_D,
    output logic s_bus_busy_o_D,
    output logic [31:0] s_fetch_hrdata_raw_D,
    output logic s_fetch_hready_D,
    output logic s_fetch_hresp_D
);
    // data-path code:
    assign s_bus_busy_D = (~s_fetch_hready_Q);
    assign s_bus_busy_o_D = (~s_fetch_hready_Q);
    assign s_fetch_hrdata_raw_D = i1_if_cpu_fetch_HRDATA;
    assign s_fetch_hready_D = i1_if_cpu_fetch_HREADY;
    assign s_fetch_hresp_D = i1_if_cpu_fetch_HRESP;
endmodule: codix_berkelium_ca_core_fetch_stage_ifu_check_bus_t
