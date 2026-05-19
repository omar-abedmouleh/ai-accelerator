// packages_of_config_regis.sv
// Zentrale CSR-Map & Hilfs-Typen für SoC + Testbench
//
// WICHTIG (NEU):
//  - Alle CSR-Adressen sind **BYTE-adressiert** (AXI-Lite Byte-Offsets).
//  - 32-bit Register, daher i.d.R. 4-Byte aligned (0x00,0x04,0x08,...)
//  - "Padding"-CFG (PAD) ist wieder hinzugefügt (als CSR_CFG_PAD0 @ 0x7C).
//  - CSR_DMA_WG_GO  -> CSR_DMA_WG_START
//  - CSR_DMA_OUT_GO -> CSR_DMA_OUT_START
//  - CSR_DMA_STATUS ist komplett entfernt.
//  - control_t: Felder start/auto_en entfernt.
//  - Zusätzliche CSR: cfg_out_w/cfg_out_h, total_* und cfg_num_ctx

package packages_of_config_regis;

  // Byte-Adressbreite für CSR-Adressen (mmio_wr_addr / wr_addr / rd_addr)
  localparam int CSR_ADDR_W = 8;

  // Adress-Map (BYTE-ADRESSEN!)

  // CONTROL / CFG (32-bit regs)
  localparam int CSR_CONTROL      = 8'h00;

  localparam int CSR_CFG_IN0      = 8'h04; // [15:0]=in_h,  [31:16]=in_w
  localparam int CSR_CFG_IN1      = 8'h08; // [15:0]=cin,   [31:16]=cout
  localparam int CSR_CFG_K        = 8'h0C; // [15:0]=kh,    [31:16]=kw
  localparam int CSR_CFG_STRIDE   = 8'h10; // [15:0]=sh,    [31:16]=sw
  localparam int CSR_CFG_TILE     = 8'h14; // [15:0]=tile_r,[31:16]=tile_c

  // Derived/Runtime infos (read-only oder von SW gesetzt." je nach Regfile-Implementierung)
  localparam int CSR_CFG_OUT0     = 8'h18; // [15:0]=out_h, [31:16]=out_w
  localparam int CSR_TOTAL_WINS   = 8'h1C; // total_wins (32-bit)
  localparam int CSR_TOTAL_GRPS   = 8'h20; // total_grps (32-bit)
  localparam int CSR_TOTAL_BLKS   = 8'h24; // total_blks (32-bit)
  localparam int CSR_CFG_NUM_CTX  = 8'h28; // num_ctx (32-bit)

  // DMA IN: Host (ROM).' Feature-SRAM
  localparam int CSR_DMA_IN_SRC   = 8'h2C;
  localparam int CSR_DMA_IN_DST   = 8'h30;
  localparam int CSR_DMA_IN_LEN   = 8'h34;
  localparam int CSR_DMA_IN_START = 8'h38;

  // DMA WG: Host (ROM).' Weight-SRAM
  localparam int CSR_DMA_WG_SRC   = 8'h3C;
  localparam int CSR_DMA_WG_DST   = 8'h40;
  localparam int CSR_DMA_WG_LEN   = 8'h44;
  localparam int CSR_DMA_WG_START = 8'h48;

  // DMA OUT: Feature-SRAM.' Host
  localparam int CSR_DMA_OUT_SRC  = 8'h4C;
  localparam int CSR_DMA_OUT_DST  = 8'h50;
  localparam int CSR_DMA_OUT_LEN  = 8'h54;
  localparam int CSR_DMA_OUT_START= 8'h58;

  // DMA BIAS: Host (ROM).' Bias-SRAM
  localparam int CSR_DMA_BIAS_SRC = 8'h5C;
  localparam int CSR_DMA_BIAS_DST = 8'h60;
  localparam int CSR_DMA_BIAS_LEN = 8'h64;

  // DMA SHIFT: Host (ROM).' Shift-SRAM
  localparam int CSR_DMA_SHIFT_SRC = 8'h68;
  localparam int CSR_DMA_SHIFT_DST = 8'h6C;
  localparam int CSR_DMA_SHIFT_LEN = 8'h70;

  // Write-Back & Bank/Status
  // CSR_WB_ENABLE (32-bit @ 0x74):
  //  - bit[0] = wb_enable (1 = enable write-back path)
  //  - bits[31:1] reserved
  localparam int CSR_WB_ENABLE    = 8'h74;

  // CSR_BANK_CTRL (32-bit @ 0x78):
  //  - bit[0] = cfg_read_bank_sel  (0 = bank A, 1 = bank B)
  //  - bit[1] = cfg_write_bank_sel (0 = bank A, 1 = bank B)
  //  - bits[31:2] reserved
  localparam int CSR_BANK_CTRL    = 8'h78;

  // NEW: Padding CFG (32-bit @ 0x7C)  [BYTE-adressiert, 4B aligned]
  //
  // Belegung (4x 8-bit, reicht locker für pad 0..3):
  //   [7:0]   = pad_left
  //   [15:8]  = pad_right
  //   [23:16] = pad_top
  //   [31:24] = pad_bottom
  //
  // Beispiel:
  //  - SAME sym (3x3,s1):  L=1 R=1 T=1 B=1  => 0x01010101
  //  - SAME asym (3x3,s2): L=0 R=1 T=0 B=1 => 0x01000100  (B in [31:24], R in [15:8])
  localparam int CSR_CFG_PAD0     = 8'h7C;
  // NEW: PW needed beats (read-only, derived)
  // [15:0]  = needed_beats_pw (ceil(cin/LANES_MAX), geclamped)
  // [31:16] = 0
  localparam int CSR_PW_NEEDED_BEATS = 8'h80;

  // DMA MULT: Host (ROM).' Output-Multiplier-SRAM
  localparam int CSR_DMA_MULT_SRC = 8'h84;
  localparam int CSR_DMA_MULT_DST = 8'h88;
  localparam int CSR_DMA_MULT_LEN = 8'h8C;

  typedef struct packed {
    logic [7:0] pad_left;
    logic [7:0] pad_right;
    logic [7:0] pad_top;
    logic [7:0] pad_bottom;
  } pad_t;

  // CONTROL Bitfelder (optional)
  // start/auto_en wurden entfernt (wie gewünscht).
  // Belegung ab bit0 sauber neu definiert:
  typedef struct packed {
    logic relu_en;            // bit0
    logic pool_en;            // bit1
    logic dw_en;              // bit2
    logic pool_max_not_avg;   // bit3 (1=Max-Pooling, 0=Average)
    logic pw_en;              // bit4 (Pointwise Enable)
    logic [26:0] rsvd;        // bits 31:5
  } control_t;

endpackage : packages_of_config_regis
