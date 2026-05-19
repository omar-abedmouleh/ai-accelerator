`timescale 1ns/1ps
import packages_of_config_regis::*;

module tb_global_single_accel_layer0_128;

  
  // Clock/Reset
  
  logic clk;
  logic reset;
  localparam time CLK_HALF_PERIOD = 0.5ns; // 1 ns period
  localparam real CLK_PERIOD_NS   = 1.0;
  localparam real CLK_FREQ_MHZ    = 1000.0 / CLK_PERIOD_NS;

  initial clk = 1'b0;
  always #(CLK_HALF_PERIOD) clk = ~clk;

  
  // ROM Files (Host)
  
  localparam string IMG_FILE =
    "C:/Users/amora/Desktop/Neuer Ordner (2)/ai_riscv/hw/ai_acc/Modell for Evaluation/Layer Daten/input_image/input_hwc_i8.bin";

  localparam string WGT_ROM_FILE =
     "C:/Users/amora/Desktop/Neuer Ordner (2)/ai_riscv/hw/ai_acc/testbench/rom/rom_weights_all.bin";
  localparam string BIAS_ROM_FILE =
     "C:/Users/amora/Desktop/Neuer Ordner (2)/ai_riscv/hw/ai_acc/testbench/rom/rom_bias_all.bin";
  localparam string SHIFT_ROM_FILE =
     "C:/Users/amora/Desktop/Neuer Ordner (2)/ai_riscv/hw/ai_acc/testbench/rom/rom_shift_all.bin";
  localparam string MULT_ROM_FILE =
     "C:/Users/amora/Desktop/Neuer Ordner (2)/ai_riscv/hw/ai_acc/testbench/rom/rom_mult_all.bin";

  
  // Report/SAIF output directory
  
  localparam string REPORT_DIR =
    "C:/Users/amora/Desktop/Neuer Ordner (2)/ai_riscv/hw/ai_acc/evaluation/bericht";

  localparam string CYCLES_REPORT_FILE =
    "C:/Users/amora/Desktop/Neuer Ordner (2)/ai_riscv/hw/ai_acc/evaluation/bericht/cycles_full_mobilenetv1_128_to_pool.txt";

  localparam string SAIF_FILE =
    "C:/Users/amora/Desktop/Neuer Ordner (2)/ai_riscv/hw/ai_acc/evaluation/bericht/toggle_full_mobilenetv1_128_to_pool.saif";

  
  // SAIF enable
  //  - ModelSim Intel FPGA hat oft KEINE $toggle_* Tasks
  //  - Wenn verfügbar => ENABLE_SAIF=1
  
  localparam bit ENABLE_SAIF = 0;

  
  // Host Memory Layout (AXI ROM)
  
  localparam int M_AXI_ADDR_W = 24;
  localparam int M_AXI_DATA_W = 32;
  localparam int M_AXI_ID_W   = 4;

  localparam int IMG_BASE = 'h0000_1000;
  localparam int WGT_BASE = 'h0008_0000; 
  localparam int BIAS_BASE = 'h0040_0000; 
  localparam int SHIFT_BASE = 'h0048_0000; 
  localparam int MULT_BASE = 'h0050_0000;

  
  // DUT MAX Params
  
  localparam int AXI_ADDR_W   = 12;
  localparam int AXI_DATA_W   = 32;

  localparam int IMG_W_MAX   = 130;
  localparam int IMG_H_MAX   = 130;

  localparam int CH_IN_MAX   = 1024;
  localparam int CO_MAX      = 1024;

  localparam int LANES_MAX   = 4;
  localparam int COLS_MAX    = 4;

  localparam int K_MAX       = 3;
  localparam int STRIDE_MAX  = 2;

  localparam int PXW    = 8;
  localparam int IW_W   = 8;
  localparam int IW_I   = 8;
  localparam int BIAS_W = 32;
  localparam int OUT_W  = 8;

  localparam int ADDR_W_SRAM_I_O        = 25;
  localparam int ADDR_W_SRAM_WEIGHT     = 21;
  localparam int ADDR_W_SRAM_BIAS_SHIFT = 13;

  // PW Beats MAX (ceil(CH_IN_MAX/LANES_MAX) => 1024/4 = 256)
  localparam int BEATS_MAX = (CH_IN_MAX + LANES_MAX - 1) / LANES_MAX;

  
  // MobileNetV1 layers (bis Pooling) = 27 conv/dw/pw
  
  localparam int NUM_LAYERS = 27;

  localparam string DUMP_L27_PREPOOL  = "layer27_pw_ofmap_2x2x1024_hwc_PREPOOL.bin";
  localparam string DUMP_L27_POSTPOOL = "layer27_pw_ofmap_1x1x1024_hwc_POSTPOOL.bin";

  localparam bit DUMP_EACH_LAYER = 1;

  
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

  
  // Cycle Counter
  
  longint unsigned cycle_ctr;
  always_ff @(posedge clk or posedge reset) begin
    if (reset) cycle_ctr <= 0;
    else       cycle_ctr <= cycle_ctr + 1;
  end

  
  // cycles report state
  
  integer fd_cycles;
  longint unsigned layer_cycles_arr [0:NUM_LAYERS-1];
  longint unsigned total_cycles_all;

  
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
    .MULT_BASE  (MULT_BASE),

    .IMG_FILE   (IMG_FILE),
    .WGT_FILE   (WGT_ROM_FILE),
    .BIAS_FILE  (BIAS_ROM_FILE),
    .SHIFT_FILE (SHIFT_ROM_FILE),
    .MULT_FILE  (MULT_ROM_FILE)
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

  
  // AXI-Lite WRITE (BYTE ADDR)
  
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

  // CONTROL: bit0=relu, bit1=pool, bit2=dw, bit3=pool_max, bit4=pw
  function automatic logic [31:0] pack_control_ext;
    input logic relu_en;
    input logic pool_en;
    input logic dw_en;
    input logic pool_max;
    input logic pw_en;
    logic [31:0] c;
    begin
      c = 32'h0;
      c[0] = relu_en;
      c[1] = pool_en;
      c[2] = dw_en;
      c[3] = pool_max;
      c[4] = pw_en;
      pack_control_ext = c;
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

  
  // DUMP OFMAP (HWC) aus Feature-Bank
  
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
    integer bank_idx;
    integer group_idx;
    integer addr_bank;
    integer flat_idx;
    integer DEPTH_PIX;
    integer GROUPS_MAX;
    integer DEPTH_BANK;
    byte    b;
    begin
      DEPTH_PIX  = IMG_W_MAX * IMG_H_MAX;
      GROUPS_MAX = (CO_MAX + LANES_MAX - 1) / LANES_MAX;
      DEPTH_BANK = DEPTH_PIX * GROUPS_MAX;

      fd = $fopen(fname, "wb");
      if (fd == 0) begin
        $display("ERROR: Cannot open %s", fname);
        $finish;
      end

      for (y = 0; y < out_h; y = y + 1) begin
        for (x = 0; x < out_w; x = x + 1) begin
          addr = (y * IMG_W_MAX) + x;

          for (ch = 0; ch < ch_cnt; ch = ch + 1) begin
            bank_idx  = ch % LANES_MAX;
            group_idx = ch / LANES_MAX;
            addr_bank = group_idx*DEPTH_PIX + addr;
            flat_idx  = bank_idx*DEPTH_BANK + addr_bank;

            if (bank_sel == 1'b0)
              b = byte'(dut.u_processing.u_feat_bank_a.mem_bank_flat[flat_idx]);
            else
              b = byte'(dut.u_processing.u_feat_bank_b.mem_bank_flat[flat_idx]);

            $fwrite(fd, "%c", b);
          end
        end
      end

      $fclose(fd);
      $display("Wrote OFMAP (HWC) to %s (bank=%0d, out=%0dx%0d, ch=%0d)",
               fname, bank_sel, out_w, out_h, ch_cnt);
    end
  endtask

  
  // Layer ROM meta (Offsets/Bytes)
  
  task automatic get_rom_meta;
    input  int layer_idx; // 0..26
    output int w_off, b_off, s_off, m_off;
    output int w_bytes, b_bytes, s_bytes, m_bytes;
    begin
      w_off = 0; b_off = 0; s_off = 0; m_off = 0;
      w_bytes = 0; b_bytes = 0; s_bytes = 0; m_bytes = 0;

      unique case (layer_idx)
        0:  begin w_off=0;       b_off=0;     s_off=0;     m_off=0;     w_bytes=864;      b_bytes=128;  s_bytes=128;  m_bytes=128;  end
        1:  begin w_off=864;     b_off=128;   s_off=128;   m_off=128;   w_bytes=288;      b_bytes=128;  s_bytes=128;  m_bytes=128;  end
        2:  begin w_off=1152;    b_off=256;   s_off=256;   m_off=256;   w_bytes=2048;     b_bytes=256;  s_bytes=256;  m_bytes=256;  end
        3:  begin w_off=3200;    b_off=512;   s_off=512;   m_off=512;   w_bytes=576;      b_bytes=256;  s_bytes=256;  m_bytes=256;  end
        4:  begin w_off=3776;    b_off=768;   s_off=768;   m_off=768;   w_bytes=8192;     b_bytes=512;  s_bytes=512;  m_bytes=512;  end
        5:  begin w_off=11968;   b_off=1280;  s_off=1280;  m_off=1280;  w_bytes=1152;     b_bytes=512;  s_bytes=512;  m_bytes=512;  end
        6:  begin w_off=13120;   b_off=1792;  s_off=1792;  m_off=1792;  w_bytes=16384;    b_bytes=512;  s_bytes=512;  m_bytes=512;  end
        7:  begin w_off=29504;   b_off=2304;  s_off=2304;  m_off=2304;  w_bytes=1152;     b_bytes=512;  s_bytes=512;  m_bytes=512;  end
        8:  begin w_off=30656;   b_off=2816;  s_off=2816;  m_off=2816;  w_bytes=32768;    b_bytes=1024; s_bytes=1024; m_bytes=1024; end
        9:  begin w_off=63424;   b_off=3840;  s_off=3840;  m_off=3840;  w_bytes=2304;     b_bytes=1024; s_bytes=1024; m_bytes=1024; end
        10: begin w_off=65728;   b_off=4864;  s_off=4864;  m_off=4864;  w_bytes=65536;    b_bytes=1024; s_bytes=1024; m_bytes=1024; end
        11: begin w_off=131264;  b_off=5888;  s_off=5888;  m_off=5888;  w_bytes=2304;     b_bytes=1024; s_bytes=1024; m_bytes=1024; end
        12: begin w_off=133568;  b_off=6912;  s_off=6912;  m_off=6912;  w_bytes=131072;   b_bytes=2048; s_bytes=2048; m_bytes=2048; end
        13: begin w_off=264640;  b_off=8960;  s_off=8960;  m_off=8960;  w_bytes=4608;     b_bytes=2048; s_bytes=2048; m_bytes=2048; end
        14: begin w_off=269248;  b_off=11008; s_off=11008; m_off=11008; w_bytes=262144;   b_bytes=2048; s_bytes=2048; m_bytes=2048; end
        15: begin w_off=531392;  b_off=13056; s_off=13056; m_off=13056; w_bytes=4608;     b_bytes=2048; s_bytes=2048; m_bytes=2048; end
        16: begin w_off=536000;  b_off=15104; s_off=15104; m_off=15104; w_bytes=262144;   b_bytes=2048; s_bytes=2048; m_bytes=2048; end
        17: begin w_off=798144;  b_off=17152; s_off=17152; m_off=17152; w_bytes=4608;     b_bytes=2048; s_bytes=2048; m_bytes=2048; end
        18: begin w_off=802752;  b_off=19200; s_off=19200; m_off=19200; w_bytes=262144;   b_bytes=2048; s_bytes=2048; m_bytes=2048; end
        19: begin w_off=1064896; b_off=21248; s_off=21248; m_off=21248; w_bytes=4608;     b_bytes=2048; s_bytes=2048; m_bytes=2048; end
        20: begin w_off=1069504; b_off=23296; s_off=23296; m_off=23296; w_bytes=262144;   b_bytes=2048; s_bytes=2048; m_bytes=2048; end
        21: begin w_off=1331648; b_off=25344; s_off=25344; m_off=25344; w_bytes=4608;     b_bytes=2048; s_bytes=2048; m_bytes=2048; end
        22: begin w_off=1336256; b_off=27392; s_off=27392; m_off=27392; w_bytes=262144;   b_bytes=2048; s_bytes=2048; m_bytes=2048; end
        23: begin w_off=1598400; b_off=29440; s_off=29440; m_off=29440; w_bytes=4608;     b_bytes=2048; s_bytes=2048; m_bytes=2048; end
        24: begin w_off=1603008; b_off=31488; s_off=31488; m_off=31488; w_bytes=524288;   b_bytes=4096; s_bytes=4096; m_bytes=4096; end
        25: begin w_off=2127296; b_off=35584; s_off=35584; m_off=35584; w_bytes=9216;     b_bytes=4096; s_bytes=4096; m_bytes=4096; end
        26: begin w_off=2136512; b_off=39680; s_off=39680; m_off=39680; w_bytes=1048576;  b_bytes=4096; s_bytes=4096; m_bytes=4096; end
        default: begin end
      endcase
    end
  endtask

  
  // Layer parameters (MobileNetV1 128) incl padding decisions
  
  task automatic get_layer_params;
    input  int layer_idx; // 0..26
    output int in_w, in_h, cin, cout;
    output int kw, kh, sw, sh;
    output int tile_r, tile_c;
    output int pad_l, pad_r, pad_t, pad_b;
    output logic dw_en, pw_en;
    begin
      in_w=0; in_h=0; cin=0; cout=0;
      kw=1; kh=1; sw=1; sh=1;
      tile_r=4; tile_c=4;
      pad_l=0; pad_r=0; pad_t=0; pad_b=0;
      dw_en=1'b0; pw_en=1'b0;

      unique case (layer_idx)
        0:  begin in_w=128; in_h=128; cin=3;    cout=32;   kw=3; kh=3; sw=2; sh=2; pad_l=0; pad_r=1; pad_t=0; pad_b=1; dw_en=0; pw_en=0; tile_r=4; tile_c=4; end
        1:  begin in_w=64;  in_h=64;  cin=32;   cout=32;   kw=3; kh=3; sw=1; sh=1; pad_l=1; pad_r=1; pad_t=1; pad_b=1; dw_en=1; pw_en=0; tile_r=4; tile_c=4; end
        2:  begin in_w=64;  in_h=64;  cin=32;   cout=64;   kw=1; kh=1; sw=1; sh=1; pad_l=0; pad_r=0; pad_t=0; pad_b=0; dw_en=0; pw_en=1; tile_r=1; tile_c=4; end
        3:  begin in_w=64;  in_h=64;  cin=64;   cout=64;   kw=3; kh=3; sw=2; sh=2; pad_l=0; pad_r=1; pad_t=0; pad_b=1; dw_en=1; pw_en=0; tile_r=4; tile_c=4; end
        4:  begin in_w=32;  in_h=32;  cin=64;   cout=128;  kw=1; kh=1; sw=1; sh=1; pad_l=0; pad_r=0; pad_t=0; pad_b=0; dw_en=0; pw_en=1; tile_r=1; tile_c=4; end
        5:  begin in_w=32;  in_h=32;  cin=128;  cout=128;  kw=3; kh=3; sw=1; sh=1; pad_l=1; pad_r=1; pad_t=1; pad_b=1; dw_en=1; pw_en=0; tile_r=4; tile_c=4; end
        6:  begin in_w=32;  in_h=32;  cin=128;  cout=128;  kw=1; kh=1; sw=1; sh=1; pad_l=0; pad_r=0; pad_t=0; pad_b=0; dw_en=0; pw_en=1; tile_r=1; tile_c=4; end
        7:  begin in_w=32;  in_h=32;  cin=128;  cout=128;  kw=3; kh=3; sw=2; sh=2; pad_l=0; pad_r=1; pad_t=0; pad_b=1; dw_en=1; pw_en=0; tile_r=4; tile_c=4; end
        8:  begin in_w=16;  in_h=16;  cin=128;  cout=256;  kw=1; kh=1; sw=1; sh=1; pad_l=0; pad_r=0; pad_t=0; pad_b=0; dw_en=0; pw_en=1; tile_r=1; tile_c=4; end
        9:  begin in_w=16;  in_h=16;  cin=256;  cout=256;  kw=3; kh=3; sw=1; sh=1; pad_l=1; pad_r=1; pad_t=1; pad_b=1; dw_en=1; pw_en=0; tile_r=4; tile_c=4; end
        10: begin in_w=16;  in_h=16;  cin=256;  cout=256;  kw=1; kh=1; sw=1; sh=1; pad_l=0; pad_r=0; pad_t=0; pad_b=0; dw_en=0; pw_en=1; tile_r=1; tile_c=4; end
        11: begin in_w=16;  in_h=16;  cin=256;  cout=256;  kw=3; kh=3; sw=2; sh=2; pad_l=0; pad_r=1; pad_t=0; pad_b=1; dw_en=1; pw_en=0; tile_r=4; tile_c=4; end
        12: begin in_w=8;   in_h=8;   cin=256;  cout=512;  kw=1; kh=1; sw=1; sh=1; pad_l=0; pad_r=0; pad_t=0; pad_b=0; dw_en=0; pw_en=1; tile_r=1; tile_c=4; end
        13: begin in_w=8;   in_h=8;   cin=512;  cout=512;  kw=3; kh=3; sw=1; sh=1; pad_l=1; pad_r=1; pad_t=1; pad_b=1; dw_en=1; pw_en=0; tile_r=4; tile_c=4; end
        14: begin in_w=8;   in_h=8;   cin=512;  cout=512;  kw=1; kh=1; sw=1; sh=1; pad_l=0; pad_r=0; pad_t=0; pad_b=0; dw_en=0; pw_en=1; tile_r=1; tile_c=4; end
        15: begin in_w=8;   in_h=8;   cin=512;  cout=512;  kw=3; kh=3; sw=1; sh=1; pad_l=1; pad_r=1; pad_t=1; pad_b=1; dw_en=1; pw_en=0; tile_r=4; tile_c=4; end
        16: begin in_w=8;   in_h=8;   cin=512;  cout=512;  kw=1; kh=1; sw=1; sh=1; pad_l=0; pad_r=0; pad_t=0; pad_b=0; dw_en=0; pw_en=1; tile_r=1; tile_c=4; end
        17: begin in_w=8;   in_h=8;   cin=512;  cout=512;  kw=3; kh=3; sw=1; sh=1; pad_l=1; pad_r=1; pad_t=1; pad_b=1; dw_en=1; pw_en=0; tile_r=4; tile_c=4; end
        18: begin in_w=8;   in_h=8;   cin=512;  cout=512;  kw=1; kh=1; sw=1; sh=1; pad_l=0; pad_r=0; pad_t=0; pad_b=0; dw_en=0; pw_en=1; tile_r=1; tile_c=4; end
        19: begin in_w=8;   in_h=8;   cin=512;  cout=512;  kw=3; kh=3; sw=1; sh=1; pad_l=1; pad_r=1; pad_t=1; pad_b=1; dw_en=1; pw_en=0; tile_r=4; tile_c=4; end
        20: begin in_w=8;   in_h=8;   cin=512;  cout=512;  kw=1; kh=1; sw=1; sh=1; pad_l=0; pad_r=0; pad_t=0; pad_b=0; dw_en=0; pw_en=1; tile_r=1; tile_c=4; end
        21: begin in_w=8;   in_h=8;   cin=512;  cout=512;  kw=3; kh=3; sw=1; sh=1; pad_l=1; pad_r=1; pad_t=1; pad_b=1; dw_en=1; pw_en=0; tile_r=4; tile_c=4; end
        22: begin in_w=8;   in_h=8;   cin=512;  cout=512;  kw=1; kh=1; sw=1; sh=1; pad_l=0; pad_r=0; pad_t=0; pad_b=0; dw_en=0; pw_en=1; tile_r=1; tile_c=4; end
        23: begin in_w=8;   in_h=8;   cin=512;  cout=512;  kw=3; kh=3; sw=2; sh=2; pad_l=0; pad_r=1; pad_t=0; pad_b=1; dw_en=1; pw_en=0; tile_r=4; tile_c=4; end
        24: begin in_w=4;   in_h=4;   cin=512;  cout=1024; kw=1; kh=1; sw=1; sh=1; pad_l=0; pad_r=0; pad_t=0; pad_b=0; dw_en=0; pw_en=1; tile_r=1; tile_c=4; end
        25: begin in_w=4;   in_h=4;   cin=1024; cout=1024; kw=3; kh=3; sw=2; sh=2; pad_l=0; pad_r=1; pad_t=0; pad_b=1; dw_en=1; pw_en=0; tile_r=4; tile_c=4; end
        26: begin in_w=2;   in_h=2;   cin=1024; cout=1024; kw=1; kh=1; sw=1; sh=1; pad_l=0; pad_r=0; pad_t=0; pad_b=0; dw_en=0; pw_en=1; tile_r=1; tile_c=4; end
        default: begin end
      endcase
    end
  endtask

  
  // Pretty-print per layer configuration
  
  task automatic print_layer_cfg;
    input int layer_idx;
    input logic read_bank;
    input logic write_bank;
    input int in_w, in_h, cin, cout;
    input int kw, kh, sw, sh;
    input int tile_r, tile_c;
    input int pad_l, pad_r, pad_t, pad_b;
    input int out_w, out_h;
    input int total_wins, total_grps, total_blks, num_ctx;
    input logic dw_en, pw_en;
    input logic pool_en;
    input int pw_beats_need;
    input int wgt_off, bias_off, shift_off, mult_off;
    input int wgt_bytes, bias_bytes, shift_bytes, mult_bytes;
    begin
      $display("------------------------------------------------------------");
      $display("LAYER %0d CONFIG:", layer_idx+1);
      $display("  banks     : read=%0d write=%0d", read_bank, write_bank);
      $display("  mode      : dw=%0d pw=%0d pool=%0d", dw_en, pw_en, pool_en);
      $display("  IN        : %0dx%0d  cin=%0d  cout=%0d", in_w, in_h, cin, cout);
      $display("  K/STRIDE  : K=%0dx%0d  S=%0dx%0d", kw, kh, sw, sh);
      $display("  PAD LRTB  : %0d/%0d/%0d/%0d", pad_l, pad_r, pad_t, pad_b);
      $display("  TILE c/r  : tile_c=%0d tile_r=%0d", tile_c, tile_r);
      $display("  OUT       : %0dx%0d", out_w, out_h);
      $display("  totals    : wins=%0d  grps=%0d  blks=%0d  num_ctx=%0d",
               total_wins, total_grps, total_blks, num_ctx);
      $display("  pw_beats  : needed=%0d (LANES_MAX=%0d, BEATS_MAX=%0d)",
               pw_beats_need, LANES_MAX, BEATS_MAX);
      $display("  ROM offs  : w=%0d b=%0d s=%0d m=%0d", wgt_off, bias_off, shift_off, mult_off);
      $display("  ROM bytes : w=%0d b=%0d s=%0d m=%0d", wgt_bytes, bias_bytes, shift_bytes, mult_bytes);
      $display("------------------------------------------------------------");
    end
  endtask

  
  // MAIN
  
  int layer;

  logic read_bank;
  logic write_bank;

  int in_w, in_h, cin, cout;
  int kw, kh, sw, sh;
  int tile_r, tile_c;
  int pad_l, pad_r, pad_t, pad_b;

  int out_w, out_h;
  int total_wins, total_grps, total_blks, num_ctx;

  int wgt_bytes, bias_bytes, shift_bytes, mult_bytes;
  int wgt_off,  bias_off,  shift_off,  mult_off;

  logic dw_en;
  logic pw_en;

  int pw_beats_need;

  longint unsigned layer_cycle_start;
  longint unsigned layer_cycles;

  logic pool_en;
  logic pool_max; // 0=avg, 1=max

  initial begin
    // Defaults
    S_AWADDR  = '0; S_AWPROT = '0; S_AWVALID = 1'b0;
    S_WDATA   = '0; S_WSTRB  = '0; S_WVALID  = 1'b0;
    S_BREADY  = 1'b0;
    S_ARADDR  = '0; S_ARPROT = '0; S_ARVALID = 1'b0;
    S_RREADY  = 1'b0;

    total_cycles_all = 0;

    // Reset
    reset = 1'b1;
    repeat (20) @(posedge clk);
    reset = 1'b0;
    repeat (10) @(posedge clk);

    // Open cycles report
    fd_cycles = $fopen(CYCLES_REPORT_FILE, "w");
    if (fd_cycles == 0) begin
      $display("ERROR: Cannot open cycles report: %s", CYCLES_REPORT_FILE);
      $finish;
    end
    $fwrite(fd_cycles, "Full MobileNetV1 128 until GlobalAvgPool\n");
    $fwrite(fd_cycles, "Clock: period_ns=%0.3f freq_mhz=%0.3f\n", CLK_PERIOD_NS, CLK_FREQ_MHZ);
    $fwrite(fd_cycles, "ROM:\n");
    $fwrite(fd_cycles, "  IMG   %s\n", IMG_FILE);
    $fwrite(fd_cycles, "  WGT   %s\n", WGT_ROM_FILE);
    $fwrite(fd_cycles, "  BIAS  %s\n", BIAS_ROM_FILE);
    $fwrite(fd_cycles, "  SHIFT %s\n", SHIFT_ROM_FILE);
    $fwrite(fd_cycles, "  MULT  %s\n", MULT_ROM_FILE);
    $fwrite(fd_cycles, "\nLayer,InWxH,Cin,Cout,K,Stride,Pad(LRTB),dw,pw,pool,OutWxH,Cycles\n");

    // SAIF toggle collection (optional)
    if (ENABLE_SAIF) begin
      // Wenn Simulator es kann, funktioniert das.
      // Wenn nicht, dann ENABLE_SAIF=0 lassen.
      $settoggle(0, dut);
      $toggle_start;
    end

    $display("============================================================");
    $display("TB: FULL MobileNetV1 (128x128) until GlobalAvgPool");
    $display("TB: clk = %0.3f ns (%0.3f MHz)", CLK_PERIOD_NS, CLK_FREQ_MHZ);
    $display("REPORT DIR: %s", REPORT_DIR);
    $display("SAIF FILE : %s", SAIF_FILE);
    $display("CYCLES TXT: %s", CYCLES_REPORT_FILE);
    $display("SAIF enabled? %0d", ENABLE_SAIF);
    $display("============================================================");

    for (layer = 0; layer < NUM_LAYERS; layer = layer + 1) begin
      string fname_layer;

      // Ping-Pong: read = layer[0], write = ~layer[0]
      read_bank  = layer[0];
      write_bank = ~layer[0];

      // Params
      get_layer_params(layer, in_w, in_h, cin, cout,
                       kw, kh, sw, sh,
                       tile_r, tile_c,
                       pad_l, pad_r, pad_t, pad_b,
                       dw_en, pw_en);

      // ROM meta
      get_rom_meta(layer, wgt_off, bias_off, shift_off, mult_off,
                   wgt_bytes, bias_bytes, shift_bytes, mult_bytes);

      // Pooling: only last layer
      pool_en  = (layer == (NUM_LAYERS-1));
      pool_max = 1'b0; // avg pool

      // Derived dims
      out_w = ((in_w + pad_l + pad_r - kw) / sw) + 1;
      out_h = ((in_h + pad_t + pad_b - kh) / sh) + 1;
      total_wins = out_w * out_h;

      if (!dw_en && !pw_en) begin
        total_blks = ceil_div(cout, tile_c);
        total_grps = ceil_div(total_wins, tile_r);
        num_ctx    = kw * kh * cin;
      end else if (dw_en) begin
        total_grps = total_wins;
        total_blks = ceil_div(cin, tile_r);
        num_ctx    = kw * kh;
      end else begin
        total_grps = total_wins;
        total_blks = ceil_div(cout, tile_c);
        num_ctx    = cin;
      end

      // PW beats
      if (pw_en) begin
        pw_beats_need = ceil_div(cin, LANES_MAX);
        if (pw_beats_need < 1) pw_beats_need = 1;
        if (pw_beats_need > BEATS_MAX) pw_beats_need = BEATS_MAX;
      end else begin
        pw_beats_need = 1;
      end

      // =======================
      // PRINT CONFIG PER LAYER
      // =======================
      print_layer_cfg(layer, read_bank, write_bank,
                      in_w, in_h, cin, cout,
                      kw, kh, sw, sh,
                      tile_r, tile_c,
                      pad_l, pad_r, pad_t, pad_b,
                      out_w, out_h,
                      total_wins, total_grps, total_blks, num_ctx,
                      dw_en, pw_en, pool_en,
                      pw_beats_need,
                      wgt_off, bias_off, shift_off, mult_off,
                      wgt_bytes, bias_bytes, shift_bytes, mult_bytes);

      // ----------------------------------------------------------
      // CSR writes
      // ----------------------------------------------------------
      axi_lite_write_byteaddr(CSR_BANK_CTRL[AXI_ADDR_W-1:0], {30'h0, write_bank, read_bank});
      axi_lite_write_byteaddr(CSR_CONTROL[AXI_ADDR_W-1:0],
                              pack_control_ext(1'b0, pool_en, dw_en, pool_max, pw_en));
      axi_lite_write_byteaddr(CSR_CFG_PAD0[AXI_ADDR_W-1:0],
                              {pad_b[7:0], pad_t[7:0], pad_r[7:0], pad_l[7:0]});
      axi_lite_write_byteaddr(CSR_CFG_OUT0[AXI_ADDR_W-1:0],    pack2x16(out_w, out_h));
      axi_lite_write_byteaddr(CSR_TOTAL_WINS[AXI_ADDR_W-1:0],  total_wins);
      axi_lite_write_byteaddr(CSR_TOTAL_GRPS[AXI_ADDR_W-1:0],  total_grps);
      axi_lite_write_byteaddr(CSR_TOTAL_BLKS[AXI_ADDR_W-1:0],  total_blks);
      axi_lite_write_byteaddr(CSR_CFG_NUM_CTX[AXI_ADDR_W-1:0], num_ctx);

      axi_lite_write_byteaddr(CSR_CFG_IN0[AXI_ADDR_W-1:0],    pack2x16(in_w,  in_h));
      axi_lite_write_byteaddr(CSR_CFG_IN1[AXI_ADDR_W-1:0],    pack2x16(cout,  cin));
      axi_lite_write_byteaddr(CSR_CFG_K[AXI_ADDR_W-1:0],      pack2x16(kw,    kh));
      axi_lite_write_byteaddr(CSR_CFG_STRIDE[AXI_ADDR_W-1:0], pack2x16(sw,    sh));
      axi_lite_write_byteaddr(CSR_CFG_TILE[AXI_ADDR_W-1:0],   pack2x16(tile_c, tile_r));
      axi_lite_write_byteaddr(CSR_PW_NEEDED_BEATS[AXI_ADDR_W-1:0], pw_beats_need);

      // ----------------------------------------------------------
      // DMA: Input only in first layer
      // ----------------------------------------------------------
      if (layer == 0) begin
        axi_lite_write_byteaddr(CSR_DMA_IN_SRC[AXI_ADDR_W-1:0], IMG_BASE);
        axi_lite_write_byteaddr(CSR_DMA_IN_DST[AXI_ADDR_W-1:0], 32'h0);
        axi_lite_write_byteaddr(CSR_DMA_IN_LEN[AXI_ADDR_W-1:0], (in_w*in_h*cin));
      end else begin
        axi_lite_write_byteaddr(CSR_DMA_IN_SRC[AXI_ADDR_W-1:0], 32'h0);
        axi_lite_write_byteaddr(CSR_DMA_IN_DST[AXI_ADDR_W-1:0], 32'h0);
        axi_lite_write_byteaddr(CSR_DMA_IN_LEN[AXI_ADDR_W-1:0], 32'h0);
      end

      // Weights/Bias/Shift/Mult
      axi_lite_write_byteaddr(CSR_DMA_WG_SRC[AXI_ADDR_W-1:0],    (WGT_BASE   + wgt_off));
      axi_lite_write_byteaddr(CSR_DMA_WG_DST[AXI_ADDR_W-1:0],    32'h0);
      axi_lite_write_byteaddr(CSR_DMA_WG_LEN[AXI_ADDR_W-1:0],    wgt_bytes);

      axi_lite_write_byteaddr(CSR_DMA_BIAS_SRC[AXI_ADDR_W-1:0],  (BIAS_BASE  + bias_off));
      axi_lite_write_byteaddr(CSR_DMA_BIAS_DST[AXI_ADDR_W-1:0],  32'h0);
      axi_lite_write_byteaddr(CSR_DMA_BIAS_LEN[AXI_ADDR_W-1:0],  bias_bytes);

      axi_lite_write_byteaddr(CSR_DMA_SHIFT_SRC[AXI_ADDR_W-1:0], (SHIFT_BASE + shift_off));
      axi_lite_write_byteaddr(CSR_DMA_SHIFT_DST[AXI_ADDR_W-1:0], 32'h0);
      axi_lite_write_byteaddr(CSR_DMA_SHIFT_LEN[AXI_ADDR_W-1:0], shift_bytes);

      axi_lite_write_byteaddr(CSR_DMA_MULT_SRC[AXI_ADDR_W-1:0],  (MULT_BASE  + mult_off));
      axi_lite_write_byteaddr(CSR_DMA_MULT_DST[AXI_ADDR_W-1:0],  32'h0);
      axi_lite_write_byteaddr(CSR_DMA_MULT_LEN[AXI_ADDR_W-1:0],  mult_bytes);

      // ----------------------------------------------------------
      // start + wait + cycle measure
      // ----------------------------------------------------------
      layer_cycle_start = cycle_ctr;
      start_layer_via_dma_in_start();
      wait_run_done();
      layer_cycles = cycle_ctr - layer_cycle_start;

      layer_cycles_arr[layer] = layer_cycles;
      total_cycles_all = total_cycles_all + layer_cycles;

      $display("TB: LAYER %0d DONE | cycles=%0d", layer+1, layer_cycles);

      // report line
      $fwrite(fd_cycles,
              "%0d,%0dx%0d,%0d,%0d,%0dx%0d,%0dx%0d,%0d/%0d/%0d/%0d,%0d,%0d,%0d,%0dx%0d,%0d\n",
              layer+1,
              in_w, in_h,
              cin, cout,
              kw, kh,
              sw, sh,
              pad_l, pad_r, pad_t, pad_b,
              dw_en, pw_en, pool_en,
              out_w, out_h,
              layer_cycles);

      // Dump each layer
      if (DUMP_EACH_LAYER) begin
        fname_layer = $sformatf("%s/layer_%0d_ofmap_%0dx%0dx%0d_hwc.bin",
                                REPORT_DIR, layer+1, out_w, out_h, cout);
        dump_ofmap_bin_1d(fname_layer, out_w, out_h, cout, write_bank);
      end

      // Pooling dumps on last layer
      if (layer == (NUM_LAYERS-1)) begin
        string f_pre;
        string f_post;
        f_pre  = $sformatf("%s/%s", REPORT_DIR, DUMP_L27_PREPOOL);
        f_post = $sformatf("%s/%s", REPORT_DIR, DUMP_L27_POSTPOOL);
        dump_ofmap_bin_1d(f_pre,  out_w, out_h, cout, write_bank);
        dump_ofmap_bin_1d(f_post, 1, 1, cout, write_bank);
      end

      repeat (50) @(posedge clk);
    end

    // stop SAIF and write file - optional
    if (ENABLE_SAIF) begin
      $toggle_stop;
      $toggle_report(SAIF_FILE, 1.0e-9, dut);
    end

    // finalize cycles report
    $fwrite(fd_cycles, "\nTOTAL_CYCLES_SUM,%0d\n", total_cycles_all);
    $fwrite(fd_cycles, "TOTAL_CYCLES_COUNTER,%0d\n", cycle_ctr);
    $fwrite(fd_cycles, "NOTE: TOTAL_CYCLES_SUM is sum of per-layer deltas.\n");
    $fwrite(fd_cycles, "      TOTAL_CYCLES_COUNTER is global counter since reset deassert.\n");
    $fclose(fd_cycles);

    $display("============================================================");
    $display("TB SUMMARY:");
    $display("  Total cycles (counter)    = %0d", cycle_ctr);
    $display("  Total cycles (sum layers) = %0d", total_cycles_all);
    $display("  Clock period              = %0.3f ns", CLK_PERIOD_NS);
    $display("  Clock frequency           = %0.3f MHz", CLK_FREQ_MHZ);
    $display("  SAIF: %s", SAIF_FILE);
    $display("  TXT : %s", CYCLES_REPORT_FILE);
    $display("  SAIF enabled? %0d", ENABLE_SAIF);
    $display("============================================================");

    $display("=== ALL DONE ===");
    $finish;
  end

endmodule
