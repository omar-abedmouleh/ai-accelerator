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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_fused_clk_fused_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_fpu_fused_clk_fused_t(
    input  logic r_addsub_fin_Q,
    input  logic r_postnorm_addsub_fin_Q,
    input  logic r_postnorm_mul1_fin_Q,
    input  logic r_postnorm_mul2_fin_Q,
    input  logic r_prenorm_addsub_fin_Q,
    input  logic r_rounding_fin_Q,
    input  logic r_wait_mul_fin_Q,
    input  logic s_clk_en_i_Q,
    input  logic s_start_i_Q,
    output logic s_fused_ce_D
);
    // data-path code:
    assign s_fused_ce_D = ((((((((r_wait_mul_fin_Q | r_postnorm_mul1_fin_Q) | r_postnorm_mul2_fin_Q) | r_prenorm_addsub_fin_Q) | r_addsub_fin_Q) | r_postnorm_addsub_fin_Q) | r_rounding_fin_Q) | s_start_i_Q) | s_clk_en_i_Q);
endmodule: codix_berkelium_ca_core_execute_stage_fpu_fused_clk_fused_t
