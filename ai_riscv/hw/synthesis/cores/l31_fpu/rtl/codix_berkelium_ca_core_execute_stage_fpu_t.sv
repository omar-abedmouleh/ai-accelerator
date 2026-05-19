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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_t' CodAL module.
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

module codix_berkelium_ca_core_execute_stage_fpu_t(
    input  logic execute_stage_fpu_add_sub_s_add_sub_ce_ICLK,
    input  logic execute_stage_fpu_float2int_s_f2i_ce_ICLK,
    input  logic execute_stage_fpu_fmul_s_fmul_ce_ICLK,
    input  logic execute_stage_fpu_fused_s_fused_ce_ICLK,
    input  logic execute_stage_fpu_int2float_s_i2f_ce_ICLK,
    input  logic execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK,
    input  logic s_fpu_ce_ICLK,
    input  logic RST,
    input  logic control_fpu_CONTROL_CLEAR_Q,
    input  logic control_fpu_CONTROL_STALL_Q,
    input  logic control_fpu_ROB_CLEAR_Q,
    input  logic pipe_add_sub_COMPUTE_CLEAR_Q,
    input  logic pipe_add_sub_COMPUTE_STALL_Q,
    input  logic pipe_add_sub_POSTNORM_CLEAR_Q,
    input  logic pipe_add_sub_POSTNORM_STALL_Q,
    input  logic pipe_add_sub_ROUNDING_CLEAR_Q,
    input  logic pipe_add_sub_ROUNDING_STALL_Q,
    input  logic pipe_f2i_F2I_CLEAR_Q,
    input  logic pipe_f2i_F2I_STALL_Q,
    input  logic pipe_fmul_MUL_CLEAR_Q,
    input  logic pipe_fmul_POSTNORM1_CLEAR_Q,
    input  logic pipe_fmul_POSTNORM2_CLEAR_Q,
    input  logic pipe_fmul_ROUNDING_CLEAR_Q,
    input  logic pipe_fused_ADDSUB_CLEAR_Q,
    input  logic pipe_fused_POSTNORM_ADDSUB_CLEAR_Q,
    input  logic pipe_fused_POSTNORM_MUL1_CLEAR_Q,
    input  logic pipe_fused_POSTNORM_MUL2_CLEAR_Q,
    input  logic pipe_fused_PRENORM_ADDSUB_CLEAR_Q,
    input  logic pipe_fused_ROUNDING_CLEAR_Q,
    input  logic pipe_fused_WAIT_MUL_CLEAR_Q,
    input  logic pipe_i2f_COMPUTE_CLEAR_Q,
    input  logic pipe_i2f_COMPUTE_STALL_Q,
    input  logic pipe_i2f_ROUNDING_CLEAR_Q,
    input  logic pipe_i2f_ROUNDING_STALL_Q,
    input  logic pipe_sqrt_div_SQRT_DIV_CLEAR_Q,
    input  logic s_ack_i_D,
    input  logic [4:0] s_exc_type_i_D,
    input  logic s_exc_valid_i_D,
    input  logic s_flush_i_D,
    input  logic [2:0] s_frm_i_D,
    input  logic [31:0] s_instr_addr_i_D,
    input  logic [31:0] s_instr_i_D,
    input  logic [5:0] s_op_i_D,
    input  logic [5:0] s_rd_addr_i_D,
    input  logic [2:0] s_rm_i_D,
    input  logic [5:0] s_s1_addr_i_D,
    input  logic [31:0] s_s1_data_i_D,
    input  logic [5:0] s_s2_addr_i_D,
    input  logic [31:0] s_s2_data_i_D,
    input  logic [5:0] s_s3_addr_i_D,
    input  logic [31:0] s_s3_data_i_D,
    input  logic s_valid_i_D,
    output logic add_sub_s_add_sub_ce_Q,
    output logic control_fpu_CONTROL_CLEAR_D,
    output logic control_fpu_CONTROL_STALL_D,
    output logic control_fpu_ROB_CLEAR_D,
    output logic float2int_s_f2i_ce_Q,
    output logic fmul_s_fmul_ce_Q,
    output logic fused_s_fused_ce_Q,
    output logic int2float_s_i2f_ce_Q,
    output logic pipe_add_sub_COMPUTE_CLEAR_D,
    output logic pipe_add_sub_COMPUTE_STALL_D,
    output logic pipe_add_sub_POSTNORM_CLEAR_D,
    output logic pipe_add_sub_POSTNORM_STALL_D,
    output logic pipe_add_sub_ROUNDING_CLEAR_D,
    output logic pipe_add_sub_ROUNDING_STALL_D,
    output logic pipe_f2i_F2I_CLEAR_D,
    output logic pipe_f2i_F2I_STALL_D,
    output logic pipe_fmul_MUL_CLEAR_D,
    output logic pipe_fmul_POSTNORM1_CLEAR_D,
    output logic pipe_fmul_POSTNORM2_CLEAR_D,
    output logic pipe_fmul_ROUNDING_CLEAR_D,
    output logic pipe_fused_ADDSUB_CLEAR_D,
    output logic pipe_fused_POSTNORM_ADDSUB_CLEAR_D,
    output logic pipe_fused_POSTNORM_MUL1_CLEAR_D,
    output logic pipe_fused_POSTNORM_MUL2_CLEAR_D,
    output logic pipe_fused_PRENORM_ADDSUB_CLEAR_D,
    output logic pipe_fused_ROUNDING_CLEAR_D,
    output logic pipe_fused_WAIT_MUL_CLEAR_D,
    output logic pipe_i2f_COMPUTE_CLEAR_D,
    output logic pipe_i2f_COMPUTE_STALL_D,
    output logic pipe_i2f_ROUNDING_CLEAR_D,
    output logic pipe_i2f_ROUNDING_STALL_D,
    output logic pipe_sqrt_div_SQRT_DIV_CLEAR_D,
    output logic s_busy_o_Q,
    output logic [31:0] s_exc_instr_addr_o_Q,
    output logic [31:0] s_exc_tval_o_Q,
    output logic [4:0] s_exc_type_o_Q,
    output logic s_exc_valid_o_Q,
    output logic [4:0] s_flags_o_Q,
    output logic s_fpu_ce_D,
    output logic [5:0] s_rd_addr_o_Q,
    output logic [31:0] s_rd_data_o_Q,
    output logic [31:0] s_rdx_valid_o_Q,
    output logic s_ready_o_Q,
    output logic s_valid_o_Q,
    output logic sqrt_div_s_sqrt_div_ce_Q
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    logic s_valid_i;
    // CodAL signal/wire
    logic [5:0] s_op_i;
    // CodAL signal/wire
    logic [31:0] s_s1_data_i;
    // CodAL signal/wire
    logic [31:0] s_s2_data_i;
    // CodAL signal/wire
    logic [31:0] s_s3_data_i;
    // CodAL signal/wire
    logic [5:0] s_s1_addr_i;
    // CodAL signal/wire
    logic [5:0] s_s2_addr_i;
    // CodAL signal/wire
    logic [5:0] s_s3_addr_i;
    // CodAL signal/wire
    logic [5:0] s_rd_addr_i;
    // CodAL signal/wire
    logic [2:0] s_rm_i;
    // CodAL signal/wire
    logic [2:0] s_frm_i;
    // CodAL signal/wire
    logic s_ack_i;
    // CodAL signal/wire
    logic s_flush_i;
    // CodAL signal/wire
    logic [31:0] s_instr_addr_i;
    // CodAL signal/wire
    logic [31:0] s_instr_i;
    // CodAL signal/wire
    logic [4:0] s_exc_type_i;
    // CodAL signal/wire
    logic s_exc_valid_i;
    // CodAL signal/wire
    logic [31:0] s_rd_data_o;
    // CodAL signal/wire
    logic [4:0] s_flags_o;
    // CodAL signal/wire
    logic [5:0] s_rd_addr_o;
    // CodAL signal/wire
    logic s_valid_o;
    // CodAL signal/wire
    logic s_busy_o;
    // CodAL signal/wire
    logic s_ready_o;
    // CodAL signal/wire
    logic [4:0] s_exc_type_o;
    // CodAL signal/wire
    logic s_exc_valid_o;
    // CodAL signal/wire
    logic [31:0] s_exc_instr_addr_o;
    // CodAL signal/wire
    logic [31:0] s_exc_tval_o;
    // CodAL signal/wire
    logic [31:0] s_rdx_valid_o;
    // CodAL signal/wire
    logic [5:0] s_exc_op_wait;
    // CodAL signal/wire
    logic [31:0] s_fpu_classify_result;
    // CodAL signal/wire
    logic [31:0] s_fpu_sgnj_result;
    // CodAL signal/wire
    logic [31:0] s_fpu_cmp_result;
    // CodAL signal/wire
    logic [4:0] s_fpu_cmp_flags;
    // CodAL signal/wire
    logic [31:0] s_fpu_addsub_result;
    // CodAL signal/wire
    logic [4:0] s_fpu_addsub_flags;
    // CodAL signal/wire
    logic [31:0] s_fpu_mul_result;
    // CodAL signal/wire
    logic [4:0] s_fpu_mul_flags;
    // CodAL signal/wire
    logic [31:0] s_fpu_sqrt_div_result;
    // CodAL signal/wire
    logic [4:0] s_fpu_sqrt_div_flags;
    // CodAL signal/wire
    logic [31:0] s_fpu_f2i_result;
    // CodAL signal/wire
    logic [4:0] s_fpu_f2i_flags;
    // CodAL signal/wire
    logic [31:0] s_fpu_i2f_result;
    // CodAL signal/wire
    logic [4:0] s_fpu_i2f_flags;
    // CodAL signal/wire
    logic [31:0] s_fpu_fused_result;
    // CodAL signal/wire
    logic [4:0] s_fpu_fused_flags;
    // CodAL signal/wire
    logic [31:0] s_fpu_move_result;
    // CodAL signal/wire
    logic s_sqr_div_done;
    // CodAL signal/wire
    logic s_fused_done;
    // CodAL signal/wire
    logic s_mul_done;
    // CodAL signal/wire
    logic s_add_sub_done;
    // CodAL signal/wire
    logic s_float2int_done;
    // CodAL signal/wire
    logic s_int2float_done;
    // CodAL signal/wire
    logic s_cmp_done;
    // CodAL signal/wire
    logic s_classify_done;
    // CodAL signal/wire
    logic s_sgnj_done;
    // CodAL signal/wire
    logic s_move_done;
    // CodAL signal/wire
    logic s_new_operation;
    // CodAL signal/wire
    logic [4:0] s_add_sub_ROB_ptr;
    // CodAL signal/wire
    logic [4:0] s_mul_ROB_ptr;
    // CodAL signal/wire
    logic [4:0] s_sqrt_div_ROB_ptr;
    // CodAL signal/wire
    logic [4:0] s_fused_ROB_ptr;
    // CodAL signal/wire
    logic [4:0] s_f2i_ROB_ptr;
    // CodAL signal/wire
    logic [4:0] s_i2f_ROB_ptr;
    // CodAL signal/wire
    logic [4:0] s_fpu_cmp_ROB_ptr;
    // CodAL signal/wire
    logic [4:0] s_fpu_sgnj_ptr;
    // CodAL signal/wire
    logic [4:0] s_fpu_move_ptr;
    // CodAL signal/wire
    logic [4:0] s_fpu_classify_ptr;
    // CodAL signal/wire
    logic s_add_sub_rob_stall;
    // CodAL signal/wire
    logic s_float2int_rob_stall;
    // CodAL signal/wire
    logic s_int2float_rob_stall;
    // CodAL signal/wire
    logic ROB_out_item_done;
    // CodAL signal/wire
    logic [5:0] s_wb_commit_addr;
    // CodAL signal/wire
    logic s_full_port;
    // CodAL signal/wire
    logic s_ready;
    // CodAL signal/wire
    logic sqrt_div_ready;
    // CodAL signal/wire
    logic sqrt_div_busy;
    // CodAL signal/wire
    logic add_sub_ready;
    // CodAL signal/wire
    logic i2f_ready;
    // CodAL signal/wire
    logic f2i_ready;
    // CodAL signal/wire
    logic s_start_operation;
    // CodAL signal/wire
    logic [3:0] s_fpu_wb_port_w1;
    // CodAL signal/wire
    logic [3:0] s_fpu_wb_port_w2;
    // CodAL signal/wire
    logic [3:0] s_fpu_wb_port_w3;
    // CodAL signal/wire
    logic [3:0] s_fpu_wb_port_w4;
    // CodAL signal/wire
    logic s_ROB_full;

    // additional declarations:
    logic compute_r_fpu_op_WE_wire;
    logic [5:0] compute_r_fpu_op_D_wire;
    logic [5:0] r_fpu_op_Q_wire;
    logic compute_r_is_fpu_op_WE_wire;
    logic compute_r_is_fpu_op_D_wire;
    logic r_is_fpu_op_Q_wire;
    logic compute_r_fpu_src_A_WE_wire;
    logic [31:0] compute_r_fpu_src_A_D_wire;
    logic [31:0] r_fpu_src_A_Q_wire;
    logic compute_r_fpu_src_B_WE_wire;
    logic [31:0] compute_r_fpu_src_B_D_wire;
    logic [31:0] r_fpu_src_B_Q_wire;
    logic compute_r_fpu_src_C_WE_wire;
    logic [31:0] compute_r_fpu_src_C_D_wire;
    logic [31:0] r_fpu_src_C_Q_wire;
    logic compute_r_fpu_s1_addr_WE_wire;
    logic [5:0] compute_r_fpu_s1_addr_D_wire;
    logic [5:0] r_fpu_s1_addr_Q_wire;
    logic compute_r_fpu_s2_addr_WE_wire;
    logic [5:0] compute_r_fpu_s2_addr_D_wire;
    logic [5:0] r_fpu_s2_addr_Q_wire;
    logic compute_r_fpu_s3_addr_WE_wire;
    logic [5:0] compute_r_fpu_s3_addr_D_wire;
    logic [5:0] r_fpu_s3_addr_Q_wire;
    logic compute_r_fpu_rm_WE_wire;
    logic [2:0] compute_r_fpu_rm_D_wire;
    logic [2:0] r_fpu_rm_Q_wire;
    logic compute_r_instr_addr_WE_wire;
    logic [31:0] compute_r_instr_addr_D_wire;
    logic [31:0] r_instr_addr_Q_wire;
    logic compute_r_instr_WE_wire;
    logic [31:0] compute_r_instr_D_wire;
    logic [31:0] r_instr_Q_wire;
    logic compute_r_fpu_dst_addr_WE_wire;
    logic [5:0] compute_r_fpu_dst_addr_D_wire;
    logic [5:0] r_fpu_dst_addr_Q_wire;
    logic compute_r_exc_type_WE_wire;
    logic [4:0] compute_r_exc_type_D_wire;
    logic [4:0] r_exc_type_Q_wire;
    logic compute_r_exc_valid_WE_wire;
    logic compute_r_exc_valid_D_wire;
    logic r_exc_valid_Q_wire;
    logic compute_r_exc_en_WE_wire;
    logic compute_r_exc_en_D_wire;
    logic r_exc_en_Q_wire;
    logic fpu_compute_out_r_exc_stall_WE_wire;
    logic fpu_compute_out_r_exc_stall_D_wire;
    logic r_exc_stall_Q_wire;
    logic compute_r_exc_op_WE_wire;
    logic [5:0] compute_r_exc_op_D_wire;
    logic [5:0] r_exc_op_Q_wire;
    logic compute_r_start_add_sub_WE_wire;
    logic compute_r_start_add_sub_D_wire;
    logic r_start_add_sub_Q_wire;
    logic compute_r_start_move_WE_wire;
    logic compute_r_start_move_D_wire;
    logic r_start_move_Q_wire;
    logic compute_r_start_classify_WE_wire;
    logic compute_r_start_classify_D_wire;
    logic r_start_classify_Q_wire;
    logic compute_r_start_cmp_WE_wire;
    logic compute_r_start_cmp_D_wire;
    logic r_start_cmp_Q_wire;
    logic compute_r_start_i2f_WE_wire;
    logic compute_r_start_i2f_D_wire;
    logic r_start_i2f_Q_wire;
    logic compute_r_start_sgnj_WE_wire;
    logic compute_r_start_sgnj_D_wire;
    logic r_start_sgnj_Q_wire;
    logic compute_r_start_fused_WE_wire;
    logic compute_r_start_fused_D_wire;
    logic r_start_fused_Q_wire;
    logic compute_r_start_max_min_WE_wire;
    logic compute_r_start_max_min_D_wire;
    logic r_start_max_min_Q_wire;
    logic compute_r_start_sqrt_div_WE_wire;
    logic compute_r_start_sqrt_div_D_wire;
    logic r_start_sqrt_div_Q_wire;
    logic compute_r_start_f2i_WE_wire;
    logic compute_r_start_f2i_D_wire;
    logic r_start_f2i_Q_wire;
    logic compute_r_start_mul_WE_wire;
    logic compute_r_start_mul_D_wire;
    logic r_start_mul_Q_wire;
    logic compute_r_busy_WE_wire;
    logic compute_r_busy_D_wire;
    logic r_busy_Q_wire;
    logic compute_r_stall_fwd_WE_wire;
    logic compute_r_stall_fwd_D_wire;
    logic r_stall_fwd_Q_wire;
    logic compute_r_unit_stall_WE_wire;
    logic compute_r_unit_stall_D_wire;
    logic r_unit_stall_Q_wire;
    logic fpu_compute_out_r_full_ports_WE_wire;
    logic fpu_compute_out_r_full_ports_D_wire;
    logic r_full_ports_Q_wire;
    logic compute_r_rob_part1_item0_WE_wire;
    logic [75:0] compute_r_rob_part1_item0_D_wire;
    logic [75:0] r_rob_part1_item0_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item0_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item0_D_wire;
    logic [37:0] r_rob_part2_item0_Q_wire;
    logic compute_r_record_f_addr0_WE_wire;
    logic [5:0] compute_r_record_f_addr0_D_wire;
    logic [5:0] r_record_f_addr0_Q_wire;
    logic compute_r_rob_part1_item1_WE_wire;
    logic [75:0] compute_r_rob_part1_item1_D_wire;
    logic [75:0] r_rob_part1_item1_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item1_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item1_D_wire;
    logic [37:0] r_rob_part2_item1_Q_wire;
    logic compute_r_record_f_addr1_WE_wire;
    logic [5:0] compute_r_record_f_addr1_D_wire;
    logic [5:0] r_record_f_addr1_Q_wire;
    logic compute_r_record_x_addr1_WE_wire;
    logic [5:0] compute_r_record_x_addr1_D_wire;
    logic [5:0] r_record_x_addr1_Q_wire;
    logic compute_r_rob_part1_item2_WE_wire;
    logic [75:0] compute_r_rob_part1_item2_D_wire;
    logic [75:0] r_rob_part1_item2_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item2_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item2_D_wire;
    logic [37:0] r_rob_part2_item2_Q_wire;
    logic compute_r_record_f_addr2_WE_wire;
    logic [5:0] compute_r_record_f_addr2_D_wire;
    logic [5:0] r_record_f_addr2_Q_wire;
    logic compute_r_record_x_addr2_WE_wire;
    logic [5:0] compute_r_record_x_addr2_D_wire;
    logic [5:0] r_record_x_addr2_Q_wire;
    logic compute_r_rob_part1_item3_WE_wire;
    logic [75:0] compute_r_rob_part1_item3_D_wire;
    logic [75:0] r_rob_part1_item3_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item3_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item3_D_wire;
    logic [37:0] r_rob_part2_item3_Q_wire;
    logic compute_r_record_f_addr3_WE_wire;
    logic [5:0] compute_r_record_f_addr3_D_wire;
    logic [5:0] r_record_f_addr3_Q_wire;
    logic compute_r_record_x_addr3_WE_wire;
    logic [5:0] compute_r_record_x_addr3_D_wire;
    logic [5:0] r_record_x_addr3_Q_wire;
    logic compute_r_rob_part1_item4_WE_wire;
    logic [75:0] compute_r_rob_part1_item4_D_wire;
    logic [75:0] r_rob_part1_item4_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item4_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item4_D_wire;
    logic [37:0] r_rob_part2_item4_Q_wire;
    logic compute_r_record_f_addr4_WE_wire;
    logic [5:0] compute_r_record_f_addr4_D_wire;
    logic [5:0] r_record_f_addr4_Q_wire;
    logic compute_r_record_x_addr4_WE_wire;
    logic [5:0] compute_r_record_x_addr4_D_wire;
    logic [5:0] r_record_x_addr4_Q_wire;
    logic compute_r_rob_part1_item5_WE_wire;
    logic [75:0] compute_r_rob_part1_item5_D_wire;
    logic [75:0] r_rob_part1_item5_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item5_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item5_D_wire;
    logic [37:0] r_rob_part2_item5_Q_wire;
    logic compute_r_record_f_addr5_WE_wire;
    logic [5:0] compute_r_record_f_addr5_D_wire;
    logic [5:0] r_record_f_addr5_Q_wire;
    logic compute_r_record_x_addr5_WE_wire;
    logic [5:0] compute_r_record_x_addr5_D_wire;
    logic [5:0] r_record_x_addr5_Q_wire;
    logic compute_r_rob_part1_item6_WE_wire;
    logic [75:0] compute_r_rob_part1_item6_D_wire;
    logic [75:0] r_rob_part1_item6_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item6_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item6_D_wire;
    logic [37:0] r_rob_part2_item6_Q_wire;
    logic compute_r_record_f_addr6_WE_wire;
    logic [5:0] compute_r_record_f_addr6_D_wire;
    logic [5:0] r_record_f_addr6_Q_wire;
    logic compute_r_record_x_addr6_WE_wire;
    logic [5:0] compute_r_record_x_addr6_D_wire;
    logic [5:0] r_record_x_addr6_Q_wire;
    logic compute_r_rob_part1_item7_WE_wire;
    logic [75:0] compute_r_rob_part1_item7_D_wire;
    logic [75:0] r_rob_part1_item7_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item7_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item7_D_wire;
    logic [37:0] r_rob_part2_item7_Q_wire;
    logic compute_r_record_f_addr7_WE_wire;
    logic [5:0] compute_r_record_f_addr7_D_wire;
    logic [5:0] r_record_f_addr7_Q_wire;
    logic compute_r_record_x_addr7_WE_wire;
    logic [5:0] compute_r_record_x_addr7_D_wire;
    logic [5:0] r_record_x_addr7_Q_wire;
    logic compute_r_rob_part1_item8_WE_wire;
    logic [75:0] compute_r_rob_part1_item8_D_wire;
    logic [75:0] r_rob_part1_item8_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item8_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item8_D_wire;
    logic [37:0] r_rob_part2_item8_Q_wire;
    logic compute_r_record_f_addr8_WE_wire;
    logic [5:0] compute_r_record_f_addr8_D_wire;
    logic [5:0] r_record_f_addr8_Q_wire;
    logic compute_r_record_x_addr8_WE_wire;
    logic [5:0] compute_r_record_x_addr8_D_wire;
    logic [5:0] r_record_x_addr8_Q_wire;
    logic compute_r_rob_part1_item9_WE_wire;
    logic [75:0] compute_r_rob_part1_item9_D_wire;
    logic [75:0] r_rob_part1_item9_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item9_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item9_D_wire;
    logic [37:0] r_rob_part2_item9_Q_wire;
    logic compute_r_record_f_addr9_WE_wire;
    logic [5:0] compute_r_record_f_addr9_D_wire;
    logic [5:0] r_record_f_addr9_Q_wire;
    logic compute_r_record_x_addr9_WE_wire;
    logic [5:0] compute_r_record_x_addr9_D_wire;
    logic [5:0] r_record_x_addr9_Q_wire;
    logic compute_r_rob_part1_item10_WE_wire;
    logic [75:0] compute_r_rob_part1_item10_D_wire;
    logic [75:0] r_rob_part1_item10_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item10_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item10_D_wire;
    logic [37:0] r_rob_part2_item10_Q_wire;
    logic compute_r_record_f_addr10_WE_wire;
    logic [5:0] compute_r_record_f_addr10_D_wire;
    logic [5:0] r_record_f_addr10_Q_wire;
    logic compute_r_record_x_addr10_WE_wire;
    logic [5:0] compute_r_record_x_addr10_D_wire;
    logic [5:0] r_record_x_addr10_Q_wire;
    logic compute_r_rob_part1_item11_WE_wire;
    logic [75:0] compute_r_rob_part1_item11_D_wire;
    logic [75:0] r_rob_part1_item11_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item11_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item11_D_wire;
    logic [37:0] r_rob_part2_item11_Q_wire;
    logic compute_r_record_f_addr11_WE_wire;
    logic [5:0] compute_r_record_f_addr11_D_wire;
    logic [5:0] r_record_f_addr11_Q_wire;
    logic compute_r_record_x_addr11_WE_wire;
    logic [5:0] compute_r_record_x_addr11_D_wire;
    logic [5:0] r_record_x_addr11_Q_wire;
    logic compute_r_rob_part1_item12_WE_wire;
    logic [75:0] compute_r_rob_part1_item12_D_wire;
    logic [75:0] r_rob_part1_item12_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item12_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item12_D_wire;
    logic [37:0] r_rob_part2_item12_Q_wire;
    logic compute_r_record_f_addr12_WE_wire;
    logic [5:0] compute_r_record_f_addr12_D_wire;
    logic [5:0] r_record_f_addr12_Q_wire;
    logic compute_r_record_x_addr12_WE_wire;
    logic [5:0] compute_r_record_x_addr12_D_wire;
    logic [5:0] r_record_x_addr12_Q_wire;
    logic compute_r_rob_part1_item13_WE_wire;
    logic [75:0] compute_r_rob_part1_item13_D_wire;
    logic [75:0] r_rob_part1_item13_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item13_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item13_D_wire;
    logic [37:0] r_rob_part2_item13_Q_wire;
    logic compute_r_record_f_addr13_WE_wire;
    logic [5:0] compute_r_record_f_addr13_D_wire;
    logic [5:0] r_record_f_addr13_Q_wire;
    logic compute_r_record_x_addr13_WE_wire;
    logic [5:0] compute_r_record_x_addr13_D_wire;
    logic [5:0] r_record_x_addr13_Q_wire;
    logic compute_r_rob_part1_item14_WE_wire;
    logic [75:0] compute_r_rob_part1_item14_D_wire;
    logic [75:0] r_rob_part1_item14_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item14_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item14_D_wire;
    logic [37:0] r_rob_part2_item14_Q_wire;
    logic compute_r_record_f_addr14_WE_wire;
    logic [5:0] compute_r_record_f_addr14_D_wire;
    logic [5:0] r_record_f_addr14_Q_wire;
    logic compute_r_record_x_addr14_WE_wire;
    logic [5:0] compute_r_record_x_addr14_D_wire;
    logic [5:0] r_record_x_addr14_Q_wire;
    logic compute_r_rob_part1_item15_WE_wire;
    logic [75:0] compute_r_rob_part1_item15_D_wire;
    logic [75:0] r_rob_part1_item15_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item15_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item15_D_wire;
    logic [37:0] r_rob_part2_item15_Q_wire;
    logic compute_r_record_f_addr15_WE_wire;
    logic [5:0] compute_r_record_f_addr15_D_wire;
    logic [5:0] r_record_f_addr15_Q_wire;
    logic compute_r_record_x_addr15_WE_wire;
    logic [5:0] compute_r_record_x_addr15_D_wire;
    logic [5:0] r_record_x_addr15_Q_wire;
    logic compute_r_rob_part1_item16_WE_wire;
    logic [75:0] compute_r_rob_part1_item16_D_wire;
    logic [75:0] r_rob_part1_item16_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item16_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item16_D_wire;
    logic [37:0] r_rob_part2_item16_Q_wire;
    logic compute_r_record_f_addr16_WE_wire;
    logic [5:0] compute_r_record_f_addr16_D_wire;
    logic [5:0] r_record_f_addr16_Q_wire;
    logic compute_r_record_x_addr16_WE_wire;
    logic [5:0] compute_r_record_x_addr16_D_wire;
    logic [5:0] r_record_x_addr16_Q_wire;
    logic compute_r_rob_part1_item17_WE_wire;
    logic [75:0] compute_r_rob_part1_item17_D_wire;
    logic [75:0] r_rob_part1_item17_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item17_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item17_D_wire;
    logic [37:0] r_rob_part2_item17_Q_wire;
    logic compute_r_record_f_addr17_WE_wire;
    logic [5:0] compute_r_record_f_addr17_D_wire;
    logic [5:0] r_record_f_addr17_Q_wire;
    logic compute_r_record_x_addr17_WE_wire;
    logic [5:0] compute_r_record_x_addr17_D_wire;
    logic [5:0] r_record_x_addr17_Q_wire;
    logic compute_r_rob_part1_item18_WE_wire;
    logic [75:0] compute_r_rob_part1_item18_D_wire;
    logic [75:0] r_rob_part1_item18_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item18_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item18_D_wire;
    logic [37:0] r_rob_part2_item18_Q_wire;
    logic compute_r_record_f_addr18_WE_wire;
    logic [5:0] compute_r_record_f_addr18_D_wire;
    logic [5:0] r_record_f_addr18_Q_wire;
    logic compute_r_record_x_addr18_WE_wire;
    logic [5:0] compute_r_record_x_addr18_D_wire;
    logic [5:0] r_record_x_addr18_Q_wire;
    logic compute_r_rob_part1_item19_WE_wire;
    logic [75:0] compute_r_rob_part1_item19_D_wire;
    logic [75:0] r_rob_part1_item19_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item19_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item19_D_wire;
    logic [37:0] r_rob_part2_item19_Q_wire;
    logic compute_r_record_f_addr19_WE_wire;
    logic [5:0] compute_r_record_f_addr19_D_wire;
    logic [5:0] r_record_f_addr19_Q_wire;
    logic compute_r_record_x_addr19_WE_wire;
    logic [5:0] compute_r_record_x_addr19_D_wire;
    logic [5:0] r_record_x_addr19_Q_wire;
    logic compute_r_rob_part1_item20_WE_wire;
    logic [75:0] compute_r_rob_part1_item20_D_wire;
    logic [75:0] r_rob_part1_item20_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item20_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item20_D_wire;
    logic [37:0] r_rob_part2_item20_Q_wire;
    logic compute_r_record_f_addr20_WE_wire;
    logic [5:0] compute_r_record_f_addr20_D_wire;
    logic [5:0] r_record_f_addr20_Q_wire;
    logic compute_r_record_x_addr20_WE_wire;
    logic [5:0] compute_r_record_x_addr20_D_wire;
    logic [5:0] r_record_x_addr20_Q_wire;
    logic compute_r_rob_part1_item21_WE_wire;
    logic [75:0] compute_r_rob_part1_item21_D_wire;
    logic [75:0] r_rob_part1_item21_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item21_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item21_D_wire;
    logic [37:0] r_rob_part2_item21_Q_wire;
    logic compute_r_record_f_addr21_WE_wire;
    logic [5:0] compute_r_record_f_addr21_D_wire;
    logic [5:0] r_record_f_addr21_Q_wire;
    logic compute_r_record_x_addr21_WE_wire;
    logic [5:0] compute_r_record_x_addr21_D_wire;
    logic [5:0] r_record_x_addr21_Q_wire;
    logic compute_r_rob_part1_item22_WE_wire;
    logic [75:0] compute_r_rob_part1_item22_D_wire;
    logic [75:0] r_rob_part1_item22_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item22_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item22_D_wire;
    logic [37:0] r_rob_part2_item22_Q_wire;
    logic compute_r_record_f_addr22_WE_wire;
    logic [5:0] compute_r_record_f_addr22_D_wire;
    logic [5:0] r_record_f_addr22_Q_wire;
    logic compute_r_record_x_addr22_WE_wire;
    logic [5:0] compute_r_record_x_addr22_D_wire;
    logic [5:0] r_record_x_addr22_Q_wire;
    logic compute_r_rob_part1_item23_WE_wire;
    logic [75:0] compute_r_rob_part1_item23_D_wire;
    logic [75:0] r_rob_part1_item23_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item23_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item23_D_wire;
    logic [37:0] r_rob_part2_item23_Q_wire;
    logic compute_r_record_f_addr23_WE_wire;
    logic [5:0] compute_r_record_f_addr23_D_wire;
    logic [5:0] r_record_f_addr23_Q_wire;
    logic compute_r_record_x_addr23_WE_wire;
    logic [5:0] compute_r_record_x_addr23_D_wire;
    logic [5:0] r_record_x_addr23_Q_wire;
    logic compute_r_rob_part1_item24_WE_wire;
    logic [75:0] compute_r_rob_part1_item24_D_wire;
    logic [75:0] r_rob_part1_item24_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item24_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item24_D_wire;
    logic [37:0] r_rob_part2_item24_Q_wire;
    logic compute_r_record_f_addr24_WE_wire;
    logic [5:0] compute_r_record_f_addr24_D_wire;
    logic [5:0] r_record_f_addr24_Q_wire;
    logic compute_r_record_x_addr24_WE_wire;
    logic [5:0] compute_r_record_x_addr24_D_wire;
    logic [5:0] r_record_x_addr24_Q_wire;
    logic compute_r_rob_part1_item25_WE_wire;
    logic [75:0] compute_r_rob_part1_item25_D_wire;
    logic [75:0] r_rob_part1_item25_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item25_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item25_D_wire;
    logic [37:0] r_rob_part2_item25_Q_wire;
    logic compute_r_record_f_addr25_WE_wire;
    logic [5:0] compute_r_record_f_addr25_D_wire;
    logic [5:0] r_record_f_addr25_Q_wire;
    logic compute_r_record_x_addr25_WE_wire;
    logic [5:0] compute_r_record_x_addr25_D_wire;
    logic [5:0] r_record_x_addr25_Q_wire;
    logic compute_r_rob_part1_item26_WE_wire;
    logic [75:0] compute_r_rob_part1_item26_D_wire;
    logic [75:0] r_rob_part1_item26_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item26_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item26_D_wire;
    logic [37:0] r_rob_part2_item26_Q_wire;
    logic compute_r_record_f_addr26_WE_wire;
    logic [5:0] compute_r_record_f_addr26_D_wire;
    logic [5:0] r_record_f_addr26_Q_wire;
    logic compute_r_record_x_addr26_WE_wire;
    logic [5:0] compute_r_record_x_addr26_D_wire;
    logic [5:0] r_record_x_addr26_Q_wire;
    logic compute_r_rob_part1_item27_WE_wire;
    logic [75:0] compute_r_rob_part1_item27_D_wire;
    logic [75:0] r_rob_part1_item27_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item27_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item27_D_wire;
    logic [37:0] r_rob_part2_item27_Q_wire;
    logic compute_r_record_f_addr27_WE_wire;
    logic [5:0] compute_r_record_f_addr27_D_wire;
    logic [5:0] r_record_f_addr27_Q_wire;
    logic compute_r_record_x_addr27_WE_wire;
    logic [5:0] compute_r_record_x_addr27_D_wire;
    logic [5:0] r_record_x_addr27_Q_wire;
    logic compute_r_rob_part1_item28_WE_wire;
    logic [75:0] compute_r_rob_part1_item28_D_wire;
    logic [75:0] r_rob_part1_item28_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item28_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item28_D_wire;
    logic [37:0] r_rob_part2_item28_Q_wire;
    logic compute_r_record_f_addr28_WE_wire;
    logic [5:0] compute_r_record_f_addr28_D_wire;
    logic [5:0] r_record_f_addr28_Q_wire;
    logic compute_r_record_x_addr28_WE_wire;
    logic [5:0] compute_r_record_x_addr28_D_wire;
    logic [5:0] r_record_x_addr28_Q_wire;
    logic compute_r_rob_part1_item29_WE_wire;
    logic [75:0] compute_r_rob_part1_item29_D_wire;
    logic [75:0] r_rob_part1_item29_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item29_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item29_D_wire;
    logic [37:0] r_rob_part2_item29_Q_wire;
    logic compute_r_record_f_addr29_WE_wire;
    logic [5:0] compute_r_record_f_addr29_D_wire;
    logic [5:0] r_record_f_addr29_Q_wire;
    logic compute_r_record_x_addr29_WE_wire;
    logic [5:0] compute_r_record_x_addr29_D_wire;
    logic [5:0] r_record_x_addr29_Q_wire;
    logic compute_r_rob_part1_item30_WE_wire;
    logic [75:0] compute_r_rob_part1_item30_D_wire;
    logic [75:0] r_rob_part1_item30_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item30_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item30_D_wire;
    logic [37:0] r_rob_part2_item30_Q_wire;
    logic compute_r_record_f_addr30_WE_wire;
    logic [5:0] compute_r_record_f_addr30_D_wire;
    logic [5:0] r_record_f_addr30_Q_wire;
    logic compute_r_record_x_addr30_WE_wire;
    logic [5:0] compute_r_record_x_addr30_D_wire;
    logic [5:0] r_record_x_addr30_Q_wire;
    logic compute_r_rob_part1_item31_WE_wire;
    logic [75:0] compute_r_rob_part1_item31_D_wire;
    logic [75:0] r_rob_part1_item31_Q_wire;
    logic fpu_ROB_write_r_rob_part2_item31_WE_wire;
    logic [37:0] fpu_ROB_write_r_rob_part2_item31_D_wire;
    logic [37:0] r_rob_part2_item31_Q_wire;
    logic compute_r_record_f_addr31_WE_wire;
    logic [5:0] compute_r_record_f_addr31_D_wire;
    logic [5:0] r_record_f_addr31_Q_wire;
    logic compute_r_record_x_addr31_WE_wire;
    logic [5:0] compute_r_record_x_addr31_D_wire;
    logic [5:0] r_record_x_addr31_Q_wire;
    logic compute_r_fpu_ROB_ptr_WE_wire;
    logic [4:0] compute_r_fpu_ROB_ptr_D_wire;
    logic [4:0] r_fpu_ROB_ptr_Q_wire;
    logic fpu_compute_out_r_fpu_ROB_ptr_out_WE_wire;
    logic [4:0] fpu_compute_out_r_fpu_ROB_ptr_out_D_wire;
    logic [4:0] r_fpu_ROB_ptr_out_Q_wire;
    logic fpu_ROB_write_r_fpu_ROB_done_WE_wire;
    logic [31:0] fpu_ROB_write_r_fpu_ROB_done_D_wire;
    logic [31:0] r_fpu_ROB_done_Q_wire;
    logic fpu_compute_out_r_cnt_ops_inside_WE_wire;
    logic [4:0] fpu_compute_out_r_cnt_ops_inside_D_wire;
    logic [4:0] r_cnt_ops_inside_Q_wire;
    logic fpu_compute_out_add_sub_s_ack_i_D_wire;
    logic compute_add_sub_s_clk_en_i_D_wire;
    logic fpu_compute_out_add_sub_s_flush_i_D_wire;
    logic [5:0] fpu_compute_out_add_sub_s_op_i_D_wire;
    logic [8:0] fpu_compute_out_add_sub_s_properties_i_D_wire;
    logic [2:0] fpu_compute_out_add_sub_s_rm_i_D_wire;
    logic [4:0] fpu_compute_out_add_sub_s_ROB_ptr_i_D_wire;
    logic [31:0] fpu_compute_out_add_sub_s_srcA_i_D_wire;
    logic [31:0] fpu_compute_out_add_sub_s_srcB_i_D_wire;
    logic fpu_compute_out_add_sub_s_start_i_D_wire;
    logic add_sub_s_ack_i_Q_wire;
    logic add_sub_s_clk_en_i_Q_wire;
    logic add_sub_s_done_o_Q_wire;
    logic [4:0] add_sub_s_flags_o_Q_wire;
    logic add_sub_s_ready_o_Q_wire;
    logic [31:0] add_sub_s_result_o_Q_wire;
    logic [4:0] add_sub_s_ROB_ptr_o_Q_wire;
    logic add_sub_s_start_i_Q_wire;
    logic [4:0] fpu_compute_out_classify_s_properties_i_D_wire;
    logic [4:0] fpu_compute_out_classify_s_ROB_ptr_i_D_wire;
    logic [31:0] fpu_compute_out_classify_s_srcA_i_D_wire;
    logic fpu_compute_out_classify_s_start_i_D_wire;
    logic classify_s_done_o_Q_wire;
    logic [31:0] classify_s_result_o_Q_wire;
    logic [4:0] classify_s_ROB_ptr_o_Q_wire;
    logic [5:0] fpu_compute_out_compare_s_op_i_D_wire;
    logic [4:0] fpu_compute_out_compare_s_properties_i_D_wire;
    logic [4:0] fpu_compute_out_compare_s_ROB_ptr_i_D_wire;
    logic [31:0] fpu_compute_out_compare_s_srcA_i_D_wire;
    logic [31:0] fpu_compute_out_compare_s_srcB_i_D_wire;
    logic fpu_compute_out_compare_s_start_i_D_wire;
    logic compare_s_done_o_Q_wire;
    logic [4:0] compare_s_flags_o_Q_wire;
    logic [31:0] compare_s_result_o_Q_wire;
    logic [4:0] compare_s_ROB_ptr_o_Q_wire;
    logic compute_sqrt_div_s_clk_en_i_D_wire;
    logic fpu_compute_out_sqrt_div_s_flush_i_D_wire;
    logic [5:0] fpu_compute_out_sqrt_div_s_op_i_D_wire;
    logic [9:0] fpu_compute_out_sqrt_div_s_properties_i_D_wire;
    logic [2:0] fpu_compute_out_sqrt_div_s_rm_i_D_wire;
    logic [4:0] fpu_compute_out_sqrt_div_s_ROB_ptr_i_D_wire;
    logic [31:0] fpu_compute_out_sqrt_div_s_srcA_i_D_wire;
    logic [31:0] fpu_compute_out_sqrt_div_s_srcB_i_D_wire;
    logic fpu_compute_out_sqrt_div_s_start_i_D_wire;
    logic sqrt_div_s_busy_o_Q_wire;
    logic sqrt_div_s_clk_en_i_Q_wire;
    logic sqrt_div_s_done_o_Q_wire;
    logic [4:0] sqrt_div_s_flags_o_Q_wire;
    logic sqrt_div_s_ready_o_Q_wire;
    logic [31:0] sqrt_div_s_result_o_Q_wire;
    logic [4:0] sqrt_div_s_ROB_ptr_o_Q_wire;
    logic sqrt_div_s_start_i_Q_wire;
    logic fpu_compute_out_float2int_s_ack_i_D_wire;
    logic compute_float2int_s_clk_en_i_D_wire;
    logic fpu_compute_out_float2int_s_flush_i_D_wire;
    logic [5:0] fpu_compute_out_float2int_s_op_i_D_wire;
    logic [2:0] fpu_compute_out_float2int_s_properties_i_D_wire;
    logic [2:0] fpu_compute_out_float2int_s_rm_i_D_wire;
    logic [4:0] fpu_compute_out_float2int_s_ROB_ptr_i_D_wire;
    logic [31:0] fpu_compute_out_float2int_s_srcA_i_D_wire;
    logic fpu_compute_out_float2int_s_start_i_D_wire;
    logic float2int_s_ack_i_Q_wire;
    logic float2int_s_clk_en_i_Q_wire;
    logic float2int_s_done_o_Q_wire;
    logic [4:0] float2int_s_flags_o_Q_wire;
    logic [5:0] float2int_s_op_i_Q_wire;
    logic [2:0] float2int_s_properties_i_Q_wire;
    logic float2int_s_ready_o_Q_wire;
    logic [31:0] float2int_s_result_o_Q_wire;
    logic [2:0] float2int_s_rm_i_Q_wire;
    logic [4:0] float2int_s_ROB_ptr_i_Q_wire;
    logic [4:0] float2int_s_ROB_ptr_o_Q_wire;
    logic [31:0] float2int_s_srcA_i_Q_wire;
    logic float2int_s_start_i_Q_wire;
    logic compute_fused_s_clk_en_i_D_wire;
    logic fpu_compute_out_fused_s_flush_i_D_wire;
    logic [57:0] fpu_compute_out_fused_s_mul_partial_result_i_D_wire;
    logic [5:0] fpu_compute_out_fused_s_op_i_D_wire;
    logic [8:0] fpu_compute_out_fused_s_properties_i_D_wire;
    logic [2:0] fpu_compute_out_fused_s_rm_i_D_wire;
    logic [4:0] fpu_compute_out_fused_s_ROB_ptr_i_D_wire;
    logic [31:0] fpu_compute_out_fused_s_srcA_i_D_wire;
    logic [31:0] fpu_compute_out_fused_s_srcB_i_D_wire;
    logic [31:0] fpu_compute_out_fused_s_srcC_i_D_wire;
    logic fpu_compute_out_fused_s_start_i_D_wire;
    logic fused_s_clk_en_i_Q_wire;
    logic fused_s_done_o_Q_wire;
    logic [4:0] fused_s_flags_o_Q_wire;
    logic [31:0] fused_s_result_o_Q_wire;
    logic [4:0] fused_s_ROB_ptr_o_Q_wire;
    logic fused_s_start_i_Q_wire;
    logic fpu_compute_out_int2float_s_ack_i_D_wire;
    logic compute_int2float_s_clk_en_i_D_wire;
    logic fpu_compute_out_int2float_s_flush_i_D_wire;
    logic [5:0] fpu_compute_out_int2float_s_op_i_D_wire;
    logic [2:0] fpu_compute_out_int2float_s_rm_i_D_wire;
    logic [4:0] fpu_compute_out_int2float_s_ROB_ptr_i_D_wire;
    logic [31:0] fpu_compute_out_int2float_s_srcA_i_D_wire;
    logic fpu_compute_out_int2float_s_start_i_D_wire;
    logic int2float_s_ack_i_Q_wire;
    logic int2float_s_clk_en_i_Q_wire;
    logic int2float_s_done_o_Q_wire;
    logic [4:0] int2float_s_flags_o_Q_wire;
    logic int2float_s_ready_o_Q_wire;
    logic [31:0] int2float_s_result_o_Q_wire;
    logic [4:0] int2float_s_ROB_ptr_o_Q_wire;
    logic int2float_s_start_i_Q_wire;
    logic [4:0] fpu_compute_out_move_s_ROB_ptr_i_D_wire;
    logic [31:0] fpu_compute_out_move_s_srcA_i_D_wire;
    logic fpu_compute_out_move_s_start_i_D_wire;
    logic move_s_done_o_Q_wire;
    logic [31:0] move_s_result_o_Q_wire;
    logic [4:0] move_s_ROB_ptr_o_Q_wire;
    logic compute_fmul_s_clk_en_i_D_wire;
    logic fpu_compute_out_fmul_s_flush_i_D_wire;
    logic [5:0] fpu_compute_out_fmul_s_op_i_D_wire;
    logic [7:0] fpu_compute_out_fmul_s_properties_i_D_wire;
    logic [2:0] fpu_compute_out_fmul_s_rm_i_D_wire;
    logic [4:0] fpu_compute_out_fmul_s_ROB_ptr_i_D_wire;
    logic [31:0] fpu_compute_out_fmul_s_srcA_i_D_wire;
    logic [31:0] fpu_compute_out_fmul_s_srcB_i_D_wire;
    logic fpu_compute_out_fmul_s_start_i_D_wire;
    logic fmul_s_clk_en_i_Q_wire;
    logic fmul_s_done_o_Q_wire;
    logic [4:0] fmul_s_flags_o_Q_wire;
    logic [57:0] fmul_s_mul_partial_result_Q_wire;
    logic [31:0] fmul_s_result_o_Q_wire;
    logic [4:0] fmul_s_ROB_ptr_o_Q_wire;
    logic fmul_s_start_i_Q_wire;
    logic [5:0] fpu_compute_out_sgnj_s_op_i_D_wire;
    logic [4:0] fpu_compute_out_sgnj_s_ROB_ptr_i_D_wire;
    logic [31:0] fpu_compute_out_sgnj_s_srcA_i_D_wire;
    logic [31:0] fpu_compute_out_sgnj_s_srcB_i_D_wire;
    logic fpu_compute_out_sgnj_s_start_i_D_wire;
    logic sgnj_s_done_o_Q_wire;
    logic [31:0] sgnj_s_result_o_Q_wire;
    logic [4:0] sgnj_s_ROB_ptr_o_Q_wire;
    logic [31:0] fpu_compute_out_parsing_inputs_s_srcA_i_D_wire;
    logic [31:0] fpu_compute_out_parsing_inputs_s_srcB_i_D_wire;
    logic [31:0] fpu_compute_out_parsing_inputs_s_srcC_i_D_wire;
    logic [8:0] parsing_inputs_s_add_sub_properties_o_Q_wire;
    logic [4:0] parsing_inputs_s_classify_properties_o_Q_wire;
    logic [4:0] parsing_inputs_s_cmp_properties_o_Q_wire;
    logic [2:0] parsing_inputs_s_f2i_properties_o_Q_wire;
    logic [8:0] parsing_inputs_s_fused_properties_o_Q_wire;
    logic [7:0] parsing_inputs_s_mul_properties_o_Q_wire;
    logic [9:0] parsing_inputs_s_sqrt_div_properties_o_Q_wire;

    // child instances inside CodAL module:
    // instance of 's_valid_i' CodAL signal/wire: (single driver)
    assign s_valid_i = s_valid_i_D;
    // instance of 's_op_i' CodAL signal/wire: (single driver)
    assign s_op_i = s_op_i_D;
    // instance of 's_s1_data_i' CodAL signal/wire: (single driver)
    assign s_s1_data_i = s_s1_data_i_D;
    // instance of 's_s2_data_i' CodAL signal/wire: (single driver)
    assign s_s2_data_i = s_s2_data_i_D;
    // instance of 's_s3_data_i' CodAL signal/wire: (single driver)
    assign s_s3_data_i = s_s3_data_i_D;
    // instance of 's_s1_addr_i' CodAL signal/wire: (single driver)
    assign s_s1_addr_i = s_s1_addr_i_D;
    // instance of 's_s2_addr_i' CodAL signal/wire: (single driver)
    assign s_s2_addr_i = s_s2_addr_i_D;
    // instance of 's_s3_addr_i' CodAL signal/wire: (single driver)
    assign s_s3_addr_i = s_s3_addr_i_D;
    // instance of 's_rd_addr_i' CodAL signal/wire: (single driver)
    assign s_rd_addr_i = s_rd_addr_i_D;
    // instance of 's_rm_i' CodAL signal/wire: (single driver)
    assign s_rm_i = s_rm_i_D;
    // instance of 's_frm_i' CodAL signal/wire: (single driver)
    assign s_frm_i = s_frm_i_D;
    // instance of 's_ack_i' CodAL signal/wire: (single driver)
    assign s_ack_i = s_ack_i_D;
    // instance of 's_flush_i' CodAL signal/wire: (single driver)
    assign s_flush_i = s_flush_i_D;
    // instance of 's_instr_addr_i' CodAL signal/wire: (single driver)
    assign s_instr_addr_i = s_instr_addr_i_D;
    // instance of 's_instr_i' CodAL signal/wire: (single driver)
    assign s_instr_i = s_instr_i_D;
    // instance of 's_exc_type_i' CodAL signal/wire: (single driver)
    assign s_exc_type_i = s_exc_type_i_D;
    // instance of 's_exc_valid_i' CodAL signal/wire: (single driver)
    assign s_exc_valid_i = s_exc_valid_i_D;
    // instance of 's_rd_data_o' CodAL signal/wire: (parent port driver(s))
    assign s_rd_data_o_Q = s_rd_data_o;
    // instance of 's_flags_o' CodAL signal/wire: (parent port driver(s))
    assign s_flags_o_Q = s_flags_o;
    // instance of 's_rd_addr_o' CodAL signal/wire: (parent port driver(s))
    assign s_rd_addr_o_Q = s_rd_addr_o;
    // instance of 's_valid_o' CodAL signal/wire: (parent port driver(s))
    assign s_valid_o_Q = s_valid_o;
    // instance of 's_busy_o' CodAL signal/wire: (parent port driver(s))
    assign s_busy_o_Q = s_busy_o;
    // instance of 's_ready_o' CodAL signal/wire: (parent port driver(s))
    assign s_ready_o_Q = s_ready_o;
    // instance of 's_exc_type_o' CodAL signal/wire: (parent port driver(s))
    assign s_exc_type_o_Q = s_exc_type_o;
    // instance of 's_exc_valid_o' CodAL signal/wire: (parent port driver(s))
    assign s_exc_valid_o_Q = s_exc_valid_o;
    // instance of 's_exc_instr_addr_o' CodAL signal/wire: (parent port driver(s))
    assign s_exc_instr_addr_o_Q = s_exc_instr_addr_o;
    // instance of 's_exc_tval_o' CodAL signal/wire: (parent port driver(s))
    assign s_exc_tval_o_Q = s_exc_tval_o;
    // instance of 's_rdx_valid_o' CodAL signal/wire: (parent port driver(s))
    assign s_rdx_valid_o_Q = s_rdx_valid_o;
    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_fpu_op (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_CONTROL_CLEAR_Q),
        .STALL(control_fpu_CONTROL_STALL_Q),
        .WE(compute_r_fpu_op_WE_wire),
        .D(compute_r_fpu_op_D_wire),
        .Q(r_fpu_op_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_is_fpu_op (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_CONTROL_CLEAR_Q),
        .STALL(control_fpu_CONTROL_STALL_Q),
        .WE(compute_r_is_fpu_op_WE_wire),
        .D(compute_r_is_fpu_op_D_wire),
        .Q(r_is_fpu_op_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_fpu_src_A (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_fpu_src_A_WE_wire),
        .D(compute_r_fpu_src_A_D_wire),
        .Q(r_fpu_src_A_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_fpu_src_B (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_fpu_src_B_WE_wire),
        .D(compute_r_fpu_src_B_D_wire),
        .Q(r_fpu_src_B_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_fpu_src_C (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_fpu_src_C_WE_wire),
        .D(compute_r_fpu_src_C_D_wire),
        .Q(r_fpu_src_C_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_fpu_s1_addr (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_CONTROL_CLEAR_Q),
        .STALL(control_fpu_CONTROL_STALL_Q),
        .WE(compute_r_fpu_s1_addr_WE_wire),
        .D(compute_r_fpu_s1_addr_D_wire),
        .Q(r_fpu_s1_addr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_fpu_s2_addr (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_CONTROL_CLEAR_Q),
        .STALL(control_fpu_CONTROL_STALL_Q),
        .WE(compute_r_fpu_s2_addr_WE_wire),
        .D(compute_r_fpu_s2_addr_D_wire),
        .Q(r_fpu_s2_addr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_fpu_s3_addr (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_CONTROL_CLEAR_Q),
        .STALL(control_fpu_CONTROL_STALL_Q),
        .WE(compute_r_fpu_s3_addr_WE_wire),
        .D(compute_r_fpu_s3_addr_D_wire),
        .Q(r_fpu_s3_addr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_fpu_rm (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_CONTROL_CLEAR_Q),
        .STALL(control_fpu_CONTROL_STALL_Q),
        .WE(compute_r_fpu_rm_WE_wire),
        .D(compute_r_fpu_rm_D_wire),
        .Q(r_fpu_rm_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_instr_addr (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_CONTROL_CLEAR_Q),
        .STALL(control_fpu_CONTROL_STALL_Q),
        .WE(compute_r_instr_addr_WE_wire),
        .D(compute_r_instr_addr_D_wire),
        .Q(r_instr_addr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_instr (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_CONTROL_CLEAR_Q),
        .STALL(control_fpu_CONTROL_STALL_Q),
        .WE(compute_r_instr_WE_wire),
        .D(compute_r_instr_D_wire),
        .Q(r_instr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_fpu_dst_addr (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_CONTROL_CLEAR_Q),
        .STALL(control_fpu_CONTROL_STALL_Q),
        .WE(compute_r_fpu_dst_addr_WE_wire),
        .D(compute_r_fpu_dst_addr_D_wire),
        .Q(r_fpu_dst_addr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_exc_type (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_CONTROL_CLEAR_Q),
        .STALL(control_fpu_CONTROL_STALL_Q),
        .WE(compute_r_exc_type_WE_wire),
        .D(compute_r_exc_type_D_wire),
        .Q(r_exc_type_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_exc_valid (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_CONTROL_CLEAR_Q),
        .STALL(control_fpu_CONTROL_STALL_Q),
        .WE(compute_r_exc_valid_WE_wire),
        .D(compute_r_exc_valid_D_wire),
        .Q(r_exc_valid_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_exc_en (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_exc_en_WE_wire),
        .D(compute_r_exc_en_D_wire),
        .Q(r_exc_en_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_exc_stall (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_compute_out_r_exc_stall_WE_wire),
        .D(fpu_compute_out_r_exc_stall_D_wire),
        .Q(r_exc_stall_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_exc_op (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_exc_op_WE_wire),
        .D(compute_r_exc_op_D_wire),
        .Q(r_exc_op_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_start_add_sub (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_start_add_sub_WE_wire),
        .D(compute_r_start_add_sub_D_wire),
        .Q(r_start_add_sub_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_start_move (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_start_move_WE_wire),
        .D(compute_r_start_move_D_wire),
        .Q(r_start_move_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_start_classify (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_start_classify_WE_wire),
        .D(compute_r_start_classify_D_wire),
        .Q(r_start_classify_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_start_cmp (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_start_cmp_WE_wire),
        .D(compute_r_start_cmp_D_wire),
        .Q(r_start_cmp_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_start_i2f (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_start_i2f_WE_wire),
        .D(compute_r_start_i2f_D_wire),
        .Q(r_start_i2f_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_start_sgnj (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_start_sgnj_WE_wire),
        .D(compute_r_start_sgnj_D_wire),
        .Q(r_start_sgnj_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_start_fused (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_start_fused_WE_wire),
        .D(compute_r_start_fused_D_wire),
        .Q(r_start_fused_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_start_max_min (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_start_max_min_WE_wire),
        .D(compute_r_start_max_min_D_wire),
        .Q(r_start_max_min_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_start_sqrt_div (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_start_sqrt_div_WE_wire),
        .D(compute_r_start_sqrt_div_D_wire),
        .Q(r_start_sqrt_div_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_start_f2i (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_start_f2i_WE_wire),
        .D(compute_r_start_f2i_D_wire),
        .Q(r_start_f2i_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_start_mul (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_start_mul_WE_wire),
        .D(compute_r_start_mul_D_wire),
        .Q(r_start_mul_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_busy (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_busy_WE_wire),
        .D(compute_r_busy_D_wire),
        .Q(r_busy_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_stall_fwd (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_stall_fwd_WE_wire),
        .D(compute_r_stall_fwd_D_wire),
        .Q(r_stall_fwd_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_unit_stall (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_unit_stall_WE_wire),
        .D(compute_r_unit_stall_D_wire),
        .Q(r_unit_stall_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_full_ports (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_compute_out_r_full_ports_WE_wire),
        .D(fpu_compute_out_r_full_ports_D_wire),
        .Q(r_full_ports_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item0 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item0_WE_wire),
        .D(compute_r_rob_part1_item0_D_wire),
        .Q(r_rob_part1_item0_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item0 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item0_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item0_D_wire),
        .Q(r_rob_part2_item0_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr0 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr0_WE_wire),
        .D(compute_r_record_f_addr0_D_wire),
        .Q(r_record_f_addr0_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item1 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item1_WE_wire),
        .D(compute_r_rob_part1_item1_D_wire),
        .Q(r_rob_part1_item1_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item1 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item1_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item1_D_wire),
        .Q(r_rob_part2_item1_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr1 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr1_WE_wire),
        .D(compute_r_record_f_addr1_D_wire),
        .Q(r_record_f_addr1_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr1 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr1_WE_wire),
        .D(compute_r_record_x_addr1_D_wire),
        .Q(r_record_x_addr1_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item2 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item2_WE_wire),
        .D(compute_r_rob_part1_item2_D_wire),
        .Q(r_rob_part1_item2_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item2 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item2_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item2_D_wire),
        .Q(r_rob_part2_item2_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr2 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr2_WE_wire),
        .D(compute_r_record_f_addr2_D_wire),
        .Q(r_record_f_addr2_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr2 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr2_WE_wire),
        .D(compute_r_record_x_addr2_D_wire),
        .Q(r_record_x_addr2_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item3 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item3_WE_wire),
        .D(compute_r_rob_part1_item3_D_wire),
        .Q(r_rob_part1_item3_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item3 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item3_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item3_D_wire),
        .Q(r_rob_part2_item3_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr3 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr3_WE_wire),
        .D(compute_r_record_f_addr3_D_wire),
        .Q(r_record_f_addr3_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr3 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr3_WE_wire),
        .D(compute_r_record_x_addr3_D_wire),
        .Q(r_record_x_addr3_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item4 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item4_WE_wire),
        .D(compute_r_rob_part1_item4_D_wire),
        .Q(r_rob_part1_item4_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item4 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item4_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item4_D_wire),
        .Q(r_rob_part2_item4_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr4 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr4_WE_wire),
        .D(compute_r_record_f_addr4_D_wire),
        .Q(r_record_f_addr4_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr4 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr4_WE_wire),
        .D(compute_r_record_x_addr4_D_wire),
        .Q(r_record_x_addr4_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item5 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item5_WE_wire),
        .D(compute_r_rob_part1_item5_D_wire),
        .Q(r_rob_part1_item5_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item5 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item5_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item5_D_wire),
        .Q(r_rob_part2_item5_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr5 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr5_WE_wire),
        .D(compute_r_record_f_addr5_D_wire),
        .Q(r_record_f_addr5_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr5 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr5_WE_wire),
        .D(compute_r_record_x_addr5_D_wire),
        .Q(r_record_x_addr5_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item6 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item6_WE_wire),
        .D(compute_r_rob_part1_item6_D_wire),
        .Q(r_rob_part1_item6_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item6 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item6_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item6_D_wire),
        .Q(r_rob_part2_item6_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr6 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr6_WE_wire),
        .D(compute_r_record_f_addr6_D_wire),
        .Q(r_record_f_addr6_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr6 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr6_WE_wire),
        .D(compute_r_record_x_addr6_D_wire),
        .Q(r_record_x_addr6_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item7 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item7_WE_wire),
        .D(compute_r_rob_part1_item7_D_wire),
        .Q(r_rob_part1_item7_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item7 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item7_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item7_D_wire),
        .Q(r_rob_part2_item7_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr7 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr7_WE_wire),
        .D(compute_r_record_f_addr7_D_wire),
        .Q(r_record_f_addr7_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr7 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr7_WE_wire),
        .D(compute_r_record_x_addr7_D_wire),
        .Q(r_record_x_addr7_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item8 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item8_WE_wire),
        .D(compute_r_rob_part1_item8_D_wire),
        .Q(r_rob_part1_item8_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item8 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item8_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item8_D_wire),
        .Q(r_rob_part2_item8_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr8 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr8_WE_wire),
        .D(compute_r_record_f_addr8_D_wire),
        .Q(r_record_f_addr8_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr8 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr8_WE_wire),
        .D(compute_r_record_x_addr8_D_wire),
        .Q(r_record_x_addr8_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item9 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item9_WE_wire),
        .D(compute_r_rob_part1_item9_D_wire),
        .Q(r_rob_part1_item9_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item9 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item9_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item9_D_wire),
        .Q(r_rob_part2_item9_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr9 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr9_WE_wire),
        .D(compute_r_record_f_addr9_D_wire),
        .Q(r_record_f_addr9_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr9 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr9_WE_wire),
        .D(compute_r_record_x_addr9_D_wire),
        .Q(r_record_x_addr9_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item10 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item10_WE_wire),
        .D(compute_r_rob_part1_item10_D_wire),
        .Q(r_rob_part1_item10_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item10 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item10_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item10_D_wire),
        .Q(r_rob_part2_item10_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr10 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr10_WE_wire),
        .D(compute_r_record_f_addr10_D_wire),
        .Q(r_record_f_addr10_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr10 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr10_WE_wire),
        .D(compute_r_record_x_addr10_D_wire),
        .Q(r_record_x_addr10_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item11 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item11_WE_wire),
        .D(compute_r_rob_part1_item11_D_wire),
        .Q(r_rob_part1_item11_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item11 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item11_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item11_D_wire),
        .Q(r_rob_part2_item11_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr11 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr11_WE_wire),
        .D(compute_r_record_f_addr11_D_wire),
        .Q(r_record_f_addr11_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr11 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr11_WE_wire),
        .D(compute_r_record_x_addr11_D_wire),
        .Q(r_record_x_addr11_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item12 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item12_WE_wire),
        .D(compute_r_rob_part1_item12_D_wire),
        .Q(r_rob_part1_item12_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item12 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item12_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item12_D_wire),
        .Q(r_rob_part2_item12_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr12 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr12_WE_wire),
        .D(compute_r_record_f_addr12_D_wire),
        .Q(r_record_f_addr12_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr12 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr12_WE_wire),
        .D(compute_r_record_x_addr12_D_wire),
        .Q(r_record_x_addr12_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item13 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item13_WE_wire),
        .D(compute_r_rob_part1_item13_D_wire),
        .Q(r_rob_part1_item13_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item13 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item13_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item13_D_wire),
        .Q(r_rob_part2_item13_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr13 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr13_WE_wire),
        .D(compute_r_record_f_addr13_D_wire),
        .Q(r_record_f_addr13_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr13 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr13_WE_wire),
        .D(compute_r_record_x_addr13_D_wire),
        .Q(r_record_x_addr13_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item14 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item14_WE_wire),
        .D(compute_r_rob_part1_item14_D_wire),
        .Q(r_rob_part1_item14_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item14 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item14_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item14_D_wire),
        .Q(r_rob_part2_item14_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr14 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr14_WE_wire),
        .D(compute_r_record_f_addr14_D_wire),
        .Q(r_record_f_addr14_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr14 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr14_WE_wire),
        .D(compute_r_record_x_addr14_D_wire),
        .Q(r_record_x_addr14_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item15 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item15_WE_wire),
        .D(compute_r_rob_part1_item15_D_wire),
        .Q(r_rob_part1_item15_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item15 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item15_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item15_D_wire),
        .Q(r_rob_part2_item15_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr15 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr15_WE_wire),
        .D(compute_r_record_f_addr15_D_wire),
        .Q(r_record_f_addr15_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr15 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr15_WE_wire),
        .D(compute_r_record_x_addr15_D_wire),
        .Q(r_record_x_addr15_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item16 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item16_WE_wire),
        .D(compute_r_rob_part1_item16_D_wire),
        .Q(r_rob_part1_item16_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item16 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item16_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item16_D_wire),
        .Q(r_rob_part2_item16_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr16 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr16_WE_wire),
        .D(compute_r_record_f_addr16_D_wire),
        .Q(r_record_f_addr16_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr16 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr16_WE_wire),
        .D(compute_r_record_x_addr16_D_wire),
        .Q(r_record_x_addr16_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item17 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item17_WE_wire),
        .D(compute_r_rob_part1_item17_D_wire),
        .Q(r_rob_part1_item17_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item17 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item17_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item17_D_wire),
        .Q(r_rob_part2_item17_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr17 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr17_WE_wire),
        .D(compute_r_record_f_addr17_D_wire),
        .Q(r_record_f_addr17_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr17 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr17_WE_wire),
        .D(compute_r_record_x_addr17_D_wire),
        .Q(r_record_x_addr17_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item18 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item18_WE_wire),
        .D(compute_r_rob_part1_item18_D_wire),
        .Q(r_rob_part1_item18_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item18 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item18_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item18_D_wire),
        .Q(r_rob_part2_item18_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr18 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr18_WE_wire),
        .D(compute_r_record_f_addr18_D_wire),
        .Q(r_record_f_addr18_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr18 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr18_WE_wire),
        .D(compute_r_record_x_addr18_D_wire),
        .Q(r_record_x_addr18_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item19 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item19_WE_wire),
        .D(compute_r_rob_part1_item19_D_wire),
        .Q(r_rob_part1_item19_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item19 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item19_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item19_D_wire),
        .Q(r_rob_part2_item19_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr19 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr19_WE_wire),
        .D(compute_r_record_f_addr19_D_wire),
        .Q(r_record_f_addr19_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr19 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr19_WE_wire),
        .D(compute_r_record_x_addr19_D_wire),
        .Q(r_record_x_addr19_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item20 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item20_WE_wire),
        .D(compute_r_rob_part1_item20_D_wire),
        .Q(r_rob_part1_item20_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item20 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item20_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item20_D_wire),
        .Q(r_rob_part2_item20_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr20 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr20_WE_wire),
        .D(compute_r_record_f_addr20_D_wire),
        .Q(r_record_f_addr20_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr20 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr20_WE_wire),
        .D(compute_r_record_x_addr20_D_wire),
        .Q(r_record_x_addr20_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item21 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item21_WE_wire),
        .D(compute_r_rob_part1_item21_D_wire),
        .Q(r_rob_part1_item21_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item21 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item21_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item21_D_wire),
        .Q(r_rob_part2_item21_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr21 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr21_WE_wire),
        .D(compute_r_record_f_addr21_D_wire),
        .Q(r_record_f_addr21_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr21 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr21_WE_wire),
        .D(compute_r_record_x_addr21_D_wire),
        .Q(r_record_x_addr21_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item22 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item22_WE_wire),
        .D(compute_r_rob_part1_item22_D_wire),
        .Q(r_rob_part1_item22_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item22 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item22_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item22_D_wire),
        .Q(r_rob_part2_item22_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr22 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr22_WE_wire),
        .D(compute_r_record_f_addr22_D_wire),
        .Q(r_record_f_addr22_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr22 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr22_WE_wire),
        .D(compute_r_record_x_addr22_D_wire),
        .Q(r_record_x_addr22_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item23 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item23_WE_wire),
        .D(compute_r_rob_part1_item23_D_wire),
        .Q(r_rob_part1_item23_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item23 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item23_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item23_D_wire),
        .Q(r_rob_part2_item23_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr23 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr23_WE_wire),
        .D(compute_r_record_f_addr23_D_wire),
        .Q(r_record_f_addr23_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr23 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr23_WE_wire),
        .D(compute_r_record_x_addr23_D_wire),
        .Q(r_record_x_addr23_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item24 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item24_WE_wire),
        .D(compute_r_rob_part1_item24_D_wire),
        .Q(r_rob_part1_item24_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item24 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item24_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item24_D_wire),
        .Q(r_rob_part2_item24_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr24 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr24_WE_wire),
        .D(compute_r_record_f_addr24_D_wire),
        .Q(r_record_f_addr24_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr24 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr24_WE_wire),
        .D(compute_r_record_x_addr24_D_wire),
        .Q(r_record_x_addr24_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item25 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item25_WE_wire),
        .D(compute_r_rob_part1_item25_D_wire),
        .Q(r_rob_part1_item25_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item25 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item25_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item25_D_wire),
        .Q(r_rob_part2_item25_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr25 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr25_WE_wire),
        .D(compute_r_record_f_addr25_D_wire),
        .Q(r_record_f_addr25_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr25 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr25_WE_wire),
        .D(compute_r_record_x_addr25_D_wire),
        .Q(r_record_x_addr25_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item26 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item26_WE_wire),
        .D(compute_r_rob_part1_item26_D_wire),
        .Q(r_rob_part1_item26_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item26 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item26_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item26_D_wire),
        .Q(r_rob_part2_item26_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr26 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr26_WE_wire),
        .D(compute_r_record_f_addr26_D_wire),
        .Q(r_record_f_addr26_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr26 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr26_WE_wire),
        .D(compute_r_record_x_addr26_D_wire),
        .Q(r_record_x_addr26_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item27 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item27_WE_wire),
        .D(compute_r_rob_part1_item27_D_wire),
        .Q(r_rob_part1_item27_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item27 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item27_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item27_D_wire),
        .Q(r_rob_part2_item27_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr27 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr27_WE_wire),
        .D(compute_r_record_f_addr27_D_wire),
        .Q(r_record_f_addr27_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr27 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr27_WE_wire),
        .D(compute_r_record_x_addr27_D_wire),
        .Q(r_record_x_addr27_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item28 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item28_WE_wire),
        .D(compute_r_rob_part1_item28_D_wire),
        .Q(r_rob_part1_item28_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item28 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item28_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item28_D_wire),
        .Q(r_rob_part2_item28_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr28 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr28_WE_wire),
        .D(compute_r_record_f_addr28_D_wire),
        .Q(r_record_f_addr28_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr28 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr28_WE_wire),
        .D(compute_r_record_x_addr28_D_wire),
        .Q(r_record_x_addr28_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item29 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item29_WE_wire),
        .D(compute_r_rob_part1_item29_D_wire),
        .Q(r_rob_part1_item29_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item29 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item29_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item29_D_wire),
        .Q(r_rob_part2_item29_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr29 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr29_WE_wire),
        .D(compute_r_record_f_addr29_D_wire),
        .Q(r_record_f_addr29_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr29 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr29_WE_wire),
        .D(compute_r_record_x_addr29_D_wire),
        .Q(r_record_x_addr29_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item30 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item30_WE_wire),
        .D(compute_r_rob_part1_item30_D_wire),
        .Q(r_rob_part1_item30_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item30 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item30_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item30_D_wire),
        .Q(r_rob_part2_item30_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr30 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr30_WE_wire),
        .D(compute_r_record_f_addr30_D_wire),
        .Q(r_record_f_addr30_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr30 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr30_WE_wire),
        .D(compute_r_record_x_addr30_D_wire),
        .Q(r_record_x_addr30_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd76),
        .DEFAULT_VALUE({76{1'b0}}),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part1_item31 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_rob_part1_item31_WE_wire),
        .D(compute_r_rob_part1_item31_D_wire),
        .Q(r_rob_part1_item31_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd38),
        .DEFAULT_VALUE(38'h0000000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_rob_part2_item31 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_rob_part2_item31_WE_wire),
        .D(fpu_ROB_write_r_rob_part2_item31_D_wire),
        .Q(r_rob_part2_item31_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_f_addr31 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_f_addr31_WE_wire),
        .D(compute_r_record_f_addr31_D_wire),
        .Q(r_record_f_addr31_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd6),
        .DEFAULT_VALUE(6'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_record_x_addr31 (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_record_x_addr31_WE_wire),
        .D(compute_r_record_x_addr31_D_wire),
        .Q(r_record_x_addr31_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_fpu_ROB_ptr (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(compute_r_fpu_ROB_ptr_WE_wire),
        .D(compute_r_fpu_ROB_ptr_D_wire),
        .Q(r_fpu_ROB_ptr_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_fpu_ROB_ptr_out (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_compute_out_r_fpu_ROB_ptr_out_WE_wire),
        .D(fpu_compute_out_r_fpu_ROB_ptr_out_D_wire),
        .Q(r_fpu_ROB_ptr_out_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_fpu_ROB_done (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_ROB_write_r_fpu_ROB_done_WE_wire),
        .D(fpu_ROB_write_r_fpu_ROB_done_D_wire),
        .Q(r_fpu_ROB_done_Q_wire)
    );

    // register instance:
    d_ff_rst_we_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_cnt_ops_inside (
        .CLK(s_fpu_ce_ICLK),
        .RST(RST),
        .CLEAR(control_fpu_ROB_CLEAR_Q),
        .WE(fpu_compute_out_r_cnt_ops_inside_WE_wire),
        .D(fpu_compute_out_r_cnt_ops_inside_D_wire),
        .Q(r_cnt_ops_inside_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_execute_stage_fpu_add_sub_t add_sub (
        .execute_stage_fpu_add_sub_s_add_sub_ce_ICLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK),
        .RST(RST),
        .pipe_add_sub_COMPUTE_CLEAR_Q(pipe_add_sub_COMPUTE_CLEAR_Q),
        .pipe_add_sub_COMPUTE_STALL_Q(pipe_add_sub_COMPUTE_STALL_Q),
        .pipe_add_sub_POSTNORM_CLEAR_Q(pipe_add_sub_POSTNORM_CLEAR_Q),
        .pipe_add_sub_POSTNORM_STALL_Q(pipe_add_sub_POSTNORM_STALL_Q),
        .pipe_add_sub_ROUNDING_CLEAR_Q(pipe_add_sub_ROUNDING_CLEAR_Q),
        .pipe_add_sub_ROUNDING_STALL_Q(pipe_add_sub_ROUNDING_STALL_Q),
        .s_ack_i_D(fpu_compute_out_add_sub_s_ack_i_D_wire),
        .s_clk_en_i_D(compute_add_sub_s_clk_en_i_D_wire),
        .s_flush_i_D(fpu_compute_out_add_sub_s_flush_i_D_wire),
        .s_op_i_D(fpu_compute_out_add_sub_s_op_i_D_wire),
        .s_properties_i_D(fpu_compute_out_add_sub_s_properties_i_D_wire),
        .s_rm_i_D(fpu_compute_out_add_sub_s_rm_i_D_wire),
        .s_ROB_ptr_i_D(fpu_compute_out_add_sub_s_ROB_ptr_i_D_wire),
        .s_srcA_i_D(fpu_compute_out_add_sub_s_srcA_i_D_wire),
        .s_srcB_i_D(fpu_compute_out_add_sub_s_srcB_i_D_wire),
        .s_start_i_D(fpu_compute_out_add_sub_s_start_i_D_wire),
        .pipe_add_sub_COMPUTE_CLEAR_D(pipe_add_sub_COMPUTE_CLEAR_D),
        .pipe_add_sub_COMPUTE_STALL_D(pipe_add_sub_COMPUTE_STALL_D),
        .pipe_add_sub_POSTNORM_CLEAR_D(pipe_add_sub_POSTNORM_CLEAR_D),
        .pipe_add_sub_POSTNORM_STALL_D(pipe_add_sub_POSTNORM_STALL_D),
        .pipe_add_sub_ROUNDING_CLEAR_D(pipe_add_sub_ROUNDING_CLEAR_D),
        .pipe_add_sub_ROUNDING_STALL_D(pipe_add_sub_ROUNDING_STALL_D),
        .s_ack_i_Q(add_sub_s_ack_i_Q_wire),
        .s_add_sub_ce_Q(add_sub_s_add_sub_ce_Q),
        .s_clk_en_i_Q(add_sub_s_clk_en_i_Q_wire),
        .s_done_o_Q(add_sub_s_done_o_Q_wire),
        .s_flags_o_Q(add_sub_s_flags_o_Q_wire),
        .s_ready_o_Q(add_sub_s_ready_o_Q_wire),
        .s_result_o_Q(add_sub_s_result_o_Q_wire),
        .s_ROB_ptr_o_Q(add_sub_s_ROB_ptr_o_Q_wire),
        .s_start_i_Q(add_sub_s_start_i_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_execute_stage_fpu_classify_t classify (
        .s_properties_i_D(fpu_compute_out_classify_s_properties_i_D_wire),
        .s_ROB_ptr_i_D(fpu_compute_out_classify_s_ROB_ptr_i_D_wire),
        .s_srcA_i_D(fpu_compute_out_classify_s_srcA_i_D_wire),
        .s_start_i_D(fpu_compute_out_classify_s_start_i_D_wire),
        .s_done_o_Q(classify_s_done_o_Q_wire),
        .s_result_o_Q(classify_s_result_o_Q_wire),
        .s_ROB_ptr_o_Q(classify_s_ROB_ptr_o_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_execute_stage_fpu_compare_t compare (
        .s_op_i_D(fpu_compute_out_compare_s_op_i_D_wire),
        .s_properties_i_D(fpu_compute_out_compare_s_properties_i_D_wire),
        .s_ROB_ptr_i_D(fpu_compute_out_compare_s_ROB_ptr_i_D_wire),
        .s_srcA_i_D(fpu_compute_out_compare_s_srcA_i_D_wire),
        .s_srcB_i_D(fpu_compute_out_compare_s_srcB_i_D_wire),
        .s_start_i_D(fpu_compute_out_compare_s_start_i_D_wire),
        .s_done_o_Q(compare_s_done_o_Q_wire),
        .s_flags_o_Q(compare_s_flags_o_Q_wire),
        .s_result_o_Q(compare_s_result_o_Q_wire),
        .s_ROB_ptr_o_Q(compare_s_ROB_ptr_o_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_execute_stage_fpu_sqrt_div_t sqrt_div (
        .execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK),
        .RST(RST),
        .pipe_sqrt_div_SQRT_DIV_CLEAR_Q(pipe_sqrt_div_SQRT_DIV_CLEAR_Q),
        .s_clk_en_i_D(compute_sqrt_div_s_clk_en_i_D_wire),
        .s_flush_i_D(fpu_compute_out_sqrt_div_s_flush_i_D_wire),
        .s_op_i_D(fpu_compute_out_sqrt_div_s_op_i_D_wire),
        .s_properties_i_D(fpu_compute_out_sqrt_div_s_properties_i_D_wire),
        .s_rm_i_D(fpu_compute_out_sqrt_div_s_rm_i_D_wire),
        .s_ROB_ptr_i_D(fpu_compute_out_sqrt_div_s_ROB_ptr_i_D_wire),
        .s_srcA_i_D(fpu_compute_out_sqrt_div_s_srcA_i_D_wire),
        .s_srcB_i_D(fpu_compute_out_sqrt_div_s_srcB_i_D_wire),
        .s_start_i_D(fpu_compute_out_sqrt_div_s_start_i_D_wire),
        .pipe_sqrt_div_SQRT_DIV_CLEAR_D(pipe_sqrt_div_SQRT_DIV_CLEAR_D),
        .s_busy_o_Q(sqrt_div_s_busy_o_Q_wire),
        .s_clk_en_i_Q(sqrt_div_s_clk_en_i_Q_wire),
        .s_done_o_Q(sqrt_div_s_done_o_Q_wire),
        .s_flags_o_Q(sqrt_div_s_flags_o_Q_wire),
        .s_ready_o_Q(sqrt_div_s_ready_o_Q_wire),
        .s_result_o_Q(sqrt_div_s_result_o_Q_wire),
        .s_ROB_ptr_o_Q(sqrt_div_s_ROB_ptr_o_Q_wire),
        .s_sqrt_div_ce_Q(sqrt_div_s_sqrt_div_ce_Q),
        .s_start_i_Q(sqrt_div_s_start_i_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_execute_stage_fpu_float2int_t float2int (
        .execute_stage_fpu_float2int_s_f2i_ce_ICLK(execute_stage_fpu_float2int_s_f2i_ce_ICLK),
        .RST(RST),
        .pipe_f2i_F2I_CLEAR_Q(pipe_f2i_F2I_CLEAR_Q),
        .pipe_f2i_F2I_STALL_Q(pipe_f2i_F2I_STALL_Q),
        .s_ack_i_D(fpu_compute_out_float2int_s_ack_i_D_wire),
        .s_clk_en_i_D(compute_float2int_s_clk_en_i_D_wire),
        .s_flush_i_D(fpu_compute_out_float2int_s_flush_i_D_wire),
        .s_op_i_D(fpu_compute_out_float2int_s_op_i_D_wire),
        .s_properties_i_D(fpu_compute_out_float2int_s_properties_i_D_wire),
        .s_rm_i_D(fpu_compute_out_float2int_s_rm_i_D_wire),
        .s_ROB_ptr_i_D(fpu_compute_out_float2int_s_ROB_ptr_i_D_wire),
        .s_srcA_i_D(fpu_compute_out_float2int_s_srcA_i_D_wire),
        .s_start_i_D(fpu_compute_out_float2int_s_start_i_D_wire),
        .pipe_f2i_F2I_CLEAR_D(pipe_f2i_F2I_CLEAR_D),
        .pipe_f2i_F2I_STALL_D(pipe_f2i_F2I_STALL_D),
        .s_ack_i_Q(float2int_s_ack_i_Q_wire),
        .s_clk_en_i_Q(float2int_s_clk_en_i_Q_wire),
        .s_done_o_Q(float2int_s_done_o_Q_wire),
        .s_f2i_ce_Q(float2int_s_f2i_ce_Q),
        .s_flags_o_Q(float2int_s_flags_o_Q_wire),
        .s_op_i_Q(float2int_s_op_i_Q_wire),
        .s_properties_i_Q(float2int_s_properties_i_Q_wire),
        .s_ready_o_Q(float2int_s_ready_o_Q_wire),
        .s_result_o_Q(float2int_s_result_o_Q_wire),
        .s_rm_i_Q(float2int_s_rm_i_Q_wire),
        .s_ROB_ptr_i_Q(float2int_s_ROB_ptr_i_Q_wire),
        .s_ROB_ptr_o_Q(float2int_s_ROB_ptr_o_Q_wire),
        .s_srcA_i_Q(float2int_s_srcA_i_Q_wire),
        .s_start_i_Q(float2int_s_start_i_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_execute_stage_fpu_fused_t fused (
        .execute_stage_fpu_fused_s_fused_ce_ICLK(execute_stage_fpu_fused_s_fused_ce_ICLK),
        .RST(RST),
        .pipe_fused_ADDSUB_CLEAR_Q(pipe_fused_ADDSUB_CLEAR_Q),
        .pipe_fused_POSTNORM_ADDSUB_CLEAR_Q(pipe_fused_POSTNORM_ADDSUB_CLEAR_Q),
        .pipe_fused_POSTNORM_MUL1_CLEAR_Q(pipe_fused_POSTNORM_MUL1_CLEAR_Q),
        .pipe_fused_POSTNORM_MUL2_CLEAR_Q(pipe_fused_POSTNORM_MUL2_CLEAR_Q),
        .pipe_fused_PRENORM_ADDSUB_CLEAR_Q(pipe_fused_PRENORM_ADDSUB_CLEAR_Q),
        .pipe_fused_ROUNDING_CLEAR_Q(pipe_fused_ROUNDING_CLEAR_Q),
        .pipe_fused_WAIT_MUL_CLEAR_Q(pipe_fused_WAIT_MUL_CLEAR_Q),
        .s_clk_en_i_D(compute_fused_s_clk_en_i_D_wire),
        .s_flush_i_D(fpu_compute_out_fused_s_flush_i_D_wire),
        .s_mul_partial_result_i_D(fpu_compute_out_fused_s_mul_partial_result_i_D_wire),
        .s_op_i_D(fpu_compute_out_fused_s_op_i_D_wire),
        .s_properties_i_D(fpu_compute_out_fused_s_properties_i_D_wire),
        .s_rm_i_D(fpu_compute_out_fused_s_rm_i_D_wire),
        .s_ROB_ptr_i_D(fpu_compute_out_fused_s_ROB_ptr_i_D_wire),
        .s_srcA_i_D(fpu_compute_out_fused_s_srcA_i_D_wire),
        .s_srcB_i_D(fpu_compute_out_fused_s_srcB_i_D_wire),
        .s_srcC_i_D(fpu_compute_out_fused_s_srcC_i_D_wire),
        .s_start_i_D(fpu_compute_out_fused_s_start_i_D_wire),
        .pipe_fused_ADDSUB_CLEAR_D(pipe_fused_ADDSUB_CLEAR_D),
        .pipe_fused_POSTNORM_ADDSUB_CLEAR_D(pipe_fused_POSTNORM_ADDSUB_CLEAR_D),
        .pipe_fused_POSTNORM_MUL1_CLEAR_D(pipe_fused_POSTNORM_MUL1_CLEAR_D),
        .pipe_fused_POSTNORM_MUL2_CLEAR_D(pipe_fused_POSTNORM_MUL2_CLEAR_D),
        .pipe_fused_PRENORM_ADDSUB_CLEAR_D(pipe_fused_PRENORM_ADDSUB_CLEAR_D),
        .pipe_fused_ROUNDING_CLEAR_D(pipe_fused_ROUNDING_CLEAR_D),
        .pipe_fused_WAIT_MUL_CLEAR_D(pipe_fused_WAIT_MUL_CLEAR_D),
        .s_clk_en_i_Q(fused_s_clk_en_i_Q_wire),
        .s_done_o_Q(fused_s_done_o_Q_wire),
        .s_flags_o_Q(fused_s_flags_o_Q_wire),
        .s_fused_ce_Q(fused_s_fused_ce_Q),
        .s_result_o_Q(fused_s_result_o_Q_wire),
        .s_ROB_ptr_o_Q(fused_s_ROB_ptr_o_Q_wire),
        .s_start_i_Q(fused_s_start_i_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_execute_stage_fpu_int2float_t int2float (
        .execute_stage_fpu_int2float_s_i2f_ce_ICLK(execute_stage_fpu_int2float_s_i2f_ce_ICLK),
        .RST(RST),
        .pipe_i2f_COMPUTE_CLEAR_Q(pipe_i2f_COMPUTE_CLEAR_Q),
        .pipe_i2f_COMPUTE_STALL_Q(pipe_i2f_COMPUTE_STALL_Q),
        .pipe_i2f_ROUNDING_CLEAR_Q(pipe_i2f_ROUNDING_CLEAR_Q),
        .pipe_i2f_ROUNDING_STALL_Q(pipe_i2f_ROUNDING_STALL_Q),
        .s_ack_i_D(fpu_compute_out_int2float_s_ack_i_D_wire),
        .s_clk_en_i_D(compute_int2float_s_clk_en_i_D_wire),
        .s_flush_i_D(fpu_compute_out_int2float_s_flush_i_D_wire),
        .s_op_i_D(fpu_compute_out_int2float_s_op_i_D_wire),
        .s_rm_i_D(fpu_compute_out_int2float_s_rm_i_D_wire),
        .s_ROB_ptr_i_D(fpu_compute_out_int2float_s_ROB_ptr_i_D_wire),
        .s_srcA_i_D(fpu_compute_out_int2float_s_srcA_i_D_wire),
        .s_start_i_D(fpu_compute_out_int2float_s_start_i_D_wire),
        .pipe_i2f_COMPUTE_CLEAR_D(pipe_i2f_COMPUTE_CLEAR_D),
        .pipe_i2f_COMPUTE_STALL_D(pipe_i2f_COMPUTE_STALL_D),
        .pipe_i2f_ROUNDING_CLEAR_D(pipe_i2f_ROUNDING_CLEAR_D),
        .pipe_i2f_ROUNDING_STALL_D(pipe_i2f_ROUNDING_STALL_D),
        .s_ack_i_Q(int2float_s_ack_i_Q_wire),
        .s_clk_en_i_Q(int2float_s_clk_en_i_Q_wire),
        .s_done_o_Q(int2float_s_done_o_Q_wire),
        .s_flags_o_Q(int2float_s_flags_o_Q_wire),
        .s_i2f_ce_Q(int2float_s_i2f_ce_Q),
        .s_ready_o_Q(int2float_s_ready_o_Q_wire),
        .s_result_o_Q(int2float_s_result_o_Q_wire),
        .s_ROB_ptr_o_Q(int2float_s_ROB_ptr_o_Q_wire),
        .s_start_i_Q(int2float_s_start_i_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_execute_stage_fpu_move_t move (
        .s_ROB_ptr_i_D(fpu_compute_out_move_s_ROB_ptr_i_D_wire),
        .s_srcA_i_D(fpu_compute_out_move_s_srcA_i_D_wire),
        .s_start_i_D(fpu_compute_out_move_s_start_i_D_wire),
        .s_done_o_Q(move_s_done_o_Q_wire),
        .s_result_o_Q(move_s_result_o_Q_wire),
        .s_ROB_ptr_o_Q(move_s_ROB_ptr_o_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_execute_stage_fpu_fmul_t fmul (
        .execute_stage_fpu_fmul_s_fmul_ce_ICLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK),
        .RST(RST),
        .pipe_fmul_MUL_CLEAR_Q(pipe_fmul_MUL_CLEAR_Q),
        .pipe_fmul_POSTNORM1_CLEAR_Q(pipe_fmul_POSTNORM1_CLEAR_Q),
        .pipe_fmul_POSTNORM2_CLEAR_Q(pipe_fmul_POSTNORM2_CLEAR_Q),
        .pipe_fmul_ROUNDING_CLEAR_Q(pipe_fmul_ROUNDING_CLEAR_Q),
        .s_clk_en_i_D(compute_fmul_s_clk_en_i_D_wire),
        .s_flush_i_D(fpu_compute_out_fmul_s_flush_i_D_wire),
        .s_op_i_D(fpu_compute_out_fmul_s_op_i_D_wire),
        .s_properties_i_D(fpu_compute_out_fmul_s_properties_i_D_wire),
        .s_rm_i_D(fpu_compute_out_fmul_s_rm_i_D_wire),
        .s_ROB_ptr_i_D(fpu_compute_out_fmul_s_ROB_ptr_i_D_wire),
        .s_srcA_i_D(fpu_compute_out_fmul_s_srcA_i_D_wire),
        .s_srcB_i_D(fpu_compute_out_fmul_s_srcB_i_D_wire),
        .s_start_i_D(fpu_compute_out_fmul_s_start_i_D_wire),
        .pipe_fmul_MUL_CLEAR_D(pipe_fmul_MUL_CLEAR_D),
        .pipe_fmul_POSTNORM1_CLEAR_D(pipe_fmul_POSTNORM1_CLEAR_D),
        .pipe_fmul_POSTNORM2_CLEAR_D(pipe_fmul_POSTNORM2_CLEAR_D),
        .pipe_fmul_ROUNDING_CLEAR_D(pipe_fmul_ROUNDING_CLEAR_D),
        .s_clk_en_i_Q(fmul_s_clk_en_i_Q_wire),
        .s_done_o_Q(fmul_s_done_o_Q_wire),
        .s_flags_o_Q(fmul_s_flags_o_Q_wire),
        .s_fmul_ce_Q(fmul_s_fmul_ce_Q),
        .s_mul_partial_result_Q(fmul_s_mul_partial_result_Q_wire),
        .s_result_o_Q(fmul_s_result_o_Q_wire),
        .s_ROB_ptr_o_Q(fmul_s_ROB_ptr_o_Q_wire),
        .s_start_i_Q(fmul_s_start_i_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_execute_stage_fpu_sgnj_t sgnj (
        .s_op_i_D(fpu_compute_out_sgnj_s_op_i_D_wire),
        .s_ROB_ptr_i_D(fpu_compute_out_sgnj_s_ROB_ptr_i_D_wire),
        .s_srcA_i_D(fpu_compute_out_sgnj_s_srcA_i_D_wire),
        .s_srcB_i_D(fpu_compute_out_sgnj_s_srcB_i_D_wire),
        .s_start_i_D(fpu_compute_out_sgnj_s_start_i_D_wire),
        .s_done_o_Q(sgnj_s_done_o_Q_wire),
        .s_result_o_Q(sgnj_s_result_o_Q_wire),
        .s_ROB_ptr_o_Q(sgnj_s_ROB_ptr_o_Q_wire)
    );

    // CodAL module instance:
    codix_berkelium_ca_core_execute_stage_fpu_parsing_inputs_t parsing_inputs (
        .s_srcA_i_D(fpu_compute_out_parsing_inputs_s_srcA_i_D_wire),
        .s_srcB_i_D(fpu_compute_out_parsing_inputs_s_srcB_i_D_wire),
        .s_srcC_i_D(fpu_compute_out_parsing_inputs_s_srcC_i_D_wire),
        .s_add_sub_properties_o_Q(parsing_inputs_s_add_sub_properties_o_Q_wire),
        .s_classify_properties_o_Q(parsing_inputs_s_classify_properties_o_Q_wire),
        .s_cmp_properties_o_Q(parsing_inputs_s_cmp_properties_o_Q_wire),
        .s_f2i_properties_o_Q(parsing_inputs_s_f2i_properties_o_Q_wire),
        .s_fused_properties_o_Q(parsing_inputs_s_fused_properties_o_Q_wire),
        .s_mul_properties_o_Q(parsing_inputs_s_mul_properties_o_Q_wire),
        .s_sqrt_div_properties_o_Q(parsing_inputs_s_sqrt_div_properties_o_Q_wire)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_fpu_fpu_ROB_write_t fpu_ROB_write (
        .r_exc_en_Q(r_exc_en_Q_wire),
        .r_fpu_ROB_done_Q(r_fpu_ROB_done_Q_wire),
        .r_fpu_ROB_ptr_out_Q(r_fpu_ROB_ptr_out_Q_wire),
        .r_fpu_ROB_ptr_Q(r_fpu_ROB_ptr_Q_wire),
        .r_rob_part2_item0_Q(r_rob_part2_item0_Q_wire),
        .r_rob_part2_item10_Q(r_rob_part2_item10_Q_wire),
        .r_rob_part2_item11_Q(r_rob_part2_item11_Q_wire),
        .r_rob_part2_item12_Q(r_rob_part2_item12_Q_wire),
        .r_rob_part2_item13_Q(r_rob_part2_item13_Q_wire),
        .r_rob_part2_item14_Q(r_rob_part2_item14_Q_wire),
        .r_rob_part2_item15_Q(r_rob_part2_item15_Q_wire),
        .r_rob_part2_item16_Q(r_rob_part2_item16_Q_wire),
        .r_rob_part2_item17_Q(r_rob_part2_item17_Q_wire),
        .r_rob_part2_item18_Q(r_rob_part2_item18_Q_wire),
        .r_rob_part2_item19_Q(r_rob_part2_item19_Q_wire),
        .r_rob_part2_item1_Q(r_rob_part2_item1_Q_wire),
        .r_rob_part2_item20_Q(r_rob_part2_item20_Q_wire),
        .r_rob_part2_item21_Q(r_rob_part2_item21_Q_wire),
        .r_rob_part2_item22_Q(r_rob_part2_item22_Q_wire),
        .r_rob_part2_item23_Q(r_rob_part2_item23_Q_wire),
        .r_rob_part2_item24_Q(r_rob_part2_item24_Q_wire),
        .r_rob_part2_item25_Q(r_rob_part2_item25_Q_wire),
        .r_rob_part2_item26_Q(r_rob_part2_item26_Q_wire),
        .r_rob_part2_item27_Q(r_rob_part2_item27_Q_wire),
        .r_rob_part2_item28_Q(r_rob_part2_item28_Q_wire),
        .r_rob_part2_item29_Q(r_rob_part2_item29_Q_wire),
        .r_rob_part2_item2_Q(r_rob_part2_item2_Q_wire),
        .r_rob_part2_item30_Q(r_rob_part2_item30_Q_wire),
        .r_rob_part2_item31_Q(r_rob_part2_item31_Q_wire),
        .r_rob_part2_item3_Q(r_rob_part2_item3_Q_wire),
        .r_rob_part2_item4_Q(r_rob_part2_item4_Q_wire),
        .r_rob_part2_item5_Q(r_rob_part2_item5_Q_wire),
        .r_rob_part2_item6_Q(r_rob_part2_item6_Q_wire),
        .r_rob_part2_item7_Q(r_rob_part2_item7_Q_wire),
        .r_rob_part2_item8_Q(r_rob_part2_item8_Q_wire),
        .r_rob_part2_item9_Q(r_rob_part2_item9_Q_wire),
        .s_ack_i_Q(s_ack_i),
        .s_add_sub_ROB_ptr_Q(s_add_sub_ROB_ptr),
        .s_f2i_ROB_ptr_Q(s_f2i_ROB_ptr),
        .s_fpu_addsub_flags_Q(s_fpu_addsub_flags),
        .s_fpu_addsub_result_Q(s_fpu_addsub_result),
        .s_fpu_classify_ptr_Q(s_fpu_classify_ptr),
        .s_fpu_classify_result_Q(s_fpu_classify_result),
        .s_fpu_cmp_flags_Q(s_fpu_cmp_flags),
        .s_fpu_cmp_result_Q(s_fpu_cmp_result),
        .s_fpu_cmp_ROB_ptr_Q(s_fpu_cmp_ROB_ptr),
        .s_fpu_f2i_flags_Q(s_fpu_f2i_flags),
        .s_fpu_f2i_result_Q(s_fpu_f2i_result),
        .s_fpu_fused_flags_Q(s_fpu_fused_flags),
        .s_fpu_fused_result_Q(s_fpu_fused_result),
        .s_fpu_i2f_flags_Q(s_fpu_i2f_flags),
        .s_fpu_i2f_result_Q(s_fpu_i2f_result),
        .s_fpu_move_ptr_Q(s_fpu_move_ptr),
        .s_fpu_move_result_Q(s_fpu_move_result),
        .s_fpu_mul_flags_Q(s_fpu_mul_flags),
        .s_fpu_mul_result_Q(s_fpu_mul_result),
        .s_fpu_sgnj_ptr_Q(s_fpu_sgnj_ptr),
        .s_fpu_sgnj_result_Q(s_fpu_sgnj_result),
        .s_fpu_sqrt_div_flags_Q(s_fpu_sqrt_div_flags),
        .s_fpu_sqrt_div_result_Q(s_fpu_sqrt_div_result),
        .s_fpu_wb_port_w1_Q(s_fpu_wb_port_w1),
        .s_fpu_wb_port_w2_Q(s_fpu_wb_port_w2),
        .s_fpu_wb_port_w3_Q(s_fpu_wb_port_w3),
        .s_fpu_wb_port_w4_Q(s_fpu_wb_port_w4),
        .s_fused_ROB_ptr_Q(s_fused_ROB_ptr),
        .s_i2f_ROB_ptr_Q(s_i2f_ROB_ptr),
        .s_mul_ROB_ptr_Q(s_mul_ROB_ptr),
        .s_sqrt_div_ROB_ptr_Q(s_sqrt_div_ROB_ptr),
        .s_valid_o_Q(s_valid_o),
        .r_fpu_ROB_done_D(fpu_ROB_write_r_fpu_ROB_done_D_wire),
        .r_fpu_ROB_done_WE(fpu_ROB_write_r_fpu_ROB_done_WE_wire),
        .r_rob_part2_item0_D(fpu_ROB_write_r_rob_part2_item0_D_wire),
        .r_rob_part2_item0_WE(fpu_ROB_write_r_rob_part2_item0_WE_wire),
        .r_rob_part2_item10_D(fpu_ROB_write_r_rob_part2_item10_D_wire),
        .r_rob_part2_item10_WE(fpu_ROB_write_r_rob_part2_item10_WE_wire),
        .r_rob_part2_item11_D(fpu_ROB_write_r_rob_part2_item11_D_wire),
        .r_rob_part2_item11_WE(fpu_ROB_write_r_rob_part2_item11_WE_wire),
        .r_rob_part2_item12_D(fpu_ROB_write_r_rob_part2_item12_D_wire),
        .r_rob_part2_item12_WE(fpu_ROB_write_r_rob_part2_item12_WE_wire),
        .r_rob_part2_item13_D(fpu_ROB_write_r_rob_part2_item13_D_wire),
        .r_rob_part2_item13_WE(fpu_ROB_write_r_rob_part2_item13_WE_wire),
        .r_rob_part2_item14_D(fpu_ROB_write_r_rob_part2_item14_D_wire),
        .r_rob_part2_item14_WE(fpu_ROB_write_r_rob_part2_item14_WE_wire),
        .r_rob_part2_item15_D(fpu_ROB_write_r_rob_part2_item15_D_wire),
        .r_rob_part2_item15_WE(fpu_ROB_write_r_rob_part2_item15_WE_wire),
        .r_rob_part2_item16_D(fpu_ROB_write_r_rob_part2_item16_D_wire),
        .r_rob_part2_item16_WE(fpu_ROB_write_r_rob_part2_item16_WE_wire),
        .r_rob_part2_item17_D(fpu_ROB_write_r_rob_part2_item17_D_wire),
        .r_rob_part2_item17_WE(fpu_ROB_write_r_rob_part2_item17_WE_wire),
        .r_rob_part2_item18_D(fpu_ROB_write_r_rob_part2_item18_D_wire),
        .r_rob_part2_item18_WE(fpu_ROB_write_r_rob_part2_item18_WE_wire),
        .r_rob_part2_item19_D(fpu_ROB_write_r_rob_part2_item19_D_wire),
        .r_rob_part2_item19_WE(fpu_ROB_write_r_rob_part2_item19_WE_wire),
        .r_rob_part2_item1_D(fpu_ROB_write_r_rob_part2_item1_D_wire),
        .r_rob_part2_item1_WE(fpu_ROB_write_r_rob_part2_item1_WE_wire),
        .r_rob_part2_item20_D(fpu_ROB_write_r_rob_part2_item20_D_wire),
        .r_rob_part2_item20_WE(fpu_ROB_write_r_rob_part2_item20_WE_wire),
        .r_rob_part2_item21_D(fpu_ROB_write_r_rob_part2_item21_D_wire),
        .r_rob_part2_item21_WE(fpu_ROB_write_r_rob_part2_item21_WE_wire),
        .r_rob_part2_item22_D(fpu_ROB_write_r_rob_part2_item22_D_wire),
        .r_rob_part2_item22_WE(fpu_ROB_write_r_rob_part2_item22_WE_wire),
        .r_rob_part2_item23_D(fpu_ROB_write_r_rob_part2_item23_D_wire),
        .r_rob_part2_item23_WE(fpu_ROB_write_r_rob_part2_item23_WE_wire),
        .r_rob_part2_item24_D(fpu_ROB_write_r_rob_part2_item24_D_wire),
        .r_rob_part2_item24_WE(fpu_ROB_write_r_rob_part2_item24_WE_wire),
        .r_rob_part2_item25_D(fpu_ROB_write_r_rob_part2_item25_D_wire),
        .r_rob_part2_item25_WE(fpu_ROB_write_r_rob_part2_item25_WE_wire),
        .r_rob_part2_item26_D(fpu_ROB_write_r_rob_part2_item26_D_wire),
        .r_rob_part2_item26_WE(fpu_ROB_write_r_rob_part2_item26_WE_wire),
        .r_rob_part2_item27_D(fpu_ROB_write_r_rob_part2_item27_D_wire),
        .r_rob_part2_item27_WE(fpu_ROB_write_r_rob_part2_item27_WE_wire),
        .r_rob_part2_item28_D(fpu_ROB_write_r_rob_part2_item28_D_wire),
        .r_rob_part2_item28_WE(fpu_ROB_write_r_rob_part2_item28_WE_wire),
        .r_rob_part2_item29_D(fpu_ROB_write_r_rob_part2_item29_D_wire),
        .r_rob_part2_item29_WE(fpu_ROB_write_r_rob_part2_item29_WE_wire),
        .r_rob_part2_item2_D(fpu_ROB_write_r_rob_part2_item2_D_wire),
        .r_rob_part2_item2_WE(fpu_ROB_write_r_rob_part2_item2_WE_wire),
        .r_rob_part2_item30_D(fpu_ROB_write_r_rob_part2_item30_D_wire),
        .r_rob_part2_item30_WE(fpu_ROB_write_r_rob_part2_item30_WE_wire),
        .r_rob_part2_item31_D(fpu_ROB_write_r_rob_part2_item31_D_wire),
        .r_rob_part2_item31_WE(fpu_ROB_write_r_rob_part2_item31_WE_wire),
        .r_rob_part2_item3_D(fpu_ROB_write_r_rob_part2_item3_D_wire),
        .r_rob_part2_item3_WE(fpu_ROB_write_r_rob_part2_item3_WE_wire),
        .r_rob_part2_item4_D(fpu_ROB_write_r_rob_part2_item4_D_wire),
        .r_rob_part2_item4_WE(fpu_ROB_write_r_rob_part2_item4_WE_wire),
        .r_rob_part2_item5_D(fpu_ROB_write_r_rob_part2_item5_D_wire),
        .r_rob_part2_item5_WE(fpu_ROB_write_r_rob_part2_item5_WE_wire),
        .r_rob_part2_item6_D(fpu_ROB_write_r_rob_part2_item6_D_wire),
        .r_rob_part2_item6_WE(fpu_ROB_write_r_rob_part2_item6_WE_wire),
        .r_rob_part2_item7_D(fpu_ROB_write_r_rob_part2_item7_D_wire),
        .r_rob_part2_item7_WE(fpu_ROB_write_r_rob_part2_item7_WE_wire),
        .r_rob_part2_item8_D(fpu_ROB_write_r_rob_part2_item8_D_wire),
        .r_rob_part2_item8_WE(fpu_ROB_write_r_rob_part2_item8_WE_wire),
        .r_rob_part2_item9_D(fpu_ROB_write_r_rob_part2_item9_D_wire),
        .r_rob_part2_item9_WE(fpu_ROB_write_r_rob_part2_item9_WE_wire)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_fpu_fpu_ROB_unit_sel_t fpu_ROB_unit_sel (
        .add_sub_s_ack_i_Q(add_sub_s_ack_i_Q_wire),
        .float2int_s_ack_i_Q(float2int_s_ack_i_Q_wire),
        .int2float_s_ack_i_Q(int2float_s_ack_i_Q_wire),
        .r_exc_en_Q(r_exc_en_Q_wire),
        .s_add_sub_done_Q(s_add_sub_done),
        .s_classify_done_Q(s_classify_done),
        .s_cmp_done_Q(s_cmp_done),
        .s_float2int_done_Q(s_float2int_done),
        .s_fused_done_Q(s_fused_done),
        .s_int2float_done_Q(s_int2float_done),
        .s_move_done_Q(s_move_done),
        .s_mul_done_Q(s_mul_done),
        .s_sgnj_done_Q(s_sgnj_done),
        .s_sqr_div_done_Q(s_sqr_div_done),
        .s_add_sub_rob_stall_D(s_add_sub_rob_stall),
        .s_float2int_rob_stall_D(s_float2int_rob_stall),
        .s_fpu_wb_port_w1_D(s_fpu_wb_port_w1),
        .s_fpu_wb_port_w2_D(s_fpu_wb_port_w2),
        .s_fpu_wb_port_w3_D(s_fpu_wb_port_w3),
        .s_fpu_wb_port_w4_D(s_fpu_wb_port_w4),
        .s_int2float_rob_stall_D(s_int2float_rob_stall)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_fpu_compute_t compute (
        .add_sub_ready_Q(add_sub_ready),
        .add_sub_s_clk_en_i_Q(add_sub_s_clk_en_i_Q_wire),
        .add_sub_s_start_i_Q(add_sub_s_start_i_Q_wire),
        .f2i_ready_Q(f2i_ready),
        .float2int_s_clk_en_i_Q(float2int_s_clk_en_i_Q_wire),
        .float2int_s_start_i_Q(float2int_s_start_i_Q_wire),
        .fmul_s_clk_en_i_Q(fmul_s_clk_en_i_Q_wire),
        .fmul_s_start_i_Q(fmul_s_start_i_Q_wire),
        .fused_s_clk_en_i_Q(fused_s_clk_en_i_Q_wire),
        .fused_s_start_i_Q(fused_s_start_i_Q_wire),
        .i2f_ready_Q(i2f_ready),
        .int2float_s_clk_en_i_Q(int2float_s_clk_en_i_Q_wire),
        .int2float_s_start_i_Q(int2float_s_start_i_Q_wire),
        .r_busy_Q(r_busy_Q_wire),
        .r_exc_en_Q(r_exc_en_Q_wire),
        .r_exc_op_Q(r_exc_op_Q_wire),
        .r_exc_stall_Q(r_exc_stall_Q_wire),
        .r_exc_type_Q(r_exc_type_Q_wire),
        .r_exc_valid_Q(r_exc_valid_Q_wire),
        .r_fpu_dst_addr_Q(r_fpu_dst_addr_Q_wire),
        .r_fpu_op_Q(r_fpu_op_Q_wire),
        .r_fpu_ROB_done_Q(r_fpu_ROB_done_Q_wire),
        .r_fpu_ROB_ptr_out_Q(r_fpu_ROB_ptr_out_Q_wire),
        .r_fpu_ROB_ptr_Q(r_fpu_ROB_ptr_Q_wire),
        .r_fpu_s1_addr_Q(r_fpu_s1_addr_Q_wire),
        .r_fpu_s2_addr_Q(r_fpu_s2_addr_Q_wire),
        .r_fpu_s3_addr_Q(r_fpu_s3_addr_Q_wire),
        .r_fpu_src_A_Q(r_fpu_src_A_Q_wire),
        .r_fpu_src_B_Q(r_fpu_src_B_Q_wire),
        .r_fpu_src_C_Q(r_fpu_src_C_Q_wire),
        .r_full_ports_Q(r_full_ports_Q_wire),
        .r_instr_addr_Q(r_instr_addr_Q_wire),
        .r_instr_Q(r_instr_Q_wire),
        .r_is_fpu_op_Q(r_is_fpu_op_Q_wire),
        .r_record_f_addr0_Q(r_record_f_addr0_Q_wire),
        .r_record_f_addr10_Q(r_record_f_addr10_Q_wire),
        .r_record_f_addr11_Q(r_record_f_addr11_Q_wire),
        .r_record_f_addr12_Q(r_record_f_addr12_Q_wire),
        .r_record_f_addr13_Q(r_record_f_addr13_Q_wire),
        .r_record_f_addr14_Q(r_record_f_addr14_Q_wire),
        .r_record_f_addr15_Q(r_record_f_addr15_Q_wire),
        .r_record_f_addr16_Q(r_record_f_addr16_Q_wire),
        .r_record_f_addr17_Q(r_record_f_addr17_Q_wire),
        .r_record_f_addr18_Q(r_record_f_addr18_Q_wire),
        .r_record_f_addr19_Q(r_record_f_addr19_Q_wire),
        .r_record_f_addr1_Q(r_record_f_addr1_Q_wire),
        .r_record_f_addr20_Q(r_record_f_addr20_Q_wire),
        .r_record_f_addr21_Q(r_record_f_addr21_Q_wire),
        .r_record_f_addr22_Q(r_record_f_addr22_Q_wire),
        .r_record_f_addr23_Q(r_record_f_addr23_Q_wire),
        .r_record_f_addr24_Q(r_record_f_addr24_Q_wire),
        .r_record_f_addr25_Q(r_record_f_addr25_Q_wire),
        .r_record_f_addr26_Q(r_record_f_addr26_Q_wire),
        .r_record_f_addr27_Q(r_record_f_addr27_Q_wire),
        .r_record_f_addr28_Q(r_record_f_addr28_Q_wire),
        .r_record_f_addr29_Q(r_record_f_addr29_Q_wire),
        .r_record_f_addr2_Q(r_record_f_addr2_Q_wire),
        .r_record_f_addr30_Q(r_record_f_addr30_Q_wire),
        .r_record_f_addr31_Q(r_record_f_addr31_Q_wire),
        .r_record_f_addr3_Q(r_record_f_addr3_Q_wire),
        .r_record_f_addr4_Q(r_record_f_addr4_Q_wire),
        .r_record_f_addr5_Q(r_record_f_addr5_Q_wire),
        .r_record_f_addr6_Q(r_record_f_addr6_Q_wire),
        .r_record_f_addr7_Q(r_record_f_addr7_Q_wire),
        .r_record_f_addr8_Q(r_record_f_addr8_Q_wire),
        .r_record_f_addr9_Q(r_record_f_addr9_Q_wire),
        .r_record_x_addr10_Q(r_record_x_addr10_Q_wire),
        .r_record_x_addr11_Q(r_record_x_addr11_Q_wire),
        .r_record_x_addr12_Q(r_record_x_addr12_Q_wire),
        .r_record_x_addr13_Q(r_record_x_addr13_Q_wire),
        .r_record_x_addr14_Q(r_record_x_addr14_Q_wire),
        .r_record_x_addr15_Q(r_record_x_addr15_Q_wire),
        .r_record_x_addr16_Q(r_record_x_addr16_Q_wire),
        .r_record_x_addr17_Q(r_record_x_addr17_Q_wire),
        .r_record_x_addr18_Q(r_record_x_addr18_Q_wire),
        .r_record_x_addr19_Q(r_record_x_addr19_Q_wire),
        .r_record_x_addr1_Q(r_record_x_addr1_Q_wire),
        .r_record_x_addr20_Q(r_record_x_addr20_Q_wire),
        .r_record_x_addr21_Q(r_record_x_addr21_Q_wire),
        .r_record_x_addr22_Q(r_record_x_addr22_Q_wire),
        .r_record_x_addr23_Q(r_record_x_addr23_Q_wire),
        .r_record_x_addr24_Q(r_record_x_addr24_Q_wire),
        .r_record_x_addr25_Q(r_record_x_addr25_Q_wire),
        .r_record_x_addr26_Q(r_record_x_addr26_Q_wire),
        .r_record_x_addr27_Q(r_record_x_addr27_Q_wire),
        .r_record_x_addr28_Q(r_record_x_addr28_Q_wire),
        .r_record_x_addr29_Q(r_record_x_addr29_Q_wire),
        .r_record_x_addr2_Q(r_record_x_addr2_Q_wire),
        .r_record_x_addr30_Q(r_record_x_addr30_Q_wire),
        .r_record_x_addr31_Q(r_record_x_addr31_Q_wire),
        .r_record_x_addr3_Q(r_record_x_addr3_Q_wire),
        .r_record_x_addr4_Q(r_record_x_addr4_Q_wire),
        .r_record_x_addr5_Q(r_record_x_addr5_Q_wire),
        .r_record_x_addr6_Q(r_record_x_addr6_Q_wire),
        .r_record_x_addr7_Q(r_record_x_addr7_Q_wire),
        .r_record_x_addr8_Q(r_record_x_addr8_Q_wire),
        .r_record_x_addr9_Q(r_record_x_addr9_Q_wire),
        .r_rob_part2_item0_Q(r_rob_part2_item0_Q_wire[31:0]),
        .r_rob_part2_item10_Q(r_rob_part2_item10_Q_wire[31:0]),
        .r_rob_part2_item11_Q(r_rob_part2_item11_Q_wire[31:0]),
        .r_rob_part2_item12_Q(r_rob_part2_item12_Q_wire[31:0]),
        .r_rob_part2_item13_Q(r_rob_part2_item13_Q_wire[31:0]),
        .r_rob_part2_item14_Q(r_rob_part2_item14_Q_wire[31:0]),
        .r_rob_part2_item15_Q(r_rob_part2_item15_Q_wire[31:0]),
        .r_rob_part2_item16_Q(r_rob_part2_item16_Q_wire[31:0]),
        .r_rob_part2_item17_Q(r_rob_part2_item17_Q_wire[31:0]),
        .r_rob_part2_item18_Q(r_rob_part2_item18_Q_wire[31:0]),
        .r_rob_part2_item19_Q(r_rob_part2_item19_Q_wire[31:0]),
        .r_rob_part2_item1_Q(r_rob_part2_item1_Q_wire[31:0]),
        .r_rob_part2_item20_Q(r_rob_part2_item20_Q_wire[31:0]),
        .r_rob_part2_item21_Q(r_rob_part2_item21_Q_wire[31:0]),
        .r_rob_part2_item22_Q(r_rob_part2_item22_Q_wire[31:0]),
        .r_rob_part2_item23_Q(r_rob_part2_item23_Q_wire[31:0]),
        .r_rob_part2_item24_Q(r_rob_part2_item24_Q_wire[31:0]),
        .r_rob_part2_item25_Q(r_rob_part2_item25_Q_wire[31:0]),
        .r_rob_part2_item26_Q(r_rob_part2_item26_Q_wire[31:0]),
        .r_rob_part2_item27_Q(r_rob_part2_item27_Q_wire[31:0]),
        .r_rob_part2_item28_Q(r_rob_part2_item28_Q_wire[31:0]),
        .r_rob_part2_item29_Q(r_rob_part2_item29_Q_wire[31:0]),
        .r_rob_part2_item2_Q(r_rob_part2_item2_Q_wire[31:0]),
        .r_rob_part2_item30_Q(r_rob_part2_item30_Q_wire[31:0]),
        .r_rob_part2_item31_Q(r_rob_part2_item31_Q_wire[31:0]),
        .r_rob_part2_item3_Q(r_rob_part2_item3_Q_wire[31:0]),
        .r_rob_part2_item4_Q(r_rob_part2_item4_Q_wire[31:0]),
        .r_rob_part2_item5_Q(r_rob_part2_item5_Q_wire[31:0]),
        .r_rob_part2_item6_Q(r_rob_part2_item6_Q_wire[31:0]),
        .r_rob_part2_item7_Q(r_rob_part2_item7_Q_wire[31:0]),
        .r_rob_part2_item8_Q(r_rob_part2_item8_Q_wire[31:0]),
        .r_rob_part2_item9_Q(r_rob_part2_item9_Q_wire[31:0]),
        .r_stall_fwd_Q(r_stall_fwd_Q_wire),
        .r_start_add_sub_Q(r_start_add_sub_Q_wire),
        .r_start_classify_Q(r_start_classify_Q_wire),
        .r_start_cmp_Q(r_start_cmp_Q_wire),
        .r_start_f2i_Q(r_start_f2i_Q_wire),
        .r_start_fused_Q(r_start_fused_Q_wire),
        .r_start_i2f_Q(r_start_i2f_Q_wire),
        .r_start_max_min_Q(r_start_max_min_Q_wire),
        .r_start_move_Q(r_start_move_Q_wire),
        .r_start_mul_Q(r_start_mul_Q_wire),
        .r_start_sgnj_Q(r_start_sgnj_Q_wire),
        .r_start_sqrt_div_Q(r_start_sqrt_div_Q_wire),
        .r_unit_stall_Q(r_unit_stall_Q_wire),
        .ROB_out_item_done_Q(ROB_out_item_done),
        .s_ack_i_Q(s_ack_i),
        .s_busy_o_Q(s_busy_o),
        .s_exc_op_wait_Q(s_exc_op_wait),
        .s_exc_type_i_Q(s_exc_type_i),
        .s_exc_valid_i_Q(s_exc_valid_i),
        .s_flush_i_Q(s_flush_i),
        .s_frm_i_Q(s_frm_i),
        .s_full_port_Q(s_full_port),
        .s_instr_addr_i_Q(s_instr_addr_i),
        .s_instr_i_Q(s_instr_i),
        .s_new_operation_Q(s_new_operation),
        .s_op_i_Q(s_op_i),
        .s_rd_addr_i_Q(s_rd_addr_i),
        .s_ready_Q(s_ready),
        .s_rm_i_Q(s_rm_i),
        .s_ROB_full_Q(s_ROB_full),
        .s_s1_addr_i_Q(s_s1_addr_i),
        .s_s1_data_i_Q(s_s1_data_i),
        .s_s2_addr_i_Q(s_s2_addr_i),
        .s_s2_data_i_Q(s_s2_data_i),
        .s_s3_addr_i_Q(s_s3_addr_i),
        .s_s3_data_i_Q(s_s3_data_i),
        .s_valid_i_Q(s_valid_i),
        .s_wb_commit_addr_Q(s_wb_commit_addr),
        .sqrt_div_busy_Q(sqrt_div_busy),
        .sqrt_div_ready_Q(sqrt_div_ready),
        .sqrt_div_s_clk_en_i_Q(sqrt_div_s_clk_en_i_Q_wire),
        .sqrt_div_s_start_i_Q(sqrt_div_s_start_i_Q_wire),
        .add_sub_s_clk_en_i_D(compute_add_sub_s_clk_en_i_D_wire),
        .control_fpu_CONTROL_CLEAR_D(control_fpu_CONTROL_CLEAR_D),
        .control_fpu_CONTROL_STALL_D(control_fpu_CONTROL_STALL_D),
        .control_fpu_ROB_CLEAR_D(control_fpu_ROB_CLEAR_D),
        .float2int_s_clk_en_i_D(compute_float2int_s_clk_en_i_D_wire),
        .fmul_s_clk_en_i_D(compute_fmul_s_clk_en_i_D_wire),
        .fused_s_clk_en_i_D(compute_fused_s_clk_en_i_D_wire),
        .int2float_s_clk_en_i_D(compute_int2float_s_clk_en_i_D_wire),
        .r_busy_D(compute_r_busy_D_wire),
        .r_busy_WE(compute_r_busy_WE_wire),
        .r_exc_en_D(compute_r_exc_en_D_wire),
        .r_exc_en_WE(compute_r_exc_en_WE_wire),
        .r_exc_op_D(compute_r_exc_op_D_wire),
        .r_exc_op_WE(compute_r_exc_op_WE_wire),
        .r_exc_type_D(compute_r_exc_type_D_wire),
        .r_exc_type_WE(compute_r_exc_type_WE_wire),
        .r_exc_valid_D(compute_r_exc_valid_D_wire),
        .r_exc_valid_WE(compute_r_exc_valid_WE_wire),
        .r_fpu_dst_addr_D(compute_r_fpu_dst_addr_D_wire),
        .r_fpu_dst_addr_WE(compute_r_fpu_dst_addr_WE_wire),
        .r_fpu_op_D(compute_r_fpu_op_D_wire),
        .r_fpu_op_WE(compute_r_fpu_op_WE_wire),
        .r_fpu_rm_D(compute_r_fpu_rm_D_wire),
        .r_fpu_rm_WE(compute_r_fpu_rm_WE_wire),
        .r_fpu_ROB_ptr_D(compute_r_fpu_ROB_ptr_D_wire),
        .r_fpu_ROB_ptr_WE(compute_r_fpu_ROB_ptr_WE_wire),
        .r_fpu_s1_addr_D(compute_r_fpu_s1_addr_D_wire),
        .r_fpu_s1_addr_WE(compute_r_fpu_s1_addr_WE_wire),
        .r_fpu_s2_addr_D(compute_r_fpu_s2_addr_D_wire),
        .r_fpu_s2_addr_WE(compute_r_fpu_s2_addr_WE_wire),
        .r_fpu_s3_addr_D(compute_r_fpu_s3_addr_D_wire),
        .r_fpu_s3_addr_WE(compute_r_fpu_s3_addr_WE_wire),
        .r_fpu_src_A_D(compute_r_fpu_src_A_D_wire),
        .r_fpu_src_A_WE(compute_r_fpu_src_A_WE_wire),
        .r_fpu_src_B_D(compute_r_fpu_src_B_D_wire),
        .r_fpu_src_B_WE(compute_r_fpu_src_B_WE_wire),
        .r_fpu_src_C_D(compute_r_fpu_src_C_D_wire),
        .r_fpu_src_C_WE(compute_r_fpu_src_C_WE_wire),
        .r_instr_addr_D(compute_r_instr_addr_D_wire),
        .r_instr_addr_WE(compute_r_instr_addr_WE_wire),
        .r_instr_D(compute_r_instr_D_wire),
        .r_instr_WE(compute_r_instr_WE_wire),
        .r_is_fpu_op_D(compute_r_is_fpu_op_D_wire),
        .r_is_fpu_op_WE(compute_r_is_fpu_op_WE_wire),
        .r_record_f_addr0_D(compute_r_record_f_addr0_D_wire),
        .r_record_f_addr0_WE(compute_r_record_f_addr0_WE_wire),
        .r_record_f_addr10_D(compute_r_record_f_addr10_D_wire),
        .r_record_f_addr10_WE(compute_r_record_f_addr10_WE_wire),
        .r_record_f_addr11_D(compute_r_record_f_addr11_D_wire),
        .r_record_f_addr11_WE(compute_r_record_f_addr11_WE_wire),
        .r_record_f_addr12_D(compute_r_record_f_addr12_D_wire),
        .r_record_f_addr12_WE(compute_r_record_f_addr12_WE_wire),
        .r_record_f_addr13_D(compute_r_record_f_addr13_D_wire),
        .r_record_f_addr13_WE(compute_r_record_f_addr13_WE_wire),
        .r_record_f_addr14_D(compute_r_record_f_addr14_D_wire),
        .r_record_f_addr14_WE(compute_r_record_f_addr14_WE_wire),
        .r_record_f_addr15_D(compute_r_record_f_addr15_D_wire),
        .r_record_f_addr15_WE(compute_r_record_f_addr15_WE_wire),
        .r_record_f_addr16_D(compute_r_record_f_addr16_D_wire),
        .r_record_f_addr16_WE(compute_r_record_f_addr16_WE_wire),
        .r_record_f_addr17_D(compute_r_record_f_addr17_D_wire),
        .r_record_f_addr17_WE(compute_r_record_f_addr17_WE_wire),
        .r_record_f_addr18_D(compute_r_record_f_addr18_D_wire),
        .r_record_f_addr18_WE(compute_r_record_f_addr18_WE_wire),
        .r_record_f_addr19_D(compute_r_record_f_addr19_D_wire),
        .r_record_f_addr19_WE(compute_r_record_f_addr19_WE_wire),
        .r_record_f_addr1_D(compute_r_record_f_addr1_D_wire),
        .r_record_f_addr1_WE(compute_r_record_f_addr1_WE_wire),
        .r_record_f_addr20_D(compute_r_record_f_addr20_D_wire),
        .r_record_f_addr20_WE(compute_r_record_f_addr20_WE_wire),
        .r_record_f_addr21_D(compute_r_record_f_addr21_D_wire),
        .r_record_f_addr21_WE(compute_r_record_f_addr21_WE_wire),
        .r_record_f_addr22_D(compute_r_record_f_addr22_D_wire),
        .r_record_f_addr22_WE(compute_r_record_f_addr22_WE_wire),
        .r_record_f_addr23_D(compute_r_record_f_addr23_D_wire),
        .r_record_f_addr23_WE(compute_r_record_f_addr23_WE_wire),
        .r_record_f_addr24_D(compute_r_record_f_addr24_D_wire),
        .r_record_f_addr24_WE(compute_r_record_f_addr24_WE_wire),
        .r_record_f_addr25_D(compute_r_record_f_addr25_D_wire),
        .r_record_f_addr25_WE(compute_r_record_f_addr25_WE_wire),
        .r_record_f_addr26_D(compute_r_record_f_addr26_D_wire),
        .r_record_f_addr26_WE(compute_r_record_f_addr26_WE_wire),
        .r_record_f_addr27_D(compute_r_record_f_addr27_D_wire),
        .r_record_f_addr27_WE(compute_r_record_f_addr27_WE_wire),
        .r_record_f_addr28_D(compute_r_record_f_addr28_D_wire),
        .r_record_f_addr28_WE(compute_r_record_f_addr28_WE_wire),
        .r_record_f_addr29_D(compute_r_record_f_addr29_D_wire),
        .r_record_f_addr29_WE(compute_r_record_f_addr29_WE_wire),
        .r_record_f_addr2_D(compute_r_record_f_addr2_D_wire),
        .r_record_f_addr2_WE(compute_r_record_f_addr2_WE_wire),
        .r_record_f_addr30_D(compute_r_record_f_addr30_D_wire),
        .r_record_f_addr30_WE(compute_r_record_f_addr30_WE_wire),
        .r_record_f_addr31_D(compute_r_record_f_addr31_D_wire),
        .r_record_f_addr31_WE(compute_r_record_f_addr31_WE_wire),
        .r_record_f_addr3_D(compute_r_record_f_addr3_D_wire),
        .r_record_f_addr3_WE(compute_r_record_f_addr3_WE_wire),
        .r_record_f_addr4_D(compute_r_record_f_addr4_D_wire),
        .r_record_f_addr4_WE(compute_r_record_f_addr4_WE_wire),
        .r_record_f_addr5_D(compute_r_record_f_addr5_D_wire),
        .r_record_f_addr5_WE(compute_r_record_f_addr5_WE_wire),
        .r_record_f_addr6_D(compute_r_record_f_addr6_D_wire),
        .r_record_f_addr6_WE(compute_r_record_f_addr6_WE_wire),
        .r_record_f_addr7_D(compute_r_record_f_addr7_D_wire),
        .r_record_f_addr7_WE(compute_r_record_f_addr7_WE_wire),
        .r_record_f_addr8_D(compute_r_record_f_addr8_D_wire),
        .r_record_f_addr8_WE(compute_r_record_f_addr8_WE_wire),
        .r_record_f_addr9_D(compute_r_record_f_addr9_D_wire),
        .r_record_f_addr9_WE(compute_r_record_f_addr9_WE_wire),
        .r_record_x_addr10_D(compute_r_record_x_addr10_D_wire),
        .r_record_x_addr10_WE(compute_r_record_x_addr10_WE_wire),
        .r_record_x_addr11_D(compute_r_record_x_addr11_D_wire),
        .r_record_x_addr11_WE(compute_r_record_x_addr11_WE_wire),
        .r_record_x_addr12_D(compute_r_record_x_addr12_D_wire),
        .r_record_x_addr12_WE(compute_r_record_x_addr12_WE_wire),
        .r_record_x_addr13_D(compute_r_record_x_addr13_D_wire),
        .r_record_x_addr13_WE(compute_r_record_x_addr13_WE_wire),
        .r_record_x_addr14_D(compute_r_record_x_addr14_D_wire),
        .r_record_x_addr14_WE(compute_r_record_x_addr14_WE_wire),
        .r_record_x_addr15_D(compute_r_record_x_addr15_D_wire),
        .r_record_x_addr15_WE(compute_r_record_x_addr15_WE_wire),
        .r_record_x_addr16_D(compute_r_record_x_addr16_D_wire),
        .r_record_x_addr16_WE(compute_r_record_x_addr16_WE_wire),
        .r_record_x_addr17_D(compute_r_record_x_addr17_D_wire),
        .r_record_x_addr17_WE(compute_r_record_x_addr17_WE_wire),
        .r_record_x_addr18_D(compute_r_record_x_addr18_D_wire),
        .r_record_x_addr18_WE(compute_r_record_x_addr18_WE_wire),
        .r_record_x_addr19_D(compute_r_record_x_addr19_D_wire),
        .r_record_x_addr19_WE(compute_r_record_x_addr19_WE_wire),
        .r_record_x_addr1_D(compute_r_record_x_addr1_D_wire),
        .r_record_x_addr1_WE(compute_r_record_x_addr1_WE_wire),
        .r_record_x_addr20_D(compute_r_record_x_addr20_D_wire),
        .r_record_x_addr20_WE(compute_r_record_x_addr20_WE_wire),
        .r_record_x_addr21_D(compute_r_record_x_addr21_D_wire),
        .r_record_x_addr21_WE(compute_r_record_x_addr21_WE_wire),
        .r_record_x_addr22_D(compute_r_record_x_addr22_D_wire),
        .r_record_x_addr22_WE(compute_r_record_x_addr22_WE_wire),
        .r_record_x_addr23_D(compute_r_record_x_addr23_D_wire),
        .r_record_x_addr23_WE(compute_r_record_x_addr23_WE_wire),
        .r_record_x_addr24_D(compute_r_record_x_addr24_D_wire),
        .r_record_x_addr24_WE(compute_r_record_x_addr24_WE_wire),
        .r_record_x_addr25_D(compute_r_record_x_addr25_D_wire),
        .r_record_x_addr25_WE(compute_r_record_x_addr25_WE_wire),
        .r_record_x_addr26_D(compute_r_record_x_addr26_D_wire),
        .r_record_x_addr26_WE(compute_r_record_x_addr26_WE_wire),
        .r_record_x_addr27_D(compute_r_record_x_addr27_D_wire),
        .r_record_x_addr27_WE(compute_r_record_x_addr27_WE_wire),
        .r_record_x_addr28_D(compute_r_record_x_addr28_D_wire),
        .r_record_x_addr28_WE(compute_r_record_x_addr28_WE_wire),
        .r_record_x_addr29_D(compute_r_record_x_addr29_D_wire),
        .r_record_x_addr29_WE(compute_r_record_x_addr29_WE_wire),
        .r_record_x_addr2_D(compute_r_record_x_addr2_D_wire),
        .r_record_x_addr2_WE(compute_r_record_x_addr2_WE_wire),
        .r_record_x_addr30_D(compute_r_record_x_addr30_D_wire),
        .r_record_x_addr30_WE(compute_r_record_x_addr30_WE_wire),
        .r_record_x_addr31_D(compute_r_record_x_addr31_D_wire),
        .r_record_x_addr31_WE(compute_r_record_x_addr31_WE_wire),
        .r_record_x_addr3_D(compute_r_record_x_addr3_D_wire),
        .r_record_x_addr3_WE(compute_r_record_x_addr3_WE_wire),
        .r_record_x_addr4_D(compute_r_record_x_addr4_D_wire),
        .r_record_x_addr4_WE(compute_r_record_x_addr4_WE_wire),
        .r_record_x_addr5_D(compute_r_record_x_addr5_D_wire),
        .r_record_x_addr5_WE(compute_r_record_x_addr5_WE_wire),
        .r_record_x_addr6_D(compute_r_record_x_addr6_D_wire),
        .r_record_x_addr6_WE(compute_r_record_x_addr6_WE_wire),
        .r_record_x_addr7_D(compute_r_record_x_addr7_D_wire),
        .r_record_x_addr7_WE(compute_r_record_x_addr7_WE_wire),
        .r_record_x_addr8_D(compute_r_record_x_addr8_D_wire),
        .r_record_x_addr8_WE(compute_r_record_x_addr8_WE_wire),
        .r_record_x_addr9_D(compute_r_record_x_addr9_D_wire),
        .r_record_x_addr9_WE(compute_r_record_x_addr9_WE_wire),
        .r_rob_part1_item0_D(compute_r_rob_part1_item0_D_wire),
        .r_rob_part1_item0_WE(compute_r_rob_part1_item0_WE_wire),
        .r_rob_part1_item10_D(compute_r_rob_part1_item10_D_wire),
        .r_rob_part1_item10_WE(compute_r_rob_part1_item10_WE_wire),
        .r_rob_part1_item11_D(compute_r_rob_part1_item11_D_wire),
        .r_rob_part1_item11_WE(compute_r_rob_part1_item11_WE_wire),
        .r_rob_part1_item12_D(compute_r_rob_part1_item12_D_wire),
        .r_rob_part1_item12_WE(compute_r_rob_part1_item12_WE_wire),
        .r_rob_part1_item13_D(compute_r_rob_part1_item13_D_wire),
        .r_rob_part1_item13_WE(compute_r_rob_part1_item13_WE_wire),
        .r_rob_part1_item14_D(compute_r_rob_part1_item14_D_wire),
        .r_rob_part1_item14_WE(compute_r_rob_part1_item14_WE_wire),
        .r_rob_part1_item15_D(compute_r_rob_part1_item15_D_wire),
        .r_rob_part1_item15_WE(compute_r_rob_part1_item15_WE_wire),
        .r_rob_part1_item16_D(compute_r_rob_part1_item16_D_wire),
        .r_rob_part1_item16_WE(compute_r_rob_part1_item16_WE_wire),
        .r_rob_part1_item17_D(compute_r_rob_part1_item17_D_wire),
        .r_rob_part1_item17_WE(compute_r_rob_part1_item17_WE_wire),
        .r_rob_part1_item18_D(compute_r_rob_part1_item18_D_wire),
        .r_rob_part1_item18_WE(compute_r_rob_part1_item18_WE_wire),
        .r_rob_part1_item19_D(compute_r_rob_part1_item19_D_wire),
        .r_rob_part1_item19_WE(compute_r_rob_part1_item19_WE_wire),
        .r_rob_part1_item1_D(compute_r_rob_part1_item1_D_wire),
        .r_rob_part1_item1_WE(compute_r_rob_part1_item1_WE_wire),
        .r_rob_part1_item20_D(compute_r_rob_part1_item20_D_wire),
        .r_rob_part1_item20_WE(compute_r_rob_part1_item20_WE_wire),
        .r_rob_part1_item21_D(compute_r_rob_part1_item21_D_wire),
        .r_rob_part1_item21_WE(compute_r_rob_part1_item21_WE_wire),
        .r_rob_part1_item22_D(compute_r_rob_part1_item22_D_wire),
        .r_rob_part1_item22_WE(compute_r_rob_part1_item22_WE_wire),
        .r_rob_part1_item23_D(compute_r_rob_part1_item23_D_wire),
        .r_rob_part1_item23_WE(compute_r_rob_part1_item23_WE_wire),
        .r_rob_part1_item24_D(compute_r_rob_part1_item24_D_wire),
        .r_rob_part1_item24_WE(compute_r_rob_part1_item24_WE_wire),
        .r_rob_part1_item25_D(compute_r_rob_part1_item25_D_wire),
        .r_rob_part1_item25_WE(compute_r_rob_part1_item25_WE_wire),
        .r_rob_part1_item26_D(compute_r_rob_part1_item26_D_wire),
        .r_rob_part1_item26_WE(compute_r_rob_part1_item26_WE_wire),
        .r_rob_part1_item27_D(compute_r_rob_part1_item27_D_wire),
        .r_rob_part1_item27_WE(compute_r_rob_part1_item27_WE_wire),
        .r_rob_part1_item28_D(compute_r_rob_part1_item28_D_wire),
        .r_rob_part1_item28_WE(compute_r_rob_part1_item28_WE_wire),
        .r_rob_part1_item29_D(compute_r_rob_part1_item29_D_wire),
        .r_rob_part1_item29_WE(compute_r_rob_part1_item29_WE_wire),
        .r_rob_part1_item2_D(compute_r_rob_part1_item2_D_wire),
        .r_rob_part1_item2_WE(compute_r_rob_part1_item2_WE_wire),
        .r_rob_part1_item30_D(compute_r_rob_part1_item30_D_wire),
        .r_rob_part1_item30_WE(compute_r_rob_part1_item30_WE_wire),
        .r_rob_part1_item31_D(compute_r_rob_part1_item31_D_wire),
        .r_rob_part1_item31_WE(compute_r_rob_part1_item31_WE_wire),
        .r_rob_part1_item3_D(compute_r_rob_part1_item3_D_wire),
        .r_rob_part1_item3_WE(compute_r_rob_part1_item3_WE_wire),
        .r_rob_part1_item4_D(compute_r_rob_part1_item4_D_wire),
        .r_rob_part1_item4_WE(compute_r_rob_part1_item4_WE_wire),
        .r_rob_part1_item5_D(compute_r_rob_part1_item5_D_wire),
        .r_rob_part1_item5_WE(compute_r_rob_part1_item5_WE_wire),
        .r_rob_part1_item6_D(compute_r_rob_part1_item6_D_wire),
        .r_rob_part1_item6_WE(compute_r_rob_part1_item6_WE_wire),
        .r_rob_part1_item7_D(compute_r_rob_part1_item7_D_wire),
        .r_rob_part1_item7_WE(compute_r_rob_part1_item7_WE_wire),
        .r_rob_part1_item8_D(compute_r_rob_part1_item8_D_wire),
        .r_rob_part1_item8_WE(compute_r_rob_part1_item8_WE_wire),
        .r_rob_part1_item9_D(compute_r_rob_part1_item9_D_wire),
        .r_rob_part1_item9_WE(compute_r_rob_part1_item9_WE_wire),
        .r_stall_fwd_D(compute_r_stall_fwd_D_wire),
        .r_stall_fwd_WE(compute_r_stall_fwd_WE_wire),
        .r_start_add_sub_D(compute_r_start_add_sub_D_wire),
        .r_start_add_sub_WE(compute_r_start_add_sub_WE_wire),
        .r_start_classify_D(compute_r_start_classify_D_wire),
        .r_start_classify_WE(compute_r_start_classify_WE_wire),
        .r_start_cmp_D(compute_r_start_cmp_D_wire),
        .r_start_cmp_WE(compute_r_start_cmp_WE_wire),
        .r_start_f2i_D(compute_r_start_f2i_D_wire),
        .r_start_f2i_WE(compute_r_start_f2i_WE_wire),
        .r_start_fused_D(compute_r_start_fused_D_wire),
        .r_start_fused_WE(compute_r_start_fused_WE_wire),
        .r_start_i2f_D(compute_r_start_i2f_D_wire),
        .r_start_i2f_WE(compute_r_start_i2f_WE_wire),
        .r_start_max_min_D(compute_r_start_max_min_D_wire),
        .r_start_max_min_WE(compute_r_start_max_min_WE_wire),
        .r_start_move_D(compute_r_start_move_D_wire),
        .r_start_move_WE(compute_r_start_move_WE_wire),
        .r_start_mul_D(compute_r_start_mul_D_wire),
        .r_start_mul_WE(compute_r_start_mul_WE_wire),
        .r_start_sgnj_D(compute_r_start_sgnj_D_wire),
        .r_start_sgnj_WE(compute_r_start_sgnj_WE_wire),
        .r_start_sqrt_div_D(compute_r_start_sqrt_div_D_wire),
        .r_start_sqrt_div_WE(compute_r_start_sqrt_div_WE_wire),
        .r_unit_stall_D(compute_r_unit_stall_D_wire),
        .r_unit_stall_WE(compute_r_unit_stall_WE_wire),
        .s_exc_op_wait_D(s_exc_op_wait),
        .s_fpu_ce_D(s_fpu_ce_D),
        .s_new_operation_D(s_new_operation),
        .sqrt_div_s_clk_en_i_D(compute_sqrt_div_s_clk_en_i_D_wire)
    );

    // functional unit instance:
    codix_berkelium_ca_core_execute_stage_fpu_fpu_compute_out_t fpu_compute_out (
        .add_sub_ready_Q(add_sub_ready),
        .add_sub_s_ack_i_Q(add_sub_s_ack_i_Q_wire),
        .add_sub_s_done_o_Q(add_sub_s_done_o_Q_wire),
        .add_sub_s_flags_o_Q(add_sub_s_flags_o_Q_wire),
        .add_sub_s_ready_o_Q(add_sub_s_ready_o_Q_wire),
        .add_sub_s_result_o_Q(add_sub_s_result_o_Q_wire),
        .add_sub_s_ROB_ptr_o_Q(add_sub_s_ROB_ptr_o_Q_wire),
        .add_sub_s_start_i_Q(add_sub_s_start_i_Q_wire),
        .classify_s_done_o_Q(classify_s_done_o_Q_wire),
        .classify_s_result_o_Q(classify_s_result_o_Q_wire),
        .classify_s_ROB_ptr_o_Q(classify_s_ROB_ptr_o_Q_wire),
        .compare_s_done_o_Q(compare_s_done_o_Q_wire),
        .compare_s_flags_o_Q(compare_s_flags_o_Q_wire),
        .compare_s_result_o_Q(compare_s_result_o_Q_wire),
        .compare_s_ROB_ptr_o_Q(compare_s_ROB_ptr_o_Q_wire),
        .f2i_ready_Q(f2i_ready),
        .float2int_s_ack_i_Q(float2int_s_ack_i_Q_wire),
        .float2int_s_done_o_Q(float2int_s_done_o_Q_wire),
        .float2int_s_flags_o_Q(float2int_s_flags_o_Q_wire),
        .float2int_s_op_i_Q(float2int_s_op_i_Q_wire),
        .float2int_s_properties_i_Q(float2int_s_properties_i_Q_wire),
        .float2int_s_ready_o_Q(float2int_s_ready_o_Q_wire),
        .float2int_s_result_o_Q(float2int_s_result_o_Q_wire),
        .float2int_s_rm_i_Q(float2int_s_rm_i_Q_wire),
        .float2int_s_ROB_ptr_i_Q(float2int_s_ROB_ptr_i_Q_wire),
        .float2int_s_ROB_ptr_o_Q(float2int_s_ROB_ptr_o_Q_wire),
        .float2int_s_srcA_i_Q(float2int_s_srcA_i_Q_wire),
        .float2int_s_start_i_Q(float2int_s_start_i_Q_wire),
        .fmul_s_done_o_Q(fmul_s_done_o_Q_wire),
        .fmul_s_flags_o_Q(fmul_s_flags_o_Q_wire),
        .fmul_s_mul_partial_result_Q(fmul_s_mul_partial_result_Q_wire),
        .fmul_s_result_o_Q(fmul_s_result_o_Q_wire),
        .fmul_s_ROB_ptr_o_Q(fmul_s_ROB_ptr_o_Q_wire),
        .fused_s_done_o_Q(fused_s_done_o_Q_wire),
        .fused_s_flags_o_Q(fused_s_flags_o_Q_wire),
        .fused_s_result_o_Q(fused_s_result_o_Q_wire),
        .fused_s_ROB_ptr_o_Q(fused_s_ROB_ptr_o_Q_wire),
        .i2f_ready_Q(i2f_ready),
        .int2float_s_ack_i_Q(int2float_s_ack_i_Q_wire),
        .int2float_s_done_o_Q(int2float_s_done_o_Q_wire),
        .int2float_s_flags_o_Q(int2float_s_flags_o_Q_wire),
        .int2float_s_ready_o_Q(int2float_s_ready_o_Q_wire),
        .int2float_s_result_o_Q(int2float_s_result_o_Q_wire),
        .int2float_s_ROB_ptr_o_Q(int2float_s_ROB_ptr_o_Q_wire),
        .int2float_s_start_i_Q(int2float_s_start_i_Q_wire),
        .move_s_done_o_Q(move_s_done_o_Q_wire),
        .move_s_result_o_Q(move_s_result_o_Q_wire),
        .move_s_ROB_ptr_o_Q(move_s_ROB_ptr_o_Q_wire),
        .parsing_inputs_s_add_sub_properties_o_Q(parsing_inputs_s_add_sub_properties_o_Q_wire),
        .parsing_inputs_s_classify_properties_o_Q(parsing_inputs_s_classify_properties_o_Q_wire),
        .parsing_inputs_s_cmp_properties_o_Q(parsing_inputs_s_cmp_properties_o_Q_wire),
        .parsing_inputs_s_f2i_properties_o_Q(parsing_inputs_s_f2i_properties_o_Q_wire),
        .parsing_inputs_s_fused_properties_o_Q(parsing_inputs_s_fused_properties_o_Q_wire),
        .parsing_inputs_s_mul_properties_o_Q(parsing_inputs_s_mul_properties_o_Q_wire),
        .parsing_inputs_s_sqrt_div_properties_o_Q(parsing_inputs_s_sqrt_div_properties_o_Q_wire),
        .r_cnt_ops_inside_Q(r_cnt_ops_inside_Q_wire),
        .r_exc_en_Q(r_exc_en_Q_wire),
        .r_exc_stall_Q(r_exc_stall_Q_wire),
        .r_fpu_dst_addr_Q(r_fpu_dst_addr_Q_wire),
        .r_fpu_op_Q(r_fpu_op_Q_wire),
        .r_fpu_rm_Q(r_fpu_rm_Q_wire),
        .r_fpu_ROB_done_Q(r_fpu_ROB_done_Q_wire),
        .r_fpu_ROB_ptr_out_Q(r_fpu_ROB_ptr_out_Q_wire),
        .r_fpu_ROB_ptr_Q(r_fpu_ROB_ptr_Q_wire),
        .r_fpu_src_A_Q(r_fpu_src_A_Q_wire),
        .r_fpu_src_B_Q(r_fpu_src_B_Q_wire),
        .r_fpu_src_C_Q(r_fpu_src_C_Q_wire),
        .r_is_fpu_op_Q(r_is_fpu_op_Q_wire),
        .r_record_x_addr10_Q(r_record_x_addr10_Q_wire[5]),
        .r_record_x_addr11_Q(r_record_x_addr11_Q_wire[5]),
        .r_record_x_addr12_Q(r_record_x_addr12_Q_wire[5]),
        .r_record_x_addr13_Q(r_record_x_addr13_Q_wire[5]),
        .r_record_x_addr14_Q(r_record_x_addr14_Q_wire[5]),
        .r_record_x_addr15_Q(r_record_x_addr15_Q_wire[5]),
        .r_record_x_addr16_Q(r_record_x_addr16_Q_wire[5]),
        .r_record_x_addr17_Q(r_record_x_addr17_Q_wire[5]),
        .r_record_x_addr18_Q(r_record_x_addr18_Q_wire[5]),
        .r_record_x_addr19_Q(r_record_x_addr19_Q_wire[5]),
        .r_record_x_addr1_Q(r_record_x_addr1_Q_wire[5]),
        .r_record_x_addr20_Q(r_record_x_addr20_Q_wire[5]),
        .r_record_x_addr21_Q(r_record_x_addr21_Q_wire[5]),
        .r_record_x_addr22_Q(r_record_x_addr22_Q_wire[5]),
        .r_record_x_addr23_Q(r_record_x_addr23_Q_wire[5]),
        .r_record_x_addr24_Q(r_record_x_addr24_Q_wire[5]),
        .r_record_x_addr25_Q(r_record_x_addr25_Q_wire[5]),
        .r_record_x_addr26_Q(r_record_x_addr26_Q_wire[5]),
        .r_record_x_addr27_Q(r_record_x_addr27_Q_wire[5]),
        .r_record_x_addr28_Q(r_record_x_addr28_Q_wire[5]),
        .r_record_x_addr29_Q(r_record_x_addr29_Q_wire[5]),
        .r_record_x_addr2_Q(r_record_x_addr2_Q_wire[5]),
        .r_record_x_addr30_Q(r_record_x_addr30_Q_wire[5]),
        .r_record_x_addr31_Q(r_record_x_addr31_Q_wire[5]),
        .r_record_x_addr3_Q(r_record_x_addr3_Q_wire[5]),
        .r_record_x_addr4_Q(r_record_x_addr4_Q_wire[5]),
        .r_record_x_addr5_Q(r_record_x_addr5_Q_wire[5]),
        .r_record_x_addr6_Q(r_record_x_addr6_Q_wire[5]),
        .r_record_x_addr7_Q(r_record_x_addr7_Q_wire[5]),
        .r_record_x_addr8_Q(r_record_x_addr8_Q_wire[5]),
        .r_record_x_addr9_Q(r_record_x_addr9_Q_wire[5]),
        .r_rob_part1_item0_Q(r_rob_part1_item0_Q_wire),
        .r_rob_part1_item10_Q(r_rob_part1_item10_Q_wire),
        .r_rob_part1_item11_Q(r_rob_part1_item11_Q_wire),
        .r_rob_part1_item12_Q(r_rob_part1_item12_Q_wire),
        .r_rob_part1_item13_Q(r_rob_part1_item13_Q_wire),
        .r_rob_part1_item14_Q(r_rob_part1_item14_Q_wire),
        .r_rob_part1_item15_Q(r_rob_part1_item15_Q_wire),
        .r_rob_part1_item16_Q(r_rob_part1_item16_Q_wire),
        .r_rob_part1_item17_Q(r_rob_part1_item17_Q_wire),
        .r_rob_part1_item18_Q(r_rob_part1_item18_Q_wire),
        .r_rob_part1_item19_Q(r_rob_part1_item19_Q_wire),
        .r_rob_part1_item1_Q(r_rob_part1_item1_Q_wire),
        .r_rob_part1_item20_Q(r_rob_part1_item20_Q_wire),
        .r_rob_part1_item21_Q(r_rob_part1_item21_Q_wire),
        .r_rob_part1_item22_Q(r_rob_part1_item22_Q_wire),
        .r_rob_part1_item23_Q(r_rob_part1_item23_Q_wire),
        .r_rob_part1_item24_Q(r_rob_part1_item24_Q_wire),
        .r_rob_part1_item25_Q(r_rob_part1_item25_Q_wire),
        .r_rob_part1_item26_Q(r_rob_part1_item26_Q_wire),
        .r_rob_part1_item27_Q(r_rob_part1_item27_Q_wire),
        .r_rob_part1_item28_Q(r_rob_part1_item28_Q_wire),
        .r_rob_part1_item29_Q(r_rob_part1_item29_Q_wire),
        .r_rob_part1_item2_Q(r_rob_part1_item2_Q_wire),
        .r_rob_part1_item30_Q(r_rob_part1_item30_Q_wire),
        .r_rob_part1_item31_Q(r_rob_part1_item31_Q_wire),
        .r_rob_part1_item3_Q(r_rob_part1_item3_Q_wire),
        .r_rob_part1_item4_Q(r_rob_part1_item4_Q_wire),
        .r_rob_part1_item5_Q(r_rob_part1_item5_Q_wire),
        .r_rob_part1_item6_Q(r_rob_part1_item6_Q_wire),
        .r_rob_part1_item7_Q(r_rob_part1_item7_Q_wire),
        .r_rob_part1_item8_Q(r_rob_part1_item8_Q_wire),
        .r_rob_part1_item9_Q(r_rob_part1_item9_Q_wire),
        .r_rob_part2_item0_Q(r_rob_part2_item0_Q_wire),
        .r_rob_part2_item10_Q(r_rob_part2_item10_Q_wire),
        .r_rob_part2_item11_Q(r_rob_part2_item11_Q_wire),
        .r_rob_part2_item12_Q(r_rob_part2_item12_Q_wire),
        .r_rob_part2_item13_Q(r_rob_part2_item13_Q_wire),
        .r_rob_part2_item14_Q(r_rob_part2_item14_Q_wire),
        .r_rob_part2_item15_Q(r_rob_part2_item15_Q_wire),
        .r_rob_part2_item16_Q(r_rob_part2_item16_Q_wire),
        .r_rob_part2_item17_Q(r_rob_part2_item17_Q_wire),
        .r_rob_part2_item18_Q(r_rob_part2_item18_Q_wire),
        .r_rob_part2_item19_Q(r_rob_part2_item19_Q_wire),
        .r_rob_part2_item1_Q(r_rob_part2_item1_Q_wire),
        .r_rob_part2_item20_Q(r_rob_part2_item20_Q_wire),
        .r_rob_part2_item21_Q(r_rob_part2_item21_Q_wire),
        .r_rob_part2_item22_Q(r_rob_part2_item22_Q_wire),
        .r_rob_part2_item23_Q(r_rob_part2_item23_Q_wire),
        .r_rob_part2_item24_Q(r_rob_part2_item24_Q_wire),
        .r_rob_part2_item25_Q(r_rob_part2_item25_Q_wire),
        .r_rob_part2_item26_Q(r_rob_part2_item26_Q_wire),
        .r_rob_part2_item27_Q(r_rob_part2_item27_Q_wire),
        .r_rob_part2_item28_Q(r_rob_part2_item28_Q_wire),
        .r_rob_part2_item29_Q(r_rob_part2_item29_Q_wire),
        .r_rob_part2_item2_Q(r_rob_part2_item2_Q_wire),
        .r_rob_part2_item30_Q(r_rob_part2_item30_Q_wire),
        .r_rob_part2_item31_Q(r_rob_part2_item31_Q_wire),
        .r_rob_part2_item3_Q(r_rob_part2_item3_Q_wire),
        .r_rob_part2_item4_Q(r_rob_part2_item4_Q_wire),
        .r_rob_part2_item5_Q(r_rob_part2_item5_Q_wire),
        .r_rob_part2_item6_Q(r_rob_part2_item6_Q_wire),
        .r_rob_part2_item7_Q(r_rob_part2_item7_Q_wire),
        .r_rob_part2_item8_Q(r_rob_part2_item8_Q_wire),
        .r_rob_part2_item9_Q(r_rob_part2_item9_Q_wire),
        .r_stall_fwd_Q(r_stall_fwd_Q_wire),
        .r_start_add_sub_Q(r_start_add_sub_Q_wire),
        .r_start_classify_Q(r_start_classify_Q_wire),
        .r_start_cmp_Q(r_start_cmp_Q_wire),
        .r_start_f2i_Q(r_start_f2i_Q_wire),
        .r_start_fused_Q(r_start_fused_Q_wire),
        .r_start_i2f_Q(r_start_i2f_Q_wire),
        .r_start_max_min_Q(r_start_max_min_Q_wire),
        .r_start_move_Q(r_start_move_Q_wire),
        .r_start_mul_Q(r_start_mul_Q_wire),
        .r_start_sgnj_Q(r_start_sgnj_Q_wire),
        .r_start_sqrt_div_Q(r_start_sqrt_div_Q_wire),
        .r_unit_stall_Q(r_unit_stall_Q_wire),
        .ROB_out_item_done_Q(ROB_out_item_done),
        .s_ack_i_Q(s_ack_i),
        .s_add_sub_rob_stall_Q(s_add_sub_rob_stall),
        .s_float2int_rob_stall_Q(s_float2int_rob_stall),
        .s_flush_i_Q(s_flush_i),
        .s_full_port_Q(s_full_port),
        .s_int2float_rob_stall_Q(s_int2float_rob_stall),
        .s_ready_Q(s_ready),
        .s_start_operation_Q(s_start_operation),
        .sgnj_s_done_o_Q(sgnj_s_done_o_Q_wire),
        .sgnj_s_result_o_Q(sgnj_s_result_o_Q_wire),
        .sgnj_s_ROB_ptr_o_Q(sgnj_s_ROB_ptr_o_Q_wire),
        .sqrt_div_s_busy_o_Q(sqrt_div_s_busy_o_Q_wire),
        .sqrt_div_s_done_o_Q(sqrt_div_s_done_o_Q_wire),
        .sqrt_div_s_flags_o_Q(sqrt_div_s_flags_o_Q_wire),
        .sqrt_div_s_ready_o_Q(sqrt_div_s_ready_o_Q_wire),
        .sqrt_div_s_result_o_Q(sqrt_div_s_result_o_Q_wire),
        .sqrt_div_s_ROB_ptr_o_Q(sqrt_div_s_ROB_ptr_o_Q_wire),
        .sqrt_div_s_start_i_Q(sqrt_div_s_start_i_Q_wire),
        .add_sub_ready_D(add_sub_ready),
        .add_sub_s_ack_i_D(fpu_compute_out_add_sub_s_ack_i_D_wire),
        .add_sub_s_flush_i_D(fpu_compute_out_add_sub_s_flush_i_D_wire),
        .add_sub_s_op_i_D(fpu_compute_out_add_sub_s_op_i_D_wire),
        .add_sub_s_properties_i_D(fpu_compute_out_add_sub_s_properties_i_D_wire),
        .add_sub_s_rm_i_D(fpu_compute_out_add_sub_s_rm_i_D_wire),
        .add_sub_s_ROB_ptr_i_D(fpu_compute_out_add_sub_s_ROB_ptr_i_D_wire),
        .add_sub_s_srcA_i_D(fpu_compute_out_add_sub_s_srcA_i_D_wire),
        .add_sub_s_srcB_i_D(fpu_compute_out_add_sub_s_srcB_i_D_wire),
        .add_sub_s_start_i_D(fpu_compute_out_add_sub_s_start_i_D_wire),
        .classify_s_properties_i_D(fpu_compute_out_classify_s_properties_i_D_wire),
        .classify_s_ROB_ptr_i_D(fpu_compute_out_classify_s_ROB_ptr_i_D_wire),
        .classify_s_srcA_i_D(fpu_compute_out_classify_s_srcA_i_D_wire),
        .classify_s_start_i_D(fpu_compute_out_classify_s_start_i_D_wire),
        .compare_s_op_i_D(fpu_compute_out_compare_s_op_i_D_wire),
        .compare_s_properties_i_D(fpu_compute_out_compare_s_properties_i_D_wire),
        .compare_s_ROB_ptr_i_D(fpu_compute_out_compare_s_ROB_ptr_i_D_wire),
        .compare_s_srcA_i_D(fpu_compute_out_compare_s_srcA_i_D_wire),
        .compare_s_srcB_i_D(fpu_compute_out_compare_s_srcB_i_D_wire),
        .compare_s_start_i_D(fpu_compute_out_compare_s_start_i_D_wire),
        .f2i_ready_D(f2i_ready),
        .float2int_s_ack_i_D(fpu_compute_out_float2int_s_ack_i_D_wire),
        .float2int_s_flush_i_D(fpu_compute_out_float2int_s_flush_i_D_wire),
        .float2int_s_op_i_D(fpu_compute_out_float2int_s_op_i_D_wire),
        .float2int_s_properties_i_D(fpu_compute_out_float2int_s_properties_i_D_wire),
        .float2int_s_rm_i_D(fpu_compute_out_float2int_s_rm_i_D_wire),
        .float2int_s_ROB_ptr_i_D(fpu_compute_out_float2int_s_ROB_ptr_i_D_wire),
        .float2int_s_srcA_i_D(fpu_compute_out_float2int_s_srcA_i_D_wire),
        .float2int_s_start_i_D(fpu_compute_out_float2int_s_start_i_D_wire),
        .fmul_s_flush_i_D(fpu_compute_out_fmul_s_flush_i_D_wire),
        .fmul_s_op_i_D(fpu_compute_out_fmul_s_op_i_D_wire),
        .fmul_s_properties_i_D(fpu_compute_out_fmul_s_properties_i_D_wire),
        .fmul_s_rm_i_D(fpu_compute_out_fmul_s_rm_i_D_wire),
        .fmul_s_ROB_ptr_i_D(fpu_compute_out_fmul_s_ROB_ptr_i_D_wire),
        .fmul_s_srcA_i_D(fpu_compute_out_fmul_s_srcA_i_D_wire),
        .fmul_s_srcB_i_D(fpu_compute_out_fmul_s_srcB_i_D_wire),
        .fmul_s_start_i_D(fpu_compute_out_fmul_s_start_i_D_wire),
        .fused_s_flush_i_D(fpu_compute_out_fused_s_flush_i_D_wire),
        .fused_s_mul_partial_result_i_D(fpu_compute_out_fused_s_mul_partial_result_i_D_wire),
        .fused_s_op_i_D(fpu_compute_out_fused_s_op_i_D_wire),
        .fused_s_properties_i_D(fpu_compute_out_fused_s_properties_i_D_wire),
        .fused_s_rm_i_D(fpu_compute_out_fused_s_rm_i_D_wire),
        .fused_s_ROB_ptr_i_D(fpu_compute_out_fused_s_ROB_ptr_i_D_wire),
        .fused_s_srcA_i_D(fpu_compute_out_fused_s_srcA_i_D_wire),
        .fused_s_srcB_i_D(fpu_compute_out_fused_s_srcB_i_D_wire),
        .fused_s_srcC_i_D(fpu_compute_out_fused_s_srcC_i_D_wire),
        .fused_s_start_i_D(fpu_compute_out_fused_s_start_i_D_wire),
        .i2f_ready_D(i2f_ready),
        .int2float_s_ack_i_D(fpu_compute_out_int2float_s_ack_i_D_wire),
        .int2float_s_flush_i_D(fpu_compute_out_int2float_s_flush_i_D_wire),
        .int2float_s_op_i_D(fpu_compute_out_int2float_s_op_i_D_wire),
        .int2float_s_rm_i_D(fpu_compute_out_int2float_s_rm_i_D_wire),
        .int2float_s_ROB_ptr_i_D(fpu_compute_out_int2float_s_ROB_ptr_i_D_wire),
        .int2float_s_srcA_i_D(fpu_compute_out_int2float_s_srcA_i_D_wire),
        .int2float_s_start_i_D(fpu_compute_out_int2float_s_start_i_D_wire),
        .move_s_ROB_ptr_i_D(fpu_compute_out_move_s_ROB_ptr_i_D_wire),
        .move_s_srcA_i_D(fpu_compute_out_move_s_srcA_i_D_wire),
        .move_s_start_i_D(fpu_compute_out_move_s_start_i_D_wire),
        .parsing_inputs_s_srcA_i_D(fpu_compute_out_parsing_inputs_s_srcA_i_D_wire),
        .parsing_inputs_s_srcB_i_D(fpu_compute_out_parsing_inputs_s_srcB_i_D_wire),
        .parsing_inputs_s_srcC_i_D(fpu_compute_out_parsing_inputs_s_srcC_i_D_wire),
        .r_cnt_ops_inside_D(fpu_compute_out_r_cnt_ops_inside_D_wire),
        .r_cnt_ops_inside_WE(fpu_compute_out_r_cnt_ops_inside_WE_wire),
        .r_exc_stall_D(fpu_compute_out_r_exc_stall_D_wire),
        .r_exc_stall_WE(fpu_compute_out_r_exc_stall_WE_wire),
        .r_fpu_ROB_ptr_out_D(fpu_compute_out_r_fpu_ROB_ptr_out_D_wire),
        .r_fpu_ROB_ptr_out_WE(fpu_compute_out_r_fpu_ROB_ptr_out_WE_wire),
        .r_full_ports_D(fpu_compute_out_r_full_ports_D_wire),
        .r_full_ports_WE(fpu_compute_out_r_full_ports_WE_wire),
        .ROB_out_item_done_D(ROB_out_item_done),
        .s_add_sub_done_D(s_add_sub_done),
        .s_add_sub_ROB_ptr_D(s_add_sub_ROB_ptr),
        .s_busy_o_D(s_busy_o),
        .s_classify_done_D(s_classify_done),
        .s_cmp_done_D(s_cmp_done),
        .s_exc_instr_addr_o_D(s_exc_instr_addr_o),
        .s_exc_tval_o_D(s_exc_tval_o),
        .s_exc_type_o_D(s_exc_type_o),
        .s_exc_valid_o_D(s_exc_valid_o),
        .s_f2i_ROB_ptr_D(s_f2i_ROB_ptr),
        .s_flags_o_D(s_flags_o),
        .s_float2int_done_D(s_float2int_done),
        .s_fpu_addsub_flags_D(s_fpu_addsub_flags),
        .s_fpu_addsub_result_D(s_fpu_addsub_result),
        .s_fpu_classify_ptr_D(s_fpu_classify_ptr),
        .s_fpu_classify_result_D(s_fpu_classify_result),
        .s_fpu_cmp_flags_D(s_fpu_cmp_flags),
        .s_fpu_cmp_result_D(s_fpu_cmp_result),
        .s_fpu_cmp_ROB_ptr_D(s_fpu_cmp_ROB_ptr),
        .s_fpu_f2i_flags_D(s_fpu_f2i_flags),
        .s_fpu_f2i_result_D(s_fpu_f2i_result),
        .s_fpu_fused_flags_D(s_fpu_fused_flags),
        .s_fpu_fused_result_D(s_fpu_fused_result),
        .s_fpu_i2f_flags_D(s_fpu_i2f_flags),
        .s_fpu_i2f_result_D(s_fpu_i2f_result),
        .s_fpu_move_ptr_D(s_fpu_move_ptr),
        .s_fpu_move_result_D(s_fpu_move_result),
        .s_fpu_mul_flags_D(s_fpu_mul_flags),
        .s_fpu_mul_result_D(s_fpu_mul_result),
        .s_fpu_sgnj_ptr_D(s_fpu_sgnj_ptr),
        .s_fpu_sgnj_result_D(s_fpu_sgnj_result),
        .s_fpu_sqrt_div_flags_D(s_fpu_sqrt_div_flags),
        .s_fpu_sqrt_div_result_D(s_fpu_sqrt_div_result),
        .s_full_port_D(s_full_port),
        .s_fused_done_D(s_fused_done),
        .s_fused_ROB_ptr_D(s_fused_ROB_ptr),
        .s_i2f_ROB_ptr_D(s_i2f_ROB_ptr),
        .s_int2float_done_D(s_int2float_done),
        .s_move_done_D(s_move_done),
        .s_mul_done_D(s_mul_done),
        .s_mul_ROB_ptr_D(s_mul_ROB_ptr),
        .s_rd_addr_o_D(s_rd_addr_o),
        .s_rd_data_o_D(s_rd_data_o),
        .s_rdx_valid_o_D(s_rdx_valid_o),
        .s_ready_D(s_ready),
        .s_ready_o_D(s_ready_o),
        .s_ROB_full_D(s_ROB_full),
        .s_sgnj_done_D(s_sgnj_done),
        .s_sqr_div_done_D(s_sqr_div_done),
        .s_sqrt_div_ROB_ptr_D(s_sqrt_div_ROB_ptr),
        .s_start_operation_D(s_start_operation),
        .s_valid_o_D(s_valid_o),
        .s_wb_commit_addr_D(s_wb_commit_addr),
        .sgnj_s_op_i_D(fpu_compute_out_sgnj_s_op_i_D_wire),
        .sgnj_s_ROB_ptr_i_D(fpu_compute_out_sgnj_s_ROB_ptr_i_D_wire),
        .sgnj_s_srcA_i_D(fpu_compute_out_sgnj_s_srcA_i_D_wire),
        .sgnj_s_srcB_i_D(fpu_compute_out_sgnj_s_srcB_i_D_wire),
        .sgnj_s_start_i_D(fpu_compute_out_sgnj_s_start_i_D_wire),
        .sqrt_div_busy_D(sqrt_div_busy),
        .sqrt_div_ready_D(sqrt_div_ready),
        .sqrt_div_s_flush_i_D(fpu_compute_out_sqrt_div_s_flush_i_D_wire),
        .sqrt_div_s_op_i_D(fpu_compute_out_sqrt_div_s_op_i_D_wire),
        .sqrt_div_s_properties_i_D(fpu_compute_out_sqrt_div_s_properties_i_D_wire),
        .sqrt_div_s_rm_i_D(fpu_compute_out_sqrt_div_s_rm_i_D_wire),
        .sqrt_div_s_ROB_ptr_i_D(fpu_compute_out_sqrt_div_s_ROB_ptr_i_D_wire),
        .sqrt_div_s_srcA_i_D(fpu_compute_out_sqrt_div_s_srcA_i_D_wire),
        .sqrt_div_s_srcB_i_D(fpu_compute_out_sqrt_div_s_srcB_i_D_wire),
        .sqrt_div_s_start_i_D(fpu_compute_out_sqrt_div_s_start_i_D_wire)
    );

endmodule: codix_berkelium_ca_core_execute_stage_fpu_t
