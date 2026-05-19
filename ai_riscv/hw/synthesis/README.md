# RISC-V Core Comparions

For a list of cores see [cores/README.md](./cores/README.md)

## How to create new core (core_xyz):

In this example ``core_xyz`` is the name of our design.

 1. Create a core directory ``core_xyz`` in ``cores/``
 2. Copy your RTL into a directory in ``cores/core_xyz`` (e.g. ``cores/core_xyz/rtl``)
 3. Create the directory ``cores/core_xyz/scripts`` which must contain a file called ``read_design.tcl``
 4. Create the TCL-file ``cores/core_xyz/scripts/read_design.tcl``. Tasks of the read_design.tcl file (check other files for reference, e.g. ``cores/l31_fpu/scripts/read_design.tcl``):
    - Read RTL-code (e.g. ``analyze`` and ``elaborate`` - elaborate has to select the top level RTL-module for synthesis) 
    - Set constraints (this is usually outsourced in a file called ``constraints.tcl``, but can also be written in ``read_design.tcl``): Select clock and reset ports by setting the ``clock_port`` and ``reset_port`` variables. Create a clock with the ``create_clock`` command.

Please note: Sometimes the order when analyzing RTL-files is important. The directory ``cores/common`` contains a simple script to create an initial file list from a directory containing RTL-files. The output file ``file.lst`` can be provided to Design Compiler like so ``analyze -format sverilog -vcs "-F ${CORE_PATH}/scripts/file.lst"``.
 1. Go into scripts directory: ``cd cores/core_xyz/scripts``
 2. Call ``find_order.py`` with the rtl directory as argument: ``find_order.py ../rtl/`` - After that you should see a ``file.lst`` in the current working directory.
 3. Modify the ``analyze`` command in ``read_design.tcl`` (e.g. to ``analyze -format sverilog -vcs "-F ${CORE_PATH}/scripts/file.lst"``)

### Optional (to use RTL-Architect):

Add the following statement in ``read_design.tcl`` right after ``elaborate`` (replace ``TOP_MODULE`` with the name of your top module):
```tcl
if {[string equal $synopsys_program_name "rtl_shell"]} {
  set_top_module TOP_MODULE
}
```

For visualization of internal module boundaries use the ``set_autoungroup_options`` command (only with RTL-Architect => include this statement in the if statment as shown in the example below):
```tcl
if {[string equal $synopsys_program_name "rtl_shell"]} {
  set_top_module TOP_MODULE
  # keep all hierarchies until level 2
  set_autoungroup_options -start_level 3
}
```


## How to synthesize core:

```sh
module load synopsys_design_compiler/W-2024.09-SP1 # in IMS-AS infrastructure

DESIGN_NAME=l31_fpu dcnxt_shell -topo -f scripts/run.tcl
# now results can should be available in ``cores/l31_fpu/reports/``
```

Note: replace ``l31_fpu`` with your target core directory name.


## TODO

New cores to consider:

 - Core List: https://github.com/yunchenlo/awesome-RISCV-Cores
 - Core List: https://gist.github.com/brabect1/6cf529b13494c3a179342dd20088c4af
 - Core List: https://bitlog.it/20220118_asic_roundup_of_open_source_riscv_cpu_cores.html
 - Core List: https://www.riscvschool.com/risc-v-ip-cores/
 - Core List: https://github.com/gsmecher/minimax (see Resource Usage below)


# Similar work

 - https://leopard.tu-braunschweig.de/servlets/MCRFileNodeServlet/dbbs_derivate_00048198/riscv-survey-cf-zweitpublikation.pdf
 - https://bitlog.it/20220118_asic_roundup_of_open_source_riscv_cpu_cores.html
 - https://es.cs.rptu.de/publications/datarsg/Hack21.pdf
 - https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=10753540

