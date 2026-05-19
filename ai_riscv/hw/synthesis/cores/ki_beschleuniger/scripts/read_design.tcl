# Read HDL
#analyze -format sverilog [glob ${CORE_PATH}/rtl/*.sv]
#analyze -format sverilog [glob ${CORE_PATH}/rtl/*/*.sv]

# Packages must be analyzed before any modules that import them.
# Otherwise PRESTO may try to locate a precompiled .pvk and fail.
set PKG_FILE ${CORE_PATH}/rtl/axi_module/axi_lite/packages_of_config_regis.sv
if {[file exists ${PKG_FILE}]} {
  analyze -format sverilog -vcs "+define+SYNTHESIS ${PKG_FILE}"
}

analyze -format sverilog -vcs "+define+SYNTHESIS -F ${CORE_PATH}/scripts/file.lst"

# Allow overriding the top module name via environment variable.
set TOP_MODULE "top_module_1"
if { [info exists ::env(TOP_MODULE)] && $::env(TOP_MODULE) ne "" } {
  set TOP_MODULE $::env(TOP_MODULE)
}
elaborate ${TOP_MODULE}

if {[string equal $synopsys_program_name "rtl_shell"]} {
  set_top_module ${TOP_MODULE}
}

# set constraints
source ${CORE_PATH}/scripts/constraints.tcl
