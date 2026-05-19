# Read HDL
analyze -format sverilog [glob ${CORE_PATH}/rtl/*.sv]
analyze -format sverilog [glob ${CORE_PATH}/rtl/*/*.sv]
elaborate codix_berkelium_ca

if {[string equal $synopsys_program_name "rtl_shell"]} {
  set_top_module codix_berkelium_ca
}

# set constraints
source ${CORE_PATH}/scripts/constraints.tcl
