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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_csr_compute_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_csr_compute_t(
    input  logic [11:0] s_csr_addr_i_Q,
    input  logic [5:0] s_csr_s1_addr_i_Q,
    input  logic [1:0] s_csr_s1_source_i_Q,
    input  logic [31:0] s_csr_wdata_i_Q,
    input  logic [7:0] s_op_i_Q,
    output logic [11:0] s_csr_addr_o_D,
    output logic s_csr_rd_we_o_D,
    output logic s_csr_re_o_D,
    output logic s_csr_valid_o_D,
    output logic [31:0] s_csr_wdata_o_D,
    output logic s_csr_we_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic codasip_tmp_var_0;
    // signal/wire
    logic csr_read_B0;
    // signal/wire
    logic csr_write_B0;
    // signal/wire
    logic [11:0] s_csr_addr_o_D_ACT_wire;
    // signal/wire
    logic s_csr_rd_we_o_D_ACT_wire;
    // signal/wire
    logic s_csr_re_o_D_ACT_wire;
    // signal/wire
    logic s_csr_valid_o_D_ACT_wire;
    // signal/wire
    logic [31:0] s_csr_wdata_o_D_ACT_wire;
    // signal/wire
    logic s_csr_we_o_D_ACT_wire;

    // data-path code:
    assign csr_read_B0 = (s_csr_addr_i_Q != 12'h000);
    assign csr_write_B0 = ((s_op_i_Q == 8'h34) | ((((s_op_i_Q == 8'h35) | (s_op_i_Q == 8'h36)) & ((s_csr_s1_source_i_Q == 2'h1) & (s_csr_s1_addr_i_Q != 6'h00))) | ((s_csr_s1_source_i_Q == 2'h2) & (s_csr_wdata_i_Q != 32'h00000000))));
    assign codasip_tmp_var_0 = ((s_op_i_Q >= 8'h34) && (s_op_i_Q <= 8'h3e));
    assign s_csr_addr_o_D_ACT_wire = codasip_tmp_var_0 ? s_csr_addr_i_Q : 12'h000;
    assign s_csr_rd_we_o_D_ACT_wire = codasip_tmp_var_0 ? (csr_read_B0 & (((s_op_i_Q == 8'h34) || (s_op_i_Q == 8'h35)) || (s_op_i_Q == 8'h36))) : 1'b0;
    assign s_csr_re_o_D_ACT_wire = codasip_tmp_var_0 ? csr_read_B0 : 1'b0;
    assign s_csr_valid_o_D_ACT_wire = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign s_csr_wdata_o_D_ACT_wire = codasip_tmp_var_0 ? s_csr_wdata_i_Q : 32'h00000000;
    assign s_csr_we_o_D_ACT_wire = codasip_tmp_var_0 ? csr_write_B0 : 1'b0;
    assign s_csr_addr_o_D = s_csr_addr_o_D_ACT_wire;
    assign s_csr_rd_we_o_D = s_csr_rd_we_o_D_ACT_wire;
    assign s_csr_re_o_D = s_csr_re_o_D_ACT_wire;
    assign s_csr_valid_o_D = s_csr_valid_o_D_ACT_wire;
    assign s_csr_wdata_o_D = s_csr_wdata_o_D_ACT_wire;
    assign s_csr_we_o_D = s_csr_we_o_D_ACT_wire;
endmodule: codix_berkelium_ca_core_execute_stage_csr_compute_t
