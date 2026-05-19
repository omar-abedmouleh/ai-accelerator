// sram_weight.sv  (RAM-inferenz-freundlich, synchroner Reset)
// - Byte-Write in 128-bit Word
// - Byte-Read-Address (aligned) -> liefert 1 Word (BYTES_PER_WORD Bytes)
// - Sync Read (1-cycle latency) + rvalid

`timescale 1ns/1ps

`ifdef SYNTHESIS
(* synopsys_black_box *)
module sram_weight #(
  parameter int READ_ADDR_W    = 16,
  parameter int BYTES_PER_WORD = 16
)(
  input  logic clk,
  input  logic reset,

  input  logic [READ_ADDR_W-1:0] waddr,
  input  logic                   we,
  input  logic [7:0]             wdata,

  input  logic [READ_ADDR_W-1:0] raddr,
  input  logic                   ren,
  output logic [BYTES_PER_WORD*8-1:0] rdata,
  output logic                   rvalid
);
endmodule
`else
module sram_weight #(
  parameter int READ_ADDR_W    = 16,
  parameter int BYTES_PER_WORD = 16
)(
  input  logic clk,
  input  logic reset,

  // ----------------------------
  // Write (byte-adressiert)
  // ----------------------------
  input  logic [READ_ADDR_W-1:0] waddr,   // byte address
  input  logic                   we,
  input  logic [7:0]             wdata,

  // ----------------------------
  // Read (byte-adressiert, aber aligned)
  // -> liefert ein ganzes Word (BYTES_PER_WORD Bytes)
  // ----------------------------
  input  logic [READ_ADDR_W-1:0] raddr,   // byte address (ALIGN REQUIRED)
  input  logic                   ren,
  output logic [BYTES_PER_WORD*8-1:0] rdata,
  output logic                   rvalid
);

  localparam int WORD_W   = BYTES_PER_WORD*8; // e.g. 128
  localparam int BYTE_LG  = (BYTES_PER_WORD > 1) ? $clog2(BYTES_PER_WORD) : 1;

  localparam int WORD_ADDR_W = READ_ADDR_W - BYTE_LG;

  // ----------------------------
  // Write address split (byte -> word + byte_offset)
  // ----------------------------
  logic [WORD_ADDR_W-1:0] w_word;
  logic [BYTE_LG-1:0]     w_byte;

  always_comb begin
    w_word = waddr[READ_ADDR_W-1:BYTE_LG];
    w_byte = waddr[BYTE_LG-1:0];
  end

  // ----------------------------
  // Read address split (byte -> word)
  // Hinweis: r_byte wird NICHT unterstützt (aligned read)
  // ----------------------------
  logic [WORD_ADDR_W-1:0] r_word;

  always_comb begin
    r_word = raddr[READ_ADDR_W-1:BYTE_LG];
  end

  // Under the hood we use the generic 1R1W wide RAM with byte-write.
  // In synthesis this RAM is black-boxed (no SRAM macros in ASAP7 flow).
  ram_1r1w_sync_bytewrite_wide #(
    .AW             (WORD_ADDR_W),
    .BYTES_PER_WORD (BYTES_PER_WORD)
  ) u_weight_ram (
    .clk       (clk),
    .reset     (reset),
    .we        (we),
    .waddr     (w_word),
    .wbyte_sel (w_byte),
    .wbyte     (wdata),
    .ren       (ren),
    .raddr     (r_word),
    .rdata     (rdata),
    .rvalid    (rvalid)
  );

endmodule
`endif
