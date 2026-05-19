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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_fetch_stage_npc_get_ifu_addr_t' functional unit.
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

module codix_berkelium_ca_core_fetch_stage_npc_get_ifu_addr_t(
    input  logic [30:0] s_pc_addr_i_Q,
    output logic [31:0] s_ifu_addr_o_D,
    output logic [1:0] s_ifu_valid_o_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic [30:0] ifu_addr_B0;

    // data-path code:
    assign ifu_addr_B0 = s_pc_addr_i_Q;
    assign s_ifu_addr_o_D = {ifu_addr_B0, 1'b0};
    assign s_ifu_valid_o_D = {1'b1, (~ifu_addr_B0[0])};
endmodule: codix_berkelium_ca_core_fetch_stage_npc_get_ifu_addr_t
