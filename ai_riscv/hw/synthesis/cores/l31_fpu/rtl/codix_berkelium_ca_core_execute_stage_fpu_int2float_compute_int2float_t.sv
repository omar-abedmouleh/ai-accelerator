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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_int2float_compute_int2float_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_fpu_int2float_compute_int2float_t(
    input  logic execute_stage_fpu_int2float_s_i2f_ce_ICLK,
    input  logic RST,
    input  logic pipe_i2f_COMPUTE_CLEAR_Q,
    input  logic pipe_i2f_COMPUTE_STALL_Q,
    input  logic pipe_i2f_ROUNDING_CLEAR_Q,
    input  logic pipe_i2f_ROUNDING_STALL_Q,
    input  logic r_fin_input_Q,
    input  logic r_fin_shift_Q,
    input  logic [5:0] s_op_i_Q,
    input  logic [2:0] s_rm_i_Q,
    input  logic [4:0] s_ROB_ptr_i_Q,
    input  logic [31:0] s_srcA_i_Q,
    input  logic s_start_i_Q,
    output logic r_fin_input_D,
    output logic r_fin_input_WE,
    output logic r_fin_shift_D,
    output logic r_fin_shift_WE,
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
    logic [7:0] count_r_shift_B0B1;
    // signal/wire
    logic [7:0] exp_B0B1;
    // signal/wire
    logic [7:0] exp_round_B0B2;
    // signal/wire
    logic [7:0] fract_ext_size_B0B1;
    // signal/wire
    logic [27:0] fract_round_B0B2;
    // signal/wire
    logic [27:0] fract_round_rot_B0B2;
    // signal/wire
    logic [25:0] fract_shifted_B0B1;
    // signal/wire
    logic inexact_B0B2;
    // signal/wire
    logic neg_max_B0B0;
    // signal/wire
    logic [31:0] pos_int_B0B0;
    // signal/wire
    logic [31:0] res_B0B2;
    // signal/wire
    logic [7:0] right_zero_position_B0B1;
    // signal/wire
    logic roundup_B0B2;
    // signal/wire
    logic shift_right_round_B0B2;
    // signal/wire
    logic sign_B0B0;
    // signal/wire
    logic sticky_B0B1;
    // signal/wire
    logic unsign_B0B0;
    // signal/wire
    logic zero_B0B2;

    // additional declarations:
    logic r_compute_ROB_ptr_WE;
    logic [4:0] r_compute_ROB_ptr_D;
    logic [4:0] r_compute_ROB_ptr_Q;
    logic r_compute_neg_max_WE;
    logic r_compute_neg_max_D;
    logic r_compute_neg_max_Q;
    logic r_compute_pos_int_WE;
    logic [31:0] r_compute_pos_int_D;
    logic [31:0] r_compute_pos_int_Q;
    logic r_compute_rm_WE;
    logic [2:0] r_compute_rm_D;
    logic [2:0] r_compute_rm_Q;
    logic r_compute_sign_WE;
    logic r_compute_sign_D;
    logic r_compute_sign_Q;
    logic r_compute_zeros_l_WE;
    logic [5:0] r_compute_zeros_l_D;
    logic [5:0] r_compute_zeros_l_Q;
    logic r_compute_zeros_r_WE;
    logic [5:0] r_compute_zeros_r_D;
    logic [5:0] r_compute_zeros_r_Q;
    logic r_rounding_ROB_ptr_WE;
    logic [4:0] r_rounding_ROB_ptr_D;
    logic [4:0] r_rounding_ROB_ptr_Q;
    logic r_rounding_exp_WE;
    logic [7:0] r_rounding_exp_D;
    logic [7:0] r_rounding_exp_Q;
    logic r_rounding_fract_ext_WE;
    logic [26:0] r_rounding_fract_ext_D;
    logic [26:0] r_rounding_fract_ext_Q;
    logic r_rounding_neg_max_WE;
    logic r_rounding_neg_max_D;
    logic r_rounding_neg_max_Q;
    logic r_rounding_rm_WE;
    logic [2:0] r_rounding_rm_D;
    logic [2:0] r_rounding_rm_Q;
    logic r_rounding_sign_WE;
    logic r_rounding_sign_D;
    logic r_rounding_sign_Q;

    // child instances inside functional unit:
    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_compute_ROB_ptr (
        .CLK(execute_stage_fpu_int2float_s_i2f_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_i2f_COMPUTE_CLEAR_Q),
        .STALL(pipe_i2f_COMPUTE_STALL_Q),
        .WE(r_compute_ROB_ptr_WE),
        .D(r_compute_ROB_ptr_D),
        .Q(r_compute_ROB_ptr_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_compute_neg_max (
        .CLK(execute_stage_fpu_int2float_s_i2f_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_i2f_COMPUTE_CLEAR_Q),
        .STALL(pipe_i2f_COMPUTE_STALL_Q),
        .WE(r_compute_neg_max_WE),
        .D(r_compute_neg_max_D),
        .Q(r_compute_neg_max_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_compute_pos_int (
        .CLK(execute_stage_fpu_int2float_s_i2f_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_i2f_COMPUTE_CLEAR_Q),
        .STALL(pipe_i2f_COMPUTE_STALL_Q),
        .WE(r_compute_pos_int_WE),
        .D(r_compute_pos_int_D),
        .Q(r_compute_pos_int_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_compute_rm (
        .CLK(execute_stage_fpu_int2float_s_i2f_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_i2f_COMPUTE_CLEAR_Q),
        .STALL(pipe_i2f_COMPUTE_STALL_Q),
        .WE(r_compute_rm_WE),
        .D(r_compute_rm_D),
        .Q(r_compute_rm_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_compute_sign (
        .CLK(execute_stage_fpu_int2float_s_i2f_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_i2f_COMPUTE_CLEAR_Q),
        .STALL(pipe_i2f_COMPUTE_STALL_Q),
        .WE(r_compute_sign_WE),
        .D(r_compute_sign_D),
        .Q(r_compute_sign_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_compute_zeros_l (
        .CLK(execute_stage_fpu_int2float_s_i2f_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_i2f_COMPUTE_CLEAR_Q),
        .STALL(pipe_i2f_COMPUTE_STALL_Q),
        .WE(r_compute_zeros_l_WE),
        .D(r_compute_zeros_l_D),
        .Q(r_compute_zeros_l_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_compute_zeros_r (
        .CLK(execute_stage_fpu_int2float_s_i2f_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_i2f_COMPUTE_CLEAR_Q),
        .STALL(pipe_i2f_COMPUTE_STALL_Q),
        .WE(r_compute_zeros_r_WE),
        .D(r_compute_zeros_r_D),
        .Q(r_compute_zeros_r_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_ROB_ptr (
        .CLK(execute_stage_fpu_int2float_s_i2f_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_i2f_ROUNDING_CLEAR_Q),
        .STALL(pipe_i2f_ROUNDING_STALL_Q),
        .WE(r_rounding_ROB_ptr_WE),
        .D(r_rounding_ROB_ptr_D),
        .Q(r_rounding_ROB_ptr_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd8),
        .DEFAULT_VALUE(8'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_exp (
        .CLK(execute_stage_fpu_int2float_s_i2f_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_i2f_ROUNDING_CLEAR_Q),
        .STALL(pipe_i2f_ROUNDING_STALL_Q),
        .WE(r_rounding_exp_WE),
        .D(r_rounding_exp_D),
        .Q(r_rounding_exp_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd27),
        .DEFAULT_VALUE(27'h0000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_fract_ext (
        .CLK(execute_stage_fpu_int2float_s_i2f_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_i2f_ROUNDING_CLEAR_Q),
        .STALL(pipe_i2f_ROUNDING_STALL_Q),
        .WE(r_rounding_fract_ext_WE),
        .D(r_rounding_fract_ext_D),
        .Q(r_rounding_fract_ext_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_neg_max (
        .CLK(execute_stage_fpu_int2float_s_i2f_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_i2f_ROUNDING_CLEAR_Q),
        .STALL(pipe_i2f_ROUNDING_STALL_Q),
        .WE(r_rounding_neg_max_WE),
        .D(r_rounding_neg_max_D),
        .Q(r_rounding_neg_max_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_rm (
        .CLK(execute_stage_fpu_int2float_s_i2f_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_i2f_ROUNDING_CLEAR_Q),
        .STALL(pipe_i2f_ROUNDING_STALL_Q),
        .WE(r_rounding_rm_WE),
        .D(r_rounding_rm_D),
        .Q(r_rounding_rm_Q)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rounding_sign (
        .CLK(execute_stage_fpu_int2float_s_i2f_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_i2f_ROUNDING_CLEAR_Q),
        .STALL(pipe_i2f_ROUNDING_STALL_Q),
        .WE(r_rounding_sign_WE),
        .D(r_rounding_sign_D),
        .Q(r_rounding_sign_Q)
    );

    // data-path code:
    assign unsign_B0B0 = (s_op_i_Q == 6'h0e);
    assign neg_max_B0B0 = ((!unsign_B0B0) && (s_srcA_i_Q == 32'h80000000));
    assign sign_B0B0 = ((!unsign_B0B0) && s_srcA_i_Q[31]);
    assign pos_int_B0B0 = (((!sign_B0B0)) ? s_srcA_i_Q : {1'b0, (-signed'(s_srcA_i_Q[30:0]))});
    assign r_compute_zeros_l_D = (((pos_int_B0B0[31] != 1'b0)) ? 6'h00 : (((pos_int_B0B0[30] != 1'b0)) ? 6'h01 : (((pos_int_B0B0[29] != 1'b0)) ? 6'h02 : (((pos_int_B0B0[28] != 1'b0)) ? 6'h03 : (((pos_int_B0B0[27] != 1'b0)) ? 6'h04 : (((pos_int_B0B0[26] != 1'b0)) ? 6'h05 : (((pos_int_B0B0[25] != 1'b0)) ? 6'h06 : (((pos_int_B0B0[24] != 1'b0)) ? 6'h07 : (((pos_int_B0B0[23] != 1'b0)) ? 6'h08 : (((pos_int_B0B0[22] != 1'b0)) ? 6'h09 : (((pos_int_B0B0[21] != 1'b0)) ? 6'h0a : (((pos_int_B0B0[20] != 1'b0)) ? 6'h0b : (((pos_int_B0B0[19] != 1'b0)) ? 6'h0c : (((pos_int_B0B0[18] != 1'b0)) ? 6'h0d : (((pos_int_B0B0[17] != 1'b0)) ? 6'h0e : (((pos_int_B0B0[16] != 1'b0)) ? 6'h0f : (((pos_int_B0B0[15] != 1'b0)) ? 6'h10 : (((pos_int_B0B0[14] != 1'b0)) ? 6'h11 : (((pos_int_B0B0[13] != 1'b0)) ? 6'h12 : (((pos_int_B0B0[12] != 1'b0)) ? 6'h13 : (((pos_int_B0B0[11] != 1'b0)) ? 6'h14 : (((pos_int_B0B0[10] != 1'b0)) ? 6'h15 : (((pos_int_B0B0[9] != 1'b0)) ? 6'h16 : (((pos_int_B0B0[8] != 1'b0)) ? 6'h17 : (((pos_int_B0B0[7] != 1'b0)) ? 6'h18 : (((pos_int_B0B0[6] != 1'b0)) ? 6'h19 : (((pos_int_B0B0[5] != 1'b0)) ? 6'h1a : (((pos_int_B0B0[4] != 1'b0)) ? 6'h1b : (((pos_int_B0B0[3] != 1'b0)) ? 6'h1c : (((pos_int_B0B0[2] != 1'b0)) ? 6'h1d : (((pos_int_B0B0[1] != 1'b0)) ? 6'h1e : (((pos_int_B0B0[0] != 1'b0)) ? 6'h1f : 6'h20))))))))))))))))))))))))))))))));
    assign r_compute_zeros_r_D = (((pos_int_B0B0[0] != 1'b0)) ? 6'h00 : (((pos_int_B0B0[1] != 1'b0)) ? 6'h01 : (((pos_int_B0B0[2] != 1'b0)) ? 6'h02 : (((pos_int_B0B0[3] != 1'b0)) ? 6'h03 : (((pos_int_B0B0[4] != 1'b0)) ? 6'h04 : (((pos_int_B0B0[5] != 1'b0)) ? 6'h05 : (((pos_int_B0B0[6] != 1'b0)) ? 6'h06 : (((pos_int_B0B0[7] != 1'b0)) ? 6'h07 : (((pos_int_B0B0[8] != 1'b0)) ? 6'h08 : (((pos_int_B0B0[9] != 1'b0)) ? 6'h09 : (((pos_int_B0B0[10] != 1'b0)) ? 6'h0a : (((pos_int_B0B0[11] != 1'b0)) ? 6'h0b : (((pos_int_B0B0[12] != 1'b0)) ? 6'h0c : (((pos_int_B0B0[13] != 1'b0)) ? 6'h0d : (((pos_int_B0B0[14] != 1'b0)) ? 6'h0e : (((pos_int_B0B0[15] != 1'b0)) ? 6'h0f : (((pos_int_B0B0[16] != 1'b0)) ? 6'h10 : (((pos_int_B0B0[17] != 1'b0)) ? 6'h11 : (((pos_int_B0B0[18] != 1'b0)) ? 6'h12 : (((pos_int_B0B0[19] != 1'b0)) ? 6'h13 : (((pos_int_B0B0[20] != 1'b0)) ? 6'h14 : (((pos_int_B0B0[21] != 1'b0)) ? 6'h15 : (((pos_int_B0B0[22] != 1'b0)) ? 6'h16 : (((pos_int_B0B0[23] != 1'b0)) ? 6'h17 : (((pos_int_B0B0[24] != 1'b0)) ? 6'h18 : (((pos_int_B0B0[25] != 1'b0)) ? 6'h19 : (((pos_int_B0B0[26] != 1'b0)) ? 6'h1a : (((pos_int_B0B0[27] != 1'b0)) ? 6'h1b : (((pos_int_B0B0[28] != 1'b0)) ? 6'h1c : (((pos_int_B0B0[29] != 1'b0)) ? 6'h1d : (((pos_int_B0B0[30] != 1'b0)) ? 6'h1e : (((pos_int_B0B0[31] != 1'b0)) ? 6'h1f : 6'h20))))))))))))))))))))))))))))))));
    assign codasip_tmp_var_0 = s_start_i_Q;
    assign r_compute_pos_int_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_compute_pos_int_D = pos_int_B0B0;
    assign r_compute_sign_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_compute_sign_D = sign_B0B0;
    assign r_compute_neg_max_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_compute_neg_max_D = neg_max_B0B0;
    assign r_compute_ROB_ptr_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_compute_ROB_ptr_D = s_ROB_ptr_i_Q;
    assign r_compute_rm_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_compute_rm_D = s_rm_i_Q;
    assign count_r_shift_B0B1 = (8'h20 - 8'(r_compute_zeros_l_Q));
    assign exp_B0B1 = (8'h7e + count_r_shift_B0B1);
    assign fract_shifted_B0B1 = 26'(({r_compute_pos_int_Q, 26'h0000000} >> count_r_shift_B0B1));
    assign fract_ext_size_B0B1 = 8'h1a;
    assign right_zero_position_B0B1 = (((count_r_shift_B0B1 > fract_ext_size_B0B1)) ? (count_r_shift_B0B1 - 8'(r_compute_zeros_r_Q)) : 8'h00);
    assign sticky_B0B1 = (right_zero_position_B0B1 > fract_ext_size_B0B1);
    assign r_rounding_fract_ext_D = {fract_shifted_B0B1, sticky_B0B1};
    assign r_rounding_exp_D = exp_B0B1;
    assign r_rounding_sign_D = r_compute_sign_Q;
    assign r_rounding_neg_max_D = r_compute_neg_max_Q;
    assign r_rounding_ROB_ptr_D = r_compute_ROB_ptr_Q;
    assign r_rounding_rm_D = r_compute_rm_Q;
    assign roundup_B0B2 = ((((r_rounding_rm_Q == 3'h0)) ? 32'(unsigned'(1'((r_rounding_fract_ext_Q[2] & ((r_rounding_fract_ext_Q[1] | r_rounding_fract_ext_Q[0]) | r_rounding_fract_ext_Q[3]))))) : (((r_rounding_rm_Q == 3'h3)) ? 32'(unsigned'(1'((((r_rounding_fract_ext_Q[2] | r_rounding_fract_ext_Q[1]) | r_rounding_fract_ext_Q[0]) & (~r_rounding_sign_Q))))) : (((r_rounding_rm_Q == 3'h2)) ? 32'(unsigned'(1'((((r_rounding_fract_ext_Q[2] | r_rounding_fract_ext_Q[1]) | r_rounding_fract_ext_Q[0]) & r_rounding_sign_Q)))) : (((r_rounding_rm_Q == 3'h4)) ? 32'(r_rounding_fract_ext_Q[2]) : 32'h00000000)))) != 32'h00000000);
    assign fract_round_B0B2 = (28'(r_rounding_fract_ext_Q) + 28'(unsigned'(4'({roundup_B0B2, 3'h0}))));
    assign shift_right_round_B0B2 = fract_round_B0B2[27];
    assign codasip_tmp_var_1 = shift_right_round_B0B2;
    assign exp_round_B0B2 = codasip_tmp_var_1 ? (r_rounding_exp_Q + 8'h01) : r_rounding_exp_Q;
    assign fract_round_rot_B0B2 = codasip_tmp_var_1 ? (fract_round_B0B2 >> 32'sh00000001) : fract_round_B0B2;
    assign zero_B0B2 = (fract_round_rot_B0B2 == 28'h0000000);
    assign codasip_tmp_var_2 = r_rounding_neg_max_Q;
    assign codasip_tmp_var_3 = (!codasip_tmp_var_2) ? zero_B0B2 : 1'b0;
    assign res_B0B2 = codasip_tmp_var_2 ? 32'hcf000000 :
        codasip_tmp_var_3 ? 32'h00000000 : {r_rounding_sign_Q, exp_round_B0B2, fract_round_rot_B0B2[25:3]};
    assign inexact_B0B2 = (((shift_right_round_B0B2 || fract_round_rot_B0B2[2]) || fract_round_rot_B0B2[1]) || fract_round_rot_B0B2[0]);
    assign r_compute_zeros_l_WE = 1'b1;
    assign r_compute_zeros_r_WE = 1'b1;
    assign r_rounding_ROB_ptr_WE = 1'b1;
    assign r_rounding_exp_WE = 1'b1;
    assign r_rounding_fract_ext_WE = 1'b1;
    assign r_rounding_neg_max_WE = 1'b1;
    assign r_rounding_rm_WE = 1'b1;
    assign r_rounding_sign_WE = 1'b1;
    assign r_fin_input_D = s_start_i_Q;
    assign r_fin_input_WE = 1'b1;
    assign r_fin_shift_D = r_fin_input_Q;
    assign r_fin_shift_WE = 1'b1;
    assign s_done_o_D = r_fin_shift_Q;
    assign s_flags_o_D = {4'h0, inexact_B0B2};
    assign s_result_o_D = res_B0B2;
    assign s_ROB_ptr_o_D = r_rounding_ROB_ptr_Q;
endmodule: codix_berkelium_ca_core_execute_stage_fpu_int2float_compute_int2float_t
