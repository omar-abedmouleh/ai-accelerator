set TLUPLUS_LAYERMAP "lib/asap7.layermap"
set TLUPLUS "lib/asap7_x1.tluplus"

read_parasitic_tech -name nominalTLU -layermap $TLUPLUS_LAYERMAP -tlup $TLUPLUS

set_attribute [get_layers {M1 M3 M5 M7 M9}] routing_direction horizontal
set_attribute [get_layers {M2 M4 M6 M8 Pad}] routing_direction vertical

set_ignored_layers -max_routing_layer M9