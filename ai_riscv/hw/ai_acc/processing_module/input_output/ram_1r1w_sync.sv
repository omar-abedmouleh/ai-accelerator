module ram_1r1w_sync #(
  parameter int AW = 15,
  parameter int DW = 8
)(
  input  logic             clk,
  input  logic             we,
  input  logic [AW-1:0]     waddr,
  input  logic [DW-1:0]     wdata,
  input  logic             ren,
  input  logic [AW-1:0]     raddr,
  output logic [DW-1:0]     rdata
);

  logic [DW-1:0] mem [0:(1<<AW)-1];

`ifndef SYNTHESIS
  integer i;
  initial begin
    rdata = '0;
    for (i = 0; i < (1<<AW); i = i + 1)
      mem[i] = '0;
  end
`endif

  always @(posedge clk) begin
    if (we)
      mem[waddr] <= wdata;
    if (ren)
      rdata <= mem[raddr];
  end

endmodule
