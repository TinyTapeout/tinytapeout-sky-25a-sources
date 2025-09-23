all: tt_um_rebelmike_register.mag

register.mag: register.tcl
	magic -rcfile $(PDK_ROOT)/sky130A/libs.tech/magic/sky130A.magicrc -noconsole -dnull register.tcl

register4.mag: register4.tcl register.mag
	magic -rcfile $(PDK_ROOT)/sky130A/libs.tech/magic/sky130A.magicrc -noconsole -dnull register4.tcl

register8.mag: register8.tcl register4.mag
	magic -rcfile $(PDK_ROOT)/sky130A/libs.tech/magic/sky130A.magicrc -noconsole -dnull register8.tcl

tt_um_rebelmike_register.mag: magic_project.tcl register8.mag
	magic -rcfile $(PDK_ROOT)/sky130A/libs.tech/magic/sky130A.magicrc -noconsole -dnull magic_project.tcl

magic: tt_um_rebelmike_register.mag
	magic -rcfile $(PDK_ROOT)/sky130A/libs.tech/magic/sky130A.magicrc tt_um_rebelmike_register.mag

spice: tt_um_rebelmike_register.mag
	magic -rcfile $(PDK_ROOT)/sky130A/libs.tech/magic/sky130A.magicrc -noconsole -dnull ext2spice.tcl
	#grep -v FLOATING tt_um_flat.spice > tt_um_flat.no_float
	#@mv tt_um_flat.no_float tt_um_flat.spice
	@mv tt_um_flat.* ../spice
