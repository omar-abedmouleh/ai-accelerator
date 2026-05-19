set clock_port [get_ports "clk_i"]
set reset_port [get_ports "rst_ni"]
set clock_period 400

create_clock -name clock -period ${clock_period} ${clock_port}
