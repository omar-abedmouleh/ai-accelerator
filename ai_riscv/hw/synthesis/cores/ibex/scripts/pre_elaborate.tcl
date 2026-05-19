# Read HDL
lappend search_path "${CORE_PATH}/../ibex/rtl/prim"
lappend search_path "${CORE_PATH}/../ibex/rtl/dv"
analyze -format sverilog -vcs "-F ${CORE_PATH}/../ibex/scripts/file.lst"
