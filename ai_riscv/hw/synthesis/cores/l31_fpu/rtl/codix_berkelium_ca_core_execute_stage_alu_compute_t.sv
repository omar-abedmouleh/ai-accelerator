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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_alu_compute_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_alu_compute_t(
    input  logic ACT,
    input  logic [7:0] s_op_i_Q,
    input  logic [31:0] s_s1_data_i_Q,
    input  logic [31:0] s_s2_data_i_Q,
    output logic [31:0] s_rd_data_o_D,
    output logic s_take_branch_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic signed [32:0] addop2_B0;
    // signal/wire
    logic signed [32:0] addsub_B0;
    // signal/wire
    logic [7:0] codasip_tmp_var_0;
    // signal/wire
    logic [7:0] codasip_tmp_var_1;
    // signal/wire
    logic [31:0] codasip_tmp_var_2;
    // signal/wire
    logic [31:0] codasip_tmp_var_3;
    // signal/wire
    logic [31:0] codasip_tmp_var_4;
    // signal/wire
    logic equal_B0;
    // signal/wire
    logic is_add_B0;
    // signal/wire
    logic is_left_B0;
    // signal/wire
    logic less_B0;
    // signal/wire
    logic signed [32:0] ltop1_B0;
    // signal/wire
    logic signed [32:0] ltop2_B0;
    // signal/wire
    logic signed [32:0] op1_B0;
    // signal/wire
    logic signed [32:0] op2_B0;
    // signal/wire
    logic signed [32:0] rev_op_B0;
    // signal/wire
    logic signed [32:0] s2_data_neg_B0;
    // signal/wire
    logic [31:0] s_rd_data_o_D_ACT_wire;
    // signal/wire
    logic s_take_branch_o_D_ACT_wire;
    // signal/wire
    logic [4:0] shamt_B0;
    // signal/wire
    logic signed [32:0] shift_B0;
    // signal/wire
    logic signed [32:0] shop_B0;
    // signal/wire
    logic signed [31:0] shrd_B0;
    // signal/wire
    logic sign_B0;

    // data-path code:
    assign sign_B0 = ((((s_op_i_Q == 8'h09) | (s_op_i_Q == 8'h02)) | (s_op_i_Q == 8'h0c)) | (s_op_i_Q == 8'h0e));
    assign op1_B0 = signed'({(sign_B0 & s_s1_data_i_Q[31]), s_s1_data_i_Q});
    assign op2_B0 = signed'({(sign_B0 & s_s2_data_i_Q[31]), s_s2_data_i_Q});
    assign ltop1_B0 = op1_B0;
    assign ltop2_B0 = op2_B0;
    assign is_add_B0 = (s_op_i_Q == 8'h00);
    assign s2_data_neg_B0 = signed'((-unsigned'(ltop2_B0)));
    assign addop2_B0 = ((is_add_B0) ? ltop2_B0 : s2_data_neg_B0);
    assign addsub_B0 = (ltop1_B0 + addop2_B0);
    assign less_B0 = addsub_B0[32];
    assign equal_B0 = (s_s1_data_i_Q == s_s2_data_i_Q);
    assign codasip_tmp_var_0 = s_op_i_Q;
    always_comb begin
        case ( codasip_tmp_var_0 )
            8'h0a: s_take_branch_o_D_ACT_wire = equal_B0;
            8'h0b: s_take_branch_o_D_ACT_wire = (~equal_B0);
            8'h0c: s_take_branch_o_D_ACT_wire = less_B0;
            8'h0d: s_take_branch_o_D_ACT_wire = less_B0;
            8'h0e: s_take_branch_o_D_ACT_wire = (~less_B0);
            8'h0f: s_take_branch_o_D_ACT_wire = (~less_B0);
            default: s_take_branch_o_D_ACT_wire = 1'b1;
        endcase
    end
    assign is_left_B0 = (s_op_i_Q == 8'h07);
    assign codasip_tmp_var_3 = ltop1_B0[31:0];
    assign rev_op_B0 = signed'(33'(unsigned'(32'({codasip_tmp_var_3[0], codasip_tmp_var_3[1], codasip_tmp_var_3[2], codasip_tmp_var_3[3], codasip_tmp_var_3[4], codasip_tmp_var_3[5], codasip_tmp_var_3[6], codasip_tmp_var_3[7], codasip_tmp_var_3[8], codasip_tmp_var_3[9], codasip_tmp_var_3[10], codasip_tmp_var_3[11], codasip_tmp_var_3[12], codasip_tmp_var_3[13], codasip_tmp_var_3[14], codasip_tmp_var_3[15], codasip_tmp_var_3[16], codasip_tmp_var_3[17], codasip_tmp_var_3[18], codasip_tmp_var_3[19], codasip_tmp_var_3[20], codasip_tmp_var_3[21], codasip_tmp_var_3[22], codasip_tmp_var_3[23], codasip_tmp_var_3[24], codasip_tmp_var_3[25], codasip_tmp_var_3[26], codasip_tmp_var_3[27], codasip_tmp_var_3[28], codasip_tmp_var_3[29], codasip_tmp_var_3[30], codasip_tmp_var_3[31]}))));
    assign shop_B0 = ((is_left_B0) ? rev_op_B0 : ltop1_B0);
    assign shamt_B0 = s_s2_data_i_Q[4:0];
    assign shift_B0 = 33'(32'((shop_B0 >>> shamt_B0)));
    assign codasip_tmp_var_4 = shift_B0[31:0];
    assign codasip_tmp_var_2 = {codasip_tmp_var_4[0], codasip_tmp_var_4[1], codasip_tmp_var_4[2], codasip_tmp_var_4[3], codasip_tmp_var_4[4], codasip_tmp_var_4[5], codasip_tmp_var_4[6], codasip_tmp_var_4[7], codasip_tmp_var_4[8], codasip_tmp_var_4[9], codasip_tmp_var_4[10], codasip_tmp_var_4[11], codasip_tmp_var_4[12], codasip_tmp_var_4[13], codasip_tmp_var_4[14], codasip_tmp_var_4[15], codasip_tmp_var_4[16], codasip_tmp_var_4[17], codasip_tmp_var_4[18], codasip_tmp_var_4[19], codasip_tmp_var_4[20], codasip_tmp_var_4[21], codasip_tmp_var_4[22], codasip_tmp_var_4[23], codasip_tmp_var_4[24], codasip_tmp_var_4[25], codasip_tmp_var_4[26], codasip_tmp_var_4[27], codasip_tmp_var_4[28], codasip_tmp_var_4[29], codasip_tmp_var_4[30], codasip_tmp_var_4[31]};
    assign shrd_B0 = 32'(((is_left_B0) ? signed'(33'(codasip_tmp_var_2)) : shift_B0));
    assign codasip_tmp_var_1 = s_op_i_Q;
    always_comb begin
        case ( codasip_tmp_var_1 )
            8'h00: s_rd_data_o_D_ACT_wire = unsigned'(32'(addsub_B0));
            8'h01: s_rd_data_o_D_ACT_wire = unsigned'(32'(addsub_B0));
            8'h02: s_rd_data_o_D_ACT_wire = 32'(less_B0);
            8'h03: s_rd_data_o_D_ACT_wire = 32'(less_B0);
            8'h04: s_rd_data_o_D_ACT_wire = (s_s1_data_i_Q & s_s2_data_i_Q);
            8'h05: s_rd_data_o_D_ACT_wire = (s_s1_data_i_Q | s_s2_data_i_Q);
            8'h06: s_rd_data_o_D_ACT_wire = (s_s1_data_i_Q ^ s_s2_data_i_Q);
            8'h07: s_rd_data_o_D_ACT_wire = unsigned'(shrd_B0);
            8'h08: s_rd_data_o_D_ACT_wire = unsigned'(shrd_B0);
            8'h09: s_rd_data_o_D_ACT_wire = unsigned'(shrd_B0);
            default: s_rd_data_o_D_ACT_wire = 32'h00000000;
        endcase
    end
    assign s_rd_data_o_D = (ACT == 1'b1) ? s_rd_data_o_D_ACT_wire : 32'h00000000;
    assign s_take_branch_o_D = (ACT == 1'b1) ? s_take_branch_o_D_ACT_wire : 1'b0;
endmodule: codix_berkelium_ca_core_execute_stage_alu_compute_t
