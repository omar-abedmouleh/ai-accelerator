`timescale 1ns/1ps
import packages_of_config_regis::*;

module tb_global_single_accel_conv_pool_only;

  // Clock/Reset
  logic clk;
  logic reset;

  initial clk = 1'b0;
  always #5 clk = ~clk;

  // ROM Files
  localparam string IMG_FILE       = "C:/Users/amora/Desktop/Neuer Ordner (2)/ai_riscv/hw/ai_acc/processing_module/line buffer/x_i8_int8_pot_sauria_same_pad.bin";
  localparam string WGT_ROM_FILE   = "C:/Users/amora/Desktop/Neuer Ordner (2)/ai_riscv/hw/ai_acc/processing_module/weight/weights_int8_sauria.bin";
  localparam string BIAS_ROM_FILE  = "C:/Users/amora/Desktop/Neuer Ordner (2)/ai_riscv/hw/ai_acc/layers/first_layer/bias_hw_int32.bin";
  localparam string SHIFT_ROM_FILE = "C:/Users/amora/Desktop/Neuer Ordner (2)/ai_riscv/hw/ai_acc/layers/first_layer/requant_shift_int32.bin";

  // Host Memory Layout
  localparam int M_AXI_ADDR_W = 24;
  localparam int M_AXI_DATA_W = 32;
  localparam int M_AXI_ID_W   = 4;

  localparam int IMG_BASE   = 'h0000_1000;
  localparam int WGT_BASE   = 'h0008_0000;
  localparam int BIAS_BASE  = 'h0010_0000;
  localparam int SHIFT_BASE = 'h0018_0000;

  // DUT MAX Params
  localparam int AXI_ADDR_W   = 12;
  localparam int AXI_DATA_W   = 32;

  localparam int IMG_W_MAX   = 226;
  localparam int IMG_H_MAX   = 226;
  localparam int CH_IN_MAX   = 32;
  localparam int CO_MAX      = 32;

  localparam int LANES_MAX   = 4;
  localparam int COLS_MAX    = 4;

  localparam int K_MAX       = 3;
  localparam int STRIDE_MAX  = 2;

  localparam int PXW    = 8;
  localparam int IW_W   = 8;
  localparam int IW_I   = 8;
  localparam int BIAS_W = 32;
  localparam int OUT_W  = 8;

  // Layer0 bytes/offsets
  localparam int L0_WGT_BYTES   = 32*3*3*3; // 864
  localparam int L0_BIAS_BYTES  = 32*4;
  localparam int L0_SHIFT_BYTES = 32*4;

  localparam int L0_WGT_OFF   = 0;
  localparam int L0_BIAS_OFF  = 0;
  localparam int L0_SHIFT_OFF = 0;

  // SRAM address widths
  localparam int ADDR_W_SRAM_I_O         = 14;
  localparam int ADDR_W_SRAM_WEIGHT      = 11;
  localparam int ADDR_W_SRAM_BIAS_SHIFT  = 8;

  // Pooling Config (Average Pooling)
  localparam bit ENABLE_POOL      = 1'b1;  // POOL ON
  localparam bit POOL_MAX_NOT_AVG = 1'b0;  // AVG pooling (wichtig)
  localparam bit FORCE_CTRL_AFTER_START = 1'b1;

  // AXI-Lite (to DUT)
  logic [AXI_ADDR_W-1:0]     S_AWADDR;
  logic [2:0]                S_AWPROT;
  logic                      S_AWVALID;
  logic                      S_AWREADY;

  logic [AXI_DATA_W-1:0]     S_WDATA;
  logic [AXI_DATA_W/8-1:0]   S_WSTRB;
  logic                      S_WVALID;
  logic                      S_WREADY;

  logic [1:0]                S_BRESP;
  logic                      S_BVALID;
  logic                      S_BREADY;

  logic [AXI_ADDR_W-1:0]     S_ARADDR;
  logic [2:0]                S_ARPROT;
  logic                      S_ARVALID;
  logic                      S_ARREADY;

  logic [AXI_DATA_W-1:0]     S_RDATA;
  logic [1:0]                S_RRESP;
  logic                      S_RVALID;
  logic                      S_RREADY;

  // AXI Master (DUT -> ROM)
  logic [M_AXI_ID_W-1:0]     M_ARID;
  logic [M_AXI_ADDR_W-1:0]   M_ARADDR;
  logic [7:0]                M_ARLEN;
  logic [2:0]                M_ARSIZE;
  logic [1:0]                M_ARBURST;
  logic                      M_ARVALID;
  logic                      M_ARREADY;

  logic [M_AXI_ID_W-1:0]     M_RID;
  logic [M_AXI_DATA_W-1:0]   M_RDATA;
  logic [1:0]                M_RRESP;
  logic                      M_RLAST;
  logic                      M_RVALID;
  logic                      M_RREADY;

  // AXI Writeback (DUT -> TB Slave Stub)
  logic [M_AXI_ID_W-1:0]     M_AWID;
  logic [M_AXI_ADDR_W-1:0]   M_AWADDR;
  logic [7:0]                M_AWLEN;
  logic [2:0]                M_AWSIZE;
  logic [1:0]                M_AWBURST;
  logic                      M_AWVALID;
  logic                      M_AWREADY;

  logic [M_AXI_DATA_W-1:0]   M_WDATA;
  logic [M_AXI_DATA_W/8-1:0] M_WSTRB;
  logic                      M_WLAST;
  logic                      M_WVALID;
  logic                      M_WREADY;

  logic [M_AXI_ID_W-1:0]     M_BID;
  logic [1:0]                M_BRESP;
  logic                      M_BVALID;
  logic                      M_BREADY;

  logic core_done_all;

  // DUT
  top_module #(
    .AXI_ADDR_W   (AXI_ADDR_W),
    .AXI_DATA_W   (AXI_DATA_W),
    .M_AXI_ADDR_W (M_AXI_ADDR_W),
    .M_AXI_DATA_W (M_AXI_DATA_W),
    .M_AXI_ID_W   (M_AXI_ID_W),

    .IMG_W_MAX    (IMG_W_MAX),
    .IMG_H_MAX    (IMG_H_MAX),
    .CH_IN_MAX    (CH_IN_MAX),
    .CO_MAX       (CO_MAX),
    .LANES_MAX    (LANES_MAX),
    .COLS_MAX     (COLS_MAX),

    .K_MAX        (K_MAX),
    .STRIDE_MAX   (STRIDE_MAX),

    .ADDR_W_SRAM_I_O          (ADDR_W_SRAM_I_O),
    .ADDR_W_SRAM_WEIGHT       (ADDR_W_SRAM_WEIGHT),
    .ADDR_W_SRAM_BIAS_SHIFT   (ADDR_W_SRAM_BIAS_SHIFT),

    .PXW          (PXW),
    .IW_W         (IW_W),
    .IW_I         (IW_I),
    .BIAS_W       (BIAS_W),
    .OUT_W        (OUT_W)
  ) dut (
    .clk       (clk),
    .reset     (reset),

    .S_AWADDR  (S_AWADDR),
    .S_AWPROT  (S_AWPROT),
    .S_AWVALID (S_AWVALID),
    .S_AWREADY (S_AWREADY),

    .S_WDATA   (S_WDATA),
    .S_WSTRB   (S_WSTRB),
    .S_WVALID  (S_WVALID),
    .S_WREADY  (S_WREADY),

    .S_BRESP   (S_BRESP),
    .S_BVALID  (S_BVALID),
    .S_BREADY  (S_BREADY),

    .S_ARADDR  (S_ARADDR),
    .S_ARPROT  (S_ARPROT),
    .S_ARVALID (S_ARVALID),
    .S_ARREADY (S_ARREADY),

    .S_RDATA   (S_RDATA),
    .S_RRESP   (S_RRESP),
    .S_RVALID  (S_RVALID),
    .S_RREADY  (S_RREADY),

    .M_AXI_ARID    (M_ARID),
    .M_AXI_ARADDR  (M_ARADDR),
    .M_AXI_ARLEN   (M_ARLEN),
    .M_AXI_ARSIZE  (M_ARSIZE),
    .M_AXI_ARBURST (M_ARBURST),
    .M_AXI_ARVALID (M_ARVALID),
    .M_AXI_ARREADY (M_ARREADY),

    .M_AXI_RID     (M_RID),
    .M_AXI_RDATA   (M_RDATA),
    .M_AXI_RRESP   (M_RRESP),
    .M_AXI_RLAST   (M_RLAST),
    .M_AXI_RVALID  (M_RVALID),
    .M_AXI_RREADY  (M_RREADY),

    .M_AXI_AWID    (M_AWID),
    .M_AXI_AWADDR  (M_AWADDR),
    .M_AXI_AWLEN   (M_AWLEN),
    .M_AXI_AWSIZE  (M_AWSIZE),
    .M_AXI_AWBURST (M_AWBURST),
    .M_AXI_AWVALID (M_AWVALID),
    .M_AXI_AWREADY (M_AWREADY),

    .M_AXI_WDATA   (M_WDATA),
    .M_AXI_WSTRB   (M_WSTRB),
    .M_AXI_WLAST   (M_WLAST),
    .M_AXI_WVALID  (M_WVALID),
    .M_AXI_WREADY  (M_WREADY),

    .M_AXI_BID     (M_BID),
    .M_AXI_BRESP   (M_BRESP),
    .M_AXI_BVALID  (M_BVALID),
    .M_AXI_BREADY  (M_BREADY),

    .core_done_all (core_done_all)
  );

  // ROM (READ ONLY)
  axi_mem_ro #(
    .DATA_WIDTH (M_AXI_DATA_W),
    .ADDR_WIDTH (M_AXI_ADDR_W),
    .ID_WIDTH   (M_AXI_ID_W),
    .IMG_BASE   (IMG_BASE),
    .WGT_BASE   (WGT_BASE),
    .BIAS_BASE  (BIAS_BASE),
    .SHIFT_BASE (SHIFT_BASE),
    .IMG_FILE   (IMG_FILE),
    .WGT_FILE   (WGT_ROM_FILE),
    .BIAS_FILE  (BIAS_ROM_FILE),
    .SHIFT_FILE (SHIFT_ROM_FILE)
  ) u_rom (
    .clk (clk),
    .reset (reset),

    .s_axi_arid    (M_ARID),
    .s_axi_araddr  (M_ARADDR),
    .s_axi_arlen   (M_ARLEN),
    .s_axi_arsize  (M_ARSIZE),
    .s_axi_arburst (M_ARBURST),
    .s_axi_arvalid (M_ARVALID),
    .s_axi_arready (M_ARREADY),

    .s_axi_rid     (M_RID),
    .s_axi_rdata   (M_RDATA),
    .s_axi_rresp   (M_RRESP),
    .s_axi_rlast   (M_RLAST),
    .s_axi_rvalid  (M_RVALID),
    .s_axi_rready  (M_RREADY)
  );

  // AXI WRITEBACK SLAVE STUB
  assign M_AWREADY = 1'b1;
  assign M_WREADY  = 1'b1;

  logic [M_AXI_ID_W-1:0] awid_q;
  logic                  bvalid_q;

  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      awid_q   <= '0;
      bvalid_q <= 1'b0;
      M_BID    <= '0;
      M_BRESP  <= 2'b00;
      M_BVALID <= 1'b0;
    end else begin
      M_BVALID <= bvalid_q;

      if (M_AWVALID && M_AWREADY)
        awid_q <= M_AWID;

      if (M_WVALID && M_WREADY && M_WLAST) begin
        bvalid_q <= 1'b1;
        M_BID    <= awid_q;
        M_BRESP  <= 2'b00;
      end

      if (bvalid_q && M_BREADY)
        bvalid_q <= 1'b0;
    end
  end

  // AXI-Lite WRITE/READ (BYTE-ADDR)
  task automatic axi_lite_write_byteaddr;
    input logic [AXI_ADDR_W-1:0] byte_addr;
    input logic [31:0] data;

    integer aw_done;
    integer w_done;
    begin
      aw_done = 0;
      w_done  = 0;

      S_AWADDR  = byte_addr;
      S_AWPROT  = 3'b000;
      S_AWVALID = 1'b1;

      S_WDATA   = data;
      S_WSTRB   = 4'hF;
      S_WVALID  = 1'b1;

      while ((aw_done == 0) || (w_done == 0)) begin
        @(posedge clk);

        if ((aw_done == 0) && S_AWVALID && S_AWREADY) begin
          aw_done   = 1;
          S_AWVALID = 1'b0;
        end

        if ((w_done == 0) && S_WVALID && S_WREADY) begin
          w_done   = 1;
          S_WVALID = 1'b0;
        end
      end

      S_BREADY = 1'b1;
      while (!S_BVALID) @(posedge clk);
      @(posedge clk);
      S_BREADY = 1'b0;

      S_AWADDR = '0;
      S_WDATA  = '0;
      S_WSTRB  = '0;
    end
  endtask

  task automatic axi_lite_read_byteaddr;
    input  logic [AXI_ADDR_W-1:0] byte_addr;
    output logic [31:0] data;

    integer ar_done;
    integer r_done;
    begin
      ar_done = 0;
      r_done  = 0;

      S_ARADDR  = byte_addr;
      S_ARPROT  = 3'b000;
      S_ARVALID = 1'b1;

      while (ar_done == 0) begin
        @(posedge clk);
        if (S_ARVALID && S_ARREADY) begin
          ar_done   = 1;
          S_ARVALID = 1'b0;
        end
      end

      S_RREADY = 1'b1;
      while (r_done == 0) begin
        @(posedge clk);
        if (S_RVALID && S_RREADY) begin
          data   = S_RDATA;
          r_done = 1;
        end
      end
      S_RREADY = 1'b0;

      S_ARADDR = '0;
    end
  endtask

  function automatic logic [31:0] pack2x16;
    input integer hi;
    input integer lo;
    begin
      pack2x16 = {hi[15:0], lo[15:0]};
    end
  endfunction

  function automatic integer ceil_div;
    input integer a;
    input integer b;
    integer q;
    begin
      q = a / b;
      if ((a % b) != 0) q = q + 1;
      ceil_div = q;
    end
  endfunction

  function automatic logic [31:0] pack_control;
    input logic relu_en;
    input logic pool_en;
    input logic dw_en;
    input logic pool_max;
    logic [31:0] c;
    begin
      c = 32'h0;
      c[0] = relu_en;
      c[1] = pool_en;
      c[2] = dw_en;
      c[3] = pool_max;
      pack_control = c;
    end
  endfunction

  task automatic start_layer_via_dma_in_start;
    begin
      axi_lite_write_byteaddr(CSR_DMA_IN_START[AXI_ADDR_W-1:0], 32'h1);
      axi_lite_write_byteaddr(CSR_DMA_IN_START[AXI_ADDR_W-1:0], 32'h0);
    end
  endtask

  task automatic wait_run_done;
    begin
      if (core_done_all) @(negedge core_done_all);
      @(posedge core_done_all);
    end
  endtask

  // DUMP TASK (HWC)
  task automatic dump_ofmap_bin_1d;
    input string  fname;
    input integer out_w;
    input integer out_h;
    input integer ch_cnt;
    input logic   bank_sel;

    integer fd;
    integer y;
    integer x;
    integer ch;
    integer addr;
    byte    b;
    begin
      fd = $fopen(fname, "wb");
      if (fd == 0) begin
        $display("ERROR: Cannot open %s", fname);
        $finish;
      end

      for (y = 0; y < out_h; y = y + 1) begin
        for (x = 0; x < out_w; x = x + 1) begin
          addr = (y * IMG_W_MAX) + x;

          for (ch = 0; ch < ch_cnt; ch = ch + 1) begin
            if (bank_sel == 1'b0)
              b = byte'(dut.u_processing.u_feat_bank_a.mem_bank[ch][addr]);
            else
              b = byte'(dut.u_processing.u_feat_bank_b.mem_bank[ch][addr]);

            $fwrite(fd, "%c", b);
          end
        end
      end

      $fclose(fd);
      $display("Wrote OFMAP (HWC) to %s (bank=%0d)", fname, bank_sel);
    end
  endtask

  // Main
  integer in_w;
  integer in_h;
  integer cin;
  integer cout;
  integer kh;
  integer kw;
  integer sh;
  integer sw;
  integer tile_r;
  integer tile_c;

  integer out_w_valid;
  integer out_h_valid;

  integer out_w_pool;
  integer out_h_pool;

  integer total_wins_valid;
  integer total_grps_valid;
  integer total_blks_valid;
  integer num_ctx;

  logic   read_bank;
  logic   write_bank;

  logic [31:0] rd_tmp;

  initial begin
    // Defaults
    S_AWADDR  = '0; S_AWPROT = '0; S_AWVALID = 1'b0;
    S_WDATA   = '0; S_WSTRB  = '0; S_WVALID  = 1'b0;
    S_BREADY  = 1'b0;
    S_ARADDR  = '0; S_ARPROT = '0; S_ARVALID = 1'b0;
    S_RREADY  = 1'b0;

    // Reset
    reset = 1'b1;
    repeat (20) @(posedge clk);
    reset = 1'b0;
    repeat (10) @(posedge clk);

    // Bank ctrl: read A, write B
    read_bank  = 1'b0;
    write_bank = 1'b1;
    axi_lite_write_byteaddr(CSR_BANK_CTRL[AXI_ADDR_W-1:0], {30'h0, write_bank, read_bank});

    // Layer0 params
    in_w   = 226; in_h   = 226;
    cin    = 3;   cout  = 32;
    kh     = 3;   kw    = 3;
    sh     = 2;   sw    = 2;
    tile_r = 4;   tile_c = 4;

    out_w_valid = ((in_w - kw) / sw) + 1;   // 112
    out_h_valid = ((in_h - kh) / sh) + 1;   // 112

    // Pool dims (2x2 stride2 -> 112 -> 56)
    out_w_pool = (out_w_valid / 2);
    out_h_pool = (out_h_valid / 2);

    total_wins_valid = out_w_valid * out_h_valid;
    total_blks_valid = ceil_div(cout, tile_c);
    total_grps_valid = ceil_div(total_wins_valid, tile_r);
    num_ctx          = kw * kh * cin;

    $display("TB: CONV out_w=%0d out_h=%0d", out_w_valid, out_h_valid);
    $display("TB: AVGPOOL out_w=%0d out_h=%0d (pool_max=%0d)", out_w_pool, out_h_pool, POOL_MAX_NOT_AVG);

    // CONTROL: Pooling ON (AVG!)
    axi_lite_write_byteaddr(CSR_CONTROL[AXI_ADDR_W-1:0],
                            pack_control(1'b0, ENABLE_POOL, 1'b0, POOL_MAX_NOT_AVG));
    axi_lite_read_byteaddr (CSR_CONTROL[AXI_ADDR_W-1:0], rd_tmp);
    $display("TB: CSR_CONTROL after write = 0x%08h", rd_tmp);

    // Derived (Fetcher läuft weiterhin über 112x112 Fenster)
    axi_lite_write_byteaddr(CSR_CFG_OUT0[AXI_ADDR_W-1:0],    pack2x16(out_w_valid, out_h_valid));
    axi_lite_write_byteaddr(CSR_TOTAL_WINS[AXI_ADDR_W-1:0],  total_wins_valid);
    axi_lite_write_byteaddr(CSR_TOTAL_GRPS[AXI_ADDR_W-1:0],  total_grps_valid);
    axi_lite_write_byteaddr(CSR_TOTAL_BLKS[AXI_ADDR_W-1:0],  total_blks_valid);
    axi_lite_write_byteaddr(CSR_CFG_NUM_CTX[AXI_ADDR_W-1:0], num_ctx);

    // Runtime CFG
    axi_lite_write_byteaddr(CSR_CFG_IN0[AXI_ADDR_W-1:0],    pack2x16(in_w,  in_h));
    axi_lite_write_byteaddr(CSR_CFG_IN1[AXI_ADDR_W-1:0],    pack2x16(cout,  cin));
    axi_lite_write_byteaddr(CSR_CFG_K[AXI_ADDR_W-1:0],      pack2x16(kw,    kh));
    axi_lite_write_byteaddr(CSR_CFG_STRIDE[AXI_ADDR_W-1:0], pack2x16(sw,    sh));
    axi_lite_write_byteaddr(CSR_CFG_TILE[AXI_ADDR_W-1:0],   pack2x16(tile_c, tile_r));

    // DMA IN (Image)
    axi_lite_write_byteaddr(CSR_DMA_IN_SRC[AXI_ADDR_W-1:0], IMG_BASE);
    axi_lite_write_byteaddr(CSR_DMA_IN_DST[AXI_ADDR_W-1:0], 32'h0);
    axi_lite_write_byteaddr(CSR_DMA_IN_LEN[AXI_ADDR_W-1:0], (in_w*in_h*cin));

    // DMA Weights / Bias / Shift
    axi_lite_write_byteaddr(CSR_DMA_WG_SRC[AXI_ADDR_W-1:0],    (WGT_BASE   + L0_WGT_OFF));
    axi_lite_write_byteaddr(CSR_DMA_WG_DST[AXI_ADDR_W-1:0],    32'h0);
    axi_lite_write_byteaddr(CSR_DMA_WG_LEN[AXI_ADDR_W-1:0],    L0_WGT_BYTES);

    axi_lite_write_byteaddr(CSR_DMA_BIAS_SRC[AXI_ADDR_W-1:0],  (BIAS_BASE  + L0_BIAS_OFF));
    axi_lite_write_byteaddr(CSR_DMA_BIAS_DST[AXI_ADDR_W-1:0],  32'h0);
    axi_lite_write_byteaddr(CSR_DMA_BIAS_LEN[AXI_ADDR_W-1:0],  L0_BIAS_BYTES);

    axi_lite_write_byteaddr(CSR_DMA_SHIFT_SRC[AXI_ADDR_W-1:0], (SHIFT_BASE + L0_SHIFT_OFF));
    axi_lite_write_byteaddr(CSR_DMA_SHIFT_DST[AXI_ADDR_W-1:0], 32'h0);
    axi_lite_write_byteaddr(CSR_DMA_SHIFT_LEN[AXI_ADDR_W-1:0], L0_SHIFT_BYTES);

    // START
    $display("TB: START via CSR_DMA_IN_START pulse");
    start_layer_via_dma_in_start();

    // Prüfen ob CSR_CONTROL überschrieben wurde -> ggf. nochmal setzen
    repeat (3) @(posedge clk);
    axi_lite_read_byteaddr(CSR_CONTROL[AXI_ADDR_W-1:0], rd_tmp);
    $display("TB: CSR_CONTROL after START = 0x%08h", rd_tmp);

    if (FORCE_CTRL_AFTER_START) begin
      axi_lite_write_byteaddr(CSR_CONTROL[AXI_ADDR_W-1:0],
                              pack_control(1'b0, ENABLE_POOL, 1'b0, POOL_MAX_NOT_AVG));
      axi_lite_read_byteaddr (CSR_CONTROL[AXI_ADDR_W-1:0], rd_tmp);
      $display("TB: CSR_CONTROL forced = 0x%08h", rd_tmp);
    end

    // WAIT
    wait_run_done();
    $display("=== SINGLE LAYER CONV+AVGPOOL DONE ===");

    // DUMP: AVG-Pooling Ergebnis (56x56x32) aus write_bank
    dump_ofmap_bin_1d("layer0_avgpool_ofmap_hwc.bin", out_w_pool, out_h_pool, cout, write_bank);

    repeat (50) @(posedge clk);
    $display("=== TB DONE ===");
    $finish;
  end

endmodule
