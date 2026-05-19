`timescale 1ns/1ps
import packages_of_config_regis::*;

module csr_regfile #(
    parameter int P_CSR_ADDR_W = CSR_ADDR_W   // BYTE-Adressbreite
)(
    input  logic                    clk,
    input  logic                    reset,

    // MMIO-Schnittstelle (BYTE-adressiert)
    input  logic                    wr_en,
    input  logic [P_CSR_ADDR_W-1:0] wr_addr,
    input  logic [31:0]             wr_data,
    input  logic [3:0]              wr_strb,

    input  logic                    rd_en,
    input  logic [P_CSR_ADDR_W-1:0] rd_addr,
    output logic [31:0]             rd_data,

    // CONTROL/CFG.' Top (start/auto_en entfernt)
    output logic                    ctrl_relu_en,
    output logic                    ctrl_pool_en,
    output logic                    ctrl_dw_en,
    output logic                    ctrl_pool_max_not_avg,
    output logic                    ctrl_pw_en,              // NEW: Pointwise Enable

    output logic [15:0]             cfg_in_h,
    output logic [15:0]             cfg_in_w,
    output logic [15:0]             cfg_cin,
    output logic [15:0]             cfg_cout,
    output logic [15:0]             cfg_kh,
    output logic [15:0]             cfg_kw,
    output logic [15:0]             cfg_sh,
    output logic [15:0]             cfg_sw,
    output logic [15:0]             cfg_tile_r,
    output logic [15:0]             cfg_tile_c,

    // Derived/Runtime-Infos (RW-Register, werden vom TB/CPU geschrieben)
    output logic [15:0]             cfg_out_h,
    output logic [15:0]             cfg_out_w,
    output logic [31:0]             total_wins,
    output logic [31:0]             total_grps,
    output logic [31:0]             total_blks,
    output logic [31:0]             cfg_num_ctx,

    // NEW: Padding Register (CSR_CFG_PAD0 @ 0x7C)
    // [7:0]   pad_left
    // [15:8]  pad_right
    // [23:16] pad_top
    // [31:24] pad_bottom
    output logic [31:0]             cfg_pad0,

    // NEW: PW needed beats (CSR_PW_NEEDED_BEATS @ 0x80) (READ-ONLY)
    // [15:0]  = needed_beats_pw
    // [31:16] = 0
    // Wird extern berechnet (Top/FSM) und hier nur auslesbar gemacht.
    input  logic [15:0]             pw_needed_beats,

    // DMA Parameter
    output logic [31:0]             dma_in_src,
    output logic [31:0]             dma_in_dst,
    output logic [31:0]             dma_in_len,

    output logic [31:0]             dma_wg_src,
    output logic [31:0]             dma_wg_dst,
    output logic [31:0]             dma_wg_len,

    output logic [31:0]             dma_out_src,
    output logic [31:0]             dma_out_dst,
    output logic [31:0]             dma_out_len,

    output logic [31:0]             dma_bias_src,
    output logic [31:0]             dma_bias_dst,
    output logic [31:0]             dma_bias_len,

    output logic [31:0]             dma_shift_src,
    output logic [31:0]             dma_shift_dst,
    output logic [31:0]             dma_shift_len,
    output logic [31:0]             dma_mult_src,
    output logic [31:0]             dma_mult_dst,
    output logic [31:0]             dma_mult_len,

    // DMA START-Pulses (GO umbenannt)
    output logic                    dma_in_start,
    output logic                    dma_wg_start,
    output logic                    dma_out_start,

    // WB / Bank
    output logic                    wb_enable,
    output logic                    cfg_read_bank_sel,
    output logic                    cfg_write_bank_sel
);

    // Register
    logic [31:0] r_control;
    logic [31:0] r_cfg_in0;
    logic [31:0] r_cfg_in1;
    logic [31:0] r_cfg_k;
    logic [31:0] r_cfg_stride;
    logic [31:0] r_cfg_tile;

    // Derived (RW)
    logic [31:0] r_cfg_out0;
    logic [31:0] r_total_wins;
    logic [31:0] r_total_grps;
    logic [31:0] r_total_blks;
    logic [31:0] r_cfg_num_ctx;

    // NEW: PAD
    logic [31:0] r_cfg_pad0;

    logic [31:0] r_dma_in_src;
    logic [31:0] r_dma_in_dst;
    logic [31:0] r_dma_in_len;

    logic [31:0] r_dma_wg_src;
    logic [31:0] r_dma_wg_dst;
    logic [31:0] r_dma_wg_len;

    logic [31:0] r_dma_out_src;
    logic [31:0] r_dma_out_dst;
    logic [31:0] r_dma_out_len;

    logic [31:0] r_dma_bias_src;
    logic [31:0] r_dma_bias_dst;
    logic [31:0] r_dma_bias_len;

    logic [31:0] r_dma_shift_src;
    logic [31:0] r_dma_shift_dst;
    logic [31:0] r_dma_shift_len;

    logic [31:0] r_dma_mult_src;
    logic [31:0] r_dma_mult_dst;
    logic [31:0] r_dma_mult_len;

    logic [31:0] r_wb_enable;
    logic [31:0] r_bank_ctrl;

    // Puls-Detektoren
    logic dma_in_start_int;
    logic dma_wg_start_int;
    logic dma_out_start_int;

    integer i;

    // Write-Logik
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            r_control      <= 32'h0000_0000;
            r_cfg_in0      <= 32'h0000_0000;
            r_cfg_in1      <= 32'h0000_0000;
            r_cfg_k        <= 32'h0000_0000;
            r_cfg_stride   <= 32'h0000_0000;
            r_cfg_tile     <= 32'h0000_0000;

            // Derived RW reset
            r_cfg_out0     <= 32'h0000_0000;
            r_total_wins   <= 32'h0000_0000;
            r_total_grps   <= 32'h0000_0000;
            r_total_blks   <= 32'h0000_0000;
            r_cfg_num_ctx  <= 32'h0000_0000;

            // NEW: PAD reset
            r_cfg_pad0     <= 32'h0000_0000;

            r_dma_in_src   <= 32'h0000_0000;
            r_dma_in_dst   <= 32'h0000_0000;
            r_dma_in_len   <= 32'h0000_0000;

            r_dma_wg_src   <= 32'h0000_0000;
            r_dma_wg_dst   <= 32'h0000_0000;
            r_dma_wg_len   <= 32'h0000_0000;

            r_dma_out_src  <= 32'h0000_0000;
            r_dma_out_dst  <= 32'h0000_0000;
            r_dma_out_len  <= 32'h0000_0000;

            r_dma_bias_src <= 32'h0000_0000;
            r_dma_bias_dst <= 32'h0000_0000;
            r_dma_bias_len <= 32'h0000_0000;

            r_dma_shift_src<= 32'h0000_0000;
            r_dma_shift_dst<= 32'h0000_0000;
            r_dma_shift_len<= 32'h0000_0000;

            r_dma_mult_src <= 32'h0000_0000;
            r_dma_mult_dst <= 32'h0000_0000;
            r_dma_mult_len <= 32'h0000_0000;

            r_wb_enable    <= 32'h0000_0000;
            r_bank_ctrl    <= 32'h0000_0000;
        end else begin
            if (wr_en) begin
                unique case (wr_addr)

                    // CONTROL: bit0..4 (relu/pool/dw/pool_max/pw)
                    CSR_CONTROL: begin
                        if (wr_strb[0]) begin
                            r_control[4:0] <= wr_data[4:0];
                        end
                    end

                    CSR_CFG_IN0: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_cfg_in0[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end

                    CSR_CFG_IN1: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_cfg_in1[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end

                    CSR_CFG_K: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_cfg_k[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end

                    CSR_CFG_STRIDE: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_cfg_stride[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end

                    CSR_CFG_TILE: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_cfg_tile[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end

                    // Derived (RW) - TB/CPU schreibt diese Werte
                    CSR_CFG_OUT0: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_cfg_out0[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end
                    CSR_TOTAL_WINS: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_total_wins[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end
                    CSR_TOTAL_GRPS: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_total_grps[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end
                    CSR_TOTAL_BLKS: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_total_blks[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end
                    CSR_CFG_NUM_CTX: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_cfg_num_ctx[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end

                    // NEW: PAD (RW)
                    CSR_CFG_PAD0: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_cfg_pad0[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end

                    // DMA IN
                    CSR_DMA_IN_SRC: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_dma_in_src[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end
                    CSR_DMA_IN_DST: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_dma_in_dst[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end
                    CSR_DMA_IN_LEN: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_dma_in_len[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end

                    // DMA WG
                    CSR_DMA_WG_SRC: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_dma_wg_src[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end
                    CSR_DMA_WG_DST: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_dma_wg_dst[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end
                    CSR_DMA_WG_LEN: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_dma_wg_len[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end

                    // DMA OUT
                    CSR_DMA_OUT_SRC: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_dma_out_src[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end
                    CSR_DMA_OUT_DST: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_dma_out_dst[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end
                    CSR_DMA_OUT_LEN: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_dma_out_len[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end

                    // DMA BIAS
                    CSR_DMA_BIAS_SRC: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_dma_bias_src[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end
                    CSR_DMA_BIAS_DST: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_dma_bias_dst[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end
                    CSR_DMA_BIAS_LEN: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_dma_bias_len[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end

                    // DMA SHIFT
                    CSR_DMA_SHIFT_SRC: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_dma_shift_src[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end
                    CSR_DMA_SHIFT_DST: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_dma_shift_dst[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end
                    CSR_DMA_SHIFT_LEN: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_dma_shift_len[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end

                    // DMA MULT
                    CSR_DMA_MULT_SRC: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_dma_mult_src[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end
                    CSR_DMA_MULT_DST: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_dma_mult_dst[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end
                    CSR_DMA_MULT_LEN: begin
                        for (i = 0; i < 4; i = i + 1)
                            if (wr_strb[i]) r_dma_mult_len[i*8 +: 8] <= wr_data[i*8 +: 8];
                    end

                    // WB / BANK
                    CSR_WB_ENABLE: begin
                        if (wr_strb[0]) r_wb_enable[0] <= wr_data[0];
                    end
                    CSR_BANK_CTRL: begin
                        if (wr_strb[0]) r_bank_ctrl[1:0] <= wr_data[1:0];
                    end

                    // START-Register: NICHT speichern, nur Pulse (write-1)
                    CSR_DMA_IN_START:  begin end
                    CSR_DMA_WG_START:  begin end
                    CSR_DMA_OUT_START: begin end

                    // CSR_PW_NEEDED_BEATS: READ-ONLY -> absichtlich kein Write-Case

                    default: begin
                        // nichts
                    end
                endcase
            end
        end
    end

    // START-Puls-Outputs
    assign dma_in_start_int  = (wr_en && (wr_addr == CSR_DMA_IN_START)  && wr_strb[0] && wr_data[0]);
    assign dma_wg_start_int  = (wr_en && (wr_addr == CSR_DMA_WG_START)  && wr_strb[0] && wr_data[0]);
    assign dma_out_start_int = (wr_en && (wr_addr == CSR_DMA_OUT_START) && wr_strb[0] && wr_data[0]);

    assign dma_in_start  = dma_in_start_int;
    assign dma_wg_start  = dma_wg_start_int;
    assign dma_out_start = dma_out_start_int;

    // Register.' Outputs
    assign ctrl_relu_en          = r_control[0];
    assign ctrl_pool_en          = r_control[1];
    assign ctrl_dw_en            = r_control[2];
    assign ctrl_pool_max_not_avg = r_control[3];
    assign ctrl_pw_en            = r_control[4]; // NEW

    assign cfg_in_h   = r_cfg_in0[15:0];
    assign cfg_in_w   = r_cfg_in0[31:16];

    assign cfg_cin    = r_cfg_in1[15:0];
    assign cfg_cout   = r_cfg_in1[31:16];

    assign cfg_kh     = r_cfg_k[15:0];
    assign cfg_kw     = r_cfg_k[31:16];

    assign cfg_sh     = r_cfg_stride[15:0];
    assign cfg_sw     = r_cfg_stride[31:16];

    assign cfg_tile_r = r_cfg_tile[15:0];
    assign cfg_tile_c = r_cfg_tile[31:16];

    // Derived outputs aus RW-Registern
    assign cfg_out_h   = r_cfg_out0[15:0];
    assign cfg_out_w   = r_cfg_out0[31:16];
    assign total_wins  = r_total_wins;
    assign total_grps  = r_total_grps;
    assign total_blks  = r_total_blks;
    assign cfg_num_ctx = r_cfg_num_ctx;

    // NEW: PAD output
    assign cfg_pad0    = r_cfg_pad0;

    assign dma_in_src    = r_dma_in_src;
    assign dma_in_dst    = r_dma_in_dst;
    assign dma_in_len    = r_dma_in_len;

    assign dma_wg_src    = r_dma_wg_src;
    assign dma_wg_dst    = r_dma_wg_dst;
    assign dma_wg_len    = r_dma_wg_len;

    assign dma_out_src   = r_dma_out_src;
    assign dma_out_dst   = r_dma_out_dst;
    assign dma_out_len   = r_dma_out_len;

    assign dma_bias_src  = r_dma_bias_src;
    assign dma_bias_dst  = r_dma_bias_dst;
    assign dma_bias_len  = r_dma_bias_len;

    assign dma_shift_src = r_dma_shift_src;
    assign dma_shift_dst = r_dma_shift_dst;
    assign dma_shift_len = r_dma_shift_len;

    assign dma_mult_src  = r_dma_mult_src;
    assign dma_mult_dst  = r_dma_mult_dst;
    assign dma_mult_len  = r_dma_mult_len;

    assign wb_enable          = r_wb_enable[0];
    assign cfg_read_bank_sel  = r_bank_ctrl[0];
    assign cfg_write_bank_sel = r_bank_ctrl[1];

    // Read-Mux
    always_comb begin
        rd_data = 32'h0000_0000;

        if (rd_en) begin
            unique case (rd_addr)

                CSR_CONTROL: begin
                    rd_data[4:0] = r_control[4:0];
                end

                CSR_CFG_IN0:      rd_data = r_cfg_in0;
                CSR_CFG_IN1:      rd_data = r_cfg_in1;
                CSR_CFG_K:        rd_data = r_cfg_k;
                CSR_CFG_STRIDE:   rd_data = r_cfg_stride;
                CSR_CFG_TILE:     rd_data = r_cfg_tile;

                // Derived/Runtime (RW jetzt)
                CSR_CFG_OUT0:     rd_data = r_cfg_out0;
                CSR_TOTAL_WINS:   rd_data = r_total_wins;
                CSR_TOTAL_GRPS:   rd_data = r_total_grps;
                CSR_TOTAL_BLKS:   rd_data = r_total_blks;
                CSR_CFG_NUM_CTX:  rd_data = r_cfg_num_ctx;

                // NEW: PAD readback
                CSR_CFG_PAD0:     rd_data = r_cfg_pad0;

                // NEW: PW needed beats (read-only)
                CSR_PW_NEEDED_BEATS: rd_data = {16'd0, pw_needed_beats};

                // DMA regs
                CSR_DMA_IN_SRC:    rd_data = r_dma_in_src;
                CSR_DMA_IN_DST:    rd_data = r_dma_in_dst;
                CSR_DMA_IN_LEN:    rd_data = r_dma_in_len;

                CSR_DMA_WG_SRC:    rd_data = r_dma_wg_src;
                CSR_DMA_WG_DST:    rd_data = r_dma_wg_dst;
                CSR_DMA_WG_LEN:    rd_data = r_dma_wg_len;

                CSR_DMA_OUT_SRC:   rd_data = r_dma_out_src;
                CSR_DMA_OUT_DST:   rd_data = r_dma_out_dst;
                CSR_DMA_OUT_LEN:   rd_data = r_dma_out_len;

                CSR_DMA_BIAS_SRC:  rd_data = r_dma_bias_src;
                CSR_DMA_BIAS_DST:  rd_data = r_dma_bias_dst;
                CSR_DMA_BIAS_LEN:  rd_data = r_dma_bias_len;

                CSR_DMA_SHIFT_SRC: rd_data = r_dma_shift_src;
                CSR_DMA_SHIFT_DST: rd_data = r_dma_shift_dst;
                CSR_DMA_SHIFT_LEN: rd_data = r_dma_shift_len;
                CSR_DMA_MULT_SRC:  rd_data = r_dma_mult_src;
                CSR_DMA_MULT_DST:  rd_data = r_dma_mult_dst;
                CSR_DMA_MULT_LEN:  rd_data = r_dma_mult_len;

                CSR_WB_ENABLE:     rd_data = r_wb_enable;
                CSR_BANK_CTRL:     rd_data = r_bank_ctrl;

                // START regs: nur write-1 pulse, read->0
                CSR_DMA_IN_START:  rd_data = 32'h0000_0000;
                CSR_DMA_WG_START:  rd_data = 32'h0000_0000;
                CSR_DMA_OUT_START: rd_data = 32'h0000_0000;

                default: rd_data = 32'h0000_0000;
            endcase
        end
    end

endmodule
