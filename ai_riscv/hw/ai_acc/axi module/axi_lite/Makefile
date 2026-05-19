# Makefile for Icarus Verilog (SystemVerilog) simulation
# This replaces a previous Verilator+CPP harness so the SV testbench runs directly.
# Usage:
#   make sim      # build & run
#   make waves    # open gtkwave
#   make clean

TOP_SV      = axi4_lite_top.sv
TB_SV       = axi4_lite_top_tb.sv
SLAVE_SV    = axi4_lite_slave.sv
CSR_SV      = csr_regfile.sv
PKG_SV      = packages_of_config_regis.sv

SV_SRCS = $(TOP_SV) $(TB_SV) $(SLAVE_SV) $(CSR_SV) $(PKG_SV)

SIMV   = simv

.PHONY: sim
sim: $(SIMV)
	./$(SIMV)

$(SIMV): $(SV_SRCS)
	iverilog -g2012 -o $(SIMV) $(SV_SRCS)

.PHONY: waves
waves: waveform.vcd
	gtkwave waveform.vcd

waveform.vcd: $(SIMV)
	./$(SIMV)

.PHONY: clean
clean:
	rm -f $(SIMV) waveform.vcd
