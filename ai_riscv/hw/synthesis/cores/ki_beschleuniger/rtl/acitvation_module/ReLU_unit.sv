module ReLU_Unit #(parameter int W=8)(
  input  logic signed [W-1:0] data_in,
  input  logic                data_in_valid,
  output logic signed [W-1:0] data_out,
  output logic                data_out_valid
);
  always_comb begin
    data_out = (data_in < 0) ? '0 : data_in; // nur untere Schranke (oben macht sat8 = 127)
  end
  assign data_out_valid = data_in_valid;
endmodule