`timescale 1ns/1ps

// 1W1R Window RAM (sync write, sync read, 1-cycle latency)
// - RAM-friendly for FPGA inference
// - no reset (typisch für BlockRAM inference)
module win_ram_1w1r #(
  parameter int AW = 10,
  parameter int DW = 72
)(
  input  logic             clk,
  input  logic             we,
  input  logic [AW-1:0]     waddr,
  input  logic [DW-1:0]     wdata,
  input  logic             ren,
  input  logic [AW-1:0]     raddr,
  output logic [DW-1:0]     rdata
);
  localparam int DEPTH = (1 << AW);

  logic [DW-1:0] mem [0:DEPTH-1];
  logic [AW-1:0] raddr_q;

  always_ff @(posedge clk) begin
    if (we) begin
      mem[waddr] <= wdata;
    end
    if (ren) begin
      raddr_q <= raddr;
    end
    // 1-cycle read latency via registered address
    rdata <= mem[raddr_q];
  end
endmodule
