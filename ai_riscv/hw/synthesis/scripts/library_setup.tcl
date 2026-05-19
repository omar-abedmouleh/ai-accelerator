# Set target libraries
# Use only standard-cell libraries for mapping/optimization.
# The ASAP7 SRAM .db is not a standard-cell target and can skew operating
# condition inference and VT-group reporting.
set stdcell_libs [list \
    lib/asap7sc7p5t_LVT_TT_ccsa.db \
    lib/asap7sc7p5t_RVT_TT_ccsa.db \
    lib/asap7sc7p5t_SLVT_TT_ccsa.db \
]
set_app_var target_library $stdcell_libs

# Specify DesignWare Library
set_app_var synthetic_library {dw_foundation.sldb}

set_app_var link_library [list * {*}$stdcell_libs {*}$synthetic_library]

# Optional: include SRAM lib only if explicitly requested.
# In this flow, inferred/RTL memories are black-boxed, so the SRAM .db is not
# required and can confuse operating-condition inference and VT-group reports.
if { [info exists ::env(USE_SRAM_LIB)] && $::env(USE_SRAM_LIB) eq "1" } {
    if {[file exists lib/asap7sc7p5t_SRAM_TT_ccsa.db]} {
        set_app_var link_library [concat $link_library lib/asap7sc7p5t_SRAM_TT_ccsa.db]
    }
}

set TECH_FILE "lib/asap7_1x.tf"
set REF_LIB "lib/asap7.ndm"
set LIB_NAME "work.nlib"

if {![file exists ${LIB_NAME}]} {
    create_lib -technology ${TECH_FILE} -ref_libs ${REF_LIB} ${LIB_NAME}
}
open_lib ${LIB_NAME}

set TLUPLUS_FILE "lib/asap7_x1.tluplus"
set TLUPLUS_LAYERMAP "lib/asap7.layermap"
set_tlu_plus_files -max_tluplus $TLUPLUS_FILE -tech2itf_map $TLUPLUS_LAYERMAP
