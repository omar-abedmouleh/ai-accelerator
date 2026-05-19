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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_ifu_compute_fin_t' functional unit.
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

module codix_berkelium_ca_core_fetch_stage_ifu_compute_fin_t(
    input  logic [1:0] r_addr_valid_Q,
    input  logic [31:0] r_data_addr_Q,
    input  logic [31:0] r_data_Q,
    input  logic r_fault_pma_Q,
    input  logic r_fault_pmp_Q,
    input  logic r_fin_state_Q,
    input  logic r_hresp_Q,
    input  logic s_ack_i_Q,
    input  logic s_bus_busy_Q,
    input  logic s_exc_valid_o_Q,
    input  logic [31:0] s_fetch_hrdata_raw_Q,
    input  logic s_fetch_hready_Q,
    input  logic s_fetch_hresp_Q,
    input  logic s_fin_busy_Q,
    input  logic s_fin_full_Q,
    input  logic s_flush_i_Q,
    output logic [31:0] r_data_D,
    output logic r_data_WE,
    output logic r_fin_state_D,
    output logic r_fin_state_WE,
    output logic r_hresp_D,
    output logic r_hresp_WE,
    output logic [31:0] s_data_addr_o_D,
    output logic [31:0] s_data_o_D,
    output logic [1:0] s_data_valid_o_D,
    output logic [4:0] s_exc_type_o_D,
    output logic s_exc_valid_o_D,
    output logic s_fin_busy_D,
    output logic s_fin_full_D,
    output logic s_request_hready_D
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
    logic codasip_tmp_var_4;
    // signal/wire
    logic codasip_tmp_var_5;
    // signal/wire
    logic hold_data_B0;
    // signal/wire
    logic [31:0] hrdata_B0;
    // signal/wire
    logic [31:0] hrdata_raw_B0;
    // signal/wire
    logic hready_B0;
    // signal/wire
    logic hresp_B0;
    // signal/wire
    logic [31:0] s_data_o_D_ACT_wire;
    // signal/wire
    logic [1:0] s_data_valid_o_D_ACT_wire;
    // signal/wire
    logic [4:0] s_exc_type_o_D_ACT_wire;
    // signal/wire
    logic s_exc_valid_o_D_ACT_wire;
    // signal/wire
    logic [1:0] valid_bits_B0;

    // data-path code:
    assign hready_B0 = s_fetch_hready_Q;
    assign hresp_B0 = s_fetch_hresp_Q;
    assign hrdata_raw_B0 = s_fetch_hrdata_raw_Q;
    assign hrdata_B0 = hrdata_raw_B0;
    assign hold_data_B0 = ((~s_ack_i_Q) & (~s_flush_i_Q));
    assign valid_bits_B0 = ((((!s_fin_busy_Q) && (!s_flush_i_Q))) ? r_addr_valid_Q : 2'h0);
    assign codasip_tmp_var_0 = r_fault_pma_Q;
    assign codasip_tmp_var_1 = (!codasip_tmp_var_0) ? r_fault_pmp_Q : 1'b0;
    assign codasip_tmp_var_2 = ((!codasip_tmp_var_1) && (!codasip_tmp_var_0)) ? ((((r_fin_state_Q == 1'b0) & hresp_B0) & hready_B0) | r_hresp_Q) : 1'b0;
    assign s_exc_type_o_D_ACT_wire = codasip_tmp_var_0 ? 5'h1b :
        codasip_tmp_var_1 ? 5'h1c :
        codasip_tmp_var_2 ? 5'h01 : 5'h00;
    assign codasip_tmp_var_3 = r_fin_state_Q;
    assign codasip_tmp_var_4 = (codasip_tmp_var_3 == 1'b0) ? ((valid_bits_B0 != 2'h0) && hold_data_B0) : 1'b0;
    always_comb begin
        unique case ( codasip_tmp_var_3 )
            1'b0: s_data_o_D_ACT_wire = ((s_exc_valid_o_Q) ? 32'h00000000 : hrdata_B0);
            1'b1: s_data_o_D_ACT_wire = ((s_exc_valid_o_Q) ? 32'h00000000 : r_data_Q);
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: s_data_o_D_ACT_wire = 32'hx;
            // pragma translate_on
        endcase
    end
    always_comb begin
        unique case ( codasip_tmp_var_3 )
            1'b0: s_data_valid_o_D_ACT_wire = ((hold_data_B0) ? 2'h0 : valid_bits_B0);
            1'b1: s_data_valid_o_D_ACT_wire = ((hold_data_B0) ? 2'h0 : r_addr_valid_Q);
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: s_data_valid_o_D_ACT_wire = 2'bxx;
            // pragma translate_on
        endcase
    end
    assign codasip_tmp_var_5 = (codasip_tmp_var_3 == 1'b1) ? (!hold_data_B0) : 1'b0;
    assign s_exc_valid_o_D_ACT_wire = ((codasip_tmp_var_0 || codasip_tmp_var_1) || codasip_tmp_var_2) ? 1'b1 : 1'b0;
    assign r_data_D = hrdata_B0;
    assign r_data_WE = codasip_tmp_var_4 ? 1'b1 : 1'b0;
    assign r_fin_state_D = codasip_tmp_var_4 ? 1'b1 :
        codasip_tmp_var_5 ? 1'b0 : 1'b0;
    assign r_fin_state_WE = (codasip_tmp_var_4 || codasip_tmp_var_5) ? 1'b1 : 1'b0;
    assign r_hresp_D = codasip_tmp_var_4 ? (hresp_B0 & hready_B0) :
        codasip_tmp_var_5 ? 1'b0 : 1'b0;
    assign r_hresp_WE = (codasip_tmp_var_4 || codasip_tmp_var_5) ? 1'b1 : 1'b0;
    assign s_data_addr_o_D = r_data_addr_Q;
    assign s_data_o_D = s_data_o_D_ACT_wire;
    assign s_data_valid_o_D = s_data_valid_o_D_ACT_wire;
    assign s_exc_type_o_D = s_exc_type_o_D_ACT_wire;
    assign s_exc_valid_o_D = s_exc_valid_o_D_ACT_wire;
    assign s_fin_busy_D = (s_bus_busy_Q | s_fin_full_Q);
    assign s_fin_full_D = (r_fin_state_Q == 1'b1);
    assign s_request_hready_D = hready_B0;
endmodule: codix_berkelium_ca_core_fetch_stage_ifu_compute_fin_t
