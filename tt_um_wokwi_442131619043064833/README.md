![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/wokwi_test/badge.svg) ![](../../workflows/fpga/badge.svg)

# Tiny Tapeout Wokwi Project Template
generated from TECNM-TESVG COURSE with IEEE EDS CHIP PRACTICE 2025
- [Read the documentation for project](docs/info.md)

## What is Tiny Tapeout?

Edited from tiny tapeout template
Tiny Tapeout is an educational project that aims to make it easier and cheaper than ever to get your digital and analog designs manufactured on a real chip.
To learn more and get started, visit https://tinytapeout.com.

## Wokwi Projects

A BCD to 7-segment encoder is a digital logic circuit that converts
a Binary-Coded Decimal (BCD) input into signals that can drive a 7-segment display.
BCD represents decimal digits 0–9 in 4-bit binary:

Outputs
7 segments of the display: a, b, c, d, e, f, g
Each output controls one segment. A high (1) signal lights up the segment, and low (0) turns it off.
Optional DP (decimal point) can also be controlled.

Working Principle
The circuit maps each BCD input to the combination of segments that 
forms the corresponding decimal digit on the 7-segment display.
For example, to display 0, segments a, b, c, d, e, f are ON, and g is OFF.
AND EXTRA GATES INCLUDE CONTROL OF POINT 

Edit the [info.yaml](info.yaml) and change the `wokwi_id` to the ID of your Wokwi project. You can find the ID in the URL of your project, it's the big number after `wokwi.com/projects/`.

The GitHub action will automatically fetch the digital netlist from Wokwi and build the ASIC files.

## Enable GitHub actions to build the results page
- Default data
- [Enabling GitHub Pages](https://tinytapeout.com/faq/#my-github-action-is-failing-on-the-pages-part)

## Resources
- default data
- [FAQ](https://tinytapeout.com/faq/)
- [Digital design lessons](https://tinytapeout.com/digital_design/)
- [Learn how semiconductors work](https://tinytapeout.com/siliwiz/)
- [Join the community](https://tinytapeout.com/discord)
- [Build your design locally](https://www.tinytapeout.com/guides/local-hardening/)

## What next?
- default data
- [Submit your design to the next shuttle](https://app.tinytapeout.com/).
- Edit [this README](README.md) and explain your design, how it works, and how to test it.
- Share your project on your social network of choice:
  - LinkedIn [#tinytapeout](https://www.linkedin.com/search/results/content/?keywords=%23tinytapeout) [@TinyTapeout](https://www.linkedin.com/company/100708654/)
  - Mastodon [#tinytapeout](https://chaos.social/tags/tinytapeout) [@matthewvenn](https://chaos.social/@matthewvenn)
  - X (formerly Twitter) [#tinytapeout](https://twitter.com/hashtag/tinytapeout) [@tinytapeout](https://twitter.com/tinytapeout)
