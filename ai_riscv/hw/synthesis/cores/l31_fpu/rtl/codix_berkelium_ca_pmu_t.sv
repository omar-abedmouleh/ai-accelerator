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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_pmu_t' Power management unit.
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

module codix_berkelium_ca_pmu_t(
    input  logic CLK,
    input  logic RST,
    input  logic cache_l1_BUSY,
    input  logic core_execute_stage_div_s_div_ce_i_Q,
    input  logic core_execute_stage_fpu_add_sub_s_add_sub_ce_Q,
    input  logic core_execute_stage_fpu_float2int_s_f2i_ce_Q,
    input  logic core_execute_stage_fpu_fmul_s_fmul_ce_Q,
    input  logic core_execute_stage_fpu_fused_s_fused_ce_Q,
    input  logic core_execute_stage_fpu_int2float_s_i2f_ce_Q,
    input  logic core_execute_stage_fpu_sqrt_div_s_sqrt_div_ce_Q,
    input  logic core_execute_stage_lsu_s_load_ce_Q,
    input  logic core_execute_stage_lsu_s_lsu_ce_Q,
    input  logic core_execute_stage_lsu_s_store_ce_Q,
    input  logic core_fetch_stage_bp_bht_s_is_branch_i_Q,
    input  logic core_fetch_stage_bp_btb_s_is_branch_i_Q,
    input  logic core_fetch_stage_bp_btb_s_is_jump_i_Q,
    input  logic core_r_wfi_ce_Q,
    input  logic core_s_dm_active_Q,
    input  logic core_s_fpu_ce_Q,
    input  logic SCANMODE,
    output logic cache_l1_ICLK,
    output logic execute_stage_div_s_div_ce_i_ICLK,
    output logic execute_stage_fpu_add_sub_s_add_sub_ce_ICLK,
    output logic execute_stage_fpu_float2int_s_f2i_ce_ICLK,
    output logic execute_stage_fpu_fmul_s_fmul_ce_ICLK,
    output logic execute_stage_fpu_fused_s_fused_ce_ICLK,
    output logic execute_stage_fpu_int2float_s_i2f_ce_ICLK,
    output logic execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK,
    output logic execute_stage_lsu_s_load_ce_ICLK,
    output logic execute_stage_lsu_s_lsu_ce_ICLK,
    output logic execute_stage_lsu_s_store_ce_ICLK,
    output logic fetch_stage_bp_bht_s_is_branch_i_ICLK,
    output logic fetch_stage_bp_btb_s_is_branch_i_ICLK,
    output logic fetch_stage_bp_btb_s_is_jump_i_ICLK,
    output logic ICLK,
    output logic r_wfi_ce_ICLK,
    output logic s_dm_active_ICLK,
    output logic s_fpu_ce_ICLK
);
    // additional declarations:
    logic cache_l1_ICLK_gen_CLK_EN_reg_D;
    logic cache_l1_ICLK_gen_CLK_EN_reg_Q;
    logic cache_l1_ICLK_gen_CLK_EN;
    logic execute_stage_div_s_div_ce_i_ICLK_gen_CLK_EN;
    logic execute_stage_fpu_add_sub_s_add_sub_ce_ICLK_gen_CLK_EN;
    logic execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK_gen_CLK_EN;
    logic execute_stage_fpu_float2int_s_f2i_ce_ICLK_gen_CLK_EN;
    logic execute_stage_fpu_fused_s_fused_ce_ICLK_gen_CLK_EN;
    logic execute_stage_fpu_int2float_s_i2f_ce_ICLK_gen_CLK_EN;
    logic execute_stage_fpu_fmul_s_fmul_ce_ICLK_gen_CLK_EN;
    logic execute_stage_lsu_s_lsu_ce_ICLK_gen_CLK_EN;
    logic execute_stage_lsu_s_load_ce_ICLK_gen_CLK_EN;
    logic execute_stage_lsu_s_store_ce_ICLK_gen_CLK_EN;
    logic fetch_stage_bp_bht_s_is_branch_i_ICLK_gen_CLK_EN;
    logic fetch_stage_bp_btb_s_is_jump_i_ICLK_gen_CLK_EN;
    logic fetch_stage_bp_btb_s_is_branch_i_ICLK_gen_CLK_EN;
    logic s_fpu_ce_ICLK_gen_CLK_EN;
    logic s_dm_active_ICLK_gen_CLK_EN;

    // child instances inside Power management unit:
    // Clock gating unit instance:
    codasip_clock_gating_gen_t r_wfi_ce_ICLK_gen (
        .CLK(CLK),
        .CLK_EN(core_r_wfi_ce_Q),
        .SCANMODE(SCANMODE),
        .ICLK(r_wfi_ce_ICLK)
    );

    // register instance:
    d_ff_rst_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b1),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) cache_l1_ICLK_gen_CLK_EN_reg (
        .CLK(CLK),
        .RST(RST),
        .D(cache_l1_ICLK_gen_CLK_EN_reg_D),
        .Q(cache_l1_ICLK_gen_CLK_EN_reg_Q)
    );

    // Clock gating unit instance:
    codasip_clock_gating_gen_t cache_l1_ICLK_gen (
        .CLK(CLK),
        .CLK_EN(cache_l1_ICLK_gen_CLK_EN),
        .SCANMODE(SCANMODE),
        .ICLK(cache_l1_ICLK)
    );

    // Clock gating unit instance:
    codasip_clock_gating_gen_t execute_stage_div_s_div_ce_i_ICLK_gen (
        .CLK(CLK),
        .CLK_EN(execute_stage_div_s_div_ce_i_ICLK_gen_CLK_EN),
        .SCANMODE(SCANMODE),
        .ICLK(execute_stage_div_s_div_ce_i_ICLK)
    );

    // Clock gating unit instance:
    codasip_clock_gating_gen_t execute_stage_fpu_add_sub_s_add_sub_ce_ICLK_gen (
        .CLK(CLK),
        .CLK_EN(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK_gen_CLK_EN),
        .SCANMODE(SCANMODE),
        .ICLK(execute_stage_fpu_add_sub_s_add_sub_ce_ICLK)
    );

    // Clock gating unit instance:
    codasip_clock_gating_gen_t execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK_gen (
        .CLK(CLK),
        .CLK_EN(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK_gen_CLK_EN),
        .SCANMODE(SCANMODE),
        .ICLK(execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK)
    );

    // Clock gating unit instance:
    codasip_clock_gating_gen_t execute_stage_fpu_float2int_s_f2i_ce_ICLK_gen (
        .CLK(CLK),
        .CLK_EN(execute_stage_fpu_float2int_s_f2i_ce_ICLK_gen_CLK_EN),
        .SCANMODE(SCANMODE),
        .ICLK(execute_stage_fpu_float2int_s_f2i_ce_ICLK)
    );

    // Clock gating unit instance:
    codasip_clock_gating_gen_t execute_stage_fpu_fused_s_fused_ce_ICLK_gen (
        .CLK(CLK),
        .CLK_EN(execute_stage_fpu_fused_s_fused_ce_ICLK_gen_CLK_EN),
        .SCANMODE(SCANMODE),
        .ICLK(execute_stage_fpu_fused_s_fused_ce_ICLK)
    );

    // Clock gating unit instance:
    codasip_clock_gating_gen_t execute_stage_fpu_int2float_s_i2f_ce_ICLK_gen (
        .CLK(CLK),
        .CLK_EN(execute_stage_fpu_int2float_s_i2f_ce_ICLK_gen_CLK_EN),
        .SCANMODE(SCANMODE),
        .ICLK(execute_stage_fpu_int2float_s_i2f_ce_ICLK)
    );

    // Clock gating unit instance:
    codasip_clock_gating_gen_t execute_stage_fpu_fmul_s_fmul_ce_ICLK_gen (
        .CLK(CLK),
        .CLK_EN(execute_stage_fpu_fmul_s_fmul_ce_ICLK_gen_CLK_EN),
        .SCANMODE(SCANMODE),
        .ICLK(execute_stage_fpu_fmul_s_fmul_ce_ICLK)
    );

    // Clock gating unit instance:
    codasip_clock_gating_gen_t execute_stage_lsu_s_lsu_ce_ICLK_gen (
        .CLK(CLK),
        .CLK_EN(execute_stage_lsu_s_lsu_ce_ICLK_gen_CLK_EN),
        .SCANMODE(SCANMODE),
        .ICLK(execute_stage_lsu_s_lsu_ce_ICLK)
    );

    // Clock gating unit instance:
    codasip_clock_gating_gen_t execute_stage_lsu_s_load_ce_ICLK_gen (
        .CLK(CLK),
        .CLK_EN(execute_stage_lsu_s_load_ce_ICLK_gen_CLK_EN),
        .SCANMODE(SCANMODE),
        .ICLK(execute_stage_lsu_s_load_ce_ICLK)
    );

    // Clock gating unit instance:
    codasip_clock_gating_gen_t execute_stage_lsu_s_store_ce_ICLK_gen (
        .CLK(CLK),
        .CLK_EN(execute_stage_lsu_s_store_ce_ICLK_gen_CLK_EN),
        .SCANMODE(SCANMODE),
        .ICLK(execute_stage_lsu_s_store_ce_ICLK)
    );

    // Clock gating unit instance:
    codasip_clock_gating_gen_t fetch_stage_bp_bht_s_is_branch_i_ICLK_gen (
        .CLK(CLK),
        .CLK_EN(fetch_stage_bp_bht_s_is_branch_i_ICLK_gen_CLK_EN),
        .SCANMODE(SCANMODE),
        .ICLK(fetch_stage_bp_bht_s_is_branch_i_ICLK)
    );

    // Clock gating unit instance:
    codasip_clock_gating_gen_t fetch_stage_bp_btb_s_is_jump_i_ICLK_gen (
        .CLK(CLK),
        .CLK_EN(fetch_stage_bp_btb_s_is_jump_i_ICLK_gen_CLK_EN),
        .SCANMODE(SCANMODE),
        .ICLK(fetch_stage_bp_btb_s_is_jump_i_ICLK)
    );

    // Clock gating unit instance:
    codasip_clock_gating_gen_t fetch_stage_bp_btb_s_is_branch_i_ICLK_gen (
        .CLK(CLK),
        .CLK_EN(fetch_stage_bp_btb_s_is_branch_i_ICLK_gen_CLK_EN),
        .SCANMODE(SCANMODE),
        .ICLK(fetch_stage_bp_btb_s_is_branch_i_ICLK)
    );

    // Clock gating unit instance:
    codasip_clock_gating_gen_t s_fpu_ce_ICLK_gen (
        .CLK(CLK),
        .CLK_EN(s_fpu_ce_ICLK_gen_CLK_EN),
        .SCANMODE(SCANMODE),
        .ICLK(s_fpu_ce_ICLK)
    );

    // Clock gating unit instance:
    codasip_clock_gating_gen_t s_dm_active_ICLK_gen (
        .CLK(CLK),
        .CLK_EN(s_dm_active_ICLK_gen_CLK_EN),
        .SCANMODE(SCANMODE),
        .ICLK(s_dm_active_ICLK)
    );

    // data-path code:
    assign cache_l1_ICLK_gen_CLK_EN_reg_D = cache_l1_BUSY;
    assign cache_l1_ICLK_gen_CLK_EN = (core_r_wfi_ce_Q | cache_l1_ICLK_gen_CLK_EN_reg_Q);
    assign execute_stage_div_s_div_ce_i_ICLK_gen_CLK_EN = (core_r_wfi_ce_Q & core_execute_stage_div_s_div_ce_i_Q);
    assign execute_stage_fpu_add_sub_s_add_sub_ce_ICLK_gen_CLK_EN = (core_r_wfi_ce_Q & core_execute_stage_fpu_add_sub_s_add_sub_ce_Q);
    assign execute_stage_fpu_sqrt_div_s_sqrt_div_ce_ICLK_gen_CLK_EN = (core_r_wfi_ce_Q & core_execute_stage_fpu_sqrt_div_s_sqrt_div_ce_Q);
    assign execute_stage_fpu_float2int_s_f2i_ce_ICLK_gen_CLK_EN = (core_r_wfi_ce_Q & core_execute_stage_fpu_float2int_s_f2i_ce_Q);
    assign execute_stage_fpu_fused_s_fused_ce_ICLK_gen_CLK_EN = (core_r_wfi_ce_Q & core_execute_stage_fpu_fused_s_fused_ce_Q);
    assign execute_stage_fpu_int2float_s_i2f_ce_ICLK_gen_CLK_EN = (core_r_wfi_ce_Q & core_execute_stage_fpu_int2float_s_i2f_ce_Q);
    assign execute_stage_fpu_fmul_s_fmul_ce_ICLK_gen_CLK_EN = (core_r_wfi_ce_Q & core_execute_stage_fpu_fmul_s_fmul_ce_Q);
    assign execute_stage_lsu_s_lsu_ce_ICLK_gen_CLK_EN = (core_r_wfi_ce_Q & core_execute_stage_lsu_s_lsu_ce_Q);
    assign execute_stage_lsu_s_load_ce_ICLK_gen_CLK_EN = (core_r_wfi_ce_Q & core_execute_stage_lsu_s_load_ce_Q);
    assign execute_stage_lsu_s_store_ce_ICLK_gen_CLK_EN = (core_r_wfi_ce_Q & core_execute_stage_lsu_s_store_ce_Q);
    assign fetch_stage_bp_bht_s_is_branch_i_ICLK_gen_CLK_EN = (core_r_wfi_ce_Q & core_fetch_stage_bp_bht_s_is_branch_i_Q);
    assign fetch_stage_bp_btb_s_is_jump_i_ICLK_gen_CLK_EN = (core_r_wfi_ce_Q & core_fetch_stage_bp_btb_s_is_jump_i_Q);
    assign fetch_stage_bp_btb_s_is_branch_i_ICLK_gen_CLK_EN = (core_r_wfi_ce_Q & core_fetch_stage_bp_btb_s_is_branch_i_Q);
    assign s_fpu_ce_ICLK_gen_CLK_EN = (core_r_wfi_ce_Q & core_s_fpu_ce_Q);
    assign s_dm_active_ICLK_gen_CLK_EN = (core_r_wfi_ce_Q & core_s_dm_active_Q);
    assign ICLK = CLK;
endmodule: codix_berkelium_ca_pmu_t
