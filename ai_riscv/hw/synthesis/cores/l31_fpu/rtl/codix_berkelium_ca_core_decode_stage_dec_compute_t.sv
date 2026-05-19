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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_decode_stage_dec_compute_t' functional unit.
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

module codix_berkelium_ca_core_decode_stage_dec_compute_t(
    input  logic ACT,
    input  logic i_dec_codasip_param_1,
    input  logic [1:0] r_csr_mstatus_Q,
    input  logic [3:0] s_fu_o_Q,
    input  logic s_illegal_instr_Q,
    input  logic [4:0] s_imm_type_Q,
    input  logic [31:0] s_instr_i_Q,
    input  logic s_instr_illegal_on_dbg_Q,
    input  logic s_ocd_progbuf_mode_i_Q,
    input  logic s_rd_addr_o_Q,
    input  logic s_rd_float_o_Q,
    input  logic [2:0] s_rd_type_Q,
    input  logic s_rs1_float_o_Q,
    input  logic [2:0] s_rs1_type_Q,
    input  logic s_rs2_addr_o_Q,
    input  logic s_rs2_float_o_Q,
    input  logic [2:0] s_rs2_type_Q,
    output logic i_dec_ACT,
    output logic [31:0] i_dec_codasip_param_0,
    output logic [11:0] s_csr_addr_o_D,
    output logic [31:0] s_exc_tval_o_D,
    output logic [4:0] s_exc_type_o_D,
    output logic s_exc_valid_o_D,
    output logic s_illegal_instr_D,
    output logic [31:0] s_imm_o_D,
    output logic [5:0] s_rd_addr_o_D,
    output logic [2:0] s_rm_o_D,
    output logic [5:0] s_rs1_addr_o_D,
    output logic [5:0] s_rs2_addr_o_D,
    output logic [5:0] s_rs3_addr_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic [4:0] codasip_tmp_var_0;
    // signal/wire
    logic [2:0] codasip_tmp_var_1;
    // signal/wire
    logic [2:0] codasip_tmp_var_2;
    // signal/wire
    logic [2:0] codasip_tmp_var_3;
    // signal/wire
    logic illegal_f_instr_B0;
    // signal/wire
    logic [31:0] imm_csr_B0;
    // signal/wire
    logic [31:0] imm_i_B0;
    // signal/wire
    logic [31:0] imm_rvc_addi_B0;
    // signal/wire
    logic [31:0] imm_rvc_addisp_B0;
    // signal/wire
    logic [31:0] imm_rvc_addispn_B0;
    // signal/wire
    logic [31:0] imm_rvc_beq_B0;
    // signal/wire
    logic [31:0] imm_rvc_jal_B0;
    // signal/wire
    logic [31:0] imm_rvc_li_B0;
    // signal/wire
    logic [31:0] imm_rvc_lsw_B0;
    // signal/wire
    logic [31:0] imm_rvc_lwsp_B0;
    // signal/wire
    logic [31:0] imm_rvc_nzimm_B0;
    // signal/wire
    logic [31:0] imm_rvc_swsp_B0;
    // signal/wire
    logic [31:0] imm_s_B0;
    // signal/wire
    logic [31:0] imm_sb_B0;
    // signal/wire
    logic [31:0] imm_u_B0;
    // signal/wire
    logic [31:0] imm_uj_B0;
    // signal/wire
    logic [4:0] rd_addr_B0;
    // signal/wire
    logic [4:0] rs1_addr_B0;
    // signal/wire
    logic [4:0] rs2_addr_B0;
    // signal/wire
    logic [31:0] s_imm_o_D_ACT_wire;

    // data-path code:
    assign imm_i_B0 = unsigned'(32'(signed'(s_instr_i_Q[31:20])));
    assign imm_s_B0 = unsigned'(32'(signed'(12'(signed'({s_instr_i_Q[31:25], s_instr_i_Q[11:7]})))));
    assign imm_u_B0 = unsigned'(signed'({s_instr_i_Q[31:12], 12'h000}));
    assign imm_sb_B0 = unsigned'(32'(signed'(13'(signed'({s_instr_i_Q[31], s_instr_i_Q[7], s_instr_i_Q[30:25], s_instr_i_Q[11:8], 1'b0})))));
    assign imm_uj_B0 = unsigned'(32'(signed'(21'(signed'({s_instr_i_Q[31], s_instr_i_Q[19:12], s_instr_i_Q[20], s_instr_i_Q[30:21], 1'b0})))));
    assign imm_csr_B0 = 32'(s_instr_i_Q[19:15]);
    assign imm_rvc_lwsp_B0 = 32'(unsigned'(8'({s_instr_i_Q[3:2], s_instr_i_Q[12], s_instr_i_Q[6:4], 2'h0})));
    assign imm_rvc_swsp_B0 = 32'(unsigned'(8'({s_instr_i_Q[8:7], s_instr_i_Q[12:9], 2'h0})));
    assign imm_rvc_lsw_B0 = 32'(unsigned'(7'({s_instr_i_Q[5], s_instr_i_Q[12:10], s_instr_i_Q[6], 2'h0})));
    assign imm_rvc_jal_B0 = unsigned'(32'(signed'(12'(signed'({s_instr_i_Q[12], s_instr_i_Q[8], s_instr_i_Q[10:9], s_instr_i_Q[6], s_instr_i_Q[7], s_instr_i_Q[2], s_instr_i_Q[11], s_instr_i_Q[5:3], 1'b0})))));
    assign imm_rvc_beq_B0 = unsigned'(32'(signed'(9'(signed'({s_instr_i_Q[12], s_instr_i_Q[6:5], s_instr_i_Q[2], s_instr_i_Q[11:10], s_instr_i_Q[4:3], 1'b0})))));
    assign imm_rvc_li_B0 = unsigned'(32'(9'(32'(signed'(6'(signed'({s_instr_i_Q[12], s_instr_i_Q[6:2]})))))));
    assign imm_rvc_nzimm_B0 = unsigned'(32'(signed'(18'(signed'({s_instr_i_Q[12], s_instr_i_Q[6:2], 12'h000})))));
    assign imm_rvc_addisp_B0 = unsigned'(32'(signed'(10'(signed'({s_instr_i_Q[12], s_instr_i_Q[4:3], s_instr_i_Q[5], s_instr_i_Q[2], s_instr_i_Q[6], 4'h0})))));
    assign imm_rvc_addi_B0 = unsigned'(32'(signed'(6'(signed'({s_instr_i_Q[12], s_instr_i_Q[6:2]})))));
    assign imm_rvc_addispn_B0 = 32'(unsigned'(10'({s_instr_i_Q[10:7], s_instr_i_Q[12:11], s_instr_i_Q[5], s_instr_i_Q[6], 2'h0})));
    assign codasip_tmp_var_0 = s_imm_type_Q;
    always_comb begin
        case ( codasip_tmp_var_0 )
            5'h01: s_imm_o_D_ACT_wire = unsigned'(signed'(imm_i_B0));
            5'h02: s_imm_o_D_ACT_wire = unsigned'(signed'(imm_s_B0));
            5'h03: s_imm_o_D_ACT_wire = unsigned'(signed'(imm_sb_B0));
            5'h04: s_imm_o_D_ACT_wire = unsigned'(signed'(imm_u_B0));
            5'h05: s_imm_o_D_ACT_wire = unsigned'(signed'(imm_uj_B0));
            5'h06: s_imm_o_D_ACT_wire = unsigned'(signed'(imm_csr_B0));
            5'h07: s_imm_o_D_ACT_wire = unsigned'(signed'(imm_rvc_lwsp_B0));
            5'h08: s_imm_o_D_ACT_wire = unsigned'(signed'(imm_rvc_swsp_B0));
            5'h09: s_imm_o_D_ACT_wire = unsigned'(signed'(imm_rvc_lsw_B0));
            5'h0a: s_imm_o_D_ACT_wire = unsigned'(signed'(imm_rvc_jal_B0));
            5'h0b: s_imm_o_D_ACT_wire = unsigned'(signed'(imm_rvc_beq_B0));
            5'h0c: s_imm_o_D_ACT_wire = unsigned'(signed'(imm_rvc_li_B0));
            5'h0d: s_imm_o_D_ACT_wire = unsigned'(signed'(imm_rvc_nzimm_B0));
            5'h0e: s_imm_o_D_ACT_wire = unsigned'(signed'(imm_rvc_addisp_B0));
            5'h0f: s_imm_o_D_ACT_wire = unsigned'(signed'(imm_rvc_addi_B0));
            5'h10: s_imm_o_D_ACT_wire = unsigned'(signed'(imm_rvc_addispn_B0));
            5'h11: s_imm_o_D_ACT_wire = unsigned'(signed'(imm_rvc_addi_B0));
            5'h12: s_imm_o_D_ACT_wire = unsigned'(signed'(imm_rvc_addi_B0));
            default: s_imm_o_D_ACT_wire = 32'h00000000;
        endcase
    end
    assign codasip_tmp_var_1 = s_rs1_type_Q;
    always_comb begin
        case ( codasip_tmp_var_1 )
            3'h3: rs1_addr_B0 = {2'h1, s_instr_i_Q[9:7]};
            3'h4: rs1_addr_B0 = unsigned'(signed'(s_instr_i_Q[11:7]));
            3'h5: rs1_addr_B0 = 5'h02;
            default: rs1_addr_B0 = unsigned'(signed'(s_instr_i_Q[19:15]));
        endcase
    end
    assign codasip_tmp_var_2 = s_rs2_type_Q;
    always_comb begin
        case ( codasip_tmp_var_2 )
            3'h1: rs2_addr_B0 = unsigned'(signed'(s_instr_i_Q[6:2]));
            3'h2: rs2_addr_B0 = {2'h1, s_instr_i_Q[4:2]};
            default: rs2_addr_B0 = unsigned'(signed'(s_instr_i_Q[24:20]));
        endcase
    end
    assign codasip_tmp_var_3 = s_rd_type_Q;
    always_comb begin
        case ( codasip_tmp_var_3 )
            3'h0: rd_addr_B0 = unsigned'(signed'(s_instr_i_Q[11:7]));
            3'h1: rd_addr_B0 = {2'h1, s_instr_i_Q[4:2]};
            3'h2: rd_addr_B0 = {2'h1, s_instr_i_Q[9:7]};
            3'h3: rd_addr_B0 = 5'h00;
            3'h4: rd_addr_B0 = 5'h01;
            default: rd_addr_B0 = unsigned'(signed'(s_instr_i_Q[11:7]));
        endcase
    end
    assign illegal_f_instr_B0 = (((s_fu_o_Q == 4'h7) | ((s_fu_o_Q == 4'h2) & (s_rs2_addr_o_Q | s_rd_addr_o_Q))) & (r_csr_mstatus_Q == 2'h0));
    assign i_dec_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    assign i_dec_codasip_param_0 = (ACT == 1'b1) ? s_instr_i_Q : 32'h00000000;
    assign s_csr_addr_o_D = (ACT == 1'b1) ? s_instr_i_Q[31:20] : 12'h000;
    assign s_exc_tval_o_D = (ACT == 1'b1) ? s_instr_i_Q : 32'h00000000;
    assign s_exc_type_o_D = (ACT == 1'b1) ? 5'h02 : 5'h00;
    assign s_exc_valid_o_D = (ACT == 1'b1) ? ((s_illegal_instr_Q || illegal_f_instr_B0) || (s_instr_illegal_on_dbg_Q && s_ocd_progbuf_mode_i_Q)) : 1'b0;
    assign s_illegal_instr_D = (ACT == 1'b1) ? i_dec_codasip_param_1 : 1'b0;
    assign s_imm_o_D = (ACT == 1'b1) ? s_imm_o_D_ACT_wire : 32'h00000000;
    assign s_rd_addr_o_D = (ACT == 1'b1) ? {s_rd_float_o_Q, rd_addr_B0} : 6'h00;
    assign s_rm_o_D = (ACT == 1'b1) ? s_instr_i_Q[14:12] : 3'h0;
    assign s_rs1_addr_o_D = (ACT == 1'b1) ? {s_rs1_float_o_Q, rs1_addr_B0} : 6'h00;
    assign s_rs2_addr_o_D = (ACT == 1'b1) ? {s_rs2_float_o_Q, rs2_addr_B0} : 6'h00;
    assign s_rs3_addr_o_D = (ACT == 1'b1) ? {1'b1, s_instr_i_Q[31:27]} : 6'h00;
endmodule: codix_berkelium_ca_core_decode_stage_dec_compute_t
