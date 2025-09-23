set REPEATS 4
set ROW_HEIGHT 544
set ROW_HALF_HEIGHT 272

# Instantiate the cells
for {set i 0} {$i < 2} {incr i} {
    box [expr $i * 736] $ROW_HALF_HEIGHT [expr $i * 736] $ROW_HALF_HEIGHT
    getcell sky130_fd_sc_hd__dfxtp_1
    box [expr $i * 736] 0 [expr $i * 736] 0
    getcell sky130_fd_sc_hd__dfxtp_1 180
}
box [expr 736 * 2] $ROW_HALF_HEIGHT [expr 736 * 2] $ROW_HALF_HEIGHT
getcell sky130_fd_sc_hd__tapvpwrvgnd_1
box [expr 736 * 2] 0 [expr 736 * 2] 0
getcell sky130_fd_sc_hd__tapvpwrvgnd_1 v
for {set i 2} {$i < 4} {incr i} {
    box [expr $i * 736 + 46] $ROW_HALF_HEIGHT [expr $i * 736 + 46] $ROW_HALF_HEIGHT
    getcell sky130_fd_sc_hd__dfxtp_1
    box [expr $i * 736 + 46] 0 [expr $i * 736 + 46] 0
    getcell sky130_fd_sc_hd__dfxtp_1 180
}

box [expr 736 * $REPEATS + 46] $ROW_HALF_HEIGHT [expr 736 * $REPEATS + 46] $ROW_HALF_HEIGHT
getcell sky130_fd_sc_hd__tapvpwrvgnd_1
box [expr 736 * $REPEATS + 46] 0 [expr 736 * $REPEATS + 46] 0
getcell sky130_fd_sc_hd__tapvpwrvgnd_1 v

box -276 $ROW_HALF_HEIGHT 0 $ROW_HALF_HEIGHT
getcell sky130_fd_sc_hd__clkbuf_4
box -322 $ROW_HALF_HEIGHT 0 $ROW_HALF_HEIGHT
getcell sky130_fd_sc_hd__tapvpwrvgnd_1
box -460 $ROW_HALF_HEIGHT -322 $ROW_HALF_HEIGHT
getcell sky130_fd_sc_hd__decap_3
box -414 0 0 0
getcell sky130_fd_sc_hd__mux2_2 180
box -460 0 -414 0
getcell sky130_fd_sc_hd__tapvpwrvgnd_1 v

# Clk wiring
box -234 360 -200 394
paint metal1

label CLK FreeSans 0.125u -met1
port make
port use clock
port class input
port connections n s e w

box -228 366 -206 383
paint viali

box -10 369.5 9 430.5
paint locali
box 12 487 [expr 736 * $REPEATS - 11 + 46] 503
paint metal1
box 699 41 [expr 736 * $REPEATS - 11 + 46] 57
paint metal1
box [expr 736 * $REPEATS - 40 + 46] 458 [expr 736 * $REPEATS - 11 + 46] 503
paint metal1
box [expr 736 * $REPEATS - 40 + 46] 464 [expr 736 * $REPEATS - 11 + 46] 497
paint via1
box [expr 736 * $REPEATS - 40 + 46] 120 [expr 736 * $REPEATS - 11 + 46] 153
paint via1
box [expr 736 * $REPEATS - 40 + 46] 117 [expr 736 * $REPEATS - 11 + 46] 500
paint metal2
box [expr 736 * $REPEATS - 40 + 46] 57 [expr 736 * $REPEATS - 11 + 46] 160
paint metal1

for {set i 0} {$i < 2} {incr i} {
    box [expr $i * 736 + 702] 120 [expr $i * 736 + 721] 154
    paint viali
    box [expr $i * 736 + 699] 57 [expr $i * 736 + 724] 160
    paint metal1

    box [expr $i * 736 + 15] 390 [expr $i * 736 + 34] 424
    paint viali
    box [expr $i * 736 + 12] 384 [expr $i * 736 + 37] 487
    paint metal1
}

for {set i 2} {$i < 4} {incr i} {
    box [expr $i * 736 + 702 + 46] 120 [expr $i * 736 + 721 + 46] 154
    paint viali
    box [expr $i * 736 + 699 + 46] 57 [expr $i * 736 + 724 + 46] 160
    paint metal1

    box [expr $i * 736 + 15 + 46] 390 [expr $i * 736 + 34 + 46] 424
    paint viali
    box [expr $i * 736 + 12 + 46] 384 [expr $i * 736 + 37 + 46] 487
    paint metal1
}


# Data wiring
set i 0
    box [expr $i * 736 + 696] 315 [expr $i * 736 + 713] 332
    paint viali
    box [expr ($i + 1) * 736 + 143] 381 [expr ($i + 1) * 736 + 160] 398
    paint viali
    box [expr ($i + 1) * 736 + 140] 312 [expr ($i + 1) * 736 + 163] 404
    paint metal1

    # Intentionally add some extra capacitance to improve hold timing
    box [expr $i * 736 + 450] 312 [expr ($i + 1) * 736 + 200] 364
    paint metal1

    box [expr ($i + 1) * 736 + 24] 212 [expr ($i + 1) * 736 + 41] 229
    paint viali
    box [expr $i * 736 + 575] 146 [expr $i * 736 + 592] 163
    paint viali
    box [expr $i * 736 + 572] 140 [expr $i * 736 + 595] 212
    paint metal1

    # Intentionally add some extra capacitance to improve hold timing
    box [expr $i * 736 + 450] 180 [expr ($i + 1) * 736 + 200] 232
    paint metal1

set i 1
    box [expr $i * 736 + 696] 315 [expr $i * 736 + 713] 332
    paint viali
    box [expr ($i + 1) * 736 + 143 + 46] 381 [expr ($i + 1) * 736 + 160 + 46] 398
    paint viali
    box [expr ($i + 1) * 736 + 140 + 46] 312 [expr ($i + 1) * 736 + 163 + 46] 404
    paint metal1

    # Intentionally add some extra capacitance to improve hold timing
    box [expr $i * 736 + 450 + 46] 312 [expr ($i + 1) * 736 + 200 + 46] 364
    paint metal1

    box [expr ($i + 1) * 736 + 24 + 46] 212 [expr ($i + 1) * 736 + 41 + 46] 229
    paint viali
    box [expr $i * 736 + 575] 146 [expr $i * 736 + 592] 163
    paint viali
    box [expr $i * 736 + 572] 140 [expr $i * 736 + 595] 212
    paint metal1

    # Intentionally add some extra capacitance to improve hold timing
    box [expr $i * 736 + 450 + 46] 180 [expr ($i + 1) * 736 + 200 + 46] 232
    paint metal1

set i 2
    box [expr $i * 736 + 696 + 46] 315 [expr $i * 736 + 713 + 46] 332
    paint viali
    box [expr ($i + 1) * 736 + 143 + 46] 381 [expr ($i + 1) * 736 + 160 + 46] 398
    paint viali
    box [expr ($i + 1) * 736 + 140 + 46] 312 [expr ($i + 1) * 736 + 163 + 46] 404
    paint metal1

    # Intentionally add some extra capacitance to improve hold timing
    box [expr $i * 736 + 450 + 46] 312 [expr ($i + 1) * 736 + 200 + 46] 364
    paint metal1

    box [expr ($i + 1) * 736 + 24 + 46] 212 [expr ($i + 1) * 736 + 41 + 46] 229
    paint viali
    box [expr $i * 736 + 575 + 46] 146 [expr $i * 736 + 592 + 46] 163
    paint viali
    box [expr $i * 736 + 572 + 46] 140 [expr $i * 736 + 595 + 46] 212
    paint metal1

    # Intentionally add some extra capacitance to improve hold timing
    box [expr $i * 736 + 450 + 46] 180 [expr ($i + 1) * 736 + 200 + 46] 232
    paint metal1
set i 3

box [expr $i * 736 + 696 + 46] 315 [expr $i * 736 + 713 + 46] 332
paint viali
box [expr $i * 736 + 550 + 46] 312 [expr ($i + 1) * 736 + 46] 364
paint metal1

box [expr $i * 736 + 575 + 46] 146 [expr $i * 736 + 592 + 46] 163
paint viali
box [expr $i * 736 + 550 + 46] 180 [expr ($i + 1) * 736 + 46] 232
paint metal1
box [expr $i * 736 + 572 + 46] 140 [expr $i * 736 + 595 + 46] 212
paint metal1

box [expr $i * 736 + 600 + 46] 200 [expr $i * 736 + 626 + 46] 226
paint via1
box [expr $i * 736 + 590 + 46] 192 [expr $i * 736 + 634 + 46] 350
paint metal2
box [expr $i * 736 + 600 + 46] 318 [expr $i * 736 + 626 + 46] 344
paint via1


# Wiring to mux
box -228 162 -206 179
paint viali
box -234 159 47 182
paint metal1
box 13 182 47 232
paint metal1
box 24 212 41 229
paint viali

box 143 381 160 398
paint viali
box 140 312 163 404
paint metal1
box 134 312 166 344
paint metal1
box 137 315 163 341
paint via1

box -77 79 -59 96
paint viali
box -83 76 160 99
paint metal1
box 137 99 160 231
paint metal1
box 134 199 166 231
paint metal1
box 137 202 163 228
paint via1
box 134 199 166 344
paint metal2

# Inputs
box -308 212 -291 229
paint viali
box -314 198 -280 232
paint metal1

label D FreeSans 0.125u -met1
port make
port use signal
port class input
port connections n s e w

box -354 144 -337 161
paint viali
box -365 135 -331 169
paint metal1

label WEN FreeSans 0.125u -met1
port make
port use signal
port class input
port connections n s e w


# Outputs
box 13 198 47 232
label Q FreeSans 0.125u -met1
port make
port use signal
port class output
port connections n s e w


set POWER_OFFSET 1800
# PWR
for {set i 0} {$i < 2} {incr i} {
    for {set j 0} {$j < 4} {incr j} {
        box [expr $j * 40 + 209 + $POWER_OFFSET] [expr $i * $ROW_HEIGHT - 16] [expr $j * 40 + 241 + $POWER_OFFSET] [expr $i * $ROW_HEIGHT + 16]
        paint via3
        box [expr $j * 40 + 211 + $POWER_OFFSET] [expr $i * $ROW_HEIGHT - 14] [expr $j * 40 + 239 + $POWER_OFFSET] [expr $i * $ROW_HEIGHT + 14]
        paint via2
    }
    for {set j 0} {$j < 5} {incr j} {
        box [expr $j * 32 + 208 + $POWER_OFFSET] [expr $i * $ROW_HEIGHT - 14] [expr $j * 32 + 234 + $POWER_OFFSET] [expr $i * $ROW_HEIGHT + 14]
        paint via1
    }
    box [expr 200 + $POWER_OFFSET] [expr $i * $ROW_HEIGHT - 17] [expr 370 + $POWER_OFFSET] [expr $i * $ROW_HEIGHT + 17]
    paint metal3
    box [expr 200 + $POWER_OFFSET] [expr $i * $ROW_HEIGHT - 17] [expr 370 + $POWER_OFFSET] [expr $i * $ROW_HEIGHT + 17]
    paint metal2
}

# GND
for {set j 0} {$j < 4} {incr j} {
    box [expr $j * 40 + 509 + $POWER_OFFSET] [expr -16 + 272] [expr $j * 40 + 541 + $POWER_OFFSET] [expr 16 + 272]
    paint via3
    box [expr $j * 40 + 511 + $POWER_OFFSET] [expr -14 + 272] [expr $j * 40 + 539 + $POWER_OFFSET] [expr 14 + 272]
    paint via2
}
for {set j 0} {$j < 5} {incr j} {
    box [expr $j * 32 + 508 + $POWER_OFFSET] [expr -14 + 272] [expr $j * 32 + 534 + $POWER_OFFSET] [expr 14 + 272]
    paint via1
}
box [expr 500 + $POWER_OFFSET] [expr -17 + 272] [expr 670 + $POWER_OFFSET] [expr 17 + 272]
paint metal3
box [expr 500 + $POWER_OFFSET] [expr -17 + 272] [expr 670 + $POWER_OFFSET] [expr 17 + 272]
paint metal2

# Power
box [expr 200 + $POWER_OFFSET] -50 [expr 370 + $POWER_OFFSET] [expr $ROW_HEIGHT + 50]
paint metal4
label VPWR FreeSans 0.25u -met4
port make
port use power
port class bidirectional
port connections n s e w

# Ground
box [expr 500 + $POWER_OFFSET] -50 [expr 670 + $POWER_OFFSET] [expr $ROW_HEIGHT + 50]
paint metal4
label VGND FreeSans 0.25u -met4
port make
port use ground
port class bidirectional
port connections n s e w

box -414 -50 [expr $REPEATS * 736 + 46] [expr $ROW_HEIGHT + 50]
save register.mag
quit -noprompt
