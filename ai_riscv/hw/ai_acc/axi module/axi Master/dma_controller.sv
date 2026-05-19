// dma_axi_read_to_sram.sv
`timescale 1ns/1ps

module dma_controller #(
  parameter AXI_ADDR_WIDTH = 32,
  parameter AXI_DATA_WIDTH = 32,   // 32-bit AXI beats (4 bytes/beat)
  parameter AXI_ID_WIDTH   = 4,
  parameter SRAM_ADDR_W    = 20    // 1 MiB address space per SRAM by default
)(
  input  logic                        clk,
  input  logic                        reset,

  // Control (ein Start lädt Input, Weights, Bias, Shift, Mult)
  input  logic                        start,        // Start aller Load-Phasen

  // Phase 1: INPUT (Bild) -> SRAM-A
  input  logic [AXI_ADDR_WIDTH-1:0]   in_src_addr,   // Host (AXI) Startadresse Input
  input  logic [SRAM_ADDR_W-1:0]      in_dst_addr,   // Zieladresse im SRAM-A (Byte)
  input  logic [31:0]                 in_byte_len,   // Anzahl BYTES Input

  // Phase 2: WEIGHTS -> SRAM-W
  input  logic [AXI_ADDR_WIDTH-1:0]   wg_src_addr,   // Host Startadresse Weights
  input  logic [SRAM_ADDR_W-1:0]      wg_dst_addr,   // Zieladresse im SRAM-W (Byte)
  input  logic [31:0]                 wg_byte_len,   // Anzahl BYTES Weights

  // Phase 3: BIAS -> Bias-SRAM (sram_bias_shift)
  input  logic [AXI_ADDR_WIDTH-1:0]   bias_src_addr,   // Host Startadresse Bias
  input  logic [SRAM_ADDR_W-1:0]      bias_dst_addr,   // Zieladresse im Bias-SRAM (Byte)
  input  logic [31:0]                 bias_byte_len,   // Anzahl BYTES Bias

  // Phase 4: SHIFT -> Shift-SRAM (sram_bias_shift)
  input  logic [AXI_ADDR_WIDTH-1:0]   shift_src_addr,  // Host Startadresse Shift
  input  logic [SRAM_ADDR_W-1:0]      shift_dst_addr,  // Zieladresse im Shift-SRAM (Byte)
  input  logic [31:0]                 shift_byte_len,  // Anzahl BYTES Shift

  // Phase 5: MULT -> Mult-SRAM (output multiplier)
  input  logic [AXI_ADDR_WIDTH-1:0]   mult_src_addr,  // Host Startadresse Mult
  input  logic [SRAM_ADDR_W-1:0]      mult_dst_addr,  // Zieladresse im Mult-SRAM (Byte)
  input  logic [31:0]                 mult_byte_len,  // Anzahl BYTES Mult

  // Write-Back (Phase 5): Ergebnis-SRAM -> Host
  input  logic                        wb_enable,     // 1 = Write-Back nach letztem Layer
  input  logic [AXI_ADDR_WIDTH-1:0]   wb_dst_addr,   // Host-Zieladresse Ergebnis
  input  logic [SRAM_ADDR_W-1:0]      wb_src_addr,   // Startadresse im Ergebnis-SRAM (Byte)
  input  logic [31:0]                 wb_byte_len,   // Anzahl BYTES Ergebnis

  // Info vom Accelerator (Layer fertig berechnet)
  input  logic                        acc_layer_done,

  // Status
  output logic                        busy,
  output logic                        done,
  output logic                        error,

  // SRAM-A Write-Port (Aktivierungen / Input)
  output logic                        sram_a_we,
  output logic [SRAM_ADDR_W-1:0]      sram_a_waddr,
  output logic [7:0]                  sram_a_wdata,

  // SRAM-W Write-Port (Weights)
  output logic                        sram_w_we,
  output logic [SRAM_ADDR_W-1:0]      sram_w_waddr,
  output logic [7:0]                  sram_w_wdata,

  // SRAM-BIAS Write-Port (Bias-Speicher in sram_bias_shift)
  output logic                        sram_bias_we,
  output logic [SRAM_ADDR_W-1:0]      sram_bias_waddr,
  output logic [7:0]                  sram_bias_wdata,

  // SRAM-SHIFT Write-Port (Shift-Speicher in sram_bias_shift)
  output logic                        sram_shift_we,
  output logic [SRAM_ADDR_W-1:0]      sram_shift_waddr,
  output logic [7:0]                  sram_shift_wdata,

  // SRAM-MULT Write-Port (Multiplier-Speicher)
  output logic                        sram_mult_we,
  output logic [SRAM_ADDR_W-1:0]      sram_mult_waddr,
  output logic [7:0]                  sram_mult_wdata,

  // SRAM-Read-Port für Write-Back (Ergebnis-SRAM, z.B. Bank A oder B)
  output logic                        sram_out_re,
  output logic [SRAM_ADDR_W-1:0]      sram_out_raddr,
  input  logic [7:0]                  sram_out_rdata,

  // AXI4 Read Address Channel
  output logic [AXI_ID_WIDTH-1:0]     M_AXI_ARID,
  output logic [AXI_ADDR_WIDTH-1:0]   M_AXI_ARADDR,
  output logic [7:0]                  M_AXI_ARLEN,
  output logic [2:0]                  M_AXI_ARSIZE,
  output logic [1:0]                  M_AXI_ARBURST,
  output logic                        M_AXI_ARVALID,
  input  logic                        M_AXI_ARREADY,

  // AXI4 Read Data Channel
  input  logic [AXI_ID_WIDTH-1:0]     M_AXI_RID,
  input  logic [AXI_DATA_WIDTH-1:0]   M_AXI_RDATA,
  input  logic [1:0]                  M_AXI_RRESP,
  input  logic                        M_AXI_RLAST,
  input  logic                        M_AXI_RVALID,
  output logic                        M_AXI_RREADY,

  // AXI4 Write Address Channel
  output logic [AXI_ID_WIDTH-1:0]     M_AXI_AWID,
  output logic [AXI_ADDR_WIDTH-1:0]   M_AXI_AWADDR,
  output logic [7:0]                  M_AXI_AWLEN,
  output logic [2:0]                  M_AXI_AWSIZE,
  output logic [1:0]                  M_AXI_AWBURST,
  output logic                        M_AXI_AWVALID,
  input  logic                        M_AXI_AWREADY,

  // AXI4 Write Data Channel
  output logic [AXI_DATA_WIDTH-1:0]   M_AXI_WDATA,
  output logic [AXI_DATA_WIDTH/8-1:0] M_AXI_WSTRB,
  output logic                        M_AXI_WLAST,
  output logic                        M_AXI_WVALID,
  input  logic                        M_AXI_WREADY,

  // AXI4 Write Response Channel
  input  logic [AXI_ID_WIDTH-1:0]     M_AXI_BID,
  input  logic [1:0]                  M_AXI_BRESP,
  input  logic                        M_AXI_BVALID,
  output logic                        M_AXI_BREADY
);

  // Konstanten / Hilfsgrö�Yen
  localparam int BYTES_PER_BEAT = AXI_DATA_WIDTH/8; // 4
  localparam [1:0] BURST_INCR   = 2'b01;

  // FSM
  typedef enum logic [4:0] {
    S_RESET,
    S_IDLE,
    S_REQ_IN,     S_LOAD_IN,      // Phase 1: Input
    S_REQ_WG,     S_LOAD_WG,      // Phase 2: Weights
    S_REQ_BIAS,   S_LOAD_BIAS,    // Phase 3: Bias
    S_REQ_SHIFT,  S_LOAD_SHIFT,   // Phase 4: Shift
    S_REQ_MULT,   S_LOAD_MULT,    // Phase 5: Mult
    S_WAIT_FOR_ACC,               // Auf Accelerator/optional WB warten
    S_REQ_WB,     S_WB,           // Phase 5: Write-Back
    S_DONE,
    S_ERR
  } state_t;

  state_t state, state_n;

  // Read-DMA Register (Input/Weights/Bias/Shift/Mult)
  logic [AXI_ADDR_WIDTH-1:0] src_cur;
  logic [SRAM_ADDR_W-1:0]    dst_cur;
  logic [31:0]               bytes_rem;      // verbleibende Bytes in aktueller Read-Phase
  logic [8:0]                beats_in_burst; // 1..256
  logic [8:0]                beat_cnt;       // empfangene Beats in aktuellem Burst

  logic [31:0]               in_len_q;
  logic [31:0]               wg_len_q;
  logic [31:0]               bias_len_q;
  logic [31:0]               shift_len_q;
  logic [31:0]               mult_len_q;

  logic [AXI_DATA_WIDTH-1:0] rdata_hold;
  logic [1:0]                byte_idx;       // 0..3
  logic                      have_word;      // 1, wenn rdata_hold noch in Bytes zerlegt wird

  // Write-Back Register
  logic [31:0]               wb_bytes_rem;   // verbleibende Bytes beim Write-Back
  logic [8:0]                wb_beats_total; // Anzahl Beats für Write-Back
  logic [8:0]                wb_beat_cnt;    // gesendete Beats

  logic [AXI_DATA_WIDTH-1:0] wb_wdata_hold;  // 32-bit Wort für WDATA
  logic [1:0]                wb_byte_idx;    // 0..3 (welches Byte des WB-Wortes)
  logic                      wb_have_word;   // 1, wenn wb_wdata_hold voll ist

  logic [SRAM_ADDR_W-1:0]    wb_sram_addr;   // aktuelle Byteadresse im Ergebnis-SRAM

  // Write-Mux (für Read-DMA)
  always_comb begin
    // Default: nichts schreiben
    sram_a_we       = 1'b0;
    sram_a_waddr    = dst_cur;
    sram_a_wdata    = rdata_hold[8*byte_idx +: 8];

    sram_w_we       = 1'b0;
    sram_w_waddr    = dst_cur;
    sram_w_wdata    = rdata_hold[8*byte_idx +: 8];

    sram_bias_we    = 1'b0;
    sram_bias_waddr = dst_cur;
    sram_bias_wdata = rdata_hold[8*byte_idx +: 8];

    sram_shift_we    = 1'b0;
    sram_shift_waddr = dst_cur;
    sram_shift_wdata = rdata_hold[8*byte_idx +: 8];

    sram_mult_we    = 1'b0;
    sram_mult_waddr = dst_cur;
    sram_mult_wdata = rdata_hold[8*byte_idx +: 8];

    if (have_word &&
        (state == S_LOAD_IN   ||
         state == S_LOAD_WG   ||
         state == S_LOAD_BIAS ||
         state == S_LOAD_SHIFT ||
         state == S_LOAD_MULT)) begin

      if (state == S_LOAD_IN) begin
        sram_a_we = 1'b1;
      end else if (state == S_LOAD_WG) begin
        sram_w_we = 1'b1;
      end else if (state == S_LOAD_BIAS) begin
        sram_bias_we = 1'b1;
      end else if (state == S_LOAD_SHIFT) begin
        sram_shift_we = 1'b1;
      end else if (state == S_LOAD_MULT) begin
        sram_mult_we = 1'b1;
      end
    end
  end

  // AXI Defaults
  // Read
  assign M_AXI_ARID    = '0;
  assign M_AXI_ARSIZE  = 3'd2;            // log2(4) = 2  -> 4 Byte/Beat
  assign M_AXI_ARBURST = BURST_INCR;

  // Write
  assign M_AXI_AWID    = '0;
  assign M_AXI_AWSIZE  = 3'd2;            // 4 Byte
  assign M_AXI_AWBURST = BURST_INCR;
  assign M_AXI_WSTRB   = {AXI_DATA_WIDTH/8{1'b1}}; // alle Bytes gültig

  // RREADY-Logik: (Backpressure während Byte-Serialisierung)
  assign M_AXI_RREADY  =
      ((state == S_LOAD_IN   ||
        state == S_LOAD_WG   ||
        state == S_LOAD_BIAS ||
        state == S_LOAD_SHIFT ||
        state == S_LOAD_MULT)) && !have_word;

  // Busy/Done/Error
  assign busy  = (state != S_IDLE) && (state != S_RESET);

  // Hilfsfunktion: Burstlänge
  function automatic [8:0] calc_burst_beats(input [31:0] bytes_left,
                                            input [AXI_ADDR_WIDTH-1:0] addr);
    int max_beats;
    max_beats = (bytes_left + BYTES_PER_BEAT - 1) / BYTES_PER_BEAT;
    if (max_beats > 256) max_beats = 256;
    return max_beats[8:0];
  endfunction

  // FSM Combinational
  always_comb begin
    // Defaults
    state_n        = state;

    // AXI-Read Address
    M_AXI_ARVALID  = 1'b0;
    M_AXI_ARADDR   = src_cur;
    M_AXI_ARLEN    = (beats_in_burst == 0) ? 8'd0 : beats_in_burst - 1;

    // AXI-Write Address
    M_AXI_AWVALID  = 1'b0;
    M_AXI_AWADDR   = wb_dst_addr;
    M_AXI_AWLEN    = (wb_beats_total == 0) ? 8'd0 : wb_beats_total - 1;

    // AXI-Write Data
    M_AXI_WDATA    = wb_wdata_hold;
    M_AXI_WVALID   = 1'b0;
    M_AXI_WLAST    = 1'b0;

    // AXI-Write Response
    M_AXI_BREADY   = 1'b0;

    done           = 1'b0;
    error          = 1'b0;

    case (state)
      S_RESET: begin
        if (!reset) begin
          state_n = S_IDLE;
        end
      end

      S_IDLE: begin
        if (start) begin
          if (in_byte_len != 0) begin
            state_n = S_REQ_IN;
          end else if (wg_byte_len != 0) begin
            state_n = S_REQ_WG;
          end else if (bias_byte_len != 0) begin
            state_n = S_REQ_BIAS;
          end else if (shift_byte_len != 0) begin
            state_n = S_REQ_SHIFT;
          end else if (mult_byte_len != 0) begin
            state_n = S_REQ_MULT;
          end else begin
            // keine Phasen -> direkt "fertig"
            state_n = S_DONE;
          end
        end
      end

      // PHASE 1: INPUT -> SRAM-A
      S_REQ_IN: begin
        M_AXI_ARVALID = 1'b1;
        if (M_AXI_ARREADY) begin
          state_n = S_LOAD_IN;
        end
      end

      S_LOAD_IN: begin
        if (M_AXI_RVALID && M_AXI_RREADY && (M_AXI_RRESP != 2'b00)) begin
          state_n = S_ERR;
        end else if ((beat_cnt == beats_in_burst) && !have_word) begin
          if (bytes_rem == 0) begin
            // nächste Phase wählen
            if (wg_len_q != 0) begin
              state_n = S_REQ_WG;
            end else if (bias_len_q != 0) begin
              state_n = S_REQ_BIAS;
            end else if (shift_len_q != 0) begin
              state_n = S_REQ_SHIFT;
            end else if (mult_len_q != 0) begin
              state_n = S_REQ_MULT;
            end else begin
              state_n = S_WAIT_FOR_ACC;
            end
          end else begin
            state_n = S_REQ_IN;
          end
        end
      end

      // PHASE 2: WEIGHTS -> SRAM-W
      S_REQ_WG: begin
        M_AXI_ARVALID = 1'b1;
        if (M_AXI_ARREADY) begin
          state_n = S_LOAD_WG;
        end
      end

      S_LOAD_WG: begin
        if (M_AXI_RVALID && M_AXI_RREADY && (M_AXI_RRESP != 2'b00)) begin
          state_n = S_ERR;
        end else if ((beat_cnt == beats_in_burst) && !have_word) begin
          if (bytes_rem == 0) begin
            if (bias_len_q != 0) begin
              state_n = S_REQ_BIAS;
            end else if (shift_len_q != 0) begin
              state_n = S_REQ_SHIFT;
            end else if (mult_len_q != 0) begin
              state_n = S_REQ_MULT;
            end else begin
              state_n = S_WAIT_FOR_ACC;
            end
          end else begin
            state_n = S_REQ_WG;
          end
        end
      end

      // PHASE 3: BIAS
      S_REQ_BIAS: begin
        M_AXI_ARVALID = 1'b1;
        if (M_AXI_ARREADY) begin
          state_n = S_LOAD_BIAS;
        end
      end

      S_LOAD_BIAS: begin
        if (M_AXI_RVALID && M_AXI_RREADY && (M_AXI_RRESP != 2'b00)) begin
          state_n = S_ERR;
        end else if ((beat_cnt == beats_in_burst) && !have_word) begin
          if (bytes_rem == 0) begin
            if (shift_len_q != 0) begin
              state_n = S_REQ_SHIFT;
            end else if (mult_len_q != 0) begin
              state_n = S_REQ_MULT;
            end else begin
              state_n = S_WAIT_FOR_ACC;
            end
          end else begin
            state_n = S_REQ_BIAS;
          end
        end
      end

      // PHASE 4: SHIFT
      S_REQ_SHIFT: begin
        M_AXI_ARVALID = 1'b1;
        if (M_AXI_ARREADY) begin
          state_n = S_LOAD_SHIFT;
        end
      end

      S_LOAD_SHIFT: begin
        if (M_AXI_RVALID && M_AXI_RREADY && (M_AXI_RRESP != 2'b00)) begin
          state_n = S_ERR;
        end else if ((beat_cnt == beats_in_burst) && !have_word) begin
          if (bytes_rem == 0) begin
            if (mult_len_q != 0) begin
              state_n = S_REQ_MULT;
            end else begin
              state_n = S_WAIT_FOR_ACC;
            end
          end else begin
            state_n = S_REQ_SHIFT;
          end
        end
      end

      // PHASE 5: MULT
      S_REQ_MULT: begin
        M_AXI_ARVALID = 1'b1;
        if (M_AXI_ARREADY) begin
          state_n = S_LOAD_MULT;
        end
      end

      S_LOAD_MULT: begin
        if (M_AXI_RVALID && M_AXI_RREADY && (M_AXI_RRESP != 2'b00)) begin
          state_n = S_ERR;
        end else if ((beat_cnt == beats_in_burst) && !have_word) begin
          if (bytes_rem == 0) begin
            state_n = S_WAIT_FOR_ACC;
          end else begin
            state_n = S_REQ_MULT;
          end
        end
      end

      // Auf Accelerator / Write-Back warten
      S_WAIT_FOR_ACC: begin
        // *** Anpassung: Wenn WB nicht benutzt wird, NICHT auf acc_layer_done warten ***
        if (!wb_enable || (wb_byte_len == 0)) begin
          // In deinem jetzigen Top ist wb_enable = 0 -> sofort fertig
          state_n = S_DONE;
        end else begin
          // WB aktiv: erst auf acc_layer_done warten
          if (acc_layer_done) begin
            state_n = S_REQ_WB;
          end
        end
      end

      // Write-Back
      S_REQ_WB: begin
        M_AXI_AWVALID = 1'b1;
        if (M_AXI_AWREADY) begin
          state_n = S_WB;
        end
      end

      S_WB: begin
        if (wb_have_word) begin
          M_AXI_WVALID = 1'b1;
          M_AXI_WLAST  = (wb_beat_cnt == wb_beats_total-1) && (wb_bytes_rem == 0);
        end

        M_AXI_BREADY = 1'b1;
        if (M_AXI_BVALID) begin
          if (M_AXI_BRESP != 2'b00) begin
            state_n = S_ERR;
          end else if ((wb_beat_cnt == wb_beats_total) &&
                       (wb_bytes_rem == 0) &&
                       !wb_have_word) begin
            state_n = S_DONE;
          end
        end
      end

      S_DONE: begin
        done    = 1'b1;   // 1-Takt-Puls
        state_n = S_IDLE;
      end

      S_ERR: begin
        error   = 1'b1;
        state_n = S_IDLE;
      end

      default: state_n = S_IDLE;
    endcase
  end

  // FSM Sequential
  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      state          <= S_RESET;
      src_cur        <= '0;
      dst_cur        <= '0;
      bytes_rem      <= '0;
      beats_in_burst <= 9'd0;
      beat_cnt       <= 9'd0;
      rdata_hold     <= '0;
      byte_idx       <= 2'd0;
      have_word      <= 1'b0;

      in_len_q       <= '0;
      wg_len_q       <= '0;
      bias_len_q     <= '0;
      shift_len_q    <= '0;
      mult_len_q     <= '0;

      wb_bytes_rem   <= '0;
      wb_beats_total <= 9'd0;
      wb_beat_cnt    <= 9'd0;
      wb_wdata_hold  <= '0;
      wb_byte_idx    <= 2'd0;
      wb_have_word   <= 1'b0;
      wb_sram_addr   <= '0;

      sram_out_re    <= 1'b0;
      sram_out_raddr <= '0;
    end else begin
      state <= state_n;

      // Start
      if (state == S_IDLE && start) begin
        in_len_q       <= in_byte_len;
        wg_len_q       <= wg_byte_len;
        bias_len_q     <= bias_byte_len;
        shift_len_q    <= shift_byte_len;
        mult_len_q     <= mult_byte_len;

        beat_cnt       <= 0;
        have_word      <= 1'b0;
        byte_idx       <= 0;

        if (in_byte_len != 0) begin
          src_cur        <= in_src_addr;
          dst_cur        <= in_dst_addr;
          bytes_rem      <= in_byte_len;
          beats_in_burst <= calc_burst_beats(in_byte_len, in_src_addr);
        end else if (wg_byte_len != 0) begin
          src_cur        <= wg_src_addr;
          dst_cur        <= wg_dst_addr;
          bytes_rem      <= wg_byte_len;
          beats_in_burst <= calc_burst_beats(wg_byte_len, wg_src_addr);
        end else if (bias_byte_len != 0) begin
          src_cur        <= bias_src_addr;
          dst_cur        <= bias_dst_addr;
          bytes_rem      <= bias_byte_len;
          beats_in_burst <= calc_burst_beats(bias_byte_len, bias_src_addr);
        end else if (shift_byte_len != 0) begin
          src_cur        <= shift_src_addr;
          dst_cur        <= shift_dst_addr;
          bytes_rem      <= shift_byte_len;
          beats_in_burst <= calc_burst_beats(shift_byte_len, shift_src_addr);
        end else if (mult_byte_len != 0) begin
          src_cur        <= mult_src_addr;
          dst_cur        <= mult_dst_addr;
          bytes_rem      <= mult_byte_len;
          beats_in_burst <= calc_burst_beats(mult_byte_len, mult_src_addr);
        end else begin
          src_cur        <= '0;
          dst_cur        <= '0;
          bytes_rem      <= 0;
          beats_in_burst <= 0;
        end

        wb_bytes_rem   <= wb_byte_len;
        wb_beats_total <= calc_burst_beats(wb_byte_len, wb_dst_addr);
        wb_beat_cnt    <= 0;
        wb_wdata_hold  <= '0;
        wb_byte_idx    <= 0;
        wb_have_word   <= 1'b0;
        wb_sram_addr   <= wb_src_addr;
      end

      // AR-Handshake
      if ((state == S_REQ_IN   ||
           state == S_REQ_WG   ||
           state == S_REQ_BIAS ||
           state == S_REQ_SHIFT ||
           state == S_REQ_MULT) &&
          M_AXI_ARVALID && M_AXI_ARREADY) begin
        beat_cnt <= 0;
      end

      // R-Daten
      if ((state == S_LOAD_IN   ||
           state == S_LOAD_WG   ||
           state == S_LOAD_BIAS ||
         state == S_LOAD_SHIFT ||
         state == S_LOAD_MULT) &&
          M_AXI_RVALID && M_AXI_RREADY) begin
        rdata_hold <= M_AXI_RDATA;
        have_word  <= 1'b1;
        byte_idx   <= 2'd0;
        beat_cnt   <= beat_cnt + 1;
      end

      // Byte-Serializer
      if ((state == S_LOAD_IN   ||
           state == S_LOAD_WG   ||
           state == S_LOAD_BIAS ||
         state == S_LOAD_SHIFT ||
         state == S_LOAD_MULT) &&
          have_word) begin
        dst_cur <= dst_cur + 1;
        if (byte_idx == BYTES_PER_BEAT-1) begin
          byte_idx  <= 0;
          have_word <= 1'b0;
          if (bytes_rem >= BYTES_PER_BEAT) bytes_rem <= bytes_rem - BYTES_PER_BEAT;
          else                             bytes_rem <= 0;
        end else begin
          byte_idx <= byte_idx + 1;
        end
      end

      // Burst-Ende -> nächste Parameter vorbelegen
      if ((state == S_LOAD_IN   ||
           state == S_LOAD_WG   ||
           state == S_LOAD_BIAS ||
         state == S_LOAD_SHIFT ||
         state == S_LOAD_MULT) &&
          (beat_cnt == beats_in_burst) && !have_word) begin

        if (bytes_rem != 0) begin
          src_cur        <= src_cur + beats_in_burst*BYTES_PER_BEAT;
          beats_in_burst <= calc_burst_beats(bytes_rem,
                                             src_cur + beats_in_burst*BYTES_PER_BEAT);
        end else begin
          if (state == S_LOAD_IN) begin
            if (wg_len_q != 0) begin
              src_cur        <= wg_src_addr;
              dst_cur        <= wg_dst_addr;
              bytes_rem      <= wg_len_q;
              beats_in_burst <= calc_burst_beats(wg_len_q, wg_src_addr);
            end else if (bias_len_q != 0) begin
              src_cur        <= bias_src_addr;
              dst_cur        <= bias_dst_addr;
              bytes_rem      <= bias_len_q;
              beats_in_burst <= calc_burst_beats(bias_len_q, bias_src_addr);
            end else if (shift_len_q != 0) begin
              src_cur        <= shift_src_addr;
              dst_cur        <= shift_dst_addr;
              bytes_rem      <= shift_len_q;
              beats_in_burst <= calc_burst_beats(shift_len_q, shift_src_addr);
            end else if (mult_len_q != 0) begin
              src_cur        <= mult_src_addr;
              dst_cur        <= mult_dst_addr;
              bytes_rem      <= mult_len_q;
              beats_in_burst <= calc_burst_beats(mult_len_q, mult_src_addr);
            end
          end else if (state == S_LOAD_WG) begin
            if (bias_len_q != 0) begin
              src_cur        <= bias_src_addr;
              dst_cur        <= bias_dst_addr;
              bytes_rem      <= bias_len_q;
              beats_in_burst <= calc_burst_beats(bias_len_q, bias_src_addr);
            end else if (shift_len_q != 0) begin
              src_cur        <= shift_src_addr;
              dst_cur        <= shift_dst_addr;
              bytes_rem      <= shift_len_q;
              beats_in_burst <= calc_burst_beats(shift_len_q, shift_src_addr);
            end else if (mult_len_q != 0) begin
              src_cur        <= mult_src_addr;
              dst_cur        <= mult_dst_addr;
              bytes_rem      <= mult_len_q;
              beats_in_burst <= calc_burst_beats(mult_len_q, mult_src_addr);
            end
          end else if (state == S_LOAD_BIAS) begin
            if (shift_len_q != 0) begin
              src_cur        <= shift_src_addr;
              dst_cur        <= shift_dst_addr;
              bytes_rem      <= shift_len_q;
              beats_in_burst <= calc_burst_beats(shift_len_q, shift_src_addr);
            end else if (mult_len_q != 0) begin
              src_cur        <= mult_src_addr;
              dst_cur        <= mult_dst_addr;
              bytes_rem      <= mult_len_q;
              beats_in_burst <= calc_burst_beats(mult_len_q, mult_src_addr);
            end
          end else if (state == S_LOAD_SHIFT) begin
            if (mult_len_q != 0) begin
              src_cur        <= mult_src_addr;
              dst_cur        <= mult_dst_addr;
              bytes_rem      <= mult_len_q;
              beats_in_burst <= calc_burst_beats(mult_len_q, mult_src_addr);
            end
          end
        end
      end

      // Write-Back: SRAM lesen und WDATA füllen
      sram_out_re <= 1'b0;
      if (state == S_WB) begin
        if (!wb_have_word && (wb_bytes_rem != 0)) begin
          sram_out_re    <= 1'b1;
          sram_out_raddr <= wb_sram_addr;
          wb_wdata_hold[8*wb_byte_idx +: 8] <= sram_out_rdata;
          wb_sram_addr   <= wb_sram_addr + 1;
          if (wb_bytes_rem > 0) wb_bytes_rem <= wb_bytes_rem - 1;

          if (wb_byte_idx == BYTES_PER_BEAT-1 || wb_bytes_rem == 1) begin
            wb_byte_idx  <= 0;
            wb_have_word <= 1'b1;
          end else begin
            wb_byte_idx  <= wb_byte_idx + 1;
          end
        end

        if (M_AXI_WVALID && M_AXI_WREADY) begin
          wb_have_word <= 1'b0;
          wb_beat_cnt  <= wb_beat_cnt + 1;
        end
      end else begin
        sram_out_re <= 1'b0;
      end
    end
  end

endmodule
