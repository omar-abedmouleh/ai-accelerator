`timescale 1ns/1ps

module relu_array #(
  // physische MAX
  parameter int ROWS_MAX = 4,
  parameter int COLS_MAX = 16,
  parameter int OUT_W    = 8
)(
  input  logic clk,
  input  logic reset,

  // runtime CFG (<= MAX)
  input  logic [15:0] cfg_tile_r,
  input  logic [15:0] cfg_tile_c,

  input  logic signed [0:ROWS_MAX-1][0:COLS_MAX-1][OUT_W-1:0] in_pix,
  input  logic        [0:ROWS_MAX-1][0:COLS_MAX-1]            in_val,

  output logic signed [0:ROWS_MAX-1][0:COLS_MAX-1][OUT_W-1:0] o_array_relu,
  output logic        [0:ROWS_MAX-1][0:COLS_MAX-1]            o_array_relu_valid,

  output logic relu_done
);

  genvar r, c;

  generate
    for (r = 0; r < ROWS_MAX; r = r + 1) begin : R
      for (c = 0; c < COLS_MAX; c = c + 1) begin : C

        wire active_rc;
        assign active_rc = (cfg_tile_r > r) && (cfg_tile_c > c);

        wire signed [OUT_W-1:0] din;
        wire                    vin;

        assign din = active_rc ? in_pix[r][c] : '0;
        assign vin = active_rc ? in_val[r][c] : 1'b0;

        ReLU_Unit #(.W(OUT_W)) u_relu6(
          .data_in        (din),
          .data_in_valid  (vin),
          .data_out       (o_array_relu[r][c]),
          .data_out_valid (o_array_relu_valid[r][c])
        );
      end
    end
  endgenerate

  // Done-Puls: Rising Edge am letzten aktiven Element
  logic br_v_sel;
  logic br_v_q;

  integer br_r_int;
  integer br_c_int;

  always_comb begin
    br_r_int = cfg_tile_r - 1;
    br_c_int = cfg_tile_c - 1;

    if (br_r_int < 0) br_r_int = 0;
    if (br_c_int < 0) br_c_int = 0;

    if (br_r_int > (ROWS_MAX-1)) br_r_int = (ROWS_MAX-1);
    if (br_c_int > (COLS_MAX-1)) br_c_int = (COLS_MAX-1);

    br_v_sel = o_array_relu_valid[br_r_int][br_c_int];
  end

  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      br_v_q   <= 1'b0;
      relu_done <= 1'b0;
    end else begin
      br_v_q   <= br_v_sel;
      relu_done <= br_v_sel & ~br_v_q;
    end
  end

endmodule

