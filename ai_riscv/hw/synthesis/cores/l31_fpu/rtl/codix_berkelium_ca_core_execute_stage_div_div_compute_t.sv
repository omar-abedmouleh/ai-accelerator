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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_div_div_compute_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_div_div_compute_t(
    input  logic ACT,
    input  logic [5:0] r_counter_Q,
    input  logic [32:0] r_den_Q,
    input  logic [32:0] r_div_Q,
    input  logic [32:0] r_rem_Q,
    input  logic [1:0] r_state_Q,
    input  logic s_flush_i_Q,
    input  logic [7:0] s_op_i_Q,
    input  logic [31:0] s_s1_data_i_Q,
    input  logic [31:0] s_s2_data_i_Q,
    output logic [5:0] r_counter_D,
    output logic r_counter_WE,
    output logic [32:0] r_den_D,
    output logic r_den_WE,
    output logic [32:0] r_div_D,
    output logic r_div_WE,
    output logic [7:0] r_op_D,
    output logic r_op_WE,
    output logic [32:0] r_rem_D,
    output logic r_rem_WE,
    output logic r_sign_D,
    output logic r_sign_WE,
    output logic [1:0] r_state_D,
    output logic r_state_WE
);
    // type, wire and constant declarations:
    // signal/wire
    logic [1:0] codasip_tmp_var_0;
    // signal/wire
    logic codasip_tmp_var_1;
    // signal/wire
    logic [7:0] codasip_tmp_var_2;
    // signal/wire
    logic codasip_tmp_var_3;
    // signal/wire
    logic codasip_tmp_var_4;
    // signal/wire
    logic codasip_tmp_var_5;
    // signal/wire
    logic [32:0] codasip_tmp_var_6;
    // signal/wire
    logic [32:0] denominator_B0B0B0;
    // signal/wire
    logic [33:0] diff_1_B0B1B1B0;
    // signal/wire
    logic [32:0] div_1_B0B1B1B0;
    // signal/wire
    logic div_by_zero_B0B0B0;
    // signal/wire
    logic [5:0] div_msb_B0B0B0;
    // signal/wire
    logic [5:0] div_shift_B0B0B0;
    // signal/wire
    logic [32:0] dividend_B0B0B0;
    // signal/wire
    logic [32:0] rem_1_B0B1B1B0;
    // signal/wire
    logic [65:0] rem_div_1_B0B1B1B0;
    // signal/wire
    logic [65:0] rem_div_fixed_1_B0B1B1B0B0;
    // signal/wire
    logic rs1_sign_B0B0B0;
    // signal/wire
    logic rs2_sign_B0B0B0;

    // data-path code:
    assign codasip_tmp_var_0 = r_state_Q;
    assign codasip_tmp_var_1 = (codasip_tmp_var_0 == 2'h0) ? (((((s_op_i_Q == 8'h3f) | (s_op_i_Q == 8'h40)) | (s_op_i_Q == 8'h41)) | (s_op_i_Q == 8'h42)) & (~s_flush_i_Q)) : 1'b0;
    assign codasip_tmp_var_2 = codasip_tmp_var_1 ? s_op_i_Q : 8'h00;
    assign rs1_sign_B0B0B0 = ((codasip_tmp_var_2 == 8'h3f) || (codasip_tmp_var_2 == 8'h41)) ? s_s1_data_i_Q[31] :
        (((codasip_tmp_var_2 == 8'h42) || (codasip_tmp_var_2 == 8'h40)) || codasip_tmp_var_1) ? 1'b0 : 1'b0;
    assign rs2_sign_B0B0B0 = ((codasip_tmp_var_2 == 8'h3f) || (codasip_tmp_var_2 == 8'h41)) ? s_s2_data_i_Q[31] :
        (((codasip_tmp_var_2 == 8'h42) || (codasip_tmp_var_2 == 8'h40)) || codasip_tmp_var_1) ? 1'b0 : 1'b0;
    assign dividend_B0B0B0 = ((codasip_tmp_var_2 == 8'h3f) || (codasip_tmp_var_2 == 8'h41)) ? ((rs1_sign_B0B0B0) ? 33'(unsigned'(32'(unsigned'((-signed'(s_s1_data_i_Q)))))) : 33'(s_s1_data_i_Q)) :
        (codasip_tmp_var_2 == 8'h42) ? 33'(s_s1_data_i_Q) :
        (codasip_tmp_var_2 == 8'h40) ? 33'(s_s1_data_i_Q) :
        codasip_tmp_var_1 ? 33'h000000000 : 33'h000000000;
    assign denominator_B0B0B0 = ((codasip_tmp_var_2 == 8'h3f) || (codasip_tmp_var_2 == 8'h41)) ? ((rs2_sign_B0B0B0) ? 33'(unsigned'(32'(unsigned'((-signed'(s_s2_data_i_Q)))))) : 33'(s_s2_data_i_Q)) :
        (codasip_tmp_var_2 == 8'h42) ? 33'(s_s2_data_i_Q) :
        (codasip_tmp_var_2 == 8'h40) ? 33'(s_s2_data_i_Q) :
        codasip_tmp_var_1 ? 33'h000000000 : 33'h000000000;
    assign div_by_zero_B0B0B0 = codasip_tmp_var_1 ? (denominator_B0B0B0 == 33'h000000000) : 1'b0;
    assign codasip_tmp_var_6 = codasip_tmp_var_1 ? (((dividend_B0B0B0[32] != 1'b0)) ? 33'h000000000 : (((dividend_B0B0B0[31] != 1'b0)) ? 33'h000000001 : (((dividend_B0B0B0[30] != 1'b0)) ? 33'h000000002 : (((dividend_B0B0B0[29] != 1'b0)) ? 33'h000000003 : (((dividend_B0B0B0[28] != 1'b0)) ? 33'h000000004 : (((dividend_B0B0B0[27] != 1'b0)) ? 33'h000000005 : (((dividend_B0B0B0[26] != 1'b0)) ? 33'h000000006 : (((dividend_B0B0B0[25] != 1'b0)) ? 33'h000000007 : (((dividend_B0B0B0[24] != 1'b0)) ? 33'h000000008 : (((dividend_B0B0B0[23] != 1'b0)) ? 33'h000000009 : (((dividend_B0B0B0[22] != 1'b0)) ? 33'h00000000a : (((dividend_B0B0B0[21] != 1'b0)) ? 33'h00000000b : (((dividend_B0B0B0[20] != 1'b0)) ? 33'h00000000c : (((dividend_B0B0B0[19] != 1'b0)) ? 33'h00000000d : (((dividend_B0B0B0[18] != 1'b0)) ? 33'h00000000e : (((dividend_B0B0B0[17] != 1'b0)) ? 33'h00000000f : (((dividend_B0B0B0[16] != 1'b0)) ? 33'h000000010 : (((dividend_B0B0B0[15] != 1'b0)) ? 33'h000000011 : (((dividend_B0B0B0[14] != 1'b0)) ? 33'h000000012 : (((dividend_B0B0B0[13] != 1'b0)) ? 33'h000000013 : (((dividend_B0B0B0[12] != 1'b0)) ? 33'h000000014 : (((dividend_B0B0B0[11] != 1'b0)) ? 33'h000000015 : (((dividend_B0B0B0[10] != 1'b0)) ? 33'h000000016 : (((dividend_B0B0B0[9] != 1'b0)) ? 33'h000000017 : (((dividend_B0B0B0[8] != 1'b0)) ? 33'h000000018 : (((dividend_B0B0B0[7] != 1'b0)) ? 33'h000000019 : (((dividend_B0B0B0[6] != 1'b0)) ? 33'h00000001a : (((dividend_B0B0B0[5] != 1'b0)) ? 33'h00000001b : (((dividend_B0B0B0[4] != 1'b0)) ? 33'h00000001c : (((dividend_B0B0B0[3] != 1'b0)) ? 33'h00000001d : (((dividend_B0B0B0[2] != 1'b0)) ? 33'h00000001e : (((dividend_B0B0B0[1] != 1'b0)) ? 33'h00000001f : (((dividend_B0B0B0[0] != 1'b0)) ? 33'h000000020 : 33'h000000021))))))))))))))))))))))))))))))))) : 33'h000000000;
    assign div_msb_B0B0B0 = codasip_tmp_var_1 ? 6'(((div_by_zero_B0B0B0) ? 33'h000000000 : codasip_tmp_var_6)) : 6'h00;
    assign div_shift_B0B0B0 = codasip_tmp_var_1 ? div_msb_B0B0B0 : 6'h00;
    assign codasip_tmp_var_3 = (codasip_tmp_var_0 == 2'h1) ? s_flush_i_Q : 1'b0;
    assign codasip_tmp_var_4 = ((!codasip_tmp_var_3) && (codasip_tmp_var_0 == 2'h1)) ? (r_counter_Q != 6'h00) : 1'b0;
    assign rem_div_1_B0B1B1B0 = codasip_tmp_var_4 ? ({r_rem_Q, r_div_Q} << 32'sh00000001) : {66{1'b0}};
    assign diff_1_B0B1B1B0 = codasip_tmp_var_4 ? (unsigned'(signed'(34'(rem_div_1_B0B1B1B0[65:33]))) - 34'(r_den_Q)) : 34'h000000000;
    assign codasip_tmp_var_5 = codasip_tmp_var_4 ? (diff_1_B0B1B1B0[33] == 1'b0) : 1'b0;
    assign rem_div_fixed_1_B0B1B1B0B0 = codasip_tmp_var_5 ? {diff_1_B0B1B1B0[32:0], rem_div_1_B0B1B1B0[32:1], 1'b1} : {66{1'b0}};
    assign div_1_B0B1B1B0 = codasip_tmp_var_5 ? rem_div_fixed_1_B0B1B1B0B0[32:0] :
        codasip_tmp_var_4 ? rem_div_1_B0B1B1B0[32:0] : 33'h000000000;
    assign rem_1_B0B1B1B0 = codasip_tmp_var_5 ? rem_div_fixed_1_B0B1B1B0B0[65:33] :
        codasip_tmp_var_4 ? rem_div_1_B0B1B1B0[65:33] : 33'h000000000;
    assign r_counter_D = codasip_tmp_var_1 ? (6'h21 - div_shift_B0B0B0) :
        codasip_tmp_var_4 ? (r_counter_Q - 6'h01) :
        (codasip_tmp_var_0 == 2'h2) ? 6'h00 : 6'h00;
    assign r_counter_WE = ((ACT == 1'b1) && ((codasip_tmp_var_1 || codasip_tmp_var_4) || (codasip_tmp_var_0 == 2'h2))) ? 1'b1 : 1'b0;
    assign r_den_D = denominator_B0B0B0;
    assign r_den_WE = ((ACT == 1'b1) && codasip_tmp_var_1) ? 1'b1 : 1'b0;
    assign r_div_D = codasip_tmp_var_1 ? (dividend_B0B0B0 << div_shift_B0B0B0) :
        codasip_tmp_var_4 ? div_1_B0B1B1B0 :
        (codasip_tmp_var_0 == 2'h2) ? 33'h0ffffffff : 33'h000000000;
    assign r_div_WE = ((ACT == 1'b1) && ((codasip_tmp_var_1 || codasip_tmp_var_4) || (codasip_tmp_var_0 == 2'h2))) ? 1'b1 : 1'b0;
    assign r_op_D = s_op_i_Q;
    assign r_op_WE = ((ACT == 1'b1) && codasip_tmp_var_1) ? 1'b1 : 1'b0;
    assign r_rem_D = codasip_tmp_var_1 ? 33'h000000000 :
        codasip_tmp_var_4 ? rem_1_B0B1B1B0 :
        (codasip_tmp_var_0 == 2'h2) ? r_div_Q : 33'h000000000;
    assign r_rem_WE = ((ACT == 1'b1) && ((codasip_tmp_var_1 || codasip_tmp_var_4) || (codasip_tmp_var_0 == 2'h2))) ? 1'b1 : 1'b0;
    assign r_sign_D = ((~((s_s2_data_i_Q == 32'h00000000) & (s_op_i_Q == 8'h3f))) & (((s_op_i_Q == 8'h41)) ? rs1_sign_B0B0B0 : (rs1_sign_B0B0B0 != rs2_sign_B0B0B0)));
    assign r_sign_WE = ((ACT == 1'b1) && codasip_tmp_var_1) ? 1'b1 : 1'b0;
    assign r_state_D = codasip_tmp_var_1 ? ((div_by_zero_B0B0B0) ? 2'h2 : 2'h1) :
        (codasip_tmp_var_3 || ((!codasip_tmp_var_4) && (codasip_tmp_var_0 == 2'h1))) ? 2'h0 :
        (codasip_tmp_var_0 == 2'h2) ? ((s_flush_i_Q) ? 2'h0 : 2'h1) :
        (((!(codasip_tmp_var_0 == 2'h0)) && (!(codasip_tmp_var_0 == 2'h1))) && (!(codasip_tmp_var_0 == 2'h2))) ? 2'h0 : 2'h0;
    assign r_state_WE = ((ACT == 1'b1) && ((((codasip_tmp_var_1 || codasip_tmp_var_3) || ((!codasip_tmp_var_4) && (codasip_tmp_var_0 == 2'h1))) || (codasip_tmp_var_0 == 2'h2)) || (((!(codasip_tmp_var_0 == 2'h0)) && (!(codasip_tmp_var_0 == 2'h1))) && (!(codasip_tmp_var_0 == 2'h2))))) ? 1'b1 : 1'b0;
    // code snippets:
`ifdef CODASIP_RTL_ASSERTIONS
    // Specify default clock signal for all assertions.
    // The clock may run even when the unit has gated clock signal.
    default clocking @(posedge `CODASIP_RTL_ASSERTIONS_CLOCK); endclocking

`ifdef CODASIP_RTL_ASSERTIONS_RESET
    // Disable all the assertions in case reset is asserted.
    default disable iff ((`CODASIP_RTL_ASSERTIONS_RESET == 1'b0));
`endif

    assert property (
        ((!((ACT == 1'b1) && (((((!(codasip_tmp_var_2 == 8'h3f)) && (!(codasip_tmp_var_2 == 8'h41))) && (!(codasip_tmp_var_2 == 8'h40))) && (!(codasip_tmp_var_2 == 8'h42))) && codasip_tmp_var_1))))
    )
    else $fatal(32'sd2, "DIV module-unknown operation");

`endif  // CODASIP_RTL_ASSERTIONS

endmodule: codix_berkelium_ca_core_execute_stage_div_div_compute_t
