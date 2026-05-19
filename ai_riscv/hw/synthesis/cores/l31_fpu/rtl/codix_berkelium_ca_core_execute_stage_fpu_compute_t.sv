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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_compute_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_fpu_compute_t(
    input  logic add_sub_ready_Q,
    input  logic add_sub_s_clk_en_i_Q,
    input  logic add_sub_s_start_i_Q,
    input  logic f2i_ready_Q,
    input  logic float2int_s_clk_en_i_Q,
    input  logic float2int_s_start_i_Q,
    input  logic fmul_s_clk_en_i_Q,
    input  logic fmul_s_start_i_Q,
    input  logic fused_s_clk_en_i_Q,
    input  logic fused_s_start_i_Q,
    input  logic i2f_ready_Q,
    input  logic int2float_s_clk_en_i_Q,
    input  logic int2float_s_start_i_Q,
    input  logic r_busy_Q,
    input  logic r_exc_en_Q,
    input  logic [5:0] r_exc_op_Q,
    input  logic r_exc_stall_Q,
    input  logic [4:0] r_exc_type_Q,
    input  logic r_exc_valid_Q,
    input  logic [5:0] r_fpu_dst_addr_Q,
    input  logic [5:0] r_fpu_op_Q,
    input  logic [31:0] r_fpu_ROB_done_Q,
    input  logic [4:0] r_fpu_ROB_ptr_out_Q,
    input  logic [4:0] r_fpu_ROB_ptr_Q,
    input  logic [5:0] r_fpu_s1_addr_Q,
    input  logic [5:0] r_fpu_s2_addr_Q,
    input  logic [5:0] r_fpu_s3_addr_Q,
    input  logic [31:0] r_fpu_src_A_Q,
    input  logic [31:0] r_fpu_src_B_Q,
    input  logic [31:0] r_fpu_src_C_Q,
    input  logic r_full_ports_Q,
    input  logic [31:0] r_instr_addr_Q,
    input  logic [31:0] r_instr_Q,
    input  logic r_is_fpu_op_Q,
    input  logic [5:0] r_record_f_addr0_Q,
    input  logic [5:0] r_record_f_addr10_Q,
    input  logic [5:0] r_record_f_addr11_Q,
    input  logic [5:0] r_record_f_addr12_Q,
    input  logic [5:0] r_record_f_addr13_Q,
    input  logic [5:0] r_record_f_addr14_Q,
    input  logic [5:0] r_record_f_addr15_Q,
    input  logic [5:0] r_record_f_addr16_Q,
    input  logic [5:0] r_record_f_addr17_Q,
    input  logic [5:0] r_record_f_addr18_Q,
    input  logic [5:0] r_record_f_addr19_Q,
    input  logic [5:0] r_record_f_addr1_Q,
    input  logic [5:0] r_record_f_addr20_Q,
    input  logic [5:0] r_record_f_addr21_Q,
    input  logic [5:0] r_record_f_addr22_Q,
    input  logic [5:0] r_record_f_addr23_Q,
    input  logic [5:0] r_record_f_addr24_Q,
    input  logic [5:0] r_record_f_addr25_Q,
    input  logic [5:0] r_record_f_addr26_Q,
    input  logic [5:0] r_record_f_addr27_Q,
    input  logic [5:0] r_record_f_addr28_Q,
    input  logic [5:0] r_record_f_addr29_Q,
    input  logic [5:0] r_record_f_addr2_Q,
    input  logic [5:0] r_record_f_addr30_Q,
    input  logic [5:0] r_record_f_addr31_Q,
    input  logic [5:0] r_record_f_addr3_Q,
    input  logic [5:0] r_record_f_addr4_Q,
    input  logic [5:0] r_record_f_addr5_Q,
    input  logic [5:0] r_record_f_addr6_Q,
    input  logic [5:0] r_record_f_addr7_Q,
    input  logic [5:0] r_record_f_addr8_Q,
    input  logic [5:0] r_record_f_addr9_Q,
    input  logic [5:0] r_record_x_addr10_Q,
    input  logic [5:0] r_record_x_addr11_Q,
    input  logic [5:0] r_record_x_addr12_Q,
    input  logic [5:0] r_record_x_addr13_Q,
    input  logic [5:0] r_record_x_addr14_Q,
    input  logic [5:0] r_record_x_addr15_Q,
    input  logic [5:0] r_record_x_addr16_Q,
    input  logic [5:0] r_record_x_addr17_Q,
    input  logic [5:0] r_record_x_addr18_Q,
    input  logic [5:0] r_record_x_addr19_Q,
    input  logic [5:0] r_record_x_addr1_Q,
    input  logic [5:0] r_record_x_addr20_Q,
    input  logic [5:0] r_record_x_addr21_Q,
    input  logic [5:0] r_record_x_addr22_Q,
    input  logic [5:0] r_record_x_addr23_Q,
    input  logic [5:0] r_record_x_addr24_Q,
    input  logic [5:0] r_record_x_addr25_Q,
    input  logic [5:0] r_record_x_addr26_Q,
    input  logic [5:0] r_record_x_addr27_Q,
    input  logic [5:0] r_record_x_addr28_Q,
    input  logic [5:0] r_record_x_addr29_Q,
    input  logic [5:0] r_record_x_addr2_Q,
    input  logic [5:0] r_record_x_addr30_Q,
    input  logic [5:0] r_record_x_addr31_Q,
    input  logic [5:0] r_record_x_addr3_Q,
    input  logic [5:0] r_record_x_addr4_Q,
    input  logic [5:0] r_record_x_addr5_Q,
    input  logic [5:0] r_record_x_addr6_Q,
    input  logic [5:0] r_record_x_addr7_Q,
    input  logic [5:0] r_record_x_addr8_Q,
    input  logic [5:0] r_record_x_addr9_Q,
    input  logic [31:0] r_rob_part2_item0_Q,
    input  logic [31:0] r_rob_part2_item10_Q,
    input  logic [31:0] r_rob_part2_item11_Q,
    input  logic [31:0] r_rob_part2_item12_Q,
    input  logic [31:0] r_rob_part2_item13_Q,
    input  logic [31:0] r_rob_part2_item14_Q,
    input  logic [31:0] r_rob_part2_item15_Q,
    input  logic [31:0] r_rob_part2_item16_Q,
    input  logic [31:0] r_rob_part2_item17_Q,
    input  logic [31:0] r_rob_part2_item18_Q,
    input  logic [31:0] r_rob_part2_item19_Q,
    input  logic [31:0] r_rob_part2_item1_Q,
    input  logic [31:0] r_rob_part2_item20_Q,
    input  logic [31:0] r_rob_part2_item21_Q,
    input  logic [31:0] r_rob_part2_item22_Q,
    input  logic [31:0] r_rob_part2_item23_Q,
    input  logic [31:0] r_rob_part2_item24_Q,
    input  logic [31:0] r_rob_part2_item25_Q,
    input  logic [31:0] r_rob_part2_item26_Q,
    input  logic [31:0] r_rob_part2_item27_Q,
    input  logic [31:0] r_rob_part2_item28_Q,
    input  logic [31:0] r_rob_part2_item29_Q,
    input  logic [31:0] r_rob_part2_item2_Q,
    input  logic [31:0] r_rob_part2_item30_Q,
    input  logic [31:0] r_rob_part2_item31_Q,
    input  logic [31:0] r_rob_part2_item3_Q,
    input  logic [31:0] r_rob_part2_item4_Q,
    input  logic [31:0] r_rob_part2_item5_Q,
    input  logic [31:0] r_rob_part2_item6_Q,
    input  logic [31:0] r_rob_part2_item7_Q,
    input  logic [31:0] r_rob_part2_item8_Q,
    input  logic [31:0] r_rob_part2_item9_Q,
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
    input  logic s_busy_o_Q,
    input  logic [5:0] s_exc_op_wait_Q,
    input  logic [4:0] s_exc_type_i_Q,
    input  logic s_exc_valid_i_Q,
    input  logic s_flush_i_Q,
    input  logic [2:0] s_frm_i_Q,
    input  logic s_full_port_Q,
    input  logic [31:0] s_instr_addr_i_Q,
    input  logic [31:0] s_instr_i_Q,
    input  logic s_new_operation_Q,
    input  logic [5:0] s_op_i_Q,
    input  logic [5:0] s_rd_addr_i_Q,
    input  logic s_ready_Q,
    input  logic [2:0] s_rm_i_Q,
    input  logic s_ROB_full_Q,
    input  logic [5:0] s_s1_addr_i_Q,
    input  logic [31:0] s_s1_data_i_Q,
    input  logic [5:0] s_s2_addr_i_Q,
    input  logic [31:0] s_s2_data_i_Q,
    input  logic [5:0] s_s3_addr_i_Q,
    input  logic [31:0] s_s3_data_i_Q,
    input  logic s_valid_i_Q,
    input  logic [5:0] s_wb_commit_addr_Q,
    input  logic sqrt_div_busy_Q,
    input  logic sqrt_div_ready_Q,
    input  logic sqrt_div_s_clk_en_i_Q,
    input  logic sqrt_div_s_start_i_Q,
    output logic add_sub_s_clk_en_i_D,
    output logic control_fpu_CONTROL_CLEAR_D,
    output logic control_fpu_CONTROL_STALL_D,
    output logic control_fpu_ROB_CLEAR_D,
    output logic float2int_s_clk_en_i_D,
    output logic fmul_s_clk_en_i_D,
    output logic fused_s_clk_en_i_D,
    output logic int2float_s_clk_en_i_D,
    output logic r_busy_D,
    output logic r_busy_WE,
    output logic r_exc_en_D,
    output logic r_exc_en_WE,
    output logic [5:0] r_exc_op_D,
    output logic r_exc_op_WE,
    output logic [4:0] r_exc_type_D,
    output logic r_exc_type_WE,
    output logic r_exc_valid_D,
    output logic r_exc_valid_WE,
    output logic [5:0] r_fpu_dst_addr_D,
    output logic r_fpu_dst_addr_WE,
    output logic [5:0] r_fpu_op_D,
    output logic r_fpu_op_WE,
    output logic [2:0] r_fpu_rm_D,
    output logic r_fpu_rm_WE,
    output logic [4:0] r_fpu_ROB_ptr_D,
    output logic r_fpu_ROB_ptr_WE,
    output logic [5:0] r_fpu_s1_addr_D,
    output logic r_fpu_s1_addr_WE,
    output logic [5:0] r_fpu_s2_addr_D,
    output logic r_fpu_s2_addr_WE,
    output logic [5:0] r_fpu_s3_addr_D,
    output logic r_fpu_s3_addr_WE,
    output logic [31:0] r_fpu_src_A_D,
    output logic r_fpu_src_A_WE,
    output logic [31:0] r_fpu_src_B_D,
    output logic r_fpu_src_B_WE,
    output logic [31:0] r_fpu_src_C_D,
    output logic r_fpu_src_C_WE,
    output logic [31:0] r_instr_addr_D,
    output logic r_instr_addr_WE,
    output logic [31:0] r_instr_D,
    output logic r_instr_WE,
    output logic r_is_fpu_op_D,
    output logic r_is_fpu_op_WE,
    output logic [5:0] r_record_f_addr0_D,
    output logic r_record_f_addr0_WE,
    output logic [5:0] r_record_f_addr10_D,
    output logic r_record_f_addr10_WE,
    output logic [5:0] r_record_f_addr11_D,
    output logic r_record_f_addr11_WE,
    output logic [5:0] r_record_f_addr12_D,
    output logic r_record_f_addr12_WE,
    output logic [5:0] r_record_f_addr13_D,
    output logic r_record_f_addr13_WE,
    output logic [5:0] r_record_f_addr14_D,
    output logic r_record_f_addr14_WE,
    output logic [5:0] r_record_f_addr15_D,
    output logic r_record_f_addr15_WE,
    output logic [5:0] r_record_f_addr16_D,
    output logic r_record_f_addr16_WE,
    output logic [5:0] r_record_f_addr17_D,
    output logic r_record_f_addr17_WE,
    output logic [5:0] r_record_f_addr18_D,
    output logic r_record_f_addr18_WE,
    output logic [5:0] r_record_f_addr19_D,
    output logic r_record_f_addr19_WE,
    output logic [5:0] r_record_f_addr1_D,
    output logic r_record_f_addr1_WE,
    output logic [5:0] r_record_f_addr20_D,
    output logic r_record_f_addr20_WE,
    output logic [5:0] r_record_f_addr21_D,
    output logic r_record_f_addr21_WE,
    output logic [5:0] r_record_f_addr22_D,
    output logic r_record_f_addr22_WE,
    output logic [5:0] r_record_f_addr23_D,
    output logic r_record_f_addr23_WE,
    output logic [5:0] r_record_f_addr24_D,
    output logic r_record_f_addr24_WE,
    output logic [5:0] r_record_f_addr25_D,
    output logic r_record_f_addr25_WE,
    output logic [5:0] r_record_f_addr26_D,
    output logic r_record_f_addr26_WE,
    output logic [5:0] r_record_f_addr27_D,
    output logic r_record_f_addr27_WE,
    output logic [5:0] r_record_f_addr28_D,
    output logic r_record_f_addr28_WE,
    output logic [5:0] r_record_f_addr29_D,
    output logic r_record_f_addr29_WE,
    output logic [5:0] r_record_f_addr2_D,
    output logic r_record_f_addr2_WE,
    output logic [5:0] r_record_f_addr30_D,
    output logic r_record_f_addr30_WE,
    output logic [5:0] r_record_f_addr31_D,
    output logic r_record_f_addr31_WE,
    output logic [5:0] r_record_f_addr3_D,
    output logic r_record_f_addr3_WE,
    output logic [5:0] r_record_f_addr4_D,
    output logic r_record_f_addr4_WE,
    output logic [5:0] r_record_f_addr5_D,
    output logic r_record_f_addr5_WE,
    output logic [5:0] r_record_f_addr6_D,
    output logic r_record_f_addr6_WE,
    output logic [5:0] r_record_f_addr7_D,
    output logic r_record_f_addr7_WE,
    output logic [5:0] r_record_f_addr8_D,
    output logic r_record_f_addr8_WE,
    output logic [5:0] r_record_f_addr9_D,
    output logic r_record_f_addr9_WE,
    output logic [5:0] r_record_x_addr10_D,
    output logic r_record_x_addr10_WE,
    output logic [5:0] r_record_x_addr11_D,
    output logic r_record_x_addr11_WE,
    output logic [5:0] r_record_x_addr12_D,
    output logic r_record_x_addr12_WE,
    output logic [5:0] r_record_x_addr13_D,
    output logic r_record_x_addr13_WE,
    output logic [5:0] r_record_x_addr14_D,
    output logic r_record_x_addr14_WE,
    output logic [5:0] r_record_x_addr15_D,
    output logic r_record_x_addr15_WE,
    output logic [5:0] r_record_x_addr16_D,
    output logic r_record_x_addr16_WE,
    output logic [5:0] r_record_x_addr17_D,
    output logic r_record_x_addr17_WE,
    output logic [5:0] r_record_x_addr18_D,
    output logic r_record_x_addr18_WE,
    output logic [5:0] r_record_x_addr19_D,
    output logic r_record_x_addr19_WE,
    output logic [5:0] r_record_x_addr1_D,
    output logic r_record_x_addr1_WE,
    output logic [5:0] r_record_x_addr20_D,
    output logic r_record_x_addr20_WE,
    output logic [5:0] r_record_x_addr21_D,
    output logic r_record_x_addr21_WE,
    output logic [5:0] r_record_x_addr22_D,
    output logic r_record_x_addr22_WE,
    output logic [5:0] r_record_x_addr23_D,
    output logic r_record_x_addr23_WE,
    output logic [5:0] r_record_x_addr24_D,
    output logic r_record_x_addr24_WE,
    output logic [5:0] r_record_x_addr25_D,
    output logic r_record_x_addr25_WE,
    output logic [5:0] r_record_x_addr26_D,
    output logic r_record_x_addr26_WE,
    output logic [5:0] r_record_x_addr27_D,
    output logic r_record_x_addr27_WE,
    output logic [5:0] r_record_x_addr28_D,
    output logic r_record_x_addr28_WE,
    output logic [5:0] r_record_x_addr29_D,
    output logic r_record_x_addr29_WE,
    output logic [5:0] r_record_x_addr2_D,
    output logic r_record_x_addr2_WE,
    output logic [5:0] r_record_x_addr30_D,
    output logic r_record_x_addr30_WE,
    output logic [5:0] r_record_x_addr31_D,
    output logic r_record_x_addr31_WE,
    output logic [5:0] r_record_x_addr3_D,
    output logic r_record_x_addr3_WE,
    output logic [5:0] r_record_x_addr4_D,
    output logic r_record_x_addr4_WE,
    output logic [5:0] r_record_x_addr5_D,
    output logic r_record_x_addr5_WE,
    output logic [5:0] r_record_x_addr6_D,
    output logic r_record_x_addr6_WE,
    output logic [5:0] r_record_x_addr7_D,
    output logic r_record_x_addr7_WE,
    output logic [5:0] r_record_x_addr8_D,
    output logic r_record_x_addr8_WE,
    output logic [5:0] r_record_x_addr9_D,
    output logic r_record_x_addr9_WE,
    output logic [75:0] r_rob_part1_item0_D,
    output logic r_rob_part1_item0_WE,
    output logic [75:0] r_rob_part1_item10_D,
    output logic r_rob_part1_item10_WE,
    output logic [75:0] r_rob_part1_item11_D,
    output logic r_rob_part1_item11_WE,
    output logic [75:0] r_rob_part1_item12_D,
    output logic r_rob_part1_item12_WE,
    output logic [75:0] r_rob_part1_item13_D,
    output logic r_rob_part1_item13_WE,
    output logic [75:0] r_rob_part1_item14_D,
    output logic r_rob_part1_item14_WE,
    output logic [75:0] r_rob_part1_item15_D,
    output logic r_rob_part1_item15_WE,
    output logic [75:0] r_rob_part1_item16_D,
    output logic r_rob_part1_item16_WE,
    output logic [75:0] r_rob_part1_item17_D,
    output logic r_rob_part1_item17_WE,
    output logic [75:0] r_rob_part1_item18_D,
    output logic r_rob_part1_item18_WE,
    output logic [75:0] r_rob_part1_item19_D,
    output logic r_rob_part1_item19_WE,
    output logic [75:0] r_rob_part1_item1_D,
    output logic r_rob_part1_item1_WE,
    output logic [75:0] r_rob_part1_item20_D,
    output logic r_rob_part1_item20_WE,
    output logic [75:0] r_rob_part1_item21_D,
    output logic r_rob_part1_item21_WE,
    output logic [75:0] r_rob_part1_item22_D,
    output logic r_rob_part1_item22_WE,
    output logic [75:0] r_rob_part1_item23_D,
    output logic r_rob_part1_item23_WE,
    output logic [75:0] r_rob_part1_item24_D,
    output logic r_rob_part1_item24_WE,
    output logic [75:0] r_rob_part1_item25_D,
    output logic r_rob_part1_item25_WE,
    output logic [75:0] r_rob_part1_item26_D,
    output logic r_rob_part1_item26_WE,
    output logic [75:0] r_rob_part1_item27_D,
    output logic r_rob_part1_item27_WE,
    output logic [75:0] r_rob_part1_item28_D,
    output logic r_rob_part1_item28_WE,
    output logic [75:0] r_rob_part1_item29_D,
    output logic r_rob_part1_item29_WE,
    output logic [75:0] r_rob_part1_item2_D,
    output logic r_rob_part1_item2_WE,
    output logic [75:0] r_rob_part1_item30_D,
    output logic r_rob_part1_item30_WE,
    output logic [75:0] r_rob_part1_item31_D,
    output logic r_rob_part1_item31_WE,
    output logic [75:0] r_rob_part1_item3_D,
    output logic r_rob_part1_item3_WE,
    output logic [75:0] r_rob_part1_item4_D,
    output logic r_rob_part1_item4_WE,
    output logic [75:0] r_rob_part1_item5_D,
    output logic r_rob_part1_item5_WE,
    output logic [75:0] r_rob_part1_item6_D,
    output logic r_rob_part1_item6_WE,
    output logic [75:0] r_rob_part1_item7_D,
    output logic r_rob_part1_item7_WE,
    output logic [75:0] r_rob_part1_item8_D,
    output logic r_rob_part1_item8_WE,
    output logic [75:0] r_rob_part1_item9_D,
    output logic r_rob_part1_item9_WE,
    output logic r_stall_fwd_D,
    output logic r_stall_fwd_WE,
    output logic r_start_add_sub_D,
    output logic r_start_add_sub_WE,
    output logic r_start_classify_D,
    output logic r_start_classify_WE,
    output logic r_start_cmp_D,
    output logic r_start_cmp_WE,
    output logic r_start_f2i_D,
    output logic r_start_f2i_WE,
    output logic r_start_fused_D,
    output logic r_start_fused_WE,
    output logic r_start_i2f_D,
    output logic r_start_i2f_WE,
    output logic r_start_max_min_D,
    output logic r_start_max_min_WE,
    output logic r_start_move_D,
    output logic r_start_move_WE,
    output logic r_start_mul_D,
    output logic r_start_mul_WE,
    output logic r_start_sgnj_D,
    output logic r_start_sgnj_WE,
    output logic r_start_sqrt_div_D,
    output logic r_start_sqrt_div_WE,
    output logic r_unit_stall_D,
    output logic r_unit_stall_WE,
    output logic [5:0] s_exc_op_wait_D,
    output logic s_fpu_ce_D,
    output logic s_new_operation_D,
    output logic sqrt_div_s_clk_en_i_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic [4:0] ROB_ptr_B0;
    // signal/wire
    logic add_record_B0;
    // signal/wire
    logic codasip_tmp_var_0;
    // signal/wire
    logic codasip_tmp_var_1;
    // signal/wire
    logic codasip_tmp_var_10;
    // signal/wire
    logic codasip_tmp_var_11;
    // signal/wire
    logic codasip_tmp_var_12;
    // signal/wire
    logic codasip_tmp_var_13;
    // signal/wire
    logic codasip_tmp_var_14;
    // signal/wire
    logic codasip_tmp_var_15;
    // signal/wire
    logic codasip_tmp_var_16;
    // signal/wire
    logic codasip_tmp_var_17;
    // signal/wire
    logic codasip_tmp_var_18;
    // signal/wire
    logic codasip_tmp_var_19;
    // signal/wire
    logic codasip_tmp_var_2;
    // signal/wire
    logic codasip_tmp_var_20;
    // signal/wire
    logic codasip_tmp_var_21;
    // signal/wire
    logic codasip_tmp_var_22;
    // signal/wire
    logic codasip_tmp_var_23;
    // signal/wire
    logic codasip_tmp_var_24;
    // signal/wire
    logic codasip_tmp_var_25;
    // signal/wire
    logic codasip_tmp_var_26;
    // signal/wire
    logic codasip_tmp_var_27;
    // signal/wire
    logic codasip_tmp_var_28;
    // signal/wire
    logic codasip_tmp_var_29;
    // signal/wire
    logic codasip_tmp_var_3;
    // signal/wire
    logic codasip_tmp_var_30;
    // signal/wire
    logic codasip_tmp_var_31;
    // signal/wire
    logic codasip_tmp_var_32;
    // signal/wire
    logic codasip_tmp_var_33;
    // signal/wire
    logic codasip_tmp_var_34;
    // signal/wire
    logic codasip_tmp_var_35;
    // signal/wire
    logic codasip_tmp_var_36;
    // signal/wire
    logic codasip_tmp_var_37;
    // signal/wire
    logic codasip_tmp_var_38;
    // signal/wire
    logic codasip_tmp_var_39;
    // signal/wire
    logic codasip_tmp_var_4;
    // signal/wire
    logic codasip_tmp_var_40;
    // signal/wire
    logic codasip_tmp_var_41;
    // signal/wire
    logic codasip_tmp_var_42;
    // signal/wire
    logic codasip_tmp_var_5;
    // signal/wire
    logic codasip_tmp_var_6;
    // signal/wire
    logic codasip_tmp_var_7;
    // signal/wire
    logic codasip_tmp_var_8;
    // signal/wire
    logic codasip_tmp_var_9;
    // signal/wire
    logic full_add_sub_stall_B0;
    // signal/wire
    logic full_f2i_stall_B0;
    // signal/wire
    logic full_i2f_stall_B0;
    // signal/wire
    logic full_sqrt_div_stall_B0;
    // signal/wire
    logic invalid_round_B0;
    // signal/wire
    logic [31:0] opA_ROB_data_B0;
    // signal/wire
    logic opA_ROB_done_B0;
    // signal/wire
    logic [4:0] opA_ROB_ptr_B0;
    // signal/wire
    logic [4:0] opA_ROB_ptr_wait_B0;
    // signal/wire
    logic opA_ROB_valid_B0;
    // signal/wire
    logic opA_ROB_valid_wait_B0;
    // signal/wire
    logic [31:0] opA_data_B0;
    // signal/wire
    logic [31:0] opB_ROB_data_B0;
    // signal/wire
    logic opB_ROB_done_B0;
    // signal/wire
    logic [4:0] opB_ROB_ptr_B0;
    // signal/wire
    logic [4:0] opB_ROB_ptr_wait_B0;
    // signal/wire
    logic opB_ROB_valid_B0;
    // signal/wire
    logic opB_ROB_valid_wait_B0;
    // signal/wire
    logic [31:0] opB_data_B0;
    // signal/wire
    logic [31:0] opC_ROB_data_B0;
    // signal/wire
    logic opC_ROB_done_B0;
    // signal/wire
    logic [4:0] opC_ROB_ptr_B0;
    // signal/wire
    logic [4:0] opC_ROB_ptr_wait_B0;
    // signal/wire
    logic opC_ROB_valid_B0;
    // signal/wire
    logic opC_ROB_valid_wait_B0;
    // signal/wire
    logic [31:0] opC_data_B0;
    // signal/wire
    logic op_add_sub_B0;
    // signal/wire
    logic op_classify_B0;
    // signal/wire
    logic op_cmp_B0;
    // signal/wire
    logic op_f2i_B0;
    // signal/wire
    logic op_fused_B0;
    // signal/wire
    logic op_i2f_B0;
    // signal/wire
    logic op_max_min_B0;
    // signal/wire
    logic op_move_B0;
    // signal/wire
    logic op_mul_B0;
    // signal/wire
    logic op_sgnj_B0;
    // signal/wire
    logic op_sqrt_div_B0;
    // signal/wire
    logic [5:0] record_opA_B0;
    // signal/wire
    logic [5:0] record_opA_wait_B0;
    // signal/wire
    logic [5:0] record_opB_B0;
    // signal/wire
    logic [5:0] record_opB_wait_B0;
    // signal/wire
    logic [5:0] record_opC_B0;
    // signal/wire
    logic [5:0] record_opC_wait_B0;
    // signal/wire
    logic [75:0] rob_data_part1_B0;
    // signal/wire
    logic s_is_fpu_op_B0;
    // signal/wire
    logic s_stall_control_B0;
    // signal/wire
    logic [5:0] sel_dst_addr_B0;
    // signal/wire
    logic sqrt_div_unit_exc_B0;
    // signal/wire
    logic stall_fwd_A_B0;
    // signal/wire
    logic stall_fwd_B0;
    // signal/wire
    logic stall_fwd_B_B0;
    // signal/wire
    logic stall_fwd_C_B0;
    // signal/wire
    logic stall_sqrt_div_unit_B0;
    // signal/wire
    logic start_add_sub_B0;
    // signal/wire
    logic start_classify_B0;
    // signal/wire
    logic start_cmp_B0;
    // signal/wire
    logic start_f2i_B0;
    // signal/wire
    logic start_fused_B0;
    // signal/wire
    logic start_i2f_B0;
    // signal/wire
    logic start_max_min_B0;
    // signal/wire
    logic start_move_B0;
    // signal/wire
    logic start_mul_B0;
    // signal/wire
    logic start_sgnj_B0;
    // signal/wire
    logic start_sqrt_div_B0;
    // signal/wire
    logic unit_stall_B0;
    // signal/wire
    logic [10:0] units_start_vector_B0;
    // signal/wire
    logic use_rm_B0;
    // signal/wire
    logic use_three_op_B0;
    // signal/wire
    logic use_two_op_B0;
    // signal/wire
    logic write_A_B0;
    // signal/wire
    logic write_B_B0;
    // signal/wire
    logic write_C_B0;

    // data-path code:
    assign s_is_fpu_op_B0 = (s_valid_i_Q & ((s_op_i_Q <= 6'h0e) || ((s_op_i_Q >= 6'h17) && (s_op_i_Q <= 6'h1f))));
    assign s_stall_control_B0 = ((((r_unit_stall_Q | r_exc_stall_Q) | r_stall_fwd_Q) | r_exc_en_Q) | s_full_port_Q);
    assign use_rm_B0 = (((((((((((((s_op_i_Q == 6'h0b) || (s_op_i_Q == 6'h0d)) || (s_op_i_Q == 6'h0c)) || (s_op_i_Q == 6'h0e)) || (s_op_i_Q == 6'h09)) || (s_op_i_Q == 6'h08)) || (s_op_i_Q == 6'h06)) || (s_op_i_Q == 6'h03)) || (s_op_i_Q == 6'h07)) || (s_op_i_Q == 6'h0a)) || (s_op_i_Q == 6'h00)) || (s_op_i_Q == 6'h01)) || (s_op_i_Q == 6'h02));
    assign codasip_tmp_var_0 = (s_ready_Q & s_is_fpu_op_B0);
    assign codasip_tmp_var_1 = codasip_tmp_var_0 ? (s_rm_i_Q == 3'h7) : 1'b0;
    assign codasip_tmp_var_2 = codasip_tmp_var_1 ? ((((s_frm_i_Q == 3'h6) || (s_frm_i_Q == 3'h5)) || (s_frm_i_Q == 3'h7)) && use_rm_B0) : 1'b0;
    assign invalid_round_B0 = codasip_tmp_var_2 ? 1'b1 : 1'b0;
    assign sqrt_div_unit_exc_B0 = (((r_exc_stall_Q | r_exc_en_Q) & ((s_exc_op_wait_Q == 6'h06) || (s_exc_op_wait_Q == 6'h03))) | (invalid_round_B0 & ((s_op_i_Q == 6'h06) || (s_op_i_Q == 6'h03))));
    assign stall_sqrt_div_unit_B0 = (((((r_fpu_op_Q == 6'h06) || (r_fpu_op_Q == 6'h03)) & r_is_fpu_op_Q) && (~sqrt_div_ready_Q)) && (~sqrt_div_unit_exc_B0));
    assign use_three_op_B0 = (((((s_op_i_Q == 6'h07) || (s_op_i_Q == 6'h0a)) || (s_op_i_Q == 6'h09)) || (s_op_i_Q == 6'h08)) || (((((r_fpu_op_Q == 6'h07) || (r_fpu_op_Q == 6'h0a)) || (r_fpu_op_Q == 6'h09)) || (r_fpu_op_Q == 6'h08)) && (r_stall_fwd_Q & r_is_fpu_op_Q)));
    assign use_two_op_B0 = ((((((((((((((s_op_i_Q == 6'h00) || (s_op_i_Q == 6'h01)) || (s_op_i_Q == 6'h02)) || (s_op_i_Q == 6'h03)) || (s_op_i_Q == 6'h1c)) || (s_op_i_Q == 6'h1d)) || (s_op_i_Q == 6'h1e)) || (s_op_i_Q == 6'h04)) || (s_op_i_Q == 6'h05)) || (s_op_i_Q == 6'h19)) || (s_op_i_Q == 6'h1a)) || (s_op_i_Q == 6'h1b)) || (((((((((((((r_fpu_op_Q == 6'h00) || (r_fpu_op_Q == 6'h01)) || (r_fpu_op_Q == 6'h02)) || (r_fpu_op_Q == 6'h03)) || (r_fpu_op_Q == 6'h1c)) || (r_fpu_op_Q == 6'h1d)) || (r_fpu_op_Q == 6'h1e)) || (r_fpu_op_Q == 6'h04)) || (r_fpu_op_Q == 6'h05)) || (r_fpu_op_Q == 6'h19)) || (r_fpu_op_Q == 6'h1a)) || (r_fpu_op_Q == 6'h1b)) && (r_stall_fwd_Q & r_is_fpu_op_Q))) || use_three_op_B0);
    assign record_opA_wait_B0 = ((r_fpu_s1_addr_Q[5]) ? ((((((((((((((((((((((((((((((((r_record_f_addr0_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h00)}}) | (r_record_f_addr1_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h01)}})) | (r_record_f_addr2_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h02)}})) | (r_record_f_addr3_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h03)}})) | (r_record_f_addr4_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h04)}})) | (r_record_f_addr5_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h05)}})) | (r_record_f_addr6_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h06)}})) | (r_record_f_addr7_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h07)}})) | (r_record_f_addr8_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h08)}})) | (r_record_f_addr9_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h09)}})) | (r_record_f_addr10_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h0a)}})) | (r_record_f_addr11_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h0b)}})) | (r_record_f_addr12_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h0c)}})) | (r_record_f_addr13_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h0d)}})) | (r_record_f_addr14_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h0e)}})) | (r_record_f_addr15_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h0f)}})) | (r_record_f_addr16_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h10)}})) | (r_record_f_addr17_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h11)}})) | (r_record_f_addr18_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h12)}})) | (r_record_f_addr19_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h13)}})) | (r_record_f_addr20_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h14)}})) | (r_record_f_addr21_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h15)}})) | (r_record_f_addr22_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h16)}})) | (r_record_f_addr23_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h17)}})) | (r_record_f_addr24_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h18)}})) | (r_record_f_addr25_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h19)}})) | (r_record_f_addr26_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h1a)}})) | (r_record_f_addr27_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h1b)}})) | (r_record_f_addr28_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h1c)}})) | (r_record_f_addr29_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h1d)}})) | (r_record_f_addr30_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h1e)}})) | (r_record_f_addr31_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h1f)}})) : (((((((((((((((((((((((((((((((r_record_x_addr1_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h01)}}) | (r_record_x_addr2_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h02)}})) | (r_record_x_addr3_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h03)}})) | (r_record_x_addr4_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h04)}})) | (r_record_x_addr5_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h05)}})) | (r_record_x_addr6_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h06)}})) | (r_record_x_addr7_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h07)}})) | (r_record_x_addr8_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h08)}})) | (r_record_x_addr9_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h09)}})) | (r_record_x_addr10_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h0a)}})) | (r_record_x_addr11_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h0b)}})) | (r_record_x_addr12_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h0c)}})) | (r_record_x_addr13_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h0d)}})) | (r_record_x_addr14_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h0e)}})) | (r_record_x_addr15_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h0f)}})) | (r_record_x_addr16_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h10)}})) | (r_record_x_addr17_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h11)}})) | (r_record_x_addr18_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h12)}})) | (r_record_x_addr19_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h13)}})) | (r_record_x_addr20_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h14)}})) | (r_record_x_addr21_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h15)}})) | (r_record_x_addr22_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h16)}})) | (r_record_x_addr23_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h17)}})) | (r_record_x_addr24_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h18)}})) | (r_record_x_addr25_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h19)}})) | (r_record_x_addr26_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h1a)}})) | (r_record_x_addr27_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h1b)}})) | (r_record_x_addr28_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h1c)}})) | (r_record_x_addr29_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h1d)}})) | (r_record_x_addr30_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h1e)}})) | (r_record_x_addr31_Q & {32'd6{(r_fpu_s1_addr_Q[4:0] == 5'h1f)}})));
    assign record_opB_wait_B0 = ((use_two_op_B0) ? ((r_fpu_s2_addr_Q[5]) ? ((((((((((((((((((((((((((((((((r_record_f_addr0_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h00)}}) | (r_record_f_addr1_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h01)}})) | (r_record_f_addr2_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h02)}})) | (r_record_f_addr3_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h03)}})) | (r_record_f_addr4_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h04)}})) | (r_record_f_addr5_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h05)}})) | (r_record_f_addr6_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h06)}})) | (r_record_f_addr7_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h07)}})) | (r_record_f_addr8_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h08)}})) | (r_record_f_addr9_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h09)}})) | (r_record_f_addr10_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h0a)}})) | (r_record_f_addr11_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h0b)}})) | (r_record_f_addr12_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h0c)}})) | (r_record_f_addr13_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h0d)}})) | (r_record_f_addr14_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h0e)}})) | (r_record_f_addr15_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h0f)}})) | (r_record_f_addr16_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h10)}})) | (r_record_f_addr17_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h11)}})) | (r_record_f_addr18_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h12)}})) | (r_record_f_addr19_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h13)}})) | (r_record_f_addr20_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h14)}})) | (r_record_f_addr21_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h15)}})) | (r_record_f_addr22_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h16)}})) | (r_record_f_addr23_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h17)}})) | (r_record_f_addr24_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h18)}})) | (r_record_f_addr25_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h19)}})) | (r_record_f_addr26_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h1a)}})) | (r_record_f_addr27_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h1b)}})) | (r_record_f_addr28_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h1c)}})) | (r_record_f_addr29_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h1d)}})) | (r_record_f_addr30_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h1e)}})) | (r_record_f_addr31_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h1f)}})) : (((((((((((((((((((((((((((((((r_record_x_addr1_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h01)}}) | (r_record_x_addr2_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h02)}})) | (r_record_x_addr3_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h03)}})) | (r_record_x_addr4_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h04)}})) | (r_record_x_addr5_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h05)}})) | (r_record_x_addr6_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h06)}})) | (r_record_x_addr7_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h07)}})) | (r_record_x_addr8_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h08)}})) | (r_record_x_addr9_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h09)}})) | (r_record_x_addr10_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h0a)}})) | (r_record_x_addr11_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h0b)}})) | (r_record_x_addr12_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h0c)}})) | (r_record_x_addr13_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h0d)}})) | (r_record_x_addr14_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h0e)}})) | (r_record_x_addr15_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h0f)}})) | (r_record_x_addr16_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h10)}})) | (r_record_x_addr17_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h11)}})) | (r_record_x_addr18_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h12)}})) | (r_record_x_addr19_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h13)}})) | (r_record_x_addr20_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h14)}})) | (r_record_x_addr21_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h15)}})) | (r_record_x_addr22_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h16)}})) | (r_record_x_addr23_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h17)}})) | (r_record_x_addr24_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h18)}})) | (r_record_x_addr25_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h19)}})) | (r_record_x_addr26_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h1a)}})) | (r_record_x_addr27_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h1b)}})) | (r_record_x_addr28_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h1c)}})) | (r_record_x_addr29_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h1d)}})) | (r_record_x_addr30_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h1e)}})) | (r_record_x_addr31_Q & {32'd6{(r_fpu_s2_addr_Q[4:0] == 5'h1f)}}))) : 6'h00);
    assign record_opC_wait_B0 = ((use_three_op_B0) ? ((r_fpu_s3_addr_Q[5]) ? ((((((((((((((((((((((((((((((((r_record_f_addr0_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h00)}}) | (r_record_f_addr1_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h01)}})) | (r_record_f_addr2_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h02)}})) | (r_record_f_addr3_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h03)}})) | (r_record_f_addr4_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h04)}})) | (r_record_f_addr5_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h05)}})) | (r_record_f_addr6_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h06)}})) | (r_record_f_addr7_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h07)}})) | (r_record_f_addr8_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h08)}})) | (r_record_f_addr9_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h09)}})) | (r_record_f_addr10_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h0a)}})) | (r_record_f_addr11_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h0b)}})) | (r_record_f_addr12_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h0c)}})) | (r_record_f_addr13_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h0d)}})) | (r_record_f_addr14_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h0e)}})) | (r_record_f_addr15_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h0f)}})) | (r_record_f_addr16_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h10)}})) | (r_record_f_addr17_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h11)}})) | (r_record_f_addr18_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h12)}})) | (r_record_f_addr19_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h13)}})) | (r_record_f_addr20_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h14)}})) | (r_record_f_addr21_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h15)}})) | (r_record_f_addr22_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h16)}})) | (r_record_f_addr23_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h17)}})) | (r_record_f_addr24_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h18)}})) | (r_record_f_addr25_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h19)}})) | (r_record_f_addr26_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h1a)}})) | (r_record_f_addr27_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h1b)}})) | (r_record_f_addr28_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h1c)}})) | (r_record_f_addr29_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h1d)}})) | (r_record_f_addr30_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h1e)}})) | (r_record_f_addr31_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h1f)}})) : (((((((((((((((((((((((((((((((r_record_x_addr1_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h01)}}) | (r_record_x_addr2_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h02)}})) | (r_record_x_addr3_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h03)}})) | (r_record_x_addr4_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h04)}})) | (r_record_x_addr5_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h05)}})) | (r_record_x_addr6_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h06)}})) | (r_record_x_addr7_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h07)}})) | (r_record_x_addr8_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h08)}})) | (r_record_x_addr9_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h09)}})) | (r_record_x_addr10_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h0a)}})) | (r_record_x_addr11_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h0b)}})) | (r_record_x_addr12_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h0c)}})) | (r_record_x_addr13_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h0d)}})) | (r_record_x_addr14_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h0e)}})) | (r_record_x_addr15_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h0f)}})) | (r_record_x_addr16_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h10)}})) | (r_record_x_addr17_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h11)}})) | (r_record_x_addr18_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h12)}})) | (r_record_x_addr19_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h13)}})) | (r_record_x_addr20_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h14)}})) | (r_record_x_addr21_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h15)}})) | (r_record_x_addr22_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h16)}})) | (r_record_x_addr23_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h17)}})) | (r_record_x_addr24_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h18)}})) | (r_record_x_addr25_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h19)}})) | (r_record_x_addr26_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h1a)}})) | (r_record_x_addr27_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h1b)}})) | (r_record_x_addr28_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h1c)}})) | (r_record_x_addr29_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h1d)}})) | (r_record_x_addr30_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h1e)}})) | (r_record_x_addr31_Q & {32'd6{(r_fpu_s3_addr_Q[4:0] == 5'h1f)}}))) : 6'h00);
    assign record_opA_B0 = ((s_s1_addr_i_Q[5]) ? ((((((((((((((((((((((((((((((((r_record_f_addr0_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h00)}}) | (r_record_f_addr1_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h01)}})) | (r_record_f_addr2_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h02)}})) | (r_record_f_addr3_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h03)}})) | (r_record_f_addr4_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h04)}})) | (r_record_f_addr5_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h05)}})) | (r_record_f_addr6_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h06)}})) | (r_record_f_addr7_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h07)}})) | (r_record_f_addr8_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h08)}})) | (r_record_f_addr9_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h09)}})) | (r_record_f_addr10_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h0a)}})) | (r_record_f_addr11_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h0b)}})) | (r_record_f_addr12_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h0c)}})) | (r_record_f_addr13_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h0d)}})) | (r_record_f_addr14_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h0e)}})) | (r_record_f_addr15_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h0f)}})) | (r_record_f_addr16_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h10)}})) | (r_record_f_addr17_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h11)}})) | (r_record_f_addr18_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h12)}})) | (r_record_f_addr19_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h13)}})) | (r_record_f_addr20_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h14)}})) | (r_record_f_addr21_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h15)}})) | (r_record_f_addr22_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h16)}})) | (r_record_f_addr23_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h17)}})) | (r_record_f_addr24_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h18)}})) | (r_record_f_addr25_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h19)}})) | (r_record_f_addr26_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h1a)}})) | (r_record_f_addr27_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h1b)}})) | (r_record_f_addr28_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h1c)}})) | (r_record_f_addr29_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h1d)}})) | (r_record_f_addr30_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h1e)}})) | (r_record_f_addr31_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h1f)}})) : (((((((((((((((((((((((((((((((r_record_x_addr1_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h01)}}) | (r_record_x_addr2_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h02)}})) | (r_record_x_addr3_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h03)}})) | (r_record_x_addr4_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h04)}})) | (r_record_x_addr5_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h05)}})) | (r_record_x_addr6_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h06)}})) | (r_record_x_addr7_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h07)}})) | (r_record_x_addr8_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h08)}})) | (r_record_x_addr9_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h09)}})) | (r_record_x_addr10_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h0a)}})) | (r_record_x_addr11_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h0b)}})) | (r_record_x_addr12_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h0c)}})) | (r_record_x_addr13_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h0d)}})) | (r_record_x_addr14_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h0e)}})) | (r_record_x_addr15_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h0f)}})) | (r_record_x_addr16_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h10)}})) | (r_record_x_addr17_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h11)}})) | (r_record_x_addr18_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h12)}})) | (r_record_x_addr19_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h13)}})) | (r_record_x_addr20_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h14)}})) | (r_record_x_addr21_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h15)}})) | (r_record_x_addr22_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h16)}})) | (r_record_x_addr23_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h17)}})) | (r_record_x_addr24_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h18)}})) | (r_record_x_addr25_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h19)}})) | (r_record_x_addr26_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h1a)}})) | (r_record_x_addr27_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h1b)}})) | (r_record_x_addr28_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h1c)}})) | (r_record_x_addr29_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h1d)}})) | (r_record_x_addr30_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h1e)}})) | (r_record_x_addr31_Q & {32'd6{(s_s1_addr_i_Q[4:0] == 5'h1f)}})));
    assign record_opB_B0 = ((s_s2_addr_i_Q[5]) ? ((((((((((((((((((((((((((((((((r_record_f_addr0_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h00)}}) | (r_record_f_addr1_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h01)}})) | (r_record_f_addr2_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h02)}})) | (r_record_f_addr3_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h03)}})) | (r_record_f_addr4_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h04)}})) | (r_record_f_addr5_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h05)}})) | (r_record_f_addr6_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h06)}})) | (r_record_f_addr7_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h07)}})) | (r_record_f_addr8_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h08)}})) | (r_record_f_addr9_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h09)}})) | (r_record_f_addr10_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h0a)}})) | (r_record_f_addr11_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h0b)}})) | (r_record_f_addr12_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h0c)}})) | (r_record_f_addr13_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h0d)}})) | (r_record_f_addr14_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h0e)}})) | (r_record_f_addr15_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h0f)}})) | (r_record_f_addr16_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h10)}})) | (r_record_f_addr17_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h11)}})) | (r_record_f_addr18_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h12)}})) | (r_record_f_addr19_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h13)}})) | (r_record_f_addr20_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h14)}})) | (r_record_f_addr21_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h15)}})) | (r_record_f_addr22_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h16)}})) | (r_record_f_addr23_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h17)}})) | (r_record_f_addr24_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h18)}})) | (r_record_f_addr25_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h19)}})) | (r_record_f_addr26_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h1a)}})) | (r_record_f_addr27_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h1b)}})) | (r_record_f_addr28_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h1c)}})) | (r_record_f_addr29_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h1d)}})) | (r_record_f_addr30_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h1e)}})) | (r_record_f_addr31_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h1f)}})) : (((((((((((((((((((((((((((((((r_record_x_addr1_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h01)}}) | (r_record_x_addr2_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h02)}})) | (r_record_x_addr3_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h03)}})) | (r_record_x_addr4_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h04)}})) | (r_record_x_addr5_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h05)}})) | (r_record_x_addr6_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h06)}})) | (r_record_x_addr7_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h07)}})) | (r_record_x_addr8_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h08)}})) | (r_record_x_addr9_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h09)}})) | (r_record_x_addr10_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h0a)}})) | (r_record_x_addr11_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h0b)}})) | (r_record_x_addr12_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h0c)}})) | (r_record_x_addr13_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h0d)}})) | (r_record_x_addr14_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h0e)}})) | (r_record_x_addr15_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h0f)}})) | (r_record_x_addr16_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h10)}})) | (r_record_x_addr17_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h11)}})) | (r_record_x_addr18_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h12)}})) | (r_record_x_addr19_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h13)}})) | (r_record_x_addr20_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h14)}})) | (r_record_x_addr21_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h15)}})) | (r_record_x_addr22_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h16)}})) | (r_record_x_addr23_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h17)}})) | (r_record_x_addr24_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h18)}})) | (r_record_x_addr25_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h19)}})) | (r_record_x_addr26_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h1a)}})) | (r_record_x_addr27_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h1b)}})) | (r_record_x_addr28_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h1c)}})) | (r_record_x_addr29_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h1d)}})) | (r_record_x_addr30_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h1e)}})) | (r_record_x_addr31_Q & {32'd6{(s_s2_addr_i_Q[4:0] == 5'h1f)}})));
    assign record_opC_B0 = ((s_s3_addr_i_Q[5]) ? ((((((((((((((((((((((((((((((((r_record_f_addr0_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h00)}}) | (r_record_f_addr1_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h01)}})) | (r_record_f_addr2_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h02)}})) | (r_record_f_addr3_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h03)}})) | (r_record_f_addr4_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h04)}})) | (r_record_f_addr5_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h05)}})) | (r_record_f_addr6_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h06)}})) | (r_record_f_addr7_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h07)}})) | (r_record_f_addr8_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h08)}})) | (r_record_f_addr9_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h09)}})) | (r_record_f_addr10_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h0a)}})) | (r_record_f_addr11_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h0b)}})) | (r_record_f_addr12_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h0c)}})) | (r_record_f_addr13_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h0d)}})) | (r_record_f_addr14_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h0e)}})) | (r_record_f_addr15_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h0f)}})) | (r_record_f_addr16_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h10)}})) | (r_record_f_addr17_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h11)}})) | (r_record_f_addr18_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h12)}})) | (r_record_f_addr19_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h13)}})) | (r_record_f_addr20_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h14)}})) | (r_record_f_addr21_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h15)}})) | (r_record_f_addr22_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h16)}})) | (r_record_f_addr23_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h17)}})) | (r_record_f_addr24_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h18)}})) | (r_record_f_addr25_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h19)}})) | (r_record_f_addr26_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h1a)}})) | (r_record_f_addr27_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h1b)}})) | (r_record_f_addr28_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h1c)}})) | (r_record_f_addr29_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h1d)}})) | (r_record_f_addr30_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h1e)}})) | (r_record_f_addr31_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h1f)}})) : (((((((((((((((((((((((((((((((r_record_x_addr1_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h01)}}) | (r_record_x_addr2_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h02)}})) | (r_record_x_addr3_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h03)}})) | (r_record_x_addr4_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h04)}})) | (r_record_x_addr5_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h05)}})) | (r_record_x_addr6_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h06)}})) | (r_record_x_addr7_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h07)}})) | (r_record_x_addr8_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h08)}})) | (r_record_x_addr9_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h09)}})) | (r_record_x_addr10_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h0a)}})) | (r_record_x_addr11_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h0b)}})) | (r_record_x_addr12_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h0c)}})) | (r_record_x_addr13_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h0d)}})) | (r_record_x_addr14_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h0e)}})) | (r_record_x_addr15_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h0f)}})) | (r_record_x_addr16_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h10)}})) | (r_record_x_addr17_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h11)}})) | (r_record_x_addr18_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h12)}})) | (r_record_x_addr19_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h13)}})) | (r_record_x_addr20_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h14)}})) | (r_record_x_addr21_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h15)}})) | (r_record_x_addr22_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h16)}})) | (r_record_x_addr23_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h17)}})) | (r_record_x_addr24_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h18)}})) | (r_record_x_addr25_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h19)}})) | (r_record_x_addr26_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h1a)}})) | (r_record_x_addr27_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h1b)}})) | (r_record_x_addr28_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h1c)}})) | (r_record_x_addr29_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h1d)}})) | (r_record_x_addr30_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h1e)}})) | (r_record_x_addr31_Q & {32'd6{(s_s3_addr_i_Q[4:0] == 5'h1f)}})));
    assign opA_ROB_ptr_B0 = record_opA_B0[4:0];
    assign opB_ROB_ptr_B0 = record_opB_B0[4:0];
    assign opC_ROB_ptr_B0 = record_opC_B0[4:0];
    assign opA_ROB_valid_B0 = ((record_opA_B0[5] & s_ready_Q) & s_is_fpu_op_B0);
    assign opB_ROB_valid_B0 = ((record_opB_B0[5] & s_ready_Q) & s_is_fpu_op_B0);
    assign opC_ROB_valid_B0 = ((record_opC_B0[5] & s_ready_Q) & s_is_fpu_op_B0);
    assign opA_ROB_ptr_wait_B0 = record_opA_wait_B0[4:0];
    assign opB_ROB_ptr_wait_B0 = record_opB_wait_B0[4:0];
    assign opC_ROB_ptr_wait_B0 = record_opC_wait_B0[4:0];
    assign codasip_tmp_var_3 = r_stall_fwd_Q;
    assign opA_ROB_valid_wait_B0 = codasip_tmp_var_3 ? record_opA_wait_B0[5] : 1'b0;
    assign opB_ROB_valid_wait_B0 = codasip_tmp_var_3 ? record_opB_wait_B0[5] : 1'b0;
    assign opC_ROB_valid_wait_B0 = codasip_tmp_var_3 ? record_opC_wait_B0[5] : 1'b0;
    assign opA_ROB_done_B0 = (((((r_fpu_ROB_done_Q >> opA_ROB_ptr_B0) & 32'h00000001) & 32'(unsigned'(1'((~r_stall_fwd_Q))))) | (((r_fpu_ROB_done_Q >> opA_ROB_ptr_wait_B0) & 32'h00000001) & 32'(r_stall_fwd_Q))) != 32'h00000000);
    assign opB_ROB_done_B0 = (((((r_fpu_ROB_done_Q >> opB_ROB_ptr_B0) & 32'h00000001) & 32'(unsigned'(1'((~r_stall_fwd_Q))))) | (((r_fpu_ROB_done_Q >> opB_ROB_ptr_wait_B0) & 32'h00000001) & 32'(r_stall_fwd_Q))) != 32'h00000000);
    assign opC_ROB_done_B0 = (((((r_fpu_ROB_done_Q >> opC_ROB_ptr_B0) & 32'h00000001) & 32'(unsigned'(1'((~r_stall_fwd_Q))))) | (((r_fpu_ROB_done_Q >> opC_ROB_ptr_wait_B0) & 32'h00000001) & 32'(r_stall_fwd_Q))) != 32'h00000000);
    assign stall_fwd_A_B0 = ((opA_ROB_valid_B0 | opA_ROB_valid_wait_B0) & (~opA_ROB_done_B0));
    assign stall_fwd_B_B0 = (((opB_ROB_valid_B0 | opB_ROB_valid_wait_B0) & (~opB_ROB_done_B0)) && use_two_op_B0);
    assign stall_fwd_C_B0 = (((opC_ROB_valid_B0 | opC_ROB_valid_wait_B0) & (~opC_ROB_done_B0)) && use_three_op_B0);
    assign op_mul_B0 = (s_op_i_Q == 6'h02);
    assign op_classify_B0 = (s_op_i_Q == 6'h1f);
    assign op_add_sub_B0 = ((s_op_i_Q == 6'h00) || (s_op_i_Q == 6'h01));
    assign op_max_min_B0 = ((s_op_i_Q == 6'h04) || (s_op_i_Q == 6'h05));
    assign op_sqrt_div_B0 = ((s_op_i_Q == 6'h06) || (s_op_i_Q == 6'h03));
    assign op_cmp_B0 = (((s_op_i_Q == 6'h1c) || (s_op_i_Q == 6'h1d)) || (s_op_i_Q == 6'h1e));
    assign op_sgnj_B0 = (((s_op_i_Q == 6'h19) || (s_op_i_Q == 6'h1a)) || (s_op_i_Q == 6'h1b));
    assign op_fused_B0 = ((((s_op_i_Q == 6'h07) || (s_op_i_Q == 6'h0a)) || (s_op_i_Q == 6'h09)) || (s_op_i_Q == 6'h08));
    assign op_move_B0 = ((s_op_i_Q == 6'h18) || (s_op_i_Q == 6'h17));
    assign op_f2i_B0 = ((s_op_i_Q == 6'h0d) || (s_op_i_Q == 6'h0b));
    assign op_i2f_B0 = ((s_op_i_Q == 6'h0c) || (s_op_i_Q == 6'h0e));
    assign stall_fwd_B0 = (((stall_fwd_A_B0 | stall_fwd_B_B0) | stall_fwd_C_B0) & (~invalid_round_B0));
    assign full_sqrt_div_stall_B0 = ((((~sqrt_div_ready_Q) && (op_sqrt_div_B0 | (r_is_fpu_op_Q & ((r_fpu_op_Q == 6'h06) || (r_fpu_op_Q == 6'h03))))) | (r_start_sqrt_div_Q & op_sqrt_div_B0)) & (~sqrt_div_unit_exc_B0));
    assign full_add_sub_stall_B0 = ((~add_sub_ready_Q) & op_add_sub_B0);
    assign full_i2f_stall_B0 = ((~i2f_ready_Q) & op_i2f_B0);
    assign full_f2i_stall_B0 = ((~f2i_ready_Q) & op_f2i_B0);
    assign unit_stall_B0 = (((full_add_sub_stall_B0 | full_i2f_stall_B0) | full_f2i_stall_B0) | full_sqrt_div_stall_B0);
    assign codasip_tmp_var_4 = s_flush_i_Q;
    assign codasip_tmp_var_5 = (!codasip_tmp_var_4) ? s_stall_control_B0 : 1'b0;
    assign codasip_tmp_var_6 = ((((s_ready_Q & (~unit_stall_B0)) && (!s_flush_i_Q)) && (!stall_fwd_B0)) & s_is_fpu_op_B0);
    assign codasip_tmp_var_7 = (!codasip_tmp_var_6) ? (((r_is_fpu_op_Q & (((~stall_fwd_B0) & r_stall_fwd_Q) | (((s_full_port_Q | (r_unit_stall_Q & (~s_ROB_full_Q))) & (~r_exc_en_Q)) & (~r_stall_fwd_Q)))) & (~unit_stall_B0)) & (~r_exc_stall_Q)) : 1'b0;
    assign start_add_sub_B0 = codasip_tmp_var_6 ? op_add_sub_B0 :
        codasip_tmp_var_7 ? ((r_fpu_op_Q == 6'h00) || (r_fpu_op_Q == 6'h01)) : 1'b0;
    assign start_mul_B0 = codasip_tmp_var_6 ? op_mul_B0 :
        codasip_tmp_var_7 ? (r_fpu_op_Q == 6'h02) : 1'b0;
    assign start_classify_B0 = codasip_tmp_var_6 ? op_classify_B0 :
        codasip_tmp_var_7 ? (r_fpu_op_Q == 6'h1f) : 1'b0;
    assign start_cmp_B0 = codasip_tmp_var_6 ? op_cmp_B0 :
        codasip_tmp_var_7 ? (((r_fpu_op_Q == 6'h1c) || (r_fpu_op_Q == 6'h1d)) || (r_fpu_op_Q == 6'h1e)) : 1'b0;
    assign start_max_min_B0 = codasip_tmp_var_6 ? op_max_min_B0 :
        codasip_tmp_var_7 ? ((r_fpu_op_Q == 6'h04) || (r_fpu_op_Q == 6'h05)) : 1'b0;
    assign start_sgnj_B0 = codasip_tmp_var_6 ? op_sgnj_B0 :
        codasip_tmp_var_7 ? (((r_fpu_op_Q == 6'h19) || (r_fpu_op_Q == 6'h1a)) || (r_fpu_op_Q == 6'h1b)) : 1'b0;
    assign start_fused_B0 = codasip_tmp_var_6 ? op_fused_B0 :
        codasip_tmp_var_7 ? ((((r_fpu_op_Q == 6'h07) || (r_fpu_op_Q == 6'h0a)) || (r_fpu_op_Q == 6'h09)) || (r_fpu_op_Q == 6'h08)) : 1'b0;
    assign start_sqrt_div_B0 = codasip_tmp_var_6 ? ((op_sqrt_div_B0 & (~r_start_sqrt_div_Q)) & (~sqrt_div_busy_Q)) :
        codasip_tmp_var_7 ? ((r_fpu_op_Q == 6'h06) || (r_fpu_op_Q == 6'h03)) : 1'b0;
    assign start_f2i_B0 = codasip_tmp_var_6 ? op_f2i_B0 :
        codasip_tmp_var_7 ? ((r_fpu_op_Q == 6'h0d) || (r_fpu_op_Q == 6'h0b)) : 1'b0;
    assign start_i2f_B0 = codasip_tmp_var_6 ? op_i2f_B0 :
        codasip_tmp_var_7 ? ((r_fpu_op_Q == 6'h0c) || (r_fpu_op_Q == 6'h0e)) : 1'b0;
    assign start_move_B0 = codasip_tmp_var_6 ? op_move_B0 :
        codasip_tmp_var_7 ? ((r_fpu_op_Q == 6'h18) || (r_fpu_op_Q == 6'h17)) : 1'b0;
    assign units_start_vector_B0 = {r_start_add_sub_Q, r_start_mul_Q, r_start_classify_Q, r_start_cmp_Q, r_start_max_min_Q, r_start_f2i_Q, r_start_i2f_Q, r_start_move_Q, r_start_sgnj_Q, r_start_fused_Q, r_start_sqrt_div_Q};
    assign opA_ROB_data_B0 = ((r_stall_fwd_Q) ? ((((((((((((((((((((((((((((((((r_rob_part2_item0_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h00)}}) | (r_rob_part2_item1_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h01)}})) | (r_rob_part2_item2_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h02)}})) | (r_rob_part2_item3_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h03)}})) | (r_rob_part2_item4_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h04)}})) | (r_rob_part2_item5_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h05)}})) | (r_rob_part2_item6_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h06)}})) | (r_rob_part2_item7_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h07)}})) | (r_rob_part2_item8_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h08)}})) | (r_rob_part2_item9_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h09)}})) | (r_rob_part2_item10_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h0a)}})) | (r_rob_part2_item11_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h0b)}})) | (r_rob_part2_item12_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h0c)}})) | (r_rob_part2_item13_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h0d)}})) | (r_rob_part2_item14_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h0e)}})) | (r_rob_part2_item15_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h0f)}})) | (r_rob_part2_item16_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h10)}})) | (r_rob_part2_item17_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h11)}})) | (r_rob_part2_item18_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h12)}})) | (r_rob_part2_item19_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h13)}})) | (r_rob_part2_item20_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h14)}})) | (r_rob_part2_item21_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h15)}})) | (r_rob_part2_item22_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h16)}})) | (r_rob_part2_item23_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h17)}})) | (r_rob_part2_item24_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h18)}})) | (r_rob_part2_item25_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h19)}})) | (r_rob_part2_item26_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h1a)}})) | (r_rob_part2_item27_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h1b)}})) | (r_rob_part2_item28_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h1c)}})) | (r_rob_part2_item29_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h1d)}})) | (r_rob_part2_item30_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h1e)}})) | (r_rob_part2_item31_Q & {32'd32{(opA_ROB_ptr_wait_B0 == 5'h1f)}})) : ((((((((((((((((((((((((((((((((r_rob_part2_item0_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h00)}}) | (r_rob_part2_item1_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h01)}})) | (r_rob_part2_item2_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h02)}})) | (r_rob_part2_item3_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h03)}})) | (r_rob_part2_item4_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h04)}})) | (r_rob_part2_item5_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h05)}})) | (r_rob_part2_item6_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h06)}})) | (r_rob_part2_item7_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h07)}})) | (r_rob_part2_item8_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h08)}})) | (r_rob_part2_item9_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h09)}})) | (r_rob_part2_item10_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h0a)}})) | (r_rob_part2_item11_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h0b)}})) | (r_rob_part2_item12_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h0c)}})) | (r_rob_part2_item13_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h0d)}})) | (r_rob_part2_item14_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h0e)}})) | (r_rob_part2_item15_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h0f)}})) | (r_rob_part2_item16_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h10)}})) | (r_rob_part2_item17_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h11)}})) | (r_rob_part2_item18_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h12)}})) | (r_rob_part2_item19_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h13)}})) | (r_rob_part2_item20_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h14)}})) | (r_rob_part2_item21_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h15)}})) | (r_rob_part2_item22_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h16)}})) | (r_rob_part2_item23_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h17)}})) | (r_rob_part2_item24_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h18)}})) | (r_rob_part2_item25_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h19)}})) | (r_rob_part2_item26_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h1a)}})) | (r_rob_part2_item27_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h1b)}})) | (r_rob_part2_item28_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h1c)}})) | (r_rob_part2_item29_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h1d)}})) | (r_rob_part2_item30_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h1e)}})) | (r_rob_part2_item31_Q & {32'd32{(opA_ROB_ptr_B0 == 5'h1f)}})));
    assign opB_ROB_data_B0 = ((r_stall_fwd_Q) ? ((((((((((((((((((((((((((((((((r_rob_part2_item0_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h00)}}) | (r_rob_part2_item1_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h01)}})) | (r_rob_part2_item2_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h02)}})) | (r_rob_part2_item3_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h03)}})) | (r_rob_part2_item4_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h04)}})) | (r_rob_part2_item5_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h05)}})) | (r_rob_part2_item6_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h06)}})) | (r_rob_part2_item7_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h07)}})) | (r_rob_part2_item8_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h08)}})) | (r_rob_part2_item9_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h09)}})) | (r_rob_part2_item10_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h0a)}})) | (r_rob_part2_item11_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h0b)}})) | (r_rob_part2_item12_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h0c)}})) | (r_rob_part2_item13_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h0d)}})) | (r_rob_part2_item14_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h0e)}})) | (r_rob_part2_item15_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h0f)}})) | (r_rob_part2_item16_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h10)}})) | (r_rob_part2_item17_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h11)}})) | (r_rob_part2_item18_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h12)}})) | (r_rob_part2_item19_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h13)}})) | (r_rob_part2_item20_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h14)}})) | (r_rob_part2_item21_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h15)}})) | (r_rob_part2_item22_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h16)}})) | (r_rob_part2_item23_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h17)}})) | (r_rob_part2_item24_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h18)}})) | (r_rob_part2_item25_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h19)}})) | (r_rob_part2_item26_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h1a)}})) | (r_rob_part2_item27_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h1b)}})) | (r_rob_part2_item28_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h1c)}})) | (r_rob_part2_item29_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h1d)}})) | (r_rob_part2_item30_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h1e)}})) | (r_rob_part2_item31_Q & {32'd32{(opB_ROB_ptr_wait_B0 == 5'h1f)}})) : ((((((((((((((((((((((((((((((((r_rob_part2_item0_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h00)}}) | (r_rob_part2_item1_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h01)}})) | (r_rob_part2_item2_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h02)}})) | (r_rob_part2_item3_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h03)}})) | (r_rob_part2_item4_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h04)}})) | (r_rob_part2_item5_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h05)}})) | (r_rob_part2_item6_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h06)}})) | (r_rob_part2_item7_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h07)}})) | (r_rob_part2_item8_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h08)}})) | (r_rob_part2_item9_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h09)}})) | (r_rob_part2_item10_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h0a)}})) | (r_rob_part2_item11_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h0b)}})) | (r_rob_part2_item12_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h0c)}})) | (r_rob_part2_item13_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h0d)}})) | (r_rob_part2_item14_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h0e)}})) | (r_rob_part2_item15_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h0f)}})) | (r_rob_part2_item16_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h10)}})) | (r_rob_part2_item17_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h11)}})) | (r_rob_part2_item18_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h12)}})) | (r_rob_part2_item19_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h13)}})) | (r_rob_part2_item20_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h14)}})) | (r_rob_part2_item21_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h15)}})) | (r_rob_part2_item22_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h16)}})) | (r_rob_part2_item23_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h17)}})) | (r_rob_part2_item24_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h18)}})) | (r_rob_part2_item25_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h19)}})) | (r_rob_part2_item26_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h1a)}})) | (r_rob_part2_item27_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h1b)}})) | (r_rob_part2_item28_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h1c)}})) | (r_rob_part2_item29_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h1d)}})) | (r_rob_part2_item30_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h1e)}})) | (r_rob_part2_item31_Q & {32'd32{(opB_ROB_ptr_B0 == 5'h1f)}})));
    assign opC_ROB_data_B0 = ((r_stall_fwd_Q) ? ((((((((((((((((((((((((((((((((r_rob_part2_item0_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h00)}}) | (r_rob_part2_item1_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h01)}})) | (r_rob_part2_item2_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h02)}})) | (r_rob_part2_item3_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h03)}})) | (r_rob_part2_item4_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h04)}})) | (r_rob_part2_item5_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h05)}})) | (r_rob_part2_item6_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h06)}})) | (r_rob_part2_item7_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h07)}})) | (r_rob_part2_item8_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h08)}})) | (r_rob_part2_item9_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h09)}})) | (r_rob_part2_item10_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h0a)}})) | (r_rob_part2_item11_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h0b)}})) | (r_rob_part2_item12_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h0c)}})) | (r_rob_part2_item13_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h0d)}})) | (r_rob_part2_item14_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h0e)}})) | (r_rob_part2_item15_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h0f)}})) | (r_rob_part2_item16_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h10)}})) | (r_rob_part2_item17_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h11)}})) | (r_rob_part2_item18_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h12)}})) | (r_rob_part2_item19_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h13)}})) | (r_rob_part2_item20_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h14)}})) | (r_rob_part2_item21_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h15)}})) | (r_rob_part2_item22_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h16)}})) | (r_rob_part2_item23_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h17)}})) | (r_rob_part2_item24_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h18)}})) | (r_rob_part2_item25_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h19)}})) | (r_rob_part2_item26_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h1a)}})) | (r_rob_part2_item27_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h1b)}})) | (r_rob_part2_item28_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h1c)}})) | (r_rob_part2_item29_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h1d)}})) | (r_rob_part2_item30_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h1e)}})) | (r_rob_part2_item31_Q & {32'd32{(opC_ROB_ptr_wait_B0 == 5'h1f)}})) : ((((((((((((((((((((((((((((((((r_rob_part2_item0_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h00)}}) | (r_rob_part2_item1_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h01)}})) | (r_rob_part2_item2_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h02)}})) | (r_rob_part2_item3_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h03)}})) | (r_rob_part2_item4_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h04)}})) | (r_rob_part2_item5_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h05)}})) | (r_rob_part2_item6_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h06)}})) | (r_rob_part2_item7_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h07)}})) | (r_rob_part2_item8_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h08)}})) | (r_rob_part2_item9_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h09)}})) | (r_rob_part2_item10_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h0a)}})) | (r_rob_part2_item11_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h0b)}})) | (r_rob_part2_item12_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h0c)}})) | (r_rob_part2_item13_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h0d)}})) | (r_rob_part2_item14_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h0e)}})) | (r_rob_part2_item15_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h0f)}})) | (r_rob_part2_item16_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h10)}})) | (r_rob_part2_item17_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h11)}})) | (r_rob_part2_item18_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h12)}})) | (r_rob_part2_item19_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h13)}})) | (r_rob_part2_item20_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h14)}})) | (r_rob_part2_item21_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h15)}})) | (r_rob_part2_item22_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h16)}})) | (r_rob_part2_item23_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h17)}})) | (r_rob_part2_item24_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h18)}})) | (r_rob_part2_item25_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h19)}})) | (r_rob_part2_item26_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h1a)}})) | (r_rob_part2_item27_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h1b)}})) | (r_rob_part2_item28_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h1c)}})) | (r_rob_part2_item29_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h1d)}})) | (r_rob_part2_item30_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h1e)}})) | (r_rob_part2_item31_Q & {32'd32{(opC_ROB_ptr_B0 == 5'h1f)}})));
    assign write_A_B0 = ((opA_ROB_valid_wait_B0 | opA_ROB_valid_B0) && opA_ROB_done_B0);
    assign write_B_B0 = ((opB_ROB_valid_wait_B0 | opB_ROB_valid_B0) && opB_ROB_done_B0);
    assign write_C_B0 = ((opC_ROB_valid_wait_B0 | opC_ROB_valid_B0) && opC_ROB_done_B0);
    assign opA_data_B0 = ((write_A_B0) ? opA_ROB_data_B0 : (((opC_ROB_valid_wait_B0 | opB_ROB_valid_wait_B0)) ? r_fpu_src_A_Q : ((s_ready_Q) ? s_s1_data_i_Q : r_fpu_src_A_Q)));
    assign opB_data_B0 = ((write_B_B0) ? opB_ROB_data_B0 : (((opC_ROB_valid_wait_B0 | opA_ROB_valid_wait_B0)) ? r_fpu_src_B_Q : ((s_ready_Q) ? s_s2_data_i_Q : r_fpu_src_B_Q)));
    assign opC_data_B0 = ((write_C_B0) ? opC_ROB_data_B0 : (((opA_ROB_valid_wait_B0 | opB_ROB_valid_wait_B0)) ? r_fpu_src_C_Q : ((s_ready_Q) ? s_s3_data_i_Q : r_fpu_src_C_Q)));
    assign ROB_ptr_B0 = 5'((((s_new_operation_Q & (!(s_full_port_Q & (!r_exc_en_Q))))) ? (32'(r_fpu_ROB_ptr_Q) + 32'h00000001) : 32'(r_fpu_ROB_ptr_Q)));
    assign codasip_tmp_var_8 = (s_is_fpu_op_B0 | r_is_fpu_op_Q);
    assign codasip_tmp_var_9 = (s_rm_i_Q == 3'h7);
    assign add_record_B0 = ((((((((s_is_fpu_op_B0 & s_ready_Q) | ((~s_ready_Q) & r_is_fpu_op_Q)) & (~stall_fwd_B0)) & (~unit_stall_B0)) & (~s_full_port_Q)) & (~r_exc_stall_Q)) & (~r_exc_en_Q)) & ((~(s_ROB_full_Q & (~r_full_ports_Q))) | (s_ROB_full_Q & r_full_ports_Q)));
    assign sel_dst_addr_B0 = (((((((~stall_fwd_B0) && (r_stall_fwd_Q & r_is_fpu_op_Q)) | ((~unit_stall_B0) && r_unit_stall_Q)) | (s_ROB_full_Q & r_full_ports_Q)) & r_is_fpu_op_Q)) ? r_fpu_dst_addr_Q : s_rd_addr_i_Q);
    assign codasip_tmp_var_10 = r_is_fpu_op_Q;
    assign rob_data_part1_B0 = codasip_tmp_var_10 ? {r_exc_type_Q, r_exc_valid_Q, r_instr_Q, r_instr_addr_Q, r_fpu_dst_addr_Q} : {76{1'b0}};
    assign codasip_tmp_var_11 = codasip_tmp_var_10 ? (5'h00 == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_12 = codasip_tmp_var_10 ? (5'h01 == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_13 = codasip_tmp_var_10 ? (5'h02 == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_14 = codasip_tmp_var_10 ? (5'h03 == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_15 = codasip_tmp_var_10 ? (5'h04 == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_16 = codasip_tmp_var_10 ? (5'h05 == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_17 = codasip_tmp_var_10 ? (5'h06 == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_18 = codasip_tmp_var_10 ? (5'h07 == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_19 = codasip_tmp_var_10 ? (5'h08 == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_20 = codasip_tmp_var_10 ? (5'h09 == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_21 = codasip_tmp_var_10 ? (5'h0a == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_22 = codasip_tmp_var_10 ? (5'h0b == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_23 = codasip_tmp_var_10 ? (5'h0c == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_24 = codasip_tmp_var_10 ? (5'h0d == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_25 = codasip_tmp_var_10 ? (5'h0e == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_26 = codasip_tmp_var_10 ? (5'h0f == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_27 = codasip_tmp_var_10 ? (5'h10 == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_28 = codasip_tmp_var_10 ? (5'h11 == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_29 = codasip_tmp_var_10 ? (5'h12 == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_30 = codasip_tmp_var_10 ? (5'h13 == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_31 = codasip_tmp_var_10 ? (5'h14 == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_32 = codasip_tmp_var_10 ? (5'h15 == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_33 = codasip_tmp_var_10 ? (5'h16 == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_34 = codasip_tmp_var_10 ? (5'h17 == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_35 = codasip_tmp_var_10 ? (5'h18 == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_36 = codasip_tmp_var_10 ? (5'h19 == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_37 = codasip_tmp_var_10 ? (5'h1a == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_38 = codasip_tmp_var_10 ? (5'h1b == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_39 = codasip_tmp_var_10 ? (5'h1c == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_40 = codasip_tmp_var_10 ? (5'h1d == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_41 = codasip_tmp_var_10 ? (5'h1e == r_fpu_ROB_ptr_Q) : 1'b0;
    assign codasip_tmp_var_42 = codasip_tmp_var_10 ? (5'h1f == r_fpu_ROB_ptr_Q) : 1'b0;
    assign add_sub_s_clk_en_i_D = start_add_sub_B0;
    assign control_fpu_CONTROL_CLEAR_D = codasip_tmp_var_4 ? 1'b1 : 1'b0;
    assign control_fpu_CONTROL_STALL_D = codasip_tmp_var_5 ? 1'b1 : 1'b0;
    assign control_fpu_ROB_CLEAR_D = codasip_tmp_var_4 ? 1'b1 : 1'b0;
    assign float2int_s_clk_en_i_D = start_f2i_B0;
    assign fmul_s_clk_en_i_D = (start_mul_B0 | start_fused_B0);
    assign fused_s_clk_en_i_D = start_fused_B0;
    assign int2float_s_clk_en_i_D = start_i2f_B0;
    assign r_busy_D = ((s_busy_o_Q | s_is_fpu_op_B0) | stall_sqrt_div_unit_B0);
    assign r_busy_WE = 1'b1;
    assign r_exc_en_D = invalid_round_B0;
    assign r_exc_en_WE = 1'b1;
    assign r_exc_op_D = s_op_i_Q;
    assign r_exc_op_WE = codasip_tmp_var_2 ? 1'b1 : 1'b0;
    assign r_exc_type_D = s_exc_type_i_Q;
    assign r_exc_type_WE = 1'b1;
    assign r_exc_valid_D = s_exc_valid_i_Q;
    assign r_exc_valid_WE = 1'b1;
    assign r_fpu_dst_addr_D = s_rd_addr_i_Q;
    assign r_fpu_dst_addr_WE = 1'b1;
    assign r_fpu_op_D = ((s_ready_Q) ? s_op_i_Q : 6'h00);
    assign r_fpu_op_WE = 1'b1;
    assign r_fpu_rm_D = codasip_tmp_var_9 ? s_frm_i_Q : s_rm_i_Q;
    assign r_fpu_rm_WE = 1'b1;
    assign r_fpu_ROB_ptr_D = ROB_ptr_B0;
    assign r_fpu_ROB_ptr_WE = 1'b1;
    assign r_fpu_s1_addr_D = s_s1_addr_i_Q;
    assign r_fpu_s1_addr_WE = 1'b1;
    assign r_fpu_s2_addr_D = ((use_two_op_B0) ? s_s2_addr_i_Q : 6'h00);
    assign r_fpu_s2_addr_WE = 1'b1;
    assign r_fpu_s3_addr_D = ((use_three_op_B0) ? s_s3_addr_i_Q : 6'h00);
    assign r_fpu_s3_addr_WE = 1'b1;
    assign r_fpu_src_A_D = opA_data_B0;
    assign r_fpu_src_A_WE = codasip_tmp_var_8 ? 1'b1 : 1'b0;
    assign r_fpu_src_B_D = opB_data_B0;
    assign r_fpu_src_B_WE = codasip_tmp_var_8 ? 1'b1 : 1'b0;
    assign r_fpu_src_C_D = opC_data_B0;
    assign r_fpu_src_C_WE = codasip_tmp_var_8 ? 1'b1 : 1'b0;
    assign r_instr_addr_D = s_instr_addr_i_Q;
    assign r_instr_addr_WE = 1'b1;
    assign r_instr_D = s_instr_i_Q;
    assign r_instr_WE = 1'b1;
    assign r_is_fpu_op_D = ((s_ready_Q) ? s_is_fpu_op_B0 : 1'b0);
    assign r_is_fpu_op_WE = 1'b1;
    assign r_record_f_addr0_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h00)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h00)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h00)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr0_Q[4:0]) & 32'h00000001)) && r_record_f_addr0_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr0_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h00)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr0_Q[4:0]) & 32'h00000001)) && r_record_f_addr0_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr0_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr0_Q));
    assign r_record_f_addr0_WE = 1'b1;
    assign r_record_f_addr10_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0a)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0a)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h0a)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr10_Q[4:0]) & 32'h00000001)) && r_record_f_addr10_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr10_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0a)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr10_Q[4:0]) & 32'h00000001)) && r_record_f_addr10_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr10_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr10_Q));
    assign r_record_f_addr10_WE = 1'b1;
    assign r_record_f_addr11_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0b)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0b)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h0b)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr11_Q[4:0]) & 32'h00000001)) && r_record_f_addr11_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr11_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0b)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr11_Q[4:0]) & 32'h00000001)) && r_record_f_addr11_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr11_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr11_Q));
    assign r_record_f_addr11_WE = 1'b1;
    assign r_record_f_addr12_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0c)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0c)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h0c)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr12_Q[4:0]) & 32'h00000001)) && r_record_f_addr12_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr12_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0c)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr12_Q[4:0]) & 32'h00000001)) && r_record_f_addr12_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr12_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr12_Q));
    assign r_record_f_addr12_WE = 1'b1;
    assign r_record_f_addr13_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0d)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0d)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h0d)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr13_Q[4:0]) & 32'h00000001)) && r_record_f_addr13_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr13_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0d)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr13_Q[4:0]) & 32'h00000001)) && r_record_f_addr13_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr13_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr13_Q));
    assign r_record_f_addr13_WE = 1'b1;
    assign r_record_f_addr14_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0e)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0e)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h0e)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr14_Q[4:0]) & 32'h00000001)) && r_record_f_addr14_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr14_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0e)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr14_Q[4:0]) & 32'h00000001)) && r_record_f_addr14_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr14_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr14_Q));
    assign r_record_f_addr14_WE = 1'b1;
    assign r_record_f_addr15_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0f)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0f)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h0f)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr15_Q[4:0]) & 32'h00000001)) && r_record_f_addr15_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr15_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0f)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr15_Q[4:0]) & 32'h00000001)) && r_record_f_addr15_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr15_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr15_Q));
    assign r_record_f_addr15_WE = 1'b1;
    assign r_record_f_addr16_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h10)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h10)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h10)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr16_Q[4:0]) & 32'h00000001)) && r_record_f_addr16_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr16_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h10)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr16_Q[4:0]) & 32'h00000001)) && r_record_f_addr16_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr16_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr16_Q));
    assign r_record_f_addr16_WE = 1'b1;
    assign r_record_f_addr17_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h11)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h11)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h11)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr17_Q[4:0]) & 32'h00000001)) && r_record_f_addr17_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr17_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h11)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr17_Q[4:0]) & 32'h00000001)) && r_record_f_addr17_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr17_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr17_Q));
    assign r_record_f_addr17_WE = 1'b1;
    assign r_record_f_addr18_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h12)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h12)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h12)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr18_Q[4:0]) & 32'h00000001)) && r_record_f_addr18_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr18_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h12)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr18_Q[4:0]) & 32'h00000001)) && r_record_f_addr18_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr18_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr18_Q));
    assign r_record_f_addr18_WE = 1'b1;
    assign r_record_f_addr19_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h13)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h13)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h13)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr19_Q[4:0]) & 32'h00000001)) && r_record_f_addr19_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr19_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h13)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr19_Q[4:0]) & 32'h00000001)) && r_record_f_addr19_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr19_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr19_Q));
    assign r_record_f_addr19_WE = 1'b1;
    assign r_record_f_addr1_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h01)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h01)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h01)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr1_Q[4:0]) & 32'h00000001)) && r_record_f_addr1_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr1_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h01)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr1_Q[4:0]) & 32'h00000001)) && r_record_f_addr1_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr1_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr1_Q));
    assign r_record_f_addr1_WE = 1'b1;
    assign r_record_f_addr20_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h14)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h14)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h14)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr20_Q[4:0]) & 32'h00000001)) && r_record_f_addr20_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr20_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h14)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr20_Q[4:0]) & 32'h00000001)) && r_record_f_addr20_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr20_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr20_Q));
    assign r_record_f_addr20_WE = 1'b1;
    assign r_record_f_addr21_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h15)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h15)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h15)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr21_Q[4:0]) & 32'h00000001)) && r_record_f_addr21_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr21_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h15)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr21_Q[4:0]) & 32'h00000001)) && r_record_f_addr21_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr21_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr21_Q));
    assign r_record_f_addr21_WE = 1'b1;
    assign r_record_f_addr22_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h16)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h16)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h16)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr22_Q[4:0]) & 32'h00000001)) && r_record_f_addr22_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr22_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h16)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr22_Q[4:0]) & 32'h00000001)) && r_record_f_addr22_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr22_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr22_Q));
    assign r_record_f_addr22_WE = 1'b1;
    assign r_record_f_addr23_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h17)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h17)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h17)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr23_Q[4:0]) & 32'h00000001)) && r_record_f_addr23_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr23_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h17)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr23_Q[4:0]) & 32'h00000001)) && r_record_f_addr23_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr23_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr23_Q));
    assign r_record_f_addr23_WE = 1'b1;
    assign r_record_f_addr24_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h18)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h18)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h18)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr24_Q[4:0]) & 32'h00000001)) && r_record_f_addr24_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr24_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h18)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr24_Q[4:0]) & 32'h00000001)) && r_record_f_addr24_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr24_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr24_Q));
    assign r_record_f_addr24_WE = 1'b1;
    assign r_record_f_addr25_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h19)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h19)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h19)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr25_Q[4:0]) & 32'h00000001)) && r_record_f_addr25_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr25_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h19)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr25_Q[4:0]) & 32'h00000001)) && r_record_f_addr25_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr25_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr25_Q));
    assign r_record_f_addr25_WE = 1'b1;
    assign r_record_f_addr26_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1a)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1a)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h1a)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr26_Q[4:0]) & 32'h00000001)) && r_record_f_addr26_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr26_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1a)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr26_Q[4:0]) & 32'h00000001)) && r_record_f_addr26_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr26_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr26_Q));
    assign r_record_f_addr26_WE = 1'b1;
    assign r_record_f_addr27_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1b)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1b)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h1b)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr27_Q[4:0]) & 32'h00000001)) && r_record_f_addr27_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr27_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1b)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr27_Q[4:0]) & 32'h00000001)) && r_record_f_addr27_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr27_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr27_Q));
    assign r_record_f_addr27_WE = 1'b1;
    assign r_record_f_addr28_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1c)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1c)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h1c)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr28_Q[4:0]) & 32'h00000001)) && r_record_f_addr28_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr28_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1c)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr28_Q[4:0]) & 32'h00000001)) && r_record_f_addr28_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr28_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr28_Q));
    assign r_record_f_addr28_WE = 1'b1;
    assign r_record_f_addr29_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1d)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1d)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h1d)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr29_Q[4:0]) & 32'h00000001)) && r_record_f_addr29_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr29_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1d)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr29_Q[4:0]) & 32'h00000001)) && r_record_f_addr29_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr29_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr29_Q));
    assign r_record_f_addr29_WE = 1'b1;
    assign r_record_f_addr2_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h02)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h02)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h02)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr2_Q[4:0]) & 32'h00000001)) && r_record_f_addr2_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr2_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h02)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr2_Q[4:0]) & 32'h00000001)) && r_record_f_addr2_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr2_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr2_Q));
    assign r_record_f_addr2_WE = 1'b1;
    assign r_record_f_addr30_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1e)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1e)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h1e)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr30_Q[4:0]) & 32'h00000001)) && r_record_f_addr30_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr30_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1e)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr30_Q[4:0]) & 32'h00000001)) && r_record_f_addr30_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr30_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr30_Q));
    assign r_record_f_addr30_WE = 1'b1;
    assign r_record_f_addr31_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1f)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1f)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h1f)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr31_Q[4:0]) & 32'h00000001)) && r_record_f_addr31_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr31_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1f)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr31_Q[4:0]) & 32'h00000001)) && r_record_f_addr31_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr31_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr31_Q));
    assign r_record_f_addr31_WE = 1'b1;
    assign r_record_f_addr3_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h03)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h03)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h03)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr3_Q[4:0]) & 32'h00000001)) && r_record_f_addr3_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr3_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h03)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr3_Q[4:0]) & 32'h00000001)) && r_record_f_addr3_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr3_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr3_Q));
    assign r_record_f_addr3_WE = 1'b1;
    assign r_record_f_addr4_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h04)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h04)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h04)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr4_Q[4:0]) & 32'h00000001)) && r_record_f_addr4_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr4_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h04)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr4_Q[4:0]) & 32'h00000001)) && r_record_f_addr4_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr4_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr4_Q));
    assign r_record_f_addr4_WE = 1'b1;
    assign r_record_f_addr5_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h05)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h05)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h05)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr5_Q[4:0]) & 32'h00000001)) && r_record_f_addr5_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr5_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h05)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr5_Q[4:0]) & 32'h00000001)) && r_record_f_addr5_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr5_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr5_Q));
    assign r_record_f_addr5_WE = 1'b1;
    assign r_record_f_addr6_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h06)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h06)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h06)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr6_Q[4:0]) & 32'h00000001)) && r_record_f_addr6_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr6_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h06)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr6_Q[4:0]) & 32'h00000001)) && r_record_f_addr6_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr6_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr6_Q));
    assign r_record_f_addr6_WE = 1'b1;
    assign r_record_f_addr7_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h07)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h07)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h07)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr7_Q[4:0]) & 32'h00000001)) && r_record_f_addr7_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr7_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h07)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr7_Q[4:0]) & 32'h00000001)) && r_record_f_addr7_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr7_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr7_Q));
    assign r_record_f_addr7_WE = 1'b1;
    assign r_record_f_addr8_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h08)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h08)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h08)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr8_Q[4:0]) & 32'h00000001)) && r_record_f_addr8_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr8_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h08)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr8_Q[4:0]) & 32'h00000001)) && r_record_f_addr8_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr8_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr8_Q));
    assign r_record_f_addr8_WE = 1'b1;
    assign r_record_f_addr9_D = ((({32'd6{((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h09)) && sel_dst_addr_B0[5])}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h09)) && sel_dst_addr_B0[5])) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h09)) && s_wb_commit_addr_Q[5])) & (((1'(((r_fpu_ROB_done_Q >> r_record_f_addr9_Q[4:0]) & 32'h00000001)) && r_record_f_addr9_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr9_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h09)) && sel_dst_addr_B0[5])) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_f_addr9_Q[4:0]) & 32'h00000001)) && r_record_f_addr9_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_f_addr9_Q[4:0])) && s_ack_i_Q)))}} & r_record_f_addr9_Q));
    assign r_record_f_addr9_WE = 1'b1;
    assign r_record_x_addr10_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0a)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0a)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0a)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h0a)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr10_Q[4:0]) & 32'h00000001)) && r_record_x_addr10_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr10_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0a)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr10_Q[4:0]) & 32'h00000001)) && r_record_x_addr10_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr10_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr10_Q));
    assign r_record_x_addr10_WE = 1'b1;
    assign r_record_x_addr11_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0b)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0b)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0b)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h0b)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr11_Q[4:0]) & 32'h00000001)) && r_record_x_addr11_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr11_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0b)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr11_Q[4:0]) & 32'h00000001)) && r_record_x_addr11_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr11_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr11_Q));
    assign r_record_x_addr11_WE = 1'b1;
    assign r_record_x_addr12_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0c)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0c)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0c)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h0c)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr12_Q[4:0]) & 32'h00000001)) && r_record_x_addr12_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr12_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0c)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr12_Q[4:0]) & 32'h00000001)) && r_record_x_addr12_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr12_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr12_Q));
    assign r_record_x_addr12_WE = 1'b1;
    assign r_record_x_addr13_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0d)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0d)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0d)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h0d)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr13_Q[4:0]) & 32'h00000001)) && r_record_x_addr13_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr13_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0d)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr13_Q[4:0]) & 32'h00000001)) && r_record_x_addr13_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr13_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr13_Q));
    assign r_record_x_addr13_WE = 1'b1;
    assign r_record_x_addr14_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0e)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0e)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0e)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h0e)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr14_Q[4:0]) & 32'h00000001)) && r_record_x_addr14_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr14_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0e)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr14_Q[4:0]) & 32'h00000001)) && r_record_x_addr14_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr14_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr14_Q));
    assign r_record_x_addr14_WE = 1'b1;
    assign r_record_x_addr15_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0f)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0f)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0f)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h0f)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr15_Q[4:0]) & 32'h00000001)) && r_record_x_addr15_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr15_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h0f)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr15_Q[4:0]) & 32'h00000001)) && r_record_x_addr15_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr15_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr15_Q));
    assign r_record_x_addr15_WE = 1'b1;
    assign r_record_x_addr16_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h10)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h10)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h10)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h10)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr16_Q[4:0]) & 32'h00000001)) && r_record_x_addr16_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr16_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h10)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr16_Q[4:0]) & 32'h00000001)) && r_record_x_addr16_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr16_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr16_Q));
    assign r_record_x_addr16_WE = 1'b1;
    assign r_record_x_addr17_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h11)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h11)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h11)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h11)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr17_Q[4:0]) & 32'h00000001)) && r_record_x_addr17_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr17_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h11)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr17_Q[4:0]) & 32'h00000001)) && r_record_x_addr17_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr17_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr17_Q));
    assign r_record_x_addr17_WE = 1'b1;
    assign r_record_x_addr18_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h12)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h12)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h12)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h12)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr18_Q[4:0]) & 32'h00000001)) && r_record_x_addr18_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr18_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h12)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr18_Q[4:0]) & 32'h00000001)) && r_record_x_addr18_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr18_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr18_Q));
    assign r_record_x_addr18_WE = 1'b1;
    assign r_record_x_addr19_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h13)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h13)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h13)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h13)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr19_Q[4:0]) & 32'h00000001)) && r_record_x_addr19_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr19_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h13)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr19_Q[4:0]) & 32'h00000001)) && r_record_x_addr19_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr19_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr19_Q));
    assign r_record_x_addr19_WE = 1'b1;
    assign r_record_x_addr1_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h01)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h01)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h01)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h01)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr1_Q[4:0]) & 32'h00000001)) && r_record_x_addr1_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr1_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h01)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr1_Q[4:0]) & 32'h00000001)) && r_record_x_addr1_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr1_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr1_Q));
    assign r_record_x_addr1_WE = 1'b1;
    assign r_record_x_addr20_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h14)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h14)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h14)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h14)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr20_Q[4:0]) & 32'h00000001)) && r_record_x_addr20_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr20_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h14)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr20_Q[4:0]) & 32'h00000001)) && r_record_x_addr20_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr20_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr20_Q));
    assign r_record_x_addr20_WE = 1'b1;
    assign r_record_x_addr21_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h15)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h15)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h15)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h15)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr21_Q[4:0]) & 32'h00000001)) && r_record_x_addr21_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr21_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h15)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr21_Q[4:0]) & 32'h00000001)) && r_record_x_addr21_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr21_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr21_Q));
    assign r_record_x_addr21_WE = 1'b1;
    assign r_record_x_addr22_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h16)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h16)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h16)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h16)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr22_Q[4:0]) & 32'h00000001)) && r_record_x_addr22_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr22_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h16)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr22_Q[4:0]) & 32'h00000001)) && r_record_x_addr22_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr22_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr22_Q));
    assign r_record_x_addr22_WE = 1'b1;
    assign r_record_x_addr23_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h17)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h17)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h17)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h17)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr23_Q[4:0]) & 32'h00000001)) && r_record_x_addr23_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr23_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h17)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr23_Q[4:0]) & 32'h00000001)) && r_record_x_addr23_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr23_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr23_Q));
    assign r_record_x_addr23_WE = 1'b1;
    assign r_record_x_addr24_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h18)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h18)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h18)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h18)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr24_Q[4:0]) & 32'h00000001)) && r_record_x_addr24_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr24_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h18)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr24_Q[4:0]) & 32'h00000001)) && r_record_x_addr24_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr24_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr24_Q));
    assign r_record_x_addr24_WE = 1'b1;
    assign r_record_x_addr25_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h19)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h19)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h19)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h19)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr25_Q[4:0]) & 32'h00000001)) && r_record_x_addr25_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr25_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h19)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr25_Q[4:0]) & 32'h00000001)) && r_record_x_addr25_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr25_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr25_Q));
    assign r_record_x_addr25_WE = 1'b1;
    assign r_record_x_addr26_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1a)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1a)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1a)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h1a)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr26_Q[4:0]) & 32'h00000001)) && r_record_x_addr26_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr26_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1a)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr26_Q[4:0]) & 32'h00000001)) && r_record_x_addr26_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr26_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr26_Q));
    assign r_record_x_addr26_WE = 1'b1;
    assign r_record_x_addr27_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1b)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1b)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1b)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h1b)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr27_Q[4:0]) & 32'h00000001)) && r_record_x_addr27_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr27_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1b)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr27_Q[4:0]) & 32'h00000001)) && r_record_x_addr27_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr27_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr27_Q));
    assign r_record_x_addr27_WE = 1'b1;
    assign r_record_x_addr28_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1c)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1c)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1c)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h1c)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr28_Q[4:0]) & 32'h00000001)) && r_record_x_addr28_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr28_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1c)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr28_Q[4:0]) & 32'h00000001)) && r_record_x_addr28_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr28_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr28_Q));
    assign r_record_x_addr28_WE = 1'b1;
    assign r_record_x_addr29_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1d)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1d)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1d)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h1d)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr29_Q[4:0]) & 32'h00000001)) && r_record_x_addr29_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr29_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1d)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr29_Q[4:0]) & 32'h00000001)) && r_record_x_addr29_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr29_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr29_Q));
    assign r_record_x_addr29_WE = 1'b1;
    assign r_record_x_addr2_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h02)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h02)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h02)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h02)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr2_Q[4:0]) & 32'h00000001)) && r_record_x_addr2_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr2_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h02)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr2_Q[4:0]) & 32'h00000001)) && r_record_x_addr2_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr2_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr2_Q));
    assign r_record_x_addr2_WE = 1'b1;
    assign r_record_x_addr30_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1e)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1e)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1e)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h1e)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr30_Q[4:0]) & 32'h00000001)) && r_record_x_addr30_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr30_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1e)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr30_Q[4:0]) & 32'h00000001)) && r_record_x_addr30_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr30_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr30_Q));
    assign r_record_x_addr30_WE = 1'b1;
    assign r_record_x_addr31_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1f)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1f)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1f)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h1f)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr31_Q[4:0]) & 32'h00000001)) && r_record_x_addr31_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr31_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h1f)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr31_Q[4:0]) & 32'h00000001)) && r_record_x_addr31_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr31_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr31_Q));
    assign r_record_x_addr31_WE = 1'b1;
    assign r_record_x_addr3_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h03)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h03)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h03)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h03)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr3_Q[4:0]) & 32'h00000001)) && r_record_x_addr3_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr3_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h03)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr3_Q[4:0]) & 32'h00000001)) && r_record_x_addr3_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr3_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr3_Q));
    assign r_record_x_addr3_WE = 1'b1;
    assign r_record_x_addr4_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h04)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h04)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h04)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h04)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr4_Q[4:0]) & 32'h00000001)) && r_record_x_addr4_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr4_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h04)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr4_Q[4:0]) & 32'h00000001)) && r_record_x_addr4_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr4_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr4_Q));
    assign r_record_x_addr4_WE = 1'b1;
    assign r_record_x_addr5_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h05)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h05)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h05)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h05)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr5_Q[4:0]) & 32'h00000001)) && r_record_x_addr5_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr5_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h05)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr5_Q[4:0]) & 32'h00000001)) && r_record_x_addr5_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr5_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr5_Q));
    assign r_record_x_addr5_WE = 1'b1;
    assign r_record_x_addr6_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h06)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h06)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h06)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h06)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr6_Q[4:0]) & 32'h00000001)) && r_record_x_addr6_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr6_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h06)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr6_Q[4:0]) & 32'h00000001)) && r_record_x_addr6_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr6_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr6_Q));
    assign r_record_x_addr6_WE = 1'b1;
    assign r_record_x_addr7_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h07)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h07)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h07)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h07)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr7_Q[4:0]) & 32'h00000001)) && r_record_x_addr7_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr7_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h07)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr7_Q[4:0]) & 32'h00000001)) && r_record_x_addr7_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr7_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr7_Q));
    assign r_record_x_addr7_WE = 1'b1;
    assign r_record_x_addr8_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h08)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h08)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h08)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h08)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr8_Q[4:0]) & 32'h00000001)) && r_record_x_addr8_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr8_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h08)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr8_Q[4:0]) & 32'h00000001)) && r_record_x_addr8_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr8_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr8_Q));
    assign r_record_x_addr8_WE = 1'b1;
    assign r_record_x_addr9_D = (((({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h09)) && (~sel_dst_addr_B0[5])) & (~(s_ROB_full_Q & r_full_ports_Q)))}} & {1'b1, ROB_ptr_B0}) | ({32'd6{(((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h09)) && (~sel_dst_addr_B0[5])) & (s_ROB_full_Q & r_full_ports_Q))}} & {1'b1, r_fpu_ROB_ptr_Q})) | ({32'd6{(((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h09)) && (~sel_dst_addr_B0[5]))) & ((ROB_out_item_done_Q && (s_wb_commit_addr_Q[4:0] == 5'h09)) && (~s_wb_commit_addr_Q[5]))) & (((1'(((r_fpu_ROB_done_Q >> r_record_x_addr9_Q[4:0]) & 32'h00000001)) && r_record_x_addr9_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr9_Q[4:0])) && s_ack_i_Q))}} & 6'h00)) | ({32'd6{((~((add_record_B0 && (sel_dst_addr_B0[4:0] == 5'h09)) && (~sel_dst_addr_B0[5]))) & (~(((1'(((r_fpu_ROB_done_Q >> r_record_x_addr9_Q[4:0]) & 32'h00000001)) && r_record_x_addr9_Q[5]) && (r_fpu_ROB_ptr_out_Q == r_record_x_addr9_Q[4:0])) && s_ack_i_Q)))}} & r_record_x_addr9_Q));
    assign r_record_x_addr9_WE = 1'b1;
    assign r_rob_part1_item0_D = rob_data_part1_B0;
    assign r_rob_part1_item0_WE = codasip_tmp_var_11 ? 1'b1 : 1'b0;
    assign r_rob_part1_item10_D = rob_data_part1_B0;
    assign r_rob_part1_item10_WE = codasip_tmp_var_21 ? 1'b1 : 1'b0;
    assign r_rob_part1_item11_D = rob_data_part1_B0;
    assign r_rob_part1_item11_WE = codasip_tmp_var_22 ? 1'b1 : 1'b0;
    assign r_rob_part1_item12_D = rob_data_part1_B0;
    assign r_rob_part1_item12_WE = codasip_tmp_var_23 ? 1'b1 : 1'b0;
    assign r_rob_part1_item13_D = rob_data_part1_B0;
    assign r_rob_part1_item13_WE = codasip_tmp_var_24 ? 1'b1 : 1'b0;
    assign r_rob_part1_item14_D = rob_data_part1_B0;
    assign r_rob_part1_item14_WE = codasip_tmp_var_25 ? 1'b1 : 1'b0;
    assign r_rob_part1_item15_D = rob_data_part1_B0;
    assign r_rob_part1_item15_WE = codasip_tmp_var_26 ? 1'b1 : 1'b0;
    assign r_rob_part1_item16_D = rob_data_part1_B0;
    assign r_rob_part1_item16_WE = codasip_tmp_var_27 ? 1'b1 : 1'b0;
    assign r_rob_part1_item17_D = rob_data_part1_B0;
    assign r_rob_part1_item17_WE = codasip_tmp_var_28 ? 1'b1 : 1'b0;
    assign r_rob_part1_item18_D = rob_data_part1_B0;
    assign r_rob_part1_item18_WE = codasip_tmp_var_29 ? 1'b1 : 1'b0;
    assign r_rob_part1_item19_D = rob_data_part1_B0;
    assign r_rob_part1_item19_WE = codasip_tmp_var_30 ? 1'b1 : 1'b0;
    assign r_rob_part1_item1_D = rob_data_part1_B0;
    assign r_rob_part1_item1_WE = codasip_tmp_var_12 ? 1'b1 : 1'b0;
    assign r_rob_part1_item20_D = rob_data_part1_B0;
    assign r_rob_part1_item20_WE = codasip_tmp_var_31 ? 1'b1 : 1'b0;
    assign r_rob_part1_item21_D = rob_data_part1_B0;
    assign r_rob_part1_item21_WE = codasip_tmp_var_32 ? 1'b1 : 1'b0;
    assign r_rob_part1_item22_D = rob_data_part1_B0;
    assign r_rob_part1_item22_WE = codasip_tmp_var_33 ? 1'b1 : 1'b0;
    assign r_rob_part1_item23_D = rob_data_part1_B0;
    assign r_rob_part1_item23_WE = codasip_tmp_var_34 ? 1'b1 : 1'b0;
    assign r_rob_part1_item24_D = rob_data_part1_B0;
    assign r_rob_part1_item24_WE = codasip_tmp_var_35 ? 1'b1 : 1'b0;
    assign r_rob_part1_item25_D = rob_data_part1_B0;
    assign r_rob_part1_item25_WE = codasip_tmp_var_36 ? 1'b1 : 1'b0;
    assign r_rob_part1_item26_D = rob_data_part1_B0;
    assign r_rob_part1_item26_WE = codasip_tmp_var_37 ? 1'b1 : 1'b0;
    assign r_rob_part1_item27_D = rob_data_part1_B0;
    assign r_rob_part1_item27_WE = codasip_tmp_var_38 ? 1'b1 : 1'b0;
    assign r_rob_part1_item28_D = rob_data_part1_B0;
    assign r_rob_part1_item28_WE = codasip_tmp_var_39 ? 1'b1 : 1'b0;
    assign r_rob_part1_item29_D = rob_data_part1_B0;
    assign r_rob_part1_item29_WE = codasip_tmp_var_40 ? 1'b1 : 1'b0;
    assign r_rob_part1_item2_D = rob_data_part1_B0;
    assign r_rob_part1_item2_WE = codasip_tmp_var_13 ? 1'b1 : 1'b0;
    assign r_rob_part1_item30_D = rob_data_part1_B0;
    assign r_rob_part1_item30_WE = codasip_tmp_var_41 ? 1'b1 : 1'b0;
    assign r_rob_part1_item31_D = rob_data_part1_B0;
    assign r_rob_part1_item31_WE = codasip_tmp_var_42 ? 1'b1 : 1'b0;
    assign r_rob_part1_item3_D = rob_data_part1_B0;
    assign r_rob_part1_item3_WE = codasip_tmp_var_14 ? 1'b1 : 1'b0;
    assign r_rob_part1_item4_D = rob_data_part1_B0;
    assign r_rob_part1_item4_WE = codasip_tmp_var_15 ? 1'b1 : 1'b0;
    assign r_rob_part1_item5_D = rob_data_part1_B0;
    assign r_rob_part1_item5_WE = codasip_tmp_var_16 ? 1'b1 : 1'b0;
    assign r_rob_part1_item6_D = rob_data_part1_B0;
    assign r_rob_part1_item6_WE = codasip_tmp_var_17 ? 1'b1 : 1'b0;
    assign r_rob_part1_item7_D = rob_data_part1_B0;
    assign r_rob_part1_item7_WE = codasip_tmp_var_18 ? 1'b1 : 1'b0;
    assign r_rob_part1_item8_D = rob_data_part1_B0;
    assign r_rob_part1_item8_WE = codasip_tmp_var_19 ? 1'b1 : 1'b0;
    assign r_rob_part1_item9_D = rob_data_part1_B0;
    assign r_rob_part1_item9_WE = codasip_tmp_var_20 ? 1'b1 : 1'b0;
    assign r_stall_fwd_D = stall_fwd_B0;
    assign r_stall_fwd_WE = 1'b1;
    assign r_start_add_sub_D = start_add_sub_B0;
    assign r_start_add_sub_WE = 1'b1;
    assign r_start_classify_D = start_classify_B0;
    assign r_start_classify_WE = 1'b1;
    assign r_start_cmp_D = start_cmp_B0;
    assign r_start_cmp_WE = 1'b1;
    assign r_start_f2i_D = start_f2i_B0;
    assign r_start_f2i_WE = 1'b1;
    assign r_start_fused_D = start_fused_B0;
    assign r_start_fused_WE = 1'b1;
    assign r_start_i2f_D = start_i2f_B0;
    assign r_start_i2f_WE = 1'b1;
    assign r_start_max_min_D = start_max_min_B0;
    assign r_start_max_min_WE = 1'b1;
    assign r_start_move_D = start_move_B0;
    assign r_start_move_WE = 1'b1;
    assign r_start_mul_D = start_mul_B0;
    assign r_start_mul_WE = 1'b1;
    assign r_start_sgnj_D = start_sgnj_B0;
    assign r_start_sgnj_WE = 1'b1;
    assign r_start_sqrt_div_D = start_sqrt_div_B0;
    assign r_start_sqrt_div_WE = 1'b1;
    assign r_unit_stall_D = unit_stall_B0;
    assign r_unit_stall_WE = 1'b1;
    assign s_exc_op_wait_D = (((r_exc_stall_Q | r_exc_en_Q)) ? r_exc_op_Q : 6'h00);
    assign s_fpu_ce_D = ((s_busy_o_Q | r_busy_Q) | s_is_fpu_op_B0);
    assign s_new_operation_D = (((((((((((r_start_add_sub_Q | r_start_mul_Q) | r_start_classify_Q) | r_start_cmp_Q) | r_start_max_min_Q) | r_start_f2i_Q) | r_start_i2f_Q) | r_start_sgnj_Q) | r_start_fused_Q) | r_start_sqrt_div_Q) | r_start_move_Q) | r_exc_en_Q);
    assign sqrt_div_s_clk_en_i_D = start_sqrt_div_B0;
    // code snippets:
`ifdef CODASIP_RTL_ASSERTIONS
    // Specify default clock signal for all assertions.
    // The clock may run even when the unit has gated clock signal.
    default clocking @(posedge `CODASIP_RTL_ASSERTIONS_CLOCK); endclocking

`ifdef CODASIP_RTL_ASSERTIONS_RESET
    // Disable all the assertions in case reset is asserted.
    default disable iff ((`CODASIP_RTL_ASSERTIONS_RESET == 1'b0));
`endif

    assert property (s_valid_i_Q == 1'b1 |-> s_rm_i_Q inside {3'b000, 3'b001, 3'b010, 3'b011, 3'b100, 3'b111})
    else $fatal(1, "Port s_rm_i should be set only to values RNE, RTZ, RDN, RUP, RMM or DYN.");

    assert property ( 
        (s_valid_i_Q == 1'b1) && (s_op_i_Q inside {6'h0c, 6'h0e, 6'h18}) |-> s_s1_addr_i_Q[5] == 1'b0
    ) else $fatal(1, "When FPU operation uses integer source operand, port s_s1_addr_i should be set to integer register address.");

    assert property ( 
        (s_valid_i_Q == 1'b1) && (s_op_i_Q inside  {6'h0b, 6'h0d, 6'h17, 6'h06, 6'h1f}) |-> s_s1_addr_i_Q[5] == 1'b1
    ) else $fatal(1, "When FPU operation uses floating point operand, port s_s1_addr_i should be set to floating point register address.");

    assert property ( 
        (s_valid_i_Q == 1'b1) && (s_op_i_Q inside  {6'h00, 6'h02, 6'h01, 6'h03, 6'h05, 6'h04, 6'h19, 6'h1a, 6'h1b, 6'h1c, 6'h1d, 6'h1e}) |-> s_s1_addr_i_Q[5] == 1'b1 && s_s2_addr_i_Q[5] == 1'b1
    ) else $fatal(1, "When FPU operation uses floating point operand, ports s_s1_addr_i and s_s2_addr_i should be set to floating point register address.");

    assert property ( 
        (s_valid_i_Q == 1'b1) && (s_op_i_Q inside  {6'h07, 6'h08, 6'h09, 6'h0a}) |-> s_s1_addr_i_Q[5] == 1'b1 && s_s2_addr_i_Q[5] == 1'b1 && s_s3_addr_i_Q[5] == 1'b1
    ) else $fatal(1, "FPU multiply-add operations require ports s_s1_addr_i, s_s2_addr_i and s_s3_addr_i to be set to floating point register address.");

    assert property ( 
        (s_valid_i_Q == 1'b1) && (s_op_i_Q inside {6'h00, 6'h01, 6'h02, 6'h03, 6'h04, 6'h05, 6'h06, 6'h07, 6'h08, 6'h09, 6'h0a, 6'h0c, 6'h0e, 6'h19, 6'h1a, 6'h1b, 6'h18}) |-> s_rd_addr_i_Q[5] == 1'b1
    ) else $fatal(1, "FPU operations that compute floating point result, require core to set s_rd_addr_i to floating point register address.");

    assert property ( 
        (s_valid_i_Q == 1'b1) && (s_op_i_Q inside {6'h1f, 6'h0b, 6'h0d, 6'h17, 6'h1c, 6'h1d, 6'h1e}) |-> s_rd_addr_i_Q[5] == 1'b0
    ) else $fatal(1, "FPU operations that compute integer result, require core to set s_rd_addr_i to integer register address.");

    assert property ( 
        (s_valid_i_Q == 1'b1) && (s_s1_addr_i_Q == 6'b0) |-> s_s1_data_i_Q == '0
    ) else $fatal(1, "When FPU operation uses source register x0, core should drive set corresponding source data port to zero.");

    assert property (
       (fused_s_start_i_Q == $past(fused_s_clk_en_i_Q)) || r_exc_en_Q || s_flush_i_Q || $past(s_flush_i_Q)
    )
    else $fatal(1, "(fused_s_start_i_Q == $past(fused_s_clk_en_i_Q)) || r_exc_en_Q || s_flush_i_Q || $past(s_flush_i_Q)");

    assert property (
       (add_sub_s_start_i_Q == $past(add_sub_s_clk_en_i_Q)) || r_exc_en_Q || s_flush_i_Q || $past(s_flush_i_Q)
    )
    else $fatal(1, "(add_sub_s_start_i_Q == $past(add_sub_s_clk_en_i_Q)) || r_exc_en_Q || s_flush_i_Q || $past(s_flush_i_Q)");

    assert property (
       (fmul_s_start_i_Q == $past(fmul_s_clk_en_i_Q)) || r_exc_en_Q || s_flush_i_Q || $past(s_flush_i_Q)
    )
    else $fatal(1, "(fmul_s_start_i_Q == $past(fmul_s_clk_en_i_Q)) || r_exc_en_Q || s_flush_i_Q || $past(s_flush_i_Q)");

    assert property (
       (float2int_s_start_i_Q == $past(float2int_s_clk_en_i_Q)) || r_exc_en_Q || s_flush_i_Q || $past(s_flush_i_Q)
    )
    else $fatal(1, "(float2int_s_start_i_Q == $past(float2int_s_clk_en_i_Q)) || r_exc_en_Q || s_flush_i_Q || $past(s_flush_i_Q)");

    assert property (
       (int2float_s_start_i_Q == $past(int2float_s_clk_en_i_Q)) || r_exc_en_Q || s_flush_i_Q || $past(s_flush_i_Q)
    )
    else $fatal(1, "(int2float_s_start_i_Q == $past(int2float_s_clk_en_i_Q)) || r_exc_en_Q || s_flush_i_Q || $past(s_flush_i_Q)");

    assert property (
       (sqrt_div_s_start_i_Q == $past(sqrt_div_s_clk_en_i_Q)) || r_exc_en_Q || s_flush_i_Q || $past(s_flush_i_Q)
    )
    else $fatal(1, "(sqrt_div_s_start_i_Q == $past(sqrt_div_s_clk_en_i_Q)) || r_exc_en_Q || s_flush_i_Q || $past(s_flush_i_Q)");

    operation_single_issue: assert property (
        ($onehot0(units_start_vector_B0))
    )
    else $fatal(32'sd2, "operation_single_issue: 1 operation should be started at most");

`endif  // CODASIP_RTL_ASSERTIONS

endmodule: codix_berkelium_ca_core_execute_stage_fpu_compute_t
