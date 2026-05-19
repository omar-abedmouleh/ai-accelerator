`timescale 1ns/1ps

module arithmetic_controller #(
  // reine Laufzeitsteuerung, keine Feature-Parameter nötig
) (
  input  logic clk,
  input  logic reset,

  // Startquellen
  input  logic start_ctrl,       // 1-Takt-Puls aus CSR oder Fetcher
  input  logic auto_en,          // CONTROL.auto (1 => Auto-Start bei DMA done)
  input  logic dma_done_pulse,   // 1-Takt-Puls aus DMA-Status (fertig)

  // Laufzeit-Features aus CSR
  input  logic relu_on,          // CONTROL.relu

  // Handshakes aus den Pipelines
  input  logic arithmetic_done,  // Arithmetik fertig (ein Tile / eine Gruppe)
  input  logic relu_done,        // ReLU (falls aktiv) fertig

  // Enable/Puls nach au�Yen
  //
  //  - arithmetic_en ist ein 1-Takt-Startpuls im LETZTEN IDLE-Zyklus.
  //    -> Das arithmetic_module setzt daraus intern "running".
  //    -> Der erste MAC-Schritt (mac_start=1 in den PEs)
  //       passiert einen Takt SP�"TER, im ersten vollen S_ARITHMETIC-Zyklus.
  //
  //  - Das erste gültige Array (Aktivierungen/Gewichte) muss
  //    genau in dem Takt anliegen, in dem mac_start in den PEs=1 ist,
  //    also EINEN Takt nach dem �obergang nach S_ARITHMETIC.
  //
  output logic arithmetic_en,      // 1-Takt-Startpuls, wenn von S_IDLE nach S_ARITHMETIC gewechselt wird
  output logic relu_en,            // Level während Arithmetik-Phase (wenn relu_on=1)

  // Status
  output logic accelerator_busy,
  output logic accelerator_is_done

);

  // State-Typ
  typedef enum logic [2:0] {
    S_RESET       = 3'd0,
    S_IDLE        = 3'd1,
    S_ARITHMETIC  = 3'd2,
    S_DONE        = 3'd3
  } state_t;

  state_t state, state_n;

  // Start-Flankenerkennung
  logic start_q;

  // Start-Logik (Flankenerkennung)
  always_ff @(posedge clk or posedge reset) begin
    if (reset)
      start_q <= 1'b0;
    else
      start_q <= start_ctrl;
  end

  // Start nur in IDLE zulassen
  wire start_edge_idl = (state == S_IDLE) && (start_ctrl && !start_q);
  wire auto_start_idl = (state == S_IDLE) && auto_en && dma_done_pulse;

  // Effektiver Start (nur in IDLE wirksam)
  wire eff_start = start_edge_idl | auto_start_idl;

  // State-Register
  always_ff @(posedge clk or posedge reset) begin
    if (reset)
      state <= S_RESET;
    else
      state <= state_n;
  end



  // Outputs (Level)
  always_comb begin
    // Busy in Arithmetik-Phase
    accelerator_busy = (state == S_ARITHMETIC);

    // relu_en: während Arithmetik-Phase, wenn aktiv
    relu_en    = (state == S_ARITHMETIC) && relu_on;

    // Done-Level: genau dann high, wenn FSM in S_DONE steht
    accelerator_is_done = (state == S_DONE);
  end

  // Next-State + arithmetic_en-Puls
  always_comb begin
    state_n       = state;
    arithmetic_en = 1'b0;   // default: kein Puls

    unique case (state)
      S_RESET: begin
        // nach Reset sofort in IDLE (reset-Signal selbst
        // hält die FFs asynchron in diesem Zustand)
        state_n = S_IDLE;
      end

      S_IDLE: begin
        if (eff_start) begin
          //    arithmetic_en = 1 -> Startpuls fuer arithmetic_module
          //  - NAECHSTER Zyklus: state = S_ARITHMETIC,
          //    running im arithmetic_module = 1,
          //    erster gültiger MAC (mac_start) im
          //    ERSTEN S_ARITHMETIC-Zyklus mit DANN anliegenden Daten.
          state_n       = S_ARITHMETIC;
          arithmetic_en = 1'b1;  // 1-Takt-Puls im letzten IDLE-Zyklus
        end
        // sonst in IDLE bleiben
      end

      S_ARITHMETIC: begin
        if (relu_on) begin
          if (arithmetic_done && relu_done) begin
            state_n = S_DONE;
          end
        end
        else begin
          if (arithmetic_done) begin
            state_n = S_DONE;
          end
        end
      end

      S_DONE: begin
        // 1 oder mehrere Takte möglich; danach zurück nach IDLE
        state_n = S_IDLE;
      end

      default: state_n = S_IDLE;
    endcase
  end

endmodule
