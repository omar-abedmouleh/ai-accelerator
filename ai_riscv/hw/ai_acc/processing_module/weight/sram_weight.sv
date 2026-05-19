// sram_weight.sv  (RAM-inferenz-freundlich, synchroner Reset)
// - Byte-Write in 128-bit Word
// - Byte-Read-Address (aligned) -> liefert 1 Word (BYTES_PER_WORD Bytes)
// - Sync Read (1-cycle latency) + rvalid

`timescale 1ns/1ps

module sram_weight #(
  parameter int READ_ADDR_W    = 16,
  parameter int BYTES_PER_WORD = 16
)(
  input  logic clk,
  input  logic reset,

  // Write (byte-adressiert)
  input  logic [READ_ADDR_W-1:0] waddr,   // byte address
  input  logic                   we,
  input  logic [7:0]             wdata,

  // Read (byte-adressiert, aber aligned)
  // -> liefert ein ganzes Word (BYTES_PER_WORD Bytes)
  input  logic [READ_ADDR_W-1:0] raddr,   // byte address (ALIGN REQUIRED)
  input  logic                   ren,
  output logic [BYTES_PER_WORD*8-1:0] rdata,
  output logic                   rvalid
);

  localparam int WORD_W   = BYTES_PER_WORD*8; // e.g. 128
  localparam int BYTE_LG  = (BYTES_PER_WORD > 1) ? $clog2(BYTES_PER_WORD) : 1;

  localparam int WORD_ADDR_W = READ_ADDR_W - BYTE_LG;
  localparam int WORDS       = (1 << WORD_ADDR_W);

  // Optional: Tool-Hinweis für Block-RAM (je nach Synthese-Tool)
  (* ram_style = "block" *) logic [WORD_W-1:0] mem [0:WORDS-1];

  // Write address split (byte -> word + byte_offset)
  logic [WORD_ADDR_W-1:0] w_word;
  logic [BYTE_LG-1:0]     w_byte;

  always_comb begin
    w_word = waddr[READ_ADDR_W-1:BYTE_LG];
    w_byte = waddr[BYTE_LG-1:0];
  end

  // Read address split (byte -> word)
  // Hinweis: r_byte wird NICHT unterstützt (aligned read)
  logic [WORD_ADDR_W-1:0] r_word;

  always_comb begin
    r_word = raddr[READ_ADDR_W-1:BYTE_LG];
  end

  // Write: synchronous byte update inside a word
  always_ff @(posedge clk) begin
    if (we) begin
      mem[w_word][8*w_byte +: 8] <= wdata;
    end
  end

  // Read: synchronous 1-cycle latency
  // raddr ist byte-adressiert, intern wird aber nur das Word gelesen.
  // Voraussetzung: raddr muss auf BYTES_PER_WORD aligned sein.
  always_ff @(posedge clk) begin
    if (reset) begin
      rvalid <= 1'b0;
      rdata  <= '0;
    end else begin
      rvalid <= ren;
      if (ren) begin
        rdata <= mem[r_word];
      end
    end
  end

endmodule
