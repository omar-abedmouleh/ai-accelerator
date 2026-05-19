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
 *  \brief   Contains module definition of the 'codix_berkelium_ca_core_execute_stage_crf_csr_write_t' functional unit.
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

module codix_berkelium_ca_core_execute_stage_crf_csr_write_t(
    input  logic p_dtcm_en_Q,
    input  logic p_itcm_en_Q,
    input  logic [10:0] r_csr_dcsr_Q,
    input  logic [31:0] r_csr_fcsr_Q,
    input  logic [2:0] r_csr_mcountinhibit_Q,
    input  logic [63:0] r_csr_mcycle_Q,
    input  logic [4:0] r_csr_mip_Q,
    input  logic [31:0] r_csr_mpicflag1_Q,
    input  logic [31:0] r_csr_mpicflag2_Q,
    input  logic [31:0] r_csr_mpicflag3_Q,
    input  logic [31:0] r_csr_mpicflag_Q,
    input  logic [31:0] r_csr_mpicmask1_Q,
    input  logic [31:0] r_csr_mpicmask2_Q,
    input  logic [31:0] r_csr_mpicmask3_Q,
    input  logic [31:0] r_csr_mpicmask_Q,
    input  logic [30:0] r_csr_mstatus_Q,
    input  logic r_csr_tdata1_r_Q,
    input  logic [2:0] r_csr_tselect_Q,
    input  logic r_fce_wfi_valid_Q,
    input  logic [1:0] r_prv_Q,
    input  logic r_reset_init_Q,
    input  logic r_wfi_ce_Q,
    input  logic [11:0] s_csr_addr_i_Q,
    input  logic s_csr_valid_i_Q,
    input  logic [31:0] s_csr_wdata_i_Q,
    input  logic s_csr_we_i_Q,
    input  logic [127:0] s_eip_i_Q,
    input  logic [1:0] s_exc_extra_i_Q,
    input  logic s_fce_ebreak_debug_entry_Q,
    input  logic [31:0] s_fce_mstatus_Q,
    input  logic [1:0] s_fce_prv_Q,
    input  logic [31:0] s_fce_tcontrol_Q,
    input  logic s_fce_xret_valid_Q,
    input  logic [4:0] s_fflags_i_Q,
    input  logic s_fs_context_change_i_Q,
    input  logic s_inhibit_counters_Q,
    input  logic s_inhibit_cycle_Q,
    input  logic [31:0] s_instr_addr_i_Q,
    input  logic s_int_valid_Q,
    input  logic [31:0] s_intexc_cause_Q,
    input  logic [31:0] s_intexc_epc_Q,
    input  logic [31:0] s_intexc_mstatus_Q,
    input  logic [31:0] s_intexc_tcontrol_Q,
    input  logic [31:0] s_intexc_tval_Q,
    input  logic s_intexc_valid_Q,
    input  logic s_is_mret_Q,
    input  logic s_ocd_busy_i_Q,
    input  logic [31:0] s_ocd_dcsr_i_Q,
    input  logic s_ocd_debug_mode_req_i_Q,
    input  logic [31:0] s_ocd_dpc_i_Q,
    input  logic s_ocd_progbuf_mode_i_Q,
    input  logic s_ocd_user_mode_req_i_Q,
    input  logic [7:0] s_op_i_Q,
    input  logic [31:0] s_read_csr_rdata_Q,
    input  logic s_sip_i_Q,
    input  logic s_tip_i_Q,
    input  logic [31:0] s_write_csr_data_Q,
    input  logic s_write_csr_en_Q,
    input  logic s_write_cycle_we_Q,
    input  logic s_write_cycleh_we_Q,
    input  logic s_write_fflags_i_Q,
    input  logic s_write_mpicflag1_we_Q,
    input  logic s_write_mpicflag2_we_Q,
    input  logic s_write_mpicflag3_we_Q,
    input  logic s_write_mpicflag_we_Q,
    input  logic s_write_mpicmask1_we_Q,
    input  logic s_write_mpicmask2_we_Q,
    input  logic s_write_mpicmask3_we_Q,
    input  logic s_write_mpicmask_we_Q,
    output logic [31:0] r_csr_dcsr_D,
    output logic r_csr_dcsr_WE,
    output logic [31:0] r_csr_dpc_D,
    output logic r_csr_dpc_WE,
    output logic [31:0] r_csr_fcsr_D,
    output logic r_csr_fcsr_WE,
    output logic [31:0] r_csr_mcause_D,
    output logic r_csr_mcause_WE,
    output logic [31:0] r_csr_mcounteren_D,
    output logic r_csr_mcounteren_WE,
    output logic [31:0] r_csr_mcountinhibit_D,
    output logic r_csr_mcountinhibit_WE,
    output logic [63:0] r_csr_mcycle_D,
    output logic r_csr_mcycle_WE,
    output logic r_csr_mdtcmen_D,
    output logic r_csr_mdtcmen_WE,
    output logic [31:0] r_csr_mepc_D,
    output logic r_csr_mepc_WE,
    output logic [31:0] r_csr_mexcause_D,
    output logic r_csr_mexcause_WE,
    output logic [31:0] r_csr_mie_D,
    output logic r_csr_mie_WE,
    output logic [31:0] r_csr_mip_D,
    output logic r_csr_mip_WE,
    output logic r_csr_mitcmen_D,
    output logic r_csr_mitcmen_WE,
    output logic [31:0] r_csr_mpicflag1_D,
    output logic r_csr_mpicflag1_WE,
    output logic [31:0] r_csr_mpicflag2_D,
    output logic r_csr_mpicflag2_WE,
    output logic [31:0] r_csr_mpicflag3_D,
    output logic r_csr_mpicflag3_WE,
    output logic [31:0] r_csr_mpicflag_D,
    output logic r_csr_mpicflag_WE,
    output logic [31:0] r_csr_mpicmask1_D,
    output logic r_csr_mpicmask1_WE,
    output logic [31:0] r_csr_mpicmask2_D,
    output logic r_csr_mpicmask2_WE,
    output logic [31:0] r_csr_mpicmask3_D,
    output logic r_csr_mpicmask3_WE,
    output logic [31:0] r_csr_mpicmask_D,
    output logic r_csr_mpicmask_WE,
    output logic [31:0] r_csr_mscratch_D,
    output logic r_csr_mscratch_WE,
    output logic [31:0] r_csr_mstatus_D,
    output logic r_csr_mstatus_WE,
    output logic [31:0] r_csr_mtval_D,
    output logic r_csr_mtval_WE,
    output logic [31:0] r_csr_mtvec_D,
    output logic r_csr_mtvec_WE,
    output logic [31:0] r_csr_tcontrol_D,
    output logic r_csr_tcontrol_WE,
    output logic [2:0] r_csr_tdata1_r_RA,
    output logic r_csr_tdata1_r_RE,
    output logic [31:0] r_csr_tdata1_w_D,
    output logic [2:0] r_csr_tdata1_w_WA,
    output logic r_csr_tdata1_w_WE,
    output logic [31:0] r_csr_tdata2_w_D,
    output logic [2:0] r_csr_tdata2_w_WA,
    output logic r_csr_tdata2_w_WE,
    output logic [31:0] r_csr_tselect_D,
    output logic r_csr_tselect_WE,
    output logic [1:0] r_prv_D,
    output logic r_prv_WE,
    output logic s_inhibit_counters_D,
    output logic s_inhibit_cycle_D,
    output logic s_inhibit_instret_D,
    output logic [11:0] s_pmp_waddr_o_D,
    output logic [31:0] s_pmp_wdata_o_D,
    output logic s_pmp_we_o_D,
    output logic [31:0] s_wire_perf_wdata_D,
    output logic [31:0] s_write_csr_data_D,
    output logic s_write_csr_en_D,
    output logic s_write_csr_flush_D,
    output logic s_write_cycle_we_D,
    output logic s_write_cycleh_we_D,
    output logic s_write_instret_we_D,
    output logic s_write_instreth_we_D,
    output logic s_write_mpicflag1_we_D,
    output logic s_write_mpicflag2_we_D,
    output logic s_write_mpicflag3_we_D,
    output logic s_write_mpicflag_we_D,
    output logic s_write_mpicmask1_we_D,
    output logic s_write_mpicmask2_we_D,
    output logic s_write_mpicmask3_we_D,
    output logic s_write_mpicmask_we_D,
    output logic [1:0] s_write_perf_we_D
);
    // type, wire and constant declarations:
    // signal/wire
    logic [7:0] codasip_tmp_var_0;
    // signal/wire
    logic codasip_tmp_var_1;
    // signal/wire
    logic codasip_tmp_var_10;
    // signal/wire
    logic codasip_tmp_var_11;
    // signal/wire
    logic codasip_tmp_var_12;
    // signal/wire
    logic codasip_tmp_var_13;
    // signal/wire
    logic codasip_tmp_var_14;
    // signal/wire
    logic codasip_tmp_var_15;
    // signal/wire
    logic codasip_tmp_var_16;
    // signal/wire
    logic codasip_tmp_var_17;
    // signal/wire
    logic [11:0] codasip_tmp_var_18;
    // signal/wire
    logic codasip_tmp_var_19;
    // signal/wire
    logic [11:0] codasip_tmp_var_2;
    // signal/wire
    logic codasip_tmp_var_20;
    // signal/wire
    logic codasip_tmp_var_21;
    // signal/wire
    logic codasip_tmp_var_22;
    // signal/wire
    logic codasip_tmp_var_3;
    // signal/wire
    logic codasip_tmp_var_4;
    // signal/wire
    logic [3:0] codasip_tmp_var_5;
    // signal/wire
    logic codasip_tmp_var_6;
    // signal/wire
    logic codasip_tmp_var_7;
    // signal/wire
    logic codasip_tmp_var_8;
    // signal/wire
    logic codasip_tmp_var_9;
    // signal/wire
    logic [31:0] csr_wdata_B0;
    // signal/wire
    logic [31:0] data_B0B4B0B0;
    // signal/wire
    logic [31:0] data_B0B4B20B0;
    // signal/wire
    logic [31:0] data_B0B4B6B0;
    // signal/wire
    logic [31:0] data_mcause_B0B9B1B0;
    // signal/wire
    logic [3:0] data_mexcause_B0B9B1B0;
    // signal/wire
    logic dtcm_en_we_B0;
    // signal/wire
    logic [31:0] fcsr_wdata_B0B7;
    // signal/wire
    logic fs_context_change_B0;
    // signal/wire
    logic intexc_valid_B0;
    // signal/wire
    logic itcm_en_we_B0;
    // signal/wire
    logic [127:0] mpicmask_value_B0;
    // CodAL signal/wire
    logic [7:0] s_fcsr_wdata;
    // CodAL signal/wire
    logic s_fcsr_we;
    // signal/wire
    logic [11:0] s_pmp_waddr_o_D_ACT_wire;
    // signal/wire
    logic [31:0] s_pmp_wdata_o_D_ACT_wire;
    // signal/wire
    logic s_pmp_we_o_D_ACT_wire;
    // signal/wire
    logic [31:0] s_wire_perf_wdata_D_ACT_wire;
    // signal/wire
    logic [31:0] s_write_csr_data_D_ACT_wire;
    // signal/wire
    logic s_write_csr_en_D_ACT_wire;
    // signal/wire
    logic s_write_csr_flush_D_ACT_wire;
    // signal/wire
    logic [1:0] s_write_perf_we_D_ACT_wire;
    // signal/wire
    logic stopcount_B0;
    // signal/wire
    logic [31:0] tdata1_B0;
    // signal/wire
    logic [31:0] tdata1_wr_B0;
    // signal/wire
    logic [4:0] tdata1_wr_common_B0;
    // signal/wire
    logic tdata1_wr_dmode_B0;
    // signal/wire
    logic [3:0] tdata1_wr_type_B0;
    // signal/wire
    logic [3:0] ttype_B0;
    // signal/wire
    logic [1:0] valid_mpp_B0;

    // data-path code:
    assign codasip_tmp_var_0 = s_op_i_Q;
    always_comb begin
        case ( codasip_tmp_var_0 )
            8'h34: csr_wdata_B0 = s_csr_wdata_i_Q;
            8'h35: csr_wdata_B0 = (s_read_csr_rdata_Q | s_csr_wdata_i_Q);
            8'h36: csr_wdata_B0 = (s_read_csr_rdata_Q & (~s_csr_wdata_i_Q));
            default: csr_wdata_B0 = 32'h00000000;
        endcase
    end
    assign valid_mpp_B0 = ((((csr_wdata_B0[12:11] == 2'h1) || (csr_wdata_B0[12:11] == 2'h2))) ? 2'h0 : csr_wdata_B0[12:11]);
    assign codasip_tmp_var_1 = (((s_csr_we_i_Q & s_csr_valid_i_Q) & (~s_ocd_debug_mode_req_i_Q)) & (~s_intexc_valid_Q));
    assign codasip_tmp_var_2 = codasip_tmp_var_1 ? s_csr_addr_i_Q : 12'h000;
    assign data_B0B4B0B0 = (codasip_tmp_var_2 == 12'h305) ? {csr_wdata_B0[31:2], 1'b0, csr_wdata_B0[0]} : 32'h00000000;
    assign s_write_csr_flush_D_ACT_wire = ((((((((((((((((((((((((codasip_tmp_var_2 == 12'h300) || (codasip_tmp_var_2 == 12'h304)) || (codasip_tmp_var_2 == 12'h7cd)) || (codasip_tmp_var_2 == 12'h7d0)) || (codasip_tmp_var_2 == 12'h3b1)) || (codasip_tmp_var_2 == 12'h3b0)) || (codasip_tmp_var_2 == 12'h3a3)) || (codasip_tmp_var_2 == 12'h3a2)) || (codasip_tmp_var_2 == 12'h3a1)) || (codasip_tmp_var_2 == 12'h3a0)) || (codasip_tmp_var_2 == 12'h3bf)) || (codasip_tmp_var_2 == 12'h3be)) || (codasip_tmp_var_2 == 12'h3bd)) || (codasip_tmp_var_2 == 12'h3bc)) || (codasip_tmp_var_2 == 12'h3bb)) || (codasip_tmp_var_2 == 12'h3ba)) || (codasip_tmp_var_2 == 12'h3b9)) || (codasip_tmp_var_2 == 12'h3b8)) || (codasip_tmp_var_2 == 12'h3b7)) || (codasip_tmp_var_2 == 12'h3b6)) || (codasip_tmp_var_2 == 12'h3b5)) || (codasip_tmp_var_2 == 12'h3b4)) || (codasip_tmp_var_2 == 12'h3b3)) || (codasip_tmp_var_2 == 12'h3b2)) ? 1'b1 : 1'b0;
    assign s_write_csr_en_D_ACT_wire = ((((((((((codasip_tmp_var_2 == 12'h300) || (codasip_tmp_var_2 == 12'h342)) || (codasip_tmp_var_2 == 12'h7d4)) || (codasip_tmp_var_2 == 12'h343)) || (codasip_tmp_var_2 == 12'h341)) || (codasip_tmp_var_2 == 12'h7b1)) || (codasip_tmp_var_2 == 12'h7b0)) || (codasip_tmp_var_2 == 12'h7a5)) || (codasip_tmp_var_2 == 12'h7a3)) || (codasip_tmp_var_2 == 12'h7a8)) ? 1'b1 : 1'b0;
    assign data_B0B4B6B0 = (codasip_tmp_var_2 == 12'h304) ? 32'(unsigned'(12'({csr_wdata_B0[11], 1'b0, 1'b0, 1'b0, csr_wdata_B0[7], 1'b0, 1'b0, 1'b0, csr_wdata_B0[3], 1'b0, 1'b0, 1'b0}))) : 32'h00000000;
    assign s_wire_perf_wdata_D_ACT_wire = ((((((((((((((((((((((codasip_tmp_var_2 == 12'hb8f) || (codasip_tmp_var_2 == 12'hb8e)) || (codasip_tmp_var_2 == 12'hb8d)) || (codasip_tmp_var_2 == 12'hb8c)) || (codasip_tmp_var_2 == 12'hb8b)) || (codasip_tmp_var_2 == 12'hb8a)) || (codasip_tmp_var_2 == 12'hb89)) || (codasip_tmp_var_2 == 12'hb86)) || (codasip_tmp_var_2 == 12'hb85)) || (codasip_tmp_var_2 == 12'hb84)) || (codasip_tmp_var_2 == 12'hb83)) || (codasip_tmp_var_2 == 12'hb0f)) || (codasip_tmp_var_2 == 12'hb0e)) || (codasip_tmp_var_2 == 12'hb0d)) || (codasip_tmp_var_2 == 12'hb0c)) || (codasip_tmp_var_2 == 12'hb0b)) || (codasip_tmp_var_2 == 12'hb0a)) || (codasip_tmp_var_2 == 12'hb09)) || (codasip_tmp_var_2 == 12'hb06)) || (codasip_tmp_var_2 == 12'hb05)) || (codasip_tmp_var_2 == 12'hb04)) || (codasip_tmp_var_2 == 12'hb03)) ? csr_wdata_B0 : 32'h00000000;
    assign s_write_perf_we_D_ACT_wire = (((((((((((codasip_tmp_var_2 == 12'hb8f) || (codasip_tmp_var_2 == 12'hb8e)) || (codasip_tmp_var_2 == 12'hb8d)) || (codasip_tmp_var_2 == 12'hb8c)) || (codasip_tmp_var_2 == 12'hb8b)) || (codasip_tmp_var_2 == 12'hb8a)) || (codasip_tmp_var_2 == 12'hb89)) || (codasip_tmp_var_2 == 12'hb86)) || (codasip_tmp_var_2 == 12'hb85)) || (codasip_tmp_var_2 == 12'hb84)) || (codasip_tmp_var_2 == 12'hb83)) ? 2'h2 :
        (((((((((((codasip_tmp_var_2 == 12'hb0f) || (codasip_tmp_var_2 == 12'hb0e)) || (codasip_tmp_var_2 == 12'hb0d)) || (codasip_tmp_var_2 == 12'hb0c)) || (codasip_tmp_var_2 == 12'hb0b)) || (codasip_tmp_var_2 == 12'hb0a)) || (codasip_tmp_var_2 == 12'hb09)) || (codasip_tmp_var_2 == 12'hb06)) || (codasip_tmp_var_2 == 12'hb05)) || (codasip_tmp_var_2 == 12'hb04)) || (codasip_tmp_var_2 == 12'hb03)) ? 2'h1 : 2'h0;
    assign tdata1_B0 = (codasip_tmp_var_2 == 12'h7a1) ? s_read_csr_rdata_Q : 32'h00000000;
    assign codasip_tmp_var_3 = (codasip_tmp_var_2 == 12'h7a1) ? (((~tdata1_B0[27]) & (r_prv_Q == 2'h3)) | s_ocd_progbuf_mode_i_Q) : 1'b0;
    assign ttype_B0 = codasip_tmp_var_3 ? 4'h2 : 4'h0;
    assign codasip_tmp_var_4 = codasip_tmp_var_3 ? ((ttype_B0 == 4'h0) || ((ttype_B0 >= 4'h2) && (ttype_B0 <= 4'h5))) : 1'b0;
    assign tdata1_wr_type_B0 = codasip_tmp_var_4 ? ttype_B0 :
        codasip_tmp_var_3 ? tdata1_B0[31:28] : 4'h0;
    assign tdata1_wr_dmode_B0 = codasip_tmp_var_3 ? ((s_ocd_progbuf_mode_i_Q) ? csr_wdata_B0[27] : tdata1_B0[27]) : 1'b0;
    assign tdata1_wr_common_B0 = codasip_tmp_var_3 ? {tdata1_wr_type_B0, tdata1_wr_dmode_B0} : 5'h00;
    assign codasip_tmp_var_5 = codasip_tmp_var_3 ? ttype_B0 : 4'h0;
    assign tdata1_wr_B0 = ((codasip_tmp_var_5 == 4'h0) && codasip_tmp_var_3) ? {tdata1_wr_common_B0, 27'h0000000} :
        (codasip_tmp_var_5 == 4'h2) ? {tdata1_wr_common_B0, 6'h00, 1'b0, 1'b0, 1'b0, 2'h0, (((~csr_wdata_B0[27])) ? 4'h0 : (((csr_wdata_B0[15:12] <= 4'h1)) ? csr_wdata_B0[15:12] : tdata1_B0[15:12])), 1'b0, 4'h0, csr_wdata_B0[6], 1'b0, 1'b0, csr_wdata_B0[3], csr_wdata_B0[2], csr_wdata_B0[1], csr_wdata_B0[0]} :
        codasip_tmp_var_3 ? tdata1_B0 : 32'h00000000;
    assign codasip_tmp_var_6 = (codasip_tmp_var_2 == 12'h7a2) ? (((~r_csr_tdata1_r_Q) & (r_prv_Q == 2'h3)) | s_ocd_progbuf_mode_i_Q) : 1'b0;
    assign data_B0B4B20B0 = (codasip_tmp_var_2 == 12'h7a0) ? (((csr_wdata_B0 < 32'h00000008)) ? csr_wdata_B0 : 32'h00000000) : 32'h00000000;
    assign s_write_csr_data_D_ACT_wire = (codasip_tmp_var_2 == 12'h300) ? {(csr_wdata_B0[14:13] == 2'h3), 8'h00, 1'b0, csr_wdata_B0[21], 3'h0, csr_wdata_B0[17], 2'h0, csr_wdata_B0[14:13], valid_mpp_B0, 2'h0, 1'b0, csr_wdata_B0[7], 1'b0, 1'b0, 1'b0, csr_wdata_B0[3], 1'b0, 1'b0, 1'b0} :
        (((codasip_tmp_var_2 == 12'h342) || (codasip_tmp_var_2 == 12'h7d4)) || (codasip_tmp_var_2 == 12'h343)) ? csr_wdata_B0 :
        (codasip_tmp_var_2 == 12'h341) ? {csr_wdata_B0[31:1], 1'b0} :
        ((((codasip_tmp_var_2 == 12'hb00) || (codasip_tmp_var_2 == 12'hb02)) || (codasip_tmp_var_2 == 12'hb80)) || (codasip_tmp_var_2 == 12'hb82)) ? csr_wdata_B0 :
        (codasip_tmp_var_2 == 12'h7b1) ? {csr_wdata_B0[31:1], 1'b0} :
        (codasip_tmp_var_2 == 12'h7b0) ? {16'h4000, csr_wdata_B0[15], 1'b0, csr_wdata_B0[13:12], csr_wdata_B0[11], csr_wdata_B0[10], 1'b0, r_csr_dcsr_Q[8:6], 3'h0, csr_wdata_B0[2], ((((csr_wdata_B0[1:0] == 2'h3) || (csr_wdata_B0[1:0] == 2'h0))) ? csr_wdata_B0[1:0] : r_csr_dcsr_Q[1:0])} :
        (codasip_tmp_var_2 == 12'h7a5) ? 32'(unsigned'(8'({csr_wdata_B0[7], 3'h0, csr_wdata_B0[3], 3'h0}))) :
        ((codasip_tmp_var_2 == 12'h7a3) || (codasip_tmp_var_2 == 12'h7a8)) ? 32'h00000000 : 32'h00000000;
    assign s_fcsr_we = (((codasip_tmp_var_2 == 12'h001) || (codasip_tmp_var_2 == 12'h002)) || (codasip_tmp_var_2 == 12'h003)) ? 1'b1 : 1'b0;
    assign s_fcsr_wdata = (codasip_tmp_var_2 == 12'h001) ? {r_csr_fcsr_Q[7:5], csr_wdata_B0[4:0]} :
        (codasip_tmp_var_2 == 12'h002) ? {csr_wdata_B0[2:0], r_csr_fcsr_Q[4:0]} :
        (codasip_tmp_var_2 == 12'h003) ? csr_wdata_B0[7:0] : 8'h00;
    assign itcm_en_we_B0 = (codasip_tmp_var_2 == 12'h7cd) ? 1'b1 : 1'b0;
    assign dtcm_en_we_B0 = (codasip_tmp_var_2 == 12'h7d0) ? 1'b1 : 1'b0;
    assign s_pmp_we_o_D_ACT_wire = ((((((((((((((((((((codasip_tmp_var_2 == 12'h3b1) || (codasip_tmp_var_2 == 12'h3b0)) || (codasip_tmp_var_2 == 12'h3a3)) || (codasip_tmp_var_2 == 12'h3a2)) || (codasip_tmp_var_2 == 12'h3a1)) || (codasip_tmp_var_2 == 12'h3a0)) || (codasip_tmp_var_2 == 12'h3bf)) || (codasip_tmp_var_2 == 12'h3be)) || (codasip_tmp_var_2 == 12'h3bd)) || (codasip_tmp_var_2 == 12'h3bc)) || (codasip_tmp_var_2 == 12'h3bb)) || (codasip_tmp_var_2 == 12'h3ba)) || (codasip_tmp_var_2 == 12'h3b9)) || (codasip_tmp_var_2 == 12'h3b8)) || (codasip_tmp_var_2 == 12'h3b7)) || (codasip_tmp_var_2 == 12'h3b6)) || (codasip_tmp_var_2 == 12'h3b5)) || (codasip_tmp_var_2 == 12'h3b4)) || (codasip_tmp_var_2 == 12'h3b3)) || (codasip_tmp_var_2 == 12'h3b2)) ? 1'b1 : 1'b0;
    assign s_pmp_waddr_o_D_ACT_wire = ((((((((((((((((((((codasip_tmp_var_2 == 12'h3b1) || (codasip_tmp_var_2 == 12'h3b0)) || (codasip_tmp_var_2 == 12'h3a3)) || (codasip_tmp_var_2 == 12'h3a2)) || (codasip_tmp_var_2 == 12'h3a1)) || (codasip_tmp_var_2 == 12'h3a0)) || (codasip_tmp_var_2 == 12'h3bf)) || (codasip_tmp_var_2 == 12'h3be)) || (codasip_tmp_var_2 == 12'h3bd)) || (codasip_tmp_var_2 == 12'h3bc)) || (codasip_tmp_var_2 == 12'h3bb)) || (codasip_tmp_var_2 == 12'h3ba)) || (codasip_tmp_var_2 == 12'h3b9)) || (codasip_tmp_var_2 == 12'h3b8)) || (codasip_tmp_var_2 == 12'h3b7)) || (codasip_tmp_var_2 == 12'h3b6)) || (codasip_tmp_var_2 == 12'h3b5)) || (codasip_tmp_var_2 == 12'h3b4)) || (codasip_tmp_var_2 == 12'h3b3)) || (codasip_tmp_var_2 == 12'h3b2)) ? s_csr_addr_i_Q : 12'h000;
    assign s_pmp_wdata_o_D_ACT_wire = ((((((((((((((((((((codasip_tmp_var_2 == 12'h3b1) || (codasip_tmp_var_2 == 12'h3b0)) || (codasip_tmp_var_2 == 12'h3a3)) || (codasip_tmp_var_2 == 12'h3a2)) || (codasip_tmp_var_2 == 12'h3a1)) || (codasip_tmp_var_2 == 12'h3a0)) || (codasip_tmp_var_2 == 12'h3bf)) || (codasip_tmp_var_2 == 12'h3be)) || (codasip_tmp_var_2 == 12'h3bd)) || (codasip_tmp_var_2 == 12'h3bc)) || (codasip_tmp_var_2 == 12'h3bb)) || (codasip_tmp_var_2 == 12'h3ba)) || (codasip_tmp_var_2 == 12'h3b9)) || (codasip_tmp_var_2 == 12'h3b8)) || (codasip_tmp_var_2 == 12'h3b7)) || (codasip_tmp_var_2 == 12'h3b6)) || (codasip_tmp_var_2 == 12'h3b5)) || (codasip_tmp_var_2 == 12'h3b4)) || (codasip_tmp_var_2 == 12'h3b3)) || (codasip_tmp_var_2 == 12'h3b2)) ? csr_wdata_B0 : 32'h00000000;
    assign codasip_tmp_var_7 = r_reset_init_Q;
    assign codasip_tmp_var_8 = (!codasip_tmp_var_7) ? itcm_en_we_B0 : 1'b0;
    assign codasip_tmp_var_9 = (!codasip_tmp_var_7) ? dtcm_en_we_B0 : 1'b0;
    assign intexc_valid_B0 = ((~s_ocd_progbuf_mode_i_Q) & s_intexc_valid_Q);
    assign fs_context_change_B0 = (s_fs_context_change_i_Q | s_fcsr_we);
    assign codasip_tmp_var_10 = (s_fcsr_we | s_write_fflags_i_Q);
    assign fcsr_wdata_B0B7 = codasip_tmp_var_10 ? ((s_write_fflags_i_Q) ? (r_csr_fcsr_Q | 32'(s_fflags_i_Q)) : 32'(s_fcsr_wdata)) : 32'h00000000;
    assign codasip_tmp_var_11 = s_ocd_debug_mode_req_i_Q;
    assign codasip_tmp_var_12 = (!codasip_tmp_var_11) ? s_ocd_user_mode_req_i_Q : 1'b0;
    assign codasip_tmp_var_13 = ((!codasip_tmp_var_12) && (!codasip_tmp_var_11)) ? intexc_valid_B0 : 1'b0;
    assign data_mcause_B0B9B1B0 = codasip_tmp_var_13 ? (((s_intexc_cause_Q == 32'h0000001a)) ? 32'h00000003 : s_intexc_cause_Q) : 32'h00000000;
    assign data_mexcause_B0B9B1B0 = codasip_tmp_var_13 ? (((s_exc_extra_i_Q == 2'h1)) ? 4'h1 : (((s_exc_extra_i_Q == 2'h2)) ? 4'h4 : (((s_exc_extra_i_Q == 2'h3)) ? 4'h8 : 4'h0))) : 4'h0;
    assign codasip_tmp_var_14 = codasip_tmp_var_13 ? (~s_int_valid_Q) : 1'b0;
    assign codasip_tmp_var_15 = (((!codasip_tmp_var_13) && (!codasip_tmp_var_12)) && (!codasip_tmp_var_11)) ? s_fce_xret_valid_Q : 1'b0;
    assign codasip_tmp_var_16 = codasip_tmp_var_15 ? s_is_mret_Q : 1'b0;
    assign codasip_tmp_var_17 = ((((!codasip_tmp_var_15) && (!codasip_tmp_var_13)) && (!codasip_tmp_var_12)) && (!codasip_tmp_var_11)) ? s_write_csr_en_Q : 1'b0;
    assign codasip_tmp_var_18 = codasip_tmp_var_17 ? s_csr_addr_i_Q : 12'h000;
    assign codasip_tmp_var_19 = (((((!codasip_tmp_var_17) && (!codasip_tmp_var_15)) && (!codasip_tmp_var_13)) && (!codasip_tmp_var_12)) && (!codasip_tmp_var_11)) ? fs_context_change_B0 : 1'b0;
    assign mpicmask_value_B0 = ((s_write_mpicmask3_we_Q) ? {csr_wdata_B0, r_csr_mpicmask2_Q, r_csr_mpicmask1_Q, r_csr_mpicmask_Q} : ((s_write_mpicmask2_we_Q) ? {r_csr_mpicmask3_Q, csr_wdata_B0, r_csr_mpicmask1_Q, r_csr_mpicmask_Q} : ((s_write_mpicmask1_we_Q) ? {r_csr_mpicmask3_Q, r_csr_mpicmask2_Q, csr_wdata_B0, r_csr_mpicmask_Q} : ((s_write_mpicmask_we_Q) ? {r_csr_mpicmask3_Q, r_csr_mpicmask2_Q, r_csr_mpicmask1_Q, csr_wdata_B0} : {r_csr_mpicmask3_Q, r_csr_mpicmask2_Q, r_csr_mpicmask1_Q, r_csr_mpicmask_Q}))));
    assign stopcount_B0 = r_csr_dcsr_Q[10];
    assign codasip_tmp_var_20 = s_write_cycle_we_Q;
    assign codasip_tmp_var_21 = (!codasip_tmp_var_20) ? s_write_cycleh_we_Q : 1'b0;
    assign codasip_tmp_var_22 = ((!codasip_tmp_var_21) && (!codasip_tmp_var_20)) ? (((~s_inhibit_counters_Q) & (~s_inhibit_cycle_Q)) & r_wfi_ce_Q) : 1'b0;
    assign r_csr_dcsr_D = codasip_tmp_var_11 ? {s_ocd_dcsr_i_Q[31:2], ((((s_ocd_dcsr_i_Q[1:0] == 2'h3) || (s_ocd_dcsr_i_Q[1:0] == 2'h0))) ? s_ocd_dcsr_i_Q[1:0] : r_csr_dcsr_Q[1:0])} :
        (codasip_tmp_var_18 == 12'h7b0) ? s_write_csr_data_Q : 32'h00000000;
    assign r_csr_dcsr_WE = (codasip_tmp_var_11 || (codasip_tmp_var_18 == 12'h7b0)) ? 1'b1 : 1'b0;
    assign r_csr_dpc_D = codasip_tmp_var_11 ? ((r_fce_wfi_valid_Q) ? (s_instr_addr_i_Q + 32'h00000004) : s_ocd_dpc_i_Q) :
        (codasip_tmp_var_18 == 12'h7b1) ? s_write_csr_data_Q : 32'h00000000;
    assign r_csr_dpc_WE = (codasip_tmp_var_11 || (codasip_tmp_var_18 == 12'h7b1)) ? 1'b1 : 1'b0;
    assign r_csr_fcsr_D = fcsr_wdata_B0B7;
    assign r_csr_fcsr_WE = codasip_tmp_var_10 ? 1'b1 : 1'b0;
    assign r_csr_mcause_D = codasip_tmp_var_13 ? data_mcause_B0B9B1B0 :
        (codasip_tmp_var_18 == 12'h342) ? s_write_csr_data_Q : 32'h00000000;
    assign r_csr_mcause_WE = (codasip_tmp_var_13 || (codasip_tmp_var_18 == 12'h342)) ? 1'b1 : 1'b0;
    assign r_csr_mcounteren_D = csr_wdata_B0;
    assign r_csr_mcounteren_WE = (codasip_tmp_var_2 == 12'h306) ? 1'b1 : 1'b0;
    assign r_csr_mcountinhibit_D = csr_wdata_B0;
    assign r_csr_mcountinhibit_WE = (codasip_tmp_var_2 == 12'h320) ? 1'b1 : 1'b0;
    assign r_csr_mcycle_D = codasip_tmp_var_20 ? {r_csr_mcycle_Q[63:32], s_write_csr_data_Q} :
        codasip_tmp_var_21 ? {s_write_csr_data_Q, r_csr_mcycle_Q[31:0]} :
        codasip_tmp_var_22 ? (r_csr_mcycle_Q + 64'h0000000000000001) : 64'h0000000000000000;
    assign r_csr_mcycle_WE = ((codasip_tmp_var_20 || codasip_tmp_var_21) || codasip_tmp_var_22) ? 1'b1 : 1'b0;
    assign r_csr_mdtcmen_D = codasip_tmp_var_7 ? p_dtcm_en_Q :
        codasip_tmp_var_9 ? csr_wdata_B0[0] : 1'b0;
    assign r_csr_mdtcmen_WE = (codasip_tmp_var_7 || codasip_tmp_var_9) ? 1'b1 : 1'b0;
    assign r_csr_mepc_D = codasip_tmp_var_13 ? s_intexc_epc_Q :
        (codasip_tmp_var_18 == 12'h341) ? s_write_csr_data_Q : 32'h00000000;
    assign r_csr_mepc_WE = (codasip_tmp_var_13 || (codasip_tmp_var_18 == 12'h341)) ? 1'b1 : 1'b0;
    assign r_csr_mexcause_D = codasip_tmp_var_14 ? {28'h0000000, data_mexcause_B0B9B1B0} :
        (codasip_tmp_var_18 == 12'h7d4) ? s_write_csr_data_Q : 32'h00000000;
    assign r_csr_mexcause_WE = (codasip_tmp_var_14 || (codasip_tmp_var_18 == 12'h7d4)) ? 1'b1 : 1'b0;
    assign r_csr_mie_D = data_B0B4B6B0;
    assign r_csr_mie_WE = (codasip_tmp_var_2 == 12'h304) ? 1'b1 : 1'b0;
    assign r_csr_mip_D = 32'(unsigned'(12'({((mpicmask_value_B0 & ({r_csr_mpicflag3_Q, r_csr_mpicflag2_Q, r_csr_mpicflag1_Q, r_csr_mpicflag_Q} | s_eip_i_Q)) != {128{1'b0}}), 1'b0, 1'b0, 1'b0, (s_tip_i_Q | (r_csr_mip_Q[4] & (~r_wfi_ce_Q))), 1'b0, 1'b0, 1'b0, (s_sip_i_Q | (r_csr_mip_Q[0] & (~r_wfi_ce_Q))), 1'b0, 1'b0, 1'b0})));
    assign r_csr_mip_WE = 1'b1;
    assign r_csr_mitcmen_D = codasip_tmp_var_7 ? p_itcm_en_Q :
        codasip_tmp_var_8 ? csr_wdata_B0[0] : 1'b0;
    assign r_csr_mitcmen_WE = (codasip_tmp_var_7 || codasip_tmp_var_8) ? 1'b1 : 1'b0;
    assign r_csr_mpicflag1_D = (s_eip_i_Q[63:32] | ((s_write_mpicflag1_we_Q) ? csr_wdata_B0 : r_csr_mpicflag1_Q));
    assign r_csr_mpicflag1_WE = 1'b1;
    assign r_csr_mpicflag2_D = (s_eip_i_Q[95:64] | ((s_write_mpicflag2_we_Q) ? csr_wdata_B0 : r_csr_mpicflag2_Q));
    assign r_csr_mpicflag2_WE = 1'b1;
    assign r_csr_mpicflag3_D = (s_eip_i_Q[127:96] | ((s_write_mpicflag3_we_Q) ? csr_wdata_B0 : r_csr_mpicflag3_Q));
    assign r_csr_mpicflag3_WE = 1'b1;
    assign r_csr_mpicflag_D = (s_eip_i_Q[31:0] | ((s_write_mpicflag_we_Q) ? csr_wdata_B0 : r_csr_mpicflag_Q));
    assign r_csr_mpicflag_WE = 1'b1;
    assign r_csr_mpicmask1_D = csr_wdata_B0;
    assign r_csr_mpicmask1_WE = (codasip_tmp_var_2 == 12'h7c5) ? 1'b1 : 1'b0;
    assign r_csr_mpicmask2_D = csr_wdata_B0;
    assign r_csr_mpicmask2_WE = (codasip_tmp_var_2 == 12'h7c8) ? 1'b1 : 1'b0;
    assign r_csr_mpicmask3_D = csr_wdata_B0;
    assign r_csr_mpicmask3_WE = (codasip_tmp_var_2 == 12'h7cb) ? 1'b1 : 1'b0;
    assign r_csr_mpicmask_D = csr_wdata_B0;
    assign r_csr_mpicmask_WE = (codasip_tmp_var_2 == 12'h7c2) ? 1'b1 : 1'b0;
    assign r_csr_mscratch_D = csr_wdata_B0;
    assign r_csr_mscratch_WE = (codasip_tmp_var_2 == 12'h340) ? 1'b1 : 1'b0;
    assign r_csr_mstatus_D = codasip_tmp_var_13 ? s_intexc_mstatus_Q :
        codasip_tmp_var_15 ? s_fce_mstatus_Q :
        ((((codasip_tmp_var_18 == 12'h300) || (codasip_tmp_var_18 == 12'h001)) || (codasip_tmp_var_18 == 12'h002)) || (codasip_tmp_var_18 == 12'h003)) ? s_write_csr_data_Q :
        codasip_tmp_var_19 ? {1'b1, r_csr_mstatus_Q[30:15], 2'h3, r_csr_mstatus_Q[12:0]} : 32'h00000000;
    assign r_csr_mstatus_WE = ((((((codasip_tmp_var_13 || codasip_tmp_var_15) || (codasip_tmp_var_18 == 12'h300)) || (codasip_tmp_var_18 == 12'h001)) || (codasip_tmp_var_18 == 12'h002)) || (codasip_tmp_var_18 == 12'h003)) || codasip_tmp_var_19) ? 1'b1 : 1'b0;
    assign r_csr_mtval_D = codasip_tmp_var_13 ? s_intexc_tval_Q :
        (codasip_tmp_var_18 == 12'h343) ? s_write_csr_data_Q : 32'h00000000;
    assign r_csr_mtval_WE = (codasip_tmp_var_13 || (codasip_tmp_var_18 == 12'h343)) ? 1'b1 : 1'b0;
    assign r_csr_mtvec_D = data_B0B4B0B0;
    assign r_csr_mtvec_WE = (codasip_tmp_var_2 == 12'h305) ? 1'b1 : 1'b0;
    assign r_csr_tcontrol_D = codasip_tmp_var_13 ? s_intexc_tcontrol_Q :
        codasip_tmp_var_16 ? s_fce_tcontrol_Q :
        (codasip_tmp_var_18 == 12'h7a5) ? s_write_csr_data_Q : 32'h00000000;
    assign r_csr_tcontrol_WE = ((codasip_tmp_var_13 || codasip_tmp_var_16) || (codasip_tmp_var_18 == 12'h7a5)) ? 1'b1 : 1'b0;
    assign r_csr_tdata1_r_RA = (codasip_tmp_var_2 == 12'h7a2) ? r_csr_tselect_Q : 3'h0;
    assign r_csr_tdata1_r_RE = (codasip_tmp_var_2 == 12'h7a2) ? 1'b1 : 1'b0;
    assign r_csr_tdata1_w_D = tdata1_wr_B0;
    assign r_csr_tdata1_w_WA = r_csr_tselect_Q;
    assign r_csr_tdata1_w_WE = codasip_tmp_var_3 ? 1'b1 : 1'b0;
    assign r_csr_tdata2_w_D = csr_wdata_B0;
    assign r_csr_tdata2_w_WA = r_csr_tselect_Q;
    assign r_csr_tdata2_w_WE = codasip_tmp_var_6 ? 1'b1 : 1'b0;
    assign r_csr_tselect_D = data_B0B4B20B0;
    assign r_csr_tselect_WE = (codasip_tmp_var_2 == 12'h7a0) ? 1'b1 : 1'b0;
    assign r_prv_D = codasip_tmp_var_12 ? r_csr_dcsr_Q[1:0] :
        codasip_tmp_var_13 ? 2'h3 :
        codasip_tmp_var_15 ? s_fce_prv_Q : 2'h0;
    assign r_prv_WE = ((codasip_tmp_var_12 || codasip_tmp_var_13) || codasip_tmp_var_15) ? 1'b1 : 1'b0;
    assign s_inhibit_counters_D = ((((s_fce_ebreak_debug_entry_Q | s_ocd_debug_mode_req_i_Q) | s_ocd_progbuf_mode_i_Q) | s_ocd_busy_i_Q) & stopcount_B0);
    assign s_inhibit_cycle_D = r_csr_mcountinhibit_Q[0];
    assign s_inhibit_instret_D = r_csr_mcountinhibit_Q[2];
    assign s_pmp_waddr_o_D = s_pmp_waddr_o_D_ACT_wire;
    assign s_pmp_wdata_o_D = s_pmp_wdata_o_D_ACT_wire;
    assign s_pmp_we_o_D = s_pmp_we_o_D_ACT_wire;
    assign s_wire_perf_wdata_D = s_wire_perf_wdata_D_ACT_wire;
    assign s_write_csr_data_D = s_write_csr_data_D_ACT_wire;
    assign s_write_csr_en_D = s_write_csr_en_D_ACT_wire;
    assign s_write_csr_flush_D = s_write_csr_flush_D_ACT_wire;
    assign s_write_cycle_we_D = (codasip_tmp_var_2 == 12'hb00) ? 1'b1 : 1'b0;
    assign s_write_cycleh_we_D = (codasip_tmp_var_2 == 12'hb80) ? 1'b1 : 1'b0;
    assign s_write_instret_we_D = (codasip_tmp_var_2 == 12'hb02) ? 1'b1 : 1'b0;
    assign s_write_instreth_we_D = (codasip_tmp_var_2 == 12'hb82) ? 1'b1 : 1'b0;
    assign s_write_mpicflag1_we_D = (codasip_tmp_var_2 == 12'h7c4) ? 1'b1 : 1'b0;
    assign s_write_mpicflag2_we_D = (codasip_tmp_var_2 == 12'h7c7) ? 1'b1 : 1'b0;
    assign s_write_mpicflag3_we_D = (codasip_tmp_var_2 == 12'h7ca) ? 1'b1 : 1'b0;
    assign s_write_mpicflag_we_D = (codasip_tmp_var_2 == 12'h7c1) ? 1'b1 : 1'b0;
    assign s_write_mpicmask1_we_D = (codasip_tmp_var_2 == 12'h7c5) ? 1'b1 : 1'b0;
    assign s_write_mpicmask2_we_D = (codasip_tmp_var_2 == 12'h7c8) ? 1'b1 : 1'b0;
    assign s_write_mpicmask3_we_D = (codasip_tmp_var_2 == 12'h7cb) ? 1'b1 : 1'b0;
    assign s_write_mpicmask_we_D = (codasip_tmp_var_2 == 12'h7c2) ? 1'b1 : 1'b0;
    assign s_write_perf_we_D = s_write_perf_we_D_ACT_wire;
endmodule: codix_berkelium_ca_core_execute_stage_crf_csr_write_t
