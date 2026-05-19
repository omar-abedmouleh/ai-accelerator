`timescale 1ns/1ps

module fetching_module #(
    parameter int IMG_W_MAX   = 130,
    parameter int IMG_H_MAX   = 130,
    parameter int CH_MAX      = 1024,
    parameter int LANES_MAX   = 4,
    parameter int COLS_MAX    = 4,
    parameter int CO_MAX      = 1024,
    parameter int PXW         = 8,
    parameter int ADDR_W      = 21,
    parameter int WIN_SIZE    = 3,

    // NEW: Max Beats für PW (runtime kommt von CSR/Top, hier nur clamp)
    parameter int BEATS_MAX   = 256,

    parameter int OUT_W_MAX_VALID = 64,
    parameter int OUT_H_MAX_VALID = 64,

    parameter int TOTAL_WINS_MAX  = 4096,
    parameter int TOTAL_GRPS_MAX  = 4096,
    parameter int TOTAL_BLKS_MAX  = 256,
    parameter int NUM_CTX_MAX     = 256
)(
    input  logic                            clk,
    input  logic                            reset,
    input  logic                            start,
    input  logic                            dw_mode,

// PW Mode (1x1 / Pointwise)
    input  logic                            pw_mode,

    // ORIGINAL input dims (OHNE Padding)
    input  logic [15:0]                     cfg_in_w,
    input  logic [15:0]                     cfg_in_h,

    // Padding (wie in feature_bank)
    input  logic [7:0]                      cfg_pad_left,
    input  logic [7:0]                      cfg_pad_right,
    input  logic [7:0]                      cfg_pad_top,
    input  logic [7:0]                      cfg_pad_bottom,

    input  logic [15:0]                     cfg_cin,
    input  logic [15:0]                     cfg_cout,
    input  logic [15:0]                     cfg_kw,
    input  logic [15:0]                     cfg_kh,
    input  logic [15:0]                     cfg_sw,
    input  logic [15:0]                     cfg_sh,
    input  logic [15:0]                     cfg_tile_r,
    input  logic [15:0]                     cfg_tile_c,

    input  logic [15:0]                     cfg_out_w,
    input  logic [15:0]                     cfg_out_h,
    input  logic [31:0]                     total_wins,
    input  logic [31:0]                     total_grps,
    input  logic [31:0]                     total_blks,
    input  logic [31:0]                     cfg_num_ctx,

    input  logic                            px_valid,
    input  logic [LANES_MAX-1:0][PXW-1:0]   px_in_lane,
    output logic                            px_ready,

    // Puls zum Restart des Feature-Bank Streams (Scan / Blockwechsel)
    output logic                            ifmap_restart,

    output logic                            sram_re,
    output logic [ADDR_W-1:0]               sram_raddr,
    input  logic [COLS_MAX*8-1:0]           sram_rdata,
    input  logic                            sram_rvalid,

    input  logic [ADDR_W-1:0]               base_addr,
    input  logic                            acc_done,

    output logic                            bs_ren,
    output logic [ADDR_W-1:0]               bs_raddr,
    input  logic signed [31:0]              bs_bias_cols  [0:COLS_MAX-1],
    input  logic        [31:0]              bs_shift_cols [0:COLS_MAX-1],
    input  logic                            bs_rvalid,

    output logic                            stream_valid,
    output logic signed  [LANES_MAX-1:0][PXW-1:0]   ifmap_array,
    output logic signed [COLS_MAX-1:0][7:0] weight_array,

    output logic                            start_acc,

    output logic                            done_all,
    output logic [15:0]                     dbg_blk_idx,
    output logic [15:0]                     dbg_grp_idx,
    output logic [15:0]                     dbg_ctx_idx,
    output logic [15:0]                     ifmap_ch_base,

    // NEW: PW-Beats kommen von SW/CSR (keine Berechnung hier!)
    input  logic [15:0]                     pw_needed_beats
);

    // Physisch instanziert: nur LANES_MAX Buffer/RAMs
    localparam int CH_BUF_MAX = LANES_MAX;

    localparam int NUM_PIX   = WIN_SIZE*WIN_SIZE;
    localparam int WINBITS   = NUM_PIX*PXW;
    localparam int PACKBITS  = LANES_MAX*WINBITS;

    localparam int CTX_W     = (NUM_CTX_MAX  > 1) ? $clog2(NUM_CTX_MAX)  : 1;
    localparam int WIN_IDX_W = (TOTAL_WINS_MAX > 1) ? $clog2(TOTAL_WINS_MAX+1) : 1;
    localparam int GRP_W     = (TOTAL_GRPS_MAX > 1) ? $clog2(TOTAL_GRPS_MAX) : 1;
    localparam int BLK_W     = (TOTAL_BLKS_MAX  > 1) ? $clog2(TOTAL_BLKS_MAX) : 1;

    localparam int PIXSEL_W  = (NUM_PIX > 1) ? $clog2(NUM_PIX) : 1;

    localparam int CH_LG     = (CH_MAX > 1) ? $clog2(CH_MAX) : 1;
    localparam int BUF_LG    = (CH_BUF_MAX > 1) ? $clog2(CH_BUF_MAX) : 1;
    localparam int PX_SHIFT  = (PXW > 1) ? $clog2(PXW) : 1;
    localparam int BYTE_LG   = (COLS_MAX > 1) ? $clog2(COLS_MAX) : 1;
    localparam int LANES_LG  = (LANES_MAX > 1) ? $clog2(LANES_MAX) : 1;

    // PW: Buffer für "Beats" aus FeatureBank (S_SCAN sammelt, STREAM nutzt seriell)
    // compile-time max beats = ceil(CH_MAX / LANES_MAX)
    localparam int PW_BEATS_MAX = (CH_MAX + LANES_MAX - 1) / LANES_MAX;
    localparam int PW_BEAT_W    = (PW_BEATS_MAX > 1) ? $clog2(PW_BEATS_MAX) : 1;

    logic signed [PW_BEATS_MAX-1:0][LANES_MAX-1:0][PXW-1:0] pw_act_buf;
    logic signed [PW_BEATS_MAX-1:0][LANES_MAX-1:0][PXW-1:0] pw_act_buf_n;

    logic [PW_BEAT_W-1:0] pw_beat, pw_beat_n;
    logic                 pw_buf_full, pw_buf_full_n;

    // runtime beats (aus pw_needed_beats, nur clamp)
    logic [PW_BEAT_W-1:0] pw_beats_need;

    // Padding -> effective dims (padded frame)
    logic [15:0] pad_l16, pad_r16, pad_t16, pad_b16;
    logic [15:0] in_w_eff, in_h_eff;

    always_comb begin
        pad_l16 = {8'd0, cfg_pad_left};
        pad_r16 = {8'd0, cfg_pad_right};
        pad_t16 = {8'd0, cfg_pad_top};
        pad_b16 = {8'd0, cfg_pad_bottom};

        in_w_eff = cfg_in_w + pad_l16 + pad_r16;
        in_h_eff = cfg_in_h + pad_t16 + pad_b16;

        if (in_w_eff == 16'd0) in_w_eff = 16'd1;
        if (in_h_eff == 16'd0) in_h_eff = 16'd1;

        if (in_w_eff > IMG_W_MAX[15:0]) in_w_eff = IMG_W_MAX[15:0];
        if (in_h_eff > IMG_H_MAX[15:0]) in_h_eff = IMG_H_MAX[15:0];
    end

    // Safe defaults
    logic [15:0] sw_safe, sh_safe;
    logic [15:0] tile_r_safe, tile_c_safe;
    logic [15:0] cin_safe, cout_safe;
    logic [15:0] in_w_safe, in_h_safe;

    always_comb begin
        sw_safe     = (cfg_sw     == 16'd0) ? 16'd1 : cfg_sw;
        sh_safe     = (cfg_sh     == 16'd0) ? 16'd1 : cfg_sh;

        tile_r_safe = (cfg_tile_r == 16'd0) ? 16'd1 : cfg_tile_r;
        if (tile_r_safe > LANES_MAX[15:0]) tile_r_safe = LANES_MAX[15:0];

        tile_c_safe = (cfg_tile_c == 16'd0) ? 16'd1 : cfg_tile_c;

        cin_safe    = (cfg_cin    == 16'd0) ? 16'd1 : cfg_cin;
        if (cin_safe > CH_MAX[15:0]) cin_safe = CH_MAX[15:0];

        cout_safe   = (cfg_cout   == 16'd0) ? 16'd1 : cfg_cout;

        in_w_safe   = in_w_eff;
        in_h_safe   = in_h_eff;
    end

    logic px_valid_c;
    always_comb begin
        px_valid_c = (px_valid === 1'b1);
    end

    // run-mode flags
    logic               dw_mode_c;
    logic               dw_mode_run;
    logic               pw_mode_c;
    logic               pw_mode_run;

    // SW-derived clamp
    logic [31:0] total_wins_c, total_grps_c, total_blks_c;
    logic [CTX_W-1:0] num_ctx_cur;

    always_comb begin
        total_wins_c = (total_wins == 32'd0) ? 32'd1 : total_wins;
        if (total_wins_c > TOTAL_WINS_MAX[31:0]) total_wins_c = TOTAL_WINS_MAX[31:0];

        total_grps_c = (total_grps == 32'd0) ? 32'd1 : total_grps;
        if (total_grps_c > TOTAL_GRPS_MAX[31:0]) total_grps_c = TOTAL_GRPS_MAX[31:0];

        total_blks_c = (total_blks == 32'd0) ? 32'd1 : total_blks;
        if (total_blks_c > TOTAL_BLKS_MAX[31:0]) total_blks_c = TOTAL_BLKS_MAX[31:0];

        if (cfg_num_ctx == 32'd0) num_ctx_cur = {{(CTX_W-1){1'b0}}, 1'b1};
        else begin
            num_ctx_cur = cfg_num_ctx[CTX_W-1:0];
            if (cfg_num_ctx > NUM_CTX_MAX[31:0])
                num_ctx_cur = NUM_CTX_MAX[CTX_W-1:0];
        end
    end

    // PW: Beats kommt von oben; Contexts weiterhin aus cfg_cin (wie bisher)
    integer pw_cin_i;
    integer pw_tmp;
    logic [CTX_W-1:0] num_ctx_pw;

    always_comb begin
        // num_ctx_pw = cin (clamped)
        pw_cin_i = integer'(cin_safe);
        if (pw_cin_i <= 0) pw_cin_i = 1;
        if (pw_cin_i > CH_MAX) pw_cin_i = CH_MAX;

        if (pw_cin_i > NUM_CTX_MAX) pw_cin_i = NUM_CTX_MAX;
        num_ctx_pw = pw_cin_i[CTX_W-1:0];
        if (num_ctx_pw == '0) num_ctx_pw = {{(CTX_W-1){1'b0}}, 1'b1};

        // pw_beats_need = pw_needed_beats (nur clamp)
        pw_tmp = integer'(pw_needed_beats);
        if (pw_tmp <= 0) pw_tmp = 1;

        if (pw_tmp > BEATS_MAX)    pw_tmp = BEATS_MAX;
        if (pw_tmp > PW_BEATS_MAX) pw_tmp = PW_BEATS_MAX;

        pw_beats_need = pw_tmp[PW_BEAT_W-1:0];
    end

    // Debug indices
    logic [GRP_W-1:0]     grp_idx, grp_idx_n;
    logic [BLK_W-1:0]     blk_idx, blk_idx_n;
    logic [CTX_W-1:0]     ctx_issue, ctx_issue_n;
    logic [CTX_W-1:0]     ctx_out,   ctx_out_n;
    logic [WIN_IDX_W-1:0] win_cnt, win_cnt_n;

    logic [CTX_W-1:0]     ctx_cap, ctx_cap_n;

    assign dbg_blk_idx = {{(16-BLK_W){1'b0}}, blk_idx};
    assign dbg_grp_idx = {{(16-GRP_W){1'b0}}, grp_idx};
    assign dbg_ctx_idx = {{(16-CTX_W){1'b0}}, ctx_out};

    // Weight unpack + PW pipeline weight regs
    logic signed [COLS_MAX-1:0][7:0] weight_from_sram;

    integer wi;
    always_comb begin
        for (wi = 0; wi < COLS_MAX; wi = wi + 1)
            weight_from_sram[wi] = sram_rdata[8*wi +: 8];
    end

    logic signed [PXW-1:0]           pw_px_q;
    logic                            pw_ok_q;
    logic                            pw_first_q;
    logic signed [COLS_MAX-1:0][7:0] pw_wgt_q;

    always_comb begin
        if (pw_mode_run)
            weight_array = pw_wgt_q;
        else
            weight_array = weight_from_sram;
    end

    // Linebuffers (nur CH_BUF_MAX Instanzen)
    logic scan_enter_raw;
    logic scan_enter_eff;
    logic lb_reset;

    logic [CH_BUF_MAX-1:0][PXW-1:0] lb_px_in;
    logic lb_win_valid [0:CH_BUF_MAX-1];
    logic [WINBITS-1:0] lb_win_out [0:CH_BUF_MAX-1];

    logic px_fire_all;
    logic px_fire_lb;

    assign px_fire_all = px_valid_c && px_ready;
    assign px_fire_lb  = px_fire_all && !pw_mode_run;

    // CFG PIPE
    logic [15:0] cfg_sw_lat;
    logic [15:0] cfg_in_w_lat;

    logic [15:0] lb_stride_cfg;
    logic [15:0] lb_imgw_cfg;

    always_comb begin
        lb_stride_cfg = (cfg_sw_lat   == 16'd0) ? 16'd1 : cfg_sw_lat;
        lb_imgw_cfg   = (cfg_in_w_lat == 16'd0) ? 16'd1 : cfg_in_w_lat;

        if (lb_imgw_cfg > IMG_W_MAX[15:0])
            lb_imgw_cfg = IMG_W_MAX[15:0];
    end

    genvar gi_lb;
    generate
        for (gi_lb = 0; gi_lb < CH_BUF_MAX; gi_lb = gi_lb + 1) begin : GEN_LB
            line_buffer_3x3 #(
                .IMG_WIDTH_MAX(IMG_W_MAX),
                .WIN_SIZE     (WIN_SIZE)
            ) u_lb3x3 (
                .clk        (clk),
                .reset      (lb_reset),
                .cfg_img_w  (lb_imgw_cfg),
                .cfg_stride (lb_stride_cfg[1:0]),
                .px_valid   (px_fire_lb),
                .px_in      (lb_px_in[gi_lb]),
                .win_valid  (lb_win_valid[gi_lb]),
                .win_out    (lb_win_out[gi_lb])
            );
        end
    endgenerate

    // Window-RAMs
    logic                     scan_we_word;
    logic [WIN_IDX_W-1:0]      scan_waddr_word;
    logic [PACKBITS-1:0]       scan_wdata_word [0:CH_BUF_MAX-1];

    logic                     win_ren_ch   [0:CH_BUF_MAX-1];
    logic [WIN_IDX_W-1:0]      win_raddr_ch [0:CH_BUF_MAX-1];
    logic [PACKBITS-1:0]       win_rdata_ch [0:CH_BUF_MAX-1];

    genvar gc;
    generate
        for (gc = 0; gc < CH_BUF_MAX; gc = gc + 1) begin : GEN_WINRAM_CH
            win_ram_1w1r #(
                .AW (WIN_IDX_W),
                .DW (PACKBITS)
            ) u_winram (
                .clk   (clk),
                .we    (scan_we_word),
                .waddr (scan_waddr_word),
                .wdata (scan_wdata_word[gc]),
                .ren   (win_ren_ch[gc]),
                .raddr (win_raddr_ch[gc]),
                .rdata (win_rdata_ch[gc])
            );
        end
    endgenerate

    // FSM
    typedef enum logic [3:0] {
        S_RESET                 = 4'd0,
        S_IDLE                  = 4'd1,
        S_SCAN                  = 4'd2,
        S_LOAD_BIAS_SHIFT       = 4'd3,
        S_STREAM_AND_ARITHMETIC = 4'd4,
        S_WAIT_FOR_ACC_DONE     = 4'd5,
        S_NEXT_GROUP_BLOCK      = 4'd6,
        S_DONE                  = 4'd7
    } state_t;

    state_t state, state_n;

    logic [LANES_LG-1:0]       scan_lane, scan_lane_n;
    logic [WIN_IDX_W-1:0]      scan_grp_addr, scan_grp_addr_n;
    logic [PACKBITS-1:0]       scan_pack_buf   [0:CH_BUF_MAX-1];
    logic [PACKBITS-1:0]       scan_pack_buf_n [0:CH_BUF_MAX-1];

    logic [WIN_IDX_W-1:0]      dw_word_addr, dw_word_addr_n;
    logic [LANES_LG-1:0]       dw_lane_sel,  dw_lane_sel_n;

    logic bias_loaded, bias_loaded_n;

    logic sram_re_n;
    logic [ADDR_W-1:0] sram_raddr_n;

    logic bs_ren_n;
    logic [ADDR_W-1:0] bs_raddr_n;

    logic weight_ok_stream;

    logic stream_fire_eff;
    logic first_fire_eff;

    logic group_done_pulse;
    logic last_group;
    logic last_block;

    // GRP_LIMIT / SCAN_LIMIT latched
    logic [GRP_W-1:0]     grp_lim_start;
    logic [GRP_W-1:0]     grp_lim_run;

    logic [WIN_IDX_W-1:0] scan_lim_start;
    logic [WIN_IDX_W-1:0] scan_lim_run;

    logic [31:0] scan_words_32;

    // ifmap_restart: PW pulse NUR bei Start oder Blockwechsel
    logic ifmap_restart_pw_q;
    logic pw_restart_req_n;

    // Hot-path counters
    logic [PIXSEL_W-1:0] pix_sel,   pix_sel_n;
    logic [BUF_LG-1:0]   chan_sel,  chan_sel_n;

    logic [PIXSEL_W-1:0] pix_sel_i,  pix_sel_i_n;
    logic [BUF_LG-1:0]   chan_sel_i, chan_sel_i_n;

    logic [CH_LG-1:0] pw_ch_sel,   pw_ch_sel_n;
    logic [CH_LG-1:0] pw_ch_sel_i, pw_ch_sel_i_n;

    logic [ADDR_W-1:0] waddr_cur, waddr_cur_n;

    logic [15:0] blk_ch_base, blk_ch_base_n;

    integer lane_i;
    integer bit_index_int;
    integer bi_map;
    integer c_sel;
    integer cc;

    logic scan_fire_lb;
    logic scan_fire_pad;
    logic scan_fire;
    logic commit_word;

    logic done_all_reg;
    assign done_all = done_all_reg;

    // cin_eff
    logic [15:0] cin_eff;
    always_comb begin
        if (dw_mode_run) begin
            cin_eff = cin_safe;
        end else if (pw_mode_run) begin
            cin_eff = tile_r_safe; // bleibt wie vorher (nur LB/Scan relevant, PW nutzt Buffer)
        end else begin
            cin_eff = cin_safe;
            if (cin_eff > tile_r_safe) cin_eff = tile_r_safe;
        end
    end

    // LB input mapping
    always_comb begin
        for (bi_map = 0; bi_map < CH_BUF_MAX; bi_map = bi_map + 1) begin
            if (bi_map < LANES_MAX)
                lb_px_in[bi_map] = px_in_lane[bi_map];
            else
                lb_px_in[bi_map] = '0;
        end
    end

    // scan_enter / lb_reset / ifmap_restart
    assign scan_enter_raw = (state != S_SCAN) && (state_n == S_SCAN);
    assign scan_enter_eff = scan_enter_raw && !pw_mode_run;
    assign lb_reset       = reset | scan_enter_eff;

    // FINAL ifmap_restart: non-PW uses scan_enter_eff, PW uses registered pulse
    assign ifmap_restart  = scan_enter_eff | ifmap_restart_pw_q;

    // ifmap_ch_base
    logic [15:0] ifmap_ch_base_eff;
    always_comb begin
        ifmap_ch_base_eff = 16'd0;

        if (dw_mode_run || pw_mode_run) begin
            ifmap_ch_base_eff = blk_ch_base;
            if (scan_enter_eff) ifmap_ch_base_eff = blk_ch_base_n;
        end
    end
    assign ifmap_ch_base = ifmap_ch_base_eff;

    // grp_lim / scan_lim start
    always_comb begin
        dw_mode_c = (dw_mode === 1'b1);
        pw_mode_c = (pw_mode === 1'b1);

        if (dw_mode_c || pw_mode_c) grp_lim_start = total_wins_c[GRP_W-1:0];
        else                        grp_lim_start = total_grps_c[GRP_W-1:0];
        if (grp_lim_start == '0) grp_lim_start = {{(GRP_W-1){1'b0}}, 1'b1};

        if (dw_mode_c) begin
            // DW:
            scan_words_32 = total_wins_c>>2;
            if (scan_words_32 == 32'd0) scan_words_32 = 32'd1;
            if (scan_words_32 > TOTAL_WINS_MAX[31:0]) scan_words_32 = TOTAL_WINS_MAX[31:0];



            scan_lim_start = scan_words_32[WIN_IDX_W-1:0];
            if (scan_lim_start == '0) scan_lim_start = {{(WIN_IDX_W-1){1'b0}}, 1'b1};
        end else begin
            scan_words_32 = total_grps;
            if (scan_words_32 == 32'd0) scan_words_32 = 32'd1;
            if (scan_words_32 > TOTAL_GRPS_MAX[31:0]) scan_words_32 = TOTAL_GRPS_MAX[31:0];

            scan_lim_start = total_grps_c[WIN_IDX_W-1:0];
            if (scan_lim_start == '0) scan_lim_start = {{(WIN_IDX_W-1){1'b0}}, 1'b1};
        end
    end

    // Combinational FSM
    always_comb begin
        state_n         = state;
        win_cnt_n       = win_cnt;
        grp_idx_n       = grp_idx;
        blk_idx_n       = blk_idx;
        ctx_issue_n     = ctx_issue;
        ctx_out_n       = ctx_out;
        ctx_cap_n       = ctx_cap;

        bias_loaded_n   = bias_loaded;

        sram_re_n       = 1'b0;
        sram_raddr_n    = sram_raddr;

        bs_ren_n        = 1'b0;
        bs_raddr_n      = bs_raddr;

        scan_we_word       = 1'b0;
        scan_waddr_word    = scan_grp_addr;
        scan_lane_n        = scan_lane;
        scan_grp_addr_n    = scan_grp_addr;

        for (c_sel = 0; c_sel < CH_BUF_MAX; c_sel = c_sel + 1) begin
            scan_pack_buf_n[c_sel]  = scan_pack_buf[c_sel];
            scan_wdata_word[c_sel]  = '0;
        end

        dw_word_addr_n   = dw_word_addr;
        dw_lane_sel_n    = dw_lane_sel;

        px_ready        = 1'b0;

        stream_valid    = 1'b0;
        start_acc       = 1'b0;

        pix_sel_n       = pix_sel;
        chan_sel_n      = chan_sel;

        pix_sel_i_n     = pix_sel_i;
        chan_sel_i_n    = chan_sel_i;

        pw_ch_sel_n     = pw_ch_sel;
        pw_ch_sel_i_n   = pw_ch_sel_i;

        waddr_cur_n     = waddr_cur;

        blk_ch_base_n   = blk_ch_base;

        pw_beat_n      = pw_beat;
        pw_buf_full_n  = pw_buf_full;
        pw_act_buf_n   = pw_act_buf;

        // PW restart req: default 0
        pw_restart_req_n = 1'b0;

        for (lane_i = 0; lane_i < LANES_MAX; lane_i = lane_i + 1)
            ifmap_array[lane_i] = '0;

        for (c_sel = 0; c_sel < CH_BUF_MAX; c_sel = c_sel + 1) begin
            win_ren_ch[c_sel]   = 1'b0;
            win_raddr_ch[c_sel] = '0;
        end

        weight_ok_stream = (state == S_STREAM_AND_ARITHMETIC) && sram_rvalid;

        stream_fire_eff = (pw_mode_run) ? pw_ok_q : weight_ok_stream;
        first_fire_eff  = (pw_mode_run) ? pw_first_q
                                        : ((state == S_STREAM_AND_ARITHMETIC) && sram_rvalid && (ctx_out == '0));

        // group_done: PW basiert auf cin (=num_ctx_pw)
        if (pw_mode_run)
            group_done_pulse = stream_fire_eff && (ctx_out == (num_ctx_pw - 1'b1));
        else
            group_done_pulse = stream_fire_eff && (ctx_out == (num_ctx_cur - 1'b1));

        last_group = (grp_idx == (grp_lim_run - 1'b1));
        last_block = (blk_idx == (total_blks_c[BLK_W-1:0] - 1'b1));

        scan_fire_lb  = 1'b0;
        scan_fire_pad = 1'b0;
        scan_fire     = 1'b0;
        commit_word   = 1'b0;

        case (state)
            S_RESET: begin
                bias_loaded_n  = 1'b0;
                state_n        = S_IDLE;
            end

            S_IDLE: begin
                if (start) begin
                    state_n        = S_SCAN;
                    win_cnt_n      = '0;
                    grp_idx_n      = '0;
                    blk_idx_n      = '0;
                    ctx_issue_n    = '0;
                    ctx_out_n      = '0;
                    ctx_cap_n      = '0;
                    bias_loaded_n  = 1'b0;

                    pix_sel_n      = '0;
                    chan_sel_n     = '0;

                    pix_sel_i_n    = '0;
                    chan_sel_i_n   = '0;

                    pw_ch_sel_n    = '0;
                    pw_ch_sel_i_n  = '0;

                    blk_ch_base_n  = 16'd0;

                    waddr_cur_n    = base_addr + {{(ADDR_W-BLK_W){1'b0}}, '0};

                    scan_lane_n     = '0;
                    scan_grp_addr_n = '0;
                    for (c_sel = 0; c_sel < CH_BUF_MAX; c_sel = c_sel + 1)
                        scan_pack_buf_n[c_sel] = '0;

                    dw_word_addr_n  = '0;
                    dw_lane_sel_n   = '0;

                    pw_beat_n     = '0;
                    pw_buf_full_n = 1'b0;

                    // PW: restart FeatureBank NUR am Anfang
                    if (pw_mode_c)
                        pw_restart_req_n = 1'b1;
                end
            end

            S_SCAN: begin
                if (pw_mode_run) begin
                    px_ready = (pw_buf_full == 1'b0);

                    if (px_fire_all) begin
                        for (lane_i = 0; lane_i < LANES_MAX; lane_i = lane_i + 1)
                            pw_act_buf_n[pw_beat][lane_i] = px_in_lane[lane_i];

                        if (pw_beat == (pw_beats_need - 1'b1)) begin
                            pw_buf_full_n = 1'b1;
                            pw_beat_n     = '0;

                            if (!bias_loaded)
                                state_n = S_LOAD_BIAS_SHIFT;
                            else
                                state_n = S_STREAM_AND_ARITHMETIC;

                            ctx_issue_n = '0;
                            ctx_out_n   = '0;
                            ctx_cap_n   = '0;

                            pw_ch_sel_n   = '0;
                            pw_ch_sel_i_n = '0;

                            waddr_cur_n   = base_addr + {{(ADDR_W-BLK_W){1'b0}}, blk_idx};
                        end else begin
                            pw_beat_n = pw_beat + 1'b1;
                        end
                    end
                end else begin
                    px_ready = 1'b1;

                    scan_fire_lb  = (lb_win_valid[0] === 1'b1) &&
                                    (win_cnt < total_wins_c[WIN_IDX_W-1:0]);

                    scan_fire_pad = (win_cnt >= total_wins_c[WIN_IDX_W-1:0]) &&
                                    (scan_grp_addr < scan_lim_run);

                    scan_fire = scan_fire_lb || scan_fire_pad;

                    if (scan_fire) begin
                        if (scan_fire_lb) begin
                            for (c_sel = 0; c_sel < CH_BUF_MAX; c_sel = c_sel + 1) begin
                                if (c_sel < tile_r_safe) begin
                                    if (dw_mode_run) begin
                                        if ((blk_ch_base + c_sel) < cin_safe) begin
                                            scan_pack_buf_n[c_sel][(scan_lane*WINBITS) +: WINBITS] = lb_win_out[c_sel];
                                        end
                                    end else begin
                                        if (c_sel < cin_eff) begin
                                            scan_pack_buf_n[c_sel][(scan_lane*WINBITS) +: WINBITS] = lb_win_out[c_sel];
                                        end
                                    end
                                end
                            end
                            win_cnt_n = win_cnt + 1'b1;
                        end

                        if (scan_lane == (tile_r_safe[LANES_LG-1:0] - 1'b1))
                            commit_word = 1'b1;
                        else if (scan_fire_lb && (win_cnt == (total_wins_c[WIN_IDX_W-1:0] - 1'b1)))
                            commit_word = 1'b1;

                        if (commit_word) begin
                            scan_we_word    = 1'b1;
                            scan_waddr_word = scan_grp_addr;

                            for (c_sel = 0; c_sel < CH_BUF_MAX; c_sel = c_sel + 1)
                                scan_wdata_word[c_sel] = scan_pack_buf_n[c_sel];

                            scan_grp_addr_n = scan_grp_addr + 1'b1;
                            scan_lane_n     = '0;

                            for (c_sel = 0; c_sel < CH_BUF_MAX; c_sel = c_sel + 1)
                                scan_pack_buf_n[c_sel] = '0;
                        end else begin
                            scan_lane_n = scan_lane + 1'b1;
                        end
                    end

                    if (scan_grp_addr_n == scan_lim_run) begin
                        state_n        = S_LOAD_BIAS_SHIFT;

                        grp_idx_n      = '0;
                        ctx_issue_n    = '0;
                        ctx_out_n      = '0;
                        ctx_cap_n      = '0;
                        bias_loaded_n  = 1'b0;

                        pix_sel_n      = '0;
                        chan_sel_n     = '0;

                        pix_sel_i_n    = '0;
                        chan_sel_i_n   = '0;

                        waddr_cur_n    = base_addr + {{(ADDR_W-BLK_W){1'b0}}, blk_idx};

                        dw_word_addr_n = '0;
                        dw_lane_sel_n  = '0;
                    end
                end
            end

            S_LOAD_BIAS_SHIFT: begin
                if (!bias_loaded) begin
                    bs_ren_n   = 1'b1;
                    bs_raddr_n = {{(ADDR_W-BLK_W){1'b0}}, blk_idx};

                    if (bs_rvalid) begin
                        bias_loaded_n = 1'b1;
                        bs_ren_n      = 1'b0;

                        state_n       = S_STREAM_AND_ARITHMETIC;

                        ctx_issue_n   = '0;
                        ctx_out_n     = '0;
                        ctx_cap_n     = '0;

                        pix_sel_n     = '0;
                        chan_sel_n    = '0;

                        pix_sel_i_n   = '0;
                        chan_sel_i_n  = '0;

                        pw_ch_sel_n   = '0;
                        pw_ch_sel_i_n = '0;

                        waddr_cur_n   = base_addr + {{(ADDR_W-BLK_W){1'b0}}, blk_idx};
                    end
                end else begin
                    state_n = S_STREAM_AND_ARITHMETIC;
                end
            end

            S_STREAM_AND_ARITHMETIC: begin
                // ctx_issue limit: PW -> num_ctx_pw (=cin), sonst num_ctx_cur
                if (pw_mode_run) begin
                    if (ctx_issue < num_ctx_pw) begin
                        sram_re_n    = 1'b1;
                        sram_raddr_n = (waddr_cur << BYTE_LG);

                        waddr_cur_n  = waddr_cur + total_blks_c[ADDR_W-1:0];
                        ctx_issue_n  = ctx_issue + 1'b1;

                        pix_sel_i_n   = '0;
                        chan_sel_i_n  = '0;
                        pw_ch_sel_i_n = '0;
                    end
                end else begin
                    if (ctx_issue < num_ctx_cur) begin
                        sram_re_n    = 1'b1;
                        sram_raddr_n = (waddr_cur << BYTE_LG);

                        waddr_cur_n  = waddr_cur + total_blks_c[ADDR_W-1:0];
                        ctx_issue_n  = ctx_issue + 1'b1;

                        if (!dw_mode_run) begin
                            win_ren_ch[chan_sel_i]   = 1'b1;
                            win_raddr_ch[chan_sel_i] = {{(WIN_IDX_W-GRP_W){1'b0}}, grp_idx};
                        end else begin
                            for (lane_i = 0; lane_i < CH_BUF_MAX; lane_i = lane_i + 1) begin
                                if (lane_i < tile_r_safe) begin
                                    if ((blk_ch_base + lane_i) < cin_safe) begin
                                        win_ren_ch[lane_i]   = 1'b1;
                                        win_raddr_ch[lane_i] = dw_word_addr;
                                    end
                                end
                            end
                        end

                        if (!dw_mode_run) begin
                            if (pix_sel_i == (NUM_PIX-1)) begin
                                pix_sel_i_n = '0;
                                if (chan_sel_i < (cin_eff[BUF_LG-1:0] - 1'b1))
                                    chan_sel_i_n = chan_sel_i + 1'b1;
                                else
                                    chan_sel_i_n = chan_sel_i;
                            end else begin
                                pix_sel_i_n  = pix_sel_i + 1'b1;
                                chan_sel_i_n = chan_sel_i;
                            end
                        end else begin
                            if (pix_sel_i == (NUM_PIX-1))
                                pix_sel_i_n = '0;
                            else
                                pix_sel_i_n = pix_sel_i + 1'b1;
                            chan_sel_i_n = '0;
                        end
                    end
                end

                if (weight_ok_stream) begin
                    // PW: ctx_cap zählt bis cin-1 (num_ctx_pw-1)
                    if (pw_mode_run) begin
                        if (ctx_cap < (num_ctx_pw - 1'b1))
                            ctx_cap_n = ctx_cap + 1'b1;
                    end

                    if (!pw_mode_run) begin
                        if (!dw_mode_run) begin
                            if (pix_sel == (NUM_PIX-1)) begin
                                pix_sel_n = '0;
                                if (chan_sel < (cin_eff[BUF_LG-1:0] - 1'b1))
                                    chan_sel_n = chan_sel + 1'b1;
                                else
                                    chan_sel_n = chan_sel;
                            end else begin
                                pix_sel_n  = pix_sel + 1'b1;
                                chan_sel_n = chan_sel;
                            end
                        end else begin
                            if (pix_sel == (NUM_PIX-1))
                                pix_sel_n = '0;
                            else
                                pix_sel_n = pix_sel + 1'b1;
                            chan_sel_n = '0;
                        end
                    end else begin
                        pix_sel_n   = '0;
                        chan_sel_n  = '0;
                        pw_ch_sel_n = '0;
                    end
                end

                if (stream_fire_eff) begin
                    stream_valid = 1'b1;

                    bit_index_int = (pix_sel) << PX_SHIFT;

                    if (pw_mode_run) begin
                        ifmap_array[0] = pw_px_q;
                    end else if (!dw_mode_run) begin
                        for (lane_i = 0; lane_i < LANES_MAX; lane_i = lane_i + 1) begin
                            if (lane_i < tile_r_safe) begin
                                ifmap_array[lane_i] =
                                    win_rdata_ch[chan_sel][(lane_i*WINBITS) + bit_index_int +: PXW];
                            end
                        end
                    end else begin
                        for (lane_i = 0; lane_i < LANES_MAX; lane_i = lane_i + 1) begin
                            if (lane_i < tile_r_safe) begin
                                if ((blk_ch_base + lane_i) < cin_safe) begin
                                    ifmap_array[lane_i] =
                                        win_rdata_ch[lane_i][(dw_lane_sel*WINBITS) + bit_index_int +: PXW];
                                end
                            end
                        end
                    end

                    // ctx_out limit: PW -> num_ctx_pw, sonst num_ctx_cur
                    if (pw_mode_run) begin
                        if (ctx_out < (num_ctx_pw - 1'b1))
                            ctx_out_n = ctx_out + 1'b1;
                    end else begin
                        if (ctx_out < (num_ctx_cur - 1'b1))
                            ctx_out_n = ctx_out + 1'b1;
                    end
                end

                if (!dw_mode_run) begin
                    if (first_fire_eff) start_acc = 1'b1;
                end else begin
                    if (sram_re) start_acc = 1'b1;
                end

                if (group_done_pulse)
                    state_n = S_WAIT_FOR_ACC_DONE;
            end

            S_WAIT_FOR_ACC_DONE: begin
                if (acc_done) begin
                    if (last_block && last_group)
                        state_n = S_DONE;
                    else
                        state_n = S_NEXT_GROUP_BLOCK;
                end
            end

            S_NEXT_GROUP_BLOCK: begin
                ctx_issue_n  = '0;
                ctx_out_n    = '0;
                ctx_cap_n    = '0;

                pix_sel_n    = '0;
                chan_sel_n   = '0;

                pix_sel_i_n  = '0;
                chan_sel_i_n = '0;

                pw_ch_sel_n   = '0;
                pw_ch_sel_i_n = '0;

                pw_beat_n     = '0;
                pw_buf_full_n = 1'b0;

                if (last_group) begin
                    blk_idx_n      = blk_idx + 1'b1;
                    grp_idx_n      = '0;
                    bias_loaded_n  = 1'b0;

                    if (dw_mode_run) begin
                        blk_ch_base_n   = blk_ch_base + tile_r_safe;
                        state_n         = S_SCAN;

                        win_cnt_n       = '0;
                        scan_lane_n     = '0;
                        scan_grp_addr_n = '0;
                        for (c_sel = 0; c_sel < CH_BUF_MAX; c_sel = c_sel + 1)
                            scan_pack_buf_n[c_sel] = '0;

                        dw_word_addr_n  = '0;
                        dw_lane_sel_n   = '0;

                        waddr_cur_n     = base_addr + {{(ADDR_W-BLK_W){1'b0}}, (blk_idx + 1'b1)};
                    end else if (pw_mode_run) begin
                        state_n      = S_SCAN;
                        waddr_cur_n  = base_addr + {{(ADDR_W-BLK_W){1'b0}}, (blk_idx + 1'b1)};

                        // PW: restart FeatureBank NUR beim Blockwechsel
                        pw_restart_req_n = 1'b1;
                    end else begin
                        state_n        = S_LOAD_BIAS_SHIFT;
                        waddr_cur_n    = base_addr + {{(ADDR_W-BLK_W){1'b0}}, (blk_idx + 1'b1)};
                        dw_word_addr_n = '0;
                        dw_lane_sel_n  = '0;
                    end
                end else begin
                    waddr_cur_n  = base_addr + {{(ADDR_W-BLK_W){1'b0}}, blk_idx};
                    grp_idx_n    = grp_idx + 1'b1;

                    if (dw_mode_run) begin
                        if (dw_lane_sel == (tile_r_safe[LANES_LG-1:0] - 1'b1)) begin
                            dw_lane_sel_n  = '0;
                            dw_word_addr_n = dw_word_addr + 1'b1;
                        end else begin
                            dw_lane_sel_n  = dw_lane_sel + 1'b1;
                            dw_word_addr_n = dw_word_addr;
                        end
                        state_n = S_STREAM_AND_ARITHMETIC;
                    end else if (pw_mode_run) begin
                        state_n = S_SCAN;
                    end else begin
                        state_n = S_STREAM_AND_ARITHMETIC;
                    end
                end
            end

            S_DONE: begin
                if (start) begin
                    state_n        = S_SCAN;
                    win_cnt_n      = '0;
                    grp_idx_n      = '0;
                    blk_idx_n      = '0;
                    ctx_issue_n    = '0;
                    ctx_out_n      = '0;
                    ctx_cap_n      = '0;
                    bias_loaded_n  = 1'b0;

                    pix_sel_n      = '0;
                    chan_sel_n     = '0;

                    pix_sel_i_n    = '0;
                    chan_sel_i_n   = '0;

                    pw_ch_sel_n    = '0;
                    pw_ch_sel_i_n  = '0;

                    blk_ch_base_n  = 16'd0;

                    waddr_cur_n    = base_addr + {{(ADDR_W-BLK_W){1'b0}}, '0};

                    scan_lane_n     = '0;
                    scan_grp_addr_n = '0;
                    for (c_sel = 0; c_sel < CH_BUF_MAX; c_sel = c_sel + 1)
                        scan_pack_buf_n[c_sel] = '0;

                    dw_word_addr_n  = '0;
                    dw_lane_sel_n   = '0;

                    pw_beat_n     = '0;
                    pw_buf_full_n = 1'b0;

                    // PW: restart FeatureBank nur bei neuem Start
                    if (pw_mode_c)
                        pw_restart_req_n = 1'b1;
                end else begin
                    state_n = S_IDLE;
                end
            end

            default: state_n = S_RESET;
        endcase
    end

    // Sequential
    integer act_beat_i;
    integer act_lane_i;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            state        <= S_RESET;
            win_cnt      <= '0;
            grp_idx      <= '0;
            blk_idx      <= '0;
            ctx_issue    <= '0;
            ctx_out      <= '0;
            ctx_cap      <= '0;

            sram_re      <= 1'b0;
            sram_raddr   <= '0;
            bs_ren       <= 1'b0;
            bs_raddr     <= '0;

            bias_loaded  <= 1'b0;

            pix_sel      <= '0;
            chan_sel     <= '0;

            pix_sel_i    <= '0;
            chan_sel_i   <= '0;

            pw_ch_sel    <= '0;
            pw_ch_sel_i  <= '0;

            waddr_cur    <= '0;
            blk_ch_base  <= 16'd0;

            scan_lane     <= '0;
            scan_grp_addr <= '0;
            for (cc = 0; cc < CH_BUF_MAX; cc = cc + 1)
                scan_pack_buf[cc] <= '0;

            dw_word_addr  <= '0;
            dw_lane_sel   <= '0;

            dw_mode_run   <= 1'b0;
            pw_mode_run   <= 1'b0;

            grp_lim_run   <= {{(GRP_W-1){1'b0}}, 1'b1};
            scan_lim_run  <= {{(WIN_IDX_W-1){1'b0}}, 1'b1};

            done_all_reg  <= 1'b0;

            cfg_sw_lat    <= 16'd1;
            cfg_in_w_lat  <= 16'd1;

            pw_px_q    <= '0;
            pw_ok_q    <= 1'b0;
            pw_first_q <= 1'b0;
            for (cc = 0; cc < COLS_MAX; cc = cc + 1)
                pw_wgt_q[cc] <= '0;

            pw_beat     <= '0;
            pw_buf_full <= 1'b0;
            for (act_beat_i = 0; act_beat_i < PW_BEATS_MAX; act_beat_i = act_beat_i + 1) begin
                for (act_lane_i = 0; act_lane_i < LANES_MAX; act_lane_i = act_lane_i + 1)
                    pw_act_buf[act_beat_i][act_lane_i] <= '0;
            end

            ifmap_restart_pw_q <= 1'b0;

        end else begin
            // PW ifmap_restart: pulse nur wenn req gesetzt (Start / Blockwechsel)
            ifmap_restart_pw_q <= 1'b0;
            if (pw_restart_req_n)
                ifmap_restart_pw_q <= 1'b1;

            // PW: Buffer register update (S_SCAN sammelt)
            pw_beat     <= pw_beat_n;
            pw_buf_full <= pw_buf_full_n;
            pw_act_buf  <= pw_act_buf_n;

            // PW pipeline capture (RAW sram_rvalid)
            if (pw_mode_run && (state == S_STREAM_AND_ARITHMETIC) && sram_rvalid) begin
                act_beat_i = integer'(ctx_cap) / LANES_MAX;
                act_lane_i = integer'(ctx_cap) % LANES_MAX;

                if (act_beat_i < 0) act_beat_i = 0;
                if (act_lane_i < 0) act_lane_i = 0;
                if (act_beat_i >= PW_BEATS_MAX) act_beat_i = PW_BEATS_MAX-1;
                if (act_lane_i >= LANES_MAX) act_lane_i = LANES_MAX-1;

                pw_px_q    <= pw_act_buf[act_beat_i][act_lane_i];
                pw_ok_q    <= 1'b1;
                pw_first_q <= (ctx_cap == '0);

                for (cc = 0; cc < COLS_MAX; cc = cc + 1)
                    pw_wgt_q[cc] <= sram_rdata[8*cc +: 8];
            end else begin
                pw_ok_q    <= 1'b0;
                pw_first_q <= 1'b0;
            end

// Latch LB config with padded width
            if (start || scan_enter_eff) begin
                cfg_sw_lat   <= cfg_sw;
                cfg_in_w_lat <= in_w_eff;
            end

            if (start) begin
                dw_mode_run  <= dw_mode_c;
                pw_mode_run  <= pw_mode_c;

                grp_lim_run  <= grp_lim_start;
                scan_lim_run <= scan_lim_start;
            end

            if (start)
                done_all_reg <= 1'b0;
            else if (state_n == S_DONE)
                done_all_reg <= 1'b1;

            state      <= state_n;
            win_cnt    <= win_cnt_n;
            grp_idx    <= grp_idx_n;
            blk_idx    <= blk_idx_n;
            ctx_issue  <= ctx_issue_n;
            ctx_out    <= ctx_out_n;
            ctx_cap    <= ctx_cap_n;

            sram_re    <= sram_re_n;
            sram_raddr <= sram_raddr_n;
            bs_ren     <= bs_ren_n;
            bs_raddr   <= bs_raddr_n;

            bias_loaded <= bias_loaded_n;

            pix_sel     <= pix_sel_n;
            chan_sel    <= chan_sel_n;

            pix_sel_i   <= pix_sel_i_n;
            chan_sel_i  <= chan_sel_i_n;

            pw_ch_sel   <= pw_ch_sel_n;
            pw_ch_sel_i <= pw_ch_sel_i_n;

            waddr_cur    <= waddr_cur_n;
            blk_ch_base  <= blk_ch_base_n;

            scan_lane     <= scan_lane_n;
            scan_grp_addr <= scan_grp_addr_n;
            for (cc = 0; cc < CH_BUF_MAX; cc = cc + 1)
                scan_pack_buf[cc] <= scan_pack_buf_n[cc];

            dw_word_addr  <= dw_word_addr_n;
            dw_lane_sel   <= dw_lane_sel_n;
        end
    end

endmodule
