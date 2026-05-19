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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_fpu_sqrt_div_control_sqrt_div_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_fpu_sqrt_div_control_sqrt_div_t(
    input  logic s_flush_i_Q,
    output logic pipe_sqrt_div_SQRT_DIV_CLEAR_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic codasip_tmp_var_0;

    // data-path code:
    assign codasip_tmp_var_0 = s_flush_i_Q;
    assign pipe_sqrt_div_SQRT_DIV_CLEAR_D = codasip_tmp_var_0 ? 1'b1 : 1'b0;
endmodule: codix_berkelium_ca_core_execute_stage_fpu_sqrt_div_control_sqrt_div_t
