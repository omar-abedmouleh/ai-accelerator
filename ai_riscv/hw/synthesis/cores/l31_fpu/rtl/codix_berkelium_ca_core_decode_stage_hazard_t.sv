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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_decode_stage_hazard_t' CodAL module.
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

module codix_berkelium_ca_core_decode_stage_hazard_t(
    input  logic [31:0] s_fpu_dst_regs_D,
    input  logic [5:0] s_p0_addr_i_D,
    input  logic s_p0_we_i_D,
    input  logic [5:0] s_p1_addr_i_D,
    input  logic s_p1_we_i_D,
    input  logic [5:0] s_rd_addr_i_D,
    input  logic [31:0] s_rd_data_i_D,
    input  logic s_rd_we_i_D,
    input  logic [5:0] s_rs_addr_i_D,
    input  logic [31:0] s_rs_data_i_D,
    output logic s_data_hazard_o_Q,
    output logic [31:0] s_data_o_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic [5:0] s_rs_addr_i;
    // CodAL signal/wire
    logic [31:0] s_rs_data_i;
    // CodAL signal/wire
    logic [5:0] s_rd_addr_i;
    // CodAL signal/wire
    logic [31:0] s_rd_data_i;
    // CodAL signal/wire
    logic s_rd_we_i;
    // CodAL signal/wire
    logic [5:0] s_p0_addr_i;
    // CodAL signal/wire
    logic [5:0] s_p1_addr_i;
    // CodAL signal/wire
    logic s_p0_we_i;
    // CodAL signal/wire
    logic s_p1_we_i;
    // CodAL signal/wire
    logic [31:0] s_fpu_dst_regs;
    // CodAL signal/wire
    logic [31:0] s_data_o;
    // CodAL signal/wire
    logic s_data_hazard_o;

    // child instances inside CodAL module:
    // instance of 's_rs_addr_i' CodAL signal/wire: (single driver)
    assign s_rs_addr_i = s_rs_addr_i_D;
    // instance of 's_rs_data_i' CodAL signal/wire: (single driver)
    assign s_rs_data_i = s_rs_data_i_D;
    // instance of 's_rd_addr_i' CodAL signal/wire: (single driver)
    assign s_rd_addr_i = s_rd_addr_i_D;
    // instance of 's_rd_data_i' CodAL signal/wire: (single driver)
    assign s_rd_data_i = s_rd_data_i_D;
    // instance of 's_rd_we_i' CodAL signal/wire: (single driver)
    assign s_rd_we_i = s_rd_we_i_D;
    // instance of 's_p0_addr_i' CodAL signal/wire: (single driver)
    assign s_p0_addr_i = s_p0_addr_i_D;
    // instance of 's_p1_addr_i' CodAL signal/wire: (single driver)
    assign s_p1_addr_i = s_p1_addr_i_D;
    // instance of 's_p0_we_i' CodAL signal/wire: (single driver)
    assign s_p0_we_i = s_p0_we_i_D;
    // instance of 's_p1_we_i' CodAL signal/wire: (single driver)
    assign s_p1_we_i = s_p1_we_i_D;
    // instance of 's_fpu_dst_regs' CodAL signal/wire: (single driver)
    assign s_fpu_dst_regs = s_fpu_dst_regs_D;
    // instance of 's_data_o' CodAL signal/wire: (parent port driver(s))
    assign s_data_o_Q = s_data_o;
    // instance of 's_data_hazard_o' CodAL signal/wire: (parent port driver(s))
    assign s_data_hazard_o_Q = s_data_hazard_o;
    // functional unit instance:
    codix_berkelium_ca_core_decode_stage_hazard_compute_t compute (
        .s_fpu_dst_regs_Q(s_fpu_dst_regs),
        .s_p0_addr_i_Q(s_p0_addr_i),
        .s_p0_we_i_Q(s_p0_we_i),
        .s_p1_addr_i_Q(s_p1_addr_i),
        .s_p1_we_i_Q(s_p1_we_i),
        .s_rd_addr_i_Q(s_rd_addr_i),
        .s_rd_data_i_Q(s_rd_data_i),
        .s_rd_we_i_Q(s_rd_we_i),
        .s_rs_addr_i_Q(s_rs_addr_i),
        .s_rs_data_i_Q(s_rs_data_i),
        .s_data_hazard_o_D(s_data_hazard_o),
        .s_data_o_D(s_data_o)
    );

endmodule: codix_berkelium_ca_core_decode_stage_hazard_t
