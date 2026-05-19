`timescale 1ns/1ps

module pooling_module #(
    parameter int FM_W_MAX    = 112,
    parameter int FM_H_MAX    = 112,
    parameter int FM_CH_MAX   = 16,
    parameter int OUT_W       = 8,
    parameter int POOL_STRIDE = 2
)(
    input  logic clk,
    input  logic reset,

    input  logic pool_enable,
    input  logic pool_use_max,

    input  logic [15:0] cfg_fm_w,
    input  logic [15:0] cfg_fm_h,
    input  logic [15:0] cfg_fm_ch,

    input  logic        start_pool,
    input  logic [15:0] stripe_y_in,

    input  logic signed [OUT_W-1:0] pool_line0 [0:FM_CH_MAX-1][0:FM_W_MAX-1],
    input  logic signed [OUT_W-1:0] pool_line1 [0:FM_CH_MAX-1][0:FM_W_MAX-1],

    output logic                         of_we,
    output logic [$clog2(FM_CH_MAX)-1:0] of_ch,
    output logic [$clog2(FM_W_MAX)-1:0]  of_x,
    output logic [$clog2(FM_H_MAX)-1:0]  of_y,
    output logic signed [OUT_W-1:0]      of_wdata,

    output logic pooling_busy,
    output logic pooling_done
);

    localparam int X_W_MAX  = (FM_W_MAX  > 1) ? $clog2(FM_W_MAX)  : 1;
    localparam int Y_W_MAX  = (FM_H_MAX  > 1) ? $clog2(FM_H_MAX)  : 1;
    localparam int CH_W_MAX = (FM_CH_MAX > 1) ? $clog2(FM_CH_MAX) : 1;

    typedef enum logic [1:0] { P_IDLE = 2'd0, P_RUN = 2'd1 } p_state_t;
    p_state_t state, state_n;

    logic [CH_W_MAX-1:0] ch_idx, ch_idx_n;
    logic [X_W_MAX-1:0]  x_idx,  x_idx_n;
    logic [Y_W_MAX-1:0]  y_out,  y_out_n;

    logic signed [OUT_W-1:0] v00_s, v01_s, v10_s, v11_s;
    logic signed [OUT_W-1:0] pooled_val_s;

    integer x0_int;
    integer x1_int;
    integer pool_w_rt;

    // y_out aus stripe_y_in
    always_comb begin
        y_out_n = y_out;
        if (start_pool) begin
            y_out_n = Y_W_MAX'(stripe_y_in >> 1);
        end
    end

    // runtime pool_w = fm_w/2, clamp auf MAX/2
    always_comb begin
        pool_w_rt = 0;
        if (cfg_fm_w >= POOL_STRIDE)
            pool_w_rt = cfg_fm_w / POOL_STRIDE;

        if (pool_w_rt > (FM_W_MAX/POOL_STRIDE))
            pool_w_rt = (FM_W_MAX/POOL_STRIDE);
    end

    // Fenster lesen
    always_comb begin
        x0_int = 0;
        x1_int = 0;

        v00_s  = '0;
        v01_s  = '0;
        v10_s  = '0;
        v11_s  = '0;

        if ((state == P_RUN) && pool_enable) begin
            x0_int = x_idx * POOL_STRIDE;
            x1_int = x0_int + 1;

            // zusätzlich physische bounds schützen
            if ((x1_int < FM_W_MAX) &&
                (x1_int < cfg_fm_w) &&
                (ch_idx < cfg_fm_ch)) begin
                v00_s = pool_line0[ch_idx][x0_int];
                v01_s = pool_line0[ch_idx][x1_int];
                v10_s = pool_line1[ch_idx][x0_int];
                v11_s = pool_line1[ch_idx][x1_int];
            end
        end
    end

    pooling_unit #(.DATA_W(OUT_W)) u_pool_unit (
        .v00        (v00_s),
        .v01        (v01_s),
        .v10        (v10_s),
        .v11        (v11_s),
        .use_max    (pool_use_max),
        .pooled_val (pooled_val_s)
    );

    // FSM comb
    always_comb begin
        state_n      = state;
        ch_idx_n     = ch_idx;
        x_idx_n      = x_idx;

        of_we        = 1'b0;
        of_ch        = ch_idx;
        of_x         = x_idx;
        of_y         = y_out;
        of_wdata     = pooled_val_s;

        pooling_done = 1'b0;

        case (state)
            P_IDLE: begin
                if (pool_enable && start_pool) begin
                    ch_idx_n = '0;
                    x_idx_n  = '0;
                    state_n  = P_RUN;
                end
            end

            P_RUN: begin
                if (pool_enable) begin

                    // --- Guard gegen Unterläufe / Degenerate cfg ---
                    if ((pool_w_rt <= 0) || (cfg_fm_ch == 16'd0)) begin
                        state_n      = P_IDLE;
                        pooling_done = 1'b1;
                    end
                    else begin
                        // gültig nur wenn innerhalb runtime bounds
                        if ((ch_idx < cfg_fm_ch) && (x_idx < pool_w_rt)) begin
                            of_we = 1'b1;
                        end

                        // x inkrement (pool_w_rt > 0 garantiert)
                        if (x_idx == (pool_w_rt - 1)) begin
                            x_idx_n = '0;

                            // ch inkrement (cfg_fm_ch > 0 garantiert)
                            if (ch_idx == (cfg_fm_ch - 1)) begin
                                ch_idx_n     = '0;
                                state_n      = P_IDLE;
                                pooling_done = 1'b1;
                            end
                            else begin
                                ch_idx_n = ch_idx + CH_W_MAX'(1);
                            end
                        end
                        else begin
                            x_idx_n = x_idx + X_W_MAX'(1);
                        end
                    end

                end
                else begin
                    state_n = P_IDLE;
                end
            end

            default: begin
                state_n = P_IDLE;
            end
        endcase
    end

    // FSM seq
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            state  <= P_IDLE;
            ch_idx <= '0;
            x_idx  <= '0;
            y_out  <= '0;
        end
        else begin
            state  <= state_n;
            ch_idx <= ch_idx_n;
            x_idx  <= x_idx_n;
            y_out  <= y_out_n;
        end
    end

    assign pooling_busy = (state == P_RUN);

endmodule
