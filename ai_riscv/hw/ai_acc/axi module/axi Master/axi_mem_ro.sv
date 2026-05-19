`timescale 1ns/1ps

module axi_mem_ro #(
  parameter int DATA_WIDTH = 32,          // 32-bit Beats
  parameter int ADDR_WIDTH = 24,          // Byte-Adressraum (2^24 = 16 MiB)
  parameter int ID_WIDTH   = 4,

  // Speicher-Layout
  parameter int IMG_BASE   = 'h0000_1000, // Bild-Startadresse (Byte)
  parameter int WGT_BASE   = 'h0008_0000, // Weights-Startadresse (Byte)
  parameter int BIAS_BASE  = 'h0010_0000, // Bias-Startadresse (Byte)
  parameter int SHIFT_BASE = 'h0018_0000, // Shift-Startadresse (Byte)
  parameter int MULT_BASE  = 'h0020_0000, // Mult-Startadresse (Byte)

  // Dateipfade (Windows: Backslashes escapen)
  parameter string IMG_FILE   = "",       // z.B. "C:\\path\\x_i8_int8_pot_sauria_same_pad.bin"
  parameter string WGT_FILE   = "",       // z.B. "C:\\path\\weights_int8_sauria.bin"
  parameter string BIAS_FILE  = "",       // z.B. "C:\\path\\bias_hw_int32.bin"
  parameter string SHIFT_FILE = "",       // z.B. "C:\\path\\requant_shift_int32.bin"
  parameter string MULT_FILE  = ""        // z.B. "C:\\path\\output_multiplier_int32.bin"
)(
  input  logic                    clk,
  input  logic                    reset,

  // AXI4 Read Address (Slave-Sicht: s_axi_*). Kann in TB auf 0 gelegt werden.
  input  logic [ID_WIDTH-1:0]     s_axi_arid,
  input  logic [ADDR_WIDTH-1:0]   s_axi_araddr,
  input  logic [7:0]              s_axi_arlen,
  input  logic [2:0]              s_axi_arsize,
  input  logic [1:0]              s_axi_arburst,
  input  logic                    s_axi_arvalid,
  output logic                    s_axi_arready,

  // AXI4 Read Data
  output logic [ID_WIDTH-1:0]     s_axi_rid,
  output logic [DATA_WIDTH-1:0]   s_axi_rdata,
  output logic [1:0]              s_axi_rresp,
  output logic                    s_axi_rlast,
  output logic                    s_axi_rvalid,
  input  logic                    s_axi_rready
);

  // Memory
  localparam int MEM_BYTES = (1<<ADDR_WIDTH);
  byte unsigned mem [0:MEM_BYTES-1];

  // Datei-Load
  integer fd;
  integer n;
  integer idx;
  integer ch;

  initial begin
    // Init mit 0
    for (idx = 0; idx < MEM_BYTES; idx = idx + 1) begin
      mem[idx] = 8'h00;
    end

    // IMG
    if (IMG_FILE != "") begin
      fd = $fopen(IMG_FILE, "rb");
      if (fd != 0) begin
        idx = IMG_BASE;
        while (!$feof(fd) && idx < MEM_BYTES) begin
          ch = $fgetc(fd);
          if (ch >= 0) mem[idx] = ch[7:0];
          idx = idx + 1;
        end
        $fclose(fd);
        $display("axi_mem_ro: IMG '%s' geladen ab 0x%08h (Bytes: %0d)", IMG_FILE, IMG_BASE, idx-IMG_BASE);
      end
      else begin
        $display("axi_mem_ro WARN: IMG_FILE '%s' konnte nicht geoeffnet werden.", IMG_FILE);
      end
    end

    // WGT
    if (WGT_FILE != "") begin
      fd = $fopen(WGT_FILE, "rb");
      if (fd != 0) begin
        idx = WGT_BASE;
        while (!$feof(fd) && idx < MEM_BYTES) begin
          ch = $fgetc(fd);
          if (ch >= 0) mem[idx] = ch[7:0];
          idx = idx + 1;
        end
        $fclose(fd);
        $display("axi_mem_ro: WGT '%s' geladen ab 0x%08h (Bytes: %0d)", WGT_FILE, WGT_BASE, idx-WGT_BASE);
      end
      else begin
        $display("axi_mem_ro WARN: WGT_FILE '%s' konnte nicht geoeffnet werden.", WGT_FILE);
      end
    end

    // BIAS
    if (BIAS_FILE != "") begin
      fd = $fopen(BIAS_FILE, "rb");
      if (fd != 0) begin
        idx = BIAS_BASE;
        while (!$feof(fd) && idx < MEM_BYTES) begin
          ch = $fgetc(fd);
          if (ch >= 0) mem[idx] = ch[7:0];
          idx = idx + 1;
        end
        $fclose(fd);
        $display("axi_mem_ro: BIAS '%s' geladen ab 0x%08h (Bytes: %0d)", BIAS_FILE, BIAS_BASE, idx-BIAS_BASE);
      end
      else begin
        $display("axi_mem_ro WARN: BIAS_FILE '%s' konnte nicht geoeffnet werden.", BIAS_FILE);
      end
    end

    // SHIFT
    if (SHIFT_FILE != "") begin
      fd = $fopen(SHIFT_FILE, "rb");
      if (fd != 0) begin
        idx = SHIFT_BASE;
        while (!$feof(fd) && idx < MEM_BYTES) begin
          ch = $fgetc(fd);
          if (ch >= 0) mem[idx] = ch[7:0];
          idx = idx + 1;
        end
        $fclose(fd);
        $display("axi_mem_ro: SHIFT '%s' geladen ab 0x%08h (Bytes: %0d)", SHIFT_FILE, SHIFT_BASE, idx-SHIFT_BASE);
      end
      else begin
        $display("axi_mem_ro WARN: SHIFT_FILE '%s' konnte nicht geoeffnet werden.", SHIFT_FILE);
      end
    end

    // MULT
    if (MULT_FILE != "") begin
      fd = $fopen(MULT_FILE, "rb");
      if (fd != 0) begin
        idx = MULT_BASE;
        while (!$feof(fd) && idx < MEM_BYTES) begin
          ch = $fgetc(fd);
          if (ch >= 0) mem[idx] = ch[7:0];
          idx = idx + 1;
        end
        $fclose(fd);
        $display("axi_mem_ro: MULT '%s' geladen ab 0x%08h (Bytes: %0d)", MULT_FILE, MULT_BASE, idx-MULT_BASE);
      end
      else begin
        $display("axi_mem_ro WARN: MULT_FILE '%s' konnte nicht geoeffnet werden.", MULT_FILE);
      end
    end
  end

  // AXI Read Engine (einfacher Stub)
  typedef enum logic [1:0] {S_RESET, IDLE, SEND} state_t;
  state_t state;

  logic [ID_WIDTH-1:0]   rid_q;
  logic [ADDR_WIDTH-1:0] addr_q;
  logic [8:0]            beats_left; // 1..256

  assign s_axi_arready = (state == IDLE);
  assign s_axi_rid     = rid_q;
  assign s_axi_rresp   = 2'b00;       // OKAY

  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      state        <= S_RESET;
      s_axi_rvalid <= 1'b0;
      s_axi_rlast  <= 1'b0;
      rid_q        <= '0;
      addr_q       <= '0;
      beats_left   <= '0;
      s_axi_rdata  <= '0;
    end
    else begin
      case (state)
        S_RESET: begin
          state <= IDLE;
        end

        IDLE: begin
          s_axi_rvalid <= 1'b0;
          s_axi_rlast  <= 1'b0;
          if (s_axi_arvalid && s_axi_arready) begin
            rid_q      <= s_axi_arid;
            addr_q     <= s_axi_araddr;
            beats_left <= s_axi_arlen + 1;
            state      <= SEND;
          end
        end

        SEND: begin
          if (!s_axi_rvalid || (s_axi_rvalid && s_axi_rready)) begin
            // 32-bit little-endian aus mem[addr_q + {0,1,2,3}]
            logic [7:0] b0;
            logic [7:0] b1;
            logic [7:0] b2;
            logic [7:0] b3;
            b0 = mem[addr_q + 0];
            b1 = mem[addr_q + 1];
            b2 = mem[addr_q + 2];
            b3 = mem[addr_q + 3];
            s_axi_rdata  <= {b3,b2,b1,b0};
            s_axi_rvalid <= 1'b1;
            s_axi_rlast  <= (beats_left == 1);

            addr_q      <= addr_q + (DATA_WIDTH/8);
            beats_left  <= beats_left - 1;
          end

          if (s_axi_rvalid && s_axi_rready && s_axi_rlast) begin
            s_axi_rvalid <= 1'b0;
            s_axi_rlast  <= 1'b0;
            state        <= IDLE;
          end
        end

        default: state <= IDLE;
      endcase
    end
  end

endmodule
