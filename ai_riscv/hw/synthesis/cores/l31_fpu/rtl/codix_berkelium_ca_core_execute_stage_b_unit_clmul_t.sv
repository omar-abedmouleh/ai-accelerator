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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_b_unit_clmul_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_b_unit_clmul_t(
    input  logic ACT,
    input  logic [31:0] codasip_param_0,
    input  logic [31:0] codasip_param_1,
    output logic [63:0] RET
);
    // type, wire and constant declarations:
    // signal/wire
    logic [63:0] clmul_data_0_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_10_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_11_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_12_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_13_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_14_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_15_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_16_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_17_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_18_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_19_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_1_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_20_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_21_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_22_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_23_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_24_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_25_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_26_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_27_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_28_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_29_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_2_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_30_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_31_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_3_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_4_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_5_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_6_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_7_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_8_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_data_9_inline_1_inline_1_B0;
    // signal/wire
    logic [63:0] clmul_full_inline_1_inline_1_B0;
    // signal/wire
    logic signed [63:0] codasip_return2_clmul_inline_1_inline_1;
    // signal/wire
    logic signed [31:0] s1_inline_1_inline_1;
    // signal/wire
    logic signed [31:0] s2_inline_1_inline_1;

    // data-path code:
    assign s2_inline_1_inline_1 = signed'(codasip_param_1);
    assign s1_inline_1_inline_1 = signed'(codasip_param_0);
    assign clmul_data_0_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh00000000)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh00000000) : 64'h0000000000000000);
    assign clmul_data_1_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh00000001)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh00000001) : 64'h0000000000000000);
    assign clmul_data_2_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh00000002)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh00000002) : 64'h0000000000000000);
    assign clmul_data_3_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh00000003)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh00000003) : 64'h0000000000000000);
    assign clmul_data_4_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh00000004)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh00000004) : 64'h0000000000000000);
    assign clmul_data_5_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh00000005)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh00000005) : 64'h0000000000000000);
    assign clmul_data_6_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh00000006)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh00000006) : 64'h0000000000000000);
    assign clmul_data_7_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh00000007)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh00000007) : 64'h0000000000000000);
    assign clmul_data_8_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh00000008)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh00000008) : 64'h0000000000000000);
    assign clmul_data_9_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh00000009)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh00000009) : 64'h0000000000000000);
    assign clmul_data_10_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh0000000a)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh0000000a) : 64'h0000000000000000);
    assign clmul_data_11_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh0000000b)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh0000000b) : 64'h0000000000000000);
    assign clmul_data_12_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh0000000c)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh0000000c) : 64'h0000000000000000);
    assign clmul_data_13_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh0000000d)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh0000000d) : 64'h0000000000000000);
    assign clmul_data_14_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh0000000e)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh0000000e) : 64'h0000000000000000);
    assign clmul_data_15_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh0000000f)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh0000000f) : 64'h0000000000000000);
    assign clmul_data_16_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh00000010)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh00000010) : 64'h0000000000000000);
    assign clmul_data_17_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh00000011)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh00000011) : 64'h0000000000000000);
    assign clmul_data_18_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh00000012)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh00000012) : 64'h0000000000000000);
    assign clmul_data_19_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh00000013)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh00000013) : 64'h0000000000000000);
    assign clmul_data_20_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh00000014)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh00000014) : 64'h0000000000000000);
    assign clmul_data_21_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh00000015)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh00000015) : 64'h0000000000000000);
    assign clmul_data_22_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh00000016)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh00000016) : 64'h0000000000000000);
    assign clmul_data_23_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh00000017)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh00000017) : 64'h0000000000000000);
    assign clmul_data_24_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh00000018)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh00000018) : 64'h0000000000000000);
    assign clmul_data_25_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh00000019)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh00000019) : 64'h0000000000000000);
    assign clmul_data_26_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh0000001a)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh0000001a) : 64'h0000000000000000);
    assign clmul_data_27_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh0000001b)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh0000001b) : 64'h0000000000000000);
    assign clmul_data_28_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh0000001c)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh0000001c) : 64'h0000000000000000);
    assign clmul_data_29_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh0000001d)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh0000001d) : 64'h0000000000000000);
    assign clmul_data_30_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh0000001e)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh0000001e) : 64'h0000000000000000);
    assign clmul_data_31_inline_1_inline_1_B0 = ((((unsigned'((s2_inline_1_inline_1 >>> 32'sh0000001f)) & 32'h00000001) != 32'h00000000)) ? ({32'h00000000, s1_inline_1_inline_1} << 32'sh0000001f) : 64'h0000000000000000);
    assign clmul_full_inline_1_inline_1_B0 = (((((((((((((((((((((((((((((((clmul_data_0_inline_1_inline_1_B0 ^ clmul_data_1_inline_1_inline_1_B0) ^ clmul_data_2_inline_1_inline_1_B0) ^ clmul_data_3_inline_1_inline_1_B0) ^ clmul_data_4_inline_1_inline_1_B0) ^ clmul_data_5_inline_1_inline_1_B0) ^ clmul_data_6_inline_1_inline_1_B0) ^ clmul_data_7_inline_1_inline_1_B0) ^ clmul_data_8_inline_1_inline_1_B0) ^ clmul_data_9_inline_1_inline_1_B0) ^ clmul_data_10_inline_1_inline_1_B0) ^ clmul_data_11_inline_1_inline_1_B0) ^ clmul_data_12_inline_1_inline_1_B0) ^ clmul_data_13_inline_1_inline_1_B0) ^ clmul_data_14_inline_1_inline_1_B0) ^ clmul_data_15_inline_1_inline_1_B0) ^ clmul_data_16_inline_1_inline_1_B0) ^ clmul_data_17_inline_1_inline_1_B0) ^ clmul_data_18_inline_1_inline_1_B0) ^ clmul_data_19_inline_1_inline_1_B0) ^ clmul_data_20_inline_1_inline_1_B0) ^ clmul_data_21_inline_1_inline_1_B0) ^ clmul_data_22_inline_1_inline_1_B0) ^ clmul_data_23_inline_1_inline_1_B0) ^ clmul_data_24_inline_1_inline_1_B0) ^ clmul_data_25_inline_1_inline_1_B0) ^ clmul_data_26_inline_1_inline_1_B0) ^ clmul_data_27_inline_1_inline_1_B0) ^ clmul_data_28_inline_1_inline_1_B0) ^ clmul_data_29_inline_1_inline_1_B0) ^ clmul_data_30_inline_1_inline_1_B0) ^ clmul_data_31_inline_1_inline_1_B0);
    assign codasip_return2_clmul_inline_1_inline_1 = (ACT == 1'b1) ? signed'(clmul_full_inline_1_inline_1_B0) : 64'sh0000000000000000;
    assign RET = unsigned'(codasip_return2_clmul_inline_1_inline_1);
endmodule: codix_berkelium_ca_core_execute_stage_b_unit_clmul_t
