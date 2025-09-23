# SPDX-License-Identifier: Apache-2.0
# Copyright (c) 2024 Tiny Tapeout LTD
# Author: Uri Shaked
# Description: This script initializes a new Magic project for an analog design on Tiny Tapeout.

# Important: before running this script, download the the .def file from
# https://raw.githubusercontent.com/TinyTapeout/tt-support-tools/tt08/def/analog/tt_analog_1x2.def

# Change the settings below to match your design:
# ------------------------------------------------
set TOP_LEVEL_CELL     tt_um_rebelmike_register
set TEMPLATE_FILE      tt_block_1x1_pg.def
set POWER_STRIPE_WIDTH 1.7um                 ;# The minimum width is 1.2um

# Power stripes: NET name, x position. You can add additional power stripes for each net, as needed.
set POWER_STRIPES {
    VDPWR 30um
    VGND  33um
}
# If you use the 3v3 template, uncomment the line below:
#lappend POWER_STRIPES VAPWR 7um

# Read in the pin positions
# -------------------------
def read $TEMPLATE_FILE
cellname rename tt_um_template $TOP_LEVEL_CELL

# Draw the power stripes
# --------------------------------
proc draw_power_stripe {name x} {
    global POWER_STRIPE_WIDTH
    box $x 5um $x 106um
    box width $POWER_STRIPE_WIDTH
    paint met4
    label $name FreeSans 0.25u -met4
    port make
    port use [expr {$name eq "VGND" ? "ground" : "power"}]
    port class bidirectional
    port connections n s e w
}

# You can extra power stripes, as you need.
foreach {name x} $POWER_STRIPES {
    puts "Drawing power stripe $name at $x"
    draw_power_stripe $name $x
}

box 1000 [expr 10000 - 4946] 1000 [expr 10000 - 4946]
getcell register8 child 0 0

proc draw_top_signal_wire {cxl cyl cxt hyl px} {
    box $cxl $cyl $cxt [expr $hyl + 36]
    paint metal4
    box [expr $cxl + 1] $hyl [expr $cxt - 1] [expr $hyl + 32]
    paint via3
    box [expr $cxl - 2] $hyl [expr $px + 21] [expr $hyl + 32]
    paint metal3
    box [expr $px - 18] [expr $hyl - 0] [expr $px + 18] [expr $hyl + 32]
    paint via3
    box [expr $px - 19] [expr $hyl - 1] [expr $px + 19] [expr $hyl + 33]
    paint metal4
    box [expr $px - 15] [expr $hyl + 24] [expr $px + 15] 11052
    paint metal4
}

proc draw_side_signal_wire {cxl cyl px} {
    box $cxl $cyl [expr $px + 23] [expr $cyl + 30]
    paint metal3
    box [expr $px - 21] $cyl [expr $px + 21] [expr $cyl + 34]
    paint metal3
    box [expr $px - 18] [expr $cyl + 1] [expr $px + 18] [expr $cyl + 33]
    paint via3
    box [expr $px - 19] [expr $cyl - 4] [expr $px + 19] [expr $cyl + 34]
    paint metal4
    box [expr $px - 15] [expr $cyl + 24] [expr $px + 15] 11052
    paint metal4
}

proc draw_side_signal_wire_b {cxl cyl px} {
    box $cxl $cyl [expr $px + 23] [expr $cyl + 30]
    paint metal3
    box [expr $px - 21] [expr $cyl - 4] [expr $px + 21] [expr $cyl + 30]
    paint metal3
    box [expr $px - 18] [expr $cyl - 3] [expr $px + 18] [expr $cyl + 29]
    paint via3
    box [expr $px - 19] [expr $cyl - 4] [expr $px + 19] [expr $cyl + 30]
    paint metal4
    box [expr $px - 15] [expr $cyl + 24] [expr $px + 15] 11052
    paint metal4
}

draw_side_signal_wire 1120 9328 14398   ;#CLK
draw_side_signal_wire_b 780 9788 11362 ;#WEN1
draw_side_signal_wire 780 9848 11638   ;#WEN0

draw_top_signal_wire 683 10000 723 10040 12742   ;#D0
draw_top_signal_wire 763 10000 803 10110 12466   ;#D1
draw_top_signal_wire 843 10000 883 10180 12190   ;#D2
draw_top_signal_wire 923 10000 963 10250 11914   ;#D3

draw_top_signal_wire 1127 10000 1167 10320 8326   ;#QB0
draw_top_signal_wire 1541 10000 1581 10390 8050   ;#QB1
draw_top_signal_wire 1955 10000 1995 10460 7774   ;#QB2
draw_top_signal_wire 2369 10000 2409 10530 7498   ;#QB3

draw_top_signal_wire 1207 10000 1247 10600 9430   ;#QA0
draw_top_signal_wire 1621 10000 1661 10670 9154   ;#QA1
draw_top_signal_wire 2035 10000 2075 10740 8878   ;#QA2
draw_top_signal_wire 2449 10000 2489 10810 8602   ;#QA3

draw_top_signal_wire 2720 10000 2760 10880 13846  ;#ADDR_A
draw_top_signal_wire 2640 10000 2680 10950 13294  ;#ADDR_B

# Tie low (ideally would use a proper tie macro but YOLO)
box 3343 10000 3373 11052
paint metal4
box 3067 11052 7237 11082
paint metal4

# Save the layout and export GDS/LEF
# ----------------------------------
save ${TOP_LEVEL_CELL}.mag
file mkdir gds
gds write ../gds/${TOP_LEVEL_CELL}.gds
file mkdir lef
lef write ../lef/${TOP_LEVEL_CELL}.lef -hide -pinonly

quit -noprompt
