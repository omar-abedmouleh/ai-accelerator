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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_lsu_compute_fin_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_lsu_compute_fin_t(
    input  logic [31:0] i1_if_cpu_ldst_HRDATA,
    input  logic i1_if_cpu_ldst_HREADY,
    input  logic i1_if_cpu_ldst_HRESP,
    input  logic [31:0] r_data_addr_Q,
    input  logic r_hresp_Q,
    input  logic r_is_load_Q,
    input  logic r_is_store_Q,
    input  logic r_mc_exc_valid_Q,
    input  logic r_mc_pma_fault_Q,
    input  logic [7:0] r_op_Q,
    input  logic [5:0] r_rd_addr_Q,
    input  logic [3:0] r_state_Q,
    input  logic r_valid_Q,
    input  logic r_waited_transfer_Q,
    input  logic [31:0] r_wdata_Q,
    input  logic s_fence_issued_Q,
    input  logic s_fin_busy_Q,
    input  logic s_multicycle_Q,
    input  logic s_syscall_halt_Q,
    output logic halt_ACT,
    output logic [31:0] i1_if_cpu_ldst_HWDATA,
    output logic r_hresp_D,
    output logic r_hresp_WE,
    output logic s_fence_issued_D,
    output logic s_fin_busy_D,
    output logic s_fin_busy_o_D,
    output logic [1:0] s_fin_exc_extra_o_D,
    output logic [31:0] s_fin_exc_tval_o_D,
    output logic [4:0] s_fin_exc_type_o_D,
    output logic s_fin_exc_valid_o_D,
    output logic [7:0] s_fin_op_o_D,
    output logic [5:0] s_fin_rd_addr_o_D,
    output logic [31:0] s_fin_rd_data_o_D,
    output logic s_fin_rd_valid_o_D,
    output logic s_fin_rd_we_o_D,
    output logic s_multicycle_D,
    output logic s_request_hready_D,
    output logic s_syscall_done_D,
    output logic s_syscall_halt_D,
    output logic s_waited_transfer_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic [31:0] codasip_tmp_var_0;
    // signal/wire
    logic [1:0] codasip_tmp_var_1;
    // signal/wire
    logic [7:0] codasip_tmp_var_2;
    // signal/wire
    logic codasip_tmp_var_3;
    // signal/wire
    logic codasip_tmp_var_4;
    // signal/wire
    logic codasip_tmp_var_5;
    // signal/wire
    logic [31:0] hrdata_B0;
    // signal/wire
    logic [31:0] hrdata_raw_B0;
    // signal/wire
    logic hready_B0;
    // signal/wire
    logic hresp_B0;
    // signal/wire
    logic [31:0] read_data_B0;

    // data-path code:
    assign hready_B0 = i1_if_cpu_ldst_HREADY;
    assign hresp_B0 = i1_if_cpu_ldst_HRESP;
    assign hrdata_raw_B0 = i1_if_cpu_ldst_HRDATA;
    assign codasip_tmp_var_1 = 2'(r_data_addr_Q);
    always_comb begin
        unique case ( codasip_tmp_var_1 )
            2'h0: codasip_tmp_var_0 = hrdata_raw_B0;
            2'h1: codasip_tmp_var_0 = {8'h00, hrdata_raw_B0[31:8]};
            2'h2: codasip_tmp_var_0 = {16'h0000, hrdata_raw_B0[31:16]};
            2'h3: codasip_tmp_var_0 = {24'h000000, hrdata_raw_B0[31:24]};
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: codasip_tmp_var_0 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign hrdata_B0 = codasip_tmp_var_0;
    assign codasip_tmp_var_2 = r_op_Q;
    always_comb begin
        case ( codasip_tmp_var_2 )
            8'h10: read_data_B0 = unsigned'(32'(signed'(8'(hrdata_B0))));
            8'h11: read_data_B0 = unsigned'(32'(signed'(16'(hrdata_B0))));
            8'h12: read_data_B0 = unsigned'(signed'(hrdata_B0));
            8'h13: read_data_B0 = 32'(8'(hrdata_B0));
            8'h14: read_data_B0 = 32'(16'(hrdata_B0));
            8'h19: read_data_B0 = unsigned'(signed'(hrdata_B0));
            default: read_data_B0 = 32'h00000000;
        endcase
    end
    assign codasip_tmp_var_3 = ((r_state_Q == 4'h4) & hready_B0);
    assign codasip_tmp_var_4 = codasip_tmp_var_3 ? s_syscall_halt_Q : 1'b0;
    assign codasip_tmp_var_5 = codasip_tmp_var_4 ? (~hresp_B0) : 1'b0;
    assign halt_ACT = codasip_tmp_var_5 ? 1'b1 : 1'b0;
    assign i1_if_cpu_ldst_HWDATA = r_wdata_Q;
    assign r_hresp_D = ((hresp_B0 & (r_is_store_Q | r_is_load_Q)) & (~hready_B0));
    assign r_hresp_WE = 1'b1;
    assign s_fence_issued_D = ((r_op_Q == 8'h1c) | (r_op_Q == 8'h1d));
    assign s_fin_busy_D = (!hready_B0);
    assign s_fin_busy_o_D = (s_fin_busy_Q | (s_multicycle_Q & (~r_hresp_Q)));
    assign s_fin_exc_extra_o_D = ((r_hresp_Q) ? 2'h1 : ((r_mc_pma_fault_Q) ? 2'h2 : 2'h3));
    assign s_fin_exc_tval_o_D = r_data_addr_Q;
    assign s_fin_exc_type_o_D = (((r_is_store_Q | s_fence_issued_Q)) ? 5'h07 : 5'h05);
    assign s_fin_exc_valid_o_D = (r_hresp_Q | r_mc_exc_valid_Q);
    assign s_fin_op_o_D = r_op_Q;
    assign s_fin_rd_addr_o_D = r_rd_addr_Q;
    assign s_fin_rd_data_o_D = read_data_B0;
    assign s_fin_rd_valid_o_D = ((r_valid_Q & (~s_fin_busy_Q)) & (~r_hresp_Q));
    assign s_fin_rd_we_o_D = (r_is_load_Q && (r_rd_addr_Q != 6'h00));
    assign s_multicycle_D = (r_state_Q != 4'h0);
    assign s_request_hready_D = hready_B0;
    assign s_syscall_done_D = ((!codasip_tmp_var_4) && codasip_tmp_var_3) ? 1'b1 : 1'b0;
    assign s_syscall_halt_D = (r_wdata_Q == 32'h00000001);
    assign s_waited_transfer_o_D = (r_waited_transfer_Q & (~r_hresp_Q));
endmodule: codix_berkelium_ca_core_execute_stage_lsu_compute_fin_t
