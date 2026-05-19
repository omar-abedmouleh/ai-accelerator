# Read HDL
source "${CORE_PATH}/../ibex_vector/scripts/pre_elaborate.tcl"

# IBEX "small" configuration
elaborate ibex_top -param RV32E=>0,RV32M=>2,RV32B=>0,RegFile=>0,BranchTargetALU=>0,WritebackStage=>0,ICache=>0,ICacheECC=>0,ICacheScramble=>0,BranchPredictor=>0,DbgTriggerEn=>0,SecureIbex=>0,PMPEnable=>0,PMPGranularity=>0,PMPNumRegions=>4,MHPMCounterNum=>0,MHPMCounterWidth=>40

if {[string equal $synopsys_program_name "rtl_shell"]} {
  set_top_module ibex_top_PMPEnable0_PMPGranularity0_PMPNumRegions4_MHPMCounterNum0_MHPMCounterWidth40_RV32E0_RV32M2_RV32B0_RegFile0_BranchTargetALU0_WritebackStage0_ICache0_ICacheECC0_BranchPredictor0_DbgTriggerEn0_SecureIbex0_ICacheScramble0
}


# set constraints
source "${CORE_PATH}/../ibex_vector/scripts/constraints.tcl"
