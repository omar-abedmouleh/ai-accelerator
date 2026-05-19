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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_fpu_compute_out_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_fpu_fpu_compute_out_t(
    input  logic add_sub_ready_Q,
    input  logic add_sub_s_ack_i_Q,
    input  logic add_sub_s_done_o_Q,
    input  logic [4:0] add_sub_s_flags_o_Q,
    input  logic add_sub_s_ready_o_Q,
    input  logic [31:0] add_sub_s_result_o_Q,
    input  logic [4:0] add_sub_s_ROB_ptr_o_Q,
    input  logic add_sub_s_start_i_Q,
    input  logic classify_s_done_o_Q,
    input  logic [31:0] classify_s_result_o_Q,
    input  logic [4:0] classify_s_ROB_ptr_o_Q,
    input  logic compare_s_done_o_Q,
    input  logic [4:0] compare_s_flags_o_Q,
    input  logic [31:0] compare_s_result_o_Q,
    input  logic [4:0] compare_s_ROB_ptr_o_Q,
    input  logic f2i_ready_Q,
    input  logic float2int_s_ack_i_Q,
    input  logic float2int_s_done_o_Q,
    input  logic [4:0] float2int_s_flags_o_Q,
    input  logic [5:0] float2int_s_op_i_Q,
    input  logic [2:0] float2int_s_properties_i_Q,
    input  logic float2int_s_ready_o_Q,
    input  logic [31:0] float2int_s_result_o_Q,
    input  logic [2:0] float2int_s_rm_i_Q,
    input  logic [4:0] float2int_s_ROB_ptr_i_Q,
    input  logic [4:0] float2int_s_ROB_ptr_o_Q,
    input  logic [31:0] float2int_s_srcA_i_Q,
    input  logic float2int_s_start_i_Q,
    input  logic fmul_s_done_o_Q,
    input  logic [4:0] fmul_s_flags_o_Q,
    input  logic [57:0] fmul_s_mul_partial_result_Q,
    input  logic [31:0] fmul_s_result_o_Q,
    input  logic [4:0] fmul_s_ROB_ptr_o_Q,
    input  logic fused_s_done_o_Q,
    input  logic [4:0] fused_s_flags_o_Q,
    input  logic [31:0] fused_s_result_o_Q,
    input  logic [4:0] fused_s_ROB_ptr_o_Q,
    input  logic i2f_ready_Q,
    input  logic int2float_s_ack_i_Q,
    input  logic int2float_s_done_o_Q,
    input  logic [4:0] int2float_s_flags_o_Q,
    input  logic int2float_s_ready_o_Q,
    input  logic [31:0] int2float_s_result_o_Q,
    input  logic [4:0] int2float_s_ROB_ptr_o_Q,
    input  logic int2float_s_start_i_Q,
    input  logic move_s_done_o_Q,
    input  logic [31:0] move_s_result_o_Q,
    input  logic [4:0] move_s_ROB_ptr_o_Q,
    input  logic [8:0] parsing_inputs_s_add_sub_properties_o_Q,
    input  logic [4:0] parsing_inputs_s_classify_properties_o_Q,
    input  logic [4:0] parsing_inputs_s_cmp_properties_o_Q,
    input  logic [2:0] parsing_inputs_s_f2i_properties_o_Q,
    input  logic [8:0] parsing_inputs_s_fused_properties_o_Q,
    input  logic [7:0] parsing_inputs_s_mul_properties_o_Q,
    input  logic [9:0] parsing_inputs_s_sqrt_div_properties_o_Q,
    input  logic [4:0] r_cnt_ops_inside_Q,
    input  logic r_exc_en_Q,
    input  logic r_exc_stall_Q,
    input  logic [5:0] r_fpu_dst_addr_Q,
    input  logic [5:0] r_fpu_op_Q,
    input  logic [2:0] r_fpu_rm_Q,
    input  logic [31:0] r_fpu_ROB_done_Q,
    input  logic [4:0] r_fpu_ROB_ptr_out_Q,
    input  logic [4:0] r_fpu_ROB_ptr_Q,
    input  logic [31:0] r_fpu_src_A_Q,
    input  logic [31:0] r_fpu_src_B_Q,
    input  logic [31:0] r_fpu_src_C_Q,
    input  logic r_is_fpu_op_Q,
    input  logic r_record_x_addr10_Q,
    input  logic r_record_x_addr11_Q,
    input  logic r_record_x_addr12_Q,
    input  logic r_record_x_addr13_Q,
    input  logic r_record_x_addr14_Q,
    input  logic r_record_x_addr15_Q,
    input  logic r_record_x_addr16_Q,
    input  logic r_record_x_addr17_Q,
    input  logic r_record_x_addr18_Q,
    input  logic r_record_x_addr19_Q,
    input  logic r_record_x_addr1_Q,
    input  logic r_record_x_addr20_Q,
    input  logic r_record_x_addr21_Q,
    input  logic r_record_x_addr22_Q,
    input  logic r_record_x_addr23_Q,
    input  logic r_record_x_addr24_Q,
    input  logic r_record_x_addr25_Q,
    input  logic r_record_x_addr26_Q,
    input  logic r_record_x_addr27_Q,
    input  logic r_record_x_addr28_Q,
    input  logic r_record_x_addr29_Q,
    input  logic r_record_x_addr2_Q,
    input  logic r_record_x_addr30_Q,
    input  logic r_record_x_addr31_Q,
    input  logic r_record_x_addr3_Q,
    input  logic r_record_x_addr4_Q,
    input  logic r_record_x_addr5_Q,
    input  logic r_record_x_addr6_Q,
    input  logic r_record_x_addr7_Q,
    input  logic r_record_x_addr8_Q,
    input  logic r_record_x_addr9_Q,
    input  logic [75:0] r_rob_part1_item0_Q,
    input  logic [75:0] r_rob_part1_item10_Q,
    input  logic [75:0] r_rob_part1_item11_Q,
    input  logic [75:0] r_rob_part1_item12_Q,
    input  logic [75:0] r_rob_part1_item13_Q,
    input  logic [75:0] r_rob_part1_item14_Q,
    input  logic [75:0] r_rob_part1_item15_Q,
    input  logic [75:0] r_rob_part1_item16_Q,
    input  logic [75:0] r_rob_part1_item17_Q,
    input  logic [75:0] r_rob_part1_item18_Q,
    input  logic [75:0] r_rob_part1_item19_Q,
    input  logic [75:0] r_rob_part1_item1_Q,
    input  logic [75:0] r_rob_part1_item20_Q,
    input  logic [75:0] r_rob_part1_item21_Q,
    input  logic [75:0] r_rob_part1_item22_Q,
    input  logic [75:0] r_rob_part1_item23_Q,
    input  logic [75:0] r_rob_part1_item24_Q,
    input  logic [75:0] r_rob_part1_item25_Q,
    input  logic [75:0] r_rob_part1_item26_Q,
    input  logic [75:0] r_rob_part1_item27_Q,
    input  logic [75:0] r_rob_part1_item28_Q,
    input  logic [75:0] r_rob_part1_item29_Q,
    input  logic [75:0] r_rob_part1_item2_Q,
    input  logic [75:0] r_rob_part1_item30_Q,
    input  logic [75:0] r_rob_part1_item31_Q,
    input  logic [75:0] r_rob_part1_item3_Q,
    input  logic [75:0] r_rob_part1_item4_Q,
    input  logic [75:0] r_rob_part1_item5_Q,
    input  logic [75:0] r_rob_part1_item6_Q,
    input  logic [75:0] r_rob_part1_item7_Q,
    input  logic [75:0] r_rob_part1_item8_Q,
    input  logic [75:0] r_rob_part1_item9_Q,
    input  logic [37:0] r_rob_part2_item0_Q,
    input  logic [37:0] r_rob_part2_item10_Q,
    input  logic [37:0] r_rob_part2_item11_Q,
    input  logic [37:0] r_rob_part2_item12_Q,
    input  logic [37:0] r_rob_part2_item13_Q,
    input  logic [37:0] r_rob_part2_item14_Q,
    input  logic [37:0] r_rob_part2_item15_Q,
    input  logic [37:0] r_rob_part2_item16_Q,
    input  logic [37:0] r_rob_part2_item17_Q,
    input  logic [37:0] r_rob_part2_item18_Q,
    input  logic [37:0] r_rob_part2_item19_Q,
    input  logic [37:0] r_rob_part2_item1_Q,
    input  logic [37:0] r_rob_part2_item20_Q,
    input  logic [37:0] r_rob_part2_item21_Q,
    input  logic [37:0] r_rob_part2_item22_Q,
    input  logic [37:0] r_rob_part2_item23_Q,
    input  logic [37:0] r_rob_part2_item24_Q,
    input  logic [37:0] r_rob_part2_item25_Q,
    input  logic [37:0] r_rob_part2_item26_Q,
    input  logic [37:0] r_rob_part2_item27_Q,
    input  logic [37:0] r_rob_part2_item28_Q,
    input  logic [37:0] r_rob_part2_item29_Q,
    input  logic [37:0] r_rob_part2_item2_Q,
    input  logic [37:0] r_rob_part2_item30_Q,
    input  logic [37:0] r_rob_part2_item31_Q,
    input  logic [37:0] r_rob_part2_item3_Q,
    input  logic [37:0] r_rob_part2_item4_Q,
    input  logic [37:0] r_rob_part2_item5_Q,
    input  logic [37:0] r_rob_part2_item6_Q,
    input  logic [37:0] r_rob_part2_item7_Q,
    input  logic [37:0] r_rob_part2_item8_Q,
    input  logic [37:0] r_rob_part2_item9_Q,
    input  logic r_stall_fwd_Q,
    input  logic r_start_add_sub_Q,
    input  logic r_start_classify_Q,
    input  logic r_start_cmp_Q,
    input  logic r_start_f2i_Q,
    input  logic r_start_fused_Q,
    input  logic r_start_i2f_Q,
    input  logic r_start_max_min_Q,
    input  logic r_start_move_Q,
    input  logic r_start_mul_Q,
    input  logic r_start_sgnj_Q,
    input  logic r_start_sqrt_div_Q,
    input  logic r_unit_stall_Q,
    input  logic ROB_out_item_done_Q,
    input  logic s_ack_i_Q,
    input  logic s_add_sub_rob_stall_Q,
    input  logic s_float2int_rob_stall_Q,
    input  logic s_flush_i_Q,
    input  logic s_full_port_Q,
    input  logic s_int2float_rob_stall_Q,
    input  logic s_ready_Q,
    input  logic s_start_operation_Q,
    input  logic sgnj_s_done_o_Q,
    input  logic [31:0] sgnj_s_result_o_Q,
    input  logic [4:0] sgnj_s_ROB_ptr_o_Q,
    input  logic sqrt_div_s_busy_o_Q,
    input  logic sqrt_div_s_done_o_Q,
    input  logic [4:0] sqrt_div_s_flags_o_Q,
    input  logic sqrt_div_s_ready_o_Q,
    input  logic [31:0] sqrt_div_s_result_o_Q,
    input  logic [4:0] sqrt_div_s_ROB_ptr_o_Q,
    input  logic sqrt_div_s_start_i_Q,
    output logic add_sub_ready_D,
    output logic add_sub_s_ack_i_D,
    output logic add_sub_s_flush_i_D,
    output logic [5:0] add_sub_s_op_i_D,
    output logic [8:0] add_sub_s_properties_i_D,
    output logic [2:0] add_sub_s_rm_i_D,
    output logic [4:0] add_sub_s_ROB_ptr_i_D,
    output logic [31:0] add_sub_s_srcA_i_D,
    output logic [31:0] add_sub_s_srcB_i_D,
    output logic add_sub_s_start_i_D,
    output logic [4:0] classify_s_properties_i_D,
    output logic [4:0] classify_s_ROB_ptr_i_D,
    output logic [31:0] classify_s_srcA_i_D,
    output logic classify_s_start_i_D,
    output logic [5:0] compare_s_op_i_D,
    output logic [4:0] compare_s_properties_i_D,
    output logic [4:0] compare_s_ROB_ptr_i_D,
    output logic [31:0] compare_s_srcA_i_D,
    output logic [31:0] compare_s_srcB_i_D,
    output logic compare_s_start_i_D,
    output logic f2i_ready_D,
    output logic float2int_s_ack_i_D,
    output logic float2int_s_flush_i_D,
    output logic [5:0] float2int_s_op_i_D,
    output logic [2:0] float2int_s_properties_i_D,
    output logic [2:0] float2int_s_rm_i_D,
    output logic [4:0] float2int_s_ROB_ptr_i_D,
    output logic [31:0] float2int_s_srcA_i_D,
    output logic float2int_s_start_i_D,
    output logic fmul_s_flush_i_D,
    output logic [5:0] fmul_s_op_i_D,
    output logic [7:0] fmul_s_properties_i_D,
    output logic [2:0] fmul_s_rm_i_D,
    output logic [4:0] fmul_s_ROB_ptr_i_D,
    output logic [31:0] fmul_s_srcA_i_D,
    output logic [31:0] fmul_s_srcB_i_D,
    output logic fmul_s_start_i_D,
    output logic fused_s_flush_i_D,
    output logic [57:0] fused_s_mul_partial_result_i_D,
    output logic [5:0] fused_s_op_i_D,
    output logic [8:0] fused_s_properties_i_D,
    output logic [2:0] fused_s_rm_i_D,
    output logic [4:0] fused_s_ROB_ptr_i_D,
    output logic [31:0] fused_s_srcA_i_D,
    output logic [31:0] fused_s_srcB_i_D,
    output logic [31:0] fused_s_srcC_i_D,
    output logic fused_s_start_i_D,
    output logic i2f_ready_D,
    output logic int2float_s_ack_i_D,
    output logic int2float_s_flush_i_D,
    output logic [5:0] int2float_s_op_i_D,
    output logic [2:0] int2float_s_rm_i_D,
    output logic [4:0] int2float_s_ROB_ptr_i_D,
    output logic [31:0] int2float_s_srcA_i_D,
    output logic int2float_s_start_i_D,
    output logic [4:0] move_s_ROB_ptr_i_D,
    output logic [31:0] move_s_srcA_i_D,
    output logic move_s_start_i_D,
    output logic [31:0] parsing_inputs_s_srcA_i_D,
    output logic [31:0] parsing_inputs_s_srcB_i_D,
    output logic [31:0] parsing_inputs_s_srcC_i_D,
    output logic [4:0] r_cnt_ops_inside_D,
    output logic r_cnt_ops_inside_WE,
    output logic r_exc_stall_D,
    output logic r_exc_stall_WE,
    output logic [4:0] r_fpu_ROB_ptr_out_D,
    output logic r_fpu_ROB_ptr_out_WE,
    output logic r_full_ports_D,
    output logic r_full_ports_WE,
    output logic ROB_out_item_done_D,
    output logic s_add_sub_done_D,
    output logic [4:0] s_add_sub_ROB_ptr_D,
    output logic s_busy_o_D,
    output logic s_classify_done_D,
    output logic s_cmp_done_D,
    output logic [31:0] s_exc_instr_addr_o_D,
    output logic [31:0] s_exc_tval_o_D,
    output logic [4:0] s_exc_type_o_D,
    output logic s_exc_valid_o_D,
    output logic [4:0] s_f2i_ROB_ptr_D,
    output logic [4:0] s_flags_o_D,
    output logic s_float2int_done_D,
    output logic [4:0] s_fpu_addsub_flags_D,
    output logic [31:0] s_fpu_addsub_result_D,
    output logic [4:0] s_fpu_classify_ptr_D,
    output logic [31:0] s_fpu_classify_result_D,
    output logic [4:0] s_fpu_cmp_flags_D,
    output logic [31:0] s_fpu_cmp_result_D,
    output logic [4:0] s_fpu_cmp_ROB_ptr_D,
    output logic [4:0] s_fpu_f2i_flags_D,
    output logic [31:0] s_fpu_f2i_result_D,
    output logic [4:0] s_fpu_fused_flags_D,
    output logic [31:0] s_fpu_fused_result_D,
    output logic [4:0] s_fpu_i2f_flags_D,
    output logic [31:0] s_fpu_i2f_result_D,
    output logic [4:0] s_fpu_move_ptr_D,
    output logic [31:0] s_fpu_move_result_D,
    output logic [4:0] s_fpu_mul_flags_D,
    output logic [31:0] s_fpu_mul_result_D,
    output logic [4:0] s_fpu_sgnj_ptr_D,
    output logic [31:0] s_fpu_sgnj_result_D,
    output logic [4:0] s_fpu_sqrt_div_flags_D,
    output logic [31:0] s_fpu_sqrt_div_result_D,
    output logic s_full_port_D,
    output logic s_fused_done_D,
    output logic [4:0] s_fused_ROB_ptr_D,
    output logic [4:0] s_i2f_ROB_ptr_D,
    output logic s_int2float_done_D,
    output logic s_move_done_D,
    output logic s_mul_done_D,
    output logic [4:0] s_mul_ROB_ptr_D,
    output logic [5:0] s_rd_addr_o_D,
    output logic [31:0] s_rd_data_o_D,
    output logic [31:0] s_rdx_valid_o_D,
    output logic s_ready_D,
    output logic s_ready_o_D,
    output logic s_ROB_full_D,
    output logic s_sgnj_done_D,
    output logic s_sqr_div_done_D,
    output logic [4:0] s_sqrt_div_ROB_ptr_D,
    output logic s_start_operation_D,
    output logic s_valid_o_D,
    output logic [5:0] s_wb_commit_addr_D,
    output logic [5:0] sgnj_s_op_i_D,
    output logic [4:0] sgnj_s_ROB_ptr_i_D,
    output logic [31:0] sgnj_s_srcA_i_D,
    output logic [31:0] sgnj_s_srcB_i_D,
    output logic sgnj_s_start_i_D,
    output logic sqrt_div_busy_D,
    output logic sqrt_div_ready_D,
    output logic sqrt_div_s_flush_i_D,
    output logic [5:0] sqrt_div_s_op_i_D,
    output logic [9:0] sqrt_div_s_properties_i_D,
    output logic [2:0] sqrt_div_s_rm_i_D,
    output logic [4:0] sqrt_div_s_ROB_ptr_i_D,
    output logic [31:0] sqrt_div_s_srcA_i_D,
    output logic [31:0] sqrt_div_s_srcB_i_D,
    output logic sqrt_div_s_start_i_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic [75:0] ROB_out_item_1_B0;
    // signal/wire
    logic [37:0] ROB_out_item_2_B0;
    // signal/wire
    logic [41:0] addsub_output_payloads_B0;
    // signal/wire
    logic [4:0] cnt_ops_inside_B0;
    // signal/wire
    logic [4:0] codasip_tmp_var_0;
    // signal/wire
    logic codasip_tmp_var_1;
    // signal/wire
    logic codasip_tmp_var_2;
    // signal/wire
    logic f2i_fmt_B0;
    // signal/wire
    logic [49:0] f2i_input_payloads_B0;
    // signal/wire
    logic [41:0] f2i_output_payloads_B0;
    // signal/wire
    logic [41:0] i2f_output_payloads_B0;
    // signal/wire
    logic [31:0] rdx_internal_pipe_B0B34;
    // signal/wire
    logic [31:0] rdx_valid_regs_B0B34;
    // signal/wire
    logic rob_full_B0;

    // data-path code:
    assign f2i_fmt_B0 = 1'b0;
    assign f2i_input_payloads_B0 = {float2int_s_srcA_i_Q, float2int_s_op_i_Q, float2int_s_rm_i_Q, f2i_fmt_B0, float2int_s_ROB_ptr_i_Q, float2int_s_properties_i_Q};
    assign addsub_output_payloads_B0 = {add_sub_s_result_o_Q, add_sub_s_flags_o_Q, add_sub_s_ROB_ptr_o_Q};
    assign f2i_output_payloads_B0 = {float2int_s_result_o_Q, float2int_s_flags_o_Q, float2int_s_ROB_ptr_o_Q};
    assign i2f_output_payloads_B0 = {int2float_s_result_o_Q, int2float_s_flags_o_Q, int2float_s_ROB_ptr_o_Q};
    assign codasip_tmp_var_0 = r_fpu_ROB_ptr_out_Q;
    always_comb begin
        unique case ( codasip_tmp_var_0 )
            5'h00: ROB_out_item_2_B0 = r_rob_part2_item0_Q;
            5'h01: ROB_out_item_2_B0 = r_rob_part2_item1_Q;
            5'h02: ROB_out_item_2_B0 = r_rob_part2_item2_Q;
            5'h03: ROB_out_item_2_B0 = r_rob_part2_item3_Q;
            5'h04: ROB_out_item_2_B0 = r_rob_part2_item4_Q;
            5'h05: ROB_out_item_2_B0 = r_rob_part2_item5_Q;
            5'h06: ROB_out_item_2_B0 = r_rob_part2_item6_Q;
            5'h07: ROB_out_item_2_B0 = r_rob_part2_item7_Q;
            5'h08: ROB_out_item_2_B0 = r_rob_part2_item8_Q;
            5'h09: ROB_out_item_2_B0 = r_rob_part2_item9_Q;
            5'h0a: ROB_out_item_2_B0 = r_rob_part2_item10_Q;
            5'h0b: ROB_out_item_2_B0 = r_rob_part2_item11_Q;
            5'h0c: ROB_out_item_2_B0 = r_rob_part2_item12_Q;
            5'h0d: ROB_out_item_2_B0 = r_rob_part2_item13_Q;
            5'h0e: ROB_out_item_2_B0 = r_rob_part2_item14_Q;
            5'h0f: ROB_out_item_2_B0 = r_rob_part2_item15_Q;
            5'h10: ROB_out_item_2_B0 = r_rob_part2_item16_Q;
            5'h11: ROB_out_item_2_B0 = r_rob_part2_item17_Q;
            5'h12: ROB_out_item_2_B0 = r_rob_part2_item18_Q;
            5'h13: ROB_out_item_2_B0 = r_rob_part2_item19_Q;
            5'h14: ROB_out_item_2_B0 = r_rob_part2_item20_Q;
            5'h15: ROB_out_item_2_B0 = r_rob_part2_item21_Q;
            5'h16: ROB_out_item_2_B0 = r_rob_part2_item22_Q;
            5'h17: ROB_out_item_2_B0 = r_rob_part2_item23_Q;
            5'h18: ROB_out_item_2_B0 = r_rob_part2_item24_Q;
            5'h19: ROB_out_item_2_B0 = r_rob_part2_item25_Q;
            5'h1a: ROB_out_item_2_B0 = r_rob_part2_item26_Q;
            5'h1b: ROB_out_item_2_B0 = r_rob_part2_item27_Q;
            5'h1c: ROB_out_item_2_B0 = r_rob_part2_item28_Q;
            5'h1d: ROB_out_item_2_B0 = r_rob_part2_item29_Q;
            5'h1e: ROB_out_item_2_B0 = r_rob_part2_item30_Q;
            5'h1f: ROB_out_item_2_B0 = r_rob_part2_item31_Q;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: ROB_out_item_2_B0 = 38'hx;
            // pragma translate_on
        endcase
    end
    always_comb begin
        unique case ( codasip_tmp_var_0 )
            5'h00: ROB_out_item_1_B0 = r_rob_part1_item0_Q;
            5'h01: ROB_out_item_1_B0 = r_rob_part1_item1_Q;
            5'h02: ROB_out_item_1_B0 = r_rob_part1_item2_Q;
            5'h03: ROB_out_item_1_B0 = r_rob_part1_item3_Q;
            5'h04: ROB_out_item_1_B0 = r_rob_part1_item4_Q;
            5'h05: ROB_out_item_1_B0 = r_rob_part1_item5_Q;
            5'h06: ROB_out_item_1_B0 = r_rob_part1_item6_Q;
            5'h07: ROB_out_item_1_B0 = r_rob_part1_item7_Q;
            5'h08: ROB_out_item_1_B0 = r_rob_part1_item8_Q;
            5'h09: ROB_out_item_1_B0 = r_rob_part1_item9_Q;
            5'h0a: ROB_out_item_1_B0 = r_rob_part1_item10_Q;
            5'h0b: ROB_out_item_1_B0 = r_rob_part1_item11_Q;
            5'h0c: ROB_out_item_1_B0 = r_rob_part1_item12_Q;
            5'h0d: ROB_out_item_1_B0 = r_rob_part1_item13_Q;
            5'h0e: ROB_out_item_1_B0 = r_rob_part1_item14_Q;
            5'h0f: ROB_out_item_1_B0 = r_rob_part1_item15_Q;
            5'h10: ROB_out_item_1_B0 = r_rob_part1_item16_Q;
            5'h11: ROB_out_item_1_B0 = r_rob_part1_item17_Q;
            5'h12: ROB_out_item_1_B0 = r_rob_part1_item18_Q;
            5'h13: ROB_out_item_1_B0 = r_rob_part1_item19_Q;
            5'h14: ROB_out_item_1_B0 = r_rob_part1_item20_Q;
            5'h15: ROB_out_item_1_B0 = r_rob_part1_item21_Q;
            5'h16: ROB_out_item_1_B0 = r_rob_part1_item22_Q;
            5'h17: ROB_out_item_1_B0 = r_rob_part1_item23_Q;
            5'h18: ROB_out_item_1_B0 = r_rob_part1_item24_Q;
            5'h19: ROB_out_item_1_B0 = r_rob_part1_item25_Q;
            5'h1a: ROB_out_item_1_B0 = r_rob_part1_item26_Q;
            5'h1b: ROB_out_item_1_B0 = r_rob_part1_item27_Q;
            5'h1c: ROB_out_item_1_B0 = r_rob_part1_item28_Q;
            5'h1d: ROB_out_item_1_B0 = r_rob_part1_item29_Q;
            5'h1e: ROB_out_item_1_B0 = r_rob_part1_item30_Q;
            5'h1f: ROB_out_item_1_B0 = r_rob_part1_item31_Q;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: ROB_out_item_1_B0 = 76'hx;
            // pragma translate_on
        endcase
    end
    assign codasip_tmp_var_1 = ROB_out_item_done_Q;
    assign cnt_ops_inside_B0 = ((r_cnt_ops_inside_Q - 5'(unsigned'(1'((s_ack_i_Q & ROB_out_item_done_Q))))) + 5'(s_start_operation_Q));
    assign rob_full_B0 = (cnt_ops_inside_B0 >= 5'h1f);
    assign rdx_valid_regs_B0B34 = {r_record_x_addr31_Q, r_record_x_addr30_Q, r_record_x_addr29_Q, r_record_x_addr28_Q, r_record_x_addr27_Q, r_record_x_addr26_Q, r_record_x_addr25_Q, r_record_x_addr24_Q, r_record_x_addr23_Q, r_record_x_addr22_Q, r_record_x_addr21_Q, r_record_x_addr20_Q, r_record_x_addr19_Q, r_record_x_addr18_Q, r_record_x_addr17_Q, r_record_x_addr16_Q, r_record_x_addr15_Q, r_record_x_addr14_Q, r_record_x_addr13_Q, r_record_x_addr12_Q, r_record_x_addr11_Q, r_record_x_addr10_Q, r_record_x_addr9_Q, r_record_x_addr8_Q, r_record_x_addr7_Q, r_record_x_addr6_Q, r_record_x_addr5_Q, r_record_x_addr4_Q, r_record_x_addr3_Q, r_record_x_addr2_Q, r_record_x_addr1_Q, 1'b0};
    assign rdx_internal_pipe_B0B34 = (32'(unsigned'(1'(((r_is_fpu_op_Q & (~r_fpu_dst_addr_Q[5])) & (r_fpu_dst_addr_Q[4:0] != 5'h00))))) << r_fpu_dst_addr_Q[4:0]);
    assign codasip_tmp_var_2 = (s_ack_i_Q && ROB_out_item_done_Q);
    assign add_sub_ready_D = add_sub_s_ready_o_Q;
    assign add_sub_s_ack_i_D = (~s_add_sub_rob_stall_Q);
    assign add_sub_s_flush_i_D = s_flush_i_Q;
    assign add_sub_s_op_i_D = r_fpu_op_Q;
    assign add_sub_s_properties_i_D = parsing_inputs_s_add_sub_properties_o_Q;
    assign add_sub_s_rm_i_D = r_fpu_rm_Q;
    assign add_sub_s_ROB_ptr_i_D = r_fpu_ROB_ptr_Q;
    assign add_sub_s_srcA_i_D = r_fpu_src_A_Q;
    assign add_sub_s_srcB_i_D = r_fpu_src_B_Q;
    assign add_sub_s_start_i_D = (r_start_add_sub_Q & (!r_exc_en_Q));
    assign classify_s_properties_i_D = parsing_inputs_s_classify_properties_o_Q;
    assign classify_s_ROB_ptr_i_D = r_fpu_ROB_ptr_Q;
    assign classify_s_srcA_i_D = r_fpu_src_A_Q;
    assign classify_s_start_i_D = r_start_classify_Q;
    assign compare_s_op_i_D = r_fpu_op_Q;
    assign compare_s_properties_i_D = parsing_inputs_s_cmp_properties_o_Q;
    assign compare_s_ROB_ptr_i_D = r_fpu_ROB_ptr_Q;
    assign compare_s_srcA_i_D = r_fpu_src_A_Q;
    assign compare_s_srcB_i_D = r_fpu_src_B_Q;
    assign compare_s_start_i_D = (r_start_max_min_Q | r_start_cmp_Q);
    assign f2i_ready_D = float2int_s_ready_o_Q;
    assign float2int_s_ack_i_D = (~s_float2int_rob_stall_Q);
    assign float2int_s_flush_i_D = s_flush_i_Q;
    assign float2int_s_op_i_D = r_fpu_op_Q;
    assign float2int_s_properties_i_D = parsing_inputs_s_f2i_properties_o_Q;
    assign float2int_s_rm_i_D = r_fpu_rm_Q;
    assign float2int_s_ROB_ptr_i_D = r_fpu_ROB_ptr_Q;
    assign float2int_s_srcA_i_D = r_fpu_src_A_Q;
    assign float2int_s_start_i_D = (r_start_f2i_Q & (!r_exc_en_Q));
    assign fmul_s_flush_i_D = s_flush_i_Q;
    assign fmul_s_op_i_D = r_fpu_op_Q;
    assign fmul_s_properties_i_D = parsing_inputs_s_mul_properties_o_Q;
    assign fmul_s_rm_i_D = r_fpu_rm_Q;
    assign fmul_s_ROB_ptr_i_D = r_fpu_ROB_ptr_Q;
    assign fmul_s_srcA_i_D = r_fpu_src_A_Q;
    assign fmul_s_srcB_i_D = r_fpu_src_B_Q;
    assign fmul_s_start_i_D = ((r_start_mul_Q | r_start_fused_Q) & (!r_exc_en_Q));
    assign fused_s_flush_i_D = s_flush_i_Q;
    assign fused_s_mul_partial_result_i_D = fmul_s_mul_partial_result_Q;
    assign fused_s_op_i_D = r_fpu_op_Q;
    assign fused_s_properties_i_D = parsing_inputs_s_fused_properties_o_Q;
    assign fused_s_rm_i_D = r_fpu_rm_Q;
    assign fused_s_ROB_ptr_i_D = r_fpu_ROB_ptr_Q;
    assign fused_s_srcA_i_D = r_fpu_src_A_Q;
    assign fused_s_srcB_i_D = r_fpu_src_B_Q;
    assign fused_s_srcC_i_D = r_fpu_src_C_Q;
    assign fused_s_start_i_D = (r_start_fused_Q & (!r_exc_en_Q));
    assign i2f_ready_D = int2float_s_ready_o_Q;
    assign int2float_s_ack_i_D = (~s_int2float_rob_stall_Q);
    assign int2float_s_flush_i_D = s_flush_i_Q;
    assign int2float_s_op_i_D = r_fpu_op_Q;
    assign int2float_s_rm_i_D = r_fpu_rm_Q;
    assign int2float_s_ROB_ptr_i_D = r_fpu_ROB_ptr_Q;
    assign int2float_s_srcA_i_D = r_fpu_src_A_Q;
    assign int2float_s_start_i_D = (r_start_i2f_Q & (!r_exc_en_Q));
    assign move_s_ROB_ptr_i_D = r_fpu_ROB_ptr_Q;
    assign move_s_srcA_i_D = r_fpu_src_A_Q;
    assign move_s_start_i_D = r_start_move_Q;
    assign parsing_inputs_s_srcA_i_D = r_fpu_src_A_Q;
    assign parsing_inputs_s_srcB_i_D = r_fpu_src_B_Q;
    assign parsing_inputs_s_srcC_i_D = r_fpu_src_C_Q;
    assign r_cnt_ops_inside_D = cnt_ops_inside_B0;
    assign r_cnt_ops_inside_WE = 1'b1;
    assign r_exc_stall_D = ((r_exc_en_Q | r_exc_stall_Q) & (!((ROB_out_item_2_B0[37] & ROB_out_item_done_Q) & s_ack_i_Q)));
    assign r_exc_stall_WE = 1'b1;
    assign r_fpu_ROB_ptr_out_D = 5'((32'(r_fpu_ROB_ptr_out_Q) + 32'h00000001));
    assign r_fpu_ROB_ptr_out_WE = codasip_tmp_var_2 ? 1'b1 : 1'b0;
    assign r_full_ports_D = s_full_port_Q;
    assign r_full_ports_WE = 1'b1;
    assign ROB_out_item_done_D = 1'(((r_fpu_ROB_done_Q >> r_fpu_ROB_ptr_out_Q) & 32'h00000001));
    assign s_add_sub_done_D = add_sub_s_done_o_Q;
    assign s_add_sub_ROB_ptr_D = add_sub_s_ROB_ptr_o_Q;
    assign s_busy_o_D = ((r_fpu_ROB_ptr_out_Q != r_fpu_ROB_ptr_Q) | s_start_operation_Q);
    assign s_classify_done_D = classify_s_done_o_Q;
    assign s_cmp_done_D = compare_s_done_o_Q;
    assign s_exc_instr_addr_o_D = codasip_tmp_var_1 ? ROB_out_item_1_B0[37:6] : 32'h00000000;
    assign s_exc_tval_o_D = codasip_tmp_var_1 ? ROB_out_item_1_B0[69:38] : 32'h00000000;
    assign s_exc_type_o_D = codasip_tmp_var_1 ? ((ROB_out_item_1_B0[70]) ? ROB_out_item_1_B0[75:71] : 5'h02) : 5'h00;
    assign s_exc_valid_o_D = codasip_tmp_var_1 ? (ROB_out_item_1_B0[70] | ROB_out_item_2_B0[37]) : 1'b0;
    assign s_f2i_ROB_ptr_D = float2int_s_ROB_ptr_o_Q;
    assign s_flags_o_D = codasip_tmp_var_1 ? ROB_out_item_2_B0[36:32] : 5'h00;
    assign s_float2int_done_D = float2int_s_done_o_Q;
    assign s_fpu_addsub_flags_D = add_sub_s_flags_o_Q;
    assign s_fpu_addsub_result_D = add_sub_s_result_o_Q;
    assign s_fpu_classify_ptr_D = classify_s_ROB_ptr_o_Q;
    assign s_fpu_classify_result_D = classify_s_result_o_Q;
    assign s_fpu_cmp_flags_D = compare_s_flags_o_Q;
    assign s_fpu_cmp_result_D = compare_s_result_o_Q;
    assign s_fpu_cmp_ROB_ptr_D = compare_s_ROB_ptr_o_Q;
    assign s_fpu_f2i_flags_D = float2int_s_flags_o_Q;
    assign s_fpu_f2i_result_D = float2int_s_result_o_Q;
    assign s_fpu_fused_flags_D = fused_s_flags_o_Q;
    assign s_fpu_fused_result_D = fused_s_result_o_Q;
    assign s_fpu_i2f_flags_D = int2float_s_flags_o_Q;
    assign s_fpu_i2f_result_D = int2float_s_result_o_Q;
    assign s_fpu_move_ptr_D = move_s_ROB_ptr_o_Q;
    assign s_fpu_move_result_D = move_s_result_o_Q;
    assign s_fpu_mul_flags_D = fmul_s_flags_o_Q;
    assign s_fpu_mul_result_D = fmul_s_result_o_Q;
    assign s_fpu_sgnj_ptr_D = sgnj_s_ROB_ptr_o_Q;
    assign s_fpu_sgnj_result_D = sgnj_s_result_o_Q;
    assign s_fpu_sqrt_div_flags_D = sqrt_div_s_flags_o_Q;
    assign s_fpu_sqrt_div_result_D = sqrt_div_s_result_o_Q;
    assign s_full_port_D = (((~f2i_ready_Q) & r_start_f2i_Q) | ((~i2f_ready_Q) & r_start_i2f_Q));
    assign s_fused_done_D = fused_s_done_o_Q;
    assign s_fused_ROB_ptr_D = fused_s_ROB_ptr_o_Q;
    assign s_i2f_ROB_ptr_D = int2float_s_ROB_ptr_o_Q;
    assign s_int2float_done_D = int2float_s_done_o_Q;
    assign s_move_done_D = move_s_done_o_Q;
    assign s_mul_done_D = fmul_s_done_o_Q;
    assign s_mul_ROB_ptr_D = fmul_s_ROB_ptr_o_Q;
    assign s_rd_addr_o_D = codasip_tmp_var_1 ? ROB_out_item_1_B0[5:0] : 6'h00;
    assign s_rd_data_o_D = codasip_tmp_var_1 ? ROB_out_item_2_B0[31:0] : 32'h00000000;
    assign s_rdx_valid_o_D = (rdx_valid_regs_B0B34 | rdx_internal_pipe_B0B34);
    assign s_ready_D = (~(((((r_unit_stall_Q | r_exc_stall_Q) | r_stall_fwd_Q) | r_exc_en_Q) | s_full_port_Q) | rob_full_B0));
    assign s_ready_o_D = s_ready_Q;
    assign s_ROB_full_D = rob_full_B0;
    assign s_sgnj_done_D = sgnj_s_done_o_Q;
    assign s_sqr_div_done_D = sqrt_div_s_done_o_Q;
    assign s_sqrt_div_ROB_ptr_D = sqrt_div_s_ROB_ptr_o_Q;
    assign s_start_operation_D = ((((((((((((r_start_add_sub_Q & add_sub_ready_Q) | r_start_mul_Q) | r_start_classify_Q) | r_start_cmp_Q) | r_start_max_min_Q) | (r_start_f2i_Q & f2i_ready_Q)) | (r_start_i2f_Q & i2f_ready_Q)) | r_start_sgnj_Q) | r_start_fused_Q) | r_start_sqrt_div_Q) | r_start_move_Q) | r_exc_en_Q);
    assign s_valid_o_D = ROB_out_item_done_Q;
    assign s_wb_commit_addr_D = codasip_tmp_var_1 ? ROB_out_item_1_B0[5:0] : 6'h00;
    assign sgnj_s_op_i_D = r_fpu_op_Q;
    assign sgnj_s_ROB_ptr_i_D = r_fpu_ROB_ptr_Q;
    assign sgnj_s_srcA_i_D = r_fpu_src_A_Q;
    assign sgnj_s_srcB_i_D = r_fpu_src_B_Q;
    assign sgnj_s_start_i_D = r_start_sgnj_Q;
    assign sqrt_div_busy_D = sqrt_div_s_busy_o_Q;
    assign sqrt_div_ready_D = sqrt_div_s_ready_o_Q;
    assign sqrt_div_s_flush_i_D = s_flush_i_Q;
    assign sqrt_div_s_op_i_D = r_fpu_op_Q;
    assign sqrt_div_s_properties_i_D = parsing_inputs_s_sqrt_div_properties_o_Q;
    assign sqrt_div_s_rm_i_D = r_fpu_rm_Q;
    assign sqrt_div_s_ROB_ptr_i_D = r_fpu_ROB_ptr_Q;
    assign sqrt_div_s_srcA_i_D = r_fpu_src_A_Q;
    assign sqrt_div_s_srcB_i_D = r_fpu_src_B_Q;
    assign sqrt_div_s_start_i_D = (r_start_sqrt_div_Q & (!r_exc_en_Q));
    // code snippets:
`ifdef CODASIP_RTL_ASSERTIONS
    // Specify default clock signal for all assertions.
    // The clock may run even when the unit has gated clock signal.
    default clocking @(posedge `CODASIP_RTL_ASSERTIONS_CLOCK); endclocking

`ifdef CODASIP_RTL_ASSERTIONS_RESET
    // Disable all the assertions in case reset is asserted.
    default disable iff ((`CODASIP_RTL_ASSERTIONS_RESET == 1'b0));
`endif

    addsub_done_and_payloads_stable_until_ack: assert property (
       !s_flush_i_Q && add_sub_s_done_o_Q && !add_sub_s_ack_i_Q |=> s_flush_i_Q || $stable({add_sub_s_done_o_Q, addsub_output_payloads_B0})
    )
    else $fatal(1, "ADDSUB's done and output payloads should stay stable until unit receives ack");

    i2f_done_and_payloads_stable_until_ack: assert property (
       !s_flush_i_Q && int2float_s_done_o_Q && !int2float_s_ack_i_Q |=> s_flush_i_Q || $stable({int2float_s_done_o_Q, i2f_output_payloads_B0})
    )
    else $fatal(1, "I2F's done and output payloads should stay stable until unit receives ack");

    f2i_payloads_stable_until_start_ready: assert property (
       !s_flush_i_Q && float2int_s_start_i_Q && !float2int_s_ready_o_Q |=> $stable(f2i_input_payloads_B0) throughout (s_flush_i_Q || (float2int_s_start_i_Q && float2int_s_ready_o_Q)) [->1]
    )
    else $fatal(1, "F2I's input payloads should stay stable until unit is ready and started");

    f2i_done_and_payloads_stable_until_ack: assert property (
       !s_flush_i_Q && float2int_s_done_o_Q && !float2int_s_ack_i_Q |=> s_flush_i_Q || $stable({float2int_s_done_o_Q, f2i_output_payloads_B0})
    )
    else $fatal(1, "F2I's done and output payloads should stay stable until unit receives ack");

    fmul_start_with_exc_stall: assert property (
        ((!(((r_start_mul_Q | r_start_fused_Q) & (!r_exc_en_Q)) & r_exc_stall_Q)))
    )
    else $fatal(32'sd2, "fmul_start_with_exc_stall: fmul.s_start_i == 1 but r_exc_stall == 1");

    fused_start_with_exc_stall: assert property (
        ((!((r_start_fused_Q & (!r_exc_en_Q)) & r_exc_stall_Q)))
    )
    else $fatal(32'sd2, "fused_start_with_exc_stall: fused.s_start_i == 1 but r_exc_stall == 1");

    addsub_start_with_exc_stall: assert property (
        ((!((r_start_add_sub_Q & (!r_exc_en_Q)) & r_exc_stall_Q)))
    )
    else $fatal(32'sd2, "addsub_start_with_exc_stall: add_sub.s_start_i == 1 but r_exc_stall == 1 ");

    i2f_start_with_exc_stall: assert property (
        ((!((r_start_i2f_Q & (!r_exc_en_Q)) & r_exc_stall_Q)))
    )
    else $fatal(32'sd2, "i2f_start_with_exc_stall: int2float.s_start_i == 1 but r_exc_stall == 1 ");

    f2i_start_with_exc_stall: assert property (
        ((!((r_start_f2i_Q & (!r_exc_en_Q)) & r_exc_stall_Q)))
    )
    else $fatal(32'sd2, "f2i_start_with_exc_stall: float2int.s_start_i == 1 but r_exc_stall == 1 ");

    sgnj_start_with_exc: assert property (
        ((!(r_start_sgnj_Q & (r_exc_en_Q | r_exc_stall_Q))))
    )
    else $fatal(32'sd2, "sgnj_start_with_exc: sgnj.s_start_i == 1 but (r_exc_en | r_exc_stall) == 1 ");

    classify_start_with_exc: assert property (
        ((!(r_start_classify_Q & (r_exc_en_Q | r_exc_stall_Q))))
    )
    else $fatal(32'sd2, "classify_start_with_exc: classify.s_start_i == 1 but (r_exc_en | r_exc_stall) == 1 ");

    compare_start_with_exc: assert property (
        ((!((r_start_max_min_Q | r_start_cmp_Q) & (r_exc_en_Q | r_exc_stall_Q))))
    )
    else $fatal(32'sd2, "compare_start_with_exc: compare.s_start_i == 1 but (r_exc_en | r_exc_stall) == 1 ");

    move_start_with_exc: assert property (
        ((!(r_start_move_Q & (r_exc_en_Q | r_exc_stall_Q))))
    )
    else $fatal(32'sd2, "move_start_with_exc: move.s_start_i == 1 but (r_exc_en | r_exc_stall) == 1 ");

    sqrt_div_start_with_exc_stall: assert property (
        ((!((r_start_sqrt_div_Q & (!r_exc_en_Q)) & r_exc_stall_Q)))
    )
    else $fatal(32'sd2, "sqrt_div_start_with_exc_stall: sqrt_div.s_start_i == 1 but r_exc_stall == 1 ");

    addsub_start_and_not_ready: assert property (
        ((!((!add_sub_s_ready_o_Q) & add_sub_s_start_i_Q)))
    )
    else $fatal(32'sd2, "addsub_start_and_not_ready: !(!add_sub.s_ready_o & add_sub.s_start_i)");

    i2f_start_and_not_ready: assert property (
        ((!((!int2float_s_ready_o_Q) & int2float_s_start_i_Q)))
    )
    else $fatal(32'sd2, "i2f_start_and_not_ready: !(!int2float.s_ready_o & int2float.s_start_i)");

    sqrt_div_start_and_not_ready: assert property (
        ((!((!sqrt_div_s_ready_o_Q) & sqrt_div_s_start_i_Q)))
    )
    else $fatal(32'sd2, "sqrt_div_start_and_not_ready: !(!sqrt_div.s_ready_o & sqrt_div.s_start_i)");

    FPU_ROB_overflow: assert property (
        (((!((32'(r_cnt_ops_inside_Q) == 32'h00000020) && (cnt_ops_inside_B0 == 5'h00))) || s_flush_i_Q))
    )
    else $fatal(32'sd2, "FPU_ROB_overflow: ROB will overflow");

`endif  // CODASIP_RTL_ASSERTIONS

endmodule: codix_berkelium_ca_core_execute_stage_fpu_fpu_compute_out_t
