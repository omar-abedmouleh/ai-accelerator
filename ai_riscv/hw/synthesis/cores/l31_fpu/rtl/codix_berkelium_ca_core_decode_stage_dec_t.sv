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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_decode_stage_dec_t' CodAL module.
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

module codix_berkelium_ca_core_decode_stage_dec_t(
    input  logic compute_ACT,
    input  logic [1:0] r_csr_mstatus_Q,
    input  logic [31:0] s_instr_i_D,
    input  logic s_ocd_progbuf_mode_i_D,
    output logic [11:0] s_csr_addr_o_Q,
    output logic [31:0] s_exc_tval_o_Q,
    output logic [4:0] s_exc_type_o_Q,
    output logic s_exc_valid_o_Q,
    output logic [5:0] s_fpu_op_o_Q,
    output logic [3:0] s_fu_o_Q,
    output logic [1:0] s_fu_s1_source_o_Q,
    output logic [1:0] s_fu_s2_source_o_Q,
    output logic [1:0] s_fu_s3_source_o_Q,
    output logic [31:0] s_imm_o_Q,
    output logic [7:0] s_op_o_Q,
    output logic [5:0] s_rd_addr_o_Q,
    output logic [2:0] s_rm_o_Q,
    output logic [5:0] s_rs1_addr_o_Q,
    output logic [5:0] s_rs2_addr_o_Q,
    output logic [5:0] s_rs3_addr_o_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic [31:0] s_instr_i;
    // CodAL signal/wire
    logic s_ocd_progbuf_mode_i;
    // CodAL signal/wire
    logic [31:0] s_imm_o;
    // CodAL signal/wire
    logic [11:0] s_csr_addr_o;
    // CodAL signal/wire
    logic [7:0] s_op_o;
    // CodAL signal/wire
    logic [5:0] s_rs1_addr_o;
    // CodAL signal/wire
    logic [5:0] s_rs2_addr_o;
    // CodAL signal/wire
    logic [5:0] s_rd_addr_o;
    // CodAL signal/wire
    logic [3:0] s_fu_o;
    // CodAL signal/wire
    logic [4:0] s_exc_type_o;
    // CodAL signal/wire
    logic [31:0] s_exc_tval_o;
    // CodAL signal/wire
    logic [1:0] s_fu_s2_source_o;
    // CodAL signal/wire
    logic [1:0] s_fu_s1_source_o;
    // CodAL signal/wire
    logic s_exc_valid_o;
    // CodAL signal/wire
    logic [5:0] s_fpu_op_o;
    // CodAL signal/wire
    logic [5:0] s_rs3_addr_o;
    // CodAL signal/wire
    logic [2:0] s_rm_o;
    // CodAL signal/wire
    logic [1:0] s_fu_s3_source_o;
    // CodAL signal/wire
    logic s_rs1_float_o;
    // CodAL signal/wire
    logic s_rs2_float_o;
    // CodAL signal/wire
    logic s_rd_float_o;
    // CodAL signal/wire
    logic s_instr_illegal_on_dbg;
    // CodAL signal/wire
    logic [4:0] s_imm_type;
    // CodAL signal/wire
    logic s_illegal_instr;
    // CodAL signal/wire
    logic [2:0] s_rd_type;
    // CodAL signal/wire
    logic [2:0] s_rs1_type;
    // CodAL signal/wire
    logic [2:0] s_rs2_type;

    // additional declarations:
    logic i_dec_codasip_param_1_wire;
    logic compute_i_dec_ACT_wire;
    logic [31:0] compute_i_dec_codasip_param_0_wire;

    // child instances inside CodAL module:
    // instance of 's_instr_i' CodAL signal/wire: (single driver)
    assign s_instr_i = s_instr_i_D;
    // instance of 's_ocd_progbuf_mode_i' CodAL signal/wire: (single driver)
    assign s_ocd_progbuf_mode_i = s_ocd_progbuf_mode_i_D;
    // instance of 's_imm_o' CodAL signal/wire: (parent port driver(s))
    assign s_imm_o_Q = s_imm_o;
    // instance of 's_csr_addr_o' CodAL signal/wire: (parent port driver(s))
    assign s_csr_addr_o_Q = s_csr_addr_o;
    // instance of 's_op_o' CodAL signal/wire: (parent port driver(s))
    assign s_op_o_Q = s_op_o;
    // instance of 's_rs1_addr_o' CodAL signal/wire: (parent port driver(s))
    assign s_rs1_addr_o_Q = s_rs1_addr_o;
    // instance of 's_rs2_addr_o' CodAL signal/wire: (parent port driver(s))
    assign s_rs2_addr_o_Q = s_rs2_addr_o;
    // instance of 's_rd_addr_o' CodAL signal/wire: (parent port driver(s))
    assign s_rd_addr_o_Q = s_rd_addr_o;
    // instance of 's_fu_o' CodAL signal/wire: (parent port driver(s))
    assign s_fu_o_Q = s_fu_o;
    // instance of 's_exc_type_o' CodAL signal/wire: (parent port driver(s))
    assign s_exc_type_o_Q = s_exc_type_o;
    // instance of 's_exc_tval_o' CodAL signal/wire: (parent port driver(s))
    assign s_exc_tval_o_Q = s_exc_tval_o;
    // instance of 's_fu_s2_source_o' CodAL signal/wire: (parent port driver(s))
    assign s_fu_s2_source_o_Q = s_fu_s2_source_o;
    // instance of 's_fu_s1_source_o' CodAL signal/wire: (parent port driver(s))
    assign s_fu_s1_source_o_Q = s_fu_s1_source_o;
    // instance of 's_exc_valid_o' CodAL signal/wire: (parent port driver(s))
    assign s_exc_valid_o_Q = s_exc_valid_o;
    // instance of 's_fpu_op_o' CodAL signal/wire: (parent port driver(s))
    assign s_fpu_op_o_Q = s_fpu_op_o;
    // instance of 's_rs3_addr_o' CodAL signal/wire: (parent port driver(s))
    assign s_rs3_addr_o_Q = s_rs3_addr_o;
    // instance of 's_rm_o' CodAL signal/wire: (parent port driver(s))
    assign s_rm_o_Q = s_rm_o;
    // instance of 's_fu_s3_source_o' CodAL signal/wire: (parent port driver(s))
    assign s_fu_s3_source_o_Q = s_fu_s3_source_o;
    // functional unit instance:
    codix_berkelium_ca_core_decode_stage_dec_compute_t compute (
        .ACT(compute_ACT),
        .i_dec_codasip_param_1(i_dec_codasip_param_1_wire),
        .r_csr_mstatus_Q(r_csr_mstatus_Q),
        .s_fu_o_Q(s_fu_o),
        .s_illegal_instr_Q(s_illegal_instr),
        .s_imm_type_Q(s_imm_type),
        .s_instr_i_Q(s_instr_i),
        .s_instr_illegal_on_dbg_Q(s_instr_illegal_on_dbg),
        .s_ocd_progbuf_mode_i_Q(s_ocd_progbuf_mode_i),
        .s_rd_addr_o_Q(s_rd_addr_o[5]),
        .s_rd_float_o_Q(s_rd_float_o),
        .s_rd_type_Q(s_rd_type),
        .s_rs1_float_o_Q(s_rs1_float_o),
        .s_rs1_type_Q(s_rs1_type),
        .s_rs2_addr_o_Q(s_rs2_addr_o[5]),
        .s_rs2_float_o_Q(s_rs2_float_o),
        .s_rs2_type_Q(s_rs2_type),
        .i_dec_ACT(compute_i_dec_ACT_wire),
        .i_dec_codasip_param_0(compute_i_dec_codasip_param_0_wire),
        .s_csr_addr_o_D(s_csr_addr_o),
        .s_exc_tval_o_D(s_exc_tval_o),
        .s_exc_type_o_D(s_exc_type_o),
        .s_exc_valid_o_D(s_exc_valid_o),
        .s_illegal_instr_D(s_illegal_instr),
        .s_imm_o_D(s_imm_o),
        .s_rd_addr_o_D(s_rd_addr_o),
        .s_rm_o_D(s_rm_o),
        .s_rs1_addr_o_D(s_rs1_addr_o),
        .s_rs2_addr_o_D(s_rs2_addr_o),
        .s_rs3_addr_o_D(s_rs3_addr_o)
    );

    // instruction decoder instance:
    codix_berkelium_ca_core_decode_stage_dec_i_dec_t i_dec (
        .ACT(compute_i_dec_ACT_wire),
        .codasip_param_0(compute_i_dec_codasip_param_0_wire),
        .codasip_param_1(i_dec_codasip_param_1_wire),
        .s_fpu_op_o_D(s_fpu_op_o),
        .s_fu_o_D(s_fu_o),
        .s_fu_s1_source_o_D(s_fu_s1_source_o),
        .s_fu_s2_source_o_D(s_fu_s2_source_o),
        .s_fu_s3_source_o_D(s_fu_s3_source_o),
        .s_imm_type_D(s_imm_type),
        .s_instr_illegal_on_dbg_D(s_instr_illegal_on_dbg),
        .s_op_o_D(s_op_o),
        .s_rd_float_o_D(s_rd_float_o),
        .s_rd_type_D(s_rd_type),
        .s_rs1_float_o_D(s_rs1_float_o),
        .s_rs1_type_D(s_rs1_type),
        .s_rs2_float_o_D(s_rs2_float_o),
        .s_rs2_type_D(s_rs2_type)
    );

endmodule: codix_berkelium_ca_core_decode_stage_dec_t
