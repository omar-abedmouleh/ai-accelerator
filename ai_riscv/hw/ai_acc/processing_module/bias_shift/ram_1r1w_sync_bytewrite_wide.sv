// 1R1W Sync Wide RAM with BYTE-WRITE
// - one read port (sync, 1-cycle latency)
// - one write port (sync), byte-granular within a wide word
module ram_1r1w_sync_bytewrite_wide #(
  parameter int AW             = 8,
  parameter int BYTES_PER_WORD = 64
)(
  input  logic                         clk,
  input  logic                         reset,

  input  logic                         we,
  input  logic [AW-1:0]                waddr,
  input  logic [$clog2(BYTES_PER_WORD)-1:0] wbyte_sel,
  input  logic [7:0]                   wbyte,

  input  logic                         ren,
  input  logic [AW-1:0]                raddr,
  output logic [BYTES_PER_WORD*8-1:0]  rdata,
  output logic                         rvalid
);

  localparam int DW = BYTES_PER_WORD*8;
  logic [DW-1:0] mem [0:(1<<AW)-1];

  always_ff @(posedge clk) begin
    if (we) begin
      mem[waddr][8*wbyte_sel +: 8] <= wbyte;
    end
  end

  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      rvalid <= 1'b0;
      rdata  <= '0;
    end else begin
      rvalid <= ren;
      if (ren) begin
        rdata <= mem[raddr];
      end
    end
  end

endmodule