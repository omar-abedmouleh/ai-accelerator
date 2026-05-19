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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_lsu_compute_req_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_lsu_compute_req_t(
    input  logic r_hresp_Q,
    input  logic [5:0] r_rd_addr_Q,
    input  logic [3:0] r_state_Q,
    input  logic r_waited_transfer_Q,
    input  logic s_clear_i_Q,
    input  logic s_exc_pma_Q,
    input  logic s_exc_valid_Q,
    input  logic s_fin_busy_Q,
    input  logic s_is_fence_i_Q,
    input  logic s_is_fence_Q,
    input  logic s_multicycle_Q,
    input  logic [3:0] s_new_state_Q,
    input  logic s_pma_cacheable_Q,
    input  logic s_pma_idempotent_Q,
    input  logic [5:0] s_rd_addr_i_Q,
    input  logic [31:0] s_req_addr_Q,
    input  logic s_req_do_load_Q,
    input  logic [7:0] s_req_op_Q,
    input  logic [31:0] s_req_wdata_Q,
    input  logic s_request_hready_Q,
    output logic [31:0] i1_if_cpu_ldst_HADDR,
    output logic [2:0] i1_if_cpu_ldst_HBURST,
    output logic i1_if_cpu_ldst_HMASTLOCK,
    output logic [3:0] i1_if_cpu_ldst_HPROT,
    output logic [2:0] i1_if_cpu_ldst_HSIZE,
    output logic [1:0] i1_if_cpu_ldst_HTRANS,
    output logic i1_if_cpu_ldst_HWRITE,
    output logic pl_lsu_FIN_CLEAR_D,
    output logic pl_lsu_FIN_STALL_D,
    output logic [31:0] r_data_addr_D,
    output logic r_data_addr_WE,
    output logic r_is_load_D,
    output logic r_is_load_WE,
    output logic r_is_store_D,
    output logic r_is_store_WE,
    output logic r_mc_exc_valid_D,
    output logic r_mc_exc_valid_WE,
    output logic r_mc_pma_fault_D,
    output logic r_mc_pma_fault_WE,
    output logic [5:0] r_rd_addr_D,
    output logic r_rd_addr_WE,
    output logic [3:0] r_state_D,
    output logic r_state_WE,
    output logic r_valid_D,
    output logic r_valid_WE,
    output logic r_waited_transfer_D,
    output logic r_waited_transfer_WE,
    output logic [31:0] r_wdata_D,
    output logic r_wdata_WE
);
    // type, wire and constant declarations:
    // signal/wire
    logic [31:0] addr_B0;
    // signal/wire
    logic cacheable_B0;
    // signal/wire
    logic clear_fin_B0;
    // signal/wire
    logic [31:0] codasip_tmp_var_0;
    // signal/wire
    logic [7:0] codasip_tmp_var_1;
    // signal/wire
    logic [1:0] codasip_tmp_var_2;
    // signal/wire
    logic codasip_tmp_var_3;
    // signal/wire
    logic codasip_tmp_var_4;
    // signal/wire
    logic do_load_B0;
    // signal/wire
    logic hmastlock_B0;
    // signal/wire
    logic [3:0] hprot_B0;
    // signal/wire
    logic [1:0] hsize_B0;
    // signal/wire
    logic [1:0] htrans_B0;
    // signal/wire
    logic htrans_req_B0;
    // signal/wire
    logic hwrite_B0;
    // signal/wire
    logic idempotent_B0;
    // CodAL signal/wire
    logic [7:0] op;
    // signal/wire
    logic req_valid_B0;
    // signal/wire
    logic terminate_B0;
    // signal/wire
    logic [31:0] wdata_B0;
    // signal/wire
    logic [31:0] write_data_B0;

    // data-path code:
    assign addr_B0 = s_req_addr_Q;
    assign wdata_B0 = s_req_wdata_Q;
    assign op = s_req_op_Q;
    assign do_load_B0 = s_req_do_load_Q;
    assign codasip_tmp_var_1 = op;
    always_comb begin
        case ( codasip_tmp_var_1 )
            8'h10: hsize_B0 = 2'h0;
            8'h11: hsize_B0 = 2'h1;
            8'h12: hsize_B0 = 2'h2;
            8'h13: hsize_B0 = 2'h0;
            8'h14: hsize_B0 = 2'h1;
            8'h15: hsize_B0 = 2'h0;
            8'h16: hsize_B0 = 2'h1;
            8'h17: hsize_B0 = 2'h2;
            8'h19: hsize_B0 = 2'h2;
            8'h1b: hsize_B0 = 2'h2;
            default: hsize_B0 = 2'h0;
        endcase
    end
    always_comb begin
        case ( codasip_tmp_var_1 )
            8'h10: hwrite_B0 = 1'b0;
            8'h11: hwrite_B0 = 1'b0;
            8'h12: hwrite_B0 = 1'b0;
            8'h13: hwrite_B0 = 1'b0;
            8'h14: hwrite_B0 = 1'b0;
            8'h15: hwrite_B0 = 1'b1;
            8'h16: hwrite_B0 = 1'b1;
            8'h17: hwrite_B0 = 1'b1;
            8'h19: hwrite_B0 = 1'b0;
            8'h1b: hwrite_B0 = 1'b1;
            default: hwrite_B0 = 1'b0;
        endcase
    end
    always_comb begin
        case ( codasip_tmp_var_1 )
            8'h10: req_valid_B0 = 1'b1;
            8'h11: req_valid_B0 = 1'b1;
            8'h12: req_valid_B0 = 1'b1;
            8'h13: req_valid_B0 = 1'b1;
            8'h14: req_valid_B0 = 1'b1;
            8'h15: req_valid_B0 = 1'b1;
            8'h16: req_valid_B0 = 1'b1;
            8'h17: req_valid_B0 = 1'b1;
            8'h19: req_valid_B0 = 1'b1;
            8'h1b: req_valid_B0 = 1'b1;
            default: req_valid_B0 = 1'b0;
        endcase
    end
    assign terminate_B0 = ((s_exc_valid_Q | r_hresp_Q) | ((s_clear_i_Q & (~r_waited_transfer_Q)) & (~s_multicycle_Q)));
    assign htrans_req_B0 = (req_valid_B0 & (~terminate_B0));
    assign htrans_B0 = ((htrans_req_B0) ? 2'h2 : 2'h0);
    assign hmastlock_B0 = 1'b0;
    assign cacheable_B0 = s_pma_cacheable_Q;
    assign idempotent_B0 = s_pma_idempotent_Q;
    assign hprot_B0 = {cacheable_B0, idempotent_B0, 2'h3};
    assign codasip_tmp_var_2 = 2'(addr_B0);
    always_comb begin
        unique case ( codasip_tmp_var_2 )
            2'h0: codasip_tmp_var_0 = wdata_B0;
            2'h1: codasip_tmp_var_0 = {wdata_B0[23:0], 8'h00};
            2'h2: codasip_tmp_var_0 = {wdata_B0[15:0], 16'h0000};
            2'h3: codasip_tmp_var_0 = {wdata_B0[7:0], 24'h000000};
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: codasip_tmp_var_0 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign write_data_B0 = codasip_tmp_var_0;
    assign clear_fin_B0 = (((r_state_Q == 4'h0) & (terminate_B0 | (((~req_valid_B0) & (~s_is_fence_Q)) & (~s_is_fence_i_Q)))) | (s_multicycle_Q & r_hresp_Q));
    assign codasip_tmp_var_3 = s_fin_busy_Q;
    assign codasip_tmp_var_4 = (!codasip_tmp_var_3) ? clear_fin_B0 : 1'b0;
    assign i1_if_cpu_ldst_HADDR = addr_B0;
    assign i1_if_cpu_ldst_HBURST = 3'h0;
    assign i1_if_cpu_ldst_HMASTLOCK = hmastlock_B0;
    assign i1_if_cpu_ldst_HPROT = hprot_B0;
    assign i1_if_cpu_ldst_HSIZE = 3'(hsize_B0);
    assign i1_if_cpu_ldst_HTRANS = htrans_B0;
    assign i1_if_cpu_ldst_HWRITE = hwrite_B0;
    assign pl_lsu_FIN_CLEAR_D = codasip_tmp_var_4 ? 1'b1 : 1'b0;
    assign pl_lsu_FIN_STALL_D = codasip_tmp_var_3 ? 1'b1 : 1'b0;
    assign r_data_addr_D = addr_B0;
    assign r_data_addr_WE = 1'b1;
    assign r_is_load_D = ((hwrite_B0 == 1'b0) && htrans_req_B0);
    assign r_is_load_WE = 1'b1;
    assign r_is_store_D = ((hwrite_B0 == 1'b1) && htrans_req_B0);
    assign r_is_store_WE = 1'b1;
    assign r_mc_exc_valid_D = s_exc_valid_Q;
    assign r_mc_exc_valid_WE = 1'b1;
    assign r_mc_pma_fault_D = s_exc_pma_Q;
    assign r_mc_pma_fault_WE = 1'b1;
    assign r_rd_addr_D = (((r_state_Q == 4'h0)) ? s_rd_addr_i_Q : r_rd_addr_Q);
    assign r_rd_addr_WE = 1'b1;
    assign r_state_D = ((s_exc_valid_Q) ? 4'h0 : s_new_state_Q);
    assign r_state_WE = 1'b1;
    assign r_valid_D = do_load_B0;
    assign r_valid_WE = 1'b1;
    assign r_waited_transfer_D = (htrans_req_B0 & (~s_request_hready_Q));
    assign r_waited_transfer_WE = 1'b1;
    assign r_wdata_D = (((r_state_Q == 4'h4)) ? wdata_B0 : write_data_B0);
    assign r_wdata_WE = 1'b1;
endmodule: codix_berkelium_ca_core_execute_stage_lsu_compute_req_t
