// Simple RGB Testbench for accelerator_for_conv2d_rgb
// - No console output; use waves to inspect
// - Wave-friendly flattened signals for easy viewing
`timescale 1ns/1ps

module ai_acc_rgb_tb;

  import ai_accelerator_pkg::*; // DATA_WIDTH, FILTER_SIZE, RESULT_WIDTH

  // Clk/Reset
  logic clk;
  logic rst;

  // 3x3 Filter per channel
  logic [DATA_WIDTH-1:0] filter_matrix_R [FILTER_SIZE-1:0][FILTER_SIZE-1:0];
  logic [DATA_WIDTH-1:0] filter_matrix_G [FILTER_SIZE-1:0][FILTER_SIZE-1:0];
  logic [DATA_WIDTH-1:0] filter_matrix_B [FILTER_SIZE-1:0][FILTER_SIZE-1:0];

  // 3x3 Patch per channel
  logic [DATA_WIDTH-1:0] image_patch_R   [FILTER_SIZE-1:0][FILTER_SIZE-1:0];
  logic [DATA_WIDTH-1:0] image_patch_G   [FILTER_SIZE-1:0][FILTER_SIZE-1:0];
  logic [DATA_WIDTH-1:0] image_patch_B   [FILTER_SIZE-1:0][FILTER_SIZE-1:0];

  // DUT outputs
  logic [RESULT_WIDTH:0]   result_R;
  logic [RESULT_WIDTH:0]   result_G;
  logic [RESULT_WIDTH:0]   result_B;
  logic [RESULT_WIDTH+1:0] result_rgb; // matches ai_acc.sv
  logic                    valid_rgb;
  logic                    valid_in;

  // Device Under Test
  accelerator_for_conv2d_rgb dut (
    .clk(clk), .rst(rst), .valid_in(valid_in),
    .filter_matrix_R(filter_matrix_R), .filter_matrix_G(filter_matrix_G), .filter_matrix_B(filter_matrix_B),
    .image_patch_R(image_patch_R), .image_patch_G(image_patch_G), .image_patch_B(image_patch_B),
    .result_R(result_R), .result_G(result_G), .result_B(result_B), .result_rgb(result_rgb), .valid_rgb(valid_rgb)
  );

  // 100 MHz clock
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Test control for waves
  logic [3:0] test_id;
  logic       test_active;

  // Wave-friendly flattened views (R/G/B)
  logic [DATA_WIDTH-1:0] filt_R_flat [0:8];
  logic [DATA_WIDTH-1:0] filt_G_flat [0:8];
  logic [DATA_WIDTH-1:0] filt_B_flat [0:8];
  logic [DATA_WIDTH-1:0] img_R_flat  [0:8];
  logic [DATA_WIDTH-1:0] img_G_flat  [0:8];
  logic [DATA_WIDTH-1:0] img_B_flat  [0:8];

  // Expected values (for wave comparison only)
  logic [RESULT_WIDTH:0]   exp_R;
  logic [RESULT_WIDTH:0]   exp_G;
  logic [RESULT_WIDTH:0]   exp_B;
  logic [RESULT_WIDTH+1:0] exp_RGB;

  // Helper: fill 3x3 matrices with a constant
  task automatic fill_const(
      output logic [DATA_WIDTH-1:0] m [FILTER_SIZE-1:0][FILTER_SIZE-1:0],
      input  logic [DATA_WIDTH-1:0] val
  );
    for (int i = 0; i < FILTER_SIZE; i++)
      for (int j = 0; j < FILTER_SIZE; j++)
        m[i][j] = val;
  endtask

  // Helper: compute expected dot-product for constant matrices
  function automatic [RESULT_WIDTH:0] exp_dot_const(
      input logic [DATA_WIDTH-1:0] a, // ATA_WIDTH-breiter Wert, steht für alle Elemente der Filtermatrix
      input logic [DATA_WIDTH-1:0] b //b:DATA_WIDTH-breiter Wert, steht für alle Elemente des Bild-Patches
  );
    // For 3x3, sum = 9*(a*b)
    exp_dot_const = (a * b) * FILTER_SIZE * FILTER_SIZE;
  endfunction

  // Flatten views for waves
  always_comb begin
    for (int k = 0; k < 9; k++) begin
      int r;
      int c;
      r = k/3;
      c = k%3;
      filt_R_flat[k] = filter_matrix_R[r][c];
      filt_G_flat[k] = filter_matrix_G[r][c];
      filt_B_flat[k] = filter_matrix_B[r][c];
      img_R_flat[k]  = image_patch_R[r][c];
      img_G_flat[k]  = image_patch_G[r][c];
      img_B_flat[k]  = image_patch_B[r][c];
    end
  end

  // Stimulus: several simple scenarios; view exp_* vs result_* in waves
  initial begin
    test_id = 0; test_active = 0;
    exp_RGB = 0;
    exp_R = 0;
    exp_G = 0;
    exp_B = 0;
  valid_in = 0;

    // Init all matrices to 0
    for (int i = 0; i < FILTER_SIZE; i++) begin
      for (int j = 0; j < FILTER_SIZE; j++) begin
        filter_matrix_R[i][j] = '0; filter_matrix_G[i][j] = '0; filter_matrix_B[i][j] = '0;
        image_patch_R[i][j]   = '0; image_patch_G[i][j]   = '0; image_patch_B[i][j]   = '0;
      end
    end

    // Reset
  rst = 1; #20; rst = 0; #20; valid_in = 1;

    // T1: All ones per channel (R=1,G=1,B=1)
    test_id = 1; test_active = 1;
    fill_const(filter_matrix_R, 1); fill_const(image_patch_R, 1);
    fill_const(filter_matrix_G, 1); fill_const(image_patch_G, 1);
    fill_const(filter_matrix_B, 1); fill_const(image_patch_B, 1);
    exp_R = 9; exp_G = 9; exp_B = 9; exp_RGB = 27; // for 3x3
    #80; test_active = 0; #20;

    // T2: Different constants per channel
    test_id = 2; test_active = 1;
    fill_const(filter_matrix_R, 1); fill_const(image_patch_R, 2); // 1*2*9 = 18
    fill_const(filter_matrix_G, 2); fill_const(image_patch_G, 3); // 2*3*9 = 54
    fill_const(filter_matrix_B, 3); fill_const(image_patch_B, 4); // 3*4*9 = 108
    exp_R = exp_dot_const(1,2); exp_G = exp_dot_const(2,3); exp_B = exp_dot_const(3,4);
    exp_RGB = exp_R + exp_G + exp_B;
    #80; test_active = 0; #20;

    // T3: Zero
    test_id = 3; test_active = 1;
    fill_const(filter_matrix_R, 0); fill_const(image_patch_R, 0);
    fill_const(filter_matrix_G, 0); fill_const(image_patch_G, 0);
    fill_const(filter_matrix_B, 0); fill_const(image_patch_B, 0);
    exp_R = 0; exp_G = 0; exp_B = 0; exp_RGB = 0;
    #80; test_active = 0; #20;

    // T4: Max 8-bit values (255)
    test_id = 4; test_active = 1;
    fill_const(filter_matrix_R, 'hFF); fill_const(image_patch_R, 'hFF);
    fill_const(filter_matrix_G, 'hFF); fill_const(image_patch_G, 'hFF);
    fill_const(filter_matrix_B, 'hFF); fill_const(image_patch_B, 'hFF);
    exp_R = 255*255*FILTER_SIZE*FILTER_SIZE; // 585,225 for 3x3
    exp_G = exp_R; exp_B = exp_R; exp_RGB = exp_R*3; // 1,755,675
    #80; test_active = 0; #40;

    test_id = 0;
    #100;
    $stop; // stop for wave inspection
  end

endmodule
