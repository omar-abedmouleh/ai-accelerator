/**
 *  Codasip s.r.o.
 *
 *  CONFIDENTIAL
 *
 *  Copyright 2021 Codasip s.r.o.
 *
 *  All Rights Reserved.
 *
 *  NOTICE: All information contained in this file, is and shall remain the property of
 *  Codasip s.r.o. and its suppliers, if any.
 *
 *  The intellectual and technical concepts contained herein are confidential and proprietary to
 *  Codasip s.r.o. and are protected by trade secret and copyright law. In addition, elements of the
 *  technical concepts may be patent pending.
 *
 *  This file is part of the Codasip Studio product. No part of the Studio product, including this
 *  file, may be use, copied, modified, or distributed except in accordance with the terms contained
 *  in Codasip license agreement under which you obtained this file.
 *
 *  \file   codasip_replacement_policy_control.v
 *  \author Dominika Pichlova
 *  \email  support@codasip.com
 *  \date   Wed Sep 22 2021
 *  \brief  replacement policy control
 */

module codasip_replacement_policy_control #(
    parameter integer ASSOCIATIVITY = 32'sd4,
    parameter [0:0] RESET_LEVEL = 1'b0,
    parameter [0:0] RESET_SYNC = 1'b1
)(
    input wire CLK,
    input wire RST,
    // valid bits
    input wire [ASSOCIATIVITY-1:0] RC_VBIN,
    // cache management port
    input wire RC_MP_EN,
    output wire [ASSOCIATIVITY-1:0] RC_MP_REPLWAY
);
    
    // pragma coverage off
    // VCS coverage off
    // logarithm to the base of 2
    function integer log2;
        input [31:0] value;
        integer res;
        begin
            for (res = 0; value > 1; res = res + 1) begin
                value = value >> 1;
            end
            log2 = res;
        end
    endfunction

    // logarithm to the base of 2 (1 returns 1)
    function integer log2x;
        input [31:0] value;
        integer res;
        begin
            if (value == 32'd1) begin
                res = 32'd1;
            end else begin
                res = log2(value);
            end
            log2x = res;
        end
    endfunction
    // pragma coverage on
    // VCS coverage on
    
    // associativity bits
    localparam integer ASSOC_BITS = log2x(ASSOCIATIVITY);

    generate if (ASSOCIATIVITY > 32'sd1) begin: rpl_policy_on
        wire [15:0] lfsr_reg_D;
        wire [15:0] lfsr_reg_Q;
        reg  [ASSOCIATIVITY-1:0] replecement_way_reg_D;
        wire [ASSOCIATIVITY-1:0] replecement_way_reg_Q;
        
        // lfsr register
        d_ff_rst_t #(
            .BIT_WIDTH(32'd16),
            .DEFAULT_VALUE(16'hace1),
            .RESET_LEVEL(RESET_LEVEL),
            .RESET_SYNC(RESET_SYNC)
        ) lfsr_reg (
            .CLK(CLK),
            .RST(RST),
            .D(lfsr_reg_D),
            .Q(lfsr_reg_Q)
        );
        
        // replaced way output register
        d_ff_rst_we_t #(
            .BIT_WIDTH(ASSOCIATIVITY),
            .DEFAULT_VALUE({ASSOCIATIVITY{1'b0}}),
            .RESET_LEVEL(RESET_LEVEL),
            .RESET_SYNC(RESET_SYNC)
        ) replacement_way_reg (
            .CLK(CLK),
            .RST(RST),
            .WE(RC_MP_EN),
            .D(replecement_way_reg_D),
            .Q(replecement_way_reg_Q)
        );
        
        assign lfsr_reg_D = lfsr_reg_Q[0] ? { 1'b0, lfsr_reg_Q[15:1] } ^ 16'hb400 : { 1'b0, lfsr_reg_Q[15:1] };
    
        // speculatively compute the way when data is evicted from LF
        always @(*) begin : valid_dec
            integer i;
            replecement_way_reg_D = {{ASSOCIATIVITY-1{1'b0}},1'b1} << lfsr_reg_Q[ASSOC_BITS-1:0];
            // search empty way
            for (i = ASSOCIATIVITY-1; i >= 0; i = i-1) begin
                if (RC_VBIN[i] == 1'b0) begin
                    replecement_way_reg_D = {{ASSOCIATIVITY-1{1'b0}},1'b1} << i[ASSOC_BITS-1:0];
                end
            end
        end

        // output drivers
        assign RC_MP_REPLWAY = replecement_way_reg_Q;
    end else begin: rpl_policy_off
        // direct mapping
        // output drivers
        assign RC_MP_REPLWAY = 1'b1;
    end endgenerate

endmodule // codasip_replacement_policy_control
