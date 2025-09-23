set REPEATS 4
set ROW_HEIGHT 544

for {set i 0} {$i < $REPEATS} {incr i} {
    box 0 [expr $i * $ROW_HEIGHT] 0 [expr $i * $ROW_HEIGHT]
    getcell register child 0 0
}

proc add_via1 {llx lly} {
    box [expr $llx + 4] [expr $lly + 4] [expr $llx + 30] [expr $lly + 30]
    paint via1
    #box $llx $lly [expr $llx + 34] [expr $lly + 34]
    #paint metal2
}

proc add_via2 {llx lly} {
    box [expr $llx + 4] [expr $lly + 4] [expr $llx + 30] [expr $lly + 30]
    paint via1
    box $llx [expr $lly - 2] [expr $llx + 34] [expr $lly + 36]
    paint metal2
    box [expr $llx + 3] [expr $lly + 3] [expr $llx + 31] [expr $lly + 31]
    paint via2
}

# Clock
for {set i 0} {$i < $REPEATS} {incr i} {
    add_via1 -234 [expr $i * $ROW_HEIGHT + 360]
}
box -234 360 -200 [expr $i * $ROW_HEIGHT + 50]
paint metal2
box -234 [expr $i * $ROW_HEIGHT + 14] -200 [expr $i * $ROW_HEIGHT + 50]
label CLK FreeSans 0.125u -met2
port make
port use clock
port class input
port connections n s e w


# WEN
for {set i 0} {$i < $REPEATS} {incr i} {
    add_via1 -365 [expr $i * $ROW_HEIGHT + 135]
}
box -365 135 -331 [expr ($REPEATS - 1) * $ROW_HEIGHT + 169]
paint metal2
label WEN FreeSans 0.125u -met2
port make
port use signal
port class input
port connections n s e w

# Data IN (D3-0)
for {set i 0} {$i < $REPEATS} {incr i} {
    add_via2 -314 [expr $i * $ROW_HEIGHT + 198]
}
for {set i 0} {$i < 3} {incr i} {
    box -314 [expr $i * $ROW_HEIGHT + 198] [expr (2 - $i) * 80 - 200] [expr $i * $ROW_HEIGHT + 232]
    paint metal3
    box [expr (2 - $i) * 80 - 230] [expr $i * $ROW_HEIGHT + 198] [expr (2 - $i) * 80 - 200] [expr $REPEATS * $ROW_HEIGHT + 50]
    paint metal3
}
box -314 [expr $i * $ROW_HEIGHT + 198] -280 [expr $REPEATS * $ROW_HEIGHT + 50]
paint metal3

# Data OUT (Q3-0)
for {set i 0} {$i < $REPEATS} {incr i} {
    add_via1 13 [expr $i * $ROW_HEIGHT + 198]
}
for {set i 0} {$i < 3} {incr i} {
    box 13 [expr $i * $ROW_HEIGHT + 198] 47 [expr $i * $ROW_HEIGHT + 380]
    paint metal2
    box 13 [expr $i * $ROW_HEIGHT + 360] [expr (3 - $i) * 414 - 12] [expr $i * $ROW_HEIGHT + 380]
    paint metal2
    box [expr (3 - $i) * 414 - 32] [expr $i * $ROW_HEIGHT + 360] [expr (3 - $i) * 414 - 12] [expr $REPEATS * $ROW_HEIGHT + 50]
    paint metal2
}
box -32 [expr $i * $ROW_HEIGHT + 198] 47 [expr $i * $ROW_HEIGHT + 232]
paint metal2
box -32 [expr $i * $ROW_HEIGHT + 198] -12 [expr $REPEATS * $ROW_HEIGHT + 50]
paint metal2


# Power
set POWER_OFFSET 1800
box [expr 200 + $POWER_OFFSET] -50 [expr 370 + $POWER_OFFSET] [expr $REPEATS*$ROW_HEIGHT + 50]
label VPWR FreeSans 0.25u -met4
port make
port use power
port class bidirectional
port connections n s e w

# Ground
box [expr 500 + $POWER_OFFSET] -50 [expr 670 + $POWER_OFFSET] [expr $REPEATS*$ROW_HEIGHT + 50]
label VGND FreeSans 0.25u -met4
port make
port use ground
port class bidirectional
port connections n s e w

box -414 -50 [expr 4 * 736 + 46] [expr $REPEATS*$ROW_HEIGHT + 50]
save register4.mag
quit -noprompt
