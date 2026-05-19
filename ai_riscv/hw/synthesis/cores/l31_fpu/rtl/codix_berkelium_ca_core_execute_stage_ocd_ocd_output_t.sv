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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_ocd_ocd_output_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_ocd_ocd_output_t(
    input  logic r_csr_dcsr_Q,
    input  logic [2:0] r_debug_state_Q,
    output logic s_ocd_step_commited_o_D,
    output logic s_ocd_step_mode_o_D
);
    // data-path code:
    assign s_ocd_step_commited_o_D = (r_debug_state_Q == 3'h2);
    assign s_ocd_step_mode_o_D = ((r_debug_state_Q == 3'h0) & r_csr_dcsr_Q);
endmodule: codix_berkelium_ca_core_execute_stage_ocd_ocd_output_t
