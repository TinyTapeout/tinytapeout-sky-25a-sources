---
layout: page
title: Compiling the library 
---

The transistor library is compiled using ciccreator. 

# Compiling

Do see the command that get's run, do 

```bash
cd work
make ip -n
```

```bash
# A python script to generate the transistors
test -f ../cic/ip.py && python3 ../cic/ip.py

# Compile the json and tech into the .cic format (JSON)
cd ../design/;../../ciccreator/bin/cic  --I ../cic ../cic/ip.json  ../cic/sky130.tech JNW_ATR_SKY130A 

# Transpile the *.cic into SPICE, verilog, Schematics and Layout
cd ../design/; cicpy  transpile JNW_ATR_SKY130A.cic ../cic/sky130.tech JNW_ATR_SKY130A  --spice --verilog --xschem --magic --smash "(P|N)CHIOA" --exclude ""

# Check if there is a post script, and run that
test -f ../cic/post.py && python3 ../cic/post.py
```

# Structure

The base transistors are defined in `cic/transistors.json`, 
and the python script will generate different number of contacts.



