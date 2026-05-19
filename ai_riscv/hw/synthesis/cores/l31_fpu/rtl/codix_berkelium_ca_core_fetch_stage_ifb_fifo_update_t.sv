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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_ifb_fifo_update_t' functional unit.
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

module codix_berkelium_ca_core_fetch_stage_ifb_fifo_update_t(
    input  logic r_aempty_Q,
    input  logic r_afull_Q,
    input  logic r_empty_Q,
    input  logic r_full_Q,
    input  logic [1:0] r_read_ptr_Q,
    input  logic [1:0] r_write_ptr_Q,
    input  logic s_aempty_next_Q,
    input  logic s_afull_next_Q,
    input  logic s_clear_i_Q,
    input  logic [105:0] s_d_i_Q,
    input  logic s_pop_Q,
    input  logic s_push_Q,
    input  logic s_re_i_Q,
    input  logic [1:0] s_read_ptr_inc2_Q,
    input  logic [1:0] s_read_ptr_inc_Q,
    input  logic s_we_i_Q,
    input  logic [1:0] s_write_ptr_inc2_Q,
    input  logic [1:0] s_write_ptr_inc_Q,
    output logic r_aempty_D,
    output logic r_aempty_WE,
    output logic r_afull_D,
    output logic r_afull_WE,
    output logic r_empty_D,
    output logic r_empty_WE,
    output logic r_full_D,
    output logic r_full_WE,
    output logic [1:0] r_read_ptr_D,
    output logic r_read_ptr_WE,
    output logic [1:0] r_write_ptr_D,
    output logic r_write_ptr_WE,
    output logic [105:0] rf_fifo_w_D,
    output logic [1:0] rf_fifo_w_WA,
    output logic rf_fifo_w_WE,
    output logic s_aempty_next_D,
    output logic s_afull_next_D,
    output logic s_pop_D,
    output logic s_push_D,
    output logic [1:0] s_read_ptr_inc2_D,
    output logic [1:0] s_read_ptr_inc_D,
    output logic [1:0] s_write_ptr_inc2_D,
    output logic [1:0] s_write_ptr_inc_D
);
    // type, wire and constant declarations:
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
    logic codasip_tmp_var_7;
    // signal/wire
    logic codasip_tmp_var_8;
    // signal/wire
    logic codasip_tmp_var_9;

    // data-path code:
    assign codasip_tmp_var_0 = s_clear_i_Q;
    assign codasip_tmp_var_1 = (!codasip_tmp_var_0) ? ((r_aempty_Q & s_pop_Q) & (~s_push_Q)) : 1'b0;
    assign codasip_tmp_var_2 = ((!codasip_tmp_var_1) && (!codasip_tmp_var_0)) ? ((~s_pop_Q) & s_push_Q) : 1'b0;
    assign codasip_tmp_var_3 = (!codasip_tmp_var_0) ? ((r_afull_Q & (~s_pop_Q)) & s_push_Q) : 1'b0;
    assign codasip_tmp_var_4 = ((!codasip_tmp_var_3) && (!codasip_tmp_var_0)) ? (s_pop_Q & (~s_push_Q)) : 1'b0;
    assign codasip_tmp_var_5 = (!codasip_tmp_var_0) ? (r_empty_Q & s_push_Q) : 1'b0;
    assign codasip_tmp_var_6 = ((!codasip_tmp_var_5) && (!codasip_tmp_var_0)) ? (s_pop_Q & (~s_push_Q)) : 1'b0;
    assign codasip_tmp_var_7 = (((!codasip_tmp_var_6) && (!codasip_tmp_var_5)) && (!codasip_tmp_var_0)) ? ((~s_pop_Q) & s_push_Q) : 1'b0;
    assign codasip_tmp_var_8 = (!codasip_tmp_var_0) ? (r_full_Q & s_pop_Q) : 1'b0;
    assign codasip_tmp_var_9 = ((!codasip_tmp_var_8) && (!codasip_tmp_var_0)) ? (s_pop_Q & (~s_push_Q)) : 1'b0;
    assign codasip_tmp_var_10 = (((!codasip_tmp_var_9) && (!codasip_tmp_var_8)) && (!codasip_tmp_var_0)) ? ((~s_pop_Q) & s_push_Q) : 1'b0;
    assign codasip_tmp_var_11 = s_push_Q;
    assign codasip_tmp_var_12 = (s_pop_Q | s_clear_i_Q);
    assign codasip_tmp_var_13 = (s_push_Q | s_clear_i_Q);
    assign r_aempty_D = codasip_tmp_var_0 ? 1'b0 :
        codasip_tmp_var_5 ? 1'b1 :
        codasip_tmp_var_6 ? s_aempty_next_Q :
        codasip_tmp_var_7 ? 1'b0 : 1'b0;
    assign r_aempty_WE = (((codasip_tmp_var_0 || codasip_tmp_var_5) || codasip_tmp_var_6) || codasip_tmp_var_7) ? 1'b1 : 1'b0;
    assign r_afull_D = codasip_tmp_var_0 ? 1'b0 :
        codasip_tmp_var_8 ? 1'b1 :
        codasip_tmp_var_9 ? 1'b0 :
        codasip_tmp_var_10 ? s_afull_next_Q : 1'b0;
    assign r_afull_WE = (((codasip_tmp_var_0 || codasip_tmp_var_8) || codasip_tmp_var_9) || codasip_tmp_var_10) ? 1'b1 : 1'b0;
    assign r_empty_D = (codasip_tmp_var_0 || codasip_tmp_var_1) ? 1'b1 :
        codasip_tmp_var_2 ? 1'b0 : 1'b0;
    assign r_empty_WE = ((codasip_tmp_var_0 || codasip_tmp_var_1) || codasip_tmp_var_2) ? 1'b1 : 1'b0;
    assign r_full_D = codasip_tmp_var_0 ? 1'b0 :
        codasip_tmp_var_3 ? 1'b1 :
        codasip_tmp_var_4 ? 1'b0 : 1'b0;
    assign r_full_WE = ((codasip_tmp_var_0 || codasip_tmp_var_3) || codasip_tmp_var_4) ? 1'b1 : 1'b0;
    assign r_read_ptr_D = ((s_clear_i_Q) ? 2'h0 : s_read_ptr_inc_Q);
    assign r_read_ptr_WE = codasip_tmp_var_12 ? 1'b1 : 1'b0;
    assign r_write_ptr_D = ((s_clear_i_Q) ? 2'h0 : s_write_ptr_inc_Q);
    assign r_write_ptr_WE = codasip_tmp_var_13 ? 1'b1 : 1'b0;
    assign rf_fifo_w_D = s_d_i_Q;
    assign rf_fifo_w_WA = r_write_ptr_Q;
    assign rf_fifo_w_WE = codasip_tmp_var_11 ? 1'b1 : 1'b0;
    assign s_aempty_next_D = (s_read_ptr_inc2_Q == r_write_ptr_Q);
    assign s_afull_next_D = (s_write_ptr_inc2_Q == r_read_ptr_Q);
    assign s_pop_D = ((~r_empty_Q) & (s_re_i_Q & (~s_clear_i_Q)));
    assign s_push_D = ((~r_full_Q) & (s_we_i_Q & (~s_clear_i_Q)));
    assign s_read_ptr_inc2_D = (r_read_ptr_Q + 2'h2);
    assign s_read_ptr_inc_D = (r_read_ptr_Q + 2'h1);
    assign s_write_ptr_inc2_D = (r_write_ptr_Q + 2'h2);
    assign s_write_ptr_inc_D = (r_write_ptr_Q + 2'h1);
endmodule: codix_berkelium_ca_core_fetch_stage_ifb_fifo_update_t
