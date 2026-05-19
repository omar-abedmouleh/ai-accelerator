`timescale 1ns/1ps
import packages_of_config_regis::*;

module axi_module #(
  parameter int AXI_ADDR_W   = 12,
  parameter int AXI_DATA_W   = 32,
  parameter int M_AXI_ADDR_W = 32,
  parameter int M_AXI_DATA_W = 32,
  parameter int M_AXI_ID_W   = 4,
  parameter int SRAM_ADDR_W  = 20
)(
  input  logic                    clk,
  input  logic                    reset,

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

  // AXI Master (DMA)
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

  // Steuerung für Core / Ping-Pong
  output logic                    ctrl_start_pulse,
  output logic                    cfg_read_bank_sel,
  output logic                    cfg_write_bank_sel,

  // Pooling/Depthwise/Pointwise-Konfiguration nach au�Yen
  output logic                    ctrl_pool_en,
  output logic                    ctrl_pool_max_not_avg,
  output logic                    ctrl_dw_en,
  output logic                    ctrl_pw_en,               // NEW

  // Runtime-CFG nach au�Yen
  output logic [15:0]             cfg_in_h,
  output logic [15:0]             cfg_in_w,
  output logic [15:0]             cfg_cin,
  output logic [15:0]             cfg_cout,
  output logic [15:0]             cfg_kh,
  output logic [15:0]             cfg_kw,
  output logic [15:0]             cfg_sh,
  output logic [15:0]             cfg_sw,
  output logic [15:0]             cfg_tile_r,
  output logic [15:0]             cfg_tile_c,

  // Derived/Runtime Infos (Inputs vom Core/Top)
  output logic [15:0]             cfg_out_h,
  output logic [15:0]             cfg_out_w,
  output logic [31:0]             total_wins,
  output logic [31:0]             total_grps,
  output logic [31:0]             total_blks,
  output logic [31:0]             cfg_num_ctx,

  // NEW: Padding CFG nach au�Yen
  // CSR_CFG_PAD0 @ 0x7C:
  // [7:0]   pad_left
  // [15:8]  pad_right
  // [23:16] pad_top
  // [31:24] pad_bottom
  output logic [31:0]             cfg_pad0,

  // NEW: PW Needed Beats (vom Core/Top rein)
  // Wird im CSR als Read-Only unter CSR_PW_NEEDED_BEATS auslesbar
  input  logic [15:0]             pw_needed_beats,

  // DMA-SRAM-Writeports
  output logic                    sram_a_we,
  output logic [SRAM_ADDR_W-1:0]  sram_a_waddr,
  output logic [7:0]              sram_a_wdata,

  output logic                    sram_w_we,
  output logic [SRAM_ADDR_W-1:0]  sram_w_waddr,
  output logic [7:0]              sram_w_wdata,

  output logic                    sram_bias_we,
  output logic [SRAM_ADDR_W-1:0]  sram_bias_waddr,
  output logic [7:0]              sram_bias_wdata,

  output logic                    sram_shift_we,
  output logic [SRAM_ADDR_W-1:0]  sram_shift_waddr,
  output logic [7:0]              sram_shift_wdata,

  output logic                    sram_mult_we,
  output logic [SRAM_ADDR_W-1:0]  sram_mult_waddr,
  output logic [7:0]              sram_mult_wdata
);

  // 1) AXI-Lite.' MMIO (CSR)  [BYTE-adressiert]
  localparam int CSR_AW = CSR_ADDR_W;

  logic                 mmio_wr_en;
  logic [CSR_AW-1:0]    mmio_wr_addr;
  logic [31:0]          mmio_wr_data;
  logic [3:0]           mmio_wr_strb;

  logic                 mmio_rd_en;
  logic [CSR_AW-1:0]    mmio_rd_addr;
  logic [31:0]          mmio_rd_data;

  axi4_lite_slave #(
    .ADDR_W       (AXI_ADDR_W),
    .DATA_W       (AXI_DATA_W),
    .P_CSR_ADDR_W (CSR_AW)
  ) u_axi_lite (
    .ACLK         (clk),
    .ARESET       (reset),

    .S_AWADDR     (S_AWADDR),
    .S_AWPROT     (S_AWPROT),
    .S_AWVALID    (S_AWVALID),
    .S_AWREADY    (S_AWREADY),

    .S_WDATA      (S_WDATA),
    .S_WSTRB      (S_WSTRB),
    .S_WVALID     (S_WVALID),
    .S_WREADY     (S_WREADY),

    .S_BRESP      (S_BRESP),
    .S_BVALID     (S_BVALID),
    .S_BREADY     (S_BREADY),

    .S_ARADDR     (S_ARADDR),
    .S_ARPROT     (S_ARPROT),
    .S_ARVALID    (S_ARVALID),
    .S_ARREADY    (S_ARREADY),

    .S_RDATA      (S_RDATA),
    .S_RRESP      (S_RRESP),
    .S_RVALID     (S_RVALID),
    .S_RREADY     (S_RREADY),

    .mmio_wr_en   (mmio_wr_en),
    .mmio_wr_addr (mmio_wr_addr),
    .mmio_wr_data (mmio_wr_data),
    .mmio_wr_strb (mmio_wr_strb),

    .mmio_rd_en   (mmio_rd_en),
    .mmio_rd_addr (mmio_rd_addr),
    .mmio_rd_data (mmio_rd_data)
  );

  // 2) CSR-Registerfile (UPDATE: pw_en + pad0 + pw_needed_beats RO)
  logic ctrl_relu_en;
  logic ctrl_pool_en_int;
  logic ctrl_pool_max_not_avg_int;
  logic ctrl_dw_en_int;
  logic ctrl_pw_en_int; // NEW

  logic [31:0] dma_in_src,   dma_in_dst,   dma_in_len;
  logic [31:0] dma_wg_src,   dma_wg_dst,   dma_wg_len;
  logic [31:0] dma_out_src,  dma_out_dst,  dma_out_len;
  logic [31:0] dma_bias_src, dma_bias_dst, dma_bias_len;
  logic [31:0] dma_shift_src,dma_shift_dst,dma_shift_len;
  logic [31:0] dma_mult_src, dma_mult_dst, dma_mult_len;

  logic dma_in_start;
  logic dma_wg_start;
  logic dma_out_start;

  logic wb_enable;

  csr_regfile #(
    .P_CSR_ADDR_W (CSR_AW)
  ) u_csr (
    .clk            (clk),
    .reset          (reset),

    .wr_en          (mmio_wr_en),
    .wr_addr        (mmio_wr_addr),
    .wr_data        (mmio_wr_data),
    .wr_strb        (mmio_wr_strb),

    .rd_en          (mmio_rd_en),
    .rd_addr        (mmio_rd_addr),
    .rd_data        (mmio_rd_data),

    // CONTROL (start/auto_en entfernt)
    .ctrl_relu_en          (ctrl_relu_en),
    .ctrl_pool_en          (ctrl_pool_en_int),
    .ctrl_dw_en            (ctrl_dw_en_int),
    .ctrl_pool_max_not_avg (ctrl_pool_max_not_avg_int),
    .ctrl_pw_en            (ctrl_pw_en_int), // NEW

    // CFG
    .cfg_in_h       (cfg_in_h),
    .cfg_in_w       (cfg_in_w),
    .cfg_cin        (cfg_cin),
    .cfg_cout       (cfg_cout),
    .cfg_kh         (cfg_kh),
    .cfg_kw         (cfg_kw),
    .cfg_sh         (cfg_sh),
    .cfg_sw         (cfg_sw),
    .cfg_tile_r     (cfg_tile_r),
    .cfg_tile_c     (cfg_tile_c),

    // Derived/Runtime (RW)
    .cfg_out_h    (cfg_out_h),
    .cfg_out_w    (cfg_out_w),
    .total_wins   (total_wins),
    .total_grps   (total_grps),
    .total_blks   (total_blks),
    .cfg_num_ctx  (cfg_num_ctx),

    // NEW: PAD
    .cfg_pad0     (cfg_pad0),

    // NEW: PW needed beats (RO)
    .pw_needed_beats (pw_needed_beats),

    // DMA regs
    .dma_in_src     (dma_in_src),
    .dma_in_dst     (dma_in_dst),
    .dma_in_len     (dma_in_len),

    .dma_wg_src     (dma_wg_src),
    .dma_wg_dst     (dma_wg_dst),
    .dma_wg_len     (dma_wg_len),

    .dma_out_src    (dma_out_src),
    .dma_out_dst    (dma_out_dst),
    .dma_out_len    (dma_out_len),

    .dma_bias_src   (dma_bias_src),
    .dma_bias_dst   (dma_bias_dst),
    .dma_bias_len   (dma_bias_len),

    .dma_shift_src  (dma_shift_src),
    .dma_shift_dst  (dma_shift_dst),
    .dma_shift_len  (dma_shift_len),

    .dma_mult_src   (dma_mult_src),
    .dma_mult_dst   (dma_mult_dst),
    .dma_mult_len   (dma_mult_len),

    // START pulses
    .dma_in_start   (dma_in_start),
    .dma_wg_start   (dma_wg_start),
    .dma_out_start  (dma_out_start),

    .wb_enable      (wb_enable),

    .cfg_read_bank_sel  (cfg_read_bank_sel),
    .cfg_write_bank_sel (cfg_write_bank_sel)
  );

  assign ctrl_pool_en          = ctrl_pool_en_int;
  assign ctrl_pool_max_not_avg = ctrl_pool_max_not_avg_int;
  assign ctrl_dw_en            = ctrl_dw_en_int;
  assign ctrl_pw_en            = ctrl_pw_en_int; // NEW

  // 2a) Start-Logik: Core startet automatisch bei DMA_DONE
  logic dma_busy_live;
  logic dma_done_pulse;
  logic dma_err_pulse;

  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      ctrl_start_pulse <= 1'b0;
    end else begin
      ctrl_start_pulse <= 1'b0;
      if (dma_done_pulse) begin
        ctrl_start_pulse <= 1'b1;
      end
    end
  end

  // 3) DMA
  logic                   sram_out_re_int;
  logic [SRAM_ADDR_W-1:0] sram_out_raddr_int;
  logic [7:0]             sram_out_rdata_int;

  assign sram_out_rdata_int = 8'h00;

  dma_controller #(
    .AXI_ADDR_WIDTH (M_AXI_ADDR_W),
    .AXI_DATA_WIDTH (M_AXI_DATA_W),
    .AXI_ID_WIDTH   (M_AXI_ID_W),
    .SRAM_ADDR_W    (SRAM_ADDR_W)
  ) u_dma (
    .clk            (clk),
    .reset          (reset),

    // Dein DMA-Controller hat nur EIN start:
    // -> Wir starten den kompletten DMA-Flow mit DMA_IN_START
    .start          (dma_in_start),

    .in_src_addr    (dma_in_src[M_AXI_ADDR_W-1:0]),
    .in_dst_addr    (dma_in_dst[SRAM_ADDR_W-1:0]),
    .in_byte_len    (dma_in_len),

    .wg_src_addr    (dma_wg_src[M_AXI_ADDR_W-1:0]),
    .wg_dst_addr    (dma_wg_dst[SRAM_ADDR_W-1:0]),
    .wg_byte_len    (dma_wg_len),

    .bias_src_addr  (dma_bias_src[M_AXI_ADDR_W-1:0]),
    .bias_dst_addr  (dma_bias_dst[SRAM_ADDR_W-1:0]),
    .bias_byte_len  (dma_bias_len),

    .shift_src_addr (dma_shift_src[M_AXI_ADDR_W-1:0]),
    .shift_dst_addr (dma_shift_dst[SRAM_ADDR_W-1:0]),
    .shift_byte_len (dma_shift_len),

    .mult_src_addr  (dma_mult_src[M_AXI_ADDR_W-1:0]),
    .mult_dst_addr  (dma_mult_dst[SRAM_ADDR_W-1:0]),
    .mult_byte_len  (dma_mult_len),

    .wb_enable      (1'b0),
    .wb_dst_addr    (dma_out_dst[M_AXI_ADDR_W-1:0]),
    .wb_src_addr    (dma_out_src[SRAM_ADDR_W-1:0]),
    .wb_byte_len    (dma_out_len),
    .acc_layer_done (1'b0),

    .busy           (dma_busy_live),
    .done           (dma_done_pulse),
    .error          (dma_err_pulse),

    .sram_a_we      (sram_a_we),
    .sram_a_waddr   (sram_a_waddr),
    .sram_a_wdata   (sram_a_wdata),

    .sram_w_we      (sram_w_we),
    .sram_w_waddr   (sram_w_waddr),
    .sram_w_wdata   (sram_w_wdata),

    .sram_bias_we    (sram_bias_we),
    .sram_bias_waddr (sram_bias_waddr),
    .sram_bias_wdata (sram_bias_wdata),

    .sram_shift_we    (sram_shift_we),
    .sram_shift_waddr (sram_shift_waddr),
    .sram_shift_wdata (sram_shift_wdata),

    .sram_mult_we    (sram_mult_we),
    .sram_mult_waddr (sram_mult_waddr),
    .sram_mult_wdata (sram_mult_wdata),

    .sram_out_re    (sram_out_re_int),
    .sram_out_raddr (sram_out_raddr_int),
    .sram_out_rdata (sram_out_rdata_int),

    .M_AXI_ARID     (M_AXI_ARID),
    .M_AXI_ARADDR   (M_AXI_ARADDR),
    .M_AXI_ARLEN    (M_AXI_ARLEN),
    .M_AXI_ARSIZE   (M_AXI_ARSIZE),
    .M_AXI_ARBURST  (M_AXI_ARBURST),
    .M_AXI_ARVALID  (M_AXI_ARVALID),
    .M_AXI_ARREADY  (M_AXI_ARREADY),

    .M_AXI_RID      (M_AXI_RID),
    .M_AXI_RDATA    (M_AXI_RDATA),
    .M_AXI_RRESP    (M_AXI_RRESP),
    .M_AXI_RLAST    (M_AXI_RLAST),
    .M_AXI_RVALID   (M_AXI_RVALID),
    .M_AXI_RREADY   (M_AXI_RREADY),

    .M_AXI_AWID     (M_AXI_AWID),
    .M_AXI_AWADDR   (M_AXI_AWADDR),
    .M_AXI_AWLEN    (M_AXI_AWLEN),
    .M_AXI_AWSIZE   (M_AXI_AWSIZE),
    .M_AXI_AWBURST  (M_AXI_AWBURST),
    .M_AXI_AWVALID  (M_AXI_AWVALID),
    .M_AXI_AWREADY  (M_AXI_AWREADY),

    .M_AXI_WDATA    (M_AXI_WDATA),
    .M_AXI_WSTRB    (M_AXI_WSTRB),
    .M_AXI_WLAST    (M_AXI_WLAST),
    .M_AXI_WVALID   (M_AXI_WVALID),
    .M_AXI_WREADY   (M_AXI_WREADY),

    .M_AXI_BID      (M_AXI_BID),
    .M_AXI_BRESP    (M_AXI_BRESP),
    .M_AXI_BVALID   (M_AXI_BVALID),
    .M_AXI_BREADY   (M_AXI_BREADY)
  );

endmodule
