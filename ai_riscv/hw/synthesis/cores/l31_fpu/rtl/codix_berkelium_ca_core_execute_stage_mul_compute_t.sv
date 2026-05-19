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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_mul_compute_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_mul_compute_t(
    input  logic ACT,
    input  logic [7:0] s_op_i_Q,
    input  logic [31:0] s_s1_data_i_Q,
    input  logic [31:0] s_s2_data_i_Q,
    output logic [31:0] s_rd_data_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic [7:0] codasip_tmp_var_0;
    // signal/wire
    logic [63:0] result_B0;
    // signal/wire
    logic s1_sign_B0;
    // signal/wire
    logic s2_sign_B0;
    // signal/wire
    logic [31:0] s_rd_data_o_D_ACT_wire;

    // additional declarations:
    logic signed [63:0] tmp_codasip_conv_MULTIPLIES_18_1;

    // conversions for data-path:
    assign tmp_codasip_conv_MULTIPLIES_18_1 = (signed'({(s1_sign_B0 & s_s1_data_i_Q[31]), s_s1_data_i_Q}) * signed'({(s2_sign_B0 & s_s2_data_i_Q[31]), s_s2_data_i_Q}));
    // data-path code:
    assign s1_sign_B0 = ((s_op_i_Q == 8'h44) | (s_op_i_Q == 8'h45));
    assign s2_sign_B0 = (s_op_i_Q == 8'h44);
    assign result_B0 = unsigned'(tmp_codasip_conv_MULTIPLIES_18_1);
    assign codasip_tmp_var_0 = s_op_i_Q;
    always_comb begin
        case ( codasip_tmp_var_0 )
            8'h43: s_rd_data_o_D_ACT_wire = result_B0[31:0];
            8'h44: s_rd_data_o_D_ACT_wire = result_B0[63:32];
            8'h45: s_rd_data_o_D_ACT_wire = result_B0[63:32];
            8'h46: s_rd_data_o_D_ACT_wire = result_B0[63:32];
            default: s_rd_data_o_D_ACT_wire = 32'h00000000;
        endcase
    end
    assign s_rd_data_o_D = (ACT == 1'b1) ? s_rd_data_o_D_ACT_wire : 32'h00000000;
endmodule: codix_berkelium_ca_core_execute_stage_mul_compute_t
