set clock_port [get_ports "CLK"]
set reset_port [get_ports "RST"]
set clock_period 600

create_clock -name clock -period ${clock_period} ${clock_port}
