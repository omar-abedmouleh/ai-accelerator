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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_classify_compute_classify_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_fpu_classify_compute_classify_t(
    input  logic s_done_o_Q,
    input  logic [3:0] s_properties_i_Q,
    input  logic [31:0] s_result_o_Q,
    input  logic [4:0] s_ROB_ptr_i_Q,
    input  logic [9:0] s_srcA_i_Q,
    input  logic s_start_i_Q,
    output logic s_done_o_D,
    output logic [31:0] s_result_o_D,
    output logic [4:0] s_ROB_ptr_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic denom_A_B0;
    // signal/wire
    logic inf_A_B0;
    // signal/wire
    logic nan_A_B0;
    // signal/wire
    logic normal_num_B0;
    // signal/wire
    logic quiet_bit_B0;
    // signal/wire
    logic sign_B0;
    // signal/wire
    logic zero_A_B0;

    // data-path code:
    assign denom_A_B0 = s_properties_i_Q[3];
    assign zero_A_B0 = s_properties_i_Q[2];
    assign nan_A_B0 = s_properties_i_Q[1];
    assign inf_A_B0 = s_properties_i_Q[0];
    assign sign_B0 = s_srcA_i_Q[9];
    assign quiet_bit_B0 = s_srcA_i_Q[0];
    assign normal_num_B0 = ((((!inf_A_B0) && (!denom_A_B0)) && (!nan_A_B0)) && (!zero_A_B0));
    assign s_done_o_D = s_start_i_Q;
    assign s_result_o_D = 32'(unsigned'(10'({(nan_A_B0 && quiet_bit_B0), (nan_A_B0 && (!quiet_bit_B0)), ((!sign_B0) && inf_A_B0), ((!sign_B0) && normal_num_B0), ((!sign_B0) && denom_A_B0), ((!sign_B0) && zero_A_B0), (sign_B0 && zero_A_B0), (sign_B0 && denom_A_B0), (sign_B0 && normal_num_B0), (sign_B0 && inf_A_B0)})));
    assign s_ROB_ptr_o_D = s_ROB_ptr_i_Q;
    // code snippets:
`ifdef CODASIP_RTL_ASSERTIONS
    // Specify default clock signal for all assertions.
    // The clock may run even when the unit has gated clock signal.
    default clocking @(posedge `CODASIP_RTL_ASSERTIONS_CLOCK); endclocking

`ifdef CODASIP_RTL_ASSERTIONS_RESET
    // Disable all the assertions in case reset is asserted.
    default disable iff ((`CODASIP_RTL_ASSERTIONS_RESET == 1'b0));
`endif

    classify_res_onehot_on_10bits: assert property (
        (((!s_done_o_Q) || ((s_result_o_Q[31:10] == 22'h000000) && $onehot(s_result_o_Q[9:0]))))
    )
    else $fatal(32'sd2, "classify_res_onehot_on_10bits: Classify's result should be onehot on the 10 LSBs and 0 elsewhere, value is %X ", s_result_o_Q);

`endif  // CODASIP_RTL_ASSERTIONS

endmodule: codix_berkelium_ca_core_execute_stage_fpu_classify_compute_classify_t
