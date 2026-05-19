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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_fpu_ROB_write_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_fpu_fpu_ROB_write_t(
    input  logic r_exc_en_Q,
    input  logic [31:0] r_fpu_ROB_done_Q,
    input  logic [4:0] r_fpu_ROB_ptr_out_Q,
    input  logic [4:0] r_fpu_ROB_ptr_Q,
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
    input  logic s_ack_i_Q,
    input  logic [4:0] s_add_sub_ROB_ptr_Q,
    input  logic [4:0] s_f2i_ROB_ptr_Q,
    input  logic [4:0] s_fpu_addsub_flags_Q,
    input  logic [31:0] s_fpu_addsub_result_Q,
    input  logic [4:0] s_fpu_classify_ptr_Q,
    input  logic [31:0] s_fpu_classify_result_Q,
    input  logic [4:0] s_fpu_cmp_flags_Q,
    input  logic [31:0] s_fpu_cmp_result_Q,
    input  logic [4:0] s_fpu_cmp_ROB_ptr_Q,
    input  logic [4:0] s_fpu_f2i_flags_Q,
    input  logic [31:0] s_fpu_f2i_result_Q,
    input  logic [4:0] s_fpu_fused_flags_Q,
    input  logic [31:0] s_fpu_fused_result_Q,
    input  logic [4:0] s_fpu_i2f_flags_Q,
    input  logic [31:0] s_fpu_i2f_result_Q,
    input  logic [4:0] s_fpu_move_ptr_Q,
    input  logic [31:0] s_fpu_move_result_Q,
    input  logic [4:0] s_fpu_mul_flags_Q,
    input  logic [31:0] s_fpu_mul_result_Q,
    input  logic [4:0] s_fpu_sgnj_ptr_Q,
    input  logic [31:0] s_fpu_sgnj_result_Q,
    input  logic [4:0] s_fpu_sqrt_div_flags_Q,
    input  logic [31:0] s_fpu_sqrt_div_result_Q,
    input  logic [3:0] s_fpu_wb_port_w1_Q,
    input  logic [3:0] s_fpu_wb_port_w2_Q,
    input  logic [3:0] s_fpu_wb_port_w3_Q,
    input  logic [3:0] s_fpu_wb_port_w4_Q,
    input  logic [4:0] s_fused_ROB_ptr_Q,
    input  logic [4:0] s_i2f_ROB_ptr_Q,
    input  logic [4:0] s_mul_ROB_ptr_Q,
    input  logic [4:0] s_sqrt_div_ROB_ptr_Q,
    input  logic s_valid_o_Q,
    output logic [31:0] r_fpu_ROB_done_D,
    output logic r_fpu_ROB_done_WE,
    output logic [37:0] r_rob_part2_item0_D,
    output logic r_rob_part2_item0_WE,
    output logic [37:0] r_rob_part2_item10_D,
    output logic r_rob_part2_item10_WE,
    output logic [37:0] r_rob_part2_item11_D,
    output logic r_rob_part2_item11_WE,
    output logic [37:0] r_rob_part2_item12_D,
    output logic r_rob_part2_item12_WE,
    output logic [37:0] r_rob_part2_item13_D,
    output logic r_rob_part2_item13_WE,
    output logic [37:0] r_rob_part2_item14_D,
    output logic r_rob_part2_item14_WE,
    output logic [37:0] r_rob_part2_item15_D,
    output logic r_rob_part2_item15_WE,
    output logic [37:0] r_rob_part2_item16_D,
    output logic r_rob_part2_item16_WE,
    output logic [37:0] r_rob_part2_item17_D,
    output logic r_rob_part2_item17_WE,
    output logic [37:0] r_rob_part2_item18_D,
    output logic r_rob_part2_item18_WE,
    output logic [37:0] r_rob_part2_item19_D,
    output logic r_rob_part2_item19_WE,
    output logic [37:0] r_rob_part2_item1_D,
    output logic r_rob_part2_item1_WE,
    output logic [37:0] r_rob_part2_item20_D,
    output logic r_rob_part2_item20_WE,
    output logic [37:0] r_rob_part2_item21_D,
    output logic r_rob_part2_item21_WE,
    output logic [37:0] r_rob_part2_item22_D,
    output logic r_rob_part2_item22_WE,
    output logic [37:0] r_rob_part2_item23_D,
    output logic r_rob_part2_item23_WE,
    output logic [37:0] r_rob_part2_item24_D,
    output logic r_rob_part2_item24_WE,
    output logic [37:0] r_rob_part2_item25_D,
    output logic r_rob_part2_item25_WE,
    output logic [37:0] r_rob_part2_item26_D,
    output logic r_rob_part2_item26_WE,
    output logic [37:0] r_rob_part2_item27_D,
    output logic r_rob_part2_item27_WE,
    output logic [37:0] r_rob_part2_item28_D,
    output logic r_rob_part2_item28_WE,
    output logic [37:0] r_rob_part2_item29_D,
    output logic r_rob_part2_item29_WE,
    output logic [37:0] r_rob_part2_item2_D,
    output logic r_rob_part2_item2_WE,
    output logic [37:0] r_rob_part2_item30_D,
    output logic r_rob_part2_item30_WE,
    output logic [37:0] r_rob_part2_item31_D,
    output logic r_rob_part2_item31_WE,
    output logic [37:0] r_rob_part2_item3_D,
    output logic r_rob_part2_item3_WE,
    output logic [37:0] r_rob_part2_item4_D,
    output logic r_rob_part2_item4_WE,
    output logic [37:0] r_rob_part2_item5_D,
    output logic r_rob_part2_item5_WE,
    output logic [37:0] r_rob_part2_item6_D,
    output logic r_rob_part2_item6_WE,
    output logic [37:0] r_rob_part2_item7_D,
    output logic r_rob_part2_item7_WE,
    output logic [37:0] r_rob_part2_item8_D,
    output logic r_rob_part2_item8_WE,
    output logic [37:0] r_rob_part2_item9_D,
    output logic r_rob_part2_item9_WE
);
    // type, wire and constant declarations:
    // signal/wire
    logic [4:0] ROB_w_addr1_B0;
    // signal/wire
    logic [4:0] ROB_w_addr2_B0;
    // signal/wire
    logic [4:0] ROB_w_addr3_B0;
    // signal/wire
    logic [4:0] ROB_w_addr4_B0;
    // signal/wire
    logic [37:0] ROB_w_data1_B0;
    // signal/wire
    logic [37:0] ROB_w_data2_B0;
    // signal/wire
    logic [37:0] ROB_w_data3_B0;
    // signal/wire
    logic [37:0] ROB_w_data4_B0;
    // signal/wire
    logic ROB_w_en1_B0;
    // signal/wire
    logic ROB_w_en2_B0;
    // signal/wire
    logic ROB_w_en3_B0;
    // signal/wire
    logic ROB_w_en4_B0;
    // signal/wire
    logic [3:0] codasip_tmp_var_0;
    // signal/wire
    logic [3:0] codasip_tmp_var_1;
    // signal/wire
    logic [3:0] codasip_tmp_var_2;
    // signal/wire
    logic [3:0] codasip_tmp_var_3;

    // data-path code:
    assign codasip_tmp_var_0 = s_fpu_wb_port_w1_Q;
    always_comb begin
        case ( codasip_tmp_var_0 )
            4'h0: ROB_w_en1_B0 = 1'b1;
            4'h1: ROB_w_en1_B0 = 1'b1;
            4'h2: ROB_w_en1_B0 = 1'b1;
            4'h3: ROB_w_en1_B0 = 1'b1;
            4'h4: ROB_w_en1_B0 = 1'b1;
            4'h5: ROB_w_en1_B0 = 1'b1;
            4'h6: ROB_w_en1_B0 = 1'b1;
            4'h7: ROB_w_en1_B0 = 1'b1;
            4'h8: ROB_w_en1_B0 = 1'b1;
            4'h9: ROB_w_en1_B0 = 1'b1;
            4'hd: ROB_w_en1_B0 = 1'b1;
            default: ROB_w_en1_B0 = 1'b0;
        endcase
    end
    always_comb begin
        case ( codasip_tmp_var_0 )
            4'h0: ROB_w_addr1_B0 = s_add_sub_ROB_ptr_Q;
            4'h1: ROB_w_addr1_B0 = s_fpu_classify_ptr_Q;
            4'h2: ROB_w_addr1_B0 = s_fpu_cmp_ROB_ptr_Q;
            4'h3: ROB_w_addr1_B0 = s_sqrt_div_ROB_ptr_Q;
            4'h4: ROB_w_addr1_B0 = s_f2i_ROB_ptr_Q;
            4'h5: ROB_w_addr1_B0 = s_fused_ROB_ptr_Q;
            4'h6: ROB_w_addr1_B0 = s_i2f_ROB_ptr_Q;
            4'h7: ROB_w_addr1_B0 = s_mul_ROB_ptr_Q;
            4'h8: ROB_w_addr1_B0 = s_fpu_sgnj_ptr_Q;
            4'h9: ROB_w_addr1_B0 = s_fpu_move_ptr_Q;
            4'hd: ROB_w_addr1_B0 = r_fpu_ROB_ptr_Q;
            default: ROB_w_addr1_B0 = 5'h00;
        endcase
    end
    always_comb begin
        case ( codasip_tmp_var_0 )
            4'h0: ROB_w_data1_B0 = {1'b0, s_fpu_addsub_flags_Q, s_fpu_addsub_result_Q};
            4'h1: ROB_w_data1_B0 = {6'h00, s_fpu_classify_result_Q};
            4'h2: ROB_w_data1_B0 = {1'b0, s_fpu_cmp_flags_Q, s_fpu_cmp_result_Q};
            4'h3: ROB_w_data1_B0 = {1'b0, s_fpu_sqrt_div_flags_Q, s_fpu_sqrt_div_result_Q};
            4'h4: ROB_w_data1_B0 = {1'b0, s_fpu_f2i_flags_Q, s_fpu_f2i_result_Q};
            4'h5: ROB_w_data1_B0 = {1'b0, s_fpu_fused_flags_Q, s_fpu_fused_result_Q};
            4'h6: ROB_w_data1_B0 = {1'b0, s_fpu_i2f_flags_Q, s_fpu_i2f_result_Q};
            4'h7: ROB_w_data1_B0 = {1'b0, s_fpu_mul_flags_Q, s_fpu_mul_result_Q};
            4'h8: ROB_w_data1_B0 = {6'h00, s_fpu_sgnj_result_Q};
            4'h9: ROB_w_data1_B0 = {6'h00, s_fpu_move_result_Q};
            4'hd: ROB_w_data1_B0 = {r_exc_en_Q, 5'h00, 32'h00000000};
            default: ROB_w_data1_B0 = 38'h0000000000;
        endcase
    end
    assign codasip_tmp_var_1 = s_fpu_wb_port_w2_Q;
    always_comb begin
        case ( codasip_tmp_var_1 )
            4'h0: ROB_w_en2_B0 = 1'b1;
            4'h1: ROB_w_en2_B0 = 1'b1;
            4'h2: ROB_w_en2_B0 = 1'b1;
            4'h4: ROB_w_en2_B0 = 1'b1;
            4'h5: ROB_w_en2_B0 = 1'b1;
            4'h6: ROB_w_en2_B0 = 1'b1;
            4'h7: ROB_w_en2_B0 = 1'b1;
            4'h8: ROB_w_en2_B0 = 1'b1;
            4'h9: ROB_w_en2_B0 = 1'b1;
            4'hd: ROB_w_en2_B0 = 1'b1;
            default: ROB_w_en2_B0 = 1'b0;
        endcase
    end
    always_comb begin
        case ( codasip_tmp_var_1 )
            4'h0: ROB_w_addr2_B0 = s_add_sub_ROB_ptr_Q;
            4'h1: ROB_w_addr2_B0 = s_fpu_classify_ptr_Q;
            4'h2: ROB_w_addr2_B0 = s_fpu_cmp_ROB_ptr_Q;
            4'h4: ROB_w_addr2_B0 = s_f2i_ROB_ptr_Q;
            4'h5: ROB_w_addr2_B0 = s_fused_ROB_ptr_Q;
            4'h6: ROB_w_addr2_B0 = s_i2f_ROB_ptr_Q;
            4'h7: ROB_w_addr2_B0 = s_mul_ROB_ptr_Q;
            4'h8: ROB_w_addr2_B0 = s_fpu_sgnj_ptr_Q;
            4'h9: ROB_w_addr2_B0 = s_fpu_move_ptr_Q;
            4'hd: ROB_w_addr2_B0 = r_fpu_ROB_ptr_Q;
            default: ROB_w_addr2_B0 = 5'h00;
        endcase
    end
    always_comb begin
        case ( codasip_tmp_var_1 )
            4'h0: ROB_w_data2_B0 = {1'b0, s_fpu_addsub_flags_Q, s_fpu_addsub_result_Q};
            4'h1: ROB_w_data2_B0 = {6'h00, s_fpu_classify_result_Q};
            4'h2: ROB_w_data2_B0 = {1'b0, s_fpu_cmp_flags_Q, s_fpu_cmp_result_Q};
            4'h4: ROB_w_data2_B0 = {1'b0, s_fpu_f2i_flags_Q, s_fpu_f2i_result_Q};
            4'h5: ROB_w_data2_B0 = {1'b0, s_fpu_fused_flags_Q, s_fpu_fused_result_Q};
            4'h6: ROB_w_data2_B0 = {1'b0, s_fpu_i2f_flags_Q, s_fpu_i2f_result_Q};
            4'h7: ROB_w_data2_B0 = {1'b0, s_fpu_mul_flags_Q, s_fpu_mul_result_Q};
            4'h8: ROB_w_data2_B0 = {6'h00, s_fpu_sgnj_result_Q};
            4'h9: ROB_w_data2_B0 = {6'h00, s_fpu_move_result_Q};
            4'hd: ROB_w_data2_B0 = {r_exc_en_Q, 5'h00, 32'h00000000};
            default: ROB_w_data2_B0 = 38'h0000000000;
        endcase
    end
    assign codasip_tmp_var_2 = s_fpu_wb_port_w3_Q;
    always_comb begin
        case ( codasip_tmp_var_2 )
            4'h0: ROB_w_en3_B0 = 1'b1;
            4'h4: ROB_w_en3_B0 = 1'b1;
            4'h5: ROB_w_en3_B0 = 1'b1;
            4'h6: ROB_w_en3_B0 = 1'b1;
            4'h7: ROB_w_en3_B0 = 1'b1;
            default: ROB_w_en3_B0 = 1'b0;
        endcase
    end
    always_comb begin
        case ( codasip_tmp_var_2 )
            4'h0: ROB_w_addr3_B0 = s_add_sub_ROB_ptr_Q;
            4'h4: ROB_w_addr3_B0 = s_f2i_ROB_ptr_Q;
            4'h5: ROB_w_addr3_B0 = s_fused_ROB_ptr_Q;
            4'h6: ROB_w_addr3_B0 = s_i2f_ROB_ptr_Q;
            4'h7: ROB_w_addr3_B0 = s_mul_ROB_ptr_Q;
            default: ROB_w_addr3_B0 = 5'h00;
        endcase
    end
    always_comb begin
        case ( codasip_tmp_var_2 )
            4'h0: ROB_w_data3_B0 = {1'b0, s_fpu_addsub_flags_Q, s_fpu_addsub_result_Q};
            4'h4: ROB_w_data3_B0 = {1'b0, s_fpu_f2i_flags_Q, s_fpu_f2i_result_Q};
            4'h5: ROB_w_data3_B0 = {1'b0, s_fpu_fused_flags_Q, s_fpu_fused_result_Q};
            4'h6: ROB_w_data3_B0 = {1'b0, s_fpu_i2f_flags_Q, s_fpu_i2f_result_Q};
            4'h7: ROB_w_data3_B0 = {1'b0, s_fpu_mul_flags_Q, s_fpu_mul_result_Q};
            default: ROB_w_data3_B0 = 38'h0000000000;
        endcase
    end
    assign codasip_tmp_var_3 = s_fpu_wb_port_w4_Q;
    always_comb begin
        case ( codasip_tmp_var_3 )
            4'h0: ROB_w_en4_B0 = 1'b1;
            4'h4: ROB_w_en4_B0 = 1'b1;
            4'h6: ROB_w_en4_B0 = 1'b1;
            4'h7: ROB_w_en4_B0 = 1'b1;
            default: ROB_w_en4_B0 = 1'b0;
        endcase
    end
    always_comb begin
        case ( codasip_tmp_var_3 )
            4'h0: ROB_w_addr4_B0 = s_add_sub_ROB_ptr_Q;
            4'h4: ROB_w_addr4_B0 = s_f2i_ROB_ptr_Q;
            4'h6: ROB_w_addr4_B0 = s_i2f_ROB_ptr_Q;
            4'h7: ROB_w_addr4_B0 = s_mul_ROB_ptr_Q;
            default: ROB_w_addr4_B0 = 5'h00;
        endcase
    end
    always_comb begin
        case ( codasip_tmp_var_3 )
            4'h0: ROB_w_data4_B0 = {1'b0, s_fpu_addsub_flags_Q, s_fpu_addsub_result_Q};
            4'h4: ROB_w_data4_B0 = {1'b0, s_fpu_f2i_flags_Q, s_fpu_f2i_result_Q};
            4'h6: ROB_w_data4_B0 = {1'b0, s_fpu_i2f_flags_Q, s_fpu_i2f_result_Q};
            4'h7: ROB_w_data4_B0 = {1'b0, s_fpu_mul_flags_Q, s_fpu_mul_result_Q};
            default: ROB_w_data4_B0 = 38'h0000000000;
        endcase
    end
    assign r_fpu_ROB_done_D = (((((r_fpu_ROB_done_Q & (~(32'(unsigned'(1'((s_valid_o_Q & s_ack_i_Q)))) << r_fpu_ROB_ptr_out_Q))) | (32'(ROB_w_en1_B0) << ROB_w_addr1_B0)) | (32'(ROB_w_en2_B0) << ROB_w_addr2_B0)) | (32'(ROB_w_en3_B0) << ROB_w_addr3_B0)) | (32'(ROB_w_en4_B0) << ROB_w_addr4_B0));
    assign r_fpu_ROB_done_WE = 1'b1;
    assign r_rob_part2_item0_D = ((((((r_rob_part2_item0_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h00) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h00) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h00) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h00) && ROB_w_en1_B0)}})) | ((r_rob_part2_item0_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h00) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h00) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h00) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h00) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item0_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h00) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h00) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h00) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h00) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item0_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h00) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h00) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h00) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h00) && ROB_w_en4_B0)}}))) | (r_rob_part2_item0_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h00)) && (ROB_w_addr2_B0 != 5'h00)) && (ROB_w_addr3_B0 != 5'h00)) && (ROB_w_addr4_B0 != 5'h00))}}));
    assign r_rob_part2_item0_WE = 1'b1;
    assign r_rob_part2_item10_D = ((((((r_rob_part2_item10_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h0a) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h0a) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h0a) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h0a) && ROB_w_en1_B0)}})) | ((r_rob_part2_item10_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h0a) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h0a) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h0a) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h0a) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item10_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h0a) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h0a) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h0a) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h0a) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item10_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h0a) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h0a) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h0a) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h0a) && ROB_w_en4_B0)}}))) | (r_rob_part2_item10_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h0a)) && (ROB_w_addr2_B0 != 5'h0a)) && (ROB_w_addr3_B0 != 5'h0a)) && (ROB_w_addr4_B0 != 5'h0a))}}));
    assign r_rob_part2_item10_WE = 1'b1;
    assign r_rob_part2_item11_D = ((((((r_rob_part2_item11_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h0b) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h0b) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h0b) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h0b) && ROB_w_en1_B0)}})) | ((r_rob_part2_item11_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h0b) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h0b) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h0b) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h0b) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item11_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h0b) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h0b) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h0b) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h0b) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item11_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h0b) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h0b) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h0b) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h0b) && ROB_w_en4_B0)}}))) | (r_rob_part2_item11_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h0b)) && (ROB_w_addr2_B0 != 5'h0b)) && (ROB_w_addr3_B0 != 5'h0b)) && (ROB_w_addr4_B0 != 5'h0b))}}));
    assign r_rob_part2_item11_WE = 1'b1;
    assign r_rob_part2_item12_D = ((((((r_rob_part2_item12_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h0c) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h0c) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h0c) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h0c) && ROB_w_en1_B0)}})) | ((r_rob_part2_item12_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h0c) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h0c) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h0c) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h0c) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item12_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h0c) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h0c) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h0c) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h0c) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item12_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h0c) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h0c) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h0c) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h0c) && ROB_w_en4_B0)}}))) | (r_rob_part2_item12_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h0c)) && (ROB_w_addr2_B0 != 5'h0c)) && (ROB_w_addr3_B0 != 5'h0c)) && (ROB_w_addr4_B0 != 5'h0c))}}));
    assign r_rob_part2_item12_WE = 1'b1;
    assign r_rob_part2_item13_D = ((((((r_rob_part2_item13_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h0d) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h0d) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h0d) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h0d) && ROB_w_en1_B0)}})) | ((r_rob_part2_item13_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h0d) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h0d) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h0d) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h0d) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item13_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h0d) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h0d) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h0d) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h0d) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item13_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h0d) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h0d) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h0d) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h0d) && ROB_w_en4_B0)}}))) | (r_rob_part2_item13_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h0d)) && (ROB_w_addr2_B0 != 5'h0d)) && (ROB_w_addr3_B0 != 5'h0d)) && (ROB_w_addr4_B0 != 5'h0d))}}));
    assign r_rob_part2_item13_WE = 1'b1;
    assign r_rob_part2_item14_D = ((((((r_rob_part2_item14_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h0e) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h0e) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h0e) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h0e) && ROB_w_en1_B0)}})) | ((r_rob_part2_item14_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h0e) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h0e) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h0e) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h0e) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item14_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h0e) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h0e) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h0e) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h0e) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item14_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h0e) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h0e) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h0e) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h0e) && ROB_w_en4_B0)}}))) | (r_rob_part2_item14_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h0e)) && (ROB_w_addr2_B0 != 5'h0e)) && (ROB_w_addr3_B0 != 5'h0e)) && (ROB_w_addr4_B0 != 5'h0e))}}));
    assign r_rob_part2_item14_WE = 1'b1;
    assign r_rob_part2_item15_D = ((((((r_rob_part2_item15_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h0f) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h0f) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h0f) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h0f) && ROB_w_en1_B0)}})) | ((r_rob_part2_item15_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h0f) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h0f) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h0f) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h0f) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item15_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h0f) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h0f) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h0f) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h0f) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item15_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h0f) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h0f) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h0f) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h0f) && ROB_w_en4_B0)}}))) | (r_rob_part2_item15_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h0f)) && (ROB_w_addr2_B0 != 5'h0f)) && (ROB_w_addr3_B0 != 5'h0f)) && (ROB_w_addr4_B0 != 5'h0f))}}));
    assign r_rob_part2_item15_WE = 1'b1;
    assign r_rob_part2_item16_D = ((((((r_rob_part2_item16_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h10) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h10) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h10) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h10) && ROB_w_en1_B0)}})) | ((r_rob_part2_item16_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h10) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h10) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h10) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h10) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item16_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h10) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h10) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h10) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h10) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item16_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h10) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h10) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h10) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h10) && ROB_w_en4_B0)}}))) | (r_rob_part2_item16_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h10)) && (ROB_w_addr2_B0 != 5'h10)) && (ROB_w_addr3_B0 != 5'h10)) && (ROB_w_addr4_B0 != 5'h10))}}));
    assign r_rob_part2_item16_WE = 1'b1;
    assign r_rob_part2_item17_D = ((((((r_rob_part2_item17_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h11) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h11) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h11) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h11) && ROB_w_en1_B0)}})) | ((r_rob_part2_item17_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h11) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h11) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h11) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h11) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item17_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h11) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h11) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h11) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h11) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item17_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h11) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h11) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h11) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h11) && ROB_w_en4_B0)}}))) | (r_rob_part2_item17_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h11)) && (ROB_w_addr2_B0 != 5'h11)) && (ROB_w_addr3_B0 != 5'h11)) && (ROB_w_addr4_B0 != 5'h11))}}));
    assign r_rob_part2_item17_WE = 1'b1;
    assign r_rob_part2_item18_D = ((((((r_rob_part2_item18_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h12) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h12) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h12) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h12) && ROB_w_en1_B0)}})) | ((r_rob_part2_item18_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h12) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h12) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h12) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h12) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item18_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h12) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h12) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h12) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h12) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item18_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h12) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h12) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h12) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h12) && ROB_w_en4_B0)}}))) | (r_rob_part2_item18_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h12)) && (ROB_w_addr2_B0 != 5'h12)) && (ROB_w_addr3_B0 != 5'h12)) && (ROB_w_addr4_B0 != 5'h12))}}));
    assign r_rob_part2_item18_WE = 1'b1;
    assign r_rob_part2_item19_D = ((((((r_rob_part2_item19_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h13) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h13) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h13) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h13) && ROB_w_en1_B0)}})) | ((r_rob_part2_item19_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h13) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h13) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h13) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h13) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item19_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h13) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h13) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h13) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h13) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item19_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h13) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h13) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h13) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h13) && ROB_w_en4_B0)}}))) | (r_rob_part2_item19_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h13)) && (ROB_w_addr2_B0 != 5'h13)) && (ROB_w_addr3_B0 != 5'h13)) && (ROB_w_addr4_B0 != 5'h13))}}));
    assign r_rob_part2_item19_WE = 1'b1;
    assign r_rob_part2_item1_D = ((((((r_rob_part2_item1_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h01) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h01) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h01) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h01) && ROB_w_en1_B0)}})) | ((r_rob_part2_item1_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h01) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h01) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h01) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h01) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item1_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h01) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h01) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h01) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h01) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item1_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h01) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h01) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h01) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h01) && ROB_w_en4_B0)}}))) | (r_rob_part2_item1_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h01)) && (ROB_w_addr2_B0 != 5'h01)) && (ROB_w_addr3_B0 != 5'h01)) && (ROB_w_addr4_B0 != 5'h01))}}));
    assign r_rob_part2_item1_WE = 1'b1;
    assign r_rob_part2_item20_D = ((((((r_rob_part2_item20_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h14) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h14) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h14) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h14) && ROB_w_en1_B0)}})) | ((r_rob_part2_item20_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h14) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h14) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h14) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h14) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item20_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h14) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h14) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h14) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h14) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item20_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h14) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h14) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h14) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h14) && ROB_w_en4_B0)}}))) | (r_rob_part2_item20_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h14)) && (ROB_w_addr2_B0 != 5'h14)) && (ROB_w_addr3_B0 != 5'h14)) && (ROB_w_addr4_B0 != 5'h14))}}));
    assign r_rob_part2_item20_WE = 1'b1;
    assign r_rob_part2_item21_D = ((((((r_rob_part2_item21_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h15) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h15) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h15) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h15) && ROB_w_en1_B0)}})) | ((r_rob_part2_item21_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h15) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h15) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h15) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h15) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item21_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h15) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h15) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h15) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h15) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item21_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h15) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h15) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h15) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h15) && ROB_w_en4_B0)}}))) | (r_rob_part2_item21_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h15)) && (ROB_w_addr2_B0 != 5'h15)) && (ROB_w_addr3_B0 != 5'h15)) && (ROB_w_addr4_B0 != 5'h15))}}));
    assign r_rob_part2_item21_WE = 1'b1;
    assign r_rob_part2_item22_D = ((((((r_rob_part2_item22_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h16) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h16) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h16) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h16) && ROB_w_en1_B0)}})) | ((r_rob_part2_item22_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h16) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h16) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h16) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h16) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item22_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h16) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h16) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h16) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h16) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item22_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h16) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h16) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h16) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h16) && ROB_w_en4_B0)}}))) | (r_rob_part2_item22_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h16)) && (ROB_w_addr2_B0 != 5'h16)) && (ROB_w_addr3_B0 != 5'h16)) && (ROB_w_addr4_B0 != 5'h16))}}));
    assign r_rob_part2_item22_WE = 1'b1;
    assign r_rob_part2_item23_D = ((((((r_rob_part2_item23_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h17) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h17) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h17) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h17) && ROB_w_en1_B0)}})) | ((r_rob_part2_item23_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h17) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h17) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h17) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h17) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item23_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h17) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h17) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h17) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h17) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item23_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h17) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h17) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h17) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h17) && ROB_w_en4_B0)}}))) | (r_rob_part2_item23_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h17)) && (ROB_w_addr2_B0 != 5'h17)) && (ROB_w_addr3_B0 != 5'h17)) && (ROB_w_addr4_B0 != 5'h17))}}));
    assign r_rob_part2_item23_WE = 1'b1;
    assign r_rob_part2_item24_D = ((((((r_rob_part2_item24_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h18) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h18) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h18) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h18) && ROB_w_en1_B0)}})) | ((r_rob_part2_item24_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h18) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h18) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h18) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h18) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item24_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h18) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h18) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h18) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h18) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item24_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h18) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h18) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h18) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h18) && ROB_w_en4_B0)}}))) | (r_rob_part2_item24_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h18)) && (ROB_w_addr2_B0 != 5'h18)) && (ROB_w_addr3_B0 != 5'h18)) && (ROB_w_addr4_B0 != 5'h18))}}));
    assign r_rob_part2_item24_WE = 1'b1;
    assign r_rob_part2_item25_D = ((((((r_rob_part2_item25_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h19) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h19) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h19) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h19) && ROB_w_en1_B0)}})) | ((r_rob_part2_item25_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h19) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h19) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h19) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h19) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item25_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h19) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h19) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h19) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h19) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item25_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h19) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h19) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h19) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h19) && ROB_w_en4_B0)}}))) | (r_rob_part2_item25_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h19)) && (ROB_w_addr2_B0 != 5'h19)) && (ROB_w_addr3_B0 != 5'h19)) && (ROB_w_addr4_B0 != 5'h19))}}));
    assign r_rob_part2_item25_WE = 1'b1;
    assign r_rob_part2_item26_D = ((((((r_rob_part2_item26_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h1a) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h1a) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h1a) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h1a) && ROB_w_en1_B0)}})) | ((r_rob_part2_item26_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h1a) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h1a) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h1a) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h1a) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item26_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h1a) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h1a) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h1a) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h1a) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item26_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h1a) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h1a) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h1a) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h1a) && ROB_w_en4_B0)}}))) | (r_rob_part2_item26_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h1a)) && (ROB_w_addr2_B0 != 5'h1a)) && (ROB_w_addr3_B0 != 5'h1a)) && (ROB_w_addr4_B0 != 5'h1a))}}));
    assign r_rob_part2_item26_WE = 1'b1;
    assign r_rob_part2_item27_D = ((((((r_rob_part2_item27_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h1b) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h1b) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h1b) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h1b) && ROB_w_en1_B0)}})) | ((r_rob_part2_item27_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h1b) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h1b) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h1b) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h1b) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item27_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h1b) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h1b) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h1b) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h1b) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item27_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h1b) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h1b) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h1b) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h1b) && ROB_w_en4_B0)}}))) | (r_rob_part2_item27_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h1b)) && (ROB_w_addr2_B0 != 5'h1b)) && (ROB_w_addr3_B0 != 5'h1b)) && (ROB_w_addr4_B0 != 5'h1b))}}));
    assign r_rob_part2_item27_WE = 1'b1;
    assign r_rob_part2_item28_D = ((((((r_rob_part2_item28_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h1c) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h1c) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h1c) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h1c) && ROB_w_en1_B0)}})) | ((r_rob_part2_item28_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h1c) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h1c) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h1c) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h1c) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item28_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h1c) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h1c) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h1c) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h1c) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item28_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h1c) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h1c) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h1c) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h1c) && ROB_w_en4_B0)}}))) | (r_rob_part2_item28_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h1c)) && (ROB_w_addr2_B0 != 5'h1c)) && (ROB_w_addr3_B0 != 5'h1c)) && (ROB_w_addr4_B0 != 5'h1c))}}));
    assign r_rob_part2_item28_WE = 1'b1;
    assign r_rob_part2_item29_D = ((((((r_rob_part2_item29_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h1d) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h1d) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h1d) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h1d) && ROB_w_en1_B0)}})) | ((r_rob_part2_item29_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h1d) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h1d) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h1d) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h1d) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item29_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h1d) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h1d) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h1d) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h1d) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item29_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h1d) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h1d) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h1d) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h1d) && ROB_w_en4_B0)}}))) | (r_rob_part2_item29_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h1d)) && (ROB_w_addr2_B0 != 5'h1d)) && (ROB_w_addr3_B0 != 5'h1d)) && (ROB_w_addr4_B0 != 5'h1d))}}));
    assign r_rob_part2_item29_WE = 1'b1;
    assign r_rob_part2_item2_D = ((((((r_rob_part2_item2_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h02) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h02) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h02) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h02) && ROB_w_en1_B0)}})) | ((r_rob_part2_item2_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h02) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h02) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h02) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h02) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item2_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h02) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h02) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h02) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h02) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item2_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h02) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h02) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h02) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h02) && ROB_w_en4_B0)}}))) | (r_rob_part2_item2_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h02)) && (ROB_w_addr2_B0 != 5'h02)) && (ROB_w_addr3_B0 != 5'h02)) && (ROB_w_addr4_B0 != 5'h02))}}));
    assign r_rob_part2_item2_WE = 1'b1;
    assign r_rob_part2_item30_D = ((((((r_rob_part2_item30_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h1e) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h1e) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h1e) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h1e) && ROB_w_en1_B0)}})) | ((r_rob_part2_item30_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h1e) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h1e) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h1e) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h1e) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item30_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h1e) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h1e) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h1e) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h1e) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item30_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h1e) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h1e) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h1e) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h1e) && ROB_w_en4_B0)}}))) | (r_rob_part2_item30_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h1e)) && (ROB_w_addr2_B0 != 5'h1e)) && (ROB_w_addr3_B0 != 5'h1e)) && (ROB_w_addr4_B0 != 5'h1e))}}));
    assign r_rob_part2_item30_WE = 1'b1;
    assign r_rob_part2_item31_D = ((((((r_rob_part2_item31_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h1f) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h1f) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h1f) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h1f) && ROB_w_en1_B0)}})) | ((r_rob_part2_item31_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h1f) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h1f) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h1f) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h1f) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item31_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h1f) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h1f) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h1f) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h1f) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item31_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h1f) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h1f) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h1f) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h1f) && ROB_w_en4_B0)}}))) | (r_rob_part2_item31_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h1f)) && (ROB_w_addr2_B0 != 5'h1f)) && (ROB_w_addr3_B0 != 5'h1f)) && (ROB_w_addr4_B0 != 5'h1f))}}));
    assign r_rob_part2_item31_WE = 1'b1;
    assign r_rob_part2_item3_D = ((((((r_rob_part2_item3_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h03) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h03) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h03) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h03) && ROB_w_en1_B0)}})) | ((r_rob_part2_item3_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h03) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h03) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h03) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h03) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item3_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h03) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h03) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h03) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h03) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item3_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h03) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h03) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h03) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h03) && ROB_w_en4_B0)}}))) | (r_rob_part2_item3_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h03)) && (ROB_w_addr2_B0 != 5'h03)) && (ROB_w_addr3_B0 != 5'h03)) && (ROB_w_addr4_B0 != 5'h03))}}));
    assign r_rob_part2_item3_WE = 1'b1;
    assign r_rob_part2_item4_D = ((((((r_rob_part2_item4_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h04) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h04) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h04) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h04) && ROB_w_en1_B0)}})) | ((r_rob_part2_item4_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h04) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h04) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h04) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h04) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item4_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h04) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h04) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h04) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h04) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item4_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h04) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h04) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h04) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h04) && ROB_w_en4_B0)}}))) | (r_rob_part2_item4_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h04)) && (ROB_w_addr2_B0 != 5'h04)) && (ROB_w_addr3_B0 != 5'h04)) && (ROB_w_addr4_B0 != 5'h04))}}));
    assign r_rob_part2_item4_WE = 1'b1;
    assign r_rob_part2_item5_D = ((((((r_rob_part2_item5_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h05) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h05) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h05) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h05) && ROB_w_en1_B0)}})) | ((r_rob_part2_item5_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h05) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h05) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h05) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h05) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item5_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h05) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h05) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h05) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h05) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item5_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h05) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h05) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h05) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h05) && ROB_w_en4_B0)}}))) | (r_rob_part2_item5_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h05)) && (ROB_w_addr2_B0 != 5'h05)) && (ROB_w_addr3_B0 != 5'h05)) && (ROB_w_addr4_B0 != 5'h05))}}));
    assign r_rob_part2_item5_WE = 1'b1;
    assign r_rob_part2_item6_D = ((((((r_rob_part2_item6_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h06) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h06) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h06) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h06) && ROB_w_en1_B0)}})) | ((r_rob_part2_item6_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h06) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h06) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h06) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h06) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item6_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h06) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h06) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h06) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h06) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item6_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h06) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h06) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h06) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h06) && ROB_w_en4_B0)}}))) | (r_rob_part2_item6_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h06)) && (ROB_w_addr2_B0 != 5'h06)) && (ROB_w_addr3_B0 != 5'h06)) && (ROB_w_addr4_B0 != 5'h06))}}));
    assign r_rob_part2_item6_WE = 1'b1;
    assign r_rob_part2_item7_D = ((((((r_rob_part2_item7_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h07) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h07) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h07) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h07) && ROB_w_en1_B0)}})) | ((r_rob_part2_item7_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h07) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h07) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h07) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h07) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item7_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h07) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h07) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h07) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h07) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item7_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h07) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h07) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h07) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h07) && ROB_w_en4_B0)}}))) | (r_rob_part2_item7_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h07)) && (ROB_w_addr2_B0 != 5'h07)) && (ROB_w_addr3_B0 != 5'h07)) && (ROB_w_addr4_B0 != 5'h07))}}));
    assign r_rob_part2_item7_WE = 1'b1;
    assign r_rob_part2_item8_D = ((((((r_rob_part2_item8_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h08) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h08) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h08) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h08) && ROB_w_en1_B0)}})) | ((r_rob_part2_item8_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h08) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h08) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h08) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h08) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item8_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h08) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h08) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h08) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h08) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item8_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h08) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h08) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h08) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h08) && ROB_w_en4_B0)}}))) | (r_rob_part2_item8_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h08)) && (ROB_w_addr2_B0 != 5'h08)) && (ROB_w_addr3_B0 != 5'h08)) && (ROB_w_addr4_B0 != 5'h08))}}));
    assign r_rob_part2_item8_WE = 1'b1;
    assign r_rob_part2_item9_D = ((((((r_rob_part2_item9_Q & {32'd38{(~(((ROB_w_en1_B0 | ((ROB_w_addr2_B0 == 5'h09) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h09) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h09) && ROB_w_en4_B0)))}}) ^ (ROB_w_data1_B0 & {32'd38{((ROB_w_addr1_B0 == 5'h09) && ROB_w_en1_B0)}})) | ((r_rob_part2_item9_Q & {32'd38{(~(((ROB_w_en2_B0 | ((ROB_w_addr1_B0 == 5'h09) && ROB_w_en1_B0)) | ((ROB_w_addr3_B0 == 5'h09) && ROB_w_en3_B0)) | ((ROB_w_addr4_B0 == 5'h09) && ROB_w_en4_B0)))}}) ^ (ROB_w_data2_B0 & {32'd38{((ROB_w_addr2_B0 == 5'h09) && ROB_w_en2_B0)}}))) | ((r_rob_part2_item9_Q & {32'd38{(~(((ROB_w_en3_B0 | ((ROB_w_addr2_B0 == 5'h09) && ROB_w_en2_B0)) | ((ROB_w_addr1_B0 == 5'h09) && ROB_w_en1_B0)) | ((ROB_w_addr4_B0 == 5'h09) && ROB_w_en4_B0)))}}) ^ (ROB_w_data3_B0 & {32'd38{((ROB_w_addr3_B0 == 5'h09) && ROB_w_en3_B0)}}))) | ((r_rob_part2_item9_Q & {32'd38{(~(((ROB_w_en4_B0 | ((ROB_w_addr2_B0 == 5'h09) && ROB_w_en2_B0)) | ((ROB_w_addr3_B0 == 5'h09) && ROB_w_en3_B0)) | ((ROB_w_addr1_B0 == 5'h09) && ROB_w_en1_B0)))}}) ^ (ROB_w_data4_B0 & {32'd38{((ROB_w_addr4_B0 == 5'h09) && ROB_w_en4_B0)}}))) | (r_rob_part2_item9_Q & {32'd38{(((((((ROB_w_en1_B0 && ROB_w_en2_B0) && ROB_w_en3_B0) && ROB_w_en4_B0) && (ROB_w_addr1_B0 != 5'h09)) && (ROB_w_addr2_B0 != 5'h09)) && (ROB_w_addr3_B0 != 5'h09)) && (ROB_w_addr4_B0 != 5'h09))}}));
    assign r_rob_part2_item9_WE = 1'b1;
    // code snippets:
`ifdef CODASIP_RTL_ASSERTIONS
    // Specify default clock signal for all assertions.
    // The clock may run even when the unit has gated clock signal.
    default clocking @(posedge `CODASIP_RTL_ASSERTIONS_CLOCK); endclocking

`ifdef CODASIP_RTL_ASSERTIONS_RESET
    // Disable all the assertions in case reset is asserted.
    default disable iff ((`CODASIP_RTL_ASSERTIONS_RESET == 1'b0));
`endif

    parameter int unsigned ROB_SIZE = int'(32'sh00000020);
    generate
        genvar it;
        for (it = 0; it < ROB_SIZE; it++) begin
            assert property ((r_fpu_ROB_ptr_Q == r_fpu_ROB_ptr_out_Q) && (it !=r_fpu_ROB_ptr_Q) |-> !r_fpu_ROB_done_Q[it])
            else $fatal(1, "There should not be any valid result in ROB between fpu_ROB_ptr and fpu_ROB_ptr_out. Valid item at index %0d", it);
            assert property ((r_fpu_ROB_ptr_Q > r_fpu_ROB_ptr_out_Q)  && !(it inside {[r_fpu_ROB_ptr_out_Q : (r_fpu_ROB_ptr_Q-1)]}) |-> !r_fpu_ROB_done_Q[it])
            else $fatal(1, "There should not be any valid result in ROB between fpu_ROB_ptr and fpu_ROB_ptr_out. Valid item at index %0d", it);
            if (it < (ROB_SIZE-1)) begin            assert property ((r_fpu_ROB_ptr_Q < r_fpu_ROB_ptr_out_Q)  &&  it inside {[r_fpu_ROB_ptr_Q : (r_fpu_ROB_ptr_out_Q-1)]}  |-> !r_fpu_ROB_done_Q[it])
                else $fatal(1, "There should not be any valid result in ROB between fpu_ROB_ptr and fpu_ROB_ptr_out. Valid item at index %0d", it);
            end    end
    endgenerate

    overwriting_valid_ROB_item: assert property (
        ((!((((((r_fpu_ROB_done_Q >> ROB_w_addr1_B0) & 32'(ROB_w_en1_B0)) != 32'h00000000) || (((r_fpu_ROB_done_Q >> ROB_w_addr2_B0) & 32'(ROB_w_en2_B0)) != 32'h00000000)) || (((r_fpu_ROB_done_Q >> ROB_w_addr3_B0) & 32'(ROB_w_en3_B0)) != 32'h00000000)) || (((r_fpu_ROB_done_Q >> ROB_w_addr4_B0) & 32'(ROB_w_en4_B0)) != 32'h00000000))))
    )
    else $fatal(32'sd2, "overwriting_valid_ROB_item: Rewritting already valid item in reorder buffer on index %d", ((ROB_w_en1_B0) ? ROB_w_addr1_B0 : ((ROB_w_en2_B0) ? ROB_w_addr2_B0 : ((ROB_w_en3_B0) ? ROB_w_addr3_B0 : ROB_w_addr4_B0))));

`endif  // CODASIP_RTL_ASSERTIONS

endmodule: codix_berkelium_ca_core_execute_stage_fpu_fpu_ROB_write_t
