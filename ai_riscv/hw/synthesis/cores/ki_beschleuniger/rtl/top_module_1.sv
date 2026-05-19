`timescale 1ns/1ps
import packages_of_config_regis::*;

module top_module_1 #(
  parameter int AXI_ADDR_W   = 12,
  parameter int AXI_DATA_W   = 32,
  parameter int M_AXI_ADDR_W = 24,
  parameter int M_AXI_DATA_W = 32,
  parameter int M_AXI_ID_W   = 4,

  // MAX (compile-time)
  parameter int IMG_W_MAX  = 130,
  parameter int IMG_H_MAX  = 130,
  parameter int CH_IN_MAX  = 1024,
  parameter int CO_MAX     = 1024,
  parameter int LANES_MAX  = 8,
  parameter int COLS_MAX   = 8,
  // Max Beats für PW
  parameter int BEATS_MAX  = 128,

  parameter int K_MAX      = 3,
  parameter int STRIDE_MAX = 2,

  // SRAM address widths (requested)
  parameter int ADDR_W_SRAM_I_O          = 23,
  parameter int ADDR_W_SRAM_WEIGHT      = 21,
  parameter int ADDR_W_SRAM_BIAS_SHIFT  = 12,

  // processing_module address width for w/bias/shift ports
  // Keep >= ADDR_W_SRAM_WEIGHT, bias/shift are zero-extended.
  parameter int ADDR_W = ADDR_W_SRAM_WEIGHT,

  // Arithmetic
  parameter int PXW        = 8,
  parameter int IW_W       = 8,
  parameter int IW_I       = 8,
  parameter int BIAS_W     = 32,
  parameter int OUT_W      = 8,

  
  parameter int OUT_W_MAX_VALID = 64,
  parameter int OUT_H_MAX_VALID = 64,

  parameter int TOTAL_WINS_MAX  = 4096,  // OUT_W_MAX_VALID * OUT_H_MAX_VALID
  parameter int TOTAL_GRPS_MAX  = 4096,  // worst-case: tile_r = 1
  parameter int TOTAL_BLKS_MAX  = 128,     // worst-case: tile_c = 1 (== CO_MAX)
  parameter int NUM_CTX_MAX     = 1024
)(
  input  logic clk,
  input  logic reset,

  // AXI-Lite Slave (CSR)
  input  logic [AXI_ADDR_W-1:0]   S_AWADDR,
  input  logic [2:0]              S_AWPROT,
  input  logic                    S_AWVALID,
  output logic                    S_AWREADY,

  input  logic [AXI_DATA_W-1:0]   S_WDATA,
  input  logic [AXI_DATA_W/8-1:0] S_WSTRB,
  input  logic                    S_WVALID,
  output logic                    S_WREADY,

  output logic [1:0]              S_BRESP,
  output logic                    S_BVALID,
  input  logic                    S_BREADY,

  input  logic [AXI_ADDR_W-1:0]   S_ARADDR,
  input  logic [2:0]              S_ARPROT,
  input  logic                    S_ARVALID,
  output logic                    S_ARREADY,

  output logic [AXI_DATA_W-1:0]   S_RDATA,
  output logic [1:0]              S_RRESP,
  output logic                    S_RVALID,
  input  logic                    S_RREADY,

  // AXI Master (Read)
  output logic [M_AXI_ID_W-1:0]   M_AXI_ARID,
  output logic [M_AXI_ADDR_W-1:0] M_AXI_ARADDR,
  output logic [7:0]              M_AXI_ARLEN,
  output logic [2:0]              M_AXI_ARSIZE,
  output logic [1:0]              M_AXI_ARBURST,
  output logic                    M_AXI_ARVALID,
  input  logic                    M_AXI_ARREADY,

  input  logic [M_AXI_ID_W-1:0]   M_AXI_RID,
  input  logic [M_AXI_DATA_W-1:0] M_AXI_RDATA,
  input  logic [1:0]              M_AXI_RRESP,
  input  logic                    M_AXI_RLAST,
  input  logic                    M_AXI_RVALID,
  output logic                    M_AXI_RREADY,

  // AXI Master (Write)." Dummy
  output logic [M_AXI_ID_W-1:0]   M_AXI_AWID,
  output logic [M_AXI_ADDR_W-1:0] M_AXI_AWADDR,
  output logic [7:0]              M_AXI_AWLEN,
  output logic [2:0]              M_AXI_AWSIZE,
  output logic [1:0]              M_AXI_AWBURST,
  output logic                    M_AXI_AWVALID,
  input  logic                    M_AXI_AWREADY,

  output logic [M_AXI_DATA_W-1:0]   M_AXI_WDATA,
  output logic [M_AXI_DATA_W/8-1:0] M_AXI_WSTRB,
  output logic                      M_AXI_WLAST,
  output logic                      M_AXI_WVALID,
  input  logic                      M_AXI_WREADY,

  input  logic [M_AXI_ID_W-1:0]   M_AXI_BID,
  input  logic [1:0]              M_AXI_BRESP,
  input  logic                    M_AXI_BVALID,
  output logic                    M_AXI_BREADY,

  // Gesamt-Status
  output logic core_done_all
);

  // DMA-SRAM-Writeports
  logic                       sram_a_we;
  logic [ADDR_W_SRAM_I_O-1:0]  sram_a_waddr;
  logic [7:0]                 sram_a_wdata;

  logic                       sram_w_we;
  logic [ADDR_W_SRAM_I_O-1:0]  sram_w_waddr;
  logic [7:0]                 sram_w_wdata;

  logic                       sram_bias_we;
  logic [ADDR_W_SRAM_I_O-1:0]  sram_bias_waddr;
  logic [7:0]                 sram_bias_wdata;

  logic                       sram_shift_we;
  logic [ADDR_W_SRAM_I_O-1:0]  sram_shift_waddr;
  logic [7:0]                 sram_shift_wdata;

  logic                       sram_mult_we;
  logic [ADDR_W_SRAM_I_O-1:0]  sram_mult_waddr;
  logic [7:0]                 sram_mult_wdata;

  // Steuerung vom CSR
  logic ctrl_start_pulse;
  logic cfg_read_bank_sel;
  logic cfg_write_bank_sel;

  logic ctrl_pool_en;
  logic ctrl_pool_max_not_avg;
  logic ctrl_dw_en;
  logic ctrl_pw_en;

  // Runtime-CFG (CSR)
  logic [15:0] cfg_in_h, cfg_in_w, cfg_cin, cfg_cout;
  logic [15:0] cfg_kh, cfg_kw, cfg_sh, cfg_sw;
  logic [15:0] cfg_tile_r, cfg_tile_c;

  // Derived/Runtime Infos." RW über CSR (TB/SW setzt)
  logic [15:0] cfg_out_h;
  logic [15:0] cfg_out_w;
  logic [31:0] total_wins;
  logic [31:0] total_grps;
  logic [31:0] total_blks;
  logic [31:0] cfg_num_ctx;

  // NEW: Padding CFG
  logic [31:0] cfg_pad0;

  // NEW: PW needed beats (aus processing_module -> CSR read-only)
  logic [15:0] pw_needed_beats;

  logic fetch_done_all;

  // SoC / AXI / CSR / DMA
  axi_module #(
    .AXI_ADDR_W   (AXI_ADDR_W),
    .AXI_DATA_W   (AXI_DATA_W),
    .M_AXI_ADDR_W (M_AXI_ADDR_W),
    .M_AXI_DATA_W (M_AXI_DATA_W),
    .M_AXI_ID_W   (M_AXI_ID_W),
    .SRAM_ADDR_W  (ADDR_W_SRAM_I_O)
  ) u_soc (
    .clk        (clk),
    .reset      (reset),

    .S_AWADDR   (S_AWADDR),
    .S_AWPROT   (S_AWPROT),
    .S_AWVALID  (S_AWVALID),
    .S_AWREADY  (S_AWREADY),

    .S_WDATA    (S_WDATA),
    .S_WSTRB    (S_WSTRB),
    .S_WVALID   (S_WVALID),
    .S_WREADY   (S_WREADY),

    .S_BRESP    (S_BRESP),
    .S_BVALID   (S_BVALID),
    .S_BREADY   (S_BREADY),

    .S_ARADDR   (S_ARADDR),
    .S_ARPROT   (S_ARPROT),
    .S_ARVALID  (S_ARVALID),
    .S_ARREADY  (S_ARREADY),

    .S_RDATA    (S_RDATA),
    .S_RRESP    (S_RRESP),
    .S_RVALID   (S_RVALID),
    .S_RREADY   (S_RREADY),

    .M_AXI_ARID    (M_AXI_ARID),
    .M_AXI_ARADDR  (M_AXI_ARADDR),
    .M_AXI_ARLEN   (M_AXI_ARLEN),
    .M_AXI_ARSIZE  (M_AXI_ARSIZE),
    .M_AXI_ARBURST (M_AXI_ARBURST),
    .M_AXI_ARVALID (M_AXI_ARVALID),
    .M_AXI_ARREADY (M_AXI_ARREADY),

    .M_AXI_RID     (M_AXI_RID),
    .M_AXI_RDATA   (M_AXI_RDATA),
    .M_AXI_RRESP   (M_AXI_RRESP),
    .M_AXI_RLAST   (M_AXI_RLAST),
    .M_AXI_RVALID  (M_AXI_RVALID),
    .M_AXI_RREADY  (M_AXI_RREADY),

    .M_AXI_AWID    (M_AXI_AWID),
    .M_AXI_AWADDR  (M_AXI_AWADDR),
    .M_AXI_AWLEN   (M_AXI_AWLEN),
    .M_AXI_AWSIZE  (M_AXI_AWSIZE),
    .M_AXI_AWBURST (M_AXI_AWBURST),
    .M_AXI_AWVALID (M_AXI_AWVALID),
    .M_AXI_AWREADY (M_AXI_AWREADY),

    .M_AXI_WDATA   (M_AXI_WDATA),
    .M_AXI_WSTRB   (M_AXI_WSTRB),
    .M_AXI_WLAST   (M_AXI_WLAST),
    .M_AXI_WVALID  (M_AXI_WVALID),
    .M_AXI_WREADY  (M_AXI_WREADY),

    .M_AXI_BID     (M_AXI_BID),
    .M_AXI_BRESP   (M_AXI_BRESP),
    .M_AXI_BVALID  (M_AXI_BVALID),
    .M_AXI_BREADY  (M_AXI_BREADY),

    .ctrl_start_pulse   (ctrl_start_pulse),
    .cfg_read_bank_sel  (cfg_read_bank_sel),
    .cfg_write_bank_sel (cfg_write_bank_sel),

    .ctrl_pool_en          (ctrl_pool_en),
    .ctrl_pool_max_not_avg (ctrl_pool_max_not_avg),
    .ctrl_dw_en            (ctrl_dw_en),
    .ctrl_pw_en            (ctrl_pw_en),

    .cfg_in_h   (cfg_in_h),
    .cfg_in_w   (cfg_in_w),
    .cfg_cin    (cfg_cin),
    .cfg_cout   (cfg_cout),
    .cfg_kh     (cfg_kh),
    .cfg_kw     (cfg_kw),
    .cfg_sh     (cfg_sh),
    .cfg_sw     (cfg_sw),
    .cfg_tile_r (cfg_tile_r),
    .cfg_tile_c (cfg_tile_c),

    .cfg_out_h   (cfg_out_h),
    .cfg_out_w   (cfg_out_w),
    .total_wins  (total_wins),
    .total_grps  (total_grps),
    .total_blks  (total_blks),
    .cfg_num_ctx (cfg_num_ctx),

    .cfg_pad0    (cfg_pad0),

    // NEW: beats in CSR sichtbar
    .pw_needed_beats (pw_needed_beats),

    .sram_a_we        (sram_a_we),
    .sram_a_waddr     (sram_a_waddr),
    .sram_a_wdata     (sram_a_wdata),

    .sram_w_we        (sram_w_we),
    .sram_w_waddr     (sram_w_waddr),
    .sram_w_wdata     (sram_w_wdata),

    .sram_bias_we     (sram_bias_we),
    .sram_bias_waddr  (sram_bias_waddr),
    .sram_bias_wdata  (sram_bias_wdata),

    .sram_shift_we    (sram_shift_we),
    .sram_shift_waddr (sram_shift_waddr),
    .sram_shift_wdata (sram_shift_wdata),

    .sram_mult_we      (sram_mult_we),
    .sram_mult_waddr   (sram_mult_waddr),
    .sram_mult_wdata   (sram_mult_wdata)
  );

  // Processing
  logic [15:0] dbg_blk_idx_dummy;
  logic [15:0] dbg_grp_idx_dummy;
  logic [15:0] dbg_ctx_idx_dummy;

  processing_module #(
    .IMG_W_MAX        (IMG_W_MAX),
    .IMG_H_MAX        (IMG_H_MAX),
    .CH_IN_MAX        (CH_IN_MAX),
    .CO_MAX           (CO_MAX),
    .LANES_MAX        (LANES_MAX),
    .COLS_MAX         (COLS_MAX),
    .BEATS_MAX        (BEATS_MAX),

    .K_MAX            (K_MAX),
    .STRIDE_MAX       (STRIDE_MAX),
    .ADDR_W           (ADDR_W),

    .PXW              (PXW),
    .IW_W             (IW_W),
    .IW_I             (IW_I),
    .BIAS_W           (BIAS_W),
    .OUT_W            (OUT_W),

    .OUT_W_MAX_VALID  (OUT_W_MAX_VALID),
    .OUT_H_MAX_VALID  (OUT_H_MAX_VALID),
    .TOTAL_WINS_MAX   (TOTAL_WINS_MAX),
    .TOTAL_GRPS_MAX   (TOTAL_GRPS_MAX),
    .TOTAL_BLKS_MAX   (TOTAL_BLKS_MAX),
    .NUM_CTX_MAX      (NUM_CTX_MAX)
  ) u_processing (
    .clk        (clk),
    .reset      (reset),

    .start_frame(ctrl_start_pulse),

    .cfg_read_bank_sel  (cfg_read_bank_sel),
    .cfg_write_bank_sel (cfg_write_bank_sel),

    .cfg_pool_enable      (ctrl_pool_en),
    .cfg_pool_max_not_avg (ctrl_pool_max_not_avg),
    .cfg_dw_enable        (ctrl_dw_en),
    .cfg_pw_enable        (ctrl_pw_en),

    .cfg_in_h   (cfg_in_h),
    .cfg_in_w   (cfg_in_w),
    .cfg_cin    (cfg_cin),
    .cfg_cout   (cfg_cout),
    .cfg_kh     (cfg_kh),
    .cfg_kw     (cfg_kw),
    .cfg_sh     (cfg_sh),
    .cfg_sw     (cfg_sw),
    .cfg_tile_r (cfg_tile_r),
    .cfg_tile_c (cfg_tile_c),

    .cfg_pad0   (cfg_pad0),

    .cfg_out_h   (cfg_out_h),
    .cfg_out_w   (cfg_out_w),
    .total_wins  (total_wins),
    .total_grps  (total_grps),
    .total_blks  (total_blks),
    .cfg_num_ctx (cfg_num_ctx),

    // NEW: export needed beats
    .pw_needed_beats (pw_needed_beats),

    .if_we_flat   (sram_a_we),
    .if_flat_data (sram_a_wdata[PXW-1:0]),

    .w_we          (sram_w_we),
    .w_waddr       (sram_w_waddr[ADDR_W_SRAM_WEIGHT-1:0]),
    .w_wdata       (sram_w_wdata),

    .bs_we_bias    (sram_bias_we),
    .bs_waddr_bias ({{(ADDR_W-ADDR_W_SRAM_BIAS_SHIFT){1'b0}}, sram_bias_waddr[ADDR_W_SRAM_BIAS_SHIFT-1:0]}),
    .bs_wdata_bias (sram_bias_wdata),

    .bs_we_shift    (sram_shift_we),
    .bs_waddr_shift ({{(ADDR_W-ADDR_W_SRAM_BIAS_SHIFT){1'b0}}, sram_shift_waddr[ADDR_W_SRAM_BIAS_SHIFT-1:0]}),
    .bs_wdata_shift (sram_shift_wdata),

    .bs_we_mult    (sram_mult_we),
    .bs_waddr_mult ({{(ADDR_W-ADDR_W_SRAM_BIAS_SHIFT){1'b0}}, sram_mult_waddr[ADDR_W_SRAM_BIAS_SHIFT-1:0]}),
    .bs_wdata_mult (sram_mult_wdata),

    .done_all       (fetch_done_all),
    .conv_done_global(),
    .pooling_done  (),
    .dbg_blk_idx   (dbg_blk_idx_dummy),
    .dbg_grp_idx   (dbg_grp_idx_dummy),
    .dbg_ctx_idx   (dbg_ctx_idx_dummy)
  );

  assign core_done_all = fetch_done_all;

endmodule
