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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_ifu_compute_req_t' functional unit.
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

module codix_berkelium_ca_core_fetch_stage_ifu_compute_req_t(
    input  logic pma_fetch_s_cacheable_o_Q,
    input  logic pma_fetch_s_fault_o_Q,
    input  logic pma_fetch_s_idempotent_o_Q,
    input  logic pmp_fetch_s_fault_o_Q,
    input  logic [1:0] r_prv_Q,
    input  logic [31:0] r_waited_addr_Q,
    input  logic [1:0] r_waited_addr_valid_Q,
    input  logic [3:0] r_waited_hprot_Q,
    input  logic r_waited_transfer_Q,
    input  logic s_ack_i_Q,
    input  logic [31:0] s_addr_i_Q,
    input  logic [1:0] s_addr_valid_i_Q,
    input  logic s_bus_busy_Q,
    input  logic s_fin_busy_Q,
    input  logic s_fin_full_Q,
    input  logic s_flush_i_Q,
    input  logic s_ocd_progbuf_mode_i_Q,
    input  logic s_request_hready_Q,
    output logic [31:0] i1_if_cpu_fetch_HADDR,
    output logic [2:0] i1_if_cpu_fetch_HBURST,
    output logic i1_if_cpu_fetch_HMASTLOCK,
    output logic [3:0] i1_if_cpu_fetch_HPROT,
    output logic [2:0] i1_if_cpu_fetch_HSIZE,
    output logic [1:0] i1_if_cpu_fetch_HTRANS,
    output logic i1_if_cpu_fetch_HWRITE,
    output logic pl_ifu_FIN_CLEAR_D,
    output logic pl_ifu_FIN_STALL_D,
    output logic [31:0] pma_fetch_s_addr_i_D,
    output logic [31:0] pmp_fetch_s_addr_i_D,
    output logic [1:0] pmp_fetch_s_prv_i_D,
    output logic [1:0] r_addr_valid_D,
    output logic r_addr_valid_WE,
    output logic [31:0] r_data_addr_D,
    output logic r_data_addr_WE,
    output logic r_fault_pma_D,
    output logic r_fault_pma_WE,
    output logic r_fault_pmp_D,
    output logic r_fault_pmp_WE,
    output logic [31:0] r_waited_addr_D,
    output logic [1:0] r_waited_addr_valid_D,
    output logic r_waited_addr_valid_WE,
    output logic r_waited_addr_WE,
    output logic [3:0] r_waited_hprot_D,
    output logic r_waited_hprot_WE,
    output logic r_waited_transfer_D,
    output logic r_waited_transfer_WE,
    output logic s_ifu_busy_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic [31:0] STATEMENT_BIT_CONCATENATE_270_STATEMENT_AST_29_wire;
    // signal/wire
    logic [31:0] addr_B0;
    // signal/wire
    logic [1:0] addr_valid_cleared_B0;
    // signal/wire
    logic [1:0] addr_valid_wait_B0;
    // signal/wire
    logic codasip_tmp_var_0;
    // signal/wire
    logic codasip_tmp_var_1;
    // signal/wire
    logic codasip_tmp_var_2;
    // signal/wire
    logic codasip_tmp_var_3;
    // signal/wire
    logic [3:0] hprot_B0;
    // signal/wire
    logic [1:0] htrans_B0;
    // signal/wire
    logic htrans_req_B0;
    // signal/wire
    logic pma_cacheable_B0;
    // signal/wire
    logic pma_fault_B0;
    // signal/wire
    logic pma_idempotent_B0;
    // signal/wire
    logic pmp_fault_B0;
    // signal/wire
    logic req_busy_B0;
    // signal/wire
    logic req_valid_B0;
    // signal/wire
    logic request_made_B0;
    // signal/wire
    logic request_wait_B0;

    // data-path code:
    assign addr_B0 = ((r_waited_transfer_Q) ? r_waited_addr_Q : s_addr_i_Q);
    assign addr_valid_wait_B0 = ((r_waited_transfer_Q) ? r_waited_addr_valid_Q : s_addr_valid_i_Q);
    assign req_valid_B0 = ((~r_waited_transfer_Q) & (s_addr_valid_i_Q != 2'h0));
    assign pma_cacheable_B0 = pma_fetch_s_cacheable_o_Q;
    assign pma_idempotent_B0 = pma_fetch_s_idempotent_o_Q;
    assign pmp_fault_B0 = ((pmp_fetch_s_fault_o_Q & req_valid_B0) & (~s_ocd_progbuf_mode_i_Q));
    assign pma_fault_B0 = (pma_fetch_s_fault_o_Q & req_valid_B0);
    assign req_busy_B0 = 1'b0;
    assign htrans_req_B0 = (r_waited_transfer_Q | ((((~pmp_fault_B0) & (~pma_fault_B0)) & req_valid_B0) & (~s_fin_full_Q)));
    assign htrans_B0 = ((htrans_req_B0) ? 2'h2 : 2'h0);
    assign hprot_B0 = ((r_waited_transfer_Q) ? r_waited_hprot_Q : {pma_cacheable_B0, pma_idempotent_B0, 2'h2});
    assign request_made_B0 = (htrans_req_B0 & s_request_hready_Q);
    assign request_wait_B0 = (htrans_req_B0 & (~s_request_hready_Q));
    assign addr_valid_cleared_B0 = ((s_flush_i_Q) ? 2'h0 : addr_valid_wait_B0);
    assign codasip_tmp_var_0 = (request_wait_B0 & (~r_waited_transfer_Q));
    assign codasip_tmp_var_1 = (!codasip_tmp_var_0) ? request_made_B0 : 1'b0;
    assign codasip_tmp_var_2 = ((s_bus_busy_Q || (!s_ack_i_Q)) && (!s_flush_i_Q));
    assign codasip_tmp_var_3 = (!codasip_tmp_var_2) ? ((((!pmp_fault_B0) && (!pma_fault_B0)) && (!htrans_req_B0)) || s_flush_i_Q) : 1'b0;
    assign STATEMENT_BIT_CONCATENATE_270_STATEMENT_AST_29_wire = {addr_B0[31:2], 2'h0};
    assign i1_if_cpu_fetch_HADDR = STATEMENT_BIT_CONCATENATE_270_STATEMENT_AST_29_wire;
    assign i1_if_cpu_fetch_HBURST = 3'h0;
    assign i1_if_cpu_fetch_HMASTLOCK = 1'b0;
    assign i1_if_cpu_fetch_HPROT = hprot_B0;
    assign i1_if_cpu_fetch_HSIZE = 3'h2;
    assign i1_if_cpu_fetch_HTRANS = htrans_B0;
    assign i1_if_cpu_fetch_HWRITE = 1'b0;
    assign pl_ifu_FIN_CLEAR_D = codasip_tmp_var_3 ? 1'b1 : 1'b0;
    assign pl_ifu_FIN_STALL_D = codasip_tmp_var_2 ? 1'b1 : 1'b0;
    assign pma_fetch_s_addr_i_D = addr_B0;
    assign pmp_fetch_s_addr_i_D = (addr_B0 >> 32'sh00000002);
    assign pmp_fetch_s_prv_i_D = r_prv_Q;
    assign r_addr_valid_D = addr_valid_cleared_B0;
    assign r_addr_valid_WE = 1'b1;
    assign r_data_addr_D = addr_B0;
    assign r_data_addr_WE = 1'b1;
    assign r_fault_pma_D = pma_fault_B0;
    assign r_fault_pma_WE = 1'b1;
    assign r_fault_pmp_D = pmp_fault_B0;
    assign r_fault_pmp_WE = 1'b1;
    assign r_waited_addr_D = s_addr_i_Q;
    assign r_waited_addr_valid_D = (codasip_tmp_var_0 || ((!codasip_tmp_var_1) && (!codasip_tmp_var_0))) ? addr_valid_cleared_B0 : 2'h0;
    assign r_waited_addr_valid_WE = (codasip_tmp_var_0 || ((!codasip_tmp_var_1) && (!codasip_tmp_var_0))) ? 1'b1 : 1'b0;
    assign r_waited_addr_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_waited_hprot_D = hprot_B0;
    assign r_waited_hprot_WE = codasip_tmp_var_0 ? 1'b1 : 1'b0;
    assign r_waited_transfer_D = codasip_tmp_var_0 ? 1'b1 :
        codasip_tmp_var_1 ? 1'b0 : 1'b0;
    assign r_waited_transfer_WE = (codasip_tmp_var_0 || codasip_tmp_var_1) ? 1'b1 : 1'b0;
    assign s_ifu_busy_o_D = ((~s_flush_i_Q) & (((((r_waited_transfer_Q & (r_waited_addr_valid_Q == 2'h0)) | (r_waited_transfer_Q & (~s_request_hready_Q))) | req_busy_B0) | s_fin_busy_Q) | (~s_request_hready_Q)));
endmodule: codix_berkelium_ca_core_fetch_stage_ifu_compute_req_t
