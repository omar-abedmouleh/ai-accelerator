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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_mul_t' CodAL module.
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

module codix_berkelium_ca_core_execute_stage_mul_t(
    input  logic compute_ACT,
    input  logic [7:0] s_op_i_D,
    input  logic [31:0] s_s1_data_i_D,
    input  logic [31:0] s_s2_data_i_D,
    output logic [31:0] s_rd_data_o_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic [7:0] s_op_i;
    // CodAL signal/wire
    logic [31:0] s_s1_data_i;
    // CodAL signal/wire
    logic [31:0] s_s2_data_i;
    // CodAL signal/wire
    logic [31:0] s_rd_data_o;

    // child instances inside CodAL module:
    // instance of 's_op_i' CodAL signal/wire: (single driver)
    assign s_op_i = s_op_i_D;
    // instance of 's_s1_data_i' CodAL signal/wire: (single driver)
    assign s_s1_data_i = s_s1_data_i_D;
    // instance of 's_s2_data_i' CodAL signal/wire: (single driver)
    assign s_s2_data_i = s_s2_data_i_D;
    // instance of 's_rd_data_o' CodAL signal/wire: (parent port driver(s))
    assign s_rd_data_o_Q = s_rd_data_o;
    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_mul_compute_t compute (
        .ACT(compute_ACT),
        .s_op_i_Q(s_op_i),
        .s_s1_data_i_Q(s_s1_data_i),
        .s_s2_data_i_Q(s_s2_data_i),
        .s_rd_data_o_D(s_rd_data_o)
    );

endmodule: codix_berkelium_ca_core_execute_stage_mul_t
