// AI Accelerator Package
// Liest Parameter automatisch aus defines (generiert aus .config)

package ai_accelerator_pkg;

    // Parameter werden aus ai_config_defines.svh gelesen
    `include "ai_config_defines.svh"
    
    // Berechnete Parameter (basierend auf .config Werten)
    // Bestehende Breite beibehalten für Kompatibilität
    parameter int RESULT_WIDTH = DATA_WIDTH*2 + FILTER_SIZE; // Für Conv2D Ergebnis (single-channel, historisch)
    parameter int TOTAL_ELEMENTS = FILTER_SIZE * FILTER_SIZE; // 9 Elemente

    // Zusätzliche, sicherere Breitenberechnungen (unverändert lassen, optional verwendbar)
    localparam int PRODUCTS_PER_CH = FILTER_SIZE * FILTER_SIZE;
    localparam int CH_SUM_BITS = $clog2(PRODUCTS_PER_CH + 1);
    parameter int CHANNEL_RESULT_WIDTH = (2*DATA_WIDTH) + CH_SUM_BITS; // sichere Breite je Kanal
    parameter int RGB_RESULT_WIDTH = CHANNEL_RESULT_WIDTH + $clog2(IMAGE_CHANNELS + 1); // sichere Breite für R+G+B

    // Output Featuremap Größe (valid convolution, ohne Padding)
    // OUT_SIZE = floor((IMAGE_SIZE - FILTER_SIZE)/STRIDE) + 1
    parameter int OUT_SIZE = ((IMAGE_SIZE - FILTER_SIZE) / STRIDE) + 1;

endpackage
