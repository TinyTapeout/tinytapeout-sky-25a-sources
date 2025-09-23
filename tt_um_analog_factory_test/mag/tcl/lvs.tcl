set layout [readnet spice $project.lvs.spice]
set schem  [readnet verilog ../src/tt_um_analog_factory_test.v]
readnet spice ../xschem/simulation/factory_test.spice $schem
lvs "$layout $project" "$schem $project" $::env(PDK_ROOT)/sky130A/libs.tech/netgen/sky130A_setup.tcl lvs.report -blackbox

