# run using: rtl_shell -f scripts/run_rtl.tcl

if { ! [info exists ::env(DESIGN_NAME)] } {
    echo "Please set DESIGN_NAME environment variable!"
    exit 1
}
set DESIGN_NAME $::env(DESIGN_NAME)
set CORE_PATH cores/${DESIGN_NAME}

set_host_options -max_cores 80

source scripts/library_setup_rtl.tcl

set DESIGN_LIBRARY "${DESIGN_NAME}.dlib"
if {[file exists $DESIGN_LIBRARY]} {
  file delete -force $DESIGN_LIBRARY
}

create_lib -technology $TECH_FILE -ref_libs $REFERENCE_LIBRARY $DESIGN_LIBRARY

source ${CORE_PATH}/scripts/read_design.tcl

##############################
# Technology Settings
##############################
source -e scripts/tech_setup.tcl

##############################
# Corner + Scenario
##############################
create_corner typical
current_corner typical
set_voltage 0.7
set_temperature 25
set_parasitic_parameters -early_spec nominalTLU -late_spec nominalTLU

create_scenario -name typical -mode default -corner typical

##############################
# Synthesis Options
##############################
set_qor_strategy -stage compile -metric timing -mode balanced
set_qor_strategy -stage route   -metric timing -mode balanced
# enable CCD for more paths
set_app_options -name ccd.enable_top_wns_optimization -value true

# Enable retiming
set_optimize_registers  -modules [get_attribute -name name [current_block]]

save_block -as read_rtl

##############################
# Run Synthesis
##############################
rtl_opt

save_block -as rtl_opt
save_lib
