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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_fpu_ROB_unit_sel_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_fpu_fpu_ROB_unit_sel_t(
    input  logic add_sub_s_ack_i_Q,
    input  logic float2int_s_ack_i_Q,
    input  logic int2float_s_ack_i_Q,
    input  logic r_exc_en_Q,
    input  logic s_add_sub_done_Q,
    input  logic s_classify_done_Q,
    input  logic s_cmp_done_Q,
    input  logic s_float2int_done_Q,
    input  logic s_fused_done_Q,
    input  logic s_int2float_done_Q,
    input  logic s_move_done_Q,
    input  logic s_mul_done_Q,
    input  logic s_sgnj_done_Q,
    input  logic s_sqr_div_done_Q,
    output logic s_add_sub_rob_stall_D,
    output logic s_float2int_rob_stall_D,
    output logic [3:0] s_fpu_wb_port_w1_D,
    output logic [3:0] s_fpu_wb_port_w2_D,
    output logic [3:0] s_fpu_wb_port_w3_D,
    output logic [3:0] s_fpu_wb_port_w4_D,
    output logic s_int2float_rob_stall_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic [4:0] combinational_units_done_vector_B0;
    // signal/wire
    logic [3:0] port_w1_B0;
    // signal/wire
    logic [3:0] port_w2_B0;
    // signal/wire
    logic [3:0] port_w3_B0;
    // signal/wire
    logic [3:0] port_w4_B0;

    // data-path code:
    assign port_w1_B0 = ((s_sqr_div_done_Q) ? 4'h3 : ((s_fused_done_Q) ? 4'h5 : ((s_mul_done_Q) ? 4'h7 : ((s_add_sub_done_Q) ? 4'h0 : ((s_float2int_done_Q) ? 4'h4 : ((s_int2float_done_Q) ? 4'h6 : ((s_cmp_done_Q) ? 4'h2 : ((s_classify_done_Q) ? 4'h1 : ((s_sgnj_done_Q) ? 4'h8 : ((s_move_done_Q) ? 4'h9 : ((r_exc_en_Q) ? 4'hd : 4'ha)))))))))));
    assign port_w2_B0 = (((r_exc_en_Q && (port_w1_B0 != 4'hd))) ? 4'hd : (((s_move_done_Q && (port_w1_B0 != 4'h9))) ? 4'h9 : (((s_sgnj_done_Q && (port_w1_B0 != 4'h8))) ? 4'h8 : (((s_classify_done_Q && (port_w1_B0 != 4'h1))) ? 4'h1 : (((s_cmp_done_Q && (port_w1_B0 != 4'h2))) ? 4'h2 : (((s_int2float_done_Q && (port_w1_B0 != 4'h6))) ? 4'h6 : (((s_float2int_done_Q && (port_w1_B0 != 4'h4))) ? 4'h4 : (((s_add_sub_done_Q && (port_w1_B0 != 4'h0))) ? 4'h0 : (((s_mul_done_Q && (port_w1_B0 != 4'h7))) ? 4'h7 : (((s_fused_done_Q && (port_w1_B0 != 4'h5))) ? 4'h5 : 4'ha))))))))));
    assign port_w3_B0 = ((((s_fused_done_Q && (port_w1_B0 != 4'h5)) && (port_w2_B0 != 4'h5))) ? 4'h5 : ((((s_mul_done_Q && (port_w1_B0 != 4'h7)) && (port_w2_B0 != 4'h7))) ? 4'h7 : ((((s_add_sub_done_Q && (port_w1_B0 != 4'h0)) && (port_w2_B0 != 4'h0))) ? 4'h0 : ((((s_float2int_done_Q && (port_w1_B0 != 4'h4)) && (port_w2_B0 != 4'h4))) ? 4'h4 : ((((s_int2float_done_Q && (port_w1_B0 != 4'h6)) && (port_w2_B0 != 4'h6))) ? 4'h6 : 4'ha)))));
    assign port_w4_B0 = (((((s_mul_done_Q && (port_w1_B0 != 4'h7)) && (port_w2_B0 != 4'h7)) && (port_w3_B0 != 4'h7))) ? 4'h7 : (((((s_int2float_done_Q && (port_w1_B0 != 4'h6)) && (port_w2_B0 != 4'h6)) && (port_w3_B0 != 4'h6))) ? 4'h6 : (((((s_float2int_done_Q && (port_w1_B0 != 4'h4)) && (port_w2_B0 != 4'h4)) && (port_w3_B0 != 4'h4))) ? 4'h4 : (((((s_add_sub_done_Q && (port_w1_B0 != 4'h0)) && (port_w2_B0 != 4'h0)) && (port_w3_B0 != 4'h0))) ? 4'h0 : 4'ha))));
    assign combinational_units_done_vector_B0 = {s_classify_done_Q, s_cmp_done_Q, s_move_done_Q, s_sgnj_done_Q, r_exc_en_Q};
    assign s_add_sub_rob_stall_D = (s_add_sub_done_Q && (!(((((port_w1_B0 == 4'h0) || (port_w2_B0 == 4'h0)) || (port_w3_B0 == 4'h0)) || (port_w4_B0 == 4'h0)) || (port_w4_B0 == 4'ha))));
    assign s_float2int_rob_stall_D = (s_float2int_done_Q && (!(((((port_w1_B0 == 4'h4) || (port_w2_B0 == 4'h4)) || (port_w3_B0 == 4'h4)) || (port_w4_B0 == 4'h4)) || (port_w4_B0 == 4'ha))));
    assign s_fpu_wb_port_w1_D = port_w1_B0;
    assign s_fpu_wb_port_w2_D = port_w2_B0;
    assign s_fpu_wb_port_w3_D = port_w3_B0;
    assign s_fpu_wb_port_w4_D = port_w4_B0;
    assign s_int2float_rob_stall_D = (s_int2float_done_Q && (!(((((port_w1_B0 == 4'h6) || (port_w2_B0 == 4'h6)) || (port_w3_B0 == 4'h6)) || (port_w4_B0 == 4'h6)) || (port_w4_B0 == 4'ha))));
    // code snippets:
`ifdef CODASIP_RTL_ASSERTIONS
    // Specify default clock signal for all assertions.
    // The clock may run even when the unit has gated clock signal.
    default clocking @(posedge `CODASIP_RTL_ASSERTIONS_CLOCK); endclocking

`ifdef CODASIP_RTL_ASSERTIONS_RESET
    // Disable all the assertions in case reset is asserted.
    default disable iff ((`CODASIP_RTL_ASSERTIONS_RESET == 1'b0));
`endif

    one_combinational_unit_done_at_most: assert property (
        ($onehot0(combinational_units_done_vector_B0))
    )
    else $fatal(32'sd2, "one_combinational_unit_done_at_most: more than one 0-cycle unit is done (including exception)");

    assert property (
        (((!s_sqr_div_done_Q) || $onehot({(port_w1_B0 == 4'h3), (port_w2_B0 == 4'h3), (port_w3_B0 == 4'h3), (port_w4_B0 == 4'h3)})))
    )
    else $fatal(32'sd2, "Unit %d does not write its result using only one port", 4'h3);

    assert property (
        (((!s_fused_done_Q) || $onehot({(port_w1_B0 == 4'h5), (port_w2_B0 == 4'h5), (port_w3_B0 == 4'h5), (port_w4_B0 == 4'h5)})))
    )
    else $fatal(32'sd2, "Unit %d does not write its result using only one port", 4'h5);

    assert property (
        (((!s_mul_done_Q) || $onehot({(port_w1_B0 == 4'h7), (port_w2_B0 == 4'h7), (port_w3_B0 == 4'h7), (port_w4_B0 == 4'h7)})))
    )
    else $fatal(32'sd2, "Unit %d does not write its result using only one port", 4'h7);

    assert property (
        (((!(s_add_sub_done_Q && add_sub_s_ack_i_Q)) || $onehot({(port_w1_B0 == 4'h0), (port_w2_B0 == 4'h0), (port_w3_B0 == 4'h0), (port_w4_B0 == 4'h0)})))
    )
    else $fatal(32'sd2, "Unit %d does not write its result using only one port", 4'h0);

    assert property (
        (((!(s_int2float_done_Q && int2float_s_ack_i_Q)) || $onehot({(port_w1_B0 == 4'h6), (port_w2_B0 == 4'h6), (port_w3_B0 == 4'h6), (port_w4_B0 == 4'h6)})))
    )
    else $fatal(32'sd2, "Unit %d does not write its result using only one port", 4'h6);

    assert property (
        (((!(s_float2int_done_Q && float2int_s_ack_i_Q)) || $onehot({(port_w1_B0 == 4'h4), (port_w2_B0 == 4'h4), (port_w3_B0 == 4'h4), (port_w4_B0 == 4'h4)})))
    )
    else $fatal(32'sd2, "Unit %d does not write its result using only one port", 4'h4);

    assert property (
        (((!s_classify_done_Q) || $onehot({(port_w1_B0 == 4'h1), (port_w2_B0 == 4'h1), (port_w3_B0 == 4'h1), (port_w4_B0 == 4'h1)})))
    )
    else $fatal(32'sd2, "Unit %d does not write its result using only one port", 4'h1);

    assert property (
        (((!s_cmp_done_Q) || $onehot({(port_w1_B0 == 4'h2), (port_w2_B0 == 4'h2), (port_w3_B0 == 4'h2), (port_w4_B0 == 4'h2)})))
    )
    else $fatal(32'sd2, "Unit %d does not write its result using only one port", 4'h2);

    assert property (
        (((!s_move_done_Q) || $onehot({(port_w1_B0 == 4'h9), (port_w2_B0 == 4'h9), (port_w3_B0 == 4'h9), (port_w4_B0 == 4'h9)})))
    )
    else $fatal(32'sd2, "Unit %d does not write its result using only one port", 4'h9);

    assert property (
        (((!s_sgnj_done_Q) || $onehot({(port_w1_B0 == 4'h8), (port_w2_B0 == 4'h8), (port_w3_B0 == 4'h8), (port_w4_B0 == 4'h8)})))
    )
    else $fatal(32'sd2, "Unit %d does not write its result using only one port", 4'h8);

    assert property (
        (((!r_exc_en_Q) || $onehot({(port_w1_B0 == 4'hd), (port_w2_B0 == 4'hd), (port_w3_B0 == 4'hd), (port_w4_B0 == 4'hd)})))
    )
    else $fatal(32'sd2, "Unit %d does not write its result using only one port", 4'hd);

`endif  // CODASIP_RTL_ASSERTIONS

endmodule: codix_berkelium_ca_core_execute_stage_fpu_fpu_ROB_unit_sel_t
