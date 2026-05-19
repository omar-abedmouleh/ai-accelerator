`timescale 1ns/1ps

module pooling_unit #(
    parameter int DATA_W = 8
)(
    input  logic signed [DATA_W-1:0] v00,
    input  logic signed [DATA_W-1:0] v01,
    input  logic signed [DATA_W-1:0] v10,
    input  logic signed [DATA_W-1:0] v11,
    input  logic                     use_max,     // 1: Max-Pooling, 0: Average-Pooling
    output logic signed [DATA_W-1:0] pooled_val
);

    // interne Hilfssignale
    logic signed [DATA_W-1:0] max01;
    logic signed [DATA_W-1:0] max23;
    logic signed [DATA_W-1:0] max_all;
    logic signed [DATA_W+2:0] sum_ext;

    always_comb begin
        if (use_max) begin
            // Max über 4 Werte
            max01   = (v00 > v01) ? v00 : v01;
            max23   = (v10 > v11) ? v10 : v11;
            max_all = (max01 > max23) ? max01 : max23;
            pooled_val = max_all;
        end
        else begin
            // Average = (v00 + v01 + v10 + v11) / 4, mit Sign-Extension
            sum_ext = {{3{v00[DATA_W-1]}}, v00} +
                      {{3{v01[DATA_W-1]}}, v01} +
                      {{3{v10[DATA_W-1]}}, v10} +
                      {{3{v11[DATA_W-1]}}, v11};
            pooled_val = sum_ext >>> 2;
        end
    end

endmodule
