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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_lsu_compute_req_fsm_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_lsu_compute_req_fsm_t #(
    parameter [31:0] cache_base_p = 32'h00010000
) (
    input  logic [31:0] r_data_addr_Q,
    input  logic [7:0] r_op_Q,
    input  logic [3:0] r_state_Q,
    input  logic [31:0] r_wdata_Q,
    input  logic [31:0] s_addr_i_Q,
    input  logic s_exc_valid_Q,
    input  logic s_is_fence_i_Q,
    input  logic s_is_fence_Q,
    input  logic s_is_load_Q,
    input  logic s_is_store_Q,
    input  logic [7:0] s_op_i_Q,
    input  logic [31:0] s_syscall_addr_i_Q,
    input  logic s_syscall_done_Q,
    input  logic s_syscall_halt_Q,
    input  logic [31:0] s_wdata_i_Q,
    output logic [7:0] r_op_D,
    output logic r_op_WE,
    output logic [3:0] s_new_state_D,
    output logic [31:0] s_req_addr_D,
    output logic s_req_do_load_D,
    output logic [7:0] s_req_op_D,
    output logic [31:0] s_req_wdata_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic [31:0] addr_B0;
    // signal/wire
    logic [3:0] codasip_tmp_var_0;
    // signal/wire
    logic do_load_B0;
    // signal/wire
    logic do_store_B0;
    // signal/wire
    logic [7:0] op_B0;
    // signal/wire
    logic [3:0] s_new_state_D_ACT_wire;
    // signal/wire
    logic [31:0] wdata_B0;

    // data-path code:
    assign do_store_B0 = (s_is_store_Q & (~s_exc_valid_Q));
    assign do_load_B0 = (s_is_load_Q & (~s_exc_valid_Q));
    assign codasip_tmp_var_0 = r_state_Q;
    assign s_new_state_D_ACT_wire = (codasip_tmp_var_0 == 4'h0) ? ((((s_addr_i_Q == s_syscall_addr_i_Q) && do_store_B0)) ? 4'h4 : ((s_is_fence_Q) ? 4'h1 : ((s_is_fence_i_Q) ? 4'h1 : 4'h0))) :
        (codasip_tmp_var_0 == 4'h4) ? ((((~s_syscall_halt_Q) & (~s_syscall_done_Q))) ? 4'h4 : 4'h0) :
        (codasip_tmp_var_0 == 4'h1) ? (((r_op_Q == 8'h1c)) ? 4'h2 : 4'h3) :
        ((codasip_tmp_var_0 == 4'h2) || (codasip_tmp_var_0 == 4'h3)) ? 4'h0 : 4'h0;
    always_comb begin
        case ( codasip_tmp_var_0 )
            4'h0: addr_B0 = s_addr_i_Q;
            4'h1: addr_B0 = {cache_base_p[31:9], 9'h160};
            4'h2: addr_B0 = {cache_base_p[31:9], 9'h154};
            4'h3: addr_B0 = {cache_base_p[31:9], 9'h148};
            4'h4: addr_B0 = r_data_addr_Q;
            default: addr_B0 = 32'h00000000;
        endcase
    end
    always_comb begin
        case ( codasip_tmp_var_0 )
            4'h0: op_B0 = (((do_load_B0 | do_store_B0)) ? s_op_i_Q : 8'h00);
            4'h1: op_B0 = 8'h17;
            4'h2: op_B0 = 8'h17;
            4'h3: op_B0 = 8'h17;
            4'h4: op_B0 = 8'h00;
            default: op_B0 = 8'h00;
        endcase
    end
    always_comb begin
        case ( codasip_tmp_var_0 )
            4'h0: wdata_B0 = s_wdata_i_Q;
            4'h1: wdata_B0 = 32'h00000001;
            4'h2: wdata_B0 = 32'h00000001;
            4'h3: wdata_B0 = 32'h00000001;
            4'h4: wdata_B0 = r_wdata_Q;
            default: wdata_B0 = 32'h00000000;
        endcase
    end
    always_comb begin
        case ( codasip_tmp_var_0 )
            4'h0: r_op_D = s_op_i_Q;
            4'h1: r_op_D = r_op_Q;
            4'h2: r_op_D = r_op_Q;
            4'h3: r_op_D = r_op_Q;
            4'h4: r_op_D = r_op_Q;
            default: r_op_D = 8'h00;
        endcase
    end
    assign r_op_WE = 1'b1;
    assign s_new_state_D = s_new_state_D_ACT_wire;
    assign s_req_addr_D = addr_B0;
    assign s_req_do_load_D = do_load_B0;
    assign s_req_op_D = op_B0;
    assign s_req_wdata_D = wdata_B0;
endmodule: codix_berkelium_ca_core_execute_stage_lsu_compute_req_fsm_t
