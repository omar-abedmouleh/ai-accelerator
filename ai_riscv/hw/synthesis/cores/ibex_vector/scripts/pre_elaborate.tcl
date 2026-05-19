# Read HDL
lappend search_path "${CORE_PATH}/../ibex_vector/rtl/prim"
lappend search_path "${CORE_PATH}/../ibex_vector/rtl/dv"
analyze -format sverilog -vcs "-F ${CORE_PATH}/../ibex_vector/scripts/file.lst"
