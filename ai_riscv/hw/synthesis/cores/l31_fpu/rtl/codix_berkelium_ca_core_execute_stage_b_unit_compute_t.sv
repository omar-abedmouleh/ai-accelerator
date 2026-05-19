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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_b_unit_compute_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_b_unit_compute_t(
    input  logic ACT,
    input  logic [7:0] s_op_i_Q,
    input  logic [31:0] s_s1_data_i_Q,
    input  logic [31:0] s_s2_data_i_Q,
    output logic [31:0] s_rd_data_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic alu_V_flag_B0;
    // signal/wire
    logic alu_cmp_lt_B0;
    // signal/wire
    logic alu_cmp_slt_B0;
    // signal/wire
    logic [32:0] alu_res_B0;
    // signal/wire
    logic [63:0] clmul_res_B0;
    // signal/wire
    logic signed [63:0] codasip_return2_clmul_inline_1_inline_1;
    // signal/wire
    logic signed [31:0] codasip_return2_cpop_inline_1_inline_1;
    // signal/wire
    logic signed [31:0] codasip_return2_ctlz_xlen_inline_1_inline_1;
    // signal/wire
    logic signed [31:0] codasip_return2_cttz_xlen_inline_1_inline_1;
    // signal/wire
    logic [7:0] codasip_tmp_var_0;
    // signal/wire
    logic [7:0] codasip_tmp_var_1;
    // signal/wire
    logic [31:0] left_shift_B0;
    // signal/wire
    logic [31:0] pre_res_B0;
    // signal/wire
    logic [31:0] right_shift_B0;
    // signal/wire
    logic [31:0] s_rd_data_o_D_ACT_wire;
    // signal/wire
    logic [4:0] shamt_B0;
    // signal/wire
    logic [32:0] src1_B0B5;
    // signal/wire
    logic [32:0] src2_B0B5;
    // signal/wire
    logic sub_B0B5;

    // additional declarations:
    logic clmul_inline_1_inline_1_ACT;
    logic [31:0] clmul_inline_1_inline_1_codasip_param_0;
    logic [31:0] clmul_inline_1_inline_1_codasip_param_1;
    logic [63:0] clmul_inline_1_inline_1_RET;
    logic cpop_inline_1_inline_1_ACT;
    logic [31:0] cpop_inline_1_inline_1_codasip_param_0;
    logic [31:0] cpop_inline_1_inline_1_RET;
    logic ctlz_xlen_inline_1_inline_1_ACT;
    logic [31:0] ctlz_xlen_inline_1_inline_1_codasip_param_0;
    logic [31:0] ctlz_xlen_inline_1_inline_1_RET;
    logic cttz_xlen_inline_1_inline_1_ACT;
    logic [31:0] cttz_xlen_inline_1_inline_1_codasip_param_0;
    logic [31:0] cttz_xlen_inline_1_inline_1_RET;

    // child instances inside functional unit:
    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_b_unit_clmul_t clmul_inline_1_inline_1 (
        .ACT(clmul_inline_1_inline_1_ACT),
        .codasip_param_0(clmul_inline_1_inline_1_codasip_param_0),
        .codasip_param_1(clmul_inline_1_inline_1_codasip_param_1),
        .RET(clmul_inline_1_inline_1_RET)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_b_unit_cpop_t cpop_inline_1_inline_1 (
        .ACT(cpop_inline_1_inline_1_ACT),
        .codasip_param_0(cpop_inline_1_inline_1_codasip_param_0),
        .RET(cpop_inline_1_inline_1_RET)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_b_unit_ctlz_xlen_t ctlz_xlen_inline_1_inline_1 (
        .ACT(ctlz_xlen_inline_1_inline_1_ACT),
        .codasip_param_0(ctlz_xlen_inline_1_inline_1_codasip_param_0),
        .RET(ctlz_xlen_inline_1_inline_1_RET)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_b_unit_cttz_xlen_t cttz_xlen_inline_1_inline_1 (
        .ACT(cttz_xlen_inline_1_inline_1_ACT),
        .codasip_param_0(cttz_xlen_inline_1_inline_1_codasip_param_0),
        .RET(cttz_xlen_inline_1_inline_1_RET)
    );

    // data-path code:
    assign codasip_tmp_var_0 = s_op_i_Q;
    always_comb begin
        case ( codasip_tmp_var_0 )
            8'h80: pre_res_B0 = {s_s1_data_i_Q[30:0], 1'b0};
            8'h81: pre_res_B0 = {s_s1_data_i_Q[29:0], 2'h0};
            8'h82: pre_res_B0 = {s_s1_data_i_Q[28:0], 3'h0};
            8'h97: pre_res_B0 = 32'h00000001;
            8'h99: pre_res_B0 = 32'h00000001;
            8'h9a: pre_res_B0 = 32'h00000001;
            default: pre_res_B0 = s_s1_data_i_Q;
        endcase
    end
    assign codasip_return2_clmul_inline_1_inline_1 = signed'(clmul_inline_1_inline_1_RET);
    assign clmul_inline_1_inline_1_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    assign clmul_inline_1_inline_1_codasip_param_0 = (ACT == 1'b1) ? s_s1_data_i_Q : 32'h00000000;
    assign clmul_inline_1_inline_1_codasip_param_1 = (ACT == 1'b1) ? s_s2_data_i_Q : 32'h00000000;
    assign clmul_res_B0 = unsigned'(codasip_return2_clmul_inline_1_inline_1);
    assign shamt_B0 = s_s2_data_i_Q[4:0];
    assign left_shift_B0 = (pre_res_B0 << shamt_B0);
    assign right_shift_B0 = (pre_res_B0 >> shamt_B0);
    assign sub_B0B5 = ((((s_op_i_Q == 8'h87) | (s_op_i_Q == 8'h89)) | (s_op_i_Q == 8'h88)) | (s_op_i_Q == 8'h8a));
    assign src1_B0B5 = 33'(pre_res_B0);
    assign src2_B0B5 = ((sub_B0B5) ? (~33'(s_s2_data_i_Q)) : 33'(s_s2_data_i_Q));
    assign alu_res_B0 = ((src1_B0B5 + src2_B0B5) + 33'(sub_B0B5));
    assign alu_V_flag_B0 = (((alu_res_B0[31] & (~src1_B0B5[31])) & (~src2_B0B5[31])) | (((~alu_res_B0[31]) & src1_B0B5[31]) & src2_B0B5[31]));
    assign alu_cmp_slt_B0 = (alu_res_B0[31] ^ alu_V_flag_B0);
    assign alu_cmp_lt_B0 = alu_res_B0[32];
    assign codasip_tmp_var_1 = s_op_i_Q;
    assign codasip_return2_ctlz_xlen_inline_1_inline_1 = signed'(ctlz_xlen_inline_1_inline_1_RET);
    assign ctlz_xlen_inline_1_inline_1_ACT = ((ACT == 1'b1) && (codasip_tmp_var_1 == 8'h84)) ? 1'b1 : 1'b0;
    assign ctlz_xlen_inline_1_inline_1_codasip_param_0 = ((ACT == 1'b1) && (codasip_tmp_var_1 == 8'h84)) ? s_s1_data_i_Q : 32'h00000000;
    assign codasip_return2_cttz_xlen_inline_1_inline_1 = signed'(cttz_xlen_inline_1_inline_1_RET);
    assign cttz_xlen_inline_1_inline_1_ACT = ((ACT == 1'b1) && (codasip_tmp_var_1 == 8'h86)) ? 1'b1 : 1'b0;
    assign cttz_xlen_inline_1_inline_1_codasip_param_0 = ((ACT == 1'b1) && (codasip_tmp_var_1 == 8'h86)) ? s_s1_data_i_Q : 32'h00000000;
    assign codasip_return2_cpop_inline_1_inline_1 = signed'(cpop_inline_1_inline_1_RET);
    assign cpop_inline_1_inline_1_ACT = ((ACT == 1'b1) && (codasip_tmp_var_1 == 8'h85)) ? 1'b1 : 1'b0;
    assign cpop_inline_1_inline_1_codasip_param_0 = ((ACT == 1'b1) && (codasip_tmp_var_1 == 8'h85)) ? pre_res_B0 : 32'h00000000;
    always_comb begin
        case ( codasip_tmp_var_1 )
            8'h80: s_rd_data_o_D_ACT_wire = alu_res_B0[31:0];
            8'h81: s_rd_data_o_D_ACT_wire = alu_res_B0[31:0];
            8'h82: s_rd_data_o_D_ACT_wire = alu_res_B0[31:0];
            8'h83: s_rd_data_o_D_ACT_wire = (s_s1_data_i_Q & (~s_s2_data_i_Q));
            8'h84: s_rd_data_o_D_ACT_wire = unsigned'(codasip_return2_ctlz_xlen_inline_1_inline_1);
            8'h85: s_rd_data_o_D_ACT_wire = unsigned'(codasip_return2_cpop_inline_1_inline_1);
            8'h86: s_rd_data_o_D_ACT_wire = unsigned'(codasip_return2_cttz_xlen_inline_1_inline_1);
            8'h87: s_rd_data_o_D_ACT_wire = ((alu_cmp_slt_B0) ? s_s2_data_i_Q : s_s1_data_i_Q);
            8'h88: s_rd_data_o_D_ACT_wire = ((alu_cmp_lt_B0) ? s_s2_data_i_Q : s_s1_data_i_Q);
            8'h89: s_rd_data_o_D_ACT_wire = ((alu_cmp_slt_B0) ? s_s1_data_i_Q : s_s2_data_i_Q);
            8'h8a: s_rd_data_o_D_ACT_wire = ((alu_cmp_lt_B0) ? s_s1_data_i_Q : s_s2_data_i_Q);
            8'h8b: s_rd_data_o_D_ACT_wire = {{32'd8{(s_s1_data_i_Q[31:24] != 8'h00)}}, {32'd8{(s_s1_data_i_Q[23:16] != 8'h00)}}, {32'd8{(s_s1_data_i_Q[15:8] != 8'h00)}}, {32'd8{(s_s1_data_i_Q[7:0] != 8'h00)}}};
            8'h8c: s_rd_data_o_D_ACT_wire = (s_s1_data_i_Q | (~s_s2_data_i_Q));
            8'h8d: s_rd_data_o_D_ACT_wire = {s_s1_data_i_Q[7:0], s_s1_data_i_Q[15:8], s_s1_data_i_Q[23:16], s_s1_data_i_Q[31:24]};
            8'h8e: s_rd_data_o_D_ACT_wire = ((s_s1_data_i_Q << shamt_B0) | (s_s1_data_i_Q >> (32 - shamt_B0)));
            8'h8f: s_rd_data_o_D_ACT_wire = ((s_s1_data_i_Q >> shamt_B0) | (s_s1_data_i_Q << (32 - shamt_B0)));
            8'h90: s_rd_data_o_D_ACT_wire = unsigned'(32'(signed'(s_s1_data_i_Q[7:0])));
            8'h91: s_rd_data_o_D_ACT_wire = unsigned'(32'(signed'(s_s1_data_i_Q[15:0])));
            8'h92: s_rd_data_o_D_ACT_wire = (~(s_s1_data_i_Q ^ s_s2_data_i_Q));
            8'h93: s_rd_data_o_D_ACT_wire = 32'(s_s1_data_i_Q[15:0]);
            8'h94: s_rd_data_o_D_ACT_wire = clmul_res_B0[31:0];
            8'h95: s_rd_data_o_D_ACT_wire = clmul_res_B0[63:32];
            8'h96: s_rd_data_o_D_ACT_wire = clmul_res_B0[62:31];
            8'h97: s_rd_data_o_D_ACT_wire = (s_s1_data_i_Q & (~left_shift_B0));
            8'h98: s_rd_data_o_D_ACT_wire = 32'(right_shift_B0[0]);
            8'h99: s_rd_data_o_D_ACT_wire = (s_s1_data_i_Q ^ left_shift_B0);
            8'h9a: s_rd_data_o_D_ACT_wire = (s_s1_data_i_Q | left_shift_B0);
            default: s_rd_data_o_D_ACT_wire = 32'h00000000;
        endcase
    end
    assign s_rd_data_o_D = (ACT == 1'b1) ? s_rd_data_o_D_ACT_wire : 32'h00000000;
endmodule: codix_berkelium_ca_core_execute_stage_b_unit_compute_t
