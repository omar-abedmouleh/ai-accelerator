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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_float2int_compute_float2int_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_fpu_float2int_compute_float2int_t(
    input  logic execute_stage_fpu_float2int_s_f2i_ce_ICLK,
    input  logic RST,
    input  logic pipe_f2i_F2I_CLEAR_Q,
    input  logic pipe_f2i_F2I_STALL_Q,
    input  logic r_f2i_fin_Q,
    input  logic [5:0] s_op_i_Q,
    input  logic [2:0] s_properties_i_Q,
    input  logic [2:0] s_rm_i_Q,
    input  logic [4:0] s_ROB_ptr_i_Q,
    input  logic [31:0] s_srcA_i_Q,
    input  logic s_start_i_Q,
    output logic r_f2i_fin_D,
    output logic r_f2i_fin_WE,
    output logic s_done_o_D,
    output logic [4:0] s_flags_o_D,
    output logic [31:0] s_result_o_D,
    output logic [4:0] s_ROB_ptr_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic codasip_tmp_var_0;
    // signal/wire
    logic codasip_tmp_var_1;
    // signal/wire
    logic codasip_tmp_var_2;
    // signal/wire
    logic codasip_tmp_var_3;
    // signal/wire
    logic codasip_tmp_var_4;
    // signal/wire
    logic codasip_tmp_var_5;
    // signal/wire
    logic codasip_tmp_var_6;
    // signal/wire
    logic signed [8:0] exp_B0B0;
    // signal/wire
    logic [7:0] exp_encoded_B0B0;
    // signal/wire
    logic exp_limit_B0B0B0B1;
    // signal/wire
    logic exp_underflow_B0B0B0B1;
    // signal/wire
    logic [22:0] fract_B0B0;
    // signal/wire
    logic [23:0] fract_ext_B0B0;
    // signal/wire
    logic fract_underflow_B0B0B0B1;
    // signal/wire
    logic hidden_B0B0;
    // signal/wire
    logic inexact_B0B1;
    // signal/wire
    logic inf_A_B0B1;
    // signal/wire
    logic int_overflow_B0B0;
    // signal/wire
    logic [32:0] int_round_B0B1;
    // signal/wire
    logic [31:0] int_round_zext_B0B1;
    // signal/wire
    logic [31:0] int_round_zext_neg_B0B1;
    // signal/wire
    logic int_underflow_B0B0;
    // signal/wire
    logic [35:0] int_unrounded_ext_B0B0;
    // signal/wire
    logic int_unsigned_B0B0;
    // signal/wire
    logic invalid_B0B1;
    // signal/wire
    logic nan_A_B0B1;
    // signal/wire
    logic negative_to_zero_oor_B0B1;
    // signal/wire
    logic oor_B0B1;
    // signal/wire
    logic overflow_B0B1;
    // signal/wire
    logic [31:0] res_B0B1;
    // signal/wire
    logic [31:0] res_final_B0B1;
    // signal/wire
    logic [2:0] rm_B0B1;
    // signal/wire
    logic roundup_B0B1;
    // signal/wire
    logic [8:0] shift_amount_B0B0;
    // signal/wire
    logic signed [8:0] shift_amount_raw_B0B0;
    // signal/wire
    logic [58:0] shifted_fract_B0B0;
    // signal/wire
    logic sign_A_B0B1;
    // signal/wire
    logic sign_B0B0;
    // signal/wire
    logic sticky_B0B0;
    // signal/wire
    logic underflow_B0B1;

    // additional declarations:
    logic r_f2i_ROB_ptr_WE;
    logic [4:0] r_f2i_ROB_ptr_D;
    logic [4:0] r_f2i_ROB_ptr_Q;
    logic r_f2i_overflow_WE;
    logic r_f2i_overflow_D;
    logic r_f2i_overflow_Q;
    logic r_f2i_properties_WE;
    logic [2:0] r_f2i_properties_D;
    logic [2:0] r_f2i_properties_Q;
    logic r_f2i_rm_WE;
    logic [2:0] r_f2i_rm_D;
    logic [2:0] r_f2i_rm_Q;
    logic r_f2i_underflow_WE;
    logic r_f2i_underflow_D;
    logic r_f2i_underflow_Q;
    logic r_f2i_unrounded_ext_WE;
    logic [35:0] r_f2i_unrounded_ext_D;
    logic [35:0] r_f2i_unrounded_ext_Q;
    logic r_f2i_unsigned_WE;
    logic r_f2i_unsigned_D;
    logic r_f2i_unsigned_Q;

    // child instances inside functional unit:
    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_f2i_ROB_ptr (
        .CLK(execute_stage_fpu_float2int_s_f2i_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_f2i_F2I_CLEAR_Q),
        .STALL(pipe_f2i_F2I_STALL_Q),
        .WE(r_f2i_ROB_ptr_WE),
        .D(r_f2i_ROB_ptr_D),
        .Q(r_f2i_ROB_ptr_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_f2i_overflow (
        .CLK(execute_stage_fpu_float2int_s_f2i_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_f2i_F2I_CLEAR_Q),
        .STALL(pipe_f2i_F2I_STALL_Q),
        .WE(r_f2i_overflow_WE),
        .D(r_f2i_overflow_D),
        .Q(r_f2i_overflow_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_f2i_properties (
        .CLK(execute_stage_fpu_float2int_s_f2i_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_f2i_F2I_CLEAR_Q),
        .STALL(pipe_f2i_F2I_STALL_Q),
        .WE(r_f2i_properties_WE),
        .D(r_f2i_properties_D),
        .Q(r_f2i_properties_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_f2i_rm (
        .CLK(execute_stage_fpu_float2int_s_f2i_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_f2i_F2I_CLEAR_Q),
        .STALL(pipe_f2i_F2I_STALL_Q),
        .WE(r_f2i_rm_WE),
        .D(r_f2i_rm_D),
        .Q(r_f2i_rm_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_f2i_underflow (
        .CLK(execute_stage_fpu_float2int_s_f2i_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_f2i_F2I_CLEAR_Q),
        .STALL(pipe_f2i_F2I_STALL_Q),
        .WE(r_f2i_underflow_WE),
        .D(r_f2i_underflow_D),
        .Q(r_f2i_underflow_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd36),
        .DEFAULT_VALUE(36'h000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_f2i_unrounded_ext (
        .CLK(execute_stage_fpu_float2int_s_f2i_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_f2i_F2I_CLEAR_Q),
        .STALL(pipe_f2i_F2I_STALL_Q),
        .WE(r_f2i_unrounded_ext_WE),
        .D(r_f2i_unrounded_ext_D),
        .Q(r_f2i_unrounded_ext_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_f2i_unsigned (
        .CLK(execute_stage_fpu_float2int_s_f2i_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_f2i_F2I_CLEAR_Q),
        .STALL(pipe_f2i_F2I_STALL_Q),
        .WE(r_f2i_unsigned_WE),
        .D(r_f2i_unsigned_D),
        .Q(r_f2i_unsigned_Q)
    );

    // data-path code:
    assign sign_B0B0 = s_srcA_i_Q[31];
    assign exp_encoded_B0B0 = s_srcA_i_Q[30:23];
    assign hidden_B0B0 = (exp_encoded_B0B0 != 8'h00);
    assign fract_B0B0 = s_srcA_i_Q[22:0];
    assign exp_B0B0 = signed'(9'((32'(exp_encoded_B0B0) - 32'h0000007f)));
    assign int_unsigned_B0B0 = (s_op_i_Q == 6'h0d);
    assign codasip_tmp_var_0 = sign_B0B0;
    assign codasip_tmp_var_1 = codasip_tmp_var_0 ? int_unsigned_B0B0 : 1'b0;
    assign exp_underflow_B0B0B0B1 = ((!codasip_tmp_var_1) && codasip_tmp_var_0) ? (exp_B0B0 > 9'sh01f) : 1'b0;
    assign exp_limit_B0B0B0B1 = ((!codasip_tmp_var_1) && codasip_tmp_var_0) ? (exp_B0B0 == 9'sh01f) : 1'b0;
    assign fract_underflow_B0B0B0B1 = ((!codasip_tmp_var_1) && codasip_tmp_var_0) ? (fract_B0B0 != 23'h000000) : 1'b0;
    assign int_underflow_B0B0 = codasip_tmp_var_1 ? (exp_B0B0 > 9'sh1ff) :
        codasip_tmp_var_0 ? (exp_underflow_B0B0B0B1 || (exp_limit_B0B0B0B1 && fract_underflow_B0B0B0B1)) : 1'b0;
    assign codasip_tmp_var_2 = (!codasip_tmp_var_0) ? int_unsigned_B0B0 : 1'b0;
    assign int_overflow_B0B0 = codasip_tmp_var_0 ? 1'b0 :
        codasip_tmp_var_2 ? (exp_B0B0 > 9'sh01f) : (exp_B0B0 > 9'sh01e);
    assign fract_ext_B0B0 = {hidden_B0B0, fract_B0B0};
    assign shift_amount_raw_B0B0 = (((exp_B0B0 > 9'sh1fd)) ? (((exp_B0B0 < 9'sh038)) ? (exp_B0B0 + 9'sh003) : 9'sh03b) : 9'sh000);
    assign shift_amount_B0B0 = 9'(shift_amount_raw_B0B0[7:0]);
    assign shifted_fract_B0B0 = (59'(fract_ext_B0B0) << shift_amount_B0B0);
    assign sticky_B0B0 = (shifted_fract_B0B0[23:0] != 24'h000000);
    assign int_unrounded_ext_B0B0 = {shifted_fract_B0B0[58:24], sticky_B0B0};
    assign codasip_tmp_var_3 = s_start_i_Q;
    assign r_f2i_underflow_WE = codasip_tmp_var_3 ? 1'b1 : 1'b0;
    assign r_f2i_underflow_D = int_underflow_B0B0;
    assign r_f2i_overflow_WE = codasip_tmp_var_3 ? 1'b1 : 1'b0;
    assign r_f2i_overflow_D = int_overflow_B0B0;
    assign r_f2i_unsigned_WE = codasip_tmp_var_3 ? 1'b1 : 1'b0;
    assign r_f2i_unsigned_D = int_unsigned_B0B0;
    assign r_f2i_unrounded_ext_WE = codasip_tmp_var_3 ? 1'b1 : 1'b0;
    assign r_f2i_unrounded_ext_D = int_unrounded_ext_B0B0;
    assign r_f2i_ROB_ptr_WE = codasip_tmp_var_3 ? 1'b1 : 1'b0;
    assign r_f2i_ROB_ptr_D = s_ROB_ptr_i_Q;
    assign r_f2i_properties_WE = codasip_tmp_var_3 ? 1'b1 : 1'b0;
    assign r_f2i_properties_D = s_properties_i_Q;
    assign r_f2i_rm_WE = codasip_tmp_var_3 ? 1'b1 : 1'b0;
    assign r_f2i_rm_D = s_rm_i_Q;
    assign sign_A_B0B1 = r_f2i_properties_Q[0];
    assign inf_A_B0B1 = r_f2i_properties_Q[1];
    assign nan_A_B0B1 = r_f2i_properties_Q[2];
    assign rm_B0B1 = r_f2i_rm_Q;
    assign roundup_B0B1 = ((((rm_B0B1 == 3'h0)) ? 32'(unsigned'(1'((r_f2i_unrounded_ext_Q[2] & ((r_f2i_unrounded_ext_Q[1] | r_f2i_unrounded_ext_Q[0]) | r_f2i_unrounded_ext_Q[3]))))) : (((rm_B0B1 == 3'h3)) ? 32'(unsigned'(1'((((r_f2i_unrounded_ext_Q[2] | r_f2i_unrounded_ext_Q[1]) | r_f2i_unrounded_ext_Q[0]) & (~sign_A_B0B1))))) : (((rm_B0B1 == 3'h2)) ? 32'(unsigned'(1'((((r_f2i_unrounded_ext_Q[2] | r_f2i_unrounded_ext_Q[1]) | r_f2i_unrounded_ext_Q[0]) & sign_A_B0B1)))) : (((rm_B0B1 == 3'h4)) ? 32'(r_f2i_unrounded_ext_Q[2]) : 32'h00000000)))) != 32'h00000000);
    assign int_round_B0B1 = (r_f2i_unrounded_ext_Q[35:3] + 33'(roundup_B0B1));
    assign negative_to_zero_oor_B0B1 = ((sign_A_B0B1 && r_f2i_unsigned_Q) && (int_round_B0B1 != 33'h000000000));
    assign oor_B0B1 = (negative_to_zero_oor_B0B1 || inf_A_B0B1);
    assign underflow_B0B1 = (r_f2i_underflow_Q || (oor_B0B1 && sign_A_B0B1));
    assign overflow_B0B1 = (r_f2i_overflow_Q || (oor_B0B1 && (!sign_A_B0B1)));
    assign invalid_B0B1 = ((underflow_B0B1 || overflow_B0B1) || nan_A_B0B1);
    assign int_round_zext_neg_B0B1 = (-32'(int_round_B0B1));
    assign int_round_zext_B0B1 = 32'(int_round_B0B1);
    assign codasip_tmp_var_4 = invalid_B0B1;
    assign codasip_tmp_var_5 = codasip_tmp_var_4 ? r_f2i_unsigned_Q : 1'b0;
    assign codasip_tmp_var_6 = ((!codasip_tmp_var_5) && codasip_tmp_var_4) ? (overflow_B0B1 || nan_A_B0B1) : 1'b0;
    assign res_B0B1 = codasip_tmp_var_5 ? (((overflow_B0B1 || nan_A_B0B1)) ? 32'hffffffff : 32'h00000000) :
        codasip_tmp_var_6 ? 32'h7fffffff :
        codasip_tmp_var_4 ? 32'h80000000 : res_final_B0B1;
    assign res_final_B0B1 = (!codasip_tmp_var_4) ? ((sign_A_B0B1) ? int_round_zext_neg_B0B1 : int_round_zext_B0B1) : 32'h00000000;
    assign inexact_B0B1 = (((r_f2i_unrounded_ext_Q[2] || r_f2i_unrounded_ext_Q[1]) || r_f2i_unrounded_ext_Q[0]) && (!invalid_B0B1));
    assign r_f2i_fin_D = s_start_i_Q;
    assign r_f2i_fin_WE = 1'b1;
    assign s_done_o_D = r_f2i_fin_Q;
    assign s_flags_o_D = {invalid_B0B1, 1'b0, 1'b0, 1'b0, inexact_B0B1};
    assign s_result_o_D = 32'({32'h00000000, res_B0B1});
    assign s_ROB_ptr_o_D = r_f2i_ROB_ptr_Q;
endmodule: codix_berkelium_ca_core_execute_stage_fpu_float2int_compute_float2int_t
