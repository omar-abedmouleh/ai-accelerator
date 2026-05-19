// Bias/Shift SRAM (WIDE): 1 RAM for bias + 1 RAM for shift
// - Write: byte-addressed stream (waddr_*), wie bisher
// - Read : bs_raddr = blk_idx -> liefert 1 Block mit COLS 32-bit Werten (1-cycle)
//          davon werden nur cfg_tile_c Werte "aktiv" ausgegeben, Rest = 0
module sram_bias_shift #(
  parameter int BS_ADDR_W  = 16,
  parameter int COLS       = 16,   // physische Breite (z.B. COLS_MAX)// cfg_tile_c
  parameter int CO         = 32,   // Gesamtanzahl Output-Kanäle (cfg_cout max)
  parameter int BIAS_W     = 32,
  parameter int SHIFT_W    = 32,
  parameter int MULT_W     = 32
)(
  input  logic                         clk,
  input  logic                         reset,

  // runtime: wie viele Spalten wirklich genutzt werden (tile_c <= COLS)
  input  logic [15:0]                  cfg_tile_c,

  // byte-addressed write streams
  input  logic                         we_bias,
  input  logic [BS_ADDR_W-1:0]         waddr_bias,
  input  logic [7:0]                   wdata_bias,

  input  logic                         we_shift,
  input  logic [BS_ADDR_W-1:0]         waddr_shift,
  input  logic [7:0]                   wdata_shift,

  input  logic                         we_mult,
  input  logic [BS_ADDR_W-1:0]         waddr_mult,
  input  logic [7:0]                   wdata_mult,

  // wide read: blk_idx
  input  logic                         bs_ren,
  input  logic [BS_ADDR_W-1:0]         bs_raddr,     // blk_idx
  output logic signed [BIAS_W-1:0]     bs_bias_cols  [0:COLS-1],
  output logic        [SHIFT_W-1:0]    bs_shift_cols [0:COLS-1],
  output logic signed [MULT_W-1:0]     bs_mult_cols  [0:COLS-1],
  output logic                         bs_rvalid
);

  localparam int COLS_LG        = (COLS > 1) ? $clog2(COLS) : 1;
  localparam int BLKS           = (CO + COLS - 1) / COLS; // ceil(CO/COLS)
  localparam int BYTES_PER_WORD = COLS * 4;               // 4 bytes pro 32-bit

  // depth = BLKS -> wähle AW so dass 2^AW >= BLKS
  localparam int AW = (BLKS > 1) ? $clog2(BLKS) : 1;

  // write decode (bias)
  logic [BS_ADDR_W-1:0] filter_idx_b;
  logic [COLS_LG-1:0]   col_b;
  logic [BS_ADDR_W-1:0] blk_b;
  logic [$clog2(BYTES_PER_WORD)-1:0] wbyte_sel_b;

  // write decode (shift)
  logic [BS_ADDR_W-1:0] filter_idx_s;
  logic [COLS_LG-1:0]   col_s;
  logic [BS_ADDR_W-1:0] blk_s;
  logic [$clog2(BYTES_PER_WORD)-1:0] wbyte_sel_s;

  // write decode (mult)
  logic [BS_ADDR_W-1:0] filter_idx_m;
  logic [COLS_LG-1:0]   col_m;
  logic [BS_ADDR_W-1:0] blk_m;
  logic [$clog2(BYTES_PER_WORD)-1:0] wbyte_sel_m;

  // tile_c clamp (<= COLS)
  logic [15:0] tile_c_use;

  integer c;

  always_comb begin
    // clamp tile_c
    tile_c_use = (cfg_tile_c == 16'd0) ? 16'd1 : cfg_tile_c;
    if (tile_c_use > COLS[15:0]) tile_c_use = COLS[15:0];

    // bias decode: waddr_bias ist BYTE-Adresse eines int32-Streams
    filter_idx_b = (waddr_bias >> 2);         // 0..CO-1 (32-bit index)
    col_b        = filter_idx_b[COLS_LG-1:0]; // % COLS
    blk_b        = (filter_idx_b >> COLS_LG); // / COLS
    wbyte_sel_b  = {col_b, waddr_bias[1:0]};  // col*4 + byte_in_word

    // shift decode
    filter_idx_s = (waddr_shift >> 2);
    col_s        = filter_idx_s[COLS_LG-1:0];
    blk_s        = (filter_idx_s >> COLS_LG);
    wbyte_sel_s  = {col_s, waddr_shift[1:0]};

    // mult decode
    filter_idx_m = (waddr_mult >> 2);
    col_m        = filter_idx_m[COLS_LG-1:0];
    blk_m        = (filter_idx_m >> COLS_LG);
    wbyte_sel_m  = {col_m, waddr_mult[1:0]};
  end

  // Wide read buses
  logic [BYTES_PER_WORD*8-1:0] bias_rdata_wide;
  logic [BYTES_PER_WORD*8-1:0] shift_rdata_wide;
  logic [BYTES_PER_WORD*8-1:0] mult_rdata_wide;
  logic                        bias_rvalid;
  logic                        shift_rvalid;
  logic                        mult_rvalid;

  // genau 1 Bias-RAM
  ram_1r1w_sync_bytewrite_wide #(
    .AW             (AW),
    .BYTES_PER_WORD (BYTES_PER_WORD)
  ) u_bias_wide (
    .clk       (clk),
    .reset     (reset),

    .we        (we_bias && (filter_idx_b < CO) && (blk_b < BLKS)),
    .waddr     (blk_b[AW-1:0]),
    .wbyte_sel (wbyte_sel_b),
    .wbyte     (wdata_bias),

    .ren       (bs_ren),
    .raddr     (bs_raddr[AW-1:0]),
    .rdata     (bias_rdata_wide),
    .rvalid    (bias_rvalid)
  );

  // genau 1 Shift-RAM
  ram_1r1w_sync_bytewrite_wide #(
    .AW             (AW),
    .BYTES_PER_WORD (BYTES_PER_WORD)
  ) u_shift_wide (
    .clk       (clk),
    .reset     (reset),

    .we        (we_shift && (filter_idx_s < CO) && (blk_s < BLKS)),
    .waddr     (blk_s[AW-1:0]),
    .wbyte_sel (wbyte_sel_s),
    .wbyte     (wdata_shift),

    .ren       (bs_ren),
    .raddr     (bs_raddr[AW-1:0]),
    .rdata     (shift_rdata_wide),
    .rvalid    (shift_rvalid)
  );

  // genau 1 Mult-RAM
  ram_1r1w_sync_bytewrite_wide #(
    .AW             (AW),
    .BYTES_PER_WORD (BYTES_PER_WORD)
  ) u_mult_wide (
    .clk       (clk),
    .reset     (reset),

    .we        (we_mult && (filter_idx_m < CO) && (blk_m < BLKS)),
    .waddr     (blk_m[AW-1:0]),
    .wbyte_sel (wbyte_sel_m),
    .wbyte     (wdata_mult),

    .ren       (bs_ren),
    .raddr     (bs_raddr[AW-1:0]),
    .rdata     (mult_rdata_wide),
    .rvalid    (mult_rvalid)
  );

  // Output unpack + tile_c mask (1-cycle after bs_ren)
  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      bs_rvalid <= 1'b0;
      for (c = 0; c < COLS; c = c + 1) begin
        bs_bias_cols[c]  <= '0;
        bs_shift_cols[c] <= '0;
        bs_mult_cols[c]  <= '0;
      end
    end else begin
      bs_rvalid <= bias_rvalid; // bias/shift/mult laufen synchron
      if (bias_rvalid) begin
        for (c = 0; c < COLS; c = c + 1) begin
          if (c < tile_c_use) begin
            bs_bias_cols[c]  <= $signed(bias_rdata_wide [32*c +: 32]);
            bs_shift_cols[c] <=        shift_rdata_wide[32*c +: 32];
            bs_mult_cols[c]  <= $signed(mult_rdata_wide [32*c +: 32]);
          end else begin
            bs_bias_cols[c]  <= '0;
            bs_shift_cols[c] <= '0;
            bs_mult_cols[c]  <= '0;
          end
        end
      end
    end
  end

endmodule
