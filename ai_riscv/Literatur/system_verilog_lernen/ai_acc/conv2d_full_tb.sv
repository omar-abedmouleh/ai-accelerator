// Testbench für volle Conv2D über RGB-Bild
// Keine Konsole; nur Waves beobachten

import ai_accelerator_pkg::*;

module conv2d_full_tb;
    // Clock/Reset
    logic clk; logic rst;
    initial begin clk = 0; forever #5 clk = ~clk; end
    initial begin rst = 1; #25 rst = 0; end

    // Bild (n x n)
    logic [DATA_WIDTH-1:0] image_R [IMAGE_SIZE-1:0][IMAGE_SIZE-1:0];
    logic [DATA_WIDTH-1:0] image_G [IMAGE_SIZE-1:0][IMAGE_SIZE-1:0];
    logic [DATA_WIDTH-1:0] image_B [IMAGE_SIZE-1:0][IMAGE_SIZE-1:0];

    // Filter (p x p)
    logic [DATA_WIDTH-1:0] filter_R [FILTER_SIZE-1:0][FILTER_SIZE-1:0];
    logic [DATA_WIDTH-1:0] filter_G [FILTER_SIZE-1:0][FILTER_SIZE-1:0];
    logic [DATA_WIDTH-1:0] filter_B [FILTER_SIZE-1:0][FILTER_SIZE-1:0];

    // Outputs
    logic [CHANNEL_RESULT_WIDTH:0] out_R [OUT_SIZE-1:0][OUT_SIZE-1:0];
    logic [CHANNEL_RESULT_WIDTH:0] out_G [OUT_SIZE-1:0][OUT_SIZE-1:0];
    logic [CHANNEL_RESULT_WIDTH:0] out_B [OUT_SIZE-1:0][OUT_SIZE-1:0];
    logic [RGB_RESULT_WIDTH:0]     out_RGB [OUT_SIZE-1:0][OUT_SIZE-1:0];

    // DUT
    logic valid_in;
    logic out_valid [OUT_SIZE-1:0][OUT_SIZE-1:0];
    conv2d_rgb_full dut (
        .clk(clk), .rst(rst), .valid_in(valid_in),
        .image_R(image_R), .image_G(image_G), .image_B(image_B),
        .filter_R(filter_R), .filter_G(filter_G), .filter_B(filter_B),
        .out_R(out_R), .out_G(out_G), .out_B(out_B), .out_RGB(out_RGB), .out_valid(out_valid)
    );

    // Hilfsaufgabe: konstante Füllung
    task automatic fill_image_const(input int valR, input int valG, input int valB);
        for (int i = 0; i < IMAGE_SIZE; i++) begin
            for (int j = 0; j < IMAGE_SIZE; j++) begin
                image_R[i][j] = valR[DATA_WIDTH-1:0];
                image_G[i][j] = valG[DATA_WIDTH-1:0];
                image_B[i][j] = valB[DATA_WIDTH-1:0];
            end
        end
    endtask

    task automatic fill_filter_const(input int valR, input int valG, input int valB);
        for (int i = 0; i < FILTER_SIZE; i++) begin
            for (int j = 0; j < FILTER_SIZE; j++) begin
                filter_R[i][j] = valR[DATA_WIDTH-1:0];
                filter_G[i][j] = valG[DATA_WIDTH-1:0];
                filter_B[i][j] = valB[DATA_WIDTH-1:0];
            end
        end
    endtask

    // Flatten für Waves (optional)
    logic [DATA_WIDTH-1:0] image_R_flat [0:IMAGE_SIZE*IMAGE_SIZE-1];
    logic [DATA_WIDTH-1:0] image_G_flat [0:IMAGE_SIZE*IMAGE_SIZE-1];
    logic [DATA_WIDTH-1:0] image_B_flat [0:IMAGE_SIZE*IMAGE_SIZE-1];

    always_comb begin
        for (int i = 0; i < IMAGE_SIZE; i++) begin
            for (int j = 0; j < IMAGE_SIZE; j++) begin
                int idx; idx = i*IMAGE_SIZE + j;
                image_R_flat[idx] = image_R[i][j];
                image_G_flat[idx] = image_G[i][j];
                image_B_flat[idx] = image_B[i][j];
            end
        end
    end

    initial begin
    // Szenario: Einfache Konstanten
    valid_in = 0;
        fill_image_const(1, 2, 3);
        fill_filter_const(1, 1, 1);
    #10; valid_in = 1;

        // Warte einige Takte, dann Wellen ansehen
    #100;
        $stop;
    end
endmodule
