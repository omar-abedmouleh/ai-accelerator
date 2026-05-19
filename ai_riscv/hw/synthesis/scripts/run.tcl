# run using: dcnxt_shell -topo -f scripts/run.tcl

# Ensure relative paths work even when this script is invoked from another cwd.
# info script points to this file (scripts/run.tcl). We switch to the project
# root (parent directory of scripts/).
set _this_script_dir [file dirname [info script]]
set _proj_root [file normalize [file join ${_this_script_dir} ..]]
cd ${_proj_root}

if { ! [info exists ::env(DESIGN_NAME)] } {
    echo "Please set DESIGN_NAME environment variable!"
    exit 1
}
set DESIGN_NAME $::env(DESIGN_NAME)
set CORE_PATH cores/${DESIGN_NAME}

# Default top module name (override via TOP_MODULE env var)
if { ! [info exists ::env(TOP_MODULE)] || $::env(TOP_MODULE) eq "" } {
  set ::env(TOP_MODULE) "top_module_1"
}

# Simple wall-clock runtime measurement for the whole batch run.
set _run_start_sec [clock seconds]
set _run_start_str [clock format ${_run_start_sec} -format "%Y-%m-%d %H:%M:%S"]
echo "INFO: DC run start: ${_run_start_str} (DESIGN_NAME=${DESIGN_NAME})"

set_host_options -max_cores 16

# On Ubuntu/Debian, /bin/sh often points to dash.
# Some helper invocations used during mapping assume bash-compatible redirection
# (e.g. "echo hi >& file") and can spam: "sh: 1: Syntax error: Bad fd number".
# This is noisy and can slow down the run.
set _sh_bash_compatible 0
set _tmp_sh_test "/tmp/dc_sh_test_[pid]"
catch { file delete -force $_tmp_sh_test }
if { [catch { exec /bin/sh -c "echo __dc_sh_ok__ >& $_tmp_sh_test" } _sh_err] == 0 } {
  set _sh_bash_compatible 1
}
catch { file delete -force $_tmp_sh_test }

if { $_sh_bash_compatible == 0 } {
  echo "WARNING: /bin/sh is not bash-compatible; you may see 'Bad fd number' spam during mapping."
  echo "         Recommended fix (if you have sudo): 'sudo dpkg-reconfigure dash' -> select 'No'."

  # Best-effort: ask DC to use bash for its internal shell commands (if supported).
  catch { set_app_var sh_command "/bin/bash -c" }
  catch { set_app_var sh_shell   "/bin/bash" }
}

source scripts/library_setup.tcl
source ${CORE_PATH}/scripts/read_design.tcl

# group clk/inputs/outputs for better optimization:
group_path -name CLK -from ${clock_port}
group_path -name INPUT -through [all_inputs]
group_path -name OUTPUTS -to [all_outputs]
group_path -name FEEDTHROUGH -from [all_inputs] -to [all_outputs]

###################################
#### reset input
###################################
# dont buffer reset net
set_ideal_network $reset_port

# Use additional algorithms to pursuit better area through increased resource sharing:
set compile_enhanced_resource_sharing true

if {![file exists ${CORE_PATH}/reports]} {
  file mkdir ${CORE_PATH}/reports
}

check_design > ${CORE_PATH}/reports/design_checks.rpt

compile_ultra -spg -gate_clock -retime -no_autoungroup
optimize_netlist -area

# Optional: read SAIF activity for power.
# Provide via environment variables:
#   ACTIVITY_SAIF=/absolute/path/to/file.saif
#   ACTIVITY_INSTANCE=<design_instance>          (optional, default: top_module)
if { [info exists ::env(ACTIVITY_SAIF)] } {
  set _saif_file $::env(ACTIVITY_SAIF)
  if { [file exists ${_saif_file}] } {
    set _inst "top_module_1"
    if { [info exists ::env(ACTIVITY_INSTANCE)] && $::env(ACTIVITY_INSTANCE) ne "" } {
      set _inst $::env(ACTIVITY_INSTANCE)
    }
    echo "INFO: Reading activity SAIF: ${_saif_file} (instance=${_inst})"
    if { [catch { read_saif -input ${_saif_file} -instance ${_inst} } _saif_err] } {
      echo "WARNING: read_saif failed: ${_saif_err}"
    }
  } else {
    echo "WARNING: ACTIVITY_SAIF set but file not found: ${_saif_file}"
  }
} elseif { [info exists ::env(ACTIVITY_VCD)] } {
  echo "WARNING: ACTIVITY_VCD is set, but this DC flow expects SAIF. Please convert VCD to SAIF and set ACTIVITY_SAIF."
}

print_message_info > ${CORE_PATH}/reports/msg.rpt
report_design > ${CORE_PATH}/reports/design.rpt
report_qor    > ${CORE_PATH}/reports/qor.rpt
report_timing > ${CORE_PATH}/reports/timing.rpt
report_area   > ${CORE_PATH}/reports/area.rpt
report_threshold_voltage_group   > ${CORE_PATH}/reports/tvg.rpt
report_power  > ${CORE_PATH}/reports/power.rpt
report_port   > ${CORE_PATH}/reports/port.rpt

# Write runtime summary
set _run_end_sec [clock seconds]
set _run_end_str [clock format ${_run_end_sec} -format "%Y-%m-%d %H:%M:%S"]
set _run_elapsed_sec [expr {${_run_end_sec} - ${_run_start_sec}}]
set _run_h [expr {${_run_elapsed_sec} / 3600}]
set _run_m [expr {((${_run_elapsed_sec} % 3600) / 60)}]
set _run_s [expr {${_run_elapsed_sec} % 60}]
set _run_elapsed_hms [format "%02d:%02d:%02d" ${_run_h} ${_run_m} ${_run_s}]

set _runtime_rpt "${CORE_PATH}/reports/runtime.rpt"
set _fh [open ${_runtime_rpt} "w"]
puts ${_fh} "Design:   ${DESIGN_NAME}"
puts ${_fh} "Start:    ${_run_start_str}"
puts ${_fh} "End:      ${_run_end_str}"
puts ${_fh} "Elapsed:  ${_run_elapsed_hms} (${_run_elapsed_sec} seconds)"
catch { puts ${_fh} "Host:     [info hostname]" }
close ${_fh}
echo "INFO: DC run end: ${_run_end_str} (elapsed ${_run_elapsed_hms} / ${_run_elapsed_sec}s)"
echo "INFO: Runtime report written: ${_runtime_rpt}"

# By default, exit after reports so the batch run terminates cleanly.
# Set KEEP_DC_SHELL=1 to keep the interactive shell open.
if { !([info exists ::env(KEEP_DC_SHELL)] && $::env(KEEP_DC_SHELL) eq "1") } {
  exit 0
}

