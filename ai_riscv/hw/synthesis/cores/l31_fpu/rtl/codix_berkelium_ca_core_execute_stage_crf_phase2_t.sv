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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_crf_phase2_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_crf_phase2_t(
    input  logic [11:0] s_pmp_waddr_o_Q,
    input  logic [31:0] s_pmp_wdata_o_Q,
    input  logic s_pmp_we_o_Q,
    output logic [11:0] lsu_pmp_s_csr_waddr_i_D,
    output logic [31:0] lsu_pmp_s_csr_wdata_i_D,
    output logic lsu_pmp_s_csr_we_i_D
);
    // data-path code:
    assign lsu_pmp_s_csr_waddr_i_D = s_pmp_waddr_o_Q;
    assign lsu_pmp_s_csr_wdata_i_D = s_pmp_wdata_o_Q;
    assign lsu_pmp_s_csr_we_i_D = s_pmp_we_o_Q;
endmodule: codix_berkelium_ca_core_execute_stage_crf_phase2_t
