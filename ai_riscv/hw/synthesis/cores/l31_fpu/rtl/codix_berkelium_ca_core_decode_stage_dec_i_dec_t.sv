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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_decode_stage_dec_i_dec_t' instruction decoder.
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

module codix_berkelium_ca_core_decode_stage_dec_i_dec_t(
    input  logic ACT,
    input  logic [31:0] codasip_param_0,
    output logic codasip_param_1,
    output logic [5:0] s_fpu_op_o_D,
    output logic [3:0] s_fu_o_D,
    output logic [1:0] s_fu_s1_source_o_D,
    output logic [1:0] s_fu_s2_source_o_D,
    output logic [1:0] s_fu_s3_source_o_D,
    output logic [4:0] s_imm_type_D,
    output logic s_instr_illegal_on_dbg_D,
    output logic [7:0] s_op_o_D,
    output logic s_rd_float_o_D,
    output logic [2:0] s_rd_type_D,
    output logic s_rs1_float_o_D,
    output logic [2:0] s_rs1_type_D,
    output logic s_rs2_float_o_D,
    output logic [2:0] s_rs2_type_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic [9:0] codasip_return_MI17opc_comp_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec20_17opc_comp_2reg_imm3opc;
    // signal/wire
    logic [16:0] codasip_return_MI23opc_comp_2reg_imm_shiftIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_comp_2reg_imm_shift3opc;
    // signal/wire
    logic [16:0] codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc;
    // signal/wire
    logic [9:0] codasip_return_MI23opc_control_conditionalIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_control_conditional3opc;
    // signal/wire
    logic [9:0] codasip_return_MI9opc_loadsIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_loads3opc;
    // signal/wire
    logic [9:0] codasip_return_MI10opc_storesIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_stores3opc;
    // signal/wire
    logic [3:0] codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1;
    // signal/wire
    logic [3:0] codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2;
    // signal/wire
    logic [21:0] codasip_return_MI8opc_xretIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec10_8opc_xret3opc;
    // signal/wire
    logic [16:0] codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc;
    // signal/wire
    logic [16:0] codasip_return_MP12decode_stage3decMI19opc_comp_b_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec40_12decode_stage3dec19opc_comp_b_2reg_imm3opc;
    // signal/wire
    logic [21:0] codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc;
    // signal/wire
    logic [4:0] codasip_return_MI12opc_lsw_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_lsw_comp3opc;
    // signal/wire
    logic [4:0] codasip_return_MI12opc_jmp_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_jmp_comp3opc;
    // signal/wire
    logic [5:0] codasip_return_MI14opc_mvadd_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec17_14opc_mvadd_comp3opc;
    // signal/wire
    logic [5:0] codasip_return_MI13opc_jmpr_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_jmpr_comp3opc;
    // signal/wire
    logic [4:0] codasip_return_MI11opc_br_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec14_11opc_br_comp3opc;
    // signal/wire
    logic [6:0] codasip_return_MI12opc_sri_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_sri_comp3opc;
    // signal/wire
    logic [9:0] codasip_return_MI16opc_compreg_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec19_16opc_compreg_comp3opc;
    // signal/wire
    logic [4:0] codasip_return_MI13opc_flsw_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_flsw_comp3opc;
    // signal/wire
    logic [11:0] codasip_return_MI10opc_comp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_comp_f3opc;
    // signal/wire
    logic [6:0] codasip_return_MI9opc_fusedIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_fused3opc;
    // signal/wire
    logic [1:0] codasip_return_MI7fmt_i32IH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec9_7fmt_i324ifmt;
    // signal/wire
    logic [14:0] codasip_return_MI10opc_sinj_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_sinj_f3opc;
    // signal/wire
    logic [14:0] codasip_return_MI9opc_cmp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_cmp_f3opc;
    // signal/wire
    logic [14:0] codasip_return_MI13opc_min_max_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_min_max_f3opc;
    // verilator lint_off UNUSED
    // signal/wire
    logic [4:0] imm_non_zero_imm5_non_zero_imm5_dst_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // verilator lint_on UNUSED
    // verilator lint_off UNUSED
    // signal/wire
    logic [4:0] imm_imm5_imm5_srcdst_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // verilator lint_on UNUSED
    // verilator lint_off UNUSED
    // signal/wire
    logic [4:0] imm_non_zero_imm5_non_zero_imm5_src2_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // verilator lint_on UNUSED
    // verilator lint_off UNUSED
    // signal/wire
    logic [4:0] imm_non_zero_imm5_non_zero_imm5_src_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // verilator lint_on UNUSED
    // verilator lint_off UNUSED
    // signal/wire
    logic [4:0] imm_nsp_non_sp_non_sp_dst_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // verilator lint_on UNUSED
    // verilator lint_off UNUSED
    // signal/wire
    logic signed [5:0] imm_non_zero_simm6_s12_non_zero_simm6_s12_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // verilator lint_on UNUSED
    // verilator lint_off UNUSED
    // signal/wire
    logic signed [5:0] imm_non_zero_simm6_s4_non_zero_simm6_s4_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // verilator lint_on UNUSED
    // verilator lint_off UNUSED
    // signal/wire
    logic signed [5:0] simm_simm6_simm6_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // verilator lint_on UNUSED
    // verilator lint_off UNUSED
    // signal/wire
    logic [4:0] imm_non_zero_imm5_non_zero_imm5_srcdst_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // verilator lint_on UNUSED
    // verilator lint_off UNUSED
    // signal/wire
    logic [7:0] imm_non_zero_imm8_s2_non_zero_imm8_s2_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // verilator lint_on UNUSED
    // verilator lint_off UNUSED
    // signal/wire
    logic [4:0] imm_imm5_imm5_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // verilator lint_on UNUSED
    // signal/wire
    logic [9:0] codasip_return_MP12decode_stage3decMI21opc_control_registersIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec42_12decode_stage3dec21opc_control_registers3opc;
    // signal/wire
    logic [9:0] codasip_return_MP12decode_stage3decMI23opc_control_registers_iIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec44_12decode_stage3dec23opc_control_registers_i3opc;
    // signal/wire
    logic cs_0_wire;
    // signal/wire
    logic cs_10_wire;
    // signal/wire
    logic cs_11_wire;
    // signal/wire
    logic cs_12_wire;
    // signal/wire
    logic cs_13_wire;
    // signal/wire
    logic cs_14_wire;
    // signal/wire
    logic cs_15_wire;
    // signal/wire
    logic cs_16_wire;
    // signal/wire
    logic cs_17_wire;
    // signal/wire
    logic cs_18_wire;
    // signal/wire
    logic cs_19_wire;
    // signal/wire
    logic cs_1_wire;
    // signal/wire
    logic cs_21_wire;
    // signal/wire
    logic cs_23_wire;
    // signal/wire
    logic cs_241_wire;
    // signal/wire
    logic cs_242_wire;
    // signal/wire
    logic cs_243_wire;
    // signal/wire
    logic cs_244_wire;
    // signal/wire
    logic cs_245_wire;
    // signal/wire
    logic cs_246_wire;
    // signal/wire
    logic cs_247_wire;
    // signal/wire
    logic cs_248_wire;
    // signal/wire
    logic cs_249_wire;
    // signal/wire
    logic cs_250_wire;
    // signal/wire
    logic cs_251_wire;
    // signal/wire
    logic cs_252_wire;
    // signal/wire
    logic cs_253_wire;
    // signal/wire
    logic cs_254_wire;
    // signal/wire
    logic cs_255_wire;
    // signal/wire
    logic cs_256_wire;
    // signal/wire
    logic cs_257_wire;
    // signal/wire
    logic cs_258_wire;
    // signal/wire
    logic cs_259_wire;
    // signal/wire
    logic cs_260_wire;
    // signal/wire
    logic cs_261_wire;
    // signal/wire
    logic cs_262_wire;
    // signal/wire
    logic cs_263_wire;
    // signal/wire
    logic cs_264_wire;
    // signal/wire
    logic cs_265_wire;
    // signal/wire
    logic cs_266_wire;
    // signal/wire
    logic cs_267_wire;
    // signal/wire
    logic cs_268_wire;
    // signal/wire
    logic cs_269_wire;
    // signal/wire
    logic cs_270_wire;
    // signal/wire
    logic cs_271_wire;
    // signal/wire
    logic cs_272_wire;
    // signal/wire
    logic cs_273_wire;
    // signal/wire
    logic cs_274_wire;
    // signal/wire
    logic cs_275_wire;
    // signal/wire
    logic cs_276_wire;
    // signal/wire
    logic cs_277_wire;
    // signal/wire
    logic cs_278_wire;
    // signal/wire
    logic cs_279_wire;
    // signal/wire
    logic cs_280_wire;
    // signal/wire
    logic cs_281_wire;
    // signal/wire
    logic cs_282_wire;
    // signal/wire
    logic cs_283_wire;
    // signal/wire
    logic cs_284_wire;
    // signal/wire
    logic cs_285_wire;
    // signal/wire
    logic cs_286_wire;
    // signal/wire
    logic cs_287_wire;
    // signal/wire
    logic cs_288_wire;
    // signal/wire
    logic cs_289_wire;
    // signal/wire
    logic cs_290_wire;
    // signal/wire
    logic cs_291_wire;
    // signal/wire
    logic cs_292_wire;
    // signal/wire
    logic cs_293_wire;
    // signal/wire
    logic cs_294_wire;
    // signal/wire
    logic cs_295_wire;
    // signal/wire
    logic cs_296_wire;
    // signal/wire
    logic cs_297_wire;
    // signal/wire
    logic cs_298_wire;
    // signal/wire
    logic cs_299_wire;
    // signal/wire
    logic cs_300_wire;
    // signal/wire
    logic cs_301_wire;
    // signal/wire
    logic cs_302_wire;
    // signal/wire
    logic cs_303_wire;
    // signal/wire
    logic cs_304_wire;
    // signal/wire
    logic cs_305_wire;
    // signal/wire
    logic cs_306_wire;
    // signal/wire
    logic cs_307_wire;
    // signal/wire
    logic cs_308_wire;
    // signal/wire
    logic cs_309_wire;
    // signal/wire
    logic cs_310_wire;
    // signal/wire
    logic cs_311_wire;
    // signal/wire
    logic cs_312_wire;
    // signal/wire
    logic cs_313_wire;
    // signal/wire
    logic cs_314_wire;
    // signal/wire
    logic cs_315_wire;
    // signal/wire
    logic cs_316_wire;
    // signal/wire
    logic cs_325_wire;
    // signal/wire
    logic cs_326_wire;
    // signal/wire
    logic cs_327_wire;
    // signal/wire
    logic cs_328_wire;
    // signal/wire
    logic cs_329_wire;
    // signal/wire
    logic cs_330_wire;
    // signal/wire
    logic cs_331_wire;
    // signal/wire
    logic cs_332_wire;
    // signal/wire
    logic cs_333_wire;
    // signal/wire
    logic cs_334_wire;
    // signal/wire
    logic cs_335_wire;
    // signal/wire
    logic cs_336_wire;
    // signal/wire
    logic cs_337_wire;
    // signal/wire
    logic cs_338_wire;
    // signal/wire
    logic cs_339_wire;
    // signal/wire
    logic cs_340_wire;
    // signal/wire
    logic cs_341_wire;
    // signal/wire
    logic cs_342_wire;
    // signal/wire
    logic cs_343_wire;
    // signal/wire
    logic cs_345_wire;
    // signal/wire
    logic cs_346_wire;
    // signal/wire
    logic cs_347_wire;
    // signal/wire
    logic cs_348_wire;
    // signal/wire
    logic cs_349_wire;
    // signal/wire
    logic cs_350_wire;
    // signal/wire
    logic cs_352_wire;
    // signal/wire
    logic cs_353_wire;
    // signal/wire
    logic cs_354_wire;
    // signal/wire
    logic cs_355_wire;
    // signal/wire
    logic cs_357_wire;
    // signal/wire
    logic cs_359_wire;
    // signal/wire
    logic cs_361_wire;
    // signal/wire
    logic cs_363_wire;
    // signal/wire
    logic cs_364_wire;
    // signal/wire
    logic cs_365_wire;
    // signal/wire
    logic cs_366_wire;
    // signal/wire
    logic cs_367_wire;
    // signal/wire
    logic cs_368_wire;
    // signal/wire
    logic cs_369_wire;
    // signal/wire
    logic cs_370_wire;
    // signal/wire
    logic cs_371_wire;
    // signal/wire
    logic cs_372_wire;
    // signal/wire
    logic cs_373_wire;
    // signal/wire
    logic cs_374_wire;
    // signal/wire
    logic cs_375_wire;
    // signal/wire
    logic cs_376_wire;
    // signal/wire
    logic cs_377_wire;
    // signal/wire
    logic cs_378_wire;
    // signal/wire
    logic cs_379_wire;
    // signal/wire
    logic cs_380_wire;
    // signal/wire
    logic cs_381_wire;
    // signal/wire
    logic cs_382_wire;
    // signal/wire
    logic cs_383_wire;
    // signal/wire
    logic cs_384_wire;
    // signal/wire
    logic cs_385_wire;
    // signal/wire
    logic cs_386_wire;
    // signal/wire
    logic cs_387_wire;
    // signal/wire
    logic cs_388_wire;
    // signal/wire
    logic cs_389_wire;
    // signal/wire
    logic cs_390_wire;
    // signal/wire
    logic cs_391_wire;
    // signal/wire
    logic cs_392_wire;
    // signal/wire
    logic cs_393_wire;
    // signal/wire
    logic cs_394_wire;
    // signal/wire
    logic cs_395_wire;
    // signal/wire
    logic cs_396_wire;
    // signal/wire
    logic cs_397_wire;
    // signal/wire
    logic cs_398_wire;
    // signal/wire
    logic cs_399_wire;
    // signal/wire
    logic cs_3_wire;
    // signal/wire
    logic cs_400_wire;
    // signal/wire
    logic cs_401_wire;
    // signal/wire
    logic cs_402_wire;
    // signal/wire
    logic cs_403_wire;
    // signal/wire
    logic cs_405_wire;
    // signal/wire
    logic cs_406_wire;
    // signal/wire
    logic cs_408_wire;
    // signal/wire
    logic cs_409_wire;
    // signal/wire
    logic cs_411_wire;
    // signal/wire
    logic cs_412_wire;
    // signal/wire
    logic cs_413_wire;
    // signal/wire
    logic cs_414_wire;
    // signal/wire
    logic cs_418_wire;
    // signal/wire
    logic cs_419_wire;
    // signal/wire
    logic cs_420_wire;
    // signal/wire
    logic cs_421_wire;
    // signal/wire
    logic cs_422_wire;
    // signal/wire
    logic cs_423_wire;
    // signal/wire
    logic cs_424_wire;
    // signal/wire
    logic cs_425_wire;
    // signal/wire
    logic cs_426_wire;
    // signal/wire
    logic cs_427_wire;
    // signal/wire
    logic cs_428_wire;
    // signal/wire
    logic cs_429_wire;
    // signal/wire
    logic cs_430_wire;
    // signal/wire
    logic cs_431_wire;
    // signal/wire
    logic cs_432_wire;
    // signal/wire
    logic cs_433_wire;
    // signal/wire
    logic cs_434_wire;
    // signal/wire
    logic cs_435_wire;
    // signal/wire
    logic cs_436_wire;
    // signal/wire
    logic cs_437_wire;
    // signal/wire
    logic cs_438_wire;
    // signal/wire
    logic cs_439_wire;
    // signal/wire
    logic cs_440_wire;
    // signal/wire
    logic cs_441_wire;
    // signal/wire
    logic cs_442_wire;
    // signal/wire
    logic cs_443_wire;
    // signal/wire
    logic cs_444_wire;
    // signal/wire
    logic cs_445_wire;
    // signal/wire
    logic cs_446_wire;
    // signal/wire
    logic cs_447_wire;
    // signal/wire
    logic cs_448_wire;
    // signal/wire
    logic cs_449_wire;
    // signal/wire
    logic cs_450_wire;
    // signal/wire
    logic cs_451_wire;
    // signal/wire
    logic cs_452_wire;
    // signal/wire
    logic cs_453_wire;
    // signal/wire
    logic cs_454_wire;
    // signal/wire
    logic cs_455_wire;
    // signal/wire
    logic cs_456_wire;
    // signal/wire
    logic cs_457_wire;
    // signal/wire
    logic cs_458_wire;
    // signal/wire
    logic cs_459_wire;
    // signal/wire
    logic cs_460_wire;
    // signal/wire
    logic cs_461_wire;
    // signal/wire
    logic cs_462_wire;
    // signal/wire
    logic cs_463_wire;
    // signal/wire
    logic cs_464_wire;
    // signal/wire
    logic cs_465_wire;
    // signal/wire
    logic cs_4_wire;
    // signal/wire
    logic cs_5_wire;
    // signal/wire
    logic cs_6_wire;
    // signal/wire
    logic cs_7_wire;
    // signal/wire
    logic cs_8_wire;
    // signal/wire
    logic cs_9_wire;
    // signal/wire
    logic invalid_instruction_wire;
    // signal/wire
    logic vs_0_wire;
    // signal/wire
    logic vs_1_wire;
    // signal/wire
    logic [14:0] codasip_tmp_var_0_i_hw_cmp_f_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [11:0] codasip_tmp_var_0_i_hw_fcomp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [6:0] codasip_tmp_var_0_i_hw_fused_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [9:0] codasip_tmp_var_0_i_hw_store_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [14:0] codasip_tmp_var_0_i_hw_sinj_f_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [4:0] codasip_tmp_var_0_i_hw_br_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [1:0] codasip_tmp_var_0_i_hw_conv_fx_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [1:0] codasip_tmp_var_0_i_hw_conv_xf_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [14:0] codasip_tmp_var_0_i_hw_fmin_max_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [4:0] codasip_tmp_var_0_i_hw_jal_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [4:0] codasip_tmp_var_0_i_hw_lsw_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [6:0] codasip_tmp_var_0_i_hw_sri_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [16:0] codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [4:0] codasip_tmp_var_0_i_hw_flsw_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [5:0] codasip_tmp_var_0_i_hw_jalr_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [5:0] codasip_tmp_var_0_i_hw_mvadd_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [21:0] codasip_tmp_var_0_i_hw_comp_b_2reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [16:0] codasip_tmp_var_0_i_hw_comp_b_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [9:0] codasip_tmp_var_0_i_hw_compreg_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [9:0] codasip_tmp_var_0_i_hw_comp_2reg_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [16:0] codasip_tmp_var_0_i_hw_comp_b_2reg_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [9:0] codasip_tmp_var_0_i_hw_control_registers_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [16:0] codasip_tmp_var_0_i_hw_comp_2reg_imm_shift_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [9:0] codasip_tmp_var_0_i_hw_control_conditional_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [9:0] codasip_tmp_var_0_i_hw_control_registers_i_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [9:0] codasip_tmp_var_0_i_hw_load_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic [21:0] codasip_tmp_var_0_i_hw_xret_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id;
    // signal/wire
    logic opc_clmulh_ACT;
    // signal/wire
    logic opc_clmulr_ACT;
    // signal/wire
    logic opc_fnmadd_ACT;
    // signal/wire
    logic opc_fnmsub_ACT;
    // signal/wire
    logic opc_fsgnjn_ACT;
    // signal/wire
    logic opc_fsgnjx_ACT;
    // signal/wire
    logic opc_j_comp_ACT;
    // signal/wire
    logic opc_loadbu_ACT;
    // signal/wire
    logic opc_loadhu_ACT;
    // signal/wire
    logic opc_mulhsu_ACT;
    // signal/wire
    logic opc_sh1add_ACT;
    // signal/wire
    logic opc_sh2add_ACT;
    // signal/wire
    logic opc_sh3add_ACT;
    // signal/wire
    logic opc_storeb_ACT;
    // signal/wire
    logic opc_storeh_ACT;
    // signal/wire
    logic opc_storew_ACT;
    // signal/wire
    logic opc_i_fence_param1_ACT;
    // signal/wire
    logic opc_i_fence_param2_ACT;
    // signal/wire
    logic opc_jr_comp_ACT;
    // signal/wire
    logic opc_mv_comp_ACT;
    // signal/wire
    logic opc_o_fence_param1_ACT;
    // signal/wire
    logic opc_o_fence_param2_ACT;
    // signal/wire
    logic opc_or_comp_ACT;
    // signal/wire
    logic opc_r_fence_param1_ACT;
    // signal/wire
    logic opc_r_fence_param2_ACT;
    // signal/wire
    logic opc_w_fence_param1_ACT;
    // signal/wire
    logic opc_w_fence_param2_ACT;
    // signal/wire
    logic opc_add_comp_ACT;
    // signal/wire
    logic opc_and_comp_ACT;
    // signal/wire
    logic opc_io_fence_param1_ACT;
    // signal/wire
    logic opc_io_fence_param2_ACT;
    // signal/wire
    logic opc_ir_fence_param1_ACT;
    // signal/wire
    logic opc_ir_fence_param2_ACT;
    // signal/wire
    logic opc_iw_fence_param1_ACT;
    // signal/wire
    logic opc_iw_fence_param2_ACT;
    // signal/wire
    logic opc_jal_comp_ACT;
    // signal/wire
    logic opc_loadflsw_ACT;
    // signal/wire
    logic opc_loadwreg_ACT;
    // signal/wire
    logic opc_or_fence_param1_ACT;
    // signal/wire
    logic opc_or_fence_param2_ACT;
    // signal/wire
    logic opc_ow_fence_param1_ACT;
    // signal/wire
    logic opc_ow_fence_param2_ACT;
    // signal/wire
    logic opc_rw_fence_param1_ACT;
    // signal/wire
    logic opc_rw_fence_param2_ACT;
    // signal/wire
    logic opc_sub_comp_ACT;
    // signal/wire
    logic opc_xor_comp_ACT;
    // signal/wire
    logic opc_beqz_comp_ACT;
    // signal/wire
    logic opc_bnez_comp_ACT;
    // signal/wire
    logic opc_ior_fence_param1_ACT;
    // signal/wire
    logic opc_ior_fence_param2_ACT;
    // signal/wire
    logic opc_iow_fence_param1_ACT;
    // signal/wire
    logic opc_iow_fence_param2_ACT;
    // signal/wire
    logic opc_irw_fence_param1_ACT;
    // signal/wire
    logic opc_irw_fence_param2_ACT;
    // signal/wire
    logic opc_jalr_comp_ACT;
    // signal/wire
    logic opc_orw_fence_param1_ACT;
    // signal/wire
    logic opc_orw_fence_param2_ACT;
    // signal/wire
    logic opc_srai_comp_ACT;
    // signal/wire
    logic opc_srli_comp_ACT;
    // signal/wire
    logic opc_storeflsw_ACT;
    // signal/wire
    logic opc_storewreg_ACT;
    // signal/wire
    logic opc_hint_fence_param1_ACT;
    // signal/wire
    logic opc_hint_fence_param2_ACT;
    // signal/wire
    logic opc_iorw_fence_param1_ACT;
    // signal/wire
    logic opc_iorw_fence_param2_ACT;
    // signal/wire
    logic fmt_w_ACT;
    // signal/wire
    logic fmt_wu_ACT;
    // signal/wire
    logic opc_or_ACT;
    // signal/wire
    logic opc_add_ACT;
    // signal/wire
    logic opc_and_ACT;
    // signal/wire
    logic opc_beq_ACT;
    // signal/wire
    logic opc_bge_ACT;
    // signal/wire
    logic opc_blt_ACT;
    // signal/wire
    logic opc_bne_ACT;
    // signal/wire
    logic opc_clz_ACT;
    // signal/wire
    logic opc_ctz_ACT;
    // signal/wire
    logic opc_div_ACT;
    // signal/wire
    logic opc_feq_ACT;
    // signal/wire
    logic opc_fle_ACT;
    // signal/wire
    logic opc_flt_ACT;
    // signal/wire
    logic opc_max_ACT;
    // signal/wire
    logic opc_min_ACT;
    // signal/wire
    logic opc_mul_ACT;
    // signal/wire
    logic opc_ori_ACT;
    // signal/wire
    logic opc_orn_ACT;
    // signal/wire
    logic opc_rem_ACT;
    // signal/wire
    logic opc_rol_ACT;
    // signal/wire
    logic opc_ror_ACT;
    // signal/wire
    logic opc_sll_ACT;
    // signal/wire
    logic opc_slt_ACT;
    // signal/wire
    logic opc_sra_ACT;
    // signal/wire
    logic opc_srl_ACT;
    // signal/wire
    logic opc_sub_ACT;
    // signal/wire
    logic opc_xor_ACT;
    // signal/wire
    logic opc_addi_ACT;
    // signal/wire
    logic opc_andi_ACT;
    // signal/wire
    logic opc_andn_ACT;
    // signal/wire
    logic opc_bclr_ACT;
    // signal/wire
    logic opc_bext_ACT;
    // signal/wire
    logic opc_bgeu_ACT;
    // signal/wire
    logic opc_binv_ACT;
    // signal/wire
    logic opc_bltu_ACT;
    // signal/wire
    logic opc_bset_ACT;
    // signal/wire
    logic opc_cpop_ACT;
    // signal/wire
    logic opc_divu_ACT;
    // signal/wire
    logic opc_fadd_ACT;
    // signal/wire
    logic opc_fdiv_ACT;
    // signal/wire
    logic opc_fmax_ACT;
    // signal/wire
    logic opc_fmin_ACT;
    // signal/wire
    logic opc_fmul_ACT;
    // signal/wire
    logic opc_fsub_ACT;
    // signal/wire
    logic opc_maxu_ACT;
    // signal/wire
    logic opc_minu_ACT;
    // signal/wire
    logic opc_mret_ACT;
    // signal/wire
    logic opc_mulh_ACT;
    // signal/wire
    logic opc_orcb_ACT;
    // signal/wire
    logic opc_remu_ACT;
    // signal/wire
    logic opc_rev8_ACT;
    // signal/wire
    logic opc_rori_ACT;
    // signal/wire
    logic opc_slli_ACT;
    // signal/wire
    logic opc_slti_ACT;
    // signal/wire
    logic opc_sltu_ACT;
    // signal/wire
    logic opc_srai_ACT;
    // signal/wire
    logic opc_srli_ACT;
    // signal/wire
    logic opc_xnor_ACT;
    // signal/wire
    logic opc_xori_ACT;
    // signal/wire
    logic opc_bclri_ACT;
    // signal/wire
    logic opc_bexti_ACT;
    // signal/wire
    logic opc_binvi_ACT;
    // signal/wire
    logic opc_bseti_ACT;
    // signal/wire
    logic opc_clmul_ACT;
    // signal/wire
    logic opc_fmadd_ACT;
    // signal/wire
    logic opc_fmsub_ACT;
    // signal/wire
    logic opc_fsgnj_ACT;
    // signal/wire
    logic opc_loadb_ACT;
    // signal/wire
    logic opc_loadh_ACT;
    // signal/wire
    logic opc_loadw_ACT;
    // signal/wire
    logic opc_mulhu_ACT;
    // signal/wire
    logic opc_sextb_ACT;
    // signal/wire
    logic opc_sexth_ACT;
    // signal/wire
    logic opc_sltiu_ACT;
    // signal/wire
    logic opc_zexth_ACT;
    // signal/wire
    logic i_hw_auipc_ACT;
    // signal/wire
    logic i_hw_cmp_f_ACT;
    // signal/wire
    logic i_hw_ecall_ACT;
    // signal/wire
    logic i_hw_fcomp_ACT;
    // signal/wire
    logic i_hw_fence_ACT;
    // signal/wire
    logic i_hw_fload_ACT;
    // signal/wire
    logic i_hw_fsqrt_ACT;
    // signal/wire
    logic i_hw_fused_ACT;
    // signal/wire
    logic i_hw_store_ACT;
    // signal/wire
    logic i_hw_ebreak_ACT;
    // signal/wire
    logic i_hw_fclass_ACT;
    // signal/wire
    logic i_hw_fencei_ACT;
    // signal/wire
    logic i_hw_fstore_ACT;
    // signal/wire
    logic i_hw_sinj_f_ACT;
    // signal/wire
    logic i_hw_br_comp_ACT;
    // signal/wire
    logic i_hw_conv_fx_ACT;
    // signal/wire
    logic i_hw_conv_xf_ACT;
    // signal/wire
    logic i_hw_li_comp_ACT;
    // signal/wire
    logic i_hw_loadwsp_ACT;
    // signal/wire
    logic i_hw_mv_ff2x_ACT;
    // signal/wire
    logic i_hw_mv_fx2f_ACT;
    // signal/wire
    logic opc_csrrc_hw_ACT;
    // signal/wire
    logic opc_csrrs_hw_ACT;
    // signal/wire
    logic opc_csrrw_hw_ACT;
    // signal/wire
    logic i_hw_fmin_max_ACT;
    // signal/wire
    logic i_hw_jal_comp_ACT;
    // signal/wire
    logic i_hw_lsw_comp_ACT;
    // signal/wire
    logic i_hw_lui_comp_ACT;
    // signal/wire
    logic i_hw_sri_comp_ACT;
    // signal/wire
    logic i_hw_storewsp_ACT;
    // signal/wire
    logic opc_csrrci_hw_ACT;
    // signal/wire
    logic opc_csrrsi_hw_ACT;
    // signal/wire
    logic opc_csrrwi_hw_ACT;
    // signal/wire
    logic i_hw_addi_comp_ACT;
    // signal/wire
    logic i_hw_andi_comp_ACT;
    // signal/wire
    logic i_hw_comp_3reg_ACT;
    // signal/wire
    logic i_hw_flsw_comp_ACT;
    // signal/wire
    logic i_hw_jalr_comp_ACT;
    // signal/wire
    logic i_hw_loadflwsp_ACT;
    // signal/wire
    logic i_hw_slli_comp_ACT;
    // signal/wire
    logic i_hw_mvadd_comp_ACT;
    // signal/wire
    logic i_hw_storefswsp_ACT;
    // signal/wire
    logic i_hw_addisp_comp_ACT;
    // signal/wire
    logic i_hw_comp_b_2reg_ACT;
    // signal/wire
    logic i_hw_comp_b_3reg_ACT;
    // signal/wire
    logic i_hw_ebreak_comp_ACT;
    // signal/wire
    logic i_hw_addispn_comp_ACT;
    // signal/wire
    logic i_hw_compreg_comp_ACT;
    // signal/wire
    logic i_hw_comp_2reg_imm_ACT;
    // signal/wire
    logic i_hw_comp_b_2reg_imm_ACT;
    // signal/wire
    logic i_hw_control_registers_ACT;
    // signal/wire
    logic i_hw_comp_2reg_imm_shift_ACT;
    // signal/wire
    logic i_hw_control_conditional_ACT;
    // signal/wire
    logic i_hw_control_registers_i_ACT;
    // signal/wire
    logic i_hw_jal_ACT;
    // signal/wire
    logic i_hw_lui_ACT;
    // signal/wire
    logic i_hw_wfi_ACT;
    // signal/wire
    logic i_hw_jalr_ACT;
    // signal/wire
    logic i_hw_load_ACT;
    // signal/wire
    logic i_hw_xret_ACT;
    // signal/wire
    logic [16:0] opc_clmulh_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D;
    // signal/wire
    logic [16:0] opc_clmulr_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D;
    // signal/wire
    logic [6:0] opc_fnmadd_codasip_return_MI9opc_fusedIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_fused3opc_D;
    // signal/wire
    logic [6:0] opc_fnmsub_codasip_return_MI9opc_fusedIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_fused3opc_D;
    // signal/wire
    logic [14:0] opc_fsgnjn_codasip_return_MI10opc_sinj_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_sinj_f3opc_D;
    // signal/wire
    logic [14:0] opc_fsgnjx_codasip_return_MI10opc_sinj_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_sinj_f3opc_D;
    // signal/wire
    logic [4:0] opc_j_comp_codasip_return_MI12opc_jmp_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_jmp_comp3opc_D;
    // signal/wire
    logic [9:0] opc_loadbu_codasip_return_MI9opc_loadsIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_loads3opc_D;
    // signal/wire
    logic [9:0] opc_loadhu_codasip_return_MI9opc_loadsIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_loads3opc_D;
    // signal/wire
    logic [16:0] opc_mulhsu_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D;
    // signal/wire
    logic [16:0] opc_sh1add_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D;
    // signal/wire
    logic [16:0] opc_sh2add_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D;
    // signal/wire
    logic [16:0] opc_sh3add_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D;
    // signal/wire
    logic [9:0] opc_storeb_codasip_return_MI10opc_storesIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_stores3opc_D;
    // signal/wire
    logic [9:0] opc_storeh_codasip_return_MI10opc_storesIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_stores3opc_D;
    // signal/wire
    logic [9:0] opc_storew_codasip_return_MI10opc_storesIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_stores3opc_D;
    // signal/wire
    logic [3:0] opc_i_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D;
    // signal/wire
    logic [3:0] opc_i_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D;
    // signal/wire
    logic [5:0] opc_jr_comp_codasip_return_MI13opc_jmpr_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_jmpr_comp3opc_D;
    // signal/wire
    logic [5:0] opc_mv_comp_codasip_return_MI14opc_mvadd_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec17_14opc_mvadd_comp3opc_D;
    // signal/wire
    logic [3:0] opc_o_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D;
    // signal/wire
    logic [3:0] opc_o_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D;
    // signal/wire
    logic [9:0] opc_or_comp_codasip_return_MI16opc_compreg_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec19_16opc_compreg_comp3opc_D;
    // signal/wire
    logic [3:0] opc_r_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D;
    // signal/wire
    logic [3:0] opc_r_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D;
    // signal/wire
    logic [3:0] opc_w_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D;
    // signal/wire
    logic [3:0] opc_w_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D;
    // signal/wire
    logic [5:0] opc_add_comp_codasip_return_MI14opc_mvadd_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec17_14opc_mvadd_comp3opc_D;
    // signal/wire
    logic [9:0] opc_and_comp_codasip_return_MI16opc_compreg_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec19_16opc_compreg_comp3opc_D;
    // signal/wire
    logic [3:0] opc_io_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D;
    // signal/wire
    logic [3:0] opc_io_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D;
    // signal/wire
    logic [3:0] opc_ir_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D;
    // signal/wire
    logic [3:0] opc_ir_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D;
    // signal/wire
    logic [3:0] opc_iw_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D;
    // signal/wire
    logic [3:0] opc_iw_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D;
    // signal/wire
    logic [4:0] opc_jal_comp_codasip_return_MI12opc_jmp_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_jmp_comp3opc_D;
    // signal/wire
    logic [4:0] opc_loadflsw_codasip_return_MI13opc_flsw_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_flsw_comp3opc_D;
    // signal/wire
    logic [4:0] opc_loadwreg_codasip_return_MI12opc_lsw_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_lsw_comp3opc_D;
    // signal/wire
    logic [3:0] opc_or_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D;
    // signal/wire
    logic [3:0] opc_or_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D;
    // signal/wire
    logic [3:0] opc_ow_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D;
    // signal/wire
    logic [3:0] opc_ow_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D;
    // signal/wire
    logic [3:0] opc_rw_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D;
    // signal/wire
    logic [3:0] opc_rw_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D;
    // signal/wire
    logic [9:0] opc_sub_comp_codasip_return_MI16opc_compreg_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec19_16opc_compreg_comp3opc_D;
    // signal/wire
    logic [9:0] opc_xor_comp_codasip_return_MI16opc_compreg_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec19_16opc_compreg_comp3opc_D;
    // signal/wire
    logic [4:0] opc_beqz_comp_codasip_return_MI11opc_br_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec14_11opc_br_comp3opc_D;
    // signal/wire
    logic [4:0] opc_bnez_comp_codasip_return_MI11opc_br_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec14_11opc_br_comp3opc_D;
    // signal/wire
    logic [3:0] opc_ior_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D;
    // signal/wire
    logic [3:0] opc_ior_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D;
    // signal/wire
    logic [3:0] opc_iow_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D;
    // signal/wire
    logic [3:0] opc_iow_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D;
    // signal/wire
    logic [3:0] opc_irw_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D;
    // signal/wire
    logic [3:0] opc_irw_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D;
    // signal/wire
    logic [5:0] opc_jalr_comp_codasip_return_MI13opc_jmpr_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_jmpr_comp3opc_D;
    // signal/wire
    logic [3:0] opc_orw_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D;
    // signal/wire
    logic [3:0] opc_orw_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D;
    // signal/wire
    logic [6:0] opc_srai_comp_codasip_return_MI12opc_sri_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_sri_comp3opc_D;
    // signal/wire
    logic [6:0] opc_srli_comp_codasip_return_MI12opc_sri_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_sri_comp3opc_D;
    // signal/wire
    logic [4:0] opc_storeflsw_codasip_return_MI13opc_flsw_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_flsw_comp3opc_D;
    // signal/wire
    logic [4:0] opc_storewreg_codasip_return_MI12opc_lsw_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_lsw_comp3opc_D;
    // signal/wire
    logic [3:0] opc_hint_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D;
    // signal/wire
    logic [3:0] opc_hint_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D;
    // signal/wire
    logic [3:0] opc_iorw_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D;
    // signal/wire
    logic [3:0] opc_iorw_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D;
    // signal/wire
    logic [1:0] fmt_w_codasip_return_MI7fmt_i32IH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec9_7fmt_i324ifmt_D;
    // signal/wire
    logic [1:0] fmt_wu_codasip_return_MI7fmt_i32IH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec9_7fmt_i324ifmt_D;
    // signal/wire
    logic [16:0] opc_or_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D;
    // signal/wire
    logic [16:0] opc_add_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D;
    // signal/wire
    logic [16:0] opc_and_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D;
    // signal/wire
    logic [9:0] opc_beq_codasip_return_MI23opc_control_conditionalIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_control_conditional3opc_D;
    // signal/wire
    logic [9:0] opc_bge_codasip_return_MI23opc_control_conditionalIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_control_conditional3opc_D;
    // signal/wire
    logic [9:0] opc_blt_codasip_return_MI23opc_control_conditionalIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_control_conditional3opc_D;
    // signal/wire
    logic [9:0] opc_bne_codasip_return_MI23opc_control_conditionalIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_control_conditional3opc_D;
    // signal/wire
    logic [21:0] opc_clz_codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc_D;
    // signal/wire
    logic [21:0] opc_ctz_codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc_D;
    // signal/wire
    logic [16:0] opc_div_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D;
    // signal/wire
    logic [14:0] opc_feq_codasip_return_MI9opc_cmp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_cmp_f3opc_D;
    // signal/wire
    logic [14:0] opc_fle_codasip_return_MI9opc_cmp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_cmp_f3opc_D;
    // signal/wire
    logic [14:0] opc_flt_codasip_return_MI9opc_cmp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_cmp_f3opc_D;
    // signal/wire
    logic [16:0] opc_max_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D;
    // signal/wire
    logic [16:0] opc_min_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D;
    // signal/wire
    logic [16:0] opc_mul_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D;
    // signal/wire
    logic [9:0] opc_ori_codasip_return_MI17opc_comp_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec20_17opc_comp_2reg_imm3opc_D;
    // signal/wire
    logic [16:0] opc_orn_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D;
    // signal/wire
    logic [16:0] opc_rem_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D;
    // signal/wire
    logic [16:0] opc_rol_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D;
    // signal/wire
    logic [16:0] opc_ror_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D;
    // signal/wire
    logic [16:0] opc_sll_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D;
    // signal/wire
    logic [16:0] opc_slt_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D;
    // signal/wire
    logic [16:0] opc_sra_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D;
    // signal/wire
    logic [16:0] opc_srl_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D;
    // signal/wire
    logic [16:0] opc_sub_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D;
    // signal/wire
    logic [16:0] opc_xor_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D;
    // signal/wire
    logic [9:0] opc_addi_codasip_return_MI17opc_comp_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec20_17opc_comp_2reg_imm3opc_D;
    // signal/wire
    logic [9:0] opc_andi_codasip_return_MI17opc_comp_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec20_17opc_comp_2reg_imm3opc_D;
    // signal/wire
    logic [16:0] opc_andn_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D;
    // signal/wire
    logic [16:0] opc_bclr_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D;
    // signal/wire
    logic [16:0] opc_bext_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D;
    // signal/wire
    logic [9:0] opc_bgeu_codasip_return_MI23opc_control_conditionalIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_control_conditional3opc_D;
    // signal/wire
    logic [16:0] opc_binv_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D;
    // signal/wire
    logic [9:0] opc_bltu_codasip_return_MI23opc_control_conditionalIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_control_conditional3opc_D;
    // signal/wire
    logic [16:0] opc_bset_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D;
    // signal/wire
    logic [21:0] opc_cpop_codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc_D;
    // signal/wire
    logic [16:0] opc_divu_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D;
    // signal/wire
    logic [11:0] opc_fadd_codasip_return_MI10opc_comp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_comp_f3opc_D;
    // signal/wire
    logic [11:0] opc_fdiv_codasip_return_MI10opc_comp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_comp_f3opc_D;
    // signal/wire
    logic [14:0] opc_fmax_codasip_return_MI13opc_min_max_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_min_max_f3opc_D;
    // signal/wire
    logic [14:0] opc_fmin_codasip_return_MI13opc_min_max_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_min_max_f3opc_D;
    // signal/wire
    logic [11:0] opc_fmul_codasip_return_MI10opc_comp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_comp_f3opc_D;
    // signal/wire
    logic [11:0] opc_fsub_codasip_return_MI10opc_comp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_comp_f3opc_D;
    // signal/wire
    logic [16:0] opc_maxu_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D;
    // signal/wire
    logic [16:0] opc_minu_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D;
    // signal/wire
    logic [21:0] opc_mret_codasip_return_MI8opc_xretIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec10_8opc_xret3opc_D;
    // signal/wire
    logic [16:0] opc_mulh_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D;
    // signal/wire
    logic [21:0] opc_orcb_codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc_D;
    // signal/wire
    logic [16:0] opc_remu_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D;
    // signal/wire
    logic [21:0] opc_rev8_codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc_D;
    // signal/wire
    logic [16:0] opc_rori_codasip_return_MP12decode_stage3decMI19opc_comp_b_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec40_12decode_stage3dec19opc_comp_b_2reg_imm3opc_D;
    // signal/wire
    logic [16:0] opc_slli_codasip_return_MI23opc_comp_2reg_imm_shiftIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_comp_2reg_imm_shift3opc_D;
    // signal/wire
    logic [9:0] opc_slti_codasip_return_MI17opc_comp_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec20_17opc_comp_2reg_imm3opc_D;
    // signal/wire
    logic [16:0] opc_sltu_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D;
    // signal/wire
    logic [16:0] opc_srai_codasip_return_MI23opc_comp_2reg_imm_shiftIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_comp_2reg_imm_shift3opc_D;
    // signal/wire
    logic [16:0] opc_srli_codasip_return_MI23opc_comp_2reg_imm_shiftIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_comp_2reg_imm_shift3opc_D;
    // signal/wire
    logic [16:0] opc_xnor_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D;
    // signal/wire
    logic [9:0] opc_xori_codasip_return_MI17opc_comp_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec20_17opc_comp_2reg_imm3opc_D;
    // signal/wire
    logic [16:0] opc_bclri_codasip_return_MP12decode_stage3decMI19opc_comp_b_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec40_12decode_stage3dec19opc_comp_b_2reg_imm3opc_D;
    // signal/wire
    logic [16:0] opc_bexti_codasip_return_MP12decode_stage3decMI19opc_comp_b_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec40_12decode_stage3dec19opc_comp_b_2reg_imm3opc_D;
    // signal/wire
    logic [16:0] opc_binvi_codasip_return_MP12decode_stage3decMI19opc_comp_b_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec40_12decode_stage3dec19opc_comp_b_2reg_imm3opc_D;
    // signal/wire
    logic [16:0] opc_bseti_codasip_return_MP12decode_stage3decMI19opc_comp_b_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec40_12decode_stage3dec19opc_comp_b_2reg_imm3opc_D;
    // signal/wire
    logic [16:0] opc_clmul_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D;
    // signal/wire
    logic [6:0] opc_fmadd_codasip_return_MI9opc_fusedIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_fused3opc_D;
    // signal/wire
    logic [6:0] opc_fmsub_codasip_return_MI9opc_fusedIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_fused3opc_D;
    // signal/wire
    logic [14:0] opc_fsgnj_codasip_return_MI10opc_sinj_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_sinj_f3opc_D;
    // signal/wire
    logic [9:0] opc_loadb_codasip_return_MI9opc_loadsIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_loads3opc_D;
    // signal/wire
    logic [9:0] opc_loadh_codasip_return_MI9opc_loadsIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_loads3opc_D;
    // signal/wire
    logic [9:0] opc_loadw_codasip_return_MI9opc_loadsIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_loads3opc_D;
    // signal/wire
    logic [16:0] opc_mulhu_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D;
    // signal/wire
    logic [21:0] opc_sextb_codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc_D;
    // signal/wire
    logic [21:0] opc_sexth_codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc_D;
    // signal/wire
    logic [9:0] opc_sltiu_codasip_return_MI17opc_comp_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec20_17opc_comp_2reg_imm3opc_D;
    // signal/wire
    logic [21:0] opc_zexth_codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc_D;
    // signal/wire
    logic [3:0] i_hw_auipc_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_auipc_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_auipc_s_fu_s2_source_o_D;
    // signal/wire
    logic [4:0] i_hw_auipc_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_auipc_s_op_o_D;
    // signal/wire
    logic i_hw_auipc_s_instr_illegal_on_dbg_D;
    // signal/wire
    logic [3:0] i_hw_cmp_f_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_cmp_f_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_cmp_f_s_fu_s2_source_o_D;
    // signal/wire
    logic i_hw_cmp_f_s_rs1_float_o_D;
    // signal/wire
    logic i_hw_cmp_f_s_rs2_float_o_D;
    // signal/wire
    logic [5:0] i_hw_cmp_f_s_fpu_op_o_D;
    // signal/wire
    logic [5:0] i_hw_cmp_f_s_fpu_op_o_D_ACT;
    // signal/wire
    logic [3:0] i_hw_ecall_s_fu_o_D;
    // signal/wire
    logic [7:0] i_hw_ecall_s_op_o_D;
    // signal/wire
    logic [3:0] i_hw_fcomp_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_fcomp_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_fcomp_s_fu_s2_source_o_D;
    // signal/wire
    logic i_hw_fcomp_s_rs1_float_o_D;
    // signal/wire
    logic i_hw_fcomp_s_rs2_float_o_D;
    // signal/wire
    logic i_hw_fcomp_s_rd_float_o_D;
    // signal/wire
    logic [5:0] i_hw_fcomp_s_fpu_op_o_D;
    // signal/wire
    logic [5:0] i_hw_fcomp_s_fpu_op_o_D_ACT;
    // signal/wire
    logic [3:0] i_hw_fence_s_fu_o_D;
    // signal/wire
    logic [7:0] i_hw_fence_s_op_o_D;
    // signal/wire
    logic [3:0] i_hw_fload_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_fload_s_fu_s1_source_o_D;
    // signal/wire
    logic [4:0] i_hw_fload_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_fload_s_op_o_D;
    // signal/wire
    logic i_hw_fload_s_rd_float_o_D;
    // signal/wire
    logic [3:0] i_hw_fsqrt_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_fsqrt_s_fu_s1_source_o_D;
    // signal/wire
    logic i_hw_fsqrt_s_rs1_float_o_D;
    // signal/wire
    logic i_hw_fsqrt_s_rd_float_o_D;
    // signal/wire
    logic [5:0] i_hw_fsqrt_s_fpu_op_o_D;
    // signal/wire
    logic [3:0] i_hw_fused_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_fused_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_fused_s_fu_s2_source_o_D;
    // signal/wire
    logic [1:0] i_hw_fused_s_fu_s3_source_o_D;
    // signal/wire
    logic i_hw_fused_s_rs1_float_o_D;
    // signal/wire
    logic i_hw_fused_s_rs2_float_o_D;
    // signal/wire
    logic i_hw_fused_s_rd_float_o_D;
    // signal/wire
    logic [5:0] i_hw_fused_s_fpu_op_o_D;
    // signal/wire
    logic [5:0] i_hw_fused_s_fpu_op_o_D_ACT;
    // signal/wire
    logic [3:0] i_hw_store_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_store_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_store_s_fu_s2_source_o_D;
    // signal/wire
    logic [4:0] i_hw_store_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_store_s_op_o_D;
    // signal/wire
    logic [7:0] i_hw_store_s_op_o_D_ACT;
    // signal/wire
    logic [3:0] i_hw_ebreak_s_fu_o_D;
    // signal/wire
    logic [7:0] i_hw_ebreak_s_op_o_D;
    // signal/wire
    logic [3:0] i_hw_fclass_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_fclass_s_fu_s1_source_o_D;
    // signal/wire
    logic i_hw_fclass_s_rs1_float_o_D;
    // signal/wire
    logic [5:0] i_hw_fclass_s_fpu_op_o_D;
    // signal/wire
    logic [3:0] i_hw_fencei_s_fu_o_D;
    // signal/wire
    logic [7:0] i_hw_fencei_s_op_o_D;
    // signal/wire
    logic [3:0] i_hw_fstore_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_fstore_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_fstore_s_fu_s2_source_o_D;
    // signal/wire
    logic [4:0] i_hw_fstore_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_fstore_s_op_o_D;
    // signal/wire
    logic i_hw_fstore_s_rs2_float_o_D;
    // signal/wire
    logic [3:0] i_hw_sinj_f_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_sinj_f_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_sinj_f_s_fu_s2_source_o_D;
    // signal/wire
    logic i_hw_sinj_f_s_rs1_float_o_D;
    // signal/wire
    logic i_hw_sinj_f_s_rs2_float_o_D;
    // signal/wire
    logic i_hw_sinj_f_s_rd_float_o_D;
    // signal/wire
    logic [5:0] i_hw_sinj_f_s_fpu_op_o_D;
    // signal/wire
    logic [5:0] i_hw_sinj_f_s_fpu_op_o_D_ACT;
    // signal/wire
    logic [3:0] i_hw_br_comp_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_br_comp_s_fu_s1_source_o_D;
    // signal/wire
    logic [4:0] i_hw_br_comp_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_br_comp_s_op_o_D;
    // signal/wire
    logic [7:0] i_hw_br_comp_s_op_o_D_ACT;
    // signal/wire
    logic [2:0] i_hw_br_comp_s_rs1_type_D;
    // signal/wire
    logic i_hw_br_comp_s_instr_illegal_on_dbg_D;
    // signal/wire
    logic [3:0] i_hw_conv_fx_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_conv_fx_s_fu_s1_source_o_D;
    // signal/wire
    logic i_hw_conv_fx_s_rs1_float_o_D;
    // signal/wire
    logic [5:0] i_hw_conv_fx_s_fpu_op_o_D;
    // signal/wire
    logic [5:0] i_hw_conv_fx_s_fpu_op_o_D_ACT;
    // signal/wire
    logic [3:0] i_hw_conv_xf_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_conv_xf_s_fu_s1_source_o_D;
    // signal/wire
    logic i_hw_conv_xf_s_rd_float_o_D;
    // signal/wire
    logic [5:0] i_hw_conv_xf_s_fpu_op_o_D;
    // signal/wire
    logic [5:0] i_hw_conv_xf_s_fpu_op_o_D_ACT;
    // signal/wire
    logic [3:0] i_hw_li_comp_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_li_comp_s_fu_s2_source_o_D;
    // signal/wire
    logic [4:0] i_hw_li_comp_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_li_comp_s_op_o_D;
    // signal/wire
    logic [2:0] i_hw_li_comp_s_rd_type_D;
    // signal/wire
    logic [3:0] i_hw_loadwsp_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_loadwsp_s_fu_s1_source_o_D;
    // signal/wire
    logic [4:0] i_hw_loadwsp_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_loadwsp_s_op_o_D;
    // signal/wire
    logic [2:0] i_hw_loadwsp_s_rs1_type_D;
    // signal/wire
    logic [2:0] i_hw_loadwsp_s_rd_type_D;
    // signal/wire
    logic [3:0] i_hw_mv_ff2x_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_mv_ff2x_s_fu_s1_source_o_D;
    // signal/wire
    logic i_hw_mv_ff2x_s_rs1_float_o_D;
    // signal/wire
    logic [5:0] i_hw_mv_ff2x_s_fpu_op_o_D;
    // signal/wire
    logic [3:0] i_hw_mv_fx2f_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_mv_fx2f_s_fu_s1_source_o_D;
    // signal/wire
    logic i_hw_mv_fx2f_s_rd_float_o_D;
    // signal/wire
    logic [5:0] i_hw_mv_fx2f_s_fpu_op_o_D;
    // signal/wire
    logic [9:0] opc_csrrc_hw_codasip_return_MP12decode_stage3decMI21opc_control_registersIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec42_12decode_stage3dec21opc_control_registers3opc_D;
    // signal/wire
    logic [9:0] opc_csrrs_hw_codasip_return_MP12decode_stage3decMI21opc_control_registersIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec42_12decode_stage3dec21opc_control_registers3opc_D;
    // signal/wire
    logic [9:0] opc_csrrw_hw_codasip_return_MP12decode_stage3decMI21opc_control_registersIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec42_12decode_stage3dec21opc_control_registers3opc_D;
    // signal/wire
    logic [3:0] i_hw_fmin_max_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_fmin_max_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_fmin_max_s_fu_s2_source_o_D;
    // signal/wire
    logic i_hw_fmin_max_s_rs1_float_o_D;
    // signal/wire
    logic i_hw_fmin_max_s_rs2_float_o_D;
    // signal/wire
    logic i_hw_fmin_max_s_rd_float_o_D;
    // signal/wire
    logic [5:0] i_hw_fmin_max_s_fpu_op_o_D;
    // signal/wire
    logic [5:0] i_hw_fmin_max_s_fpu_op_o_D_ACT;
    // signal/wire
    logic [3:0] i_hw_jal_comp_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_jal_comp_s_fu_s2_source_o_D;
    // signal/wire
    logic [4:0] i_hw_jal_comp_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_jal_comp_s_op_o_D;
    // signal/wire
    logic [2:0] i_hw_jal_comp_s_rd_type_D;
    // signal/wire
    logic [2:0] i_hw_jal_comp_s_rd_type_D_ACT;
    // signal/wire
    logic i_hw_jal_comp_s_instr_illegal_on_dbg_D;
    // signal/wire
    logic [3:0] i_hw_lsw_comp_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_lsw_comp_s_fu_s1_source_o_D;
    // signal/wire
    logic [4:0] i_hw_lsw_comp_s_imm_type_D;
    // signal/wire
    logic [2:0] i_hw_lsw_comp_s_rs1_type_D;
    // signal/wire
    logic [7:0] i_hw_lsw_comp_s_op_o_D;
    // signal/wire
    logic [7:0] i_hw_lsw_comp_s_op_o_D_ACT;
    // signal/wire
    logic [2:0] i_hw_lsw_comp_s_rd_type_D;
    // signal/wire
    logic [2:0] i_hw_lsw_comp_s_rd_type_D_ACT;
    // signal/wire
    logic [1:0] i_hw_lsw_comp_s_fu_s2_source_o_D;
    // signal/wire
    logic [1:0] i_hw_lsw_comp_s_fu_s2_source_o_D_ACT;
    // signal/wire
    logic [2:0] i_hw_lsw_comp_s_rs2_type_D;
    // signal/wire
    logic [2:0] i_hw_lsw_comp_s_rs2_type_D_ACT;
    // signal/wire
    logic [3:0] i_hw_lui_comp_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_lui_comp_s_fu_s2_source_o_D;
    // signal/wire
    logic [4:0] i_hw_lui_comp_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_lui_comp_s_op_o_D;
    // signal/wire
    logic [2:0] i_hw_lui_comp_s_rd_type_D;
    // signal/wire
    logic [3:0] i_hw_sri_comp_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_sri_comp_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_sri_comp_s_fu_s2_source_o_D;
    // signal/wire
    logic [4:0] i_hw_sri_comp_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_sri_comp_s_op_o_D;
    // signal/wire
    logic [7:0] i_hw_sri_comp_s_op_o_D_ACT;
    // signal/wire
    logic [2:0] i_hw_sri_comp_s_rs1_type_D;
    // signal/wire
    logic [2:0] i_hw_sri_comp_s_rd_type_D;
    // signal/wire
    logic [3:0] i_hw_storewsp_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_storewsp_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_storewsp_s_fu_s2_source_o_D;
    // signal/wire
    logic [4:0] i_hw_storewsp_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_storewsp_s_op_o_D;
    // signal/wire
    logic [2:0] i_hw_storewsp_s_rs1_type_D;
    // signal/wire
    logic [2:0] i_hw_storewsp_s_rs2_type_D;
    // signal/wire
    logic [9:0] opc_csrrci_hw_codasip_return_MP12decode_stage3decMI23opc_control_registers_iIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec44_12decode_stage3dec23opc_control_registers_i3opc_D;
    // signal/wire
    logic [9:0] opc_csrrsi_hw_codasip_return_MP12decode_stage3decMI23opc_control_registers_iIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec44_12decode_stage3dec23opc_control_registers_i3opc_D;
    // signal/wire
    logic [9:0] opc_csrrwi_hw_codasip_return_MP12decode_stage3decMI23opc_control_registers_iIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec44_12decode_stage3dec23opc_control_registers_i3opc_D;
    // signal/wire
    logic [3:0] i_hw_addi_comp_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_addi_comp_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_addi_comp_s_fu_s2_source_o_D;
    // signal/wire
    logic [4:0] i_hw_addi_comp_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_addi_comp_s_op_o_D;
    // signal/wire
    logic [2:0] i_hw_addi_comp_s_rs1_type_D;
    // signal/wire
    logic [2:0] i_hw_addi_comp_s_rd_type_D;
    // signal/wire
    logic [3:0] i_hw_andi_comp_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_andi_comp_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_andi_comp_s_fu_s2_source_o_D;
    // signal/wire
    logic [4:0] i_hw_andi_comp_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_andi_comp_s_op_o_D;
    // signal/wire
    logic [2:0] i_hw_andi_comp_s_rs1_type_D;
    // signal/wire
    logic [2:0] i_hw_andi_comp_s_rd_type_D;
    // signal/wire
    logic [1:0] i_hw_comp_3reg_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_comp_3reg_s_fu_s2_source_o_D;
    // signal/wire
    logic [3:0] i_hw_comp_3reg_s_fu_o_D;
    // signal/wire
    logic [3:0] i_hw_comp_3reg_s_fu_o_D_ACT;
    // signal/wire
    logic [7:0] i_hw_comp_3reg_s_op_o_D;
    // signal/wire
    logic [7:0] i_hw_comp_3reg_s_op_o_D_ACT;
    // signal/wire
    logic [3:0] i_hw_flsw_comp_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_flsw_comp_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_flsw_comp_s_fu_s2_source_o_D;
    // signal/wire
    logic [4:0] i_hw_flsw_comp_s_imm_type_D;
    // signal/wire
    logic [2:0] i_hw_flsw_comp_s_rs1_type_D;
    // signal/wire
    logic i_hw_flsw_comp_s_rs1_float_o_D;
    // signal/wire
    logic i_hw_flsw_comp_s_rs1_float_o_D_ACT;
    // signal/wire
    logic i_hw_flsw_comp_s_rd_float_o_D;
    // signal/wire
    logic i_hw_flsw_comp_s_rd_float_o_D_ACT;
    // signal/wire
    logic [7:0] i_hw_flsw_comp_s_op_o_D;
    // signal/wire
    logic [7:0] i_hw_flsw_comp_s_op_o_D_ACT;
    // signal/wire
    logic [2:0] i_hw_flsw_comp_s_rd_type_D;
    // signal/wire
    logic [2:0] i_hw_flsw_comp_s_rd_type_D_ACT;
    // signal/wire
    logic i_hw_flsw_comp_s_rs2_float_o_D;
    // signal/wire
    logic i_hw_flsw_comp_s_rs2_float_o_D_ACT;
    // signal/wire
    logic [2:0] i_hw_flsw_comp_s_rs2_type_D;
    // signal/wire
    logic [2:0] i_hw_flsw_comp_s_rs2_type_D_ACT;
    // signal/wire
    logic [3:0] i_hw_jalr_comp_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_jalr_comp_s_fu_s1_source_o_D;
    // signal/wire
    logic [7:0] i_hw_jalr_comp_s_op_o_D;
    // signal/wire
    logic [2:0] i_hw_jalr_comp_s_rs1_type_D;
    // signal/wire
    logic [2:0] i_hw_jalr_comp_s_rd_type_D;
    // signal/wire
    logic [2:0] i_hw_jalr_comp_s_rd_type_D_ACT;
    // signal/wire
    logic i_hw_jalr_comp_s_instr_illegal_on_dbg_D;
    // signal/wire
    logic [3:0] i_hw_loadflwsp_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_loadflwsp_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_loadflwsp_s_fu_s2_source_o_D;
    // signal/wire
    logic [4:0] i_hw_loadflwsp_s_imm_type_D;
    // signal/wire
    logic i_hw_loadflwsp_s_rd_float_o_D;
    // signal/wire
    logic [7:0] i_hw_loadflwsp_s_op_o_D;
    // signal/wire
    logic [2:0] i_hw_loadflwsp_s_rs1_type_D;
    // signal/wire
    logic [2:0] i_hw_loadflwsp_s_rd_type_D;
    // signal/wire
    logic [3:0] i_hw_slli_comp_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_slli_comp_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_slli_comp_s_fu_s2_source_o_D;
    // signal/wire
    logic [4:0] i_hw_slli_comp_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_slli_comp_s_op_o_D;
    // signal/wire
    logic [2:0] i_hw_slli_comp_s_rs1_type_D;
    // signal/wire
    logic [2:0] i_hw_slli_comp_s_rd_type_D;
    // signal/wire
    logic [3:0] i_hw_mvadd_comp_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_mvadd_comp_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_mvadd_comp_s_fu_s1_source_o_D_ACT;
    // signal/wire
    logic [1:0] i_hw_mvadd_comp_s_fu_s2_source_o_D;
    // signal/wire
    logic [7:0] i_hw_mvadd_comp_s_op_o_D;
    // signal/wire
    logic [2:0] i_hw_mvadd_comp_s_rs1_type_D;
    // signal/wire
    logic [2:0] i_hw_mvadd_comp_s_rs2_type_D;
    // signal/wire
    logic [2:0] i_hw_mvadd_comp_s_rd_type_D;
    // signal/wire
    logic [3:0] i_hw_storefswsp_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_storefswsp_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_storefswsp_s_fu_s2_source_o_D;
    // signal/wire
    logic [4:0] i_hw_storefswsp_s_imm_type_D;
    // signal/wire
    logic i_hw_storefswsp_s_rs2_float_o_D;
    // signal/wire
    logic [7:0] i_hw_storefswsp_s_op_o_D;
    // signal/wire
    logic [2:0] i_hw_storefswsp_s_rs1_type_D;
    // signal/wire
    logic [2:0] i_hw_storefswsp_s_rs2_type_D;
    // signal/wire
    logic [3:0] i_hw_addisp_comp_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_addisp_comp_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_addisp_comp_s_fu_s2_source_o_D;
    // signal/wire
    logic [4:0] i_hw_addisp_comp_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_addisp_comp_s_op_o_D;
    // signal/wire
    logic [2:0] i_hw_addisp_comp_s_rs1_type_D;
    // signal/wire
    logic [2:0] i_hw_addisp_comp_s_rd_type_D;
    // signal/wire
    logic [3:0] i_hw_comp_b_2reg_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_comp_b_2reg_s_fu_s1_source_o_D;
    // signal/wire
    logic [7:0] i_hw_comp_b_2reg_s_op_o_D;
    // signal/wire
    logic [7:0] i_hw_comp_b_2reg_s_op_o_D_ACT;
    // signal/wire
    logic [1:0] i_hw_comp_b_3reg_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_comp_b_3reg_s_fu_s2_source_o_D;
    // signal/wire
    logic [3:0] i_hw_comp_b_3reg_s_fu_o_D;
    // signal/wire
    logic [7:0] i_hw_comp_b_3reg_s_op_o_D;
    // signal/wire
    logic [7:0] i_hw_comp_b_3reg_s_op_o_D_ACT;
    // signal/wire
    logic [3:0] i_hw_ebreak_comp_s_fu_o_D;
    // signal/wire
    logic [7:0] i_hw_ebreak_comp_s_op_o_D;
    // signal/wire
    logic [3:0] i_hw_addispn_comp_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_addispn_comp_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_addispn_comp_s_fu_s2_source_o_D;
    // signal/wire
    logic [4:0] i_hw_addispn_comp_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_addispn_comp_s_op_o_D;
    // signal/wire
    logic [2:0] i_hw_addispn_comp_s_rs1_type_D;
    // signal/wire
    logic [2:0] i_hw_addispn_comp_s_rd_type_D;
    // signal/wire
    logic [3:0] i_hw_compreg_comp_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_compreg_comp_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_compreg_comp_s_fu_s2_source_o_D;
    // signal/wire
    logic [7:0] i_hw_compreg_comp_s_op_o_D;
    // signal/wire
    logic [7:0] i_hw_compreg_comp_s_op_o_D_ACT;
    // signal/wire
    logic [2:0] i_hw_compreg_comp_s_rs1_type_D;
    // signal/wire
    logic [2:0] i_hw_compreg_comp_s_rs2_type_D;
    // signal/wire
    logic [2:0] i_hw_compreg_comp_s_rd_type_D;
    // signal/wire
    logic [3:0] i_hw_comp_2reg_imm_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_comp_2reg_imm_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_comp_2reg_imm_s_fu_s2_source_o_D;
    // signal/wire
    logic [4:0] i_hw_comp_2reg_imm_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_comp_2reg_imm_s_op_o_D;
    // signal/wire
    logic [7:0] i_hw_comp_2reg_imm_s_op_o_D_ACT;
    // signal/wire
    logic [3:0] i_hw_comp_b_2reg_imm_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_comp_b_2reg_imm_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_comp_b_2reg_imm_s_fu_s2_source_o_D;
    // signal/wire
    logic [4:0] i_hw_comp_b_2reg_imm_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_comp_b_2reg_imm_s_op_o_D;
    // signal/wire
    logic [7:0] i_hw_comp_b_2reg_imm_s_op_o_D_ACT;
    // signal/wire
    logic [3:0] i_hw_control_registers_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_control_registers_s_fu_s1_source_o_D;
    // signal/wire
    logic [7:0] i_hw_control_registers_s_op_o_D;
    // signal/wire
    logic [7:0] i_hw_control_registers_s_op_o_D_ACT;
    // signal/wire
    logic [3:0] i_hw_comp_2reg_imm_shift_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_comp_2reg_imm_shift_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_comp_2reg_imm_shift_s_fu_s2_source_o_D;
    // signal/wire
    logic [4:0] i_hw_comp_2reg_imm_shift_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_comp_2reg_imm_shift_s_op_o_D;
    // signal/wire
    logic [7:0] i_hw_comp_2reg_imm_shift_s_op_o_D_ACT;
    // signal/wire
    logic [3:0] i_hw_control_conditional_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_control_conditional_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_control_conditional_s_fu_s2_source_o_D;
    // signal/wire
    logic [4:0] i_hw_control_conditional_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_control_conditional_s_op_o_D;
    // signal/wire
    logic [7:0] i_hw_control_conditional_s_op_o_D_ACT;
    // signal/wire
    logic i_hw_control_conditional_s_instr_illegal_on_dbg_D;
    // signal/wire
    logic [3:0] i_hw_control_registers_i_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_control_registers_i_s_fu_s1_source_o_D;
    // signal/wire
    logic [4:0] i_hw_control_registers_i_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_control_registers_i_s_op_o_D;
    // signal/wire
    logic [7:0] i_hw_control_registers_i_s_op_o_D_ACT;
    // signal/wire
    logic [3:0] i_hw_jal_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_jal_s_fu_s1_source_o_D;
    // signal/wire
    logic [4:0] i_hw_jal_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_jal_s_op_o_D;
    // signal/wire
    logic i_hw_jal_s_instr_illegal_on_dbg_D;
    // signal/wire
    logic [3:0] i_hw_lui_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_lui_s_fu_s2_source_o_D;
    // signal/wire
    logic [4:0] i_hw_lui_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_lui_s_op_o_D;
    // signal/wire
    logic [3:0] i_hw_wfi_s_fu_o_D;
    // signal/wire
    logic [7:0] i_hw_wfi_s_op_o_D;
    // signal/wire
    logic [3:0] i_hw_jalr_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_jalr_s_fu_s1_source_o_D;
    // signal/wire
    logic [4:0] i_hw_jalr_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_jalr_s_op_o_D;
    // signal/wire
    logic i_hw_jalr_s_instr_illegal_on_dbg_D;
    // signal/wire
    logic [3:0] i_hw_load_s_fu_o_D;
    // signal/wire
    logic [1:0] i_hw_load_s_fu_s1_source_o_D;
    // signal/wire
    logic [1:0] i_hw_load_s_fu_s2_source_o_D;
    // signal/wire
    logic [4:0] i_hw_load_s_imm_type_D;
    // signal/wire
    logic [7:0] i_hw_load_s_op_o_D;
    // signal/wire
    logic [7:0] i_hw_load_s_op_o_D_ACT;
    // signal/wire
    logic [3:0] i_hw_xret_s_fu_o_D;
    // signal/wire
    logic [7:0] i_hw_xret_s_op_o_D;
    // signal/wire
    logic [7:0] i_hw_xret_s_op_o_D_ACT;

    // data-path code:
    assign cs_0_wire = ((((({codasip_param_0[15:12], codasip_param_0[1:0]} == 6'h02) || ({codasip_param_0[15:11], codasip_param_0[1:0]} == 7'h41)) || ({codasip_param_0[15:10], codasip_param_0[1:0]} == 8'h8d)) || ({codasip_param_0[15:13], codasip_param_0[11:10], codasip_param_0[1:0]} == 7'h49)) || ({codasip_param_0[14:13], codasip_param_0[0]} == 3'h6)) ? 1'b1 : 1'b0;
    assign cs_10_wire = ({codasip_param_0[15:10], codasip_param_0[6:5], codasip_param_0[1:0]} == 10'h239) ? 1'b1 : 1'b0;
    assign cs_11_wire = ({codasip_param_0[15:10], codasip_param_0[6:5], codasip_param_0[1:0]} == 10'h23d) ? 1'b1 : 1'b0;
    assign cs_12_wire = ({codasip_param_0[15:13], codasip_param_0[11:10], codasip_param_0[1:0]} == 7'h49) ? 1'b1 : 1'b0;
    assign cs_13_wire = ({codasip_param_0[14:13], codasip_param_0[1:0]} == 4'hc) ? 1'b1 : 1'b0;
    assign cs_14_wire = ({codasip_param_0[15:13], codasip_param_0[1:0]} == 5'h0c) ? 1'b1 : 1'b0;
    assign cs_15_wire = ({codasip_param_0[15:13], codasip_param_0[1:0]} == 5'h1c) ? 1'b1 : 1'b0;
    assign cs_16_wire = ({codasip_param_0[15:13], codasip_param_0[1:0]} == 5'h0e) ? 1'b1 : 1'b0;
    assign cs_17_wire = ({codasip_param_0[15:13], codasip_param_0[1:0]} == 5'h1e) ? 1'b1 : 1'b0;
    assign cs_18_wire = (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((({codasip_param_0[31:21], codasip_param_0[19:0]} == 31'h00000073) || ({codasip_param_0[31:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 21'h000573)) || ({codasip_param_0[31:20], codasip_param_0[12], codasip_param_0[6:0]} == 20'h002f3)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[13:12], codasip_param_0[6:0]} == 20'h00373)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[12], codasip_param_0[6:0]} == 19'h001f3)) || ({codasip_param_0[31:25], codasip_param_0[13:12], codasip_param_0[6:0]} == 16'h0093)) || ({codasip_param_0[31:26], codasip_param_0[6:0]} == 13'h0033)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h020233)) || ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h01533)) || ({codasip_param_0[31:25], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 16'h0ab3)) || ({codasip_param_0[31:25], codasip_param_0[14], codasip_param_0[6:0]} == 15'h05b3)) || (codasip_param_0 == 32'h10500073)) || ({codasip_param_0[31:29], codasip_param_0[26:25], codasip_param_0[14], codasip_param_0[6:0]} == 13'h0053)) || ({codasip_param_0[31:29], codasip_param_0[26:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 15'h0253)) || ({codasip_param_0[31:29], codasip_param_0[26:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 15'h03d3)) || ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h04233)) || ({codasip_param_0[31:25], codasip_param_0[13:12], codasip_param_0[6:0]} == 16'h2133)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h0a1e93)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[14:13], codasip_param_0[6:0]} == 15'h1053)) || (codasip_param_0 == 32'h30200073)) || ({codasip_param_0[31:23], codasip_param_0[21], codasip_param_0[13:12], codasip_param_0[6:0]} == 19'h18173)) || ({codasip_param_0[31:23], codasip_param_0[21], codasip_param_0[12], codasip_param_0[6:0]} == 18'h0c0f3)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 20'h32173)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[12], codasip_param_0[6:0]} == 19'h190f3)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 20'h32773)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[12], codasip_param_0[6:0]} == 19'h193f3)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[13:12], codasip_param_0[6:0]} == 20'h32d73)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[12], codasip_param_0[6:0]} == 19'h196f3)) || ({codasip_param_0[31:24], codasip_param_0[22:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 20'h32b73)) || ({codasip_param_0[31:24], codasip_param_0[22:20], codasip_param_0[12], codasip_param_0[6:0]} == 19'h195f3)) || ({codasip_param_0[31:23], codasip_param_0[13:12], codasip_param_0[6:0]} == 18'h0cd73)) || ({codasip_param_0[31:23], codasip_param_0[12], codasip_param_0[6:0]} == 17'h066f3)) || ({codasip_param_0[31:25], codasip_param_0[23:22], codasip_param_0[13:12], codasip_param_0[6:0]} == 18'h0cd73)) || ({codasip_param_0[31:25], codasip_param_0[23:22], codasip_param_0[12], codasip_param_0[6:0]} == 17'h066f3)) || ({codasip_param_0[31:25], codasip_param_0[23:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 20'h33f73)) || ({codasip_param_0[31:25], codasip_param_0[23:20], codasip_param_0[12], codasip_param_0[6:0]} == 19'h19ff3)) || ({codasip_param_0[31:26], codasip_param_0[24:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 20'h30d73)) || ({codasip_param_0[31:26], codasip_param_0[24:20], codasip_param_0[12], codasip_param_0[6:0]} == 19'h186f3)) || ({codasip_param_0[31:22], codasip_param_0[13:12], codasip_param_0[6:0]} == 19'h1a173)) || ({codasip_param_0[31:22], codasip_param_0[12], codasip_param_0[6:0]} == 18'h0d0f3)) || ({codasip_param_0[31:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 21'h068973)) || ({codasip_param_0[31:20], codasip_param_0[12], codasip_param_0[6:0]} == 20'h344f3)) || ({codasip_param_0[31:22], codasip_param_0[13:12], codasip_param_0[6:0]} == 19'h1db73)) || ({codasip_param_0[31:22], codasip_param_0[12], codasip_param_0[6:0]} == 18'h0edf3)) || ({codasip_param_0[31:22], codasip_param_0[13:12], codasip_param_0[6:0]} == 19'h1dd73)) || ({codasip_param_0[31:22], codasip_param_0[12], codasip_param_0[6:0]} == 18'h0eef3)) || ({codasip_param_0[31:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 21'h077f73)) || ({codasip_param_0[31:20], codasip_param_0[12], codasip_param_0[6:0]} == 20'h3bff3)) || ({codasip_param_0[31:25], codasip_param_0[23:22], codasip_param_0[13:12], codasip_param_0[6:0]} == 18'h0e973)) || ({codasip_param_0[31:25], codasip_param_0[23:22], codasip_param_0[12], codasip_param_0[6:0]} == 17'h074f3)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[13:12], codasip_param_0[6:0]} == 19'h1bd73)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[12], codasip_param_0[6:0]} == 18'h0def3)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 20'h37d73)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[12], codasip_param_0[6:0]} == 19'h1bef3)) || ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h08033)) || ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6], codasip_param_0[4:0]} == 16'h4153)) || ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h083b3)) || ({codasip_param_0[31:25], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 16'h4133)) || ({codasip_param_0[31:25], codasip_param_0[13:12], codasip_param_0[6], codasip_param_0[4:0]} == 15'h2453)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[6:0]} == 20'h58053)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h160253)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1603d3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h180893)) || ({codasip_param_0[31:23], codasip_param_0[21], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h60093)) || ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h0c293)) || ({codasip_param_0[31:25], codasip_param_0[13:12], codasip_param_0[6:0]} == 16'h60b3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1a6293)) || ({codasip_param_0[31:22], codasip_param_0[13:12], codasip_param_0[6:0]} == 19'h3d173)) || ({codasip_param_0[31:22], codasip_param_0[12], codasip_param_0[6:0]} == 18'h1e8f3)) || ({codasip_param_0[31:21], codasip_param_0[13:12], codasip_param_0[6:0]} == 20'h7a573)) || ({codasip_param_0[31:21], codasip_param_0[12], codasip_param_0[6:0]} == 19'h3d2f3)) || ({codasip_param_0[31:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 21'h0f5173)) || ({codasip_param_0[31:20], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7a8f3)) || ({codasip_param_0[31:21], codasip_param_0[13:12], codasip_param_0[6:0]} == 20'h7b173)) || ({codasip_param_0[31:21], codasip_param_0[12], codasip_param_0[6:0]} == 19'h3d8f3)) || ({codasip_param_0[31:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 21'h0f8f73)) || ({codasip_param_0[31:20], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7c7f3)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 20'h7c373)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[12], codasip_param_0[6:0]} == 19'h3e1f3)) || ({codasip_param_0[31:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 21'h0f9173)) || ({codasip_param_0[31:20], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7c8f3)) || ({codasip_param_0[31:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 21'h0f9773)) || ({codasip_param_0[31:20], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7cbf3)) || ({codasip_param_0[31:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 21'h0f9b73)) || ({codasip_param_0[31:20], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7cdf3)) || ({codasip_param_0[31:24], codasip_param_0[22:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 20'h7c573)) || ({codasip_param_0[31:24], codasip_param_0[22:20], codasip_param_0[12], codasip_param_0[6:0]} == 19'h3e2f3)) || ({codasip_param_0[31:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 21'h0fa173)) || ({codasip_param_0[31:20], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7d0f3)) || ({codasip_param_0[31:25], codasip_param_0[23:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 20'h7c973)) || ({codasip_param_0[31:25], codasip_param_0[23:20], codasip_param_0[12], codasip_param_0[6:0]} == 19'h3e4f3)) || ({codasip_param_0[31], codasip_param_0[29:25], codasip_param_0[14:12], codasip_param_0[6], codasip_param_0[4:0]} == 15'h2853)) || ({codasip_param_0[31:25], codasip_param_0[14:13], codasip_param_0[6:0]} == 16'ha053)) || ({codasip_param_0[31:28], codasip_param_0[26:22], codasip_param_0[20], codasip_param_0[13:12], codasip_param_0[6:0]} == 19'h58173)) || ({codasip_param_0[31:28], codasip_param_0[26:22], codasip_param_0[20], codasip_param_0[12], codasip_param_0[6:0]} == 18'h2c0f3)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[21:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 19'h58773)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[21:20], codasip_param_0[12], codasip_param_0[6:0]} == 18'h2c3f3)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:21], codasip_param_0[13:12], codasip_param_0[6:0]} == 18'h2c573)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:21], codasip_param_0[12], codasip_param_0[6:0]} == 17'h162f3)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 19'h58d73)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:20], codasip_param_0[12], codasip_param_0[6:0]} == 18'h2c6f3)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[13:12], codasip_param_0[6:0]} == 17'h16573)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[12], codasip_param_0[6:0]} == 16'hb2f3)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[13:12], codasip_param_0[6:0]} == 19'h59d73)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[12], codasip_param_0[6:0]} == 18'h2cef3)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 20'hb3d73)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[12], codasip_param_0[6:0]} == 19'h59ef3)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:22], codasip_param_0[13:12], codasip_param_0[6:0]} == 17'h16573)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:22], codasip_param_0[12], codasip_param_0[6:0]} == 16'hb2f3)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 19'h59f73)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:20], codasip_param_0[12], codasip_param_0[6:0]} == 18'h2cff3)) || ({codasip_param_0[31:28], codasip_param_0[26:22], codasip_param_0[20], codasip_param_0[13:12], codasip_param_0[6:0]} == 19'h60173)) || ({codasip_param_0[31:28], codasip_param_0[26:22], codasip_param_0[20], codasip_param_0[12], codasip_param_0[6:0]} == 18'h300f3)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[21:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 19'h60773)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[21:20], codasip_param_0[12], codasip_param_0[6:0]} == 18'h303f3)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:21], codasip_param_0[13:12], codasip_param_0[6:0]} == 18'h30573)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:21], codasip_param_0[12], codasip_param_0[6:0]} == 17'h182f3)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 19'h60d73)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:20], codasip_param_0[12], codasip_param_0[6:0]} == 18'h306f3)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[13:12], codasip_param_0[6:0]} == 17'h18573)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[12], codasip_param_0[6:0]} == 16'hc2f3)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[13:12], codasip_param_0[6:0]} == 19'h61d73)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[12], codasip_param_0[6:0]} == 18'h30ef3)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 20'hc3d73)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[12], codasip_param_0[6:0]} == 19'h61ef3)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:22], codasip_param_0[13:12], codasip_param_0[6:0]} == 17'h18573)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:22], codasip_param_0[12], codasip_param_0[6:0]} == 16'hc2f3)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 19'h61f73)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:20], codasip_param_0[12], codasip_param_0[6:0]} == 18'h30ff3)) || ({codasip_param_0[31:29], codasip_param_0[27:21], codasip_param_0[14], codasip_param_0[6:0]} == 18'h30053)) || ({codasip_param_0[31:29], codasip_param_0[27:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hc0253)) || ({codasip_param_0[31:29], codasip_param_0[27:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hc03d3)) || ({codasip_param_0[31:20], codasip_param_0[14:13], codasip_param_0[6:0]} == 21'h1c0053)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h3c0053)) || ({codasip_param_0[31:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 21'h1e2573)) || ({codasip_param_0[31:20], codasip_param_0[12], codasip_param_0[6:0]} == 20'hf12f3)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[13:12], codasip_param_0[6:0]} == 20'hf1373)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[12], codasip_param_0[6:0]} == 19'h789f3)) || ({codasip_param_0[31:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 21'h1e2973)) || ({codasip_param_0[31:20], codasip_param_0[12], codasip_param_0[6:0]} == 20'hf14f3)) || ({codasip_param_0[31:20], codasip_param_0[13:12], codasip_param_0[6:0]} == 21'h1f8773)) || ({codasip_param_0[31:20], codasip_param_0[12], codasip_param_0[6:0]} == 20'hfc3f3)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[13:12], codasip_param_0[6:0]} == 20'hfc173)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[12], codasip_param_0[6:0]} == 19'h7e0f3)) || ({codasip_param_0[31:21], codasip_param_0[13:12], codasip_param_0[6:0]} == 20'hfc573)) || ({codasip_param_0[31:21], codasip_param_0[12], codasip_param_0[6:0]} == 19'h7e2f3)) || ({codasip_param_0[30:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 16'h4153)) || ({codasip_param_0[26:25], codasip_param_0[14], codasip_param_0[6:4], codasip_param_0[1:0]} == 8'h13)) || ({codasip_param_0[26:25], codasip_param_0[14:12], codasip_param_0[6:4], codasip_param_0[1:0]} == 10'h093)) || ({codasip_param_0[26:25], codasip_param_0[14:12], codasip_param_0[6:4], codasip_param_0[1:0]} == 10'h0f3)) || ({codasip_param_0[15:5], codasip_param_0[1:0]} == 13'h0008)) || ({codasip_param_0[15:7], codasip_param_0[5], codasip_param_0[1:0]} == 12'h004)) || ({codasip_param_0[15:7], codasip_param_0[1:0]} == 11'h040)) || ({codasip_param_0[15:12], codasip_param_0[10:7], codasip_param_0[1:0]} == 10'h040)) || ({codasip_param_0[15:13], codasip_param_0[10:7], codasip_param_0[1:0]} == 9'h004)) || ({codasip_param_0[15:13], codasip_param_0[10:8], codasip_param_0[1:0]} == 8'h04)) || ({codasip_param_0[15:13], codasip_param_0[10:9], codasip_param_0[1:0]} == 7'h04)) || ({codasip_param_0[15:13], codasip_param_0[10], codasip_param_0[1:0]} == 6'h04)) || ({codasip_param_0[15:13], codasip_param_0[11:7], codasip_param_0[1:0]} == 10'h106)) || ({codasip_param_0[15:13], codasip_param_0[11:8], codasip_param_0[1:0]} == 9'h086)) || ({codasip_param_0[15:13], codasip_param_0[11:9], codasip_param_0[1:0]} == 8'h46)) || ({codasip_param_0[15:13], codasip_param_0[11:10], codasip_param_0[1:0]} == 7'h26)) || ({codasip_param_0[15:13], codasip_param_0[11], codasip_param_0[1:0]} == 6'h16)) || ({codasip_param_0[15:12], codasip_param_0[6:0]} == 11'h305)) || ({codasip_param_0[15:12], codasip_param_0[6:3], codasip_param_0[1:0]} == 10'h185)) || ({codasip_param_0[15:12], codasip_param_0[6:4], codasip_param_0[1:0]} == 9'h0c5)) || ({codasip_param_0[15:12], codasip_param_0[6:5], codasip_param_0[1:0]} == 8'h65)) || ({codasip_param_0[15:12], codasip_param_0[6], codasip_param_0[1:0]} == 7'h35)) || ({codasip_param_0[15:12], codasip_param_0[1:0]} == 6'h1d)) || ({codasip_param_0[15], codasip_param_0[13], codasip_param_0[1:0]} == 4'h1)) || (codasip_param_0[15:0] == 16'h9002)) || ({codasip_param_0[15:13], codasip_param_0[11:0]} == 15'h4082)) || ({codasip_param_0[15:13], codasip_param_0[11:8], codasip_param_0[6:0]} == 14'h2082)) || ({codasip_param_0[15:13], codasip_param_0[11:9], codasip_param_0[6:0]} == 13'h1082)) || ({codasip_param_0[15:13], codasip_param_0[11:10], codasip_param_0[6:0]} == 12'h882)) || ({codasip_param_0[15:13], codasip_param_0[11], codasip_param_0[6:0]} == 11'h482)) || ({codasip_param_0[15:13], codasip_param_0[6:0]} == 10'h206)) || ({codasip_param_0[15:13], codasip_param_0[6:3], codasip_param_0[1:0]} == 9'h106)) || ({codasip_param_0[15:13], codasip_param_0[6:4], codasip_param_0[1:0]} == 8'h86)) || ({codasip_param_0[15:13], codasip_param_0[6:5], codasip_param_0[1:0]} == 7'h46)) || ({codasip_param_0[15:13], codasip_param_0[6], codasip_param_0[1:0]} == 6'h26)) || ({codasip_param_0[15:13], codasip_param_0[1:0]} == 5'h1a)) || ({codasip_param_0[15:14], codasip_param_0[1:0]} == 4'hd)) || ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h067)) || ({codasip_param_0[14:13], codasip_param_0[6:0]} == 9'h00f)) || ({codasip_param_0[14:13], codasip_param_0[6:0]} == 9'h023)) || ({codasip_param_0[14:12], codasip_param_0[6], codasip_param_0[4:3], codasip_param_0[1:0]} == 8'h43)) || ({codasip_param_0[14:13], codasip_param_0[1:0]} == 4'h5)) || ({codasip_param_0[14:13], codasip_param_0[1:0]} == 4'h8)) || ({codasip_param_0[14:13], codasip_param_0[6:0]} == 9'h1e3)) || ({codasip_param_0[13], codasip_param_0[6:0]} == 8'h03)) || ({codasip_param_0[13], codasip_param_0[6:0]} == 8'h63)) || ({codasip_param_0[13:12], codasip_param_0[6:0]} == 9'h193)) || ({codasip_param_0[12], codasip_param_0[6:0]} == 8'h13)) || ({codasip_param_0[6], codasip_param_0[4:0]} == 6'h17)) || (codasip_param_0[6:0] == 7'h6f)) ? 1'b1 : 1'b0;
    assign cs_19_wire = (codasip_param_0 == 32'h00000073) ? 1'b1 : 1'b0;
    assign cs_1_wire = ({codasip_param_0[15:12], codasip_param_0[1:0]} == 6'h02) ? 1'b1 : 1'b0;
    assign cs_21_wire = (codasip_param_0 == 32'h00100073) ? 1'b1 : 1'b0;
    assign cs_23_wire = (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h000973) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0004f3)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h000573)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h002f3)) || ({codasip_param_0[31:23], codasip_param_0[21], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h30173)) || ({codasip_param_0[31:23], codasip_param_0[21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h180f3)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h064173)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h320f3)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h064d73)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h326f3)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h065973)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h32cf3)) || ({codasip_param_0[31:24], codasip_param_0[22:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h065573)) || ({codasip_param_0[31:24], codasip_param_0[22:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h32af3)) || ({codasip_param_0[31:23], codasip_param_0[14:12], codasip_param_0[6:0]} == 19'h19973)) || ({codasip_param_0[31:23], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 18'h0ccf3)) || ({codasip_param_0[31:25], codasip_param_0[23:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 19'h19973)) || ({codasip_param_0[31:25], codasip_param_0[23:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 18'h0ccf3)) || ({codasip_param_0[31:25], codasip_param_0[23:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h067d73)) || ({codasip_param_0[31:25], codasip_param_0[23:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h33ef3)) || ({codasip_param_0[31:26], codasip_param_0[24:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h061973)) || ({codasip_param_0[31:26], codasip_param_0[24:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h30cf3)) || ({codasip_param_0[31:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h34173)) || ({codasip_param_0[31:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h1a0f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h0d1173)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0688f3)) || ({codasip_param_0[31:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h3b573)) || ({codasip_param_0[31:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h1daf3)) || ({codasip_param_0[31:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h3b973)) || ({codasip_param_0[31:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h1dcf3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h0efd73)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h077ef3)) || ({codasip_param_0[31:25], codasip_param_0[23:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 19'h1d173)) || ({codasip_param_0[31:25], codasip_param_0[23:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 18'h0e8f3)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h37973)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h1bcf3)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h06f973)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h37cf3)) || ({codasip_param_0[31:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h7a173)) || ({codasip_param_0[31:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h3d0f3)) || ({codasip_param_0[31:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h0f4973)) || ({codasip_param_0[31:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7a4f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1ea173)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0f50f3)) || ({codasip_param_0[31:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h0f6173)) || ({codasip_param_0[31:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7b0f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1f1d73)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0f8ef3)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h0f8573)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7c2f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1f2173)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0f90f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1f2d73)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0f96f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1f3573)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0f9af3)) || ({codasip_param_0[31:24], codasip_param_0[22:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h0f8973)) || ({codasip_param_0[31:24], codasip_param_0[22:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7c4f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1f4173)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0fa0f3)) || ({codasip_param_0[31:25], codasip_param_0[23:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h0f9173)) || ({codasip_param_0[31:25], codasip_param_0[23:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7c8f3)) || ({codasip_param_0[31:28], codasip_param_0[26:22], codasip_param_0[20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hb0173)) || ({codasip_param_0[31:28], codasip_param_0[26:22], codasip_param_0[20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h580f3)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[21:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hb0d73)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[21:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h586f3)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 19'h58973)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 18'h2c4f3)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hb1973)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h58cf3)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[14:12], codasip_param_0[6:0]} == 18'h2c973)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 17'h164f3)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hb3973)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h59cf3)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h167973)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'hb3cf3)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 18'h2c973)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 17'h164f3)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hb3d73)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h59ef3)) || ({codasip_param_0[31:28], codasip_param_0[26:22], codasip_param_0[20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hc0173)) || ({codasip_param_0[31:28], codasip_param_0[26:22], codasip_param_0[20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h600f3)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[21:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hc0d73)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[21:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h606f3)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 19'h60973)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 18'h304f3)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hc1973)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h60cf3)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[14:12], codasip_param_0[6:0]} == 18'h30973)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 17'h184f3)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hc3973)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h61cf3)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h187973)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'hc3cf3)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 18'h30973)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 17'h184f3)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hc3d73)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h61ef3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h3c4973)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h1e24f3)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h1e2573)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'hf12f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h3c5173)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h1e28f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h3f0d73)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h1f86f3)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h1f8173)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'hfc0f3)) || ({codasip_param_0[31:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h1f8973)) || ({codasip_param_0[31:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'hfc4f3)) ? 1'b1 : 1'b0;
    assign cs_241_wire = (({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h173) || ({codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 9'h0f3)) ? 1'b1 : 1'b0;
    assign cs_242_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h173) ? 1'b1 : 1'b0;
    assign cs_243_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h0f3) ? 1'b1 : 1'b0;
    assign cs_244_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h1f3) ? 1'b1 : 1'b0;
    assign cs_245_wire = (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h000b73) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0005f3)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h000773)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h003f3)) || ({codasip_param_0[31:23], codasip_param_0[21], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h30373)) || ({codasip_param_0[31:23], codasip_param_0[21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h181f3)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h064373)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h321f3)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h064f73)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h327f3)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h065b73)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h32df3)) || ({codasip_param_0[31:24], codasip_param_0[22:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h065773)) || ({codasip_param_0[31:24], codasip_param_0[22:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h32bf3)) || ({codasip_param_0[31:23], codasip_param_0[14:12], codasip_param_0[6:0]} == 19'h19b73)) || ({codasip_param_0[31:23], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 18'h0cdf3)) || ({codasip_param_0[31:25], codasip_param_0[23:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 19'h19b73)) || ({codasip_param_0[31:25], codasip_param_0[23:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 18'h0cdf3)) || ({codasip_param_0[31:25], codasip_param_0[23:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h067f73)) || ({codasip_param_0[31:25], codasip_param_0[23:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h33ff3)) || ({codasip_param_0[31:26], codasip_param_0[24:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h061b73)) || ({codasip_param_0[31:26], codasip_param_0[24:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h30df3)) || ({codasip_param_0[31:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h34373)) || ({codasip_param_0[31:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h1a1f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h0d1373)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0689f3)) || ({codasip_param_0[31:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h3b773)) || ({codasip_param_0[31:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h1dbf3)) || ({codasip_param_0[31:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h3bb73)) || ({codasip_param_0[31:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h1ddf3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h0eff73)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h077ff3)) || ({codasip_param_0[31:25], codasip_param_0[23:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 19'h1d373)) || ({codasip_param_0[31:25], codasip_param_0[23:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 18'h0e9f3)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h37b73)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h1bdf3)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h06fb73)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h37df3)) || ({codasip_param_0[31:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h7a373)) || ({codasip_param_0[31:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h3d1f3)) || ({codasip_param_0[31:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h0f4b73)) || ({codasip_param_0[31:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7a5f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1ea373)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0f51f3)) || ({codasip_param_0[31:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h0f6373)) || ({codasip_param_0[31:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7b1f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1f1f73)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0f8ff3)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h0f8773)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7c3f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1f2373)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0f91f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1f2f73)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0f97f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1f3773)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0f9bf3)) || ({codasip_param_0[31:24], codasip_param_0[22:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h0f8b73)) || ({codasip_param_0[31:24], codasip_param_0[22:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7c5f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1f4373)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0fa1f3)) || ({codasip_param_0[31:25], codasip_param_0[23:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h0f9373)) || ({codasip_param_0[31:25], codasip_param_0[23:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7c9f3)) || ({codasip_param_0[31:28], codasip_param_0[26:22], codasip_param_0[20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hb0373)) || ({codasip_param_0[31:28], codasip_param_0[26:22], codasip_param_0[20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h581f3)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[21:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hb0f73)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[21:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h587f3)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 19'h58b73)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 18'h2c5f3)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hb1b73)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h58df3)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[14:12], codasip_param_0[6:0]} == 18'h2cb73)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 17'h165f3)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hb3b73)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h59df3)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h167b73)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'hb3df3)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 18'h2cb73)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 17'h165f3)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hb3f73)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h59ff3)) || ({codasip_param_0[31:28], codasip_param_0[26:22], codasip_param_0[20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hc0373)) || ({codasip_param_0[31:28], codasip_param_0[26:22], codasip_param_0[20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h601f3)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[21:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hc0f73)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[21:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h607f3)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 19'h60b73)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 18'h305f3)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hc1b73)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h60df3)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[14:12], codasip_param_0[6:0]} == 18'h30b73)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 17'h185f3)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hc3b73)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h61df3)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h187b73)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'hc3df3)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 18'h30b73)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 17'h185f3)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hc3f73)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h61ff3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h3c4b73)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h1e25f3)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h1e2773)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'hf13f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h3c5373)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h1e29f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h3f0f73)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h1f87f3)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h1f8373)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'hfc1f3)) || ({codasip_param_0[31:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h1f8b73)) || ({codasip_param_0[31:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'hfc5f3)) ? 1'b1 : 1'b0;
    assign cs_246_wire = (({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h373) || ({codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 9'h1f3)) ? 1'b1 : 1'b0;
    assign cs_247_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h373) ? 1'b1 : 1'b0;
    assign cs_248_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h2f3) ? 1'b1 : 1'b0;
    assign cs_249_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h3f3) ? 1'b1 : 1'b0;
    assign cs_250_wire = (({codasip_param_0[31:25], codasip_param_0[13:12], codasip_param_0[6:0]} == 16'h0093) || ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h08293)) ? 1'b1 : 1'b0;
    assign cs_251_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h00093) ? 1'b1 : 1'b0;
    assign cs_252_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h00293) ? 1'b1 : 1'b0;
    assign cs_253_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h08293) ? 1'b1 : 1'b0;
    assign cs_254_wire = ((({codasip_param_0[31:26], codasip_param_0[6:0]} == 13'h0033) || ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h08033)) || ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h082b3)) ? 1'b1 : 1'b0;
    assign cs_255_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h00033) ? 1'b1 : 1'b0;
    assign cs_256_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h000b3) ? 1'b1 : 1'b0;
    assign cs_257_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h00133) ? 1'b1 : 1'b0;
    assign cs_258_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h001b3) ? 1'b1 : 1'b0;
    assign cs_259_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h00233) ? 1'b1 : 1'b0;
    assign cs_260_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h002b3) ? 1'b1 : 1'b0;
    assign cs_261_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h00333) ? 1'b1 : 1'b0;
    assign cs_262_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h003b3) ? 1'b1 : 1'b0;
    assign cs_263_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h00433) ? 1'b1 : 1'b0;
    assign cs_264_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h004b3) ? 1'b1 : 1'b0;
    assign cs_265_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h00533) ? 1'b1 : 1'b0;
    assign cs_266_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h005b3) ? 1'b1 : 1'b0;
    assign cs_267_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h00633) ? 1'b1 : 1'b0;
    assign cs_268_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h006b3) ? 1'b1 : 1'b0;
    assign cs_269_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h00733) ? 1'b1 : 1'b0;
    assign cs_270_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h007b3) ? 1'b1 : 1'b0;
    assign cs_271_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h08033) ? 1'b1 : 1'b0;
    assign cs_272_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h082b3) ? 1'b1 : 1'b0;
    assign cs_273_wire = ((((({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h020233) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h0a1e93)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h180893)) || ({codasip_param_0[31:23], codasip_param_0[21], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h60093)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1a6293)) ? 1'b1 : 1'b0;
    assign cs_274_wire = (({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h020233) || ({codasip_param_0[31:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h0c0893)) ? 1'b1 : 1'b0;
    assign cs_275_wire = ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h020233) ? 1'b1 : 1'b0;
    assign cs_276_wire = ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h181093) ? 1'b1 : 1'b0;
    assign cs_277_wire = ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h181493) ? 1'b1 : 1'b0;
    assign cs_278_wire = ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h0a1e93) ? 1'b1 : 1'b0;
    assign cs_279_wire = (({codasip_param_0[31:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h0c0093) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h180893)) ? 1'b1 : 1'b0;
    assign cs_280_wire = ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h180093) ? 1'b1 : 1'b0;
    assign cs_281_wire = ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h180493) ? 1'b1 : 1'b0;
    assign cs_282_wire = ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h180893) ? 1'b1 : 1'b0;
    assign cs_283_wire = ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1a6293) ? 1'b1 : 1'b0;
    assign cs_284_wire = (((((((((({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h01533) || ({codasip_param_0[31:25], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 16'h0ab3)) || ({codasip_param_0[31:25], codasip_param_0[14], codasip_param_0[6:0]} == 15'h05b3)) || ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h04233)) || ({codasip_param_0[31:25], codasip_param_0[13:12], codasip_param_0[6:0]} == 16'h2133)) || ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h083b3)) || ({codasip_param_0[31:25], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 16'h4133)) || ({codasip_param_0[31:25], codasip_param_0[13:12], codasip_param_0[6:0]} == 16'h48b3)) || ({codasip_param_0[31:25], codasip_param_0[13:12], codasip_param_0[6:0]} == 16'h60b3)) || ({codasip_param_0[31], codasip_param_0[29:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 16'h50b3)) ? 1'b1 : 1'b0;
    assign cs_285_wire = (({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h01533) || ({codasip_param_0[31:25], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 16'h0ab3)) ? 1'b1 : 1'b0;
    assign cs_286_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h01533) ? 1'b1 : 1'b0;
    assign cs_287_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h014b3) ? 1'b1 : 1'b0;
    assign cs_288_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h015b3) ? 1'b1 : 1'b0;
    assign cs_289_wire = ({codasip_param_0[31:25], codasip_param_0[14], codasip_param_0[6:0]} == 15'h05b3) ? 1'b1 : 1'b0;
    assign cs_290_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h01633) ? 1'b1 : 1'b0;
    assign cs_291_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h016b3) ? 1'b1 : 1'b0;
    assign cs_292_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h01733) ? 1'b1 : 1'b0;
    assign cs_293_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h017b3) ? 1'b1 : 1'b0;
    assign cs_294_wire = (({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h04233) || ({codasip_param_0[31:25], codasip_param_0[13:12], codasip_param_0[6:0]} == 16'h2133)) ? 1'b1 : 1'b0;
    assign cs_295_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h04233) ? 1'b1 : 1'b0;
    assign cs_296_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h04133) ? 1'b1 : 1'b0;
    assign cs_297_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h04333) ? 1'b1 : 1'b0;
    assign cs_298_wire = (({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h083b3) || ({codasip_param_0[31:25], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 16'h4133)) ? 1'b1 : 1'b0;
    assign cs_299_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h083b3) ? 1'b1 : 1'b0;
    assign cs_300_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h08233) ? 1'b1 : 1'b0;
    assign cs_301_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h08333) ? 1'b1 : 1'b0;
    assign cs_302_wire = (({codasip_param_0[31:25], codasip_param_0[13:12], codasip_param_0[6:0]} == 16'h48b3) || ({codasip_param_0[31], codasip_param_0[29:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 16'h50b3)) ? 1'b1 : 1'b0;
    assign cs_303_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h090b3) ? 1'b1 : 1'b0;
    assign cs_304_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h092b3) ? 1'b1 : 1'b0;
    assign cs_305_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h050b3) ? 1'b1 : 1'b0;
    assign cs_306_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h0d0b3) ? 1'b1 : 1'b0;
    assign cs_307_wire = ({codasip_param_0[31:25], codasip_param_0[13:12], codasip_param_0[6:0]} == 16'h60b3) ? 1'b1 : 1'b0;
    assign cs_308_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h0c0b3) ? 1'b1 : 1'b0;
    assign cs_309_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h0c2b3) ? 1'b1 : 1'b0;
    assign cs_310_wire = (codasip_param_0 == 32'h10500073) ? 1'b1 : 1'b0;
    assign cs_311_wire = ((({codasip_param_0[31:29], codasip_param_0[26:25], codasip_param_0[14], codasip_param_0[6:0]} == 13'h0053) || ({codasip_param_0[31:29], codasip_param_0[26:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 15'h0253)) || ({codasip_param_0[31:29], codasip_param_0[26:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 15'h03d3)) ? 1'b1 : 1'b0;
    assign cs_312_wire = ({codasip_param_0[31:29], codasip_param_0[6:0]} == 10'h053) ? 1'b1 : 1'b0;
    assign cs_313_wire = ({codasip_param_0[31:27], codasip_param_0[6:0]} == 12'h053) ? 1'b1 : 1'b0;
    assign cs_314_wire = ({codasip_param_0[31:27], codasip_param_0[6:0]} == 12'h0d3) ? 1'b1 : 1'b0;
    assign cs_315_wire = ({codasip_param_0[31:27], codasip_param_0[6:0]} == 12'h153) ? 1'b1 : 1'b0;
    assign cs_316_wire = ({codasip_param_0[31:27], codasip_param_0[6:0]} == 12'h1d3) ? 1'b1 : 1'b0;
    assign cs_325_wire = (({codasip_param_0[31:25], codasip_param_0[14:13], codasip_param_0[6:0]} == 16'h2053) || ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h04153)) ? 1'b1 : 1'b0;
    assign cs_326_wire = (({codasip_param_0[31:27], codasip_param_0[14:13], codasip_param_0[6:0]} == 14'h0853) || ({codasip_param_0[31:27], codasip_param_0[14:12], codasip_param_0[6:0]} == 15'h1153)) ? 1'b1 : 1'b0;
    assign cs_327_wire = ({codasip_param_0[31:27], codasip_param_0[14:12], codasip_param_0[6:0]} == 15'h1053) ? 1'b1 : 1'b0;
    assign cs_328_wire = ({codasip_param_0[31:27], codasip_param_0[14:12], codasip_param_0[6:0]} == 15'h10d3) ? 1'b1 : 1'b0;
    assign cs_329_wire = ({codasip_param_0[31:27], codasip_param_0[14:12], codasip_param_0[6:0]} == 15'h1153) ? 1'b1 : 1'b0;
    assign cs_330_wire = ({codasip_param_0[31:25], codasip_param_0[14:13], codasip_param_0[6:0]} == 16'h2853) ? 1'b1 : 1'b0;
    assign cs_331_wire = ({codasip_param_0[31:27], codasip_param_0[14:13], codasip_param_0[6:0]} == 14'h0a53) ? 1'b1 : 1'b0;
    assign cs_332_wire = ({codasip_param_0[31:27], codasip_param_0[14:12], codasip_param_0[6:0]} == 15'h1453) ? 1'b1 : 1'b0;
    assign cs_333_wire = ({codasip_param_0[31:27], codasip_param_0[14:12], codasip_param_0[6:0]} == 15'h14d3) ? 1'b1 : 1'b0;
    assign cs_334_wire = (codasip_param_0 == 32'h30200073) ? 1'b1 : 1'b0;
    assign cs_335_wire = ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h0c0873) ? 1'b1 : 1'b0;
    assign cs_336_wire = ((({codasip_param_0[31:25], codasip_param_0[13:12], codasip_param_0[6:0]} == 16'h4893) || ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h0c293)) || ({codasip_param_0[31], codasip_param_0[29:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 16'h5093)) ? 1'b1 : 1'b0;
    assign cs_337_wire = (({codasip_param_0[31:25], codasip_param_0[13:12], codasip_param_0[6:0]} == 16'h4893) || ({codasip_param_0[31], codasip_param_0[29:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 16'h5093)) ? 1'b1 : 1'b0;
    assign cs_338_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h09093) ? 1'b1 : 1'b0;
    assign cs_339_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h09293) ? 1'b1 : 1'b0;
    assign cs_340_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h05093) ? 1'b1 : 1'b0;
    assign cs_341_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h0d093) ? 1'b1 : 1'b0;
    assign cs_342_wire = ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h0c293) ? 1'b1 : 1'b0;
    assign cs_343_wire = ((({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[6:0]} == 20'h58053) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h160253)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1603d3)) ? 1'b1 : 1'b0;
    assign cs_345_wire = (({codasip_param_0[31:25], codasip_param_0[14:13], codasip_param_0[6:0]} == 16'ha053) || ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h14153)) ? 1'b1 : 1'b0;
    assign cs_346_wire = (({codasip_param_0[31:27], codasip_param_0[14:13], codasip_param_0[6:0]} == 14'h2853) || ({codasip_param_0[31:27], codasip_param_0[14:12], codasip_param_0[6:0]} == 15'h5153)) ? 1'b1 : 1'b0;
    assign cs_347_wire = ({codasip_param_0[31:27], codasip_param_0[14:12], codasip_param_0[6:0]} == 15'h5053) ? 1'b1 : 1'b0;
    assign cs_348_wire = ({codasip_param_0[31:27], codasip_param_0[14:12], codasip_param_0[6:0]} == 15'h50d3) ? 1'b1 : 1'b0;
    assign cs_349_wire = ({codasip_param_0[31:27], codasip_param_0[14:12], codasip_param_0[6:0]} == 15'h5153) ? 1'b1 : 1'b0;
    assign cs_350_wire = ((({codasip_param_0[31:21], codasip_param_0[14], codasip_param_0[6:0]} == 19'h60053) || ({codasip_param_0[31:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h180253)) || ({codasip_param_0[31:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h1803d3)) ? 1'b1 : 1'b0;
    assign cs_352_wire = (codasip_param_0[21] == 1'b0) ? 1'b1 : 1'b0;
    assign cs_353_wire = (codasip_param_0[21:20] == 2'h0) ? 1'b1 : 1'b0;
    assign cs_354_wire = (codasip_param_0[21:20] == 2'h1) ? 1'b1 : 1'b0;
    assign cs_355_wire = ((({codasip_param_0[31:21], codasip_param_0[14], codasip_param_0[6:0]} == 19'h68053) || ({codasip_param_0[31:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h1a0253)) || ({codasip_param_0[31:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h1a03d3)) ? 1'b1 : 1'b0;
    assign cs_357_wire = ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h380053) ? 1'b1 : 1'b0;
    assign cs_359_wire = ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h3800d3) ? 1'b1 : 1'b0;
    assign cs_361_wire = ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h3c0053) ? 1'b1 : 1'b0;
    assign cs_363_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h00f) ? 1'b1 : 1'b0;
    assign cs_364_wire = (codasip_param_0[27:24] == 4'h0) ? 1'b1 : 1'b0;
    assign cs_365_wire = (codasip_param_0[27:24] == 4'h1) ? 1'b1 : 1'b0;
    assign cs_366_wire = (codasip_param_0[27:24] == 4'h2) ? 1'b1 : 1'b0;
    assign cs_367_wire = (codasip_param_0[27:24] == 4'h3) ? 1'b1 : 1'b0;
    assign cs_368_wire = (codasip_param_0[27:24] == 4'h4) ? 1'b1 : 1'b0;
    assign cs_369_wire = (codasip_param_0[27:24] == 4'h5) ? 1'b1 : 1'b0;
    assign cs_370_wire = (codasip_param_0[27:24] == 4'h6) ? 1'b1 : 1'b0;
    assign cs_371_wire = (codasip_param_0[27:24] == 4'h7) ? 1'b1 : 1'b0;
    assign cs_372_wire = (codasip_param_0[27:24] == 4'h8) ? 1'b1 : 1'b0;
    assign cs_373_wire = (codasip_param_0[27:24] == 4'h9) ? 1'b1 : 1'b0;
    assign cs_374_wire = (codasip_param_0[27:24] == 4'ha) ? 1'b1 : 1'b0;
    assign cs_375_wire = (codasip_param_0[27:24] == 4'hb) ? 1'b1 : 1'b0;
    assign cs_376_wire = (codasip_param_0[27:24] == 4'hc) ? 1'b1 : 1'b0;
    assign cs_377_wire = (codasip_param_0[27:24] == 4'hd) ? 1'b1 : 1'b0;
    assign cs_378_wire = (codasip_param_0[27:24] == 4'he) ? 1'b1 : 1'b0;
    assign cs_379_wire = (codasip_param_0[27:24] == 4'hf) ? 1'b1 : 1'b0;
    assign cs_380_wire = (codasip_param_0[23:20] == 4'h0) ? 1'b1 : 1'b0;
    assign cs_381_wire = (codasip_param_0[23:20] == 4'h1) ? 1'b1 : 1'b0;
    assign cs_382_wire = (codasip_param_0[23:20] == 4'h2) ? 1'b1 : 1'b0;
    assign cs_383_wire = (codasip_param_0[23:20] == 4'h3) ? 1'b1 : 1'b0;
    assign cs_384_wire = (codasip_param_0[23:20] == 4'h4) ? 1'b1 : 1'b0;
    assign cs_385_wire = (codasip_param_0[23:20] == 4'h5) ? 1'b1 : 1'b0;
    assign cs_386_wire = (codasip_param_0[23:20] == 4'h6) ? 1'b1 : 1'b0;
    assign cs_387_wire = (codasip_param_0[23:20] == 4'h7) ? 1'b1 : 1'b0;
    assign cs_388_wire = (codasip_param_0[23:20] == 4'h8) ? 1'b1 : 1'b0;
    assign cs_389_wire = (codasip_param_0[23:20] == 4'h9) ? 1'b1 : 1'b0;
    assign cs_390_wire = (codasip_param_0[23:20] == 4'ha) ? 1'b1 : 1'b0;
    assign cs_391_wire = (codasip_param_0[23:20] == 4'hb) ? 1'b1 : 1'b0;
    assign cs_392_wire = (codasip_param_0[23:20] == 4'hc) ? 1'b1 : 1'b0;
    assign cs_393_wire = (codasip_param_0[23:20] == 4'hd) ? 1'b1 : 1'b0;
    assign cs_394_wire = (codasip_param_0[23:20] == 4'he) ? 1'b1 : 1'b0;
    assign cs_395_wire = (codasip_param_0[23:20] == 4'hf) ? 1'b1 : 1'b0;
    assign cs_396_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h08f) ? 1'b1 : 1'b0;
    assign cs_397_wire = ((({codasip_param_0[26:25], codasip_param_0[14], codasip_param_0[6:4], codasip_param_0[1:0]} == 8'h13) || ({codasip_param_0[26:25], codasip_param_0[14:12], codasip_param_0[6:4], codasip_param_0[1:0]} == 10'h093)) || ({codasip_param_0[26:25], codasip_param_0[14:12], codasip_param_0[6:4], codasip_param_0[1:0]} == 10'h0f3)) ? 1'b1 : 1'b0;
    assign cs_398_wire = ({codasip_param_0[6:4], codasip_param_0[1:0]} == 5'h13) ? 1'b1 : 1'b0;
    assign cs_399_wire = (codasip_param_0[6:0] == 7'h43) ? 1'b1 : 1'b0;
    assign cs_3_wire = ({codasip_param_0[15:11], codasip_param_0[1:0]} == 7'h41) ? 1'b1 : 1'b0;
    assign cs_400_wire = (codasip_param_0[6:0] == 7'h47) ? 1'b1 : 1'b0;
    assign cs_401_wire = (codasip_param_0[6:0] == 7'h4b) ? 1'b1 : 1'b0;
    assign cs_402_wire = (codasip_param_0[6:0] == 7'h4f) ? 1'b1 : 1'b0;
    assign cs_403_wire = (((((((({codasip_param_0[15:5], codasip_param_0[1:0]} == 13'h0008) || ({codasip_param_0[15:7], codasip_param_0[5], codasip_param_0[1:0]} == 12'h004)) || ({codasip_param_0[15:7], codasip_param_0[1:0]} == 11'h040)) || ({codasip_param_0[15:12], codasip_param_0[10:7], codasip_param_0[1:0]} == 10'h040)) || ({codasip_param_0[15:13], codasip_param_0[10:7], codasip_param_0[1:0]} == 9'h004)) || ({codasip_param_0[15:13], codasip_param_0[10:8], codasip_param_0[1:0]} == 8'h04)) || ({codasip_param_0[15:13], codasip_param_0[10:9], codasip_param_0[1:0]} == 7'h04)) || ({codasip_param_0[15:13], codasip_param_0[10], codasip_param_0[1:0]} == 6'h04)) ? 1'b1 : 1'b0;
    assign cs_405_wire = ((((((((codasip_param_0[12:5] == 8'h02) || ({codasip_param_0[12:7], codasip_param_0[5]} == 7'h01)) || (codasip_param_0[12:7] == 6'h10)) || ({codasip_param_0[12], codasip_param_0[10:7]} == 5'h10)) || (codasip_param_0[10:7] == 4'h1)) || (codasip_param_0[10:8] == 3'h1)) || (codasip_param_0[10:9] == 2'h1)) || (codasip_param_0[10] == 1'b1)) ? 1'b1 : 1'b0;
    assign cs_406_wire = ((((({codasip_param_0[15:13], codasip_param_0[11:7], codasip_param_0[1:0]} == 10'h106) || ({codasip_param_0[15:13], codasip_param_0[11:8], codasip_param_0[1:0]} == 9'h086)) || ({codasip_param_0[15:13], codasip_param_0[11:9], codasip_param_0[1:0]} == 8'h46)) || ({codasip_param_0[15:13], codasip_param_0[11:10], codasip_param_0[1:0]} == 7'h26)) || ({codasip_param_0[15:13], codasip_param_0[11], codasip_param_0[1:0]} == 6'h16)) ? 1'b1 : 1'b0;
    assign cs_408_wire = (((((codasip_param_0[11:7] == 5'h01) || (codasip_param_0[11:8] == 4'h1)) || (codasip_param_0[11:9] == 3'h1)) || (codasip_param_0[11:10] == 2'h1)) || (codasip_param_0[11] == 1'b1)) ? 1'b1 : 1'b0;
    assign cs_409_wire = ((((((((((((((((((((((((((((((codasip_param_0[15:0] == 16'h6005) || ({codasip_param_0[15:3], codasip_param_0[1:0]} == 15'h3005)) || ({codasip_param_0[15:4], codasip_param_0[1:0]} == 14'h1805)) || ({codasip_param_0[15:5], codasip_param_0[1:0]} == 13'h0c05)) || ({codasip_param_0[15:6], codasip_param_0[1:0]} == 12'h605)) || ({codasip_param_0[15:9], codasip_param_0[7:0]} == 15'h3085)) || ({codasip_param_0[15:9], codasip_param_0[7:3], codasip_param_0[1:0]} == 14'h1845)) || ({codasip_param_0[15:9], codasip_param_0[7:4], codasip_param_0[1:0]} == 13'h0c25)) || ({codasip_param_0[15:9], codasip_param_0[7:5], codasip_param_0[1:0]} == 12'h615)) || ({codasip_param_0[15:9], codasip_param_0[7:6], codasip_param_0[1:0]} == 11'h30d)) || ({codasip_param_0[15:9], codasip_param_0[6:0]} == 14'h1885)) || ({codasip_param_0[15:9], codasip_param_0[6:3], codasip_param_0[1:0]} == 13'h0c45)) || ({codasip_param_0[15:9], codasip_param_0[6:4], codasip_param_0[1:0]} == 12'h625)) || ({codasip_param_0[15:9], codasip_param_0[6:5], codasip_param_0[1:0]} == 11'h315)) || ({codasip_param_0[15:9], codasip_param_0[6], codasip_param_0[1:0]} == 10'h18d)) || ({codasip_param_0[15:10], codasip_param_0[6:0]} == 13'h0c85)) || ({codasip_param_0[15:10], codasip_param_0[6:3], codasip_param_0[1:0]} == 12'h645)) || ({codasip_param_0[15:10], codasip_param_0[6:4], codasip_param_0[1:0]} == 11'h325)) || ({codasip_param_0[15:10], codasip_param_0[6:5], codasip_param_0[1:0]} == 10'h195)) || ({codasip_param_0[15:10], codasip_param_0[6], codasip_param_0[1:0]} == 9'h0cd)) || ({codasip_param_0[15:11], codasip_param_0[6:0]} == 12'h685)) || ({codasip_param_0[15:11], codasip_param_0[6:3], codasip_param_0[1:0]} == 11'h345)) || ({codasip_param_0[15:11], codasip_param_0[6:4], codasip_param_0[1:0]} == 10'h1a5)) || ({codasip_param_0[15:11], codasip_param_0[6:5], codasip_param_0[1:0]} == 9'h0d5)) || ({codasip_param_0[15:11], codasip_param_0[6], codasip_param_0[1:0]} == 8'h6d)) || ({codasip_param_0[15:7], codasip_param_0[1:0]} == 11'h381)) || ({codasip_param_0[15:9], codasip_param_0[7], codasip_param_0[1:0]} == 10'h1c5)) || ({codasip_param_0[15:9], codasip_param_0[1:0]} == 9'h0e5)) || ({codasip_param_0[15:10], codasip_param_0[1:0]} == 8'h75)) || ({codasip_param_0[15:11], codasip_param_0[1:0]} == 7'h3d)) ? 1'b1 : 1'b0;
    assign cs_411_wire = (((((({codasip_param_0[12], codasip_param_0[6:2]} == 6'h01) || ({codasip_param_0[12], codasip_param_0[6:3]} == 5'h01)) || ({codasip_param_0[12], codasip_param_0[6:4]} == 4'h1)) || ({codasip_param_0[12], codasip_param_0[6:5]} == 3'h1)) || ({codasip_param_0[12], codasip_param_0[6]} == 2'h1)) || (codasip_param_0[12] == 1'b1)) ? 1'b1 : 1'b0;
    assign cs_412_wire = (((((codasip_param_0[11:7] == 5'h00) || ({codasip_param_0[11:9], codasip_param_0[7]} == 4'h1)) || (codasip_param_0[11:9] == 3'h1)) || (codasip_param_0[11:10] == 2'h1)) || (codasip_param_0[11] == 1'b1)) ? 1'b1 : 1'b0;
    assign cs_413_wire = ((((((codasip_param_0[15:0] == 16'h6105) || ({codasip_param_0[15:3], codasip_param_0[1:0]} == 15'h3085)) || ({codasip_param_0[15:4], codasip_param_0[1:0]} == 14'h1845)) || ({codasip_param_0[15:5], codasip_param_0[1:0]} == 13'h0c25)) || ({codasip_param_0[15:6], codasip_param_0[1:0]} == 12'h615)) || ({codasip_param_0[15:7], codasip_param_0[1:0]} == 11'h389)) ? 1'b1 : 1'b0;
    assign cs_414_wire = ((((({codasip_param_0[15:13], codasip_param_0[11:7], codasip_param_0[1:0]} == 10'h005) || ({codasip_param_0[15:13], codasip_param_0[11:8], codasip_param_0[1:0]} == 9'h005)) || ({codasip_param_0[15:13], codasip_param_0[11:9], codasip_param_0[1:0]} == 8'h05)) || ({codasip_param_0[15:13], codasip_param_0[11:10], codasip_param_0[1:0]} == 7'h05)) || ({codasip_param_0[15:13], codasip_param_0[11], codasip_param_0[1:0]} == 6'h05)) ? 1'b1 : 1'b0;
    assign cs_418_wire = ({codasip_param_0[15:13], codasip_param_0[1:0]} == 5'h09) ? 1'b1 : 1'b0;
    assign cs_419_wire = (codasip_param_0[15:0] == 16'h9002) ? 1'b1 : 1'b0;
    assign cs_420_wire = ({codasip_param_0[15:12], codasip_param_0[1:0]} == 6'h26) ? 1'b1 : 1'b0;
    assign cs_421_wire = ((((({codasip_param_0[15:13], codasip_param_0[11:0]} == 15'h4082) || ({codasip_param_0[15:13], codasip_param_0[11:8], codasip_param_0[6:0]} == 14'h2082)) || ({codasip_param_0[15:13], codasip_param_0[11:9], codasip_param_0[6:0]} == 13'h1082)) || ({codasip_param_0[15:13], codasip_param_0[11:10], codasip_param_0[6:0]} == 12'h882)) || ({codasip_param_0[15:13], codasip_param_0[11], codasip_param_0[6:0]} == 11'h482)) ? 1'b1 : 1'b0;
    assign cs_422_wire = ({codasip_param_0[15:13], codasip_param_0[1:0]} == 5'h12) ? 1'b1 : 1'b0;
    assign cs_423_wire = ({codasip_param_0[15:12], codasip_param_0[1:0]} == 6'h22) ? 1'b1 : 1'b0;
    assign cs_424_wire = ((((({codasip_param_0[15:13], codasip_param_0[6:0]} == 10'h206) || ({codasip_param_0[15:13], codasip_param_0[6:3], codasip_param_0[1:0]} == 9'h106)) || ({codasip_param_0[15:13], codasip_param_0[6:4], codasip_param_0[1:0]} == 8'h86)) || ({codasip_param_0[15:13], codasip_param_0[6:5], codasip_param_0[1:0]} == 7'h46)) || ({codasip_param_0[15:13], codasip_param_0[6], codasip_param_0[1:0]} == 6'h26)) ? 1'b1 : 1'b0;
    assign cs_425_wire = (((((codasip_param_0[6:2] == 5'h01) || (codasip_param_0[6:3] == 4'h1)) || (codasip_param_0[6:4] == 3'h1)) || (codasip_param_0[6:5] == 2'h1)) || (codasip_param_0[6] == 1'b1)) ? 1'b1 : 1'b0;
    assign cs_426_wire = ({codasip_param_0[15:13], codasip_param_0[1:0]} == 5'h1a) ? 1'b1 : 1'b0;
    assign cs_427_wire = ({codasip_param_0[15:14], codasip_param_0[1:0]} == 4'hd) ? 1'b1 : 1'b0;
    assign cs_428_wire = ({codasip_param_0[15:13], codasip_param_0[1:0]} == 5'h19) ? 1'b1 : 1'b0;
    assign cs_429_wire = ({codasip_param_0[15:13], codasip_param_0[1:0]} == 5'h1d) ? 1'b1 : 1'b0;
    assign cs_430_wire = ({codasip_param_0[14:13], codasip_param_0[1:0]} == 4'h5) ? 1'b1 : 1'b0;
    assign cs_431_wire = ({codasip_param_0[15:13], codasip_param_0[1:0]} == 5'h05) ? 1'b1 : 1'b0;
    assign cs_432_wire = ({codasip_param_0[15:13], codasip_param_0[1:0]} == 5'h15) ? 1'b1 : 1'b0;
    assign cs_433_wire = ({codasip_param_0[14:13], codasip_param_0[1:0]} == 4'h8) ? 1'b1 : 1'b0;
    assign cs_434_wire = ({codasip_param_0[15:13], codasip_param_0[1:0]} == 5'h08) ? 1'b1 : 1'b0;
    assign cs_435_wire = ({codasip_param_0[15:13], codasip_param_0[1:0]} == 5'h18) ? 1'b1 : 1'b0;
    assign cs_436_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h067) ? 1'b1 : 1'b0;
    assign cs_437_wire = (({codasip_param_0[14:13], codasip_param_0[6:0]} == 9'h023) || ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h123)) ? 1'b1 : 1'b0;
    assign cs_438_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h023) ? 1'b1 : 1'b0;
    assign cs_439_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h0a3) ? 1'b1 : 1'b0;
    assign cs_440_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h123) ? 1'b1 : 1'b0;
    assign cs_441_wire = (({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h103) || ({codasip_param_0[13], codasip_param_0[6:0]} == 8'h03)) ? 1'b1 : 1'b0;
    assign cs_442_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h103) ? 1'b1 : 1'b0;
    assign cs_443_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h003) ? 1'b1 : 1'b0;
    assign cs_444_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h083) ? 1'b1 : 1'b0;
    assign cs_445_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h203) ? 1'b1 : 1'b0;
    assign cs_446_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h283) ? 1'b1 : 1'b0;
    assign cs_447_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h107) ? 1'b1 : 1'b0;
    assign cs_448_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h127) ? 1'b1 : 1'b0;
    assign cs_449_wire = (({codasip_param_0[14:13], codasip_param_0[6:0]} == 9'h1e3) || ({codasip_param_0[13], codasip_param_0[6:0]} == 8'h63)) ? 1'b1 : 1'b0;
    assign cs_450_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h363) ? 1'b1 : 1'b0;
    assign cs_451_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h3e3) ? 1'b1 : 1'b0;
    assign cs_452_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h063) ? 1'b1 : 1'b0;
    assign cs_453_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h0e3) ? 1'b1 : 1'b0;
    assign cs_454_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h263) ? 1'b1 : 1'b0;
    assign cs_455_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h2e3) ? 1'b1 : 1'b0;
    assign cs_456_wire = (({codasip_param_0[13:12], codasip_param_0[6:0]} == 9'h193) || ({codasip_param_0[12], codasip_param_0[6:0]} == 8'h13)) ? 1'b1 : 1'b0;
    assign cs_457_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h193) ? 1'b1 : 1'b0;
    assign cs_458_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h393) ? 1'b1 : 1'b0;
    assign cs_459_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h013) ? 1'b1 : 1'b0;
    assign cs_460_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h113) ? 1'b1 : 1'b0;
    assign cs_461_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h213) ? 1'b1 : 1'b0;
    assign cs_462_wire = ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h313) ? 1'b1 : 1'b0;
    assign cs_463_wire = (codasip_param_0[6:0] == 7'h17) ? 1'b1 : 1'b0;
    assign cs_464_wire = (codasip_param_0[6:0] == 7'h37) ? 1'b1 : 1'b0;
    assign cs_465_wire = (codasip_param_0[6:0] == 7'h6f) ? 1'b1 : 1'b0;
    assign cs_4_wire = ({codasip_param_0[15:13], codasip_param_0[11], codasip_param_0[1:0]} == 6'h21) ? 1'b1 : 1'b0;
    assign cs_5_wire = ({codasip_param_0[15:13], codasip_param_0[11:10], codasip_param_0[1:0]} == 7'h41) ? 1'b1 : 1'b0;
    assign cs_6_wire = ({codasip_param_0[15:13], codasip_param_0[11:10], codasip_param_0[1:0]} == 7'h45) ? 1'b1 : 1'b0;
    assign cs_7_wire = ({codasip_param_0[15:10], codasip_param_0[1:0]} == 8'h8d) ? 1'b1 : 1'b0;
    assign cs_8_wire = ({codasip_param_0[15:10], codasip_param_0[6:5], codasip_param_0[1:0]} == 10'h231) ? 1'b1 : 1'b0;
    assign cs_9_wire = ({codasip_param_0[15:10], codasip_param_0[6:5], codasip_param_0[1:0]} == 10'h235) ? 1'b1 : 1'b0;
    assign invalid_instruction_wire = ((ACT == 1'b1) && ((vs_1_wire || vs_0_wire) == 1'b0)) ? 1'b1 : 1'b0;
    assign vs_0_wire = (({codasip_param_0[15:13], codasip_param_0[1:0]} == 5'h1e) || (({codasip_param_0[15:13], codasip_param_0[1:0]} == 5'h0e) || (({codasip_param_0[14:13], codasip_param_0[1:0]} == 4'hc) || (({codasip_param_0[15:13], codasip_param_0[11:10], codasip_param_0[1:0]} == 7'h49) || (({codasip_param_0[15:10], codasip_param_0[1:0]} == 8'h8d) || (({codasip_param_0[15:11], codasip_param_0[1:0]} == 7'h41) || ({codasip_param_0[15:12], codasip_param_0[1:0]} == 6'h02))))))) ? 1'b1 : 1'b0;
    assign vs_1_wire = ((codasip_param_0[6:0] == 7'h6f) || ((codasip_param_0[6:0] == 7'h37) || ((codasip_param_0[6:0] == 7'h17) || ((({codasip_param_0[13:12], codasip_param_0[6:0]} == 9'h193) || ({codasip_param_0[12], codasip_param_0[6:0]} == 8'h13)) || ((({codasip_param_0[14:13], codasip_param_0[6:0]} == 9'h1e3) || ({codasip_param_0[13], codasip_param_0[6:0]} == 8'h63)) || (({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h127) || (({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h107) || ((({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h103) || ({codasip_param_0[13], codasip_param_0[6:0]} == 8'h03)) || ((({codasip_param_0[14:13], codasip_param_0[6:0]} == 9'h023) || ({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h123)) || (({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h067) || (({codasip_param_0[14:13], codasip_param_0[1:0]} == 4'h8) || (({codasip_param_0[14:13], codasip_param_0[1:0]} == 4'h5) || (({codasip_param_0[15:14], codasip_param_0[1:0]} == 4'hd) || (({codasip_param_0[15:13], codasip_param_0[1:0]} == 5'h1a) || (((((({codasip_param_0[15:13], codasip_param_0[6:0]} == 10'h206) || ({codasip_param_0[15:13], codasip_param_0[6:3], codasip_param_0[1:0]} == 9'h106)) || ({codasip_param_0[15:13], codasip_param_0[6:4], codasip_param_0[1:0]} == 8'h86)) || ({codasip_param_0[15:13], codasip_param_0[6:5], codasip_param_0[1:0]} == 7'h46)) || ({codasip_param_0[15:13], codasip_param_0[6], codasip_param_0[1:0]} == 6'h26)) || (((((({codasip_param_0[15:13], codasip_param_0[11:0]} == 15'h4082) || ({codasip_param_0[15:13], codasip_param_0[11:8], codasip_param_0[6:0]} == 14'h2082)) || ({codasip_param_0[15:13], codasip_param_0[11:9], codasip_param_0[6:0]} == 13'h1082)) || ({codasip_param_0[15:13], codasip_param_0[11:10], codasip_param_0[6:0]} == 12'h882)) || ({codasip_param_0[15:13], codasip_param_0[11], codasip_param_0[6:0]} == 11'h482)) || ((codasip_param_0[15:0] == 16'h9002) || (({codasip_param_0[15:13], codasip_param_0[1:0]} == 5'h09) || (({codasip_param_0[15:13], codasip_param_0[11:7], codasip_param_0[1:0]} == 10'h001) || (((((({codasip_param_0[15:13], codasip_param_0[11:7], codasip_param_0[1:0]} == 10'h005) || ({codasip_param_0[15:13], codasip_param_0[11:8], codasip_param_0[1:0]} == 9'h005)) || ({codasip_param_0[15:13], codasip_param_0[11:9], codasip_param_0[1:0]} == 8'h05)) || ({codasip_param_0[15:13], codasip_param_0[11:10], codasip_param_0[1:0]} == 7'h05)) || ({codasip_param_0[15:13], codasip_param_0[11], codasip_param_0[1:0]} == 6'h05)) || (((((((codasip_param_0[15:0] == 16'h6105) || ({codasip_param_0[15:3], codasip_param_0[1:0]} == 15'h3085)) || ({codasip_param_0[15:4], codasip_param_0[1:0]} == 14'h1845)) || ({codasip_param_0[15:5], codasip_param_0[1:0]} == 13'h0c25)) || ({codasip_param_0[15:6], codasip_param_0[1:0]} == 12'h615)) || ({codasip_param_0[15:7], codasip_param_0[1:0]} == 11'h389)) || (((((((((((((((((((((((((((((((codasip_param_0[15:0] == 16'h6005) || ({codasip_param_0[15:3], codasip_param_0[1:0]} == 15'h3005)) || ({codasip_param_0[15:4], codasip_param_0[1:0]} == 14'h1805)) || ({codasip_param_0[15:5], codasip_param_0[1:0]} == 13'h0c05)) || ({codasip_param_0[15:6], codasip_param_0[1:0]} == 12'h605)) || ({codasip_param_0[15:9], codasip_param_0[7:0]} == 15'h3085)) || ({codasip_param_0[15:9], codasip_param_0[7:3], codasip_param_0[1:0]} == 14'h1845)) || ({codasip_param_0[15:9], codasip_param_0[7:4], codasip_param_0[1:0]} == 13'h0c25)) || ({codasip_param_0[15:9], codasip_param_0[7:5], codasip_param_0[1:0]} == 12'h615)) || ({codasip_param_0[15:9], codasip_param_0[7:6], codasip_param_0[1:0]} == 11'h30d)) || ({codasip_param_0[15:9], codasip_param_0[6:0]} == 14'h1885)) || ({codasip_param_0[15:9], codasip_param_0[6:3], codasip_param_0[1:0]} == 13'h0c45)) || ({codasip_param_0[15:9], codasip_param_0[6:4], codasip_param_0[1:0]} == 12'h625)) || ({codasip_param_0[15:9], codasip_param_0[6:5], codasip_param_0[1:0]} == 11'h315)) || ({codasip_param_0[15:9], codasip_param_0[6], codasip_param_0[1:0]} == 10'h18d)) || ({codasip_param_0[15:10], codasip_param_0[6:0]} == 13'h0c85)) || ({codasip_param_0[15:10], codasip_param_0[6:3], codasip_param_0[1:0]} == 12'h645)) || ({codasip_param_0[15:10], codasip_param_0[6:4], codasip_param_0[1:0]} == 11'h325)) || ({codasip_param_0[15:10], codasip_param_0[6:5], codasip_param_0[1:0]} == 10'h195)) || ({codasip_param_0[15:10], codasip_param_0[6], codasip_param_0[1:0]} == 9'h0cd)) || ({codasip_param_0[15:11], codasip_param_0[6:0]} == 12'h685)) || ({codasip_param_0[15:11], codasip_param_0[6:3], codasip_param_0[1:0]} == 11'h345)) || ({codasip_param_0[15:11], codasip_param_0[6:4], codasip_param_0[1:0]} == 10'h1a5)) || ({codasip_param_0[15:11], codasip_param_0[6:5], codasip_param_0[1:0]} == 9'h0d5)) || ({codasip_param_0[15:11], codasip_param_0[6], codasip_param_0[1:0]} == 8'h6d)) || ({codasip_param_0[15:7], codasip_param_0[1:0]} == 11'h381)) || ({codasip_param_0[15:9], codasip_param_0[7], codasip_param_0[1:0]} == 10'h1c5)) || ({codasip_param_0[15:9], codasip_param_0[1:0]} == 9'h0e5)) || ({codasip_param_0[15:10], codasip_param_0[1:0]} == 8'h75)) || ({codasip_param_0[15:11], codasip_param_0[1:0]} == 7'h3d)) || (((((({codasip_param_0[15:13], codasip_param_0[11:7], codasip_param_0[1:0]} == 10'h106) || ({codasip_param_0[15:13], codasip_param_0[11:8], codasip_param_0[1:0]} == 9'h086)) || ({codasip_param_0[15:13], codasip_param_0[11:9], codasip_param_0[1:0]} == 8'h46)) || ({codasip_param_0[15:13], codasip_param_0[11:10], codasip_param_0[1:0]} == 7'h26)) || ({codasip_param_0[15:13], codasip_param_0[11], codasip_param_0[1:0]} == 6'h16)) || ((((((((({codasip_param_0[15:5], codasip_param_0[1:0]} == 13'h0008) || ({codasip_param_0[15:7], codasip_param_0[5], codasip_param_0[1:0]} == 12'h004)) || ({codasip_param_0[15:7], codasip_param_0[1:0]} == 11'h040)) || ({codasip_param_0[15:12], codasip_param_0[10:7], codasip_param_0[1:0]} == 10'h040)) || ({codasip_param_0[15:13], codasip_param_0[10:7], codasip_param_0[1:0]} == 9'h004)) || ({codasip_param_0[15:13], codasip_param_0[10:8], codasip_param_0[1:0]} == 8'h04)) || ({codasip_param_0[15:13], codasip_param_0[10:9], codasip_param_0[1:0]} == 7'h04)) || ({codasip_param_0[15:13], codasip_param_0[10], codasip_param_0[1:0]} == 6'h04)) || (((({codasip_param_0[26:25], codasip_param_0[14], codasip_param_0[6:4], codasip_param_0[1:0]} == 8'h13) || ({codasip_param_0[26:25], codasip_param_0[14:12], codasip_param_0[6:4], codasip_param_0[1:0]} == 10'h093)) || ({codasip_param_0[26:25], codasip_param_0[14:12], codasip_param_0[6:4], codasip_param_0[1:0]} == 10'h0f3)) || (({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h08f) || (({codasip_param_0[14:12], codasip_param_0[6:0]} == 10'h00f) || (({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h3c0053) || (({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h3800d3) || (({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h380053) || (((({codasip_param_0[31:21], codasip_param_0[14], codasip_param_0[6:0]} == 19'h68053) || ({codasip_param_0[31:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h1a0253)) || ({codasip_param_0[31:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h1a03d3)) || (((({codasip_param_0[31:21], codasip_param_0[14], codasip_param_0[6:0]} == 19'h60053) || ({codasip_param_0[31:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h180253)) || ({codasip_param_0[31:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h1803d3)) || ((({codasip_param_0[31:25], codasip_param_0[14:13], codasip_param_0[6:0]} == 16'ha053) || ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h14153)) || (((({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[6:0]} == 20'h58053) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h160253)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1603d3)) || (((({codasip_param_0[31:25], codasip_param_0[13:12], codasip_param_0[6:0]} == 16'h4893) || ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h0c293)) || ({codasip_param_0[31], codasip_param_0[29:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 16'h5093)) || ((codasip_param_0 == 32'h30200073) || (({codasip_param_0[31:25], codasip_param_0[14:13], codasip_param_0[6:0]} == 16'h2853) || ((({codasip_param_0[31:25], codasip_param_0[14:13], codasip_param_0[6:0]} == 16'h2053) || ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h04153)) || (((({codasip_param_0[31:29], codasip_param_0[26:25], codasip_param_0[14], codasip_param_0[6:0]} == 13'h0053) || ({codasip_param_0[31:29], codasip_param_0[26:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 15'h0253)) || ({codasip_param_0[31:29], codasip_param_0[26:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 15'h03d3)) || ((codasip_param_0 == 32'h10500073) || ((((((((((({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h01533) || ({codasip_param_0[31:25], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 16'h0ab3)) || ({codasip_param_0[31:25], codasip_param_0[14], codasip_param_0[6:0]} == 15'h05b3)) || ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h04233)) || ({codasip_param_0[31:25], codasip_param_0[13:12], codasip_param_0[6:0]} == 16'h2133)) || ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h083b3)) || ({codasip_param_0[31:25], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 16'h4133)) || ({codasip_param_0[31:25], codasip_param_0[13:12], codasip_param_0[6:0]} == 16'h48b3)) || ({codasip_param_0[31:25], codasip_param_0[13:12], codasip_param_0[6:0]} == 16'h60b3)) || ({codasip_param_0[31], codasip_param_0[29:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 16'h50b3)) || (((((({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h020233) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h0a1e93)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h180893)) || ({codasip_param_0[31:23], codasip_param_0[21], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h60093)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1a6293)) || (((({codasip_param_0[31:26], codasip_param_0[6:0]} == 13'h0033) || ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h08033)) || ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h082b3)) || ((({codasip_param_0[31:25], codasip_param_0[13:12], codasip_param_0[6:0]} == 16'h0093) || ({codasip_param_0[31:25], codasip_param_0[14:12], codasip_param_0[6:0]} == 17'h08293)) || ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h000b73) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0005f3)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h000773)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h003f3)) || ({codasip_param_0[31:23], codasip_param_0[21], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h30373)) || ({codasip_param_0[31:23], codasip_param_0[21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h181f3)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h064373)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h321f3)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h064f73)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h327f3)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h065b73)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h32df3)) || ({codasip_param_0[31:24], codasip_param_0[22:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h065773)) || ({codasip_param_0[31:24], codasip_param_0[22:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h32bf3)) || ({codasip_param_0[31:23], codasip_param_0[14:12], codasip_param_0[6:0]} == 19'h19b73)) || ({codasip_param_0[31:23], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 18'h0cdf3)) || ({codasip_param_0[31:25], codasip_param_0[23:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 19'h19b73)) || ({codasip_param_0[31:25], codasip_param_0[23:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 18'h0cdf3)) || ({codasip_param_0[31:25], codasip_param_0[23:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h067f73)) || ({codasip_param_0[31:25], codasip_param_0[23:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h33ff3)) || ({codasip_param_0[31:26], codasip_param_0[24:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h061b73)) || ({codasip_param_0[31:26], codasip_param_0[24:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h30df3)) || ({codasip_param_0[31:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h34373)) || ({codasip_param_0[31:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h1a1f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h0d1373)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0689f3)) || ({codasip_param_0[31:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h3b773)) || ({codasip_param_0[31:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h1dbf3)) || ({codasip_param_0[31:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h3bb73)) || ({codasip_param_0[31:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h1ddf3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h0eff73)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h077ff3)) || ({codasip_param_0[31:25], codasip_param_0[23:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 19'h1d373)) || ({codasip_param_0[31:25], codasip_param_0[23:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 18'h0e9f3)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h37b73)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h1bdf3)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h06fb73)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h37df3)) || ({codasip_param_0[31:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h7a373)) || ({codasip_param_0[31:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h3d1f3)) || ({codasip_param_0[31:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h0f4b73)) || ({codasip_param_0[31:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7a5f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1ea373)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0f51f3)) || ({codasip_param_0[31:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h0f6373)) || ({codasip_param_0[31:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7b1f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1f1f73)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0f8ff3)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h0f8773)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7c3f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1f2373)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0f91f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1f2f73)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0f97f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1f3773)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0f9bf3)) || ({codasip_param_0[31:24], codasip_param_0[22:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h0f8b73)) || ({codasip_param_0[31:24], codasip_param_0[22:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7c5f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1f4373)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0fa1f3)) || ({codasip_param_0[31:25], codasip_param_0[23:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h0f9373)) || ({codasip_param_0[31:25], codasip_param_0[23:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7c9f3)) || ({codasip_param_0[31:28], codasip_param_0[26:22], codasip_param_0[20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hb0373)) || ({codasip_param_0[31:28], codasip_param_0[26:22], codasip_param_0[20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h581f3)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[21:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hb0f73)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[21:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h587f3)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 19'h58b73)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 18'h2c5f3)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hb1b73)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h58df3)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[14:12], codasip_param_0[6:0]} == 18'h2cb73)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 17'h165f3)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hb3b73)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h59df3)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h167b73)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'hb3df3)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 18'h2cb73)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 17'h165f3)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hb3f73)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h59ff3)) || ({codasip_param_0[31:28], codasip_param_0[26:22], codasip_param_0[20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hc0373)) || ({codasip_param_0[31:28], codasip_param_0[26:22], codasip_param_0[20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h601f3)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[21:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hc0f73)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[21:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h607f3)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 19'h60b73)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 18'h305f3)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hc1b73)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h60df3)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[14:12], codasip_param_0[6:0]} == 18'h30b73)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 17'h185f3)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hc3b73)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h61df3)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h187b73)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'hc3df3)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 18'h30b73)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 17'h185f3)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hc3f73)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h61ff3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h3c4b73)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h1e25f3)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h1e2773)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'hf13f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h3c5373)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h1e29f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h3f0f73)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h1f87f3)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h1f8373)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'hfc1f3)) || ({codasip_param_0[31:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h1f8b73)) || ({codasip_param_0[31:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'hfc5f3)) || ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h000973) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0004f3)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h000573)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h002f3)) || ({codasip_param_0[31:23], codasip_param_0[21], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h30173)) || ({codasip_param_0[31:23], codasip_param_0[21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h180f3)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h064173)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h320f3)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h064d73)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h326f3)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h065973)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h32cf3)) || ({codasip_param_0[31:24], codasip_param_0[22:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h065573)) || ({codasip_param_0[31:24], codasip_param_0[22:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h32af3)) || ({codasip_param_0[31:23], codasip_param_0[14:12], codasip_param_0[6:0]} == 19'h19973)) || ({codasip_param_0[31:23], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 18'h0ccf3)) || ({codasip_param_0[31:25], codasip_param_0[23:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 19'h19973)) || ({codasip_param_0[31:25], codasip_param_0[23:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 18'h0ccf3)) || ({codasip_param_0[31:25], codasip_param_0[23:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h067d73)) || ({codasip_param_0[31:25], codasip_param_0[23:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h33ef3)) || ({codasip_param_0[31:26], codasip_param_0[24:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h061973)) || ({codasip_param_0[31:26], codasip_param_0[24:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h30cf3)) || ({codasip_param_0[31:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h34173)) || ({codasip_param_0[31:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h1a0f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h0d1173)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0688f3)) || ({codasip_param_0[31:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h3b573)) || ({codasip_param_0[31:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h1daf3)) || ({codasip_param_0[31:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h3b973)) || ({codasip_param_0[31:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h1dcf3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h0efd73)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h077ef3)) || ({codasip_param_0[31:25], codasip_param_0[23:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 19'h1d173)) || ({codasip_param_0[31:25], codasip_param_0[23:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 18'h0e8f3)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h37973)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h1bcf3)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h06f973)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h37cf3)) || ({codasip_param_0[31:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'h7a173)) || ({codasip_param_0[31:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h3d0f3)) || ({codasip_param_0[31:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h0f4973)) || ({codasip_param_0[31:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7a4f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1ea173)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0f50f3)) || ({codasip_param_0[31:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h0f6173)) || ({codasip_param_0[31:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7b0f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1f1d73)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0f8ef3)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h0f8573)) || ({codasip_param_0[31:23], codasip_param_0[21:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7c2f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1f2173)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0f90f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1f2d73)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0f96f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1f3573)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0f9af3)) || ({codasip_param_0[31:24], codasip_param_0[22:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h0f8973)) || ({codasip_param_0[31:24], codasip_param_0[22:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7c4f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h1f4173)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h0fa0f3)) || ({codasip_param_0[31:25], codasip_param_0[23:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h0f9173)) || ({codasip_param_0[31:25], codasip_param_0[23:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'h7c8f3)) || ({codasip_param_0[31:28], codasip_param_0[26:22], codasip_param_0[20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hb0173)) || ({codasip_param_0[31:28], codasip_param_0[26:22], codasip_param_0[20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h580f3)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[21:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hb0d73)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[21:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h586f3)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 19'h58973)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 18'h2c4f3)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hb1973)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h58cf3)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[14:12], codasip_param_0[6:0]} == 18'h2c973)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 17'h164f3)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hb3973)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h59cf3)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h167973)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'hb3cf3)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 18'h2c973)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 17'h164f3)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hb3d73)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h59ef3)) || ({codasip_param_0[31:28], codasip_param_0[26:22], codasip_param_0[20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hc0173)) || ({codasip_param_0[31:28], codasip_param_0[26:22], codasip_param_0[20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h600f3)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[21:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hc0d73)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[21:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h606f3)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 19'h60973)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 18'h304f3)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hc1973)) || ({codasip_param_0[31:28], codasip_param_0[26:24], codasip_param_0[22:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h60cf3)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[14:12], codasip_param_0[6:0]} == 18'h30973)) || ({codasip_param_0[31:28], codasip_param_0[26:23], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 17'h184f3)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hc3973)) || ({codasip_param_0[31:28], codasip_param_0[26:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h61cf3)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h187973)) || ({codasip_param_0[31:28], codasip_param_0[26:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'hc3cf3)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:22], codasip_param_0[14:12], codasip_param_0[6:0]} == 18'h30973)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:22], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 17'h184f3)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 20'hc3d73)) || ({codasip_param_0[31:28], codasip_param_0[26:25], codasip_param_0[23:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 19'h61ef3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h3c4973)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h1e24f3)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h1e2573)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'hf12f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h3c5173)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h1e28f3)) || ({codasip_param_0[31:20], codasip_param_0[14:12], codasip_param_0[6:0]} == 22'h3f0d73)) || ({codasip_param_0[31:20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 21'h1f86f3)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h1f8173)) || ({codasip_param_0[31:22], codasip_param_0[20], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'hfc0f3)) || ({codasip_param_0[31:21], codasip_param_0[14:12], codasip_param_0[6:0]} == 21'h1f8973)) || ({codasip_param_0[31:21], codasip_param_0[14], codasip_param_0[12], codasip_param_0[6:0]} == 20'hfc4f3)) || ((codasip_param_0 == 32'h00100073) || (codasip_param_0 == 32'h00000073)))))))))))))))))))))))))))))))))))))))))))))))) ? 1'b1 : 1'b0;
    assign opc_clmulh_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_284_wire == 1'b1)) && (cs_285_wire == 1'b1)) && (cs_288_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_clmulr_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_284_wire == 1'b1)) && (cs_285_wire == 1'b1)) && (cs_286_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_fnmadd_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_397_wire == 1'b1)) && (cs_398_wire == 1'b1)) && (cs_402_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_fnmsub_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_397_wire == 1'b1)) && (cs_398_wire == 1'b1)) && (cs_401_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_fsgnjn_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_325_wire == 1'b1)) && (cs_326_wire == 1'b1)) && (cs_328_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_fsgnjx_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_325_wire == 1'b1)) && (cs_326_wire == 1'b1)) && (cs_329_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_j_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_430_wire == 1'b1)) && (cs_432_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_loadbu_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_441_wire == 1'b1)) && (cs_445_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_loadhu_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_441_wire == 1'b1)) && (cs_446_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_mulhsu_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_254_wire == 1'b1)) && (cs_265_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_sh1add_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_284_wire == 1'b1)) && (cs_294_wire == 1'b1)) && (cs_296_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_sh2add_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_284_wire == 1'b1)) && (cs_294_wire == 1'b1)) && (cs_295_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_sh3add_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_284_wire == 1'b1)) && (cs_294_wire == 1'b1)) && (cs_297_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_storeb_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_437_wire == 1'b1)) && (cs_438_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_storeh_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_437_wire == 1'b1)) && (cs_439_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_storew_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_437_wire == 1'b1)) && (cs_440_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_i_fence_param1_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_388_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_i_fence_param2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_372_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_jr_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_421_wire == 1'b1)) && (cs_422_wire == 1'b1)) && (cs_423_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_mv_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_424_wire == 1'b1)) && (cs_422_wire == 1'b1)) && (cs_423_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_o_fence_param1_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_384_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_o_fence_param2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_368_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_or_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_0_wire == 1'b1) && (cs_7_wire == 1'b1)) && (cs_10_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_r_fence_param1_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_382_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_r_fence_param2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_366_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_w_fence_param1_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_381_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_w_fence_param2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_365_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_add_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_424_wire == 1'b1)) && (cs_422_wire == 1'b1)) && (cs_420_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_and_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_0_wire == 1'b1) && (cs_7_wire == 1'b1)) && (cs_11_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_io_fence_param1_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_392_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_io_fence_param2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_376_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_ir_fence_param1_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_390_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_ir_fence_param2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_374_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_iw_fence_param1_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_389_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_iw_fence_param2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_373_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_jal_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_430_wire == 1'b1)) && (cs_431_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_loadflsw_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_0_wire == 1'b1) && (cs_13_wire == 1'b1)) && (cs_14_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_loadwreg_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_433_wire == 1'b1)) && (cs_434_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_or_fence_param1_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_386_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_or_fence_param2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_370_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_ow_fence_param1_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_385_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_ow_fence_param2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_369_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_rw_fence_param1_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_383_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_rw_fence_param2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_367_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_sub_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_0_wire == 1'b1) && (cs_7_wire == 1'b1)) && (cs_8_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_xor_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_0_wire == 1'b1) && (cs_7_wire == 1'b1)) && (cs_9_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_beqz_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_427_wire == 1'b1)) && (cs_428_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_bnez_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_427_wire == 1'b1)) && (cs_429_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_ior_fence_param1_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_394_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_ior_fence_param2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_378_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_iow_fence_param1_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_393_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_iow_fence_param2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_377_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_irw_fence_param1_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_391_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_irw_fence_param2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_375_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_jalr_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_421_wire == 1'b1)) && (cs_422_wire == 1'b1)) && (cs_420_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_orw_fence_param1_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_387_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_orw_fence_param2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_371_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_srai_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_0_wire == 1'b1) && (cs_3_wire == 1'b1)) && (cs_4_wire == 1'b1)) && (cs_6_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_srli_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_0_wire == 1'b1) && (cs_3_wire == 1'b1)) && (cs_4_wire == 1'b1)) && (cs_5_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_storeflsw_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_0_wire == 1'b1) && (cs_13_wire == 1'b1)) && (cs_15_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_storewreg_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_433_wire == 1'b1)) && (cs_435_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_hint_fence_param1_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_380_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_hint_fence_param2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_364_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_iorw_fence_param1_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_395_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_iorw_fence_param2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1)) && (cs_379_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign fmt_w_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((((cs_18_wire == 1'b1) && (cs_350_wire == 1'b1)) && (cs_352_wire == 1'b1)) && (cs_353_wire == 1'b1)) || ((((cs_18_wire == 1'b1) && (cs_355_wire == 1'b1)) && (cs_352_wire == 1'b1)) && (cs_353_wire == 1'b1)))) ? 1'b1 : 1'b0;
    assign fmt_wu_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((((cs_18_wire == 1'b1) && (cs_350_wire == 1'b1)) && (cs_352_wire == 1'b1)) && (cs_354_wire == 1'b1)) || ((((cs_18_wire == 1'b1) && (cs_355_wire == 1'b1)) && (cs_352_wire == 1'b1)) && (cs_354_wire == 1'b1)))) ? 1'b1 : 1'b0;
    assign opc_or_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_254_wire == 1'b1)) && (cs_261_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_add_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_254_wire == 1'b1)) && (cs_255_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_and_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_254_wire == 1'b1)) && (cs_262_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_beq_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_449_wire == 1'b1)) && (cs_452_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_bge_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_449_wire == 1'b1)) && (cs_455_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_blt_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_449_wire == 1'b1)) && (cs_454_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_bne_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_449_wire == 1'b1)) && (cs_453_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_clz_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_273_wire == 1'b1)) && (cs_279_wire == 1'b1)) && (cs_280_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_ctz_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_273_wire == 1'b1)) && (cs_279_wire == 1'b1)) && (cs_281_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_div_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_254_wire == 1'b1)) && (cs_267_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_feq_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_345_wire == 1'b1)) && (cs_346_wire == 1'b1)) && (cs_349_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_fle_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_345_wire == 1'b1)) && (cs_346_wire == 1'b1)) && (cs_347_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_flt_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_345_wire == 1'b1)) && (cs_346_wire == 1'b1)) && (cs_348_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_max_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_284_wire == 1'b1)) && (cs_289_wire == 1'b1)) && (cs_292_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_min_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_284_wire == 1'b1)) && (cs_289_wire == 1'b1)) && (cs_290_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_mul_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_254_wire == 1'b1)) && (cs_263_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_ori_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_456_wire == 1'b1)) && (cs_462_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_orn_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_284_wire == 1'b1)) && (cs_298_wire == 1'b1)) && (cs_301_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_rem_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_254_wire == 1'b1)) && (cs_269_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_rol_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_284_wire == 1'b1)) && (cs_307_wire == 1'b1)) && (cs_308_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_ror_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_284_wire == 1'b1)) && (cs_307_wire == 1'b1)) && (cs_309_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_sll_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_254_wire == 1'b1)) && (cs_256_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_slt_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_254_wire == 1'b1)) && (cs_257_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_sra_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_254_wire == 1'b1)) && (cs_272_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_srl_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_254_wire == 1'b1)) && (cs_260_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_sub_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_254_wire == 1'b1)) && (cs_271_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_xor_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_254_wire == 1'b1)) && (cs_259_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_addi_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_456_wire == 1'b1)) && (cs_459_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_andi_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_456_wire == 1'b1)) && (cs_458_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_andn_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_284_wire == 1'b1)) && (cs_298_wire == 1'b1)) && (cs_299_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_bclr_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_284_wire == 1'b1)) && (cs_302_wire == 1'b1)) && (cs_303_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_bext_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_284_wire == 1'b1)) && (cs_302_wire == 1'b1)) && (cs_304_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_bgeu_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_449_wire == 1'b1)) && (cs_451_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_binv_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_284_wire == 1'b1)) && (cs_302_wire == 1'b1)) && (cs_306_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_bltu_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_449_wire == 1'b1)) && (cs_450_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_bset_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_284_wire == 1'b1)) && (cs_302_wire == 1'b1)) && (cs_305_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_cpop_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_273_wire == 1'b1)) && (cs_279_wire == 1'b1)) && (cs_282_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_divu_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_254_wire == 1'b1)) && (cs_268_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_fadd_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_311_wire == 1'b1)) && (cs_312_wire == 1'b1)) && (cs_313_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_fdiv_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_311_wire == 1'b1)) && (cs_312_wire == 1'b1)) && (cs_316_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_fmax_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_330_wire == 1'b1)) && (cs_331_wire == 1'b1)) && (cs_333_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_fmin_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_330_wire == 1'b1)) && (cs_331_wire == 1'b1)) && (cs_332_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_fmul_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_311_wire == 1'b1)) && (cs_312_wire == 1'b1)) && (cs_315_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_fsub_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_311_wire == 1'b1)) && (cs_312_wire == 1'b1)) && (cs_314_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_maxu_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_284_wire == 1'b1)) && (cs_289_wire == 1'b1)) && (cs_293_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_minu_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_284_wire == 1'b1)) && (cs_289_wire == 1'b1)) && (cs_291_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_mret_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_334_wire == 1'b1)) && (cs_335_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_mulh_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_254_wire == 1'b1)) && (cs_264_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_orcb_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_273_wire == 1'b1)) && (cs_278_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_remu_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_254_wire == 1'b1)) && (cs_270_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_rev8_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_273_wire == 1'b1)) && (cs_283_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_rori_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_336_wire == 1'b1)) && (cs_342_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_slli_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_250_wire == 1'b1)) && (cs_251_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_slti_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_456_wire == 1'b1)) && (cs_460_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_sltu_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_254_wire == 1'b1)) && (cs_258_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_srai_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_250_wire == 1'b1)) && (cs_253_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_srli_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_250_wire == 1'b1)) && (cs_252_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_xnor_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_284_wire == 1'b1)) && (cs_298_wire == 1'b1)) && (cs_300_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_xori_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_456_wire == 1'b1)) && (cs_461_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_bclri_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_336_wire == 1'b1)) && (cs_337_wire == 1'b1)) && (cs_338_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_bexti_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_336_wire == 1'b1)) && (cs_337_wire == 1'b1)) && (cs_339_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_binvi_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_336_wire == 1'b1)) && (cs_337_wire == 1'b1)) && (cs_341_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_bseti_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_336_wire == 1'b1)) && (cs_337_wire == 1'b1)) && (cs_340_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_clmul_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_284_wire == 1'b1)) && (cs_285_wire == 1'b1)) && (cs_287_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_fmadd_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_397_wire == 1'b1)) && (cs_398_wire == 1'b1)) && (cs_399_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_fmsub_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_397_wire == 1'b1)) && (cs_398_wire == 1'b1)) && (cs_400_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_fsgnj_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_325_wire == 1'b1)) && (cs_326_wire == 1'b1)) && (cs_327_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_loadb_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_441_wire == 1'b1)) && (cs_443_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_loadh_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_441_wire == 1'b1)) && (cs_444_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_loadw_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_441_wire == 1'b1)) && (cs_442_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_mulhu_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_254_wire == 1'b1)) && (cs_266_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_sextb_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_273_wire == 1'b1)) && (cs_274_wire == 1'b1)) && (cs_276_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_sexth_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_273_wire == 1'b1)) && (cs_274_wire == 1'b1)) && (cs_277_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_sltiu_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_456_wire == 1'b1)) && (cs_457_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_zexth_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_273_wire == 1'b1)) && (cs_274_wire == 1'b1)) && (cs_275_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_auipc_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_463_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_cmp_f_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_345_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_ecall_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_19_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_fcomp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_311_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_fence_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_363_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_fload_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_447_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_fsqrt_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_343_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_fused_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_397_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_store_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_437_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_ebreak_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_21_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_fclass_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_359_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_fencei_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_396_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_fstore_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_448_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_sinj_f_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_325_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_br_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_427_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_conv_fx_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_350_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_conv_xf_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_355_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_li_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_418_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_loadwsp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_406_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_mv_ff2x_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_357_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_mv_fx2f_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_361_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_csrrc_hw_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_23_wire == 1'b1)) && (cs_241_wire == 1'b1)) && (cs_244_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_csrrs_hw_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_23_wire == 1'b1)) && (cs_241_wire == 1'b1)) && (cs_242_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_csrrw_hw_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_23_wire == 1'b1)) && (cs_241_wire == 1'b1)) && (cs_243_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_fmin_max_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_330_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_jal_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_430_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_lsw_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_433_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_lui_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_409_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_sri_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_0_wire == 1'b1) && (cs_3_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_storewsp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_426_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_csrrci_hw_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_245_wire == 1'b1)) && (cs_246_wire == 1'b1)) && (cs_249_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_csrrsi_hw_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_245_wire == 1'b1)) && (cs_246_wire == 1'b1)) && (cs_247_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_csrrwi_hw_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((((cs_18_wire == 1'b1) && (cs_245_wire == 1'b1)) && (cs_246_wire == 1'b1)) && (cs_248_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_addi_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_414_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_andi_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_0_wire == 1'b1) && (cs_12_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_comp_3reg_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_254_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_flsw_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_0_wire == 1'b1) && (cs_13_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_jalr_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_421_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_loadflwsp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_0_wire == 1'b1) && (cs_16_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_slli_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_0_wire == 1'b1) && (cs_1_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_mvadd_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_424_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_storefswsp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_0_wire == 1'b1) && (cs_17_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_addisp_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_413_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_comp_b_2reg_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_273_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_comp_b_3reg_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_284_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_ebreak_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_419_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_addispn_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_403_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_compreg_comp_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_0_wire == 1'b1) && (cs_7_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_comp_2reg_imm_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_456_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_comp_b_2reg_imm_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_336_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_control_registers_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_23_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_comp_2reg_imm_shift_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_250_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_control_conditional_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_449_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_control_registers_i_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_245_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_jal_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_465_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_lui_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_464_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_wfi_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_310_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_jalr_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_436_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_load_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_441_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw_xret_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_334_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign imm_imm5_imm5_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_0_wire == 1'b1) && (cs_1_wire == 1'b1))) ? codasip_param_0[6:2] :
        (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_0_wire == 1'b1) && (cs_3_wire == 1'b1))) ? codasip_param_0[6:2] : 5'h00;
    assign imm_imm5_imm5_srcdst_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_424_wire == 1'b1))) ? codasip_param_0[11:7] : 5'h00;
    assign imm_non_zero_imm5_non_zero_imm5_dst_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_406_wire == 1'b1)) && (cs_408_wire == 1'b1))) ? codasip_param_0[11:7] : 5'h00;
    assign imm_non_zero_imm5_non_zero_imm5_src2_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_424_wire == 1'b1)) && (cs_425_wire == 1'b1))) ? codasip_param_0[6:2] : 5'h00;
    assign imm_non_zero_imm5_non_zero_imm5_src_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_421_wire == 1'b1)) && (cs_408_wire == 1'b1))) ? codasip_param_0[11:7] : 5'h00;
    assign imm_non_zero_imm5_non_zero_imm5_srcdst_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_414_wire == 1'b1)) && (cs_408_wire == 1'b1))) ? codasip_param_0[11:7] : 5'h00;
    assign imm_non_zero_imm8_s2_non_zero_imm8_s2_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_403_wire == 1'b1)) && (cs_405_wire == 1'b1))) ? {codasip_param_0[10:7], codasip_param_0[12:11], codasip_param_0[5], codasip_param_0[6]} : 8'h00;
    assign imm_non_zero_simm6_s12_non_zero_simm6_s12_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_409_wire == 1'b1)) && (cs_411_wire == 1'b1))) ? signed'({codasip_param_0[12], codasip_param_0[6:2]}) : 6'sh00;
    assign imm_non_zero_simm6_s4_non_zero_simm6_s4_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_413_wire == 1'b1)) && (cs_411_wire == 1'b1))) ? signed'({codasip_param_0[12], codasip_param_0[6:2]}) : 6'sh00;
    assign imm_nsp_non_sp_non_sp_dst_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_18_wire == 1'b1) && (cs_409_wire == 1'b1)) && (cs_412_wire == 1'b1))) ? codasip_param_0[11:7] : 5'h00;
    assign simm_simm6_simm6_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_18_wire == 1'b1) && (cs_414_wire == 1'b1))) ? signed'({codasip_param_0[12], codasip_param_0[6:2]}) : 6'sh00;
    assign opc_clmulh_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D = opc_clmulh_ACT ? 17'h015b3 : 17'h00000;
    assign codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc = ((((((((((((((((((opc_clmulh_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D | opc_clmulr_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D) | opc_sh1add_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D) | opc_sh2add_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D) | opc_sh3add_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D) | opc_max_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D) | opc_min_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D) | opc_orn_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D) | opc_rol_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D) | opc_ror_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D) | opc_andn_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D) | opc_bclr_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D) | opc_bext_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D) | opc_binv_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D) | opc_bset_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D) | opc_maxu_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D) | opc_minu_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D) | opc_xnor_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D) | opc_clmul_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D);
    assign opc_clmulr_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D = opc_clmulr_ACT ? 17'h01533 : 17'h00000;
    assign opc_fnmadd_codasip_return_MI9opc_fusedIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_fused3opc_D = opc_fnmadd_ACT ? 7'h4f : 7'h00;
    assign codasip_return_MI9opc_fusedIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_fused3opc = (((opc_fnmadd_codasip_return_MI9opc_fusedIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_fused3opc_D | opc_fnmsub_codasip_return_MI9opc_fusedIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_fused3opc_D) | opc_fmadd_codasip_return_MI9opc_fusedIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_fused3opc_D) | opc_fmsub_codasip_return_MI9opc_fusedIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_fused3opc_D);
    assign opc_fnmsub_codasip_return_MI9opc_fusedIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_fused3opc_D = opc_fnmsub_ACT ? 7'h4b : 7'h00;
    assign opc_fsgnjn_codasip_return_MI10opc_sinj_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_sinj_f3opc_D = opc_fsgnjn_ACT ? 15'h10d3 : 15'h0000;
    assign codasip_return_MI10opc_sinj_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_sinj_f3opc = ((opc_fsgnjn_codasip_return_MI10opc_sinj_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_sinj_f3opc_D | opc_fsgnjx_codasip_return_MI10opc_sinj_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_sinj_f3opc_D) | opc_fsgnj_codasip_return_MI10opc_sinj_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_sinj_f3opc_D);
    assign opc_fsgnjx_codasip_return_MI10opc_sinj_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_sinj_f3opc_D = opc_fsgnjx_ACT ? 15'h1153 : 15'h0000;
    assign opc_j_comp_codasip_return_MI12opc_jmp_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_jmp_comp3opc_D = opc_j_comp_ACT ? 5'h15 : 5'h00;
    assign codasip_return_MI12opc_jmp_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_jmp_comp3opc = (opc_j_comp_codasip_return_MI12opc_jmp_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_jmp_comp3opc_D | opc_jal_comp_codasip_return_MI12opc_jmp_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_jmp_comp3opc_D);
    assign opc_loadbu_codasip_return_MI9opc_loadsIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_loads3opc_D = opc_loadbu_ACT ? 10'h203 : 10'h000;
    assign codasip_return_MI9opc_loadsIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_loads3opc = ((((opc_loadbu_codasip_return_MI9opc_loadsIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_loads3opc_D | opc_loadhu_codasip_return_MI9opc_loadsIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_loads3opc_D) | opc_loadb_codasip_return_MI9opc_loadsIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_loads3opc_D) | opc_loadh_codasip_return_MI9opc_loadsIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_loads3opc_D) | opc_loadw_codasip_return_MI9opc_loadsIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_loads3opc_D);
    assign opc_loadhu_codasip_return_MI9opc_loadsIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_loads3opc_D = opc_loadhu_ACT ? 10'h283 : 10'h000;
    assign opc_mulhsu_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D = opc_mulhsu_ACT ? 17'h00533 : 17'h00000;
    assign codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc = (((((((((((((((((opc_mulhsu_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D | opc_or_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D) | opc_add_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D) | opc_and_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D) | opc_div_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D) | opc_mul_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D) | opc_rem_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D) | opc_sll_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D) | opc_slt_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D) | opc_sra_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D) | opc_srl_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D) | opc_sub_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D) | opc_xor_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D) | opc_divu_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D) | opc_mulh_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D) | opc_remu_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D) | opc_sltu_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D) | opc_mulhu_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D);
    assign opc_sh1add_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D = opc_sh1add_ACT ? 17'h04133 : 17'h00000;
    assign opc_sh2add_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D = opc_sh2add_ACT ? 17'h04233 : 17'h00000;
    assign opc_sh3add_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D = opc_sh3add_ACT ? 17'h04333 : 17'h00000;
    assign opc_storeb_codasip_return_MI10opc_storesIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_stores3opc_D = opc_storeb_ACT ? 10'h023 : 10'h000;
    assign codasip_return_MI10opc_storesIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_stores3opc = ((opc_storeb_codasip_return_MI10opc_storesIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_stores3opc_D | opc_storeh_codasip_return_MI10opc_storesIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_stores3opc_D) | opc_storew_codasip_return_MI10opc_storesIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_stores3opc_D);
    assign opc_storeh_codasip_return_MI10opc_storesIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_stores3opc_D = opc_storeh_ACT ? 10'h0a3 : 10'h000;
    assign opc_storew_codasip_return_MI10opc_storesIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_stores3opc_D = opc_storew_ACT ? 10'h123 : 10'h000;
    assign opc_i_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D = opc_i_fence_param1_ACT ? 4'h8 : 4'h0;
    assign codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1 = (((((((((((((((opc_i_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D | opc_o_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D) | opc_r_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D) | opc_w_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D) | opc_io_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D) | opc_ir_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D) | opc_iw_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D) | opc_or_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D) | opc_ow_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D) | opc_rw_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D) | opc_ior_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D) | opc_iow_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D) | opc_irw_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D) | opc_orw_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D) | opc_hint_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D) | opc_iorw_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D);
    assign opc_i_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D = opc_i_fence_param2_ACT ? 4'h8 : 4'h0;
    assign codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2 = (((((((((((((((opc_i_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D | opc_o_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D) | opc_r_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D) | opc_w_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D) | opc_io_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D) | opc_ir_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D) | opc_iw_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D) | opc_or_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D) | opc_ow_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D) | opc_rw_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D) | opc_ior_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D) | opc_iow_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D) | opc_irw_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D) | opc_orw_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D) | opc_hint_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D) | opc_iorw_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D);
    assign opc_jr_comp_codasip_return_MI13opc_jmpr_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_jmpr_comp3opc_D = opc_jr_comp_ACT ? 6'h22 : 6'h00;
    assign codasip_return_MI13opc_jmpr_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_jmpr_comp3opc = (opc_jr_comp_codasip_return_MI13opc_jmpr_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_jmpr_comp3opc_D | opc_jalr_comp_codasip_return_MI13opc_jmpr_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_jmpr_comp3opc_D);
    assign opc_mv_comp_codasip_return_MI14opc_mvadd_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec17_14opc_mvadd_comp3opc_D = opc_mv_comp_ACT ? 6'h22 : 6'h00;
    assign codasip_return_MI14opc_mvadd_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec17_14opc_mvadd_comp3opc = (opc_mv_comp_codasip_return_MI14opc_mvadd_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec17_14opc_mvadd_comp3opc_D | opc_add_comp_codasip_return_MI14opc_mvadd_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec17_14opc_mvadd_comp3opc_D);
    assign opc_o_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D = opc_o_fence_param1_ACT ? 4'h4 : 4'h0;
    assign opc_o_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D = opc_o_fence_param2_ACT ? 4'h4 : 4'h0;
    assign opc_or_comp_codasip_return_MI16opc_compreg_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec19_16opc_compreg_comp3opc_D = opc_or_comp_ACT ? 10'h239 : 10'h000;
    assign codasip_return_MI16opc_compreg_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec19_16opc_compreg_comp3opc = (((opc_or_comp_codasip_return_MI16opc_compreg_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec19_16opc_compreg_comp3opc_D | opc_and_comp_codasip_return_MI16opc_compreg_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec19_16opc_compreg_comp3opc_D) | opc_sub_comp_codasip_return_MI16opc_compreg_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec19_16opc_compreg_comp3opc_D) | opc_xor_comp_codasip_return_MI16opc_compreg_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec19_16opc_compreg_comp3opc_D);
    assign opc_r_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D = opc_r_fence_param1_ACT ? 4'h2 : 4'h0;
    assign opc_r_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D = opc_r_fence_param2_ACT ? 4'h2 : 4'h0;
    assign opc_w_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D = opc_w_fence_param1_ACT ? 4'h1 : 4'h0;
    assign opc_w_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D = opc_w_fence_param2_ACT ? 4'h1 : 4'h0;
    assign opc_add_comp_codasip_return_MI14opc_mvadd_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec17_14opc_mvadd_comp3opc_D = opc_add_comp_ACT ? 6'h26 : 6'h00;
    assign opc_and_comp_codasip_return_MI16opc_compreg_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec19_16opc_compreg_comp3opc_D = opc_and_comp_ACT ? 10'h23d : 10'h000;
    assign opc_io_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D = opc_io_fence_param1_ACT ? 4'hc : 4'h0;
    assign opc_io_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D = opc_io_fence_param2_ACT ? 4'hc : 4'h0;
    assign opc_ir_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D = opc_ir_fence_param1_ACT ? 4'ha : 4'h0;
    assign opc_ir_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D = opc_ir_fence_param2_ACT ? 4'ha : 4'h0;
    assign opc_iw_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D = opc_iw_fence_param1_ACT ? 4'h9 : 4'h0;
    assign opc_iw_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D = opc_iw_fence_param2_ACT ? 4'h9 : 4'h0;
    assign opc_jal_comp_codasip_return_MI12opc_jmp_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_jmp_comp3opc_D = opc_jal_comp_ACT ? 5'h05 : 5'h00;
    assign opc_loadflsw_codasip_return_MI13opc_flsw_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_flsw_comp3opc_D = opc_loadflsw_ACT ? 5'h0c : 5'h00;
    assign codasip_return_MI13opc_flsw_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_flsw_comp3opc = (opc_loadflsw_codasip_return_MI13opc_flsw_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_flsw_comp3opc_D | opc_storeflsw_codasip_return_MI13opc_flsw_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_flsw_comp3opc_D);
    assign opc_loadwreg_codasip_return_MI12opc_lsw_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_lsw_comp3opc_D = opc_loadwreg_ACT ? 5'h08 : 5'h00;
    assign codasip_return_MI12opc_lsw_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_lsw_comp3opc = (opc_loadwreg_codasip_return_MI12opc_lsw_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_lsw_comp3opc_D | opc_storewreg_codasip_return_MI12opc_lsw_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_lsw_comp3opc_D);
    assign opc_or_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D = opc_or_fence_param1_ACT ? 4'h6 : 4'h0;
    assign opc_or_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D = opc_or_fence_param2_ACT ? 4'h6 : 4'h0;
    assign opc_ow_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D = opc_ow_fence_param1_ACT ? 4'h5 : 4'h0;
    assign opc_ow_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D = opc_ow_fence_param2_ACT ? 4'h5 : 4'h0;
    assign opc_rw_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D = opc_rw_fence_param1_ACT ? 4'h3 : 4'h0;
    assign opc_rw_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D = opc_rw_fence_param2_ACT ? 4'h3 : 4'h0;
    assign opc_sub_comp_codasip_return_MI16opc_compreg_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec19_16opc_compreg_comp3opc_D = opc_sub_comp_ACT ? 10'h231 : 10'h000;
    assign opc_xor_comp_codasip_return_MI16opc_compreg_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec19_16opc_compreg_comp3opc_D = opc_xor_comp_ACT ? 10'h235 : 10'h000;
    assign opc_beqz_comp_codasip_return_MI11opc_br_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec14_11opc_br_comp3opc_D = opc_beqz_comp_ACT ? 5'h19 : 5'h00;
    assign codasip_return_MI11opc_br_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec14_11opc_br_comp3opc = (opc_beqz_comp_codasip_return_MI11opc_br_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec14_11opc_br_comp3opc_D | opc_bnez_comp_codasip_return_MI11opc_br_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec14_11opc_br_comp3opc_D);
    assign opc_bnez_comp_codasip_return_MI11opc_br_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec14_11opc_br_comp3opc_D = opc_bnez_comp_ACT ? 5'h1d : 5'h00;
    assign opc_ior_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D = opc_ior_fence_param1_ACT ? 4'he : 4'h0;
    assign opc_ior_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D = opc_ior_fence_param2_ACT ? 4'he : 4'h0;
    assign opc_iow_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D = opc_iow_fence_param1_ACT ? 4'hd : 4'h0;
    assign opc_iow_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D = opc_iow_fence_param2_ACT ? 4'hd : 4'h0;
    assign opc_irw_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D = opc_irw_fence_param1_ACT ? 4'hb : 4'h0;
    assign opc_irw_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D = opc_irw_fence_param2_ACT ? 4'hb : 4'h0;
    assign opc_jalr_comp_codasip_return_MI13opc_jmpr_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_jmpr_comp3opc_D = opc_jalr_comp_ACT ? 6'h26 : 6'h00;
    assign opc_orw_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D = opc_orw_fence_param1_ACT ? 4'h7 : 4'h0;
    assign opc_orw_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D = opc_orw_fence_param2_ACT ? 4'h7 : 4'h0;
    assign opc_srai_comp_codasip_return_MI12opc_sri_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_sri_comp3opc_D = opc_srai_comp_ACT ? 7'h45 : 7'h00;
    assign codasip_return_MI12opc_sri_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_sri_comp3opc = (opc_srai_comp_codasip_return_MI12opc_sri_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_sri_comp3opc_D | opc_srli_comp_codasip_return_MI12opc_sri_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_sri_comp3opc_D);
    assign opc_srli_comp_codasip_return_MI12opc_sri_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_sri_comp3opc_D = opc_srli_comp_ACT ? 7'h41 : 7'h00;
    assign opc_storeflsw_codasip_return_MI13opc_flsw_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_flsw_comp3opc_D = opc_storeflsw_ACT ? 5'h1c : 5'h00;
    assign opc_storewreg_codasip_return_MI12opc_lsw_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_lsw_comp3opc_D = opc_storewreg_ACT ? 5'h18 : 5'h00;
    assign opc_hint_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D = opc_hint_fence_param1_ACT ? 4'h0 : 4'h0;
    assign opc_hint_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D = opc_hint_fence_param2_ACT ? 4'h0 : 4'h0;
    assign opc_iorw_fence_param1_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1_D = opc_iorw_fence_param1_ACT ? 4'hf : 4'h0;
    assign opc_iorw_fence_param2_codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2_D = opc_iorw_fence_param2_ACT ? 4'hf : 4'h0;
    assign fmt_w_codasip_return_MI7fmt_i32IH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec9_7fmt_i324ifmt_D = fmt_w_ACT ? 2'h0 : 2'h0;
    assign codasip_return_MI7fmt_i32IH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec9_7fmt_i324ifmt = (fmt_w_codasip_return_MI7fmt_i32IH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec9_7fmt_i324ifmt_D | fmt_wu_codasip_return_MI7fmt_i32IH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec9_7fmt_i324ifmt_D);
    assign fmt_wu_codasip_return_MI7fmt_i32IH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec9_7fmt_i324ifmt_D = fmt_wu_ACT ? 2'h1 : 2'h0;
    assign opc_or_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D = opc_or_ACT ? 17'h00333 : 17'h00000;
    assign opc_add_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D = opc_add_ACT ? 17'h00033 : 17'h00000;
    assign opc_and_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D = opc_and_ACT ? 17'h003b3 : 17'h00000;
    assign opc_beq_codasip_return_MI23opc_control_conditionalIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_control_conditional3opc_D = opc_beq_ACT ? 10'h063 : 10'h000;
    assign codasip_return_MI23opc_control_conditionalIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_control_conditional3opc = (((((opc_beq_codasip_return_MI23opc_control_conditionalIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_control_conditional3opc_D | opc_bge_codasip_return_MI23opc_control_conditionalIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_control_conditional3opc_D) | opc_blt_codasip_return_MI23opc_control_conditionalIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_control_conditional3opc_D) | opc_bne_codasip_return_MI23opc_control_conditionalIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_control_conditional3opc_D) | opc_bgeu_codasip_return_MI23opc_control_conditionalIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_control_conditional3opc_D) | opc_bltu_codasip_return_MI23opc_control_conditionalIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_control_conditional3opc_D);
    assign opc_bge_codasip_return_MI23opc_control_conditionalIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_control_conditional3opc_D = opc_bge_ACT ? 10'h2e3 : 10'h000;
    assign opc_blt_codasip_return_MI23opc_control_conditionalIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_control_conditional3opc_D = opc_blt_ACT ? 10'h263 : 10'h000;
    assign opc_bne_codasip_return_MI23opc_control_conditionalIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_control_conditional3opc_D = opc_bne_ACT ? 10'h0e3 : 10'h000;
    assign opc_clz_codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc_D = opc_clz_ACT ? 22'h180093 : 22'h000000;
    assign codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc = (((((((opc_clz_codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc_D | opc_ctz_codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc_D) | opc_cpop_codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc_D) | opc_orcb_codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc_D) | opc_rev8_codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc_D) | opc_sextb_codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc_D) | opc_sexth_codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc_D) | opc_zexth_codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc_D);
    assign opc_ctz_codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc_D = opc_ctz_ACT ? 22'h180493 : 22'h000000;
    assign opc_div_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D = opc_div_ACT ? 17'h00633 : 17'h00000;
    assign opc_feq_codasip_return_MI9opc_cmp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_cmp_f3opc_D = opc_feq_ACT ? 15'h5153 : 15'h0000;
    assign codasip_return_MI9opc_cmp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_cmp_f3opc = ((opc_feq_codasip_return_MI9opc_cmp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_cmp_f3opc_D | opc_fle_codasip_return_MI9opc_cmp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_cmp_f3opc_D) | opc_flt_codasip_return_MI9opc_cmp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_cmp_f3opc_D);
    assign opc_fle_codasip_return_MI9opc_cmp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_cmp_f3opc_D = opc_fle_ACT ? 15'h5053 : 15'h0000;
    assign opc_flt_codasip_return_MI9opc_cmp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_cmp_f3opc_D = opc_flt_ACT ? 15'h50d3 : 15'h0000;
    assign opc_max_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D = opc_max_ACT ? 17'h01733 : 17'h00000;
    assign opc_min_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D = opc_min_ACT ? 17'h01633 : 17'h00000;
    assign opc_mul_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D = opc_mul_ACT ? 17'h00433 : 17'h00000;
    assign opc_ori_codasip_return_MI17opc_comp_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec20_17opc_comp_2reg_imm3opc_D = opc_ori_ACT ? 10'h313 : 10'h000;
    assign codasip_return_MI17opc_comp_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec20_17opc_comp_2reg_imm3opc = (((((opc_ori_codasip_return_MI17opc_comp_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec20_17opc_comp_2reg_imm3opc_D | opc_addi_codasip_return_MI17opc_comp_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec20_17opc_comp_2reg_imm3opc_D) | opc_andi_codasip_return_MI17opc_comp_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec20_17opc_comp_2reg_imm3opc_D) | opc_slti_codasip_return_MI17opc_comp_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec20_17opc_comp_2reg_imm3opc_D) | opc_xori_codasip_return_MI17opc_comp_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec20_17opc_comp_2reg_imm3opc_D) | opc_sltiu_codasip_return_MI17opc_comp_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec20_17opc_comp_2reg_imm3opc_D);
    assign opc_orn_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D = opc_orn_ACT ? 17'h08333 : 17'h00000;
    assign opc_rem_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D = opc_rem_ACT ? 17'h00733 : 17'h00000;
    assign opc_rol_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D = opc_rol_ACT ? 17'h0c0b3 : 17'h00000;
    assign opc_ror_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D = opc_ror_ACT ? 17'h0c2b3 : 17'h00000;
    assign opc_sll_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D = opc_sll_ACT ? 17'h000b3 : 17'h00000;
    assign opc_slt_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D = opc_slt_ACT ? 17'h00133 : 17'h00000;
    assign opc_sra_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D = opc_sra_ACT ? 17'h082b3 : 17'h00000;
    assign opc_srl_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D = opc_srl_ACT ? 17'h002b3 : 17'h00000;
    assign opc_sub_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D = opc_sub_ACT ? 17'h08033 : 17'h00000;
    assign opc_xor_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D = opc_xor_ACT ? 17'h00233 : 17'h00000;
    assign opc_addi_codasip_return_MI17opc_comp_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec20_17opc_comp_2reg_imm3opc_D = opc_addi_ACT ? 10'h013 : 10'h000;
    assign opc_andi_codasip_return_MI17opc_comp_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec20_17opc_comp_2reg_imm3opc_D = opc_andi_ACT ? 10'h393 : 10'h000;
    assign opc_andn_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D = opc_andn_ACT ? 17'h083b3 : 17'h00000;
    assign opc_bclr_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D = opc_bclr_ACT ? 17'h090b3 : 17'h00000;
    assign opc_bext_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D = opc_bext_ACT ? 17'h092b3 : 17'h00000;
    assign opc_bgeu_codasip_return_MI23opc_control_conditionalIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_control_conditional3opc_D = opc_bgeu_ACT ? 10'h3e3 : 10'h000;
    assign opc_binv_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D = opc_binv_ACT ? 17'h0d0b3 : 17'h00000;
    assign opc_bltu_codasip_return_MI23opc_control_conditionalIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_control_conditional3opc_D = opc_bltu_ACT ? 10'h363 : 10'h000;
    assign opc_bset_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D = opc_bset_ACT ? 17'h050b3 : 17'h00000;
    assign opc_cpop_codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc_D = opc_cpop_ACT ? 22'h180893 : 22'h000000;
    assign opc_divu_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D = opc_divu_ACT ? 17'h006b3 : 17'h00000;
    assign opc_fadd_codasip_return_MI10opc_comp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_comp_f3opc_D = opc_fadd_ACT ? 12'h053 : 12'h000;
    assign codasip_return_MI10opc_comp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_comp_f3opc = (((opc_fadd_codasip_return_MI10opc_comp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_comp_f3opc_D | opc_fdiv_codasip_return_MI10opc_comp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_comp_f3opc_D) | opc_fmul_codasip_return_MI10opc_comp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_comp_f3opc_D) | opc_fsub_codasip_return_MI10opc_comp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_comp_f3opc_D);
    assign opc_fdiv_codasip_return_MI10opc_comp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_comp_f3opc_D = opc_fdiv_ACT ? 12'h1d3 : 12'h000;
    assign opc_fmax_codasip_return_MI13opc_min_max_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_min_max_f3opc_D = opc_fmax_ACT ? 15'h14d3 : 15'h0000;
    assign codasip_return_MI13opc_min_max_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_min_max_f3opc = (opc_fmax_codasip_return_MI13opc_min_max_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_min_max_f3opc_D | opc_fmin_codasip_return_MI13opc_min_max_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_min_max_f3opc_D);
    assign opc_fmin_codasip_return_MI13opc_min_max_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_min_max_f3opc_D = opc_fmin_ACT ? 15'h1453 : 15'h0000;
    assign opc_fmul_codasip_return_MI10opc_comp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_comp_f3opc_D = opc_fmul_ACT ? 12'h153 : 12'h000;
    assign opc_fsub_codasip_return_MI10opc_comp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_comp_f3opc_D = opc_fsub_ACT ? 12'h0d3 : 12'h000;
    assign opc_maxu_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D = opc_maxu_ACT ? 17'h017b3 : 17'h00000;
    assign opc_minu_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D = opc_minu_ACT ? 17'h016b3 : 17'h00000;
    assign opc_mret_codasip_return_MI8opc_xretIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec10_8opc_xret3opc_D = opc_mret_ACT ? 22'h0c0873 : 22'h000000;
    assign codasip_return_MI8opc_xretIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec10_8opc_xret3opc = opc_mret_codasip_return_MI8opc_xretIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec10_8opc_xret3opc_D;
    assign opc_mulh_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D = opc_mulh_ACT ? 17'h004b3 : 17'h00000;
    assign opc_orcb_codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc_D = opc_orcb_ACT ? 22'h0a1e93 : 22'h000000;
    assign opc_remu_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D = opc_remu_ACT ? 17'h007b3 : 17'h00000;
    assign opc_rev8_codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc_D = opc_rev8_ACT ? 22'h1a6293 : 22'h000000;
    assign opc_rori_codasip_return_MP12decode_stage3decMI19opc_comp_b_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec40_12decode_stage3dec19opc_comp_b_2reg_imm3opc_D = opc_rori_ACT ? 17'h0c293 : 17'h00000;
    assign codasip_return_MP12decode_stage3decMI19opc_comp_b_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec40_12decode_stage3dec19opc_comp_b_2reg_imm3opc = ((((opc_rori_codasip_return_MP12decode_stage3decMI19opc_comp_b_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec40_12decode_stage3dec19opc_comp_b_2reg_imm3opc_D | opc_bclri_codasip_return_MP12decode_stage3decMI19opc_comp_b_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec40_12decode_stage3dec19opc_comp_b_2reg_imm3opc_D) | opc_bexti_codasip_return_MP12decode_stage3decMI19opc_comp_b_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec40_12decode_stage3dec19opc_comp_b_2reg_imm3opc_D) | opc_binvi_codasip_return_MP12decode_stage3decMI19opc_comp_b_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec40_12decode_stage3dec19opc_comp_b_2reg_imm3opc_D) | opc_bseti_codasip_return_MP12decode_stage3decMI19opc_comp_b_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec40_12decode_stage3dec19opc_comp_b_2reg_imm3opc_D);
    assign opc_slli_codasip_return_MI23opc_comp_2reg_imm_shiftIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_comp_2reg_imm_shift3opc_D = opc_slli_ACT ? 17'h00093 : 17'h00000;
    assign codasip_return_MI23opc_comp_2reg_imm_shiftIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_comp_2reg_imm_shift3opc = ((opc_slli_codasip_return_MI23opc_comp_2reg_imm_shiftIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_comp_2reg_imm_shift3opc_D | opc_srai_codasip_return_MI23opc_comp_2reg_imm_shiftIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_comp_2reg_imm_shift3opc_D) | opc_srli_codasip_return_MI23opc_comp_2reg_imm_shiftIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_comp_2reg_imm_shift3opc_D);
    assign opc_slti_codasip_return_MI17opc_comp_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec20_17opc_comp_2reg_imm3opc_D = opc_slti_ACT ? 10'h113 : 10'h000;
    assign opc_sltu_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D = opc_sltu_ACT ? 17'h001b3 : 17'h00000;
    assign opc_srai_codasip_return_MI23opc_comp_2reg_imm_shiftIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_comp_2reg_imm_shift3opc_D = opc_srai_ACT ? 17'h08293 : 17'h00000;
    assign opc_srli_codasip_return_MI23opc_comp_2reg_imm_shiftIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_comp_2reg_imm_shift3opc_D = opc_srli_ACT ? 17'h00293 : 17'h00000;
    assign opc_xnor_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D = opc_xnor_ACT ? 17'h08233 : 17'h00000;
    assign opc_xori_codasip_return_MI17opc_comp_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec20_17opc_comp_2reg_imm3opc_D = opc_xori_ACT ? 10'h213 : 10'h000;
    assign opc_bclri_codasip_return_MP12decode_stage3decMI19opc_comp_b_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec40_12decode_stage3dec19opc_comp_b_2reg_imm3opc_D = opc_bclri_ACT ? 17'h09093 : 17'h00000;
    assign opc_bexti_codasip_return_MP12decode_stage3decMI19opc_comp_b_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec40_12decode_stage3dec19opc_comp_b_2reg_imm3opc_D = opc_bexti_ACT ? 17'h09293 : 17'h00000;
    assign opc_binvi_codasip_return_MP12decode_stage3decMI19opc_comp_b_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec40_12decode_stage3dec19opc_comp_b_2reg_imm3opc_D = opc_binvi_ACT ? 17'h0d093 : 17'h00000;
    assign opc_bseti_codasip_return_MP12decode_stage3decMI19opc_comp_b_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec40_12decode_stage3dec19opc_comp_b_2reg_imm3opc_D = opc_bseti_ACT ? 17'h05093 : 17'h00000;
    assign opc_clmul_codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc_D = opc_clmul_ACT ? 17'h014b3 : 17'h00000;
    assign opc_fmadd_codasip_return_MI9opc_fusedIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_fused3opc_D = opc_fmadd_ACT ? 7'h43 : 7'h00;
    assign opc_fmsub_codasip_return_MI9opc_fusedIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_fused3opc_D = opc_fmsub_ACT ? 7'h47 : 7'h00;
    assign opc_fsgnj_codasip_return_MI10opc_sinj_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_sinj_f3opc_D = opc_fsgnj_ACT ? 15'h1053 : 15'h0000;
    assign opc_loadb_codasip_return_MI9opc_loadsIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_loads3opc_D = opc_loadb_ACT ? 10'h003 : 10'h000;
    assign opc_loadh_codasip_return_MI9opc_loadsIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_loads3opc_D = opc_loadh_ACT ? 10'h083 : 10'h000;
    assign opc_loadw_codasip_return_MI9opc_loadsIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_loads3opc_D = opc_loadw_ACT ? 10'h103 : 10'h000;
    assign opc_mulhu_codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc_D = opc_mulhu_ACT ? 17'h005b3 : 17'h00000;
    assign opc_sextb_codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc_D = opc_sextb_ACT ? 22'h181093 : 22'h000000;
    assign opc_sexth_codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc_D = opc_sexth_ACT ? 22'h181493 : 22'h000000;
    assign opc_sltiu_codasip_return_MI17opc_comp_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec20_17opc_comp_2reg_imm3opc_D = opc_sltiu_ACT ? 10'h193 : 10'h000;
    assign opc_zexth_codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc_D = opc_zexth_ACT ? 22'h020233 : 22'h000000;
    assign i_hw_auipc_s_fu_o_D = i_hw_auipc_ACT ? 4'h1 : 4'h0;
    assign s_fu_o_D = (((((((((((((((((((((((((((((((((((((((((((((((((((((i_hw_auipc_s_fu_o_D | i_hw_cmp_f_s_fu_o_D) | i_hw_ecall_s_fu_o_D) | i_hw_fcomp_s_fu_o_D) | i_hw_fence_s_fu_o_D) | i_hw_fload_s_fu_o_D) | i_hw_fsqrt_s_fu_o_D) | i_hw_fused_s_fu_o_D) | i_hw_store_s_fu_o_D) | i_hw_ebreak_s_fu_o_D) | i_hw_fclass_s_fu_o_D) | i_hw_fencei_s_fu_o_D) | i_hw_fstore_s_fu_o_D) | i_hw_sinj_f_s_fu_o_D) | i_hw_br_comp_s_fu_o_D) | i_hw_conv_fx_s_fu_o_D) | i_hw_conv_xf_s_fu_o_D) | i_hw_li_comp_s_fu_o_D) | i_hw_loadwsp_s_fu_o_D) | i_hw_mv_ff2x_s_fu_o_D) | i_hw_mv_fx2f_s_fu_o_D) | i_hw_fmin_max_s_fu_o_D) | i_hw_jal_comp_s_fu_o_D) | i_hw_lsw_comp_s_fu_o_D) | i_hw_lui_comp_s_fu_o_D) | i_hw_sri_comp_s_fu_o_D) | i_hw_storewsp_s_fu_o_D) | i_hw_addi_comp_s_fu_o_D) | i_hw_andi_comp_s_fu_o_D) | i_hw_comp_3reg_s_fu_o_D_ACT) | i_hw_flsw_comp_s_fu_o_D) | i_hw_jalr_comp_s_fu_o_D) | i_hw_loadflwsp_s_fu_o_D) | i_hw_slli_comp_s_fu_o_D) | i_hw_mvadd_comp_s_fu_o_D) | i_hw_storefswsp_s_fu_o_D) | i_hw_addisp_comp_s_fu_o_D) | i_hw_comp_b_2reg_s_fu_o_D) | i_hw_comp_b_3reg_s_fu_o_D) | i_hw_ebreak_comp_s_fu_o_D) | i_hw_addispn_comp_s_fu_o_D) | i_hw_compreg_comp_s_fu_o_D) | i_hw_comp_2reg_imm_s_fu_o_D) | i_hw_comp_b_2reg_imm_s_fu_o_D) | i_hw_control_registers_s_fu_o_D) | i_hw_comp_2reg_imm_shift_s_fu_o_D) | i_hw_control_conditional_s_fu_o_D) | i_hw_control_registers_i_s_fu_o_D) | i_hw_jal_s_fu_o_D) | i_hw_lui_s_fu_o_D) | i_hw_wfi_s_fu_o_D) | i_hw_jalr_s_fu_o_D) | i_hw_load_s_fu_o_D) | i_hw_xret_s_fu_o_D);
    assign i_hw_auipc_s_fu_s1_source_o_D = i_hw_auipc_ACT ? 2'h3 : 2'h0;
    assign s_fu_s1_source_o_D = ((((((((((((((((((((((((((((((((((((((((((i_hw_auipc_s_fu_s1_source_o_D | i_hw_cmp_f_s_fu_s1_source_o_D) | i_hw_fcomp_s_fu_s1_source_o_D) | i_hw_fload_s_fu_s1_source_o_D) | i_hw_fsqrt_s_fu_s1_source_o_D) | i_hw_fused_s_fu_s1_source_o_D) | i_hw_store_s_fu_s1_source_o_D) | i_hw_fclass_s_fu_s1_source_o_D) | i_hw_fstore_s_fu_s1_source_o_D) | i_hw_sinj_f_s_fu_s1_source_o_D) | i_hw_br_comp_s_fu_s1_source_o_D) | i_hw_conv_fx_s_fu_s1_source_o_D) | i_hw_conv_xf_s_fu_s1_source_o_D) | i_hw_loadwsp_s_fu_s1_source_o_D) | i_hw_mv_ff2x_s_fu_s1_source_o_D) | i_hw_mv_fx2f_s_fu_s1_source_o_D) | i_hw_fmin_max_s_fu_s1_source_o_D) | i_hw_lsw_comp_s_fu_s1_source_o_D) | i_hw_sri_comp_s_fu_s1_source_o_D) | i_hw_storewsp_s_fu_s1_source_o_D) | i_hw_addi_comp_s_fu_s1_source_o_D) | i_hw_andi_comp_s_fu_s1_source_o_D) | i_hw_comp_3reg_s_fu_s1_source_o_D) | i_hw_flsw_comp_s_fu_s1_source_o_D) | i_hw_jalr_comp_s_fu_s1_source_o_D) | i_hw_loadflwsp_s_fu_s1_source_o_D) | i_hw_slli_comp_s_fu_s1_source_o_D) | i_hw_mvadd_comp_s_fu_s1_source_o_D_ACT) | i_hw_storefswsp_s_fu_s1_source_o_D) | i_hw_addisp_comp_s_fu_s1_source_o_D) | i_hw_comp_b_2reg_s_fu_s1_source_o_D) | i_hw_comp_b_3reg_s_fu_s1_source_o_D) | i_hw_addispn_comp_s_fu_s1_source_o_D) | i_hw_compreg_comp_s_fu_s1_source_o_D) | i_hw_comp_2reg_imm_s_fu_s1_source_o_D) | i_hw_comp_b_2reg_imm_s_fu_s1_source_o_D) | i_hw_control_registers_s_fu_s1_source_o_D) | i_hw_comp_2reg_imm_shift_s_fu_s1_source_o_D) | i_hw_control_conditional_s_fu_s1_source_o_D) | i_hw_control_registers_i_s_fu_s1_source_o_D) | i_hw_jal_s_fu_s1_source_o_D) | i_hw_jalr_s_fu_s1_source_o_D) | i_hw_load_s_fu_s1_source_o_D);
    assign i_hw_auipc_s_fu_s2_source_o_D = i_hw_auipc_ACT ? 2'h2 : 2'h0;
    assign s_fu_s2_source_o_D = (((((((((((((((((((((((((((((((i_hw_auipc_s_fu_s2_source_o_D | i_hw_cmp_f_s_fu_s2_source_o_D) | i_hw_fcomp_s_fu_s2_source_o_D) | i_hw_fused_s_fu_s2_source_o_D) | i_hw_store_s_fu_s2_source_o_D) | i_hw_fstore_s_fu_s2_source_o_D) | i_hw_sinj_f_s_fu_s2_source_o_D) | i_hw_li_comp_s_fu_s2_source_o_D) | i_hw_fmin_max_s_fu_s2_source_o_D) | i_hw_jal_comp_s_fu_s2_source_o_D) | i_hw_lsw_comp_s_fu_s2_source_o_D_ACT) | i_hw_lui_comp_s_fu_s2_source_o_D) | i_hw_sri_comp_s_fu_s2_source_o_D) | i_hw_storewsp_s_fu_s2_source_o_D) | i_hw_addi_comp_s_fu_s2_source_o_D) | i_hw_andi_comp_s_fu_s2_source_o_D) | i_hw_comp_3reg_s_fu_s2_source_o_D) | i_hw_flsw_comp_s_fu_s2_source_o_D) | i_hw_loadflwsp_s_fu_s2_source_o_D) | i_hw_slli_comp_s_fu_s2_source_o_D) | i_hw_mvadd_comp_s_fu_s2_source_o_D) | i_hw_storefswsp_s_fu_s2_source_o_D) | i_hw_addisp_comp_s_fu_s2_source_o_D) | i_hw_comp_b_3reg_s_fu_s2_source_o_D) | i_hw_addispn_comp_s_fu_s2_source_o_D) | i_hw_compreg_comp_s_fu_s2_source_o_D) | i_hw_comp_2reg_imm_s_fu_s2_source_o_D) | i_hw_comp_b_2reg_imm_s_fu_s2_source_o_D) | i_hw_comp_2reg_imm_shift_s_fu_s2_source_o_D) | i_hw_control_conditional_s_fu_s2_source_o_D) | i_hw_lui_s_fu_s2_source_o_D) | i_hw_load_s_fu_s2_source_o_D);
    assign i_hw_auipc_s_imm_type_D = i_hw_auipc_ACT ? 5'h04 : 5'h00;
    assign s_imm_type_D = ((((((((((((((((((((((((((((i_hw_auipc_s_imm_type_D | i_hw_fload_s_imm_type_D) | i_hw_store_s_imm_type_D) | i_hw_fstore_s_imm_type_D) | i_hw_br_comp_s_imm_type_D) | i_hw_li_comp_s_imm_type_D) | i_hw_loadwsp_s_imm_type_D) | i_hw_jal_comp_s_imm_type_D) | i_hw_lsw_comp_s_imm_type_D) | i_hw_lui_comp_s_imm_type_D) | i_hw_sri_comp_s_imm_type_D) | i_hw_storewsp_s_imm_type_D) | i_hw_addi_comp_s_imm_type_D) | i_hw_andi_comp_s_imm_type_D) | i_hw_flsw_comp_s_imm_type_D) | i_hw_loadflwsp_s_imm_type_D) | i_hw_slli_comp_s_imm_type_D) | i_hw_storefswsp_s_imm_type_D) | i_hw_addisp_comp_s_imm_type_D) | i_hw_addispn_comp_s_imm_type_D) | i_hw_comp_2reg_imm_s_imm_type_D) | i_hw_comp_b_2reg_imm_s_imm_type_D) | i_hw_comp_2reg_imm_shift_s_imm_type_D) | i_hw_control_conditional_s_imm_type_D) | i_hw_control_registers_i_s_imm_type_D) | i_hw_jal_s_imm_type_D) | i_hw_lui_s_imm_type_D) | i_hw_jalr_s_imm_type_D) | i_hw_load_s_imm_type_D);
    assign i_hw_auipc_s_op_o_D = i_hw_auipc_ACT ? 8'h00 : 8'h00;
    assign s_op_o_D = ((((((((((((((((((((((((((((((((((((((((((i_hw_auipc_s_op_o_D | i_hw_ecall_s_op_o_D) | i_hw_fence_s_op_o_D) | i_hw_fload_s_op_o_D) | i_hw_store_s_op_o_D_ACT) | i_hw_ebreak_s_op_o_D) | i_hw_fencei_s_op_o_D) | i_hw_fstore_s_op_o_D) | i_hw_br_comp_s_op_o_D_ACT) | i_hw_li_comp_s_op_o_D) | i_hw_loadwsp_s_op_o_D) | i_hw_jal_comp_s_op_o_D) | i_hw_lsw_comp_s_op_o_D_ACT) | i_hw_lui_comp_s_op_o_D) | i_hw_sri_comp_s_op_o_D_ACT) | i_hw_storewsp_s_op_o_D) | i_hw_addi_comp_s_op_o_D) | i_hw_andi_comp_s_op_o_D) | i_hw_comp_3reg_s_op_o_D_ACT) | i_hw_flsw_comp_s_op_o_D_ACT) | i_hw_jalr_comp_s_op_o_D) | i_hw_loadflwsp_s_op_o_D) | i_hw_slli_comp_s_op_o_D) | i_hw_mvadd_comp_s_op_o_D) | i_hw_storefswsp_s_op_o_D) | i_hw_addisp_comp_s_op_o_D) | i_hw_comp_b_2reg_s_op_o_D_ACT) | i_hw_comp_b_3reg_s_op_o_D_ACT) | i_hw_ebreak_comp_s_op_o_D) | i_hw_addispn_comp_s_op_o_D) | i_hw_compreg_comp_s_op_o_D_ACT) | i_hw_comp_2reg_imm_s_op_o_D_ACT) | i_hw_comp_b_2reg_imm_s_op_o_D_ACT) | i_hw_control_registers_s_op_o_D_ACT) | i_hw_comp_2reg_imm_shift_s_op_o_D_ACT) | i_hw_control_conditional_s_op_o_D_ACT) | i_hw_control_registers_i_s_op_o_D_ACT) | i_hw_jal_s_op_o_D) | i_hw_lui_s_op_o_D) | i_hw_wfi_s_op_o_D) | i_hw_jalr_s_op_o_D) | i_hw_load_s_op_o_D_ACT) | i_hw_xret_s_op_o_D_ACT);
    assign i_hw_auipc_s_instr_illegal_on_dbg_D = i_hw_auipc_ACT ? 1'b1 : 1'b0;
    assign s_instr_illegal_on_dbg_D = ((((((i_hw_auipc_s_instr_illegal_on_dbg_D | i_hw_br_comp_s_instr_illegal_on_dbg_D) | i_hw_jal_comp_s_instr_illegal_on_dbg_D) | i_hw_jalr_comp_s_instr_illegal_on_dbg_D) | i_hw_control_conditional_s_instr_illegal_on_dbg_D) | i_hw_jal_s_instr_illegal_on_dbg_D) | i_hw_jalr_s_instr_illegal_on_dbg_D);
    assign i_hw_cmp_f_s_fu_o_D = i_hw_cmp_f_ACT ? 4'h7 : 4'h0;
    assign i_hw_cmp_f_s_fu_s1_source_o_D = i_hw_cmp_f_ACT ? 2'h1 : 2'h0;
    assign i_hw_cmp_f_s_fu_s2_source_o_D = i_hw_cmp_f_ACT ? 2'h1 : 2'h0;
    assign i_hw_cmp_f_s_rs1_float_o_D = i_hw_cmp_f_ACT ? 1'b1 : 1'b0;
    assign s_rs1_float_o_D = (((((((((i_hw_cmp_f_s_rs1_float_o_D | i_hw_fcomp_s_rs1_float_o_D) | i_hw_fsqrt_s_rs1_float_o_D) | i_hw_fused_s_rs1_float_o_D) | i_hw_fclass_s_rs1_float_o_D) | i_hw_sinj_f_s_rs1_float_o_D) | i_hw_conv_fx_s_rs1_float_o_D) | i_hw_mv_ff2x_s_rs1_float_o_D) | i_hw_fmin_max_s_rs1_float_o_D) | i_hw_flsw_comp_s_rs1_float_o_D_ACT);
    assign i_hw_cmp_f_s_rs2_float_o_D = i_hw_cmp_f_ACT ? 1'b1 : 1'b0;
    assign s_rs2_float_o_D = (((((((i_hw_cmp_f_s_rs2_float_o_D | i_hw_fcomp_s_rs2_float_o_D) | i_hw_fused_s_rs2_float_o_D) | i_hw_fstore_s_rs2_float_o_D) | i_hw_sinj_f_s_rs2_float_o_D) | i_hw_fmin_max_s_rs2_float_o_D) | i_hw_flsw_comp_s_rs2_float_o_D_ACT) | i_hw_storefswsp_s_rs2_float_o_D);
    assign codasip_tmp_var_0_i_hw_cmp_f_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MI9opc_cmp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_cmp_f3opc;
    assign i_hw_cmp_f_s_fpu_op_o_D = (codasip_tmp_var_0_i_hw_cmp_f_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 15'h5153) ? 6'h1c :
        (codasip_tmp_var_0_i_hw_cmp_f_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 15'h50d3) ? 6'h1d :
        (codasip_tmp_var_0_i_hw_cmp_f_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 15'h5053) ? 6'h1e : 6'h00;
    assign i_hw_cmp_f_s_fpu_op_o_D_ACT = i_hw_cmp_f_ACT ? i_hw_cmp_f_s_fpu_op_o_D : 6'h00;
    assign s_fpu_op_o_D = ((((((((((i_hw_cmp_f_s_fpu_op_o_D_ACT | i_hw_fcomp_s_fpu_op_o_D_ACT) | i_hw_fsqrt_s_fpu_op_o_D) | i_hw_fused_s_fpu_op_o_D_ACT) | i_hw_fclass_s_fpu_op_o_D) | i_hw_sinj_f_s_fpu_op_o_D_ACT) | i_hw_conv_fx_s_fpu_op_o_D_ACT) | i_hw_conv_xf_s_fpu_op_o_D_ACT) | i_hw_mv_ff2x_s_fpu_op_o_D) | i_hw_mv_fx2f_s_fpu_op_o_D) | i_hw_fmin_max_s_fpu_op_o_D_ACT);
    assign i_hw_ecall_s_fu_o_D = i_hw_ecall_ACT ? 4'h6 : 4'h0;
    assign i_hw_ecall_s_op_o_D = i_hw_ecall_ACT ? 8'h38 : 8'h00;
    assign i_hw_fcomp_s_fu_o_D = i_hw_fcomp_ACT ? 4'h7 : 4'h0;
    assign i_hw_fcomp_s_fu_s1_source_o_D = i_hw_fcomp_ACT ? 2'h1 : 2'h0;
    assign i_hw_fcomp_s_fu_s2_source_o_D = i_hw_fcomp_ACT ? 2'h1 : 2'h0;
    assign i_hw_fcomp_s_rs1_float_o_D = i_hw_fcomp_ACT ? 1'b1 : 1'b0;
    assign i_hw_fcomp_s_rs2_float_o_D = i_hw_fcomp_ACT ? 1'b1 : 1'b0;
    assign i_hw_fcomp_s_rd_float_o_D = i_hw_fcomp_ACT ? 1'b1 : 1'b0;
    assign s_rd_float_o_D = (((((((((i_hw_fcomp_s_rd_float_o_D | i_hw_fload_s_rd_float_o_D) | i_hw_fsqrt_s_rd_float_o_D) | i_hw_fused_s_rd_float_o_D) | i_hw_sinj_f_s_rd_float_o_D) | i_hw_conv_xf_s_rd_float_o_D) | i_hw_mv_fx2f_s_rd_float_o_D) | i_hw_fmin_max_s_rd_float_o_D) | i_hw_flsw_comp_s_rd_float_o_D_ACT) | i_hw_loadflwsp_s_rd_float_o_D);
    assign codasip_tmp_var_0_i_hw_fcomp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MI10opc_comp_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_comp_f3opc;
    assign i_hw_fcomp_s_fpu_op_o_D = (codasip_tmp_var_0_i_hw_fcomp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 12'h053) ? 6'h00 :
        (codasip_tmp_var_0_i_hw_fcomp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 12'h0d3) ? 6'h01 :
        (codasip_tmp_var_0_i_hw_fcomp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 12'h153) ? 6'h02 :
        (codasip_tmp_var_0_i_hw_fcomp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 12'h1d3) ? 6'h03 : 6'h00;
    assign i_hw_fcomp_s_fpu_op_o_D_ACT = i_hw_fcomp_ACT ? i_hw_fcomp_s_fpu_op_o_D : 6'h00;
    assign i_hw_fence_s_fu_o_D = i_hw_fence_ACT ? 4'h2 : 4'h0;
    assign i_hw_fence_s_op_o_D = i_hw_fence_ACT ? ((((codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param2 == 4'h0) || (codasip_return_MI15opc_fence_paramIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec18_15opc_fence_param6param1 == 4'h0))) ? 8'h00 : 8'h1c) : 8'h00;
    assign i_hw_fload_s_fu_o_D = i_hw_fload_ACT ? 4'h2 : 4'h0;
    assign i_hw_fload_s_fu_s1_source_o_D = i_hw_fload_ACT ? 2'h1 : 2'h0;
    assign i_hw_fload_s_imm_type_D = i_hw_fload_ACT ? 5'h01 : 5'h00;
    assign i_hw_fload_s_op_o_D = i_hw_fload_ACT ? 8'h19 : 8'h00;
    assign i_hw_fload_s_rd_float_o_D = i_hw_fload_ACT ? 1'b1 : 1'b0;
    assign i_hw_fsqrt_s_fu_o_D = i_hw_fsqrt_ACT ? 4'h7 : 4'h0;
    assign i_hw_fsqrt_s_fu_s1_source_o_D = i_hw_fsqrt_ACT ? 2'h1 : 2'h0;
    assign i_hw_fsqrt_s_rs1_float_o_D = i_hw_fsqrt_ACT ? 1'b1 : 1'b0;
    assign i_hw_fsqrt_s_rd_float_o_D = i_hw_fsqrt_ACT ? 1'b1 : 1'b0;
    assign i_hw_fsqrt_s_fpu_op_o_D = i_hw_fsqrt_ACT ? 6'h06 : 6'h00;
    assign i_hw_fused_s_fu_o_D = i_hw_fused_ACT ? 4'h7 : 4'h0;
    assign i_hw_fused_s_fu_s1_source_o_D = i_hw_fused_ACT ? 2'h1 : 2'h0;
    assign i_hw_fused_s_fu_s2_source_o_D = i_hw_fused_ACT ? 2'h1 : 2'h0;
    assign i_hw_fused_s_fu_s3_source_o_D = i_hw_fused_ACT ? 2'h1 : 2'h0;
    assign s_fu_s3_source_o_D = i_hw_fused_s_fu_s3_source_o_D;
    assign i_hw_fused_s_rs1_float_o_D = i_hw_fused_ACT ? 1'b1 : 1'b0;
    assign i_hw_fused_s_rs2_float_o_D = i_hw_fused_ACT ? 1'b1 : 1'b0;
    assign i_hw_fused_s_rd_float_o_D = i_hw_fused_ACT ? 1'b1 : 1'b0;
    assign codasip_tmp_var_0_i_hw_fused_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MI9opc_fusedIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_fused3opc;
    assign i_hw_fused_s_fpu_op_o_D = (codasip_tmp_var_0_i_hw_fused_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 7'h43) ? 6'h07 :
        (codasip_tmp_var_0_i_hw_fused_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 7'h47) ? 6'h08 :
        (codasip_tmp_var_0_i_hw_fused_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 7'h4f) ? 6'h0a :
        (codasip_tmp_var_0_i_hw_fused_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 7'h4b) ? 6'h09 : 6'h00;
    assign i_hw_fused_s_fpu_op_o_D_ACT = i_hw_fused_ACT ? i_hw_fused_s_fpu_op_o_D : 6'h00;
    assign i_hw_store_s_fu_o_D = i_hw_store_ACT ? 4'h2 : 4'h0;
    assign i_hw_store_s_fu_s1_source_o_D = i_hw_store_ACT ? 2'h1 : 2'h0;
    assign i_hw_store_s_fu_s2_source_o_D = i_hw_store_ACT ? 2'h1 : 2'h0;
    assign i_hw_store_s_imm_type_D = i_hw_store_ACT ? 5'h02 : 5'h00;
    assign codasip_tmp_var_0_i_hw_store_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MI10opc_storesIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_stores3opc;
    assign i_hw_store_s_op_o_D = (codasip_tmp_var_0_i_hw_store_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h023) ? 8'h15 :
        (codasip_tmp_var_0_i_hw_store_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h0a3) ? 8'h16 :
        (codasip_tmp_var_0_i_hw_store_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h123) ? 8'h17 : 8'h00;
    assign i_hw_store_s_op_o_D_ACT = i_hw_store_ACT ? i_hw_store_s_op_o_D : 8'h00;
    assign i_hw_ebreak_s_fu_o_D = i_hw_ebreak_ACT ? 4'h6 : 4'h0;
    assign i_hw_ebreak_s_op_o_D = i_hw_ebreak_ACT ? 8'h37 : 8'h00;
    assign i_hw_fclass_s_fu_o_D = i_hw_fclass_ACT ? 4'h7 : 4'h0;
    assign i_hw_fclass_s_fu_s1_source_o_D = i_hw_fclass_ACT ? 2'h1 : 2'h0;
    assign i_hw_fclass_s_rs1_float_o_D = i_hw_fclass_ACT ? 1'b1 : 1'b0;
    assign i_hw_fclass_s_fpu_op_o_D = i_hw_fclass_ACT ? 6'h1f : 6'h00;
    assign i_hw_fencei_s_fu_o_D = i_hw_fencei_ACT ? 4'h2 : 4'h0;
    assign i_hw_fencei_s_op_o_D = i_hw_fencei_ACT ? 8'h1d : 8'h00;
    assign i_hw_fstore_s_fu_o_D = i_hw_fstore_ACT ? 4'h2 : 4'h0;
    assign i_hw_fstore_s_fu_s1_source_o_D = i_hw_fstore_ACT ? 2'h1 : 2'h0;
    assign i_hw_fstore_s_fu_s2_source_o_D = i_hw_fstore_ACT ? 2'h1 : 2'h0;
    assign i_hw_fstore_s_imm_type_D = i_hw_fstore_ACT ? 5'h02 : 5'h00;
    assign i_hw_fstore_s_op_o_D = i_hw_fstore_ACT ? 8'h1b : 8'h00;
    assign i_hw_fstore_s_rs2_float_o_D = i_hw_fstore_ACT ? 1'b1 : 1'b0;
    assign i_hw_sinj_f_s_fu_o_D = i_hw_sinj_f_ACT ? 4'h7 : 4'h0;
    assign i_hw_sinj_f_s_fu_s1_source_o_D = i_hw_sinj_f_ACT ? 2'h1 : 2'h0;
    assign i_hw_sinj_f_s_fu_s2_source_o_D = i_hw_sinj_f_ACT ? 2'h1 : 2'h0;
    assign i_hw_sinj_f_s_rs1_float_o_D = i_hw_sinj_f_ACT ? 1'b1 : 1'b0;
    assign i_hw_sinj_f_s_rs2_float_o_D = i_hw_sinj_f_ACT ? 1'b1 : 1'b0;
    assign i_hw_sinj_f_s_rd_float_o_D = i_hw_sinj_f_ACT ? 1'b1 : 1'b0;
    assign codasip_tmp_var_0_i_hw_sinj_f_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MI10opc_sinj_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec13_10opc_sinj_f3opc;
    assign i_hw_sinj_f_s_fpu_op_o_D = (codasip_tmp_var_0_i_hw_sinj_f_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 15'h1053) ? 6'h19 :
        (codasip_tmp_var_0_i_hw_sinj_f_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 15'h10d3) ? 6'h1a :
        (codasip_tmp_var_0_i_hw_sinj_f_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 15'h1153) ? 6'h1b : 6'h00;
    assign i_hw_sinj_f_s_fpu_op_o_D_ACT = i_hw_sinj_f_ACT ? i_hw_sinj_f_s_fpu_op_o_D : 6'h00;
    assign i_hw_br_comp_s_fu_o_D = i_hw_br_comp_ACT ? 4'h3 : 4'h0;
    assign i_hw_br_comp_s_fu_s1_source_o_D = i_hw_br_comp_ACT ? 2'h1 : 2'h0;
    assign i_hw_br_comp_s_imm_type_D = i_hw_br_comp_ACT ? 5'h0b : 5'h00;
    assign codasip_tmp_var_0_i_hw_br_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MI11opc_br_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec14_11opc_br_comp3opc;
    assign i_hw_br_comp_s_op_o_D = (codasip_tmp_var_0_i_hw_br_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 5'h19) ? 8'h0a :
        (codasip_tmp_var_0_i_hw_br_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 5'h1d) ? 8'h0b : 8'h00;
    assign i_hw_br_comp_s_op_o_D_ACT = i_hw_br_comp_ACT ? i_hw_br_comp_s_op_o_D : 8'h00;
    assign i_hw_br_comp_s_rs1_type_D = i_hw_br_comp_ACT ? 3'h3 : 3'h0;
    assign s_rs1_type_D = (((((((((((((((i_hw_br_comp_s_rs1_type_D | i_hw_loadwsp_s_rs1_type_D) | i_hw_lsw_comp_s_rs1_type_D) | i_hw_sri_comp_s_rs1_type_D) | i_hw_storewsp_s_rs1_type_D) | i_hw_addi_comp_s_rs1_type_D) | i_hw_andi_comp_s_rs1_type_D) | i_hw_flsw_comp_s_rs1_type_D) | i_hw_jalr_comp_s_rs1_type_D) | i_hw_loadflwsp_s_rs1_type_D) | i_hw_slli_comp_s_rs1_type_D) | i_hw_mvadd_comp_s_rs1_type_D) | i_hw_storefswsp_s_rs1_type_D) | i_hw_addisp_comp_s_rs1_type_D) | i_hw_addispn_comp_s_rs1_type_D) | i_hw_compreg_comp_s_rs1_type_D);
    assign i_hw_br_comp_s_instr_illegal_on_dbg_D = i_hw_br_comp_ACT ? 1'b1 : 1'b0;
    assign i_hw_conv_fx_s_fu_o_D = i_hw_conv_fx_ACT ? 4'h7 : 4'h0;
    assign i_hw_conv_fx_s_fu_s1_source_o_D = i_hw_conv_fx_ACT ? 2'h1 : 2'h0;
    assign i_hw_conv_fx_s_rs1_float_o_D = i_hw_conv_fx_ACT ? 1'b1 : 1'b0;
    assign codasip_tmp_var_0_i_hw_conv_fx_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MI7fmt_i32IH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec9_7fmt_i324ifmt;
    assign i_hw_conv_fx_s_fpu_op_o_D = (codasip_tmp_var_0_i_hw_conv_fx_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 2'h0) ? 6'h0b :
        (codasip_tmp_var_0_i_hw_conv_fx_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 2'h1) ? 6'h0d : 6'h00;
    assign i_hw_conv_fx_s_fpu_op_o_D_ACT = i_hw_conv_fx_ACT ? i_hw_conv_fx_s_fpu_op_o_D : 6'h00;
    assign i_hw_conv_xf_s_fu_o_D = i_hw_conv_xf_ACT ? 4'h7 : 4'h0;
    assign i_hw_conv_xf_s_fu_s1_source_o_D = i_hw_conv_xf_ACT ? 2'h1 : 2'h0;
    assign i_hw_conv_xf_s_rd_float_o_D = i_hw_conv_xf_ACT ? 1'b1 : 1'b0;
    assign codasip_tmp_var_0_i_hw_conv_xf_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MI7fmt_i32IH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec9_7fmt_i324ifmt;
    assign i_hw_conv_xf_s_fpu_op_o_D = (codasip_tmp_var_0_i_hw_conv_xf_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 2'h0) ? 6'h0c :
        (codasip_tmp_var_0_i_hw_conv_xf_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 2'h1) ? 6'h0e : 6'h00;
    assign i_hw_conv_xf_s_fpu_op_o_D_ACT = i_hw_conv_xf_ACT ? i_hw_conv_xf_s_fpu_op_o_D : 6'h00;
    assign i_hw_li_comp_s_fu_o_D = i_hw_li_comp_ACT ? 4'h1 : 4'h0;
    assign i_hw_li_comp_s_fu_s2_source_o_D = i_hw_li_comp_ACT ? 2'h2 : 2'h0;
    assign i_hw_li_comp_s_imm_type_D = i_hw_li_comp_ACT ? 5'h0c : 5'h00;
    assign i_hw_li_comp_s_op_o_D = i_hw_li_comp_ACT ? 8'h00 : 8'h00;
    assign i_hw_li_comp_s_rd_type_D = i_hw_li_comp_ACT ? 3'h0 : 3'h0;
    assign s_rd_type_D = (((((((((((((((i_hw_li_comp_s_rd_type_D | i_hw_loadwsp_s_rd_type_D) | i_hw_jal_comp_s_rd_type_D_ACT) | i_hw_lsw_comp_s_rd_type_D_ACT) | i_hw_lui_comp_s_rd_type_D) | i_hw_sri_comp_s_rd_type_D) | i_hw_addi_comp_s_rd_type_D) | i_hw_andi_comp_s_rd_type_D) | i_hw_flsw_comp_s_rd_type_D_ACT) | i_hw_jalr_comp_s_rd_type_D_ACT) | i_hw_loadflwsp_s_rd_type_D) | i_hw_slli_comp_s_rd_type_D) | i_hw_mvadd_comp_s_rd_type_D) | i_hw_addisp_comp_s_rd_type_D) | i_hw_addispn_comp_s_rd_type_D) | i_hw_compreg_comp_s_rd_type_D);
    assign i_hw_loadwsp_s_fu_o_D = i_hw_loadwsp_ACT ? 4'h2 : 4'h0;
    assign i_hw_loadwsp_s_fu_s1_source_o_D = i_hw_loadwsp_ACT ? 2'h1 : 2'h0;
    assign i_hw_loadwsp_s_imm_type_D = i_hw_loadwsp_ACT ? 5'h07 : 5'h00;
    assign i_hw_loadwsp_s_op_o_D = i_hw_loadwsp_ACT ? 8'h12 : 8'h00;
    assign i_hw_loadwsp_s_rs1_type_D = i_hw_loadwsp_ACT ? 3'h5 : 3'h0;
    assign i_hw_loadwsp_s_rd_type_D = i_hw_loadwsp_ACT ? 3'h0 : 3'h0;
    assign i_hw_mv_ff2x_s_fu_o_D = i_hw_mv_ff2x_ACT ? 4'h7 : 4'h0;
    assign i_hw_mv_ff2x_s_fu_s1_source_o_D = i_hw_mv_ff2x_ACT ? 2'h1 : 2'h0;
    assign i_hw_mv_ff2x_s_rs1_float_o_D = i_hw_mv_ff2x_ACT ? 1'b1 : 1'b0;
    assign i_hw_mv_ff2x_s_fpu_op_o_D = i_hw_mv_ff2x_ACT ? 6'h17 : 6'h00;
    assign i_hw_mv_fx2f_s_fu_o_D = i_hw_mv_fx2f_ACT ? 4'h7 : 4'h0;
    assign i_hw_mv_fx2f_s_fu_s1_source_o_D = i_hw_mv_fx2f_ACT ? 2'h1 : 2'h0;
    assign i_hw_mv_fx2f_s_rd_float_o_D = i_hw_mv_fx2f_ACT ? 1'b1 : 1'b0;
    assign i_hw_mv_fx2f_s_fpu_op_o_D = i_hw_mv_fx2f_ACT ? 6'h18 : 6'h00;
    assign opc_csrrc_hw_codasip_return_MP12decode_stage3decMI21opc_control_registersIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec42_12decode_stage3dec21opc_control_registers3opc_D = opc_csrrc_hw_ACT ? 10'h1f3 : 10'h000;
    assign codasip_return_MP12decode_stage3decMI21opc_control_registersIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec42_12decode_stage3dec21opc_control_registers3opc = ((opc_csrrc_hw_codasip_return_MP12decode_stage3decMI21opc_control_registersIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec42_12decode_stage3dec21opc_control_registers3opc_D | opc_csrrs_hw_codasip_return_MP12decode_stage3decMI21opc_control_registersIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec42_12decode_stage3dec21opc_control_registers3opc_D) | opc_csrrw_hw_codasip_return_MP12decode_stage3decMI21opc_control_registersIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec42_12decode_stage3dec21opc_control_registers3opc_D);
    assign opc_csrrs_hw_codasip_return_MP12decode_stage3decMI21opc_control_registersIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec42_12decode_stage3dec21opc_control_registers3opc_D = opc_csrrs_hw_ACT ? 10'h173 : 10'h000;
    assign opc_csrrw_hw_codasip_return_MP12decode_stage3decMI21opc_control_registersIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec42_12decode_stage3dec21opc_control_registers3opc_D = opc_csrrw_hw_ACT ? 10'h0f3 : 10'h000;
    assign i_hw_fmin_max_s_fu_o_D = i_hw_fmin_max_ACT ? 4'h7 : 4'h0;
    assign i_hw_fmin_max_s_fu_s1_source_o_D = i_hw_fmin_max_ACT ? 2'h1 : 2'h0;
    assign i_hw_fmin_max_s_fu_s2_source_o_D = i_hw_fmin_max_ACT ? 2'h1 : 2'h0;
    assign i_hw_fmin_max_s_rs1_float_o_D = i_hw_fmin_max_ACT ? 1'b1 : 1'b0;
    assign i_hw_fmin_max_s_rs2_float_o_D = i_hw_fmin_max_ACT ? 1'b1 : 1'b0;
    assign i_hw_fmin_max_s_rd_float_o_D = i_hw_fmin_max_ACT ? 1'b1 : 1'b0;
    assign codasip_tmp_var_0_i_hw_fmin_max_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MI13opc_min_max_fIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_min_max_f3opc;
    assign i_hw_fmin_max_s_fpu_op_o_D = (codasip_tmp_var_0_i_hw_fmin_max_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 15'h14d3) ? 6'h05 :
        (codasip_tmp_var_0_i_hw_fmin_max_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 15'h1453) ? 6'h04 : 6'h00;
    assign i_hw_fmin_max_s_fpu_op_o_D_ACT = i_hw_fmin_max_ACT ? i_hw_fmin_max_s_fpu_op_o_D : 6'h00;
    assign i_hw_jal_comp_s_fu_o_D = i_hw_jal_comp_ACT ? 4'h3 : 4'h0;
    assign i_hw_jal_comp_s_fu_s2_source_o_D = i_hw_jal_comp_ACT ? 2'h2 : 2'h0;
    assign i_hw_jal_comp_s_imm_type_D = i_hw_jal_comp_ACT ? 5'h0a : 5'h00;
    assign i_hw_jal_comp_s_op_o_D = i_hw_jal_comp_ACT ? 8'h48 : 8'h00;
    assign codasip_tmp_var_0_i_hw_jal_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MI12opc_jmp_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_jmp_comp3opc;
    assign i_hw_jal_comp_s_rd_type_D = (codasip_tmp_var_0_i_hw_jal_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 5'h15) ? 3'h3 :
        (codasip_tmp_var_0_i_hw_jal_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 5'h05) ? 3'h4 : 3'h0;
    assign i_hw_jal_comp_s_rd_type_D_ACT = i_hw_jal_comp_ACT ? i_hw_jal_comp_s_rd_type_D : 3'h0;
    assign i_hw_jal_comp_s_instr_illegal_on_dbg_D = i_hw_jal_comp_ACT ? 1'b1 : 1'b0;
    assign i_hw_lsw_comp_s_fu_o_D = i_hw_lsw_comp_ACT ? 4'h2 : 4'h0;
    assign i_hw_lsw_comp_s_fu_s1_source_o_D = i_hw_lsw_comp_ACT ? 2'h1 : 2'h0;
    assign i_hw_lsw_comp_s_imm_type_D = i_hw_lsw_comp_ACT ? 5'h09 : 5'h00;
    assign i_hw_lsw_comp_s_rs1_type_D = i_hw_lsw_comp_ACT ? 3'h3 : 3'h0;
    assign codasip_tmp_var_0_i_hw_lsw_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MI12opc_lsw_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_lsw_comp3opc;
    assign i_hw_lsw_comp_s_op_o_D = (codasip_tmp_var_0_i_hw_lsw_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 5'h08) ? 8'h12 :
        (codasip_tmp_var_0_i_hw_lsw_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 5'h18) ? 8'h17 : 8'h00;
    assign i_hw_lsw_comp_s_op_o_D_ACT = i_hw_lsw_comp_ACT ? i_hw_lsw_comp_s_op_o_D : 8'h00;
    assign i_hw_lsw_comp_s_rd_type_D = (codasip_tmp_var_0_i_hw_lsw_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 5'h08) ? 3'h1 : 3'h0;
    assign i_hw_lsw_comp_s_rd_type_D_ACT = i_hw_lsw_comp_ACT ? i_hw_lsw_comp_s_rd_type_D : 3'h0;
    assign i_hw_lsw_comp_s_fu_s2_source_o_D = (codasip_tmp_var_0_i_hw_lsw_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 5'h18) ? 2'h1 : 2'h0;
    assign i_hw_lsw_comp_s_fu_s2_source_o_D_ACT = i_hw_lsw_comp_ACT ? i_hw_lsw_comp_s_fu_s2_source_o_D : 2'h0;
    assign i_hw_lsw_comp_s_rs2_type_D = (codasip_tmp_var_0_i_hw_lsw_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 5'h18) ? 3'h2 : 3'h0;
    assign i_hw_lsw_comp_s_rs2_type_D_ACT = i_hw_lsw_comp_ACT ? i_hw_lsw_comp_s_rs2_type_D : 3'h0;
    assign s_rs2_type_D = (((((i_hw_lsw_comp_s_rs2_type_D_ACT | i_hw_storewsp_s_rs2_type_D) | i_hw_flsw_comp_s_rs2_type_D_ACT) | i_hw_mvadd_comp_s_rs2_type_D) | i_hw_storefswsp_s_rs2_type_D) | i_hw_compreg_comp_s_rs2_type_D);
    assign i_hw_lui_comp_s_fu_o_D = i_hw_lui_comp_ACT ? 4'h1 : 4'h0;
    assign i_hw_lui_comp_s_fu_s2_source_o_D = i_hw_lui_comp_ACT ? 2'h2 : 2'h0;
    assign i_hw_lui_comp_s_imm_type_D = i_hw_lui_comp_ACT ? 5'h0d : 5'h00;
    assign i_hw_lui_comp_s_op_o_D = i_hw_lui_comp_ACT ? 8'h00 : 8'h00;
    assign i_hw_lui_comp_s_rd_type_D = i_hw_lui_comp_ACT ? 3'h0 : 3'h0;
    assign i_hw_sri_comp_s_fu_o_D = i_hw_sri_comp_ACT ? 4'h1 : 4'h0;
    assign i_hw_sri_comp_s_fu_s1_source_o_D = i_hw_sri_comp_ACT ? 2'h1 : 2'h0;
    assign i_hw_sri_comp_s_fu_s2_source_o_D = i_hw_sri_comp_ACT ? 2'h2 : 2'h0;
    assign i_hw_sri_comp_s_imm_type_D = i_hw_sri_comp_ACT ? 5'h11 : 5'h00;
    assign codasip_tmp_var_0_i_hw_sri_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MI12opc_sri_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec15_12opc_sri_comp3opc;
    assign i_hw_sri_comp_s_op_o_D = (codasip_tmp_var_0_i_hw_sri_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 7'h41) ? 8'h08 :
        (codasip_tmp_var_0_i_hw_sri_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 7'h45) ? 8'h09 : 8'h00;
    assign i_hw_sri_comp_s_op_o_D_ACT = i_hw_sri_comp_ACT ? i_hw_sri_comp_s_op_o_D : 8'h00;
    assign i_hw_sri_comp_s_rs1_type_D = i_hw_sri_comp_ACT ? 3'h3 : 3'h0;
    assign i_hw_sri_comp_s_rd_type_D = i_hw_sri_comp_ACT ? 3'h2 : 3'h0;
    assign i_hw_storewsp_s_fu_o_D = i_hw_storewsp_ACT ? 4'h2 : 4'h0;
    assign i_hw_storewsp_s_fu_s1_source_o_D = i_hw_storewsp_ACT ? 2'h1 : 2'h0;
    assign i_hw_storewsp_s_fu_s2_source_o_D = i_hw_storewsp_ACT ? 2'h1 : 2'h0;
    assign i_hw_storewsp_s_imm_type_D = i_hw_storewsp_ACT ? 5'h08 : 5'h00;
    assign i_hw_storewsp_s_op_o_D = i_hw_storewsp_ACT ? 8'h17 : 8'h00;
    assign i_hw_storewsp_s_rs1_type_D = i_hw_storewsp_ACT ? 3'h5 : 3'h0;
    assign i_hw_storewsp_s_rs2_type_D = i_hw_storewsp_ACT ? 3'h1 : 3'h0;
    assign opc_csrrci_hw_codasip_return_MP12decode_stage3decMI23opc_control_registers_iIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec44_12decode_stage3dec23opc_control_registers_i3opc_D = opc_csrrci_hw_ACT ? 10'h3f3 : 10'h000;
    assign codasip_return_MP12decode_stage3decMI23opc_control_registers_iIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec44_12decode_stage3dec23opc_control_registers_i3opc = ((opc_csrrci_hw_codasip_return_MP12decode_stage3decMI23opc_control_registers_iIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec44_12decode_stage3dec23opc_control_registers_i3opc_D | opc_csrrsi_hw_codasip_return_MP12decode_stage3decMI23opc_control_registers_iIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec44_12decode_stage3dec23opc_control_registers_i3opc_D) | opc_csrrwi_hw_codasip_return_MP12decode_stage3decMI23opc_control_registers_iIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec44_12decode_stage3dec23opc_control_registers_i3opc_D);
    assign opc_csrrsi_hw_codasip_return_MP12decode_stage3decMI23opc_control_registers_iIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec44_12decode_stage3dec23opc_control_registers_i3opc_D = opc_csrrsi_hw_ACT ? 10'h373 : 10'h000;
    assign opc_csrrwi_hw_codasip_return_MP12decode_stage3decMI23opc_control_registers_iIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec44_12decode_stage3dec23opc_control_registers_i3opc_D = opc_csrrwi_hw_ACT ? 10'h2f3 : 10'h000;
    assign i_hw_addi_comp_s_fu_o_D = i_hw_addi_comp_ACT ? 4'h1 : 4'h0;
    assign i_hw_addi_comp_s_fu_s1_source_o_D = i_hw_addi_comp_ACT ? 2'h1 : 2'h0;
    assign i_hw_addi_comp_s_fu_s2_source_o_D = i_hw_addi_comp_ACT ? 2'h2 : 2'h0;
    assign i_hw_addi_comp_s_imm_type_D = i_hw_addi_comp_ACT ? 5'h0f : 5'h00;
    assign i_hw_addi_comp_s_op_o_D = i_hw_addi_comp_ACT ? 8'h00 : 8'h00;
    assign i_hw_addi_comp_s_rs1_type_D = i_hw_addi_comp_ACT ? 3'h4 : 3'h0;
    assign i_hw_addi_comp_s_rd_type_D = i_hw_addi_comp_ACT ? 3'h0 : 3'h0;
    assign i_hw_andi_comp_s_fu_o_D = i_hw_andi_comp_ACT ? 4'h1 : 4'h0;
    assign i_hw_andi_comp_s_fu_s1_source_o_D = i_hw_andi_comp_ACT ? 2'h1 : 2'h0;
    assign i_hw_andi_comp_s_fu_s2_source_o_D = i_hw_andi_comp_ACT ? 2'h2 : 2'h0;
    assign i_hw_andi_comp_s_imm_type_D = i_hw_andi_comp_ACT ? 5'h12 : 5'h00;
    assign i_hw_andi_comp_s_op_o_D = i_hw_andi_comp_ACT ? 8'h04 : 8'h00;
    assign i_hw_andi_comp_s_rs1_type_D = i_hw_andi_comp_ACT ? 3'h3 : 3'h0;
    assign i_hw_andi_comp_s_rd_type_D = i_hw_andi_comp_ACT ? 3'h2 : 3'h0;
    assign i_hw_comp_3reg_s_fu_s1_source_o_D = i_hw_comp_3reg_ACT ? 2'h1 : 2'h0;
    assign i_hw_comp_3reg_s_fu_s2_source_o_D = i_hw_comp_3reg_ACT ? 2'h1 : 2'h0;
    assign codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MI13opc_comp_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_comp_3reg3opc;
    assign i_hw_comp_3reg_s_fu_o_D = ((((((((((codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h00033) || (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h00133)) || (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h001b3)) || (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h003b3)) || (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h00333)) || (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h00233)) || (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h000b3)) || (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h002b3)) || (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h08033)) || (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h082b3)) ? 4'h1 :
        ((((codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h00433) || (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h004b3)) || (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h005b3)) || (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h00533)) ? 4'h5 :
        ((((codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h00633) || (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h006b3)) || (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h00733)) || (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h007b3)) ? 4'h4 : 4'h0;
    assign i_hw_comp_3reg_s_fu_o_D_ACT = i_hw_comp_3reg_ACT ? i_hw_comp_3reg_s_fu_o_D : 4'h0;
    assign i_hw_comp_3reg_s_op_o_D = (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h00033) ? 8'h00 :
        (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h00133) ? 8'h02 :
        (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h001b3) ? 8'h03 :
        (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h003b3) ? 8'h04 :
        (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h00333) ? 8'h05 :
        (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h00233) ? 8'h06 :
        (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h000b3) ? 8'h07 :
        (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h002b3) ? 8'h08 :
        (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h08033) ? 8'h01 :
        (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h082b3) ? 8'h09 :
        (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h00433) ? 8'h43 :
        (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h004b3) ? 8'h44 :
        (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h005b3) ? 8'h46 :
        (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h00533) ? 8'h45 :
        (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h00633) ? 8'h3f :
        (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h006b3) ? 8'h40 :
        (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h00733) ? 8'h41 :
        (codasip_tmp_var_0_i_hw_comp_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h007b3) ? 8'h42 : 8'h00;
    assign i_hw_comp_3reg_s_op_o_D_ACT = i_hw_comp_3reg_ACT ? i_hw_comp_3reg_s_op_o_D : 8'h00;
    assign i_hw_flsw_comp_s_fu_o_D = i_hw_flsw_comp_ACT ? 4'h2 : 4'h0;
    assign i_hw_flsw_comp_s_fu_s1_source_o_D = i_hw_flsw_comp_ACT ? 2'h1 : 2'h0;
    assign i_hw_flsw_comp_s_fu_s2_source_o_D = i_hw_flsw_comp_ACT ? 2'h1 : 2'h0;
    assign i_hw_flsw_comp_s_imm_type_D = i_hw_flsw_comp_ACT ? 5'h09 : 5'h00;
    assign i_hw_flsw_comp_s_rs1_type_D = i_hw_flsw_comp_ACT ? 3'h3 : 3'h0;
    assign codasip_tmp_var_0_i_hw_flsw_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MI13opc_flsw_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_flsw_comp3opc;
    assign i_hw_flsw_comp_s_rs1_float_o_D = (codasip_tmp_var_0_i_hw_flsw_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 5'h0c) ? 1'b0 : 1'b0;
    assign i_hw_flsw_comp_s_rs1_float_o_D_ACT = i_hw_flsw_comp_ACT ? i_hw_flsw_comp_s_rs1_float_o_D : 1'b0;
    assign i_hw_flsw_comp_s_rd_float_o_D = (codasip_tmp_var_0_i_hw_flsw_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 5'h0c) ? 1'b1 : 1'b0;
    assign i_hw_flsw_comp_s_rd_float_o_D_ACT = i_hw_flsw_comp_ACT ? i_hw_flsw_comp_s_rd_float_o_D : 1'b0;
    assign i_hw_flsw_comp_s_op_o_D = (codasip_tmp_var_0_i_hw_flsw_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 5'h0c) ? 8'h19 :
        (codasip_tmp_var_0_i_hw_flsw_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 5'h1c) ? 8'h1b : 8'h00;
    assign i_hw_flsw_comp_s_op_o_D_ACT = i_hw_flsw_comp_ACT ? i_hw_flsw_comp_s_op_o_D : 8'h00;
    assign i_hw_flsw_comp_s_rd_type_D = (codasip_tmp_var_0_i_hw_flsw_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 5'h0c) ? 3'h1 : 3'h0;
    assign i_hw_flsw_comp_s_rd_type_D_ACT = i_hw_flsw_comp_ACT ? i_hw_flsw_comp_s_rd_type_D : 3'h0;
    assign i_hw_flsw_comp_s_rs2_float_o_D = (codasip_tmp_var_0_i_hw_flsw_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 5'h1c) ? 1'b1 : 1'b0;
    assign i_hw_flsw_comp_s_rs2_float_o_D_ACT = i_hw_flsw_comp_ACT ? i_hw_flsw_comp_s_rs2_float_o_D : 1'b0;
    assign i_hw_flsw_comp_s_rs2_type_D = (codasip_tmp_var_0_i_hw_flsw_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 5'h1c) ? 3'h2 : 3'h0;
    assign i_hw_flsw_comp_s_rs2_type_D_ACT = i_hw_flsw_comp_ACT ? i_hw_flsw_comp_s_rs2_type_D : 3'h0;
    assign i_hw_jalr_comp_s_fu_o_D = i_hw_jalr_comp_ACT ? 4'h3 : 4'h0;
    assign i_hw_jalr_comp_s_fu_s1_source_o_D = i_hw_jalr_comp_ACT ? 2'h1 : 2'h0;
    assign i_hw_jalr_comp_s_op_o_D = i_hw_jalr_comp_ACT ? 8'h47 : 8'h00;
    assign i_hw_jalr_comp_s_rs1_type_D = i_hw_jalr_comp_ACT ? 3'h4 : 3'h0;
    assign codasip_tmp_var_0_i_hw_jalr_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MI13opc_jmpr_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec16_13opc_jmpr_comp3opc;
    assign i_hw_jalr_comp_s_rd_type_D = (codasip_tmp_var_0_i_hw_jalr_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 6'h22) ? 3'h3 :
        (codasip_tmp_var_0_i_hw_jalr_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 6'h26) ? 3'h4 : 3'h0;
    assign i_hw_jalr_comp_s_rd_type_D_ACT = i_hw_jalr_comp_ACT ? i_hw_jalr_comp_s_rd_type_D : 3'h0;
    assign i_hw_jalr_comp_s_instr_illegal_on_dbg_D = i_hw_jalr_comp_ACT ? 1'b1 : 1'b0;
    assign i_hw_loadflwsp_s_fu_o_D = i_hw_loadflwsp_ACT ? 4'h2 : 4'h0;
    assign i_hw_loadflwsp_s_fu_s1_source_o_D = i_hw_loadflwsp_ACT ? 2'h1 : 2'h0;
    assign i_hw_loadflwsp_s_fu_s2_source_o_D = i_hw_loadflwsp_ACT ? 2'h2 : 2'h0;
    assign i_hw_loadflwsp_s_imm_type_D = i_hw_loadflwsp_ACT ? 5'h07 : 5'h00;
    assign i_hw_loadflwsp_s_rd_float_o_D = i_hw_loadflwsp_ACT ? 1'b1 : 1'b0;
    assign i_hw_loadflwsp_s_op_o_D = i_hw_loadflwsp_ACT ? 8'h19 : 8'h00;
    assign i_hw_loadflwsp_s_rs1_type_D = i_hw_loadflwsp_ACT ? 3'h5 : 3'h0;
    assign i_hw_loadflwsp_s_rd_type_D = i_hw_loadflwsp_ACT ? 3'h0 : 3'h0;
    assign i_hw_slli_comp_s_fu_o_D = i_hw_slli_comp_ACT ? 4'h1 : 4'h0;
    assign i_hw_slli_comp_s_fu_s1_source_o_D = i_hw_slli_comp_ACT ? 2'h1 : 2'h0;
    assign i_hw_slli_comp_s_fu_s2_source_o_D = i_hw_slli_comp_ACT ? 2'h2 : 2'h0;
    assign i_hw_slli_comp_s_imm_type_D = i_hw_slli_comp_ACT ? 5'h11 : 5'h00;
    assign i_hw_slli_comp_s_op_o_D = i_hw_slli_comp_ACT ? 8'h07 : 8'h00;
    assign i_hw_slli_comp_s_rs1_type_D = i_hw_slli_comp_ACT ? 3'h4 : 3'h0;
    assign i_hw_slli_comp_s_rd_type_D = i_hw_slli_comp_ACT ? 3'h0 : 3'h0;
    assign i_hw_mvadd_comp_s_fu_o_D = i_hw_mvadd_comp_ACT ? 4'h1 : 4'h0;
    assign codasip_tmp_var_0_i_hw_mvadd_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MI14opc_mvadd_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec17_14opc_mvadd_comp3opc;
    assign i_hw_mvadd_comp_s_fu_s1_source_o_D = (codasip_tmp_var_0_i_hw_mvadd_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 6'h22) ? 2'h0 :
        (codasip_tmp_var_0_i_hw_mvadd_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 6'h26) ? 2'h1 : 2'h0;
    assign i_hw_mvadd_comp_s_fu_s1_source_o_D_ACT = i_hw_mvadd_comp_ACT ? i_hw_mvadd_comp_s_fu_s1_source_o_D : 2'h0;
    assign i_hw_mvadd_comp_s_fu_s2_source_o_D = i_hw_mvadd_comp_ACT ? 2'h1 : 2'h0;
    assign i_hw_mvadd_comp_s_op_o_D = i_hw_mvadd_comp_ACT ? 8'h00 : 8'h00;
    assign i_hw_mvadd_comp_s_rs1_type_D = i_hw_mvadd_comp_ACT ? 3'h4 : 3'h0;
    assign i_hw_mvadd_comp_s_rs2_type_D = i_hw_mvadd_comp_ACT ? 3'h1 : 3'h0;
    assign i_hw_mvadd_comp_s_rd_type_D = i_hw_mvadd_comp_ACT ? 3'h0 : 3'h0;
    assign i_hw_storefswsp_s_fu_o_D = i_hw_storefswsp_ACT ? 4'h2 : 4'h0;
    assign i_hw_storefswsp_s_fu_s1_source_o_D = i_hw_storefswsp_ACT ? 2'h1 : 2'h0;
    assign i_hw_storefswsp_s_fu_s2_source_o_D = i_hw_storefswsp_ACT ? 2'h1 : 2'h0;
    assign i_hw_storefswsp_s_imm_type_D = i_hw_storefswsp_ACT ? 5'h08 : 5'h00;
    assign i_hw_storefswsp_s_rs2_float_o_D = i_hw_storefswsp_ACT ? 1'b1 : 1'b0;
    assign i_hw_storefswsp_s_op_o_D = i_hw_storefswsp_ACT ? 8'h1b : 8'h00;
    assign i_hw_storefswsp_s_rs1_type_D = i_hw_storefswsp_ACT ? 3'h5 : 3'h0;
    assign i_hw_storefswsp_s_rs2_type_D = i_hw_storefswsp_ACT ? 3'h1 : 3'h0;
    assign i_hw_addisp_comp_s_fu_o_D = i_hw_addisp_comp_ACT ? 4'h1 : 4'h0;
    assign i_hw_addisp_comp_s_fu_s1_source_o_D = i_hw_addisp_comp_ACT ? 2'h1 : 2'h0;
    assign i_hw_addisp_comp_s_fu_s2_source_o_D = i_hw_addisp_comp_ACT ? 2'h2 : 2'h0;
    assign i_hw_addisp_comp_s_imm_type_D = i_hw_addisp_comp_ACT ? 5'h0e : 5'h00;
    assign i_hw_addisp_comp_s_op_o_D = i_hw_addisp_comp_ACT ? 8'h00 : 8'h00;
    assign i_hw_addisp_comp_s_rs1_type_D = i_hw_addisp_comp_ACT ? 3'h4 : 3'h0;
    assign i_hw_addisp_comp_s_rd_type_D = i_hw_addisp_comp_ACT ? 3'h0 : 3'h0;
    assign i_hw_comp_b_2reg_s_fu_o_D = i_hw_comp_b_2reg_ACT ? 4'h8 : 4'h0;
    assign i_hw_comp_b_2reg_s_fu_s1_source_o_D = i_hw_comp_b_2reg_ACT ? 2'h1 : 2'h0;
    assign codasip_tmp_var_0_i_hw_comp_b_2reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MP12decode_stage3decMI15opc_comp_b_2regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_2reg3opc;
    assign i_hw_comp_b_2reg_s_op_o_D = (codasip_tmp_var_0_i_hw_comp_b_2reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 22'h180093) ? 8'h84 :
        (codasip_tmp_var_0_i_hw_comp_b_2reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 22'h180493) ? 8'h86 :
        (codasip_tmp_var_0_i_hw_comp_b_2reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 22'h180893) ? 8'h85 :
        (codasip_tmp_var_0_i_hw_comp_b_2reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 22'h181093) ? 8'h90 :
        (codasip_tmp_var_0_i_hw_comp_b_2reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 22'h181493) ? 8'h91 :
        (codasip_tmp_var_0_i_hw_comp_b_2reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 22'h020233) ? 8'h93 :
        (codasip_tmp_var_0_i_hw_comp_b_2reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 22'h0a1e93) ? 8'h8b :
        (codasip_tmp_var_0_i_hw_comp_b_2reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 22'h1a6293) ? 8'h8d : 8'h00;
    assign i_hw_comp_b_2reg_s_op_o_D_ACT = i_hw_comp_b_2reg_ACT ? i_hw_comp_b_2reg_s_op_o_D : 8'h00;
    assign i_hw_comp_b_3reg_s_fu_s1_source_o_D = i_hw_comp_b_3reg_ACT ? 2'h1 : 2'h0;
    assign i_hw_comp_b_3reg_s_fu_s2_source_o_D = i_hw_comp_b_3reg_ACT ? 2'h1 : 2'h0;
    assign i_hw_comp_b_3reg_s_fu_o_D = i_hw_comp_b_3reg_ACT ? 4'h8 : 4'h0;
    assign codasip_tmp_var_0_i_hw_comp_b_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MP12decode_stage3decMI15opc_comp_b_3regIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec36_12decode_stage3dec15opc_comp_b_3reg3opc;
    assign i_hw_comp_b_3reg_s_op_o_D = (codasip_tmp_var_0_i_hw_comp_b_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h04133) ? 8'h80 :
        (codasip_tmp_var_0_i_hw_comp_b_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h04233) ? 8'h81 :
        (codasip_tmp_var_0_i_hw_comp_b_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h04333) ? 8'h82 :
        (codasip_tmp_var_0_i_hw_comp_b_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h083b3) ? 8'h83 :
        (codasip_tmp_var_0_i_hw_comp_b_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h08333) ? 8'h8c :
        (codasip_tmp_var_0_i_hw_comp_b_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h08233) ? 8'h92 :
        (codasip_tmp_var_0_i_hw_comp_b_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h01733) ? 8'h87 :
        (codasip_tmp_var_0_i_hw_comp_b_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h017b3) ? 8'h88 :
        (codasip_tmp_var_0_i_hw_comp_b_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h01633) ? 8'h89 :
        (codasip_tmp_var_0_i_hw_comp_b_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h016b3) ? 8'h8a :
        (codasip_tmp_var_0_i_hw_comp_b_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h0c0b3) ? 8'h8e :
        (codasip_tmp_var_0_i_hw_comp_b_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h0c2b3) ? 8'h8f :
        (codasip_tmp_var_0_i_hw_comp_b_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h014b3) ? 8'h94 :
        (codasip_tmp_var_0_i_hw_comp_b_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h015b3) ? 8'h95 :
        (codasip_tmp_var_0_i_hw_comp_b_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h01533) ? 8'h96 :
        (codasip_tmp_var_0_i_hw_comp_b_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h090b3) ? 8'h97 :
        (codasip_tmp_var_0_i_hw_comp_b_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h092b3) ? 8'h98 :
        (codasip_tmp_var_0_i_hw_comp_b_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h0d0b3) ? 8'h99 :
        (codasip_tmp_var_0_i_hw_comp_b_3reg_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h050b3) ? 8'h9a : 8'h00;
    assign i_hw_comp_b_3reg_s_op_o_D_ACT = i_hw_comp_b_3reg_ACT ? i_hw_comp_b_3reg_s_op_o_D : 8'h00;
    assign i_hw_ebreak_comp_s_fu_o_D = i_hw_ebreak_comp_ACT ? 4'h6 : 4'h0;
    assign i_hw_ebreak_comp_s_op_o_D = i_hw_ebreak_comp_ACT ? 8'h37 : 8'h00;
    assign i_hw_addispn_comp_s_fu_o_D = i_hw_addispn_comp_ACT ? 4'h1 : 4'h0;
    assign i_hw_addispn_comp_s_fu_s1_source_o_D = i_hw_addispn_comp_ACT ? 2'h1 : 2'h0;
    assign i_hw_addispn_comp_s_fu_s2_source_o_D = i_hw_addispn_comp_ACT ? 2'h2 : 2'h0;
    assign i_hw_addispn_comp_s_imm_type_D = i_hw_addispn_comp_ACT ? 5'h10 : 5'h00;
    assign i_hw_addispn_comp_s_op_o_D = i_hw_addispn_comp_ACT ? 8'h00 : 8'h00;
    assign i_hw_addispn_comp_s_rs1_type_D = i_hw_addispn_comp_ACT ? 3'h5 : 3'h0;
    assign i_hw_addispn_comp_s_rd_type_D = i_hw_addispn_comp_ACT ? 3'h1 : 3'h0;
    assign i_hw_compreg_comp_s_fu_o_D = i_hw_compreg_comp_ACT ? 4'h1 : 4'h0;
    assign i_hw_compreg_comp_s_fu_s1_source_o_D = i_hw_compreg_comp_ACT ? 2'h1 : 2'h0;
    assign i_hw_compreg_comp_s_fu_s2_source_o_D = i_hw_compreg_comp_ACT ? 2'h1 : 2'h0;
    assign codasip_tmp_var_0_i_hw_compreg_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MI16opc_compreg_compIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec19_16opc_compreg_comp3opc;
    assign i_hw_compreg_comp_s_op_o_D = (codasip_tmp_var_0_i_hw_compreg_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h23d) ? 8'h04 :
        (codasip_tmp_var_0_i_hw_compreg_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h239) ? 8'h05 :
        (codasip_tmp_var_0_i_hw_compreg_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h235) ? 8'h06 :
        (codasip_tmp_var_0_i_hw_compreg_comp_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h231) ? 8'h01 : 8'h00;
    assign i_hw_compreg_comp_s_op_o_D_ACT = i_hw_compreg_comp_ACT ? i_hw_compreg_comp_s_op_o_D : 8'h00;
    assign i_hw_compreg_comp_s_rs1_type_D = i_hw_compreg_comp_ACT ? 3'h3 : 3'h0;
    assign i_hw_compreg_comp_s_rs2_type_D = i_hw_compreg_comp_ACT ? 3'h2 : 3'h0;
    assign i_hw_compreg_comp_s_rd_type_D = i_hw_compreg_comp_ACT ? 3'h2 : 3'h0;
    assign i_hw_comp_2reg_imm_s_fu_o_D = i_hw_comp_2reg_imm_ACT ? 4'h1 : 4'h0;
    assign i_hw_comp_2reg_imm_s_fu_s1_source_o_D = i_hw_comp_2reg_imm_ACT ? 2'h1 : 2'h0;
    assign i_hw_comp_2reg_imm_s_fu_s2_source_o_D = i_hw_comp_2reg_imm_ACT ? 2'h2 : 2'h0;
    assign i_hw_comp_2reg_imm_s_imm_type_D = i_hw_comp_2reg_imm_ACT ? 5'h01 : 5'h00;
    assign codasip_tmp_var_0_i_hw_comp_2reg_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MI17opc_comp_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec20_17opc_comp_2reg_imm3opc;
    assign i_hw_comp_2reg_imm_s_op_o_D = (codasip_tmp_var_0_i_hw_comp_2reg_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h013) ? 8'h00 :
        (codasip_tmp_var_0_i_hw_comp_2reg_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h113) ? 8'h02 :
        (codasip_tmp_var_0_i_hw_comp_2reg_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h193) ? 8'h03 :
        (codasip_tmp_var_0_i_hw_comp_2reg_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h393) ? 8'h04 :
        (codasip_tmp_var_0_i_hw_comp_2reg_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h313) ? 8'h05 :
        (codasip_tmp_var_0_i_hw_comp_2reg_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h213) ? 8'h06 : 8'h00;
    assign i_hw_comp_2reg_imm_s_op_o_D_ACT = i_hw_comp_2reg_imm_ACT ? i_hw_comp_2reg_imm_s_op_o_D : 8'h00;
    assign i_hw_comp_b_2reg_imm_s_fu_o_D = i_hw_comp_b_2reg_imm_ACT ? 4'h8 : 4'h0;
    assign i_hw_comp_b_2reg_imm_s_fu_s1_source_o_D = i_hw_comp_b_2reg_imm_ACT ? 2'h1 : 2'h0;
    assign i_hw_comp_b_2reg_imm_s_fu_s2_source_o_D = i_hw_comp_b_2reg_imm_ACT ? 2'h2 : 2'h0;
    assign i_hw_comp_b_2reg_imm_s_imm_type_D = i_hw_comp_b_2reg_imm_ACT ? 5'h01 : 5'h00;
    assign codasip_tmp_var_0_i_hw_comp_b_2reg_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MP12decode_stage3decMI19opc_comp_b_2reg_immIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec40_12decode_stage3dec19opc_comp_b_2reg_imm3opc;
    assign i_hw_comp_b_2reg_imm_s_op_o_D = (codasip_tmp_var_0_i_hw_comp_b_2reg_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h09093) ? 8'h97 :
        (codasip_tmp_var_0_i_hw_comp_b_2reg_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h09293) ? 8'h98 :
        (codasip_tmp_var_0_i_hw_comp_b_2reg_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h0d093) ? 8'h99 :
        (codasip_tmp_var_0_i_hw_comp_b_2reg_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h05093) ? 8'h9a :
        (codasip_tmp_var_0_i_hw_comp_b_2reg_imm_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h0c293) ? 8'h8f : 8'h00;
    assign i_hw_comp_b_2reg_imm_s_op_o_D_ACT = i_hw_comp_b_2reg_imm_ACT ? i_hw_comp_b_2reg_imm_s_op_o_D : 8'h00;
    assign i_hw_control_registers_s_fu_o_D = i_hw_control_registers_ACT ? 4'h6 : 4'h0;
    assign i_hw_control_registers_s_fu_s1_source_o_D = i_hw_control_registers_ACT ? 2'h1 : 2'h0;
    assign codasip_tmp_var_0_i_hw_control_registers_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MP12decode_stage3decMI21opc_control_registersIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec42_12decode_stage3dec21opc_control_registers3opc;
    assign i_hw_control_registers_s_op_o_D = (codasip_tmp_var_0_i_hw_control_registers_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h0f3) ? 8'h34 :
        (codasip_tmp_var_0_i_hw_control_registers_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h173) ? 8'h35 :
        (codasip_tmp_var_0_i_hw_control_registers_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h1f3) ? 8'h36 : 8'h00;
    assign i_hw_control_registers_s_op_o_D_ACT = i_hw_control_registers_ACT ? i_hw_control_registers_s_op_o_D : 8'h00;
    assign i_hw_comp_2reg_imm_shift_s_fu_o_D = i_hw_comp_2reg_imm_shift_ACT ? 4'h1 : 4'h0;
    assign i_hw_comp_2reg_imm_shift_s_fu_s1_source_o_D = i_hw_comp_2reg_imm_shift_ACT ? 2'h1 : 2'h0;
    assign i_hw_comp_2reg_imm_shift_s_fu_s2_source_o_D = i_hw_comp_2reg_imm_shift_ACT ? 2'h2 : 2'h0;
    assign i_hw_comp_2reg_imm_shift_s_imm_type_D = i_hw_comp_2reg_imm_shift_ACT ? 5'h01 : 5'h00;
    assign codasip_tmp_var_0_i_hw_comp_2reg_imm_shift_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MI23opc_comp_2reg_imm_shiftIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_comp_2reg_imm_shift3opc;
    assign i_hw_comp_2reg_imm_shift_s_op_o_D = (codasip_tmp_var_0_i_hw_comp_2reg_imm_shift_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h00093) ? 8'h07 :
        (codasip_tmp_var_0_i_hw_comp_2reg_imm_shift_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h00293) ? 8'h08 :
        (codasip_tmp_var_0_i_hw_comp_2reg_imm_shift_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 17'h08293) ? 8'h09 : 8'h00;
    assign i_hw_comp_2reg_imm_shift_s_op_o_D_ACT = i_hw_comp_2reg_imm_shift_ACT ? i_hw_comp_2reg_imm_shift_s_op_o_D : 8'h00;
    assign i_hw_control_conditional_s_fu_o_D = i_hw_control_conditional_ACT ? 4'h3 : 4'h0;
    assign i_hw_control_conditional_s_fu_s1_source_o_D = i_hw_control_conditional_ACT ? 2'h1 : 2'h0;
    assign i_hw_control_conditional_s_fu_s2_source_o_D = i_hw_control_conditional_ACT ? 2'h1 : 2'h0;
    assign i_hw_control_conditional_s_imm_type_D = i_hw_control_conditional_ACT ? 5'h03 : 5'h00;
    assign codasip_tmp_var_0_i_hw_control_conditional_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MI23opc_control_conditionalIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec26_23opc_control_conditional3opc;
    assign i_hw_control_conditional_s_op_o_D = (codasip_tmp_var_0_i_hw_control_conditional_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h063) ? 8'h0a :
        (codasip_tmp_var_0_i_hw_control_conditional_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h0e3) ? 8'h0b :
        (codasip_tmp_var_0_i_hw_control_conditional_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h263) ? 8'h0c :
        (codasip_tmp_var_0_i_hw_control_conditional_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h363) ? 8'h0d :
        (codasip_tmp_var_0_i_hw_control_conditional_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h2e3) ? 8'h0e :
        (codasip_tmp_var_0_i_hw_control_conditional_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h3e3) ? 8'h0f : 8'h00;
    assign i_hw_control_conditional_s_op_o_D_ACT = i_hw_control_conditional_ACT ? i_hw_control_conditional_s_op_o_D : 8'h00;
    assign i_hw_control_conditional_s_instr_illegal_on_dbg_D = i_hw_control_conditional_ACT ? 1'b1 : 1'b0;
    assign i_hw_control_registers_i_s_fu_o_D = i_hw_control_registers_i_ACT ? 4'h6 : 4'h0;
    assign i_hw_control_registers_i_s_fu_s1_source_o_D = i_hw_control_registers_i_ACT ? 2'h2 : 2'h0;
    assign i_hw_control_registers_i_s_imm_type_D = i_hw_control_registers_i_ACT ? 5'h06 : 5'h00;
    assign codasip_tmp_var_0_i_hw_control_registers_i_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MP12decode_stage3decMI23opc_control_registers_iIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec44_12decode_stage3dec23opc_control_registers_i3opc;
    assign i_hw_control_registers_i_s_op_o_D = (codasip_tmp_var_0_i_hw_control_registers_i_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h2f3) ? 8'h34 :
        (codasip_tmp_var_0_i_hw_control_registers_i_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h373) ? 8'h35 :
        (codasip_tmp_var_0_i_hw_control_registers_i_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h3f3) ? 8'h36 : 8'h00;
    assign i_hw_control_registers_i_s_op_o_D_ACT = i_hw_control_registers_i_ACT ? i_hw_control_registers_i_s_op_o_D : 8'h00;
    assign i_hw_jal_s_fu_o_D = i_hw_jal_ACT ? 4'h3 : 4'h0;
    assign i_hw_jal_s_fu_s1_source_o_D = i_hw_jal_ACT ? 2'h3 : 2'h0;
    assign i_hw_jal_s_imm_type_D = i_hw_jal_ACT ? 5'h05 : 5'h00;
    assign i_hw_jal_s_op_o_D = i_hw_jal_ACT ? 8'h48 : 8'h00;
    assign i_hw_jal_s_instr_illegal_on_dbg_D = i_hw_jal_ACT ? 1'b1 : 1'b0;
    assign i_hw_lui_s_fu_o_D = i_hw_lui_ACT ? 4'h1 : 4'h0;
    assign i_hw_lui_s_fu_s2_source_o_D = i_hw_lui_ACT ? 2'h2 : 2'h0;
    assign i_hw_lui_s_imm_type_D = i_hw_lui_ACT ? 5'h04 : 5'h00;
    assign i_hw_lui_s_op_o_D = i_hw_lui_ACT ? 8'h00 : 8'h00;
    assign i_hw_wfi_s_fu_o_D = i_hw_wfi_ACT ? 4'h6 : 4'h0;
    assign i_hw_wfi_s_op_o_D = i_hw_wfi_ACT ? 8'h3e : 8'h00;
    assign i_hw_jalr_s_fu_o_D = i_hw_jalr_ACT ? 4'h3 : 4'h0;
    assign i_hw_jalr_s_fu_s1_source_o_D = i_hw_jalr_ACT ? 2'h1 : 2'h0;
    assign i_hw_jalr_s_imm_type_D = i_hw_jalr_ACT ? 5'h01 : 5'h00;
    assign i_hw_jalr_s_op_o_D = i_hw_jalr_ACT ? 8'h47 : 8'h00;
    assign i_hw_jalr_s_instr_illegal_on_dbg_D = i_hw_jalr_ACT ? 1'b1 : 1'b0;
    assign i_hw_load_s_fu_o_D = i_hw_load_ACT ? 4'h2 : 4'h0;
    assign i_hw_load_s_fu_s1_source_o_D = i_hw_load_ACT ? 2'h1 : 2'h0;
    assign i_hw_load_s_fu_s2_source_o_D = i_hw_load_ACT ? 2'h0 : 2'h0;
    assign i_hw_load_s_imm_type_D = i_hw_load_ACT ? 5'h01 : 5'h00;
    assign codasip_tmp_var_0_i_hw_load_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MI9opc_loadsIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec11_9opc_loads3opc;
    assign i_hw_load_s_op_o_D = (codasip_tmp_var_0_i_hw_load_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h003) ? 8'h10 :
        (codasip_tmp_var_0_i_hw_load_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h083) ? 8'h11 :
        (codasip_tmp_var_0_i_hw_load_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h103) ? 8'h12 :
        (codasip_tmp_var_0_i_hw_load_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h203) ? 8'h13 :
        (codasip_tmp_var_0_i_hw_load_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 10'h283) ? 8'h14 : 8'h00;
    assign i_hw_load_s_op_o_D_ACT = i_hw_load_ACT ? i_hw_load_s_op_o_D : 8'h00;
    assign i_hw_xret_s_fu_o_D = i_hw_xret_ACT ? 4'h6 : 4'h0;
    assign codasip_tmp_var_0_i_hw_xret_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id = codasip_return_MI8opc_xretIH18_12decode_stage2id2id27_12decode_stage3dec7compute6decode25_12decode_stage3dec5i_dec5i_dec10_8opc_xret3opc;
    assign i_hw_xret_s_op_o_D = (codasip_tmp_var_0_i_hw_xret_decode_stage_dec_i_dec_i_dec_decode_stage_dec_compute_decode_decode_stage_id_id == 22'h0c0873) ? 8'h3a : 8'h00;
    assign i_hw_xret_s_op_o_D_ACT = i_hw_xret_ACT ? i_hw_xret_s_op_o_D : 8'h00;
    assign codasip_param_1 = invalid_instruction_wire;
endmodule: codix_berkelium_ca_core_decode_stage_dec_i_dec_t
