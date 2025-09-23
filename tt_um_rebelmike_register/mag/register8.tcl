set ROW_HEIGHT 544
set ROW_HALF_HEIGHT 272

box 0 0 0 0
getcell register4 child 0 0
box 0 [expr 9 * $ROW_HEIGHT] 0 [expr 9 * $ROW_HEIGHT]
getcell register4 child 0 0 v

box -414 [expr 4 * $ROW_HEIGHT] -414 [expr 4 * $ROW_HEIGHT]
getcell sky130_fd_sc_hd__clkbuf_4 v
box -414 [expr 4 * $ROW_HEIGHT + $ROW_HALF_HEIGHT] -414 [expr 4 * $ROW_HEIGHT + $ROW_HALF_HEIGHT]
getcell sky130_fd_sc_hd__decap_4
box -230 [expr 4 * $ROW_HEIGHT + $ROW_HALF_HEIGHT] -230 [expr 4 * $ROW_HEIGHT + $ROW_HALF_HEIGHT]
getcell sky130_fd_sc_hd__fill_1
for {set i 0} {$i < 4} {incr i} {
    box [expr -138 + $i * 414] [expr 4 * $ROW_HEIGHT] [expr -138 + $i * 414] [expr 4 * $ROW_HEIGHT]
    getcell sky130_fd_sc_hd__mux2_2 180
    box [expr -184 + $i * 414] [expr 4 * $ROW_HEIGHT + $ROW_HALF_HEIGHT] [expr -184 + $i * 414] [expr 4 * $ROW_HEIGHT + $ROW_HALF_HEIGHT]
    getcell sky130_fd_sc_hd__mux2_2 h
}
box [expr -138 + $i * 414] [expr 4 * $ROW_HEIGHT] [expr -138 + $i * 414] [expr 4 * $ROW_HEIGHT]
getcell sky130_fd_sc_hd__tapvpwrvgnd_1 v
box [expr -184 + $i * 414] [expr 4 * $ROW_HEIGHT + $ROW_HALF_HEIGHT] [expr -184 + $i * 414] [expr 4 * $ROW_HEIGHT + $ROW_HALF_HEIGHT]
getcell sky130_fd_sc_hd__tapvpwrvgnd_1
box [expr -92 + $i * 414] [expr 4 * $ROW_HEIGHT] [expr -92 + $i * 414] [expr 4 * $ROW_HEIGHT]
getcell sky130_fd_sc_hd__buf_2 180
box [expr -138 + $i * 414] [expr 4 * $ROW_HEIGHT + $ROW_HALF_HEIGHT] [expr -138 + $i * 414] [expr 4 * $ROW_HEIGHT + $ROW_HALF_HEIGHT]
getcell sky130_fd_sc_hd__buf_2 h
box 1702 [expr 4 * $ROW_HEIGHT + $ROW_HALF_HEIGHT] 1702 [expr 4 * $ROW_HEIGHT + $ROW_HALF_HEIGHT]
getcell sky130_fd_sc_hd__fill_1
box 1748 [expr 4 * $ROW_HEIGHT + $ROW_HALF_HEIGHT] 1748 [expr 4 * $ROW_HEIGHT + $ROW_HALF_HEIGHT]
getcell sky130_ef_sc_hd__decap_12
box 1748 [expr 4 * $ROW_HEIGHT] 1748 [expr 4 * $ROW_HEIGHT]
getcell sky130_ef_sc_hd__decap_12 v
box 2300 [expr 4 * $ROW_HEIGHT + $ROW_HALF_HEIGHT] 2300 [expr 4 * $ROW_HEIGHT + $ROW_HALF_HEIGHT]
getcell sky130_ef_sc_hd__decap_12
box 2300 [expr 4 * $ROW_HEIGHT] 2300 [expr 4 * $ROW_HEIGHT]
getcell sky130_ef_sc_hd__decap_12 v


proc add_via1 {llx lly} {
    box [expr $llx + 4] [expr $lly + 4] [expr $llx + 30] [expr $lly + 30]
    paint via1
    #box $llx $lly [expr $llx + 34] [expr $lly + 34]
    #paint metal2
}
proc add_via1_m1 {llx lly} {
    add_via1 $llx $lly
    box $llx $lly [expr $llx + 34] [expr $lly + 34]
    paint metal1
}
proc add_via1_m1_m2 {llx lly} {
    add_via1 $llx $lly
    box $llx $lly [expr $llx + 34] [expr $lly + 34]
    paint metal1
    box $llx $lly [expr $llx + 34] [expr $lly + 34]
    paint metal2
}

proc add_via2 {llx lly} {
    box [expr $llx + 4] [expr $lly + 4] [expr $llx + 30] [expr $lly + 30]
    paint via1
    box $llx [expr $lly - 2] [expr $llx + 34] [expr $lly + 36]
    paint metal2
    box [expr $llx + 3] [expr $lly + 3] [expr $llx + 31] [expr $lly + 31]
    paint via2
}
proc add_via2_m1 {llx lly} {
    box $llx $lly [expr $llx + 34] [expr $lly + 34]
    paint metal1
    add_via2 $llx $lly
}

# Clock
box -234 2226 -200 2874
paint metal2
add_via1 -234 2275
box -234 2275 -198 2309
paint metal1
box -221 2283 -201 2303
paint viali

box -366 2333 -346 2357
paint viali
box -405 2330 -340 2360
paint metal1
add_via1_m1_m2 -405 2330
box -405 2362 -385 4304
paint metal2
add_via1_m1_m2 -419 4270
box -405 4270 -166 4304
paint metal1
add_via1_m1 -200 4270
box -203 4268 53 4306
paint metal2
box 20 4273 50 4301
paint via2
box 17 4270 53 4304
paint metal3
box 53 4274 120 4304
paint metal3
label CLK FreeSans 0.125u -met3
port make
port use clock
port class input
port connections n s e w

# WEN
box -365 1801 -331 2224
paint metal2
box -378 2186 -331 2224
paint metal2
box -375 2191 -347 2219
paint via2
box -378 2186 -344 4824
paint metal3
box -378 4794 -220 4824
paint metal3
label WEN0 FreeSans 0.125u -met3
port make
port use signal
port class input
port connections n s e w

box -365 4730 -268 4764
paint metal2
box -301 4733 -273 4761
paint via2
box -305 4730 -260 4764
paint metal3
box -260 4734 -220 4764
paint metal3
label WEN1 FreeSans 0.125u -met3
port make
port use signal
port class input
port connections n s e w


# Data IN
box -314 3033 -280 3068
paint metal3
box -313 3033 -281 3065
paint via3
box -317 3032 -277 4946
paint metal4
box -317 4896 -277 4946
label D0 FreeSans 0.25u -met4
port make
port use signal
port class input
port connections n

for {set i 0} {$i < 4} {incr i} {
    box [expr -310 + $i * 80] 2226 [expr -280 + $i * 80] 2670
    paint metal3
}

for {set i 1} {$i < 4} {incr i} {
    box [expr -314 + $i * 80] [expr 3577 + ($i - 1) * $ROW_HEIGHT] [expr -280 + $i * 80] [expr 3612 + ($i - 1) * $ROW_HEIGHT]
    paint metal3
    box [expr -313 + $i * 80] [expr 3577 + ($i - 1) * $ROW_HEIGHT] [expr -281 + $i * 80] [expr 3609 + ($i - 1) * $ROW_HEIGHT]
    paint via3
    box [expr -317 + $i * 80] [expr 3576 + ($i - 1) * $ROW_HEIGHT] [expr -277 + $i * 80] 4946
    paint metal4
    box [expr -317 + $i * 80] 4896 [expr -277 + $i * 80] 4946
    label D$i FreeSans 0.25u -met4
    port make
    port use signal
    port class input
    port connections n
}

# Data OUT
for {set i 0} {$i < 4} {incr i} {
    box [expr -32 + $i * 414] 2226 [expr -12 + $i * 414] 2310
    paint metal2
    add_via1_m1_m2 [expr -32 + $i * 414] 2282
    box [expr -28 + $i * 414] 2290 [expr -8 + $i * 414] 2310
    paint viali
    box [expr 2 + $i * 414] 2282 [expr 15 + $i * 414] 2316
    paint metal1
    box [expr 15 + $i * 414] 2282 [expr 41 + $i * 414] 2557
    paint metal1
    box [expr 18 + $i * 414] 2531 [expr 38 + $i * 414] 2551
    paint viali

    box [expr -28 + $i * 414] 2352 [expr -8 + $i * 414] 2372
    paint viali
    add_via1_m1_m2 [expr -39 + $i * 414] 2346
    box [expr -32 + $i * 414] 2346 [expr -12 + $i * 414] 2670
    paint metal2
    add_via1_m1_m2 [expr -66 + $i * 414] 2520
    box [expr -60 + $i * 414] 2525 [expr -40 + $i * 414] 2545
    paint viali
}

# Address
for {set i 0} {$i < 4} {incr i} {
    box [expr -78 + $i * 414] 2287 [expr -61 + $i * 414] 2307
    paint viali
    box [expr -81 + $i * 414] 2214 [expr -58 + $i * 414] 2313
    paint metal1

    box [expr -124 + $i * 414] 2589 [expr -107 + $i * 414] 2609
    paint viali
    box [expr -127 + $i * 414] 2583 [expr -104 + $i * 414] 2682
    paint metal1
}
box -81 2214 1641 2228
paint metal1
box -127 2668 1595 2682
paint metal1

box 1621 2220 1638 2243
paint viali
box 1618 2214 1641 2249
paint metal1

box 1575 2653 1592 2676
paint viali
box 1572 2647 1595 2682
paint metal1

box 1665 2554 1685 2574
paint viali
add_via2_m1 1658 2547
box 1635 2539 1692 2589
paint metal3
box 1642 2554 1678 2586
paint via3
box 1640 2550 1680 4946
paint metal4
box 1640 4896 1680 4946
label ADDR_B FreeSans 0.25u -met4
port make
port use signal
port class input
port connections n


box 1711 2322 1732 2342
paint viali
add_via2_m1 1704 2315
box 1704 2310 1760 2360
paint metal3
box 1722 2324 1758 2356
paint via3
box 1720 2320 1760 4946
paint metal4
box 1720 4896 1760 4946
label ADDR_A FreeSans 0.25u -met4
port make
port use signal
port class input
port connections n

# Data OUT from muxes
for {set i 0} {$i < 4} {incr i} {
    box [expr 152 + $i * 414] 2625 [expr 172 + $i * 414] 2645
    paint viali
    add_via2_m1 [expr 145 + $i * 414] 2618
    box [expr 122 + $i * 414] 2614 [expr 179 + $i * 414] 2664
    paint metal3
    box [expr 129 + $i * 414] 2629 [expr 165 + $i * 414] 2661
    paint via3
    box [expr 127 + $i * 414] 2625 [expr 167 + $i * 414] 4946
    paint metal4
    box [expr 127 + $i * 414] 4896 [expr 167 + $i * 414] 4946
    label QB$i FreeSans 0.25u -met4
    port make
    port use signal
    port class output
    port connections n

    box [expr 198 + $i * 414] 2255 [expr 218 + $i * 414] 2275
    paint viali
    add_via2_m1 [expr 191 + $i * 414] 2248
    box [expr 191 + $i * 414] 2248 [expr 247 + $i * 414] 2298
    paint metal3
    box [expr 209 + $i * 414] 2262 [expr 245 + $i * 414] 2294
    paint via3
    box [expr 207 + $i * 414] 2258 [expr 247 + $i * 414] 4946
    paint metal4
    box [expr 207 + $i * 414] 4896 [expr 247 + $i * 414] 4946
    label QA$i FreeSans 0.25u -met4
    port make
    port use signal
    port class output
    port connections n
}



# Power
set POWER_OFFSET 1800
box [expr 200 + $POWER_OFFSET] -50 [expr 370 + $POWER_OFFSET] [expr 9*$ROW_HEIGHT + 50]
paint metal4
label VPWR FreeSans 0.25u -met4
port make
port use power
port class bidirectional
port connections n s e w

# Ground
box [expr 500 + $POWER_OFFSET] -50 [expr 670 + $POWER_OFFSET] [expr 9*$ROW_HEIGHT + 50]
paint metal4
label VGND FreeSans 0.25u -met4
port make
port use ground
port class bidirectional
port connections n s e w

for {set j 0} {$j < 4} {incr j} {
    box [expr $j * 40 + 509 + $POWER_OFFSET] [expr -16 + 2448] [expr $j * 40 + 541 + $POWER_OFFSET] [expr 16 + 2448]
    paint via3
    box [expr $j * 40 + 511 + $POWER_OFFSET] [expr -14 + 2448] [expr $j * 40 + 539 + $POWER_OFFSET] [expr 14 + 2448]
    paint via2
}
for {set j 0} {$j < 5} {incr j} {
    box [expr $j * 32 + 508 + $POWER_OFFSET] [expr -14 + 2448] [expr $j * 32 + 534 + $POWER_OFFSET] [expr 14 + 2448]
    paint via1
}
box [expr 500 + $POWER_OFFSET] [expr -17 + 2448] [expr 670 + $POWER_OFFSET] [expr 17 + 2448]
paint metal3
box [expr 500 + $POWER_OFFSET] [expr -17 + 2448] [expr 670 + $POWER_OFFSET] [expr 17 + 2448]
paint metal2

box -414 -50 [expr 4 * 736 + 46] [expr 9*$ROW_HEIGHT + 50]
save register8.mag
quit -noprompt
