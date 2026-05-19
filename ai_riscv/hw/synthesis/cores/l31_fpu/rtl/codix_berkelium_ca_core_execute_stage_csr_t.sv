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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_csr_t' CodAL module.
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

module codix_berkelium_ca_core_execute_stage_csr_t(
    input  logic [11:0] s_csr_addr_i_D,
    input  logic [5:0] s_csr_s1_addr_i_D,
    input  logic [1:0] s_csr_s1_source_i_D,
    input  logic [31:0] s_csr_wdata_i_D,
    input  logic [7:0] s_op_i_D,
    output logic [11:0] s_csr_addr_o_Q,
    output logic s_csr_rd_we_o_Q,
    output logic s_csr_re_o_Q,
    output logic s_csr_valid_o_Q,
    output logic [31:0] s_csr_wdata_o_Q,
    output logic s_csr_we_o_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic [7:0] s_op_i;
    // CodAL signal/wire
    logic [11:0] s_csr_addr_i;
    // CodAL signal/wire
    logic [5:0] s_csr_s1_addr_i;
    // CodAL signal/wire
    logic [1:0] s_csr_s1_source_i;
    // CodAL signal/wire
    logic [31:0] s_csr_wdata_i;
    // CodAL signal/wire
    logic s_csr_valid_o;
    // CodAL signal/wire
    logic [11:0] s_csr_addr_o;
    // CodAL signal/wire
    logic [31:0] s_csr_wdata_o;
    // CodAL signal/wire
    logic s_csr_re_o;
    // CodAL signal/wire
    logic s_csr_we_o;
    // CodAL signal/wire
    logic s_csr_rd_we_o;

    // child instances inside CodAL module:
    // instance of 's_op_i' CodAL signal/wire: (single driver)
    assign s_op_i = s_op_i_D;
    // instance of 's_csr_addr_i' CodAL signal/wire: (single driver)
    assign s_csr_addr_i = s_csr_addr_i_D;
    // instance of 's_csr_s1_addr_i' CodAL signal/wire: (single driver)
    assign s_csr_s1_addr_i = s_csr_s1_addr_i_D;
    // instance of 's_csr_s1_source_i' CodAL signal/wire: (single driver)
    assign s_csr_s1_source_i = s_csr_s1_source_i_D;
    // instance of 's_csr_wdata_i' CodAL signal/wire: (single driver)
    assign s_csr_wdata_i = s_csr_wdata_i_D;
    // instance of 's_csr_valid_o' CodAL signal/wire: (parent port driver(s))
    assign s_csr_valid_o_Q = s_csr_valid_o;
    // instance of 's_csr_addr_o' CodAL signal/wire: (parent port driver(s))
    assign s_csr_addr_o_Q = s_csr_addr_o;
    // instance of 's_csr_wdata_o' CodAL signal/wire: (parent port driver(s))
    assign s_csr_wdata_o_Q = s_csr_wdata_o;
    // instance of 's_csr_re_o' CodAL signal/wire: (parent port driver(s))
    assign s_csr_re_o_Q = s_csr_re_o;
    // instance of 's_csr_we_o' CodAL signal/wire: (parent port driver(s))
    assign s_csr_we_o_Q = s_csr_we_o;
    // instance of 's_csr_rd_we_o' CodAL signal/wire: (parent port driver(s))
    assign s_csr_rd_we_o_Q = s_csr_rd_we_o;
    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_csr_compute_t compute (
        .s_csr_addr_i_Q(s_csr_addr_i),
        .s_csr_s1_addr_i_Q(s_csr_s1_addr_i),
        .s_csr_s1_source_i_Q(s_csr_s1_source_i),
        .s_csr_wdata_i_Q(s_csr_wdata_i),
        .s_op_i_Q(s_op_i),
        .s_csr_addr_o_D(s_csr_addr_o),
        .s_csr_rd_we_o_D(s_csr_rd_we_o),
        .s_csr_re_o_D(s_csr_re_o),
        .s_csr_valid_o_D(s_csr_valid_o),
        .s_csr_wdata_o_D(s_csr_wdata_o),
        .s_csr_we_o_D(s_csr_we_o)
    );

endmodule: codix_berkelium_ca_core_execute_stage_csr_t
