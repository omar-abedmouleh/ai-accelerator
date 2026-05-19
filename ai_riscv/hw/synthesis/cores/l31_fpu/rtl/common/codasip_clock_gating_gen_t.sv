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
 *  \brief   Contains module definition of the 'codasip_clock_gating_gen_t' Clock gating unit.
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

module codasip_clock_gating_gen_t(
    input  logic CLK,
    input  logic CLK_EN,
    input  logic SCANMODE,
    output logic ICLK
);
    // additional declarations:
    logic latch_inst_D;
    logic latch_inst_Q;

    // child instances inside Clock gating unit:
    always_latch begin
        if ( CLK == 1'b0 ) begin
            latch_inst_Q <= latch_inst_D;
        end
    end
    // data-path code:
    assign latch_inst_D = (CLK_EN | SCANMODE);
    assign ICLK = (CLK & latch_inst_Q);
endmodule: codasip_clock_gating_gen_t
