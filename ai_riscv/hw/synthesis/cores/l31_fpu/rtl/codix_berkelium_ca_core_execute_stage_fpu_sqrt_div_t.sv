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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_sqrt_div_t' CodAL module.
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

module codix_berkelium_ca_core_execute_stage_fpu_sqrt_div_t(
    input  logic execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK,
    input  logic RST,
    input  logic pipe_sqrt_div_SQRT_DIV_CLEAR_Q,
    input  logic s_clk_en_i_D,
    input  logic s_flush_i_D,
    input  logic [5:0] s_op_i_D,
    input  logic [9:0] s_properties_i_D,
    input  logic [2:0] s_rm_i_D,
    input  logic [4:0] s_ROB_ptr_i_D,
    input  logic [31:0] s_srcA_i_D,
    input  logic [31:0] s_srcB_i_D,
    input  logic s_start_i_D,
    output logic pipe_sqrt_div_SQRT_DIV_CLEAR_D,
    output logic s_busy_o_Q,
    output logic s_clk_en_i_Q,
    output logic s_done_o_Q,
    output logic [4:0] s_flags_o_Q,
    output logic s_ready_o_Q,
    output logic [31:0] s_result_o_Q,
    output logic [4:0] s_ROB_ptr_o_Q,
    output logic s_sqrt_div_ce_Q,
    output logic s_start_i_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic s_start_i;
    // CodAL signal/wire
    logic s_flush_i;
    // CodAL signal/wire
    logic [31:0] s_srcA_i;
    // CodAL signal/wire
    logic [31:0] s_srcB_i;
    // CodAL signal/wire
    logic [5:0] s_op_i;
    // CodAL signal/wire
    logic [2:0] s_rm_i;
    // CodAL signal/wire
    logic [4:0] s_ROB_ptr_i;
    // CodAL signal/wire
    logic s_clk_en_i;
    // CodAL signal/wire
    logic [9:0] s_properties_i;
    // CodAL signal/wire
    logic s_busy_o;
    // CodAL signal/wire
    logic s_ready_o;
    // CodAL signal/wire
    logic [31:0] s_result_o;
    // CodAL signal/wire
    logic [4:0] s_flags_o;
    // CodAL signal/wire
    logic [4:0] s_ROB_ptr_o;
    // CodAL signal/wire
    logic s_done_o;
    // CodAL signal/wire
    logic sqrt_div_busy;
    // CodAL signal/wire
    logic s_sqr_div_done_comp;
    // CodAL signal/wire
    logic s_sqrt_div_ce;

    // additional declarations:
    logic compute_sqrt_div_r_prenorm_fract_B_WE_wire;
    logic [52:0] compute_sqrt_div_r_prenorm_fract_B_D_wire;
    logic [52:0] r_prenorm_fract_B_Q_wire;
    logic compute_sqrt_div_r_divident_A_WE_wire;
    logic [52:0] compute_sqrt_div_r_divident_A_D_wire;
    logic [52:0] r_divident_A_Q_wire;
    logic compute_sqrt_div_r_divison_B_WE_wire;
    logic [53:0] compute_sqrt_div_r_divison_B_D_wire;
    logic [53:0] r_divison_B_Q_wire;
    logic compute_sqrt_div_r_sqrt_en_WE_wire;
    logic compute_sqrt_div_r_sqrt_en_D_wire;
    logic r_sqrt_en_Q_wire;
    logic compute_sqrt_div_r_div_en_WE_wire;
    logic compute_sqrt_div_r_div_en_D_wire;
    logic r_div_en_Q_wire;
    logic compute_sqrt_div_r_computing_WE_wire;
    logic compute_sqrt_div_r_computing_D_wire;
    logic r_computing_Q_wire;
    logic compute_sqrt_div_r_sticky_rem_WE_wire;
    logic compute_sqrt_div_r_sticky_rem_D_wire;
    logic r_sticky_rem_Q_wire;
    logic compute_sqrt_div_r_partial_remainder_WE_wire;
    logic [57:0] compute_sqrt_div_r_partial_remainder_D_wire;
    logic [57:0] r_partial_remainder_Q_wire;
    logic compute_sqrt_div_r_quotient_WE_wire;
    logic [56:0] compute_sqrt_div_r_quotient_D_wire;
    logic [56:0] r_quotient_Q_wire;
    logic compute_sqrt_div_r_quotient_32_WE_wire;
    logic [56:0] compute_sqrt_div_r_quotient_32_D_wire;
    logic [56:0] r_quotient_32_Q_wire;
    logic compute_sqrt_div_r_mantissa_upper_part_WE_wire;
    logic [52:0] compute_sqrt_div_r_mantissa_upper_part_D_wire;
    logic [52:0] r_mantissa_upper_part_Q_wire;
    logic compute_sqrt_div_r_cnt_val_WE_wire;
    logic [5:0] compute_sqrt_div_r_cnt_val_D_wire;
    logic [5:0] r_cnt_val_Q_wire;
    logic compute_sqrt_div_r_mant_sqrt_norm_WE_wire;
    logic [53:0] compute_sqrt_div_r_mant_sqrt_norm_D_wire;
    logic [53:0] r_mant_sqrt_norm_Q_wire;
    logic compute_sqrt_div_r_exp_A_WE_wire;
    logic [11:0] compute_sqrt_div_r_exp_A_D_wire;
    logic [11:0] r_exp_A_Q_wire;
    logic compute_sqrt_div_r_exp_B_WE_wire;
    logic [11:0] compute_sqrt_div_r_exp_B_D_wire;
    logic [11:0] r_exp_B_Q_wire;
    logic compute_sqrt_div_r_mantissa_sticky_bit_WE_wire;
    logic compute_sqrt_div_r_mantissa_sticky_bit_D_wire;
    logic r_mantissa_sticky_bit_Q_wire;
    logic compute_sqrt_div_r_nan_A_WE_wire;
    logic compute_sqrt_div_r_nan_A_D_wire;
    logic r_nan_A_Q_wire;
    logic compute_sqrt_div_r_nan_B_WE_wire;
    logic compute_sqrt_div_r_nan_B_D_wire;
    logic r_nan_B_Q_wire;
    logic compute_sqrt_div_r_inf_A_WE_wire;
    logic compute_sqrt_div_r_inf_A_D_wire;
    logic r_inf_A_Q_wire;
    logic compute_sqrt_div_r_inf_B_WE_wire;
    logic compute_sqrt_div_r_inf_B_D_wire;
    logic r_inf_B_Q_wire;
    logic compute_sqrt_div_r_zero_A_WE_wire;
    logic compute_sqrt_div_r_zero_A_D_wire;
    logic r_zero_A_Q_wire;
    logic compute_sqrt_div_r_zero_B_WE_wire;
    logic compute_sqrt_div_r_zero_B_D_wire;
    logic r_zero_B_Q_wire;
    logic compute_sqrt_div_r_sign_bit_WE_wire;
    logic compute_sqrt_div_r_sign_bit_D_wire;
    logic r_sign_bit_Q_wire;
    logic compute_sqrt_div_r_snan_WE_wire;
    logic compute_sqrt_div_r_snan_D_wire;
    logic r_snan_Q_wire;
    logic compute_sqrt_div_r_sign_bit_fin_WE_wire;
    logic compute_sqrt_div_r_sign_bit_fin_D_wire;
    logic r_sign_bit_fin_Q_wire;
    logic compute_sqrt_div_r_remainder_en_WE_wire;
    logic compute_sqrt_div_r_remainder_en_D_wire;
    logic r_remainder_en_Q_wire;
    logic compute_sqrt_div_r_same_number_WE_wire;
    logic compute_sqrt_div_r_same_number_D_wire;
    logic r_same_number_Q_wire;
    logic compute_sqrt_div_r_mantissa_lower_part_WE_wire;
    logic [1:0] compute_sqrt_div_r_mantissa_lower_part_D_wire;
    logic [1:0] r_mantissa_lower_part_Q_wire;
    logic compute_sqrt_div_r_round_mode_WE_wire;
    logic [2:0] compute_sqrt_div_r_round_mode_D_wire;
    logic [2:0] r_round_mode_Q_wire;
    logic compute_sqrt_div_r_round_mode_fin_WE_wire;
    logic [2:0] compute_sqrt_div_r_round_mode_fin_D_wire;
    logic [2:0] r_round_mode_fin_Q_wire;
    logic compute_sqrt_div_r_exp_result_prenorm_WE_wire;
    logic [12:0] compute_sqrt_div_r_exp_result_prenorm_D_wire;
    logic [12:0] r_exp_result_prenorm_Q_wire;
    logic compute_sqrt_div_r_tiny_WE_wire;
    logic compute_sqrt_div_r_tiny_D_wire;
    logic r_tiny_Q_wire;
    logic compute_sqrt_div_r_sign_res_WE_wire;
    logic compute_sqrt_div_r_sign_res_D_wire;
    logic r_sign_res_Q_wire;
    logic compute_sqrt_div_r_invalid_WE_wire;
    logic compute_sqrt_div_r_invalid_D_wire;
    logic r_invalid_Q_wire;
    logic compute_sqrt_div_r_div_zero_WE_wire;
    logic compute_sqrt_div_r_div_zero_D_wire;
    logic r_div_zero_Q_wire;
    logic compute_sqrt_div_r_overflow_WE_wire;
    logic compute_sqrt_div_r_overflow_D_wire;
    logic r_overflow_Q_wire;
    logic compute_sqrt_div_r_exp_norm_res_WE_wire;
    logic [10:0] compute_sqrt_div_r_exp_norm_res_D_wire;
    logic [10:0] r_exp_norm_res_Q_wire;
    logic compute_sqrt_div_r_remainder_shift_WE_wire;
    logic [56:0] compute_sqrt_div_r_remainder_shift_D_wire;
    logic [56:0] r_remainder_shift_Q_wire;
    logic compute_sqrt_div_r_result_man_shift_WE_wire;
    logic [56:0] compute_sqrt_div_r_result_man_shift_D_wire;
    logic [56:0] r_result_man_shift_Q_wire;
    logic compute_sqrt_div_r_Iteration2_sum_WE_wire;
    logic [57:0] compute_sqrt_div_r_Iteration2_sum_D_wire;
    logic [57:0] r_Iteration2_sum_Q_wire;
    logic compute_sqrt_div_r_Iteration1_sum_WE_wire;
    logic [57:0] compute_sqrt_div_r_Iteration1_sum_D_wire;
    logic [57:0] r_Iteration1_sum_Q_wire;
    logic compute_sqrt_div_r_ROB_ptr_work_WE_wire;
    logic [4:0] compute_sqrt_div_r_ROB_ptr_work_D_wire;
    logic [4:0] r_ROB_ptr_work_Q_wire;
    logic compute_sqrt_div_r_sqr_div_rob_round_WE_wire;
    logic [4:0] compute_sqrt_div_r_sqr_div_rob_round_D_wire;
    logic [4:0] r_sqr_div_rob_round_Q_wire;
    logic compute_sqrt_div_r_sqr_div_rob_post_norm_WE_wire;
    logic [4:0] compute_sqrt_div_r_sqr_div_rob_post_norm_D_wire;
    logic [4:0] r_sqr_div_rob_post_norm_Q_wire;
    logic compute_sqrt_div_r_sqr_div_done_round_WE_wire;
    logic compute_sqrt_div_r_sqr_div_done_round_D_wire;
    logic r_sqr_div_done_round_Q_wire;
    logic compute_sqrt_div_r_sqr_div_done_post_norm_WE_wire;
    logic compute_sqrt_div_r_sqr_div_done_post_norm_D_wire;
    logic r_sqr_div_done_post_norm_Q_wire;

    // child instances inside CodAL module:
    // instance of 's_start_i' CodAL signal/wire: (single driver)
    assign s_start_i = s_start_i_D;
    // instance of 's_start_i' CodAL signal/wire: (parent port driver(s))
    assign s_start_i_Q = s_start_i;
    // instance of 's_flush_i' CodAL signal/wire: (single driver)
    assign s_flush_i = s_flush_i_D;
    // instance of 's_srcA_i' CodAL signal/wire: (single driver)
    assign s_srcA_i = s_srcA_i_D;
    // instance of 's_srcB_i' CodAL signal/wire: (single driver)
    assign s_srcB_i = s_srcB_i_D;
    // instance of 's_op_i' CodAL signal/wire: (single driver)
    assign s_op_i = s_op_i_D;
    // instance of 's_rm_i' CodAL signal/wire: (single driver)
    assign s_rm_i = s_rm_i_D;
    // instance of 's_ROB_ptr_i' CodAL signal/wire: (single driver)
    assign s_ROB_ptr_i = s_ROB_ptr_i_D;
    // instance of 's_clk_en_i' CodAL signal/wire: (single driver)
    assign s_clk_en_i = s_clk_en_i_D;
    // instance of 's_clk_en_i' CodAL signal/wire: (parent port driver(s))
    assign s_clk_en_i_Q = s_clk_en_i;
    // instance of 's_properties_i' CodAL signal/wire: (single driver)
    assign s_properties_i = s_properties_i_D;
    // instance of 's_busy_o' CodAL signal/wire: (parent port driver(s))
    assign s_busy_o_Q = s_busy_o;
    // instance of 's_ready_o' CodAL signal/wire: (parent port driver(s))
    assign s_ready_o_Q = s_ready_o;
    // instance of 's_result_o' CodAL signal/wire: (parent port driver(s))
    assign s_result_o_Q = s_result_o;
    // instance of 's_flags_o' CodAL signal/wire: (parent port driver(s))
    assign s_flags_o_Q = s_flags_o;
    // instance of 's_ROB_ptr_o' CodAL signal/wire: (parent port driver(s))
    assign s_ROB_ptr_o_Q = s_ROB_ptr_o;
    // instance of 's_done_o' CodAL signal/wire: (parent port driver(s))
    assign s_done_o_Q = s_done_o;
    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd53),
        .DEFAULT_VALUE(53'h00000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_prenorm_fract_B (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_prenorm_fract_B_WE_wire),
        .D(compute_sqrt_div_r_prenorm_fract_B_D_wire),
        .Q(r_prenorm_fract_B_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd53),
        .DEFAULT_VALUE(53'h00000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_divident_A (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_divident_A_WE_wire),
        .D(compute_sqrt_div_r_divident_A_D_wire),
        .Q(r_divident_A_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd54),
        .DEFAULT_VALUE(54'h00000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_divison_B (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_divison_B_WE_wire),
        .D(compute_sqrt_div_r_divison_B_D_wire),
        .Q(r_divison_B_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_sqrt_en (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_sqrt_en_WE_wire),
        .D(compute_sqrt_div_r_sqrt_en_D_wire),
        .Q(r_sqrt_en_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_div_en (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_div_en_WE_wire),
        .D(compute_sqrt_div_r_div_en_D_wire),
        .Q(r_div_en_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_computing (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_computing_WE_wire),
        .D(compute_sqrt_div_r_computing_D_wire),
        .Q(r_computing_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_sticky_rem (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_sticky_rem_WE_wire),
        .D(compute_sqrt_div_r_sticky_rem_D_wire),
        .Q(r_sticky_rem_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd58),
        .DEFAULT_VALUE(58'h000000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_partial_remainder (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_partial_remainder_WE_wire),
        .D(compute_sqrt_div_r_partial_remainder_D_wire),
        .Q(r_partial_remainder_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd57),
        .DEFAULT_VALUE(57'h000000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_quotient (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_quotient_WE_wire),
        .D(compute_sqrt_div_r_quotient_D_wire),
        .Q(r_quotient_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd57),
        .DEFAULT_VALUE(57'h000000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_quotient_32 (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_quotient_32_WE_wire),
        .D(compute_sqrt_div_r_quotient_32_D_wire),
        .Q(r_quotient_32_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd53),
        .DEFAULT_VALUE(53'h00000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_mantissa_upper_part (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_mantissa_upper_part_WE_wire),
        .D(compute_sqrt_div_r_mantissa_upper_part_D_wire),
        .Q(r_mantissa_upper_part_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_cnt_val (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_cnt_val_WE_wire),
        .D(compute_sqrt_div_r_cnt_val_D_wire),
        .Q(r_cnt_val_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd54),
        .DEFAULT_VALUE(54'h00000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_mant_sqrt_norm (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_mant_sqrt_norm_WE_wire),
        .D(compute_sqrt_div_r_mant_sqrt_norm_D_wire),
        .Q(r_mant_sqrt_norm_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd12),
        .DEFAULT_VALUE(12'h000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_exp_A (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_exp_A_WE_wire),
        .D(compute_sqrt_div_r_exp_A_D_wire),
        .Q(r_exp_A_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd12),
        .DEFAULT_VALUE(12'h000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_exp_B (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_exp_B_WE_wire),
        .D(compute_sqrt_div_r_exp_B_D_wire),
        .Q(r_exp_B_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_mantissa_sticky_bit (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_mantissa_sticky_bit_WE_wire),
        .D(compute_sqrt_div_r_mantissa_sticky_bit_D_wire),
        .Q(r_mantissa_sticky_bit_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_nan_A (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_nan_A_WE_wire),
        .D(compute_sqrt_div_r_nan_A_D_wire),
        .Q(r_nan_A_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_nan_B (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_nan_B_WE_wire),
        .D(compute_sqrt_div_r_nan_B_D_wire),
        .Q(r_nan_B_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_inf_A (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_inf_A_WE_wire),
        .D(compute_sqrt_div_r_inf_A_D_wire),
        .Q(r_inf_A_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_inf_B (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_inf_B_WE_wire),
        .D(compute_sqrt_div_r_inf_B_D_wire),
        .Q(r_inf_B_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_zero_A (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_zero_A_WE_wire),
        .D(compute_sqrt_div_r_zero_A_D_wire),
        .Q(r_zero_A_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_zero_B (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_zero_B_WE_wire),
        .D(compute_sqrt_div_r_zero_B_D_wire),
        .Q(r_zero_B_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_sign_bit (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_sign_bit_WE_wire),
        .D(compute_sqrt_div_r_sign_bit_D_wire),
        .Q(r_sign_bit_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_snan (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_snan_WE_wire),
        .D(compute_sqrt_div_r_snan_D_wire),
        .Q(r_snan_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_sign_bit_fin (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_sign_bit_fin_WE_wire),
        .D(compute_sqrt_div_r_sign_bit_fin_D_wire),
        .Q(r_sign_bit_fin_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_remainder_en (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_remainder_en_WE_wire),
        .D(compute_sqrt_div_r_remainder_en_D_wire),
        .Q(r_remainder_en_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_same_number (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_same_number_WE_wire),
        .D(compute_sqrt_div_r_same_number_D_wire),
        .Q(r_same_number_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_mantissa_lower_part (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_mantissa_lower_part_WE_wire),
        .D(compute_sqrt_div_r_mantissa_lower_part_D_wire),
        .Q(r_mantissa_lower_part_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_round_mode (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_round_mode_WE_wire),
        .D(compute_sqrt_div_r_round_mode_D_wire),
        .Q(r_round_mode_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_round_mode_fin (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_round_mode_fin_WE_wire),
        .D(compute_sqrt_div_r_round_mode_fin_D_wire),
        .Q(r_round_mode_fin_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd13),
        .DEFAULT_VALUE(13'h0000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_exp_result_prenorm (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_exp_result_prenorm_WE_wire),
        .D(compute_sqrt_div_r_exp_result_prenorm_D_wire),
        .Q(r_exp_result_prenorm_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_tiny (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_tiny_WE_wire),
        .D(compute_sqrt_div_r_tiny_D_wire),
        .Q(r_tiny_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_sign_res (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_sign_res_WE_wire),
        .D(compute_sqrt_div_r_sign_res_D_wire),
        .Q(r_sign_res_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_invalid (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_invalid_WE_wire),
        .D(compute_sqrt_div_r_invalid_D_wire),
        .Q(r_invalid_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_div_zero (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_div_zero_WE_wire),
        .D(compute_sqrt_div_r_div_zero_D_wire),
        .Q(r_div_zero_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_overflow (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_overflow_WE_wire),
        .D(compute_sqrt_div_r_overflow_D_wire),
        .Q(r_overflow_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd11),
        .DEFAULT_VALUE(11'h000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_exp_norm_res (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_exp_norm_res_WE_wire),
        .D(compute_sqrt_div_r_exp_norm_res_D_wire),
        .Q(r_exp_norm_res_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd57),
        .DEFAULT_VALUE(57'h000000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_remainder_shift (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_remainder_shift_WE_wire),
        .D(compute_sqrt_div_r_remainder_shift_D_wire),
        .Q(r_remainder_shift_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd57),
        .DEFAULT_VALUE(57'h000000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_result_man_shift (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_result_man_shift_WE_wire),
        .D(compute_sqrt_div_r_result_man_shift_D_wire),
        .Q(r_result_man_shift_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd58),
        .DEFAULT_VALUE(58'h000000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_Iteration2_sum (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_Iteration2_sum_WE_wire),
        .D(compute_sqrt_div_r_Iteration2_sum_D_wire),
        .Q(r_Iteration2_sum_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd58),
        .DEFAULT_VALUE(58'h000000000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_Iteration1_sum (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_Iteration1_sum_WE_wire),
        .D(compute_sqrt_div_r_Iteration1_sum_D_wire),
        .Q(r_Iteration1_sum_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ROB_ptr_work (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_ROB_ptr_work_WE_wire),
        .D(compute_sqrt_div_r_ROB_ptr_work_D_wire),
        .Q(r_ROB_ptr_work_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_sqr_div_rob_round (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_sqr_div_rob_round_WE_wire),
        .D(compute_sqrt_div_r_sqr_div_rob_round_D_wire),
        .Q(r_sqr_div_rob_round_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_sqr_div_rob_post_norm (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_sqr_div_rob_post_norm_WE_wire),
        .D(compute_sqrt_div_r_sqr_div_rob_post_norm_D_wire),
        .Q(r_sqr_div_rob_post_norm_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_sqr_div_done_round (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_sqr_div_done_round_WE_wire),
        .D(compute_sqrt_div_r_sqr_div_done_round_D_wire),
        .Q(r_sqr_div_done_round_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_sqr_div_done_post_norm (
        .CLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .CLEAR(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .WE(compute_sqrt_div_r_sqr_div_done_post_norm_WE_wire),
        .D(compute_sqrt_div_r_sqr_div_done_post_norm_D_wire),
        .Q(r_sqr_div_done_post_norm_Q_wire)
    );

    // instance of 's_sqrt_div_ce' CodAL signal/wire: (parent port driver(s))
    assign s_sqrt_div_ce_Q = s_sqrt_div_ce;
    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_fpu_sqrt_div_clk_sqrt_div_t clk_sqrt_div (
        .r_sqr_div_done_post_norm_Q(r_sqr_div_done_post_norm_Q_wire),
        .r_sqr_div_done_round_Q(r_sqr_div_done_round_Q_wire),
        .s_clk_en_i_Q(s_clk_en_i),
        .s_sqr_div_done_comp_Q(s_sqr_div_done_comp),
        .s_start_i_Q(s_start_i),
        .sqrt_div_busy_Q(sqrt_div_busy),
        .s_sqrt_div_ce_D(s_sqrt_div_ce)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_fpu_sqrt_div_compute_sqrt_div_t compute_sqrt_div (
        .r_cnt_val_Q(r_cnt_val_Q_wire),
        .r_computing_Q(r_computing_Q_wire),
        .r_div_en_Q(r_div_en_Q_wire),
        .r_div_zero_Q(r_div_zero_Q_wire),
        .r_divident_A_Q(r_divident_A_Q_wire),
        .r_divison_B_Q(r_divison_B_Q_wire),
        .r_exp_A_Q(r_exp_A_Q_wire),
        .r_exp_B_Q(r_exp_B_Q_wire),
        .r_exp_norm_res_Q(r_exp_norm_res_Q_wire),
        .r_exp_result_prenorm_Q(r_exp_result_prenorm_Q_wire),
        .r_inf_A_Q(r_inf_A_Q_wire),
        .r_inf_B_Q(r_inf_B_Q_wire),
        .r_invalid_Q(r_invalid_Q_wire),
        .r_Iteration1_sum_Q(r_Iteration1_sum_Q_wire),
        .r_Iteration2_sum_Q(r_Iteration2_sum_Q_wire),
        .r_mant_sqrt_norm_Q(r_mant_sqrt_norm_Q_wire),
        .r_mantissa_lower_part_Q(r_mantissa_lower_part_Q_wire),
        .r_mantissa_sticky_bit_Q(r_mantissa_sticky_bit_Q_wire),
        .r_mantissa_upper_part_Q(r_mantissa_upper_part_Q_wire),
        .r_nan_A_Q(r_nan_A_Q_wire),
        .r_nan_B_Q(r_nan_B_Q_wire),
        .r_overflow_Q(r_overflow_Q_wire),
        .r_partial_remainder_Q(r_partial_remainder_Q_wire),
        .r_prenorm_fract_B_Q(r_prenorm_fract_B_Q_wire),
        .r_quotient_32_Q(r_quotient_32_Q_wire),
        .r_quotient_Q(r_quotient_Q_wire),
        .r_remainder_en_Q(r_remainder_en_Q_wire),
        .r_remainder_shift_Q(r_remainder_shift_Q_wire),
        .r_result_man_shift_Q(r_result_man_shift_Q_wire),
        .r_ROB_ptr_work_Q(r_ROB_ptr_work_Q_wire),
        .r_round_mode_fin_Q(r_round_mode_fin_Q_wire),
        .r_round_mode_Q(r_round_mode_Q_wire),
        .r_same_number_Q(r_same_number_Q_wire),
        .r_sign_bit_fin_Q(r_sign_bit_fin_Q_wire),
        .r_sign_bit_Q(r_sign_bit_Q_wire),
        .r_sign_res_Q(r_sign_res_Q_wire),
        .r_snan_Q(r_snan_Q_wire),
        .r_sqr_div_done_post_norm_Q(r_sqr_div_done_post_norm_Q_wire),
        .r_sqr_div_done_round_Q(r_sqr_div_done_round_Q_wire),
        .r_sqr_div_rob_post_norm_Q(r_sqr_div_rob_post_norm_Q_wire),
        .r_sqr_div_rob_round_Q(r_sqr_div_rob_round_Q_wire),
        .r_sqrt_en_Q(r_sqrt_en_Q_wire),
        .r_sticky_rem_Q(r_sticky_rem_Q_wire),
        .r_tiny_Q(r_tiny_Q_wire),
        .r_zero_A_Q(r_zero_A_Q_wire),
        .r_zero_B_Q(r_zero_B_Q_wire),
        .s_done_o_Q(s_done_o),
        .s_op_i_Q(s_op_i),
        .s_properties_i_Q(s_properties_i),
        .s_rm_i_Q(s_rm_i),
        .s_ROB_ptr_i_Q(s_ROB_ptr_i),
        .s_sqr_div_done_comp_Q(s_sqr_div_done_comp),
        .s_srcA_i_Q(s_srcA_i),
        .s_srcB_i_Q(s_srcB_i),
        .s_start_i_Q(s_start_i),
        .sqrt_div_busy_Q(sqrt_div_busy),
        .r_cnt_val_D(compute_sqrt_div_r_cnt_val_D_wire),
        .r_cnt_val_WE(compute_sqrt_div_r_cnt_val_WE_wire),
        .r_computing_D(compute_sqrt_div_r_computing_D_wire),
        .r_computing_WE(compute_sqrt_div_r_computing_WE_wire),
        .r_div_en_D(compute_sqrt_div_r_div_en_D_wire),
        .r_div_en_WE(compute_sqrt_div_r_div_en_WE_wire),
        .r_div_zero_D(compute_sqrt_div_r_div_zero_D_wire),
        .r_div_zero_WE(compute_sqrt_div_r_div_zero_WE_wire),
        .r_divident_A_D(compute_sqrt_div_r_divident_A_D_wire),
        .r_divident_A_WE(compute_sqrt_div_r_divident_A_WE_wire),
        .r_divison_B_D(compute_sqrt_div_r_divison_B_D_wire),
        .r_divison_B_WE(compute_sqrt_div_r_divison_B_WE_wire),
        .r_exp_A_D(compute_sqrt_div_r_exp_A_D_wire),
        .r_exp_A_WE(compute_sqrt_div_r_exp_A_WE_wire),
        .r_exp_B_D(compute_sqrt_div_r_exp_B_D_wire),
        .r_exp_B_WE(compute_sqrt_div_r_exp_B_WE_wire),
        .r_exp_norm_res_D(compute_sqrt_div_r_exp_norm_res_D_wire),
        .r_exp_norm_res_WE(compute_sqrt_div_r_exp_norm_res_WE_wire),
        .r_exp_result_prenorm_D(compute_sqrt_div_r_exp_result_prenorm_D_wire),
        .r_exp_result_prenorm_WE(compute_sqrt_div_r_exp_result_prenorm_WE_wire),
        .r_inf_A_D(compute_sqrt_div_r_inf_A_D_wire),
        .r_inf_A_WE(compute_sqrt_div_r_inf_A_WE_wire),
        .r_inf_B_D(compute_sqrt_div_r_inf_B_D_wire),
        .r_inf_B_WE(compute_sqrt_div_r_inf_B_WE_wire),
        .r_invalid_D(compute_sqrt_div_r_invalid_D_wire),
        .r_invalid_WE(compute_sqrt_div_r_invalid_WE_wire),
        .r_Iteration1_sum_D(compute_sqrt_div_r_Iteration1_sum_D_wire),
        .r_Iteration1_sum_WE(compute_sqrt_div_r_Iteration1_sum_WE_wire),
        .r_Iteration2_sum_D(compute_sqrt_div_r_Iteration2_sum_D_wire),
        .r_Iteration2_sum_WE(compute_sqrt_div_r_Iteration2_sum_WE_wire),
        .r_mant_sqrt_norm_D(compute_sqrt_div_r_mant_sqrt_norm_D_wire),
        .r_mant_sqrt_norm_WE(compute_sqrt_div_r_mant_sqrt_norm_WE_wire),
        .r_mantissa_lower_part_D(compute_sqrt_div_r_mantissa_lower_part_D_wire),
        .r_mantissa_lower_part_WE(compute_sqrt_div_r_mantissa_lower_part_WE_wire),
        .r_mantissa_sticky_bit_D(compute_sqrt_div_r_mantissa_sticky_bit_D_wire),
        .r_mantissa_sticky_bit_WE(compute_sqrt_div_r_mantissa_sticky_bit_WE_wire),
        .r_mantissa_upper_part_D(compute_sqrt_div_r_mantissa_upper_part_D_wire),
        .r_mantissa_upper_part_WE(compute_sqrt_div_r_mantissa_upper_part_WE_wire),
        .r_nan_A_D(compute_sqrt_div_r_nan_A_D_wire),
        .r_nan_A_WE(compute_sqrt_div_r_nan_A_WE_wire),
        .r_nan_B_D(compute_sqrt_div_r_nan_B_D_wire),
        .r_nan_B_WE(compute_sqrt_div_r_nan_B_WE_wire),
        .r_overflow_D(compute_sqrt_div_r_overflow_D_wire),
        .r_overflow_WE(compute_sqrt_div_r_overflow_WE_wire),
        .r_partial_remainder_D(compute_sqrt_div_r_partial_remainder_D_wire),
        .r_partial_remainder_WE(compute_sqrt_div_r_partial_remainder_WE_wire),
        .r_prenorm_fract_B_D(compute_sqrt_div_r_prenorm_fract_B_D_wire),
        .r_prenorm_fract_B_WE(compute_sqrt_div_r_prenorm_fract_B_WE_wire),
        .r_quotient_32_D(compute_sqrt_div_r_quotient_32_D_wire),
        .r_quotient_32_WE(compute_sqrt_div_r_quotient_32_WE_wire),
        .r_quotient_D(compute_sqrt_div_r_quotient_D_wire),
        .r_quotient_WE(compute_sqrt_div_r_quotient_WE_wire),
        .r_remainder_en_D(compute_sqrt_div_r_remainder_en_D_wire),
        .r_remainder_en_WE(compute_sqrt_div_r_remainder_en_WE_wire),
        .r_remainder_shift_D(compute_sqrt_div_r_remainder_shift_D_wire),
        .r_remainder_shift_WE(compute_sqrt_div_r_remainder_shift_WE_wire),
        .r_result_man_shift_D(compute_sqrt_div_r_result_man_shift_D_wire),
        .r_result_man_shift_WE(compute_sqrt_div_r_result_man_shift_WE_wire),
        .r_ROB_ptr_work_D(compute_sqrt_div_r_ROB_ptr_work_D_wire),
        .r_ROB_ptr_work_WE(compute_sqrt_div_r_ROB_ptr_work_WE_wire),
        .r_round_mode_D(compute_sqrt_div_r_round_mode_D_wire),
        .r_round_mode_fin_D(compute_sqrt_div_r_round_mode_fin_D_wire),
        .r_round_mode_fin_WE(compute_sqrt_div_r_round_mode_fin_WE_wire),
        .r_round_mode_WE(compute_sqrt_div_r_round_mode_WE_wire),
        .r_same_number_D(compute_sqrt_div_r_same_number_D_wire),
        .r_same_number_WE(compute_sqrt_div_r_same_number_WE_wire),
        .r_sign_bit_D(compute_sqrt_div_r_sign_bit_D_wire),
        .r_sign_bit_fin_D(compute_sqrt_div_r_sign_bit_fin_D_wire),
        .r_sign_bit_fin_WE(compute_sqrt_div_r_sign_bit_fin_WE_wire),
        .r_sign_bit_WE(compute_sqrt_div_r_sign_bit_WE_wire),
        .r_sign_res_D(compute_sqrt_div_r_sign_res_D_wire),
        .r_sign_res_WE(compute_sqrt_div_r_sign_res_WE_wire),
        .r_snan_D(compute_sqrt_div_r_snan_D_wire),
        .r_snan_WE(compute_sqrt_div_r_snan_WE_wire),
        .r_sqr_div_done_post_norm_D(compute_sqrt_div_r_sqr_div_done_post_norm_D_wire),
        .r_sqr_div_done_post_norm_WE(compute_sqrt_div_r_sqr_div_done_post_norm_WE_wire),
        .r_sqr_div_done_round_D(compute_sqrt_div_r_sqr_div_done_round_D_wire),
        .r_sqr_div_done_round_WE(compute_sqrt_div_r_sqr_div_done_round_WE_wire),
        .r_sqr_div_rob_post_norm_D(compute_sqrt_div_r_sqr_div_rob_post_norm_D_wire),
        .r_sqr_div_rob_post_norm_WE(compute_sqrt_div_r_sqr_div_rob_post_norm_WE_wire),
        .r_sqr_div_rob_round_D(compute_sqrt_div_r_sqr_div_rob_round_D_wire),
        .r_sqr_div_rob_round_WE(compute_sqrt_div_r_sqr_div_rob_round_WE_wire),
        .r_sqrt_en_D(compute_sqrt_div_r_sqrt_en_D_wire),
        .r_sqrt_en_WE(compute_sqrt_div_r_sqrt_en_WE_wire),
        .r_sticky_rem_D(compute_sqrt_div_r_sticky_rem_D_wire),
        .r_sticky_rem_WE(compute_sqrt_div_r_sticky_rem_WE_wire),
        .r_tiny_D(compute_sqrt_div_r_tiny_D_wire),
        .r_tiny_WE(compute_sqrt_div_r_tiny_WE_wire),
        .r_zero_A_D(compute_sqrt_div_r_zero_A_D_wire),
        .r_zero_A_WE(compute_sqrt_div_r_zero_A_WE_wire),
        .r_zero_B_D(compute_sqrt_div_r_zero_B_D_wire),
        .r_zero_B_WE(compute_sqrt_div_r_zero_B_WE_wire),
        .s_busy_o_D(s_busy_o),
        .s_done_o_D(s_done_o),
        .s_flags_o_D(s_flags_o),
        .s_ready_o_D(s_ready_o),
        .s_result_o_D(s_result_o),
        .s_ROB_ptr_o_D(s_ROB_ptr_o),
        .s_sqr_div_done_comp_D(s_sqr_div_done_comp),
        .sqrt_div_busy_D(sqrt_div_busy)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_fpu_sqrt_div_control_sqrt_div_t control_sqrt_div (
        .s_flush_i_Q(s_flush_i),
        .pipe_sqrt_div_SQRT_DIV_CLEAR_D(pipe_sqrt_div_SQRT_DIV_CLEAR_D)
    );

endmodule: codix_berkelium_ca_core_execute_stage_fpu_sqrt_div_t
