// axi4_lite_slave.sv
`timescale 1ns/1ps
import packages_of_config_regis::*;

module axi4_lite_slave #(
  parameter int ADDR_W       = 12,
  parameter int DATA_W       = 32,
  parameter int P_CSR_ADDR_W = CSR_ADDR_W   // kommt aus packages_of_config_regis
)(
  input  logic                    ACLK,
  input  logic                    ARESET,

  // Write Address
  input  logic [ADDR_W-1:0]       S_AWADDR,
  input  logic [2:0]              S_AWPROT,
  input  logic                    S_AWVALID,
  output logic                    S_AWREADY,

  // Write Data
  input  logic [DATA_W-1:0]       S_WDATA,
  input  logic [DATA_W/8-1:0]     S_WSTRB,
  input  logic                    S_WVALID,
  output logic                    S_WREADY,

  // Write Response
  output logic [1:0]              S_BRESP,
  output logic                    S_BVALID,
  input  logic                    S_BREADY,

  // Read Address
  input  logic [ADDR_W-1:0]       S_ARADDR,
  input  logic [2:0]              S_ARPROT,
  input  logic                    S_ARVALID,
  output logic                    S_ARREADY,

  // Read Data
  output logic [DATA_W-1:0]       S_RDATA,
  output logic [1:0]              S_RRESP,
  output logic                    S_RVALID,
  input  logic                    S_RREADY,

  // MMIO (BYTE-adressiert)
  output logic                    mmio_wr_en,
  output logic [P_CSR_ADDR_W-1:0] mmio_wr_addr,
  output logic [DATA_W-1:0]       mmio_wr_data,
  output logic [DATA_W/8-1:0]     mmio_wr_strb,

  output logic                    mmio_rd_en,
  output logic [P_CSR_ADDR_W-1:0] mmio_rd_addr,
  input  logic [DATA_W-1:0]       mmio_rd_data
);

  // WRITE
  typedef enum logic [2:0] {S_RESET_W, W_IDLE, WRITE_CHANNEL, WRESP_CHANNEL} wstate_e;
  wstate_e wstate;

  assign S_AWREADY = (wstate == WRITE_CHANNEL);
  assign S_WREADY  = (wstate == WRITE_CHANNEL);

  always_ff @(posedge ACLK or posedge ARESET) begin
    if (ARESET) begin
      wstate        <= S_RESET_W;
      mmio_wr_en    <= 1'b0;
      mmio_wr_addr  <= '0;
      mmio_wr_data  <= '0;
      mmio_wr_strb  <= '0;
      S_BRESP       <= 2'b00;
      S_BVALID      <= 1'b0;
    end else begin
      mmio_wr_en <= 1'b0;

      unique case (wstate)
        S_RESET_W: begin
          if (!ARESET) wstate <= W_IDLE;
        end

        W_IDLE: begin
          if (S_AWVALID) wstate <= WRITE_CHANNEL;
        end

        WRITE_CHANNEL: begin
          if (S_AWVALID && S_AWREADY && S_WVALID && S_WREADY) begin
            mmio_wr_en    <= 1'b1;
            // BYTE-adressiert: keine Wort-Umrechnung mehr
            mmio_wr_addr  <= S_AWADDR[P_CSR_ADDR_W-1:0];
            mmio_wr_data  <= S_WDATA;
            mmio_wr_strb  <= S_WSTRB;

            S_BRESP       <= 2'b00;
            S_BVALID      <= 1'b1;
            wstate        <= WRESP_CHANNEL;
          end
        end

        WRESP_CHANNEL: begin
          if (S_BVALID && S_BREADY) begin
            S_BVALID <= 1'b0;
            wstate   <= W_IDLE;
          end
        end

        default: wstate <= W_IDLE;
      endcase
    end
  end

  // READ (mit 2 Wartezyl.)
  typedef enum logic [2:0] {S_RESET_R, R_IDLE, R_ADDR, R_WAIT1, R_WAIT2, R_DATA} rstate_e;
  rstate_e rstate;

  assign S_ARREADY = (rstate == R_ADDR);

  always_ff @(posedge ACLK or posedge ARESET) begin
    if (ARESET) begin
      rstate       <= S_RESET_R;
      mmio_rd_en   <= 1'b0;
      mmio_rd_addr <= '0;
      S_RDATA      <= '0;
      S_RRESP      <= 2'b00;
      S_RVALID     <= 1'b0;
    end else begin
      mmio_rd_en <= 1'b0;

      unique case (rstate)
        S_RESET_R: begin
          if (!ARESET) rstate <= R_IDLE;
        end

        R_IDLE: begin
          if (S_ARVALID) rstate <= R_ADDR;
        end

        R_ADDR: begin
          if (S_ARVALID && S_ARREADY) begin
            // BYTE-adressiert: keine Wort-Umrechnung mehr
            mmio_rd_en   <= 1'b1;
            mmio_rd_addr <= S_ARADDR[P_CSR_ADDR_W-1:0];
            rstate       <= R_WAIT1;
          end
        end

        R_WAIT1: rstate <= R_WAIT2; // N+1
        R_WAIT2: rstate <= R_DATA;  // N+2

        R_DATA: begin               // N+3
          if (!S_RVALID) begin
            S_RDATA  <= mmio_rd_data;
            S_RRESP  <= 2'b00;
            S_RVALID <= 1'b1;
          end else if (S_RVALID && S_RREADY) begin
            S_RVALID <= 1'b0;
            rstate   <= R_IDLE;
          end
        end

        default: rstate <= R_IDLE;
      endcase
    end
  end

endmodule
