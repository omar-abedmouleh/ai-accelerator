// Import des AI Accelerator Packages
import ai_accelerator_pkg::*;

// Single-Channel 2D-Conv (3x3 dot product)
module accelerator_for_conv2d
(
    input  logic clk,
    input  logic rst,
    input  logic valid_in,
    input  logic [DATA_WIDTH-1:0] filter_matrix [FILTER_SIZE-1:0][FILTER_SIZE-1:0],
    input  logic [DATA_WIDTH-1:0] image_patch   [FILTER_SIZE-1:0][FILTER_SIZE-1:0],
    output logic [RESULT_WIDTH:0] result,
    output logic valid_out
);
        // Kombinatorische Dot-Product-Berechnung mit 2D-Schleifen
        logic [RESULT_WIDTH:0] result_next;
        always_comb begin
            result_next = '0;
            for (int i = 0; i < FILTER_SIZE; i++) begin
                for (int j = 0; j < FILTER_SIZE; j++) begin
                    // Multiplikation pro Element und Akkumulation
                    result_next += filter_matrix[i][j] * image_patch[i][j];
                end
            end
        end

        // Pipeline-Register (1 Takt Latenz)
        always_ff @(posedge clk or posedge rst) begin
            if (rst) begin
                result <= '0;
                valid_out <= 1'b0;
            end else begin
                result <= result_next;
                valid_out <= valid_in;
            end
        end
endmodule

// Einfache FIFO-Liniendelay um genau eine Bildzeile (IMAGE_SIZE) zu verzögern
module fifo_line_delay #(
    parameter int WIDTH = DATA_WIDTH,
    parameter int DEPTH = IMAGE_SIZE
)(
    input  logic                  clk,
    input  logic                  rst,
    input  logic                  en,
    input  logic [WIDTH-1:0]      din,
    output logic [WIDTH-1:0]      dout
);
    logic [WIDTH-1:0] mem [0:DEPTH-1];
    logic [$clog2(DEPTH)-1:0] rd_ptr, wr_ptr;
    logic                     primed;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            rd_ptr <= '0; wr_ptr <= '0; primed <= 1'b0; dout <= '0;
        end else if (en) begin
            dout   <= primed ? mem[rd_ptr] : '0;
            mem[wr_ptr] <= din;
            rd_ptr <= (rd_ptr == DEPTH-1) ? '0 : rd_ptr + 1'b1;
            wr_ptr <= (wr_ptr == DEPTH-1) ? '0 : wr_ptr + 1'b1;
            if (!primed) begin
                // Nach DEPTH Takten ist der Puffer gefüllt
                primed <= (wr_ptr == DEPTH-2);
            end
        end
    end
endmodule

// Sliding-Window Generator für RGB mit STRIDE und valid-Ausgabe
module window_gen_rgb (
    input  logic clk,
    input  logic rst,
    input  logic valid_in,
    input  logic [DATA_WIDTH-1:0] pixel_R,
    input  logic [DATA_WIDTH-1:0] pixel_G,
    input  logic [DATA_WIDTH-1:0] pixel_B,
    output logic [DATA_WIDTH-1:0] win_R [FILTER_SIZE-1:0][FILTER_SIZE-1:0],
    output logic [DATA_WIDTH-1:0] win_G [FILTER_SIZE-1:0][FILTER_SIZE-1:0],
    output logic [DATA_WIDTH-1:0] win_B [FILTER_SIZE-1:0][FILTER_SIZE-1:0],
    output logic                  window_valid
);
    // Spalten-/Zeilenzähler (Raster-Scan)
    logic [$clog2(IMAGE_SIZE)-1:0] col_cnt;
    logic [$clog2(IMAGE_SIZE)-1:0] row_cnt;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            col_cnt <= '0; row_cnt <= '0;
        end else if (valid_in) begin
            if (col_cnt == IMAGE_SIZE-1) begin
                col_cnt <= '0;
                if (row_cnt != IMAGE_SIZE-1) row_cnt <= row_cnt + 1'b1;
            end else begin
                col_cnt <= col_cnt + 1'b1;
            end
        end
    end

    // Kaskade von Liniendelay-FIFOs für R/G/B (FILTER_SIZE-1 Stück)
    logic [DATA_WIDTH-1:0] row_tap_R [FILTER_SIZE-1:0];
    logic [DATA_WIDTH-1:0] row_tap_G [FILTER_SIZE-1:0];
    logic [DATA_WIDTH-1:0] row_tap_B [FILTER_SIZE-1:0];

    assign row_tap_R[0] = pixel_R;
    assign row_tap_G[0] = pixel_G;
    assign row_tap_B[0] = pixel_B;

    genvar lr;
    generate
        for (lr = 1; lr < FILTER_SIZE; lr++) begin : gen_line_delays
            fifo_line_delay #(.WIDTH(DATA_WIDTH), .DEPTH(IMAGE_SIZE)) u_delay_R (
                .clk(clk), .rst(rst), .en(valid_in), .din(row_tap_R[lr-1]), .dout(row_tap_R[lr])
            );
            fifo_line_delay #(.WIDTH(DATA_WIDTH), .DEPTH(IMAGE_SIZE)) u_delay_G (
                .clk(clk), .rst(rst), .en(valid_in), .din(row_tap_G[lr-1]), .dout(row_tap_G[lr])
            );
            fifo_line_delay #(.WIDTH(DATA_WIDTH), .DEPTH(IMAGE_SIZE)) u_delay_B (
                .clk(clk), .rst(rst), .en(valid_in), .din(row_tap_B[lr-1]), .dout(row_tap_B[lr])
            );
        end
    endgenerate

    // Horizontale Shift-Register je Zeile des Fensters
    logic [DATA_WIDTH-1:0] hshift_R [FILTER_SIZE-1:0][FILTER_SIZE-1:0];
    logic [DATA_WIDTH-1:0] hshift_G [FILTER_SIZE-1:0][FILTER_SIZE-1:0];
    logic [DATA_WIDTH-1:0] hshift_B [FILTER_SIZE-1:0][FILTER_SIZE-1:0];

    integer ri, rj;
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            for (ri = 0; ri < FILTER_SIZE; ri++) begin
                for (rj = 0; rj < FILTER_SIZE; rj++) begin
                    hshift_R[ri][rj] <= '0;
                    hshift_G[ri][rj] <= '0;
                    hshift_B[ri][rj] <= '0;
                end
            end
        end else if (valid_in) begin
            for (ri = 0; ri < FILTER_SIZE; ri++) begin
                // Shift nach rechts
                for (rj = FILTER_SIZE-1; rj > 0; rj--) begin
                    hshift_R[ri][rj] <= hshift_R[ri][rj-1];
                    hshift_G[ri][rj] <= hshift_G[ri][rj-1];
                    hshift_B[ri][rj] <= hshift_B[ri][rj-1];
                end
                // Neuer Pixel an Position [ri][0] (oberste Spalte des Fensters)
                hshift_R[ri][0] <= row_tap_R[ri];
                hshift_G[ri][0] <= row_tap_G[ri];
                hshift_B[ri][0] <= row_tap_B[ri];
            end
        end
    end

    // Fenster-Abbild auf Outputs (spiegeln, so dass [0][0] dem "Top-Left" entspricht)
    genvar wi, wj;
    generate
        for (wi = 0; wi < FILTER_SIZE; wi++) begin : gen_win_rows
            for (wj = 0; wj < FILTER_SIZE; wj++) begin : gen_win_cols
                always_comb begin
                    win_R[wi][wj] = hshift_R[wi][FILTER_SIZE-1-wj];
                    win_G[wi][wj] = hshift_G[wi][FILTER_SIZE-1-wj];
                    win_B[wi][wj] = hshift_B[wi][FILTER_SIZE-1-wj];
                end
            end
        end
    endgenerate

    // Valid-Bedingung: genügend Zeilen/Spalten + STRIDE-Ausrichtung
    logic row_ready, col_ready;
    logic stride_row_ok, stride_col_ok;
    always_comb begin
        row_ready = (row_cnt >= (FILTER_SIZE-1));
        col_ready = (col_cnt >= (FILTER_SIZE-1));
        stride_row_ok = (((row_cnt - (FILTER_SIZE-1)) % STRIDE) == 0);
        stride_col_ok = (((col_cnt - (FILTER_SIZE-1)) % STRIDE) == 0);
    end

    // window_valid registrieren, um Timing stabil zu halten
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            window_valid <= 1'b0;
        end else begin
            window_valid <= valid_in && row_ready && col_ready && stride_row_ok && stride_col_ok;
        end
    end
endmodule

// Streaming-Top: Nimmt RGB-Pixel-Stream und gibt gefaltete Ergebnisse als Stream aus
module conv2d_rgb_streaming (
    input  logic clk,
    input  logic rst,
    input  logic valid_in,
    input  logic [DATA_WIDTH-1:0] pixel_R,
    input  logic [DATA_WIDTH-1:0] pixel_G,
    input  logic [DATA_WIDTH-1:0] pixel_B,

    input  logic [DATA_WIDTH-1:0] filter_R  [FILTER_SIZE-1:0][FILTER_SIZE-1:0],
    input  logic [DATA_WIDTH-1:0] filter_G  [FILTER_SIZE-1:0][FILTER_SIZE-1:0],
    input  logic [DATA_WIDTH-1:0] filter_B  [FILTER_SIZE-1:0][FILTER_SIZE-1:0],

    output logic [CHANNEL_RESULT_WIDTH:0] out_R,
    output logic [CHANNEL_RESULT_WIDTH:0] out_G,
    output logic [CHANNEL_RESULT_WIDTH:0] out_B,
    output logic [RGB_RESULT_WIDTH:0]     out_RGB,
    output logic                          out_valid
);
    // Fenster erzeugen
    logic [DATA_WIDTH-1:0] win_R [FILTER_SIZE-1:0][FILTER_SIZE-1:0];
    logic [DATA_WIDTH-1:0] win_G [FILTER_SIZE-1:0][FILTER_SIZE-1:0];
    logic [DATA_WIDTH-1:0] win_B [FILTER_SIZE-1:0][FILTER_SIZE-1:0];
    logic                  win_valid;

    window_gen_rgb u_win (
        .clk(clk), .rst(rst), .valid_in(valid_in),
        .pixel_R(pixel_R), .pixel_G(pixel_G), .pixel_B(pixel_B),
        .win_R(win_R), .win_G(win_G), .win_B(win_B), .window_valid(win_valid)
    );

    // Single-Channel Convs
    logic [RESULT_WIDTH:0] res_R_sc, res_G_sc, res_B_sc;
    logic valid_R_sc, valid_G_sc, valid_B_sc;

    accelerator_for_conv2d u_sc_R (
        .clk(clk), .rst(rst), .valid_in(win_valid),
        .filter_matrix(filter_R), .image_patch(win_R), .result(res_R_sc), .valid_out(valid_R_sc)
    );
    accelerator_for_conv2d u_sc_G (
        .clk(clk), .rst(rst), .valid_in(win_valid),
        .filter_matrix(filter_G), .image_patch(win_G), .result(res_G_sc), .valid_out(valid_G_sc)
    );
    accelerator_for_conv2d u_sc_B (
        .clk(clk), .rst(rst), .valid_in(win_valid),
        .filter_matrix(filter_B), .image_patch(win_B), .result(res_B_sc), .valid_out(valid_B_sc)
    );

    // Ausgabe registrieren
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            out_R <= '0; out_G <= '0; out_B <= '0; out_RGB <= '0; out_valid <= 1'b0;
        end else begin
            out_R <= res_R_sc;
            out_G <= res_G_sc;
            out_B <= res_B_sc;
            out_RGB <= res_R_sc + res_G_sc + res_B_sc;
            out_valid <= valid_R_sc; // alle gleich
        end
    end
endmodule

    // RGB-Variante: drei Kanäle (R,G,B) separat multiplizieren und optional summieren
    module accelerator_for_conv2d_rgb (
        input  logic clk,
        input  logic rst,
        input  logic valid_in,

        // Filter pro Kanal (3x3)
        input  logic [DATA_WIDTH-1:0] filter_matrix_R [FILTER_SIZE-1:0][FILTER_SIZE-1:0],
        input  logic [DATA_WIDTH-1:0] filter_matrix_G [FILTER_SIZE-1:0][FILTER_SIZE-1:0],
        input  logic [DATA_WIDTH-1:0] filter_matrix_B [FILTER_SIZE-1:0][FILTER_SIZE-1:0],

        // Image-Patch pro Kanal (3x3)
        input  logic [DATA_WIDTH-1:0] image_patch_R   [FILTER_SIZE-1:0][FILTER_SIZE-1:0],
        input  logic [DATA_WIDTH-1:0] image_patch_G   [FILTER_SIZE-1:0][FILTER_SIZE-1:0],
        input  logic [DATA_WIDTH-1:0] image_patch_B   [FILTER_SIZE-1:0][FILTER_SIZE-1:0],

        // Einzelkanal-Outputs
        output logic [RESULT_WIDTH:0] result_R,
        output logic [RESULT_WIDTH:0] result_G,
        output logic [RESULT_WIDTH:0] result_B,
        // Summiertes Ergebnis über R+G+B (Breite +1 für Summe von 3 Werten)
        output logic [RESULT_WIDTH+1:0] result_rgb,
        output logic                    valid_rgb
    );
        // Drei Instanzen des Single-Channel-Moduls (ohne Flattening)
        logic valid_R_sc, valid_G_sc, valid_B_sc;
        accelerator_for_conv2d u_conv_R (
            .clk(clk), .rst(rst), .valid_in(valid_in),
            .filter_matrix(filter_matrix_R), .image_patch(image_patch_R), .result(result_R), .valid_out(valid_R_sc)
        );

        accelerator_for_conv2d u_conv_G (
            .clk(clk), .rst(rst), .valid_in(valid_in),
            .filter_matrix(filter_matrix_G), .image_patch(image_patch_G), .result(result_G), .valid_out(valid_G_sc)
        );

        accelerator_for_conv2d u_conv_B (
            .clk(clk), .rst(rst), .valid_in(valid_in),
            .filter_matrix(filter_matrix_B), .image_patch(image_patch_B), .result(result_B), .valid_out(valid_B_sc)
        );

        // RGB-Summe mit Pipeline-Register (1 Takt Latenz gegenüber den Kanal-Ergebnissen)
        logic [RESULT_WIDTH+1:0] result_rgb_next;
        always_comb begin
            result_rgb_next = result_R + result_G + result_B; // +1 Bits Reserve in Deklaration
        end
        always_ff @(posedge clk or posedge rst) begin
            if (rst) begin
                result_rgb <= '0;
                valid_rgb  <= 1'b0;
            end else begin
                result_rgb <= result_rgb_next;
                // gültig wird um eine weitere Stufe verzögert (Summe-Register)
                valid_rgb  <= valid_R_sc; // alle drei sind identisch verzögert
            end
        end
    endmodule

// Volle Conv2D über ein RGB-Bild (n x n) mit stride=m und Filter=p x p (valid, kein Padding)
module conv2d_rgb_full
(
    input  logic clk,
    input  logic rst,
    input  logic valid_in,

    // Eingabebild (n x n) pro Kanal
    input  logic [DATA_WIDTH-1:0] image_R   [IMAGE_SIZE-1:0][IMAGE_SIZE-1:0],
    input  logic [DATA_WIDTH-1:0] image_G   [IMAGE_SIZE-1:0][IMAGE_SIZE-1:0],
    input  logic [DATA_WIDTH-1:0] image_B   [IMAGE_SIZE-1:0][IMAGE_SIZE-1:0],

    // Filter (p x p) pro Kanal
    input  logic [DATA_WIDTH-1:0] filter_R  [FILTER_SIZE-1:0][FILTER_SIZE-1:0],
    input  logic [DATA_WIDTH-1:0] filter_G  [FILTER_SIZE-1:0][FILTER_SIZE-1:0],
    input  logic [DATA_WIDTH-1:0] filter_B  [FILTER_SIZE-1:0][FILTER_SIZE-1:0],

    // Ausgabefeaturemaps (OUT_SIZE x OUT_SIZE)
    output logic [CHANNEL_RESULT_WIDTH:0] out_R [OUT_SIZE-1:0][OUT_SIZE-1:0],
    output logic [CHANNEL_RESULT_WIDTH:0] out_G [OUT_SIZE-1:0][OUT_SIZE-1:0],
    output logic [CHANNEL_RESULT_WIDTH:0] out_B [OUT_SIZE-1:0][OUT_SIZE-1:0],
    output logic [RGB_RESULT_WIDTH:0]     out_RGB [OUT_SIZE-1:0][OUT_SIZE-1:0],
    output logic                          out_valid [OUT_SIZE-1:0][OUT_SIZE-1:0]
);
    // Schleifen über die Ausgabepositionen (i_o, j_o)
    genvar i_o, j_o;
    generate
        for (i_o = 0; i_o < OUT_SIZE; i_o++) begin : gen_rows
            for (j_o = 0; j_o < OUT_SIZE; j_o++) begin : gen_cols
                // Lokale Patches und Ergebnisse je Ausgabeposition
                logic [DATA_WIDTH-1:0] patch_R [FILTER_SIZE-1:0][FILTER_SIZE-1:0];
                logic [DATA_WIDTH-1:0] patch_G [FILTER_SIZE-1:0][FILTER_SIZE-1:0];
                logic [DATA_WIDTH-1:0] patch_B [FILTER_SIZE-1:0][FILTER_SIZE-1:0];
                logic [RESULT_WIDTH:0]  res_R_sc, res_G_sc, res_B_sc;
                // Extrahiere den Patch beginnend bei (i_o*STRIDE, j_o*STRIDE)
                always_comb begin
                    for (int pi = 0; pi < FILTER_SIZE; pi++) begin
                        for (int pj = 0; pj < FILTER_SIZE; pj++) begin
                            patch_R[pi][pj] = image_R[i_o*STRIDE + pi][j_o*STRIDE + pj];
                            patch_G[pi][pj] = image_G[i_o*STRIDE + pi][j_o*STRIDE + pj];
                            patch_B[pi][pj] = image_B[i_o*STRIDE + pi][j_o*STRIDE + pj];
                        end
                    end
                end

                // Rechne pro Kanal die Faltung auf dem Patch
                logic res_valid_R, res_valid_G, res_valid_B;
                accelerator_for_conv2d u_sc_R (
                    .clk(clk), .rst(rst), .valid_in(valid_in),
                    .filter_matrix(filter_R), .image_patch(patch_R), .result(res_R_sc), .valid_out(res_valid_R)
                );
                accelerator_for_conv2d u_sc_G (
                    .clk(clk), .rst(rst), .valid_in(valid_in),
                    .filter_matrix(filter_G), .image_patch(patch_G), .result(res_G_sc), .valid_out(res_valid_G)
                );
                accelerator_for_conv2d u_sc_B (
                    .clk(clk), .rst(rst), .valid_in(valid_in),
                    .filter_matrix(filter_B), .image_patch(patch_B), .result(res_B_sc), .valid_out(res_valid_B)
                );

                // Outputs registrieren (1 Takt Latenz ab Single-Channel Outputs)
        always_ff @(posedge clk or posedge rst) begin
                    if (rst) begin
                        out_R[i_o][j_o]   <= '0;
                        out_G[i_o][j_o]   <= '0;
                        out_B[i_o][j_o]   <= '0;
                        out_RGB[i_o][j_o] <= '0;
            out_valid[i_o][j_o] <= 1'b0;
                    end else begin
                        out_R[i_o][j_o]   <= res_R_sc;
                        out_G[i_o][j_o]   <= res_G_sc;
                        out_B[i_o][j_o]   <= res_B_sc;
                        out_RGB[i_o][j_o] <= res_R_sc + res_G_sc + res_B_sc;
            out_valid[i_o][j_o] <= res_valid_R; // alle gleich
                    end
                end
            end
        end
    endgenerate
endmodule