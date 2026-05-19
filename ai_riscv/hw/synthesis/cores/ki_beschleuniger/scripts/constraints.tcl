set clock_port [get_ports clk]
set reset_port [get_ports reset]

# Desired default clock period for this design.
# Can be overridden via environment variable CLOCK_PERIOD.
set clock_period 600
if {[info exists ::env(CLOCK_PERIOD)] && $::env(CLOCK_PERIOD) ne ""} {
	set clock_period $::env(CLOCK_PERIOD)
}

# Keep the historical clock name "clock" used by this flow.
create_clock -name clock -period ${clock_period} ${clock_port}

# ASAP7 in this repo provides standard cells but no SRAM macros.
# If we let the tool synthesize large inferred memories, it typically
# explodes into flip-flops and can take extremely long (or appear to hang).
#
# Therefore: treat the RAM building blocks as black boxes for synthesis and
# exclude them from timing until proper SRAM macros/models are integrated.
set mem_cells [get_cells -hier -filter {
	ref_name =~ ram_1r1w_sync* ||
	ref_name =~ win_ram_1w1r* ||
	ref_name =~ ram_1r1w_sync_bytewrite_wide* ||
	ref_name =~ sram_weight*
}]
if {[sizeof_collection $mem_cells] > 0} {
	set_dont_touch $mem_cells
	set_disable_timing $mem_cells
	# Make paths through these memory macros false, so optimization/timing
	# analysis does not try to reason through unknown RAM/SRAM internals.
	set_false_path -through $mem_cells
}
