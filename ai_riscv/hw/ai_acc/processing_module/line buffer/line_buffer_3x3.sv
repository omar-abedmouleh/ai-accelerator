`timescale 1ns/1ps

module line_buffer_3x3 #(
    parameter int IMG_WIDTH_MAX = 226,
    parameter int WIN_SIZE      = 3
)(
    input  logic        clk,
    input  logic        reset,

    // Runtime-Konfig
    input  logic [15:0] cfg_img_w,   // aktive Breite (<= IMG_WIDTH_MAX)
    input  logic [1:0]  cfg_stride,  // stride >= 1, kodiert in 2-bit (0->1, 1->1, 2->2, 3->3)

    // Pixelstream
    input  logic        px_valid,
    input  logic [7:0]  px_in,

    // 3x3 Window
    output logic           win_valid,
    output logic [8*9-1:0] win_out
);

    localparam int ADDR_W = (IMG_WIDTH_MAX > 1) ? $clog2(IMG_WIDTH_MAX) : 1;

    logic [15:0] img_w_eff;

    // stride nur noch klein -> kurze Vergleiche/Subs, keine 16-bit Carry-Kette
    logic [1:0]  stride_eff;

    always_comb begin
        img_w_eff  = (cfg_img_w == 16'd0) ? 16'd1 : cfg_img_w;

        // 0 bedeutet "nicht gesetzt" -> stride = 1
        stride_eff = (cfg_stride == 2'd0) ? 2'd1 : cfg_stride;

        // optional (wenn man sowieso nur stride 1/2 willst):
        // if (stride_eff > 2'd2) stride_eff = 2'd2;

        if (img_w_eff > IMG_WIDTH_MAX[15:0])
            img_w_eff = IMG_WIDTH_MAX[15:0];
    end

    logic [ADDR_W-1:0] col;
    logic [15:0]       row;

    // Stride-Phasen (jetzt klein)
    logic [1:0] x_phase;
    logic [1:0] y_phase;

    logic [7:0] linebuf0 [0:IMG_WIDTH_MAX-1]; // y-1
    logic [7:0] linebuf1 [0:IMG_WIDTH_MAX-1]; // y-2

    logic [7:0] t0, t1, t2;
    logic [7:0] m0, m1, m2;
    logic [7:0] b0, b1, b2;

    logic [7:0] t0_n, t1_n, t2_n;
    logic [7:0] m0_n, m1_n, m2_n;
    logic [7:0] b0_n, b1_n, b2_n;

    logic col_wrap;

    integer i;

    always_comb begin
        col_wrap = 1'b0;
        if (px_valid) begin
            if (col == (img_w_eff[ADDR_W-1:0] - 1'b1))
                col_wrap = 1'b1;
        end
    end

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            col     <= '0;
            row     <= '0;
            x_phase <= '0;
            y_phase <= '0;

            t0 <= 8'd0; t1 <= 8'd0; t2 <= 8'd0;
            m0 <= 8'd0; m1 <= 8'd0; m2 <= 8'd0;
            b0 <= 8'd0; b1 <= 8'd0; b2 <= 8'd0;

            win_valid <= 1'b0;
            win_out   <= {8*9{1'b0}};

            for (i = 0; i < IMG_WIDTH_MAX; i = i + 1) begin
                linebuf0[i] <= 8'd0;
                linebuf1[i] <= 8'd0;
            end
        end
        else begin
            win_valid <= 1'b0;
            if (px_valid) begin
                // Tap-Werte berechnen
                t0_n = linebuf1[col];
                t1_n = t0;
                t2_n = t1;

                m0_n = linebuf0[col];
                m1_n = m0;
                m2_n = m1;

                b0_n = px_in;
                b1_n = b0;
                b2_n = b1;

                // Linebuffer schreiben
                linebuf1[col] <= linebuf0[col];
                linebuf0[col] <= px_in;

                // win_valid, sobald genug Pixel da sind + Stride-Alignment passt
                if ((row >= (WIN_SIZE-1)) && (col >= (WIN_SIZE-1))) begin
                    if ((x_phase == 2'd0) && (y_phase == 2'd0)) begin
                        win_valid <= 1'b1;
                        win_out <= {
                            b0_n, b1_n, b2_n,
                            m0_n, m1_n, m2_n,
                            t0_n, t1_n, t2_n
                        };
                    end
                end

                // Tap-Register übernehmen
                t0 <= t0_n;  t1 <= t1_n;  t2 <= t2_n;
                m0 <= m0_n;  m1 <= m1_n;  m2 <= m2_n;
                b0 <= b0_n;  b1 <= b1_n;  b2 <= b2_n;

                // x_phase Update
                if (col_wrap) begin
                    x_phase <= 2'd0;
                end
                else begin
                    if (col < (WIN_SIZE-1)) begin
                        x_phase <= 2'd0;
                    end
                    else begin
                        if (x_phase == (stride_eff - 2'd1))
                            x_phase <= 2'd0;
                        else
                            x_phase <= x_phase + 2'd1;
                    end
                end

                // col/row + y_phase Update
                if (col_wrap) begin
                    col <= '0;
                    row <= row + 1'b1;

                    if (row < (WIN_SIZE-1)) begin
                        y_phase <= 2'd0;
                    end
                    else begin
                        if (y_phase == (stride_eff - 2'd1))
                            y_phase <= 2'd0;
                        else
                            y_phase <= y_phase + 2'd1;
                    end
                end
                else begin
                    col <= col + 1'b1;
                end
            end
        end
    end

endmodule
