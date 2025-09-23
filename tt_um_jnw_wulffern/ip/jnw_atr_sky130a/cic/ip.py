#!/usr/bin/env python3
import json

name = "{type}CH_{contacts}C"

cell = """
        { "name" : "{name}1F2",
          "inherit" : "{type}CH",
          "abstract" : 0,
          "afterNew":{
              "copyColumns": [
                  {
                      "count": {count},
                      "offset": 9,
                      "length": 1
                  }
              ]
          }
        },
        { "name" : "{name}TAPTOP",
          "inherit" : "{type}TAPTOP",
          "abstract" : 0,
          "afterNew":{
              "copyColumns": [
                  {
                      "count": {count},
                      "offset": 9,
                      "length": 1
                  }
              ]
          }
        },
        { "name" : "{name}TAPBOT",
          "inherit" : "{type}TAPBOT",
          "abstract" : 0,
          "afterNew":{
              "copyColumns": [
                  {
                      "count": {count},
                      "offset": 9,
                      "length": 1
                  }
              ]
          }
        },
        { "name" : "{name}5F0",
          "inherit" : "{type}CH2",
          "abstract" : 0,
          "afterNew":{
              "copyColumns": [
                  {
                      "count": {count},
                      "offset": 9,
                      "length": 1
                  }
              ]
          }
        },
        { "name" : "{name}TOP",
          "spice" : [
            ".subckt {name}TOP",
            "xa1 {name}TAPBOT",
            "xa2 D2 G2 S2 B {name}1F2",
            "xa3 D3 G3 S3 B {name}5F0",
            "xa4 {name}TAPTOP",
            "xb1 {name}TAPBOT",
            "xb2 D4 G4 S4 B {name}1F2",
            "xb3 D5 G5 S5 B {name}5F0",
            "xb4 {name}TAPTOP",
            ".ends"
        ]
        }
        """

types = ["P","N"]
contacts = [2,4,8,12]

#- Generate all transistors
cells = list()
names = list()
for t in types:
    for c in contacts:
        cname = name.replace("{type}",t) \
                    .replace("{contacts}",str(c))
        names.append(cname +"1F2")

        ss = cell.replace("{type}",t) \
                 .replace("{name}",cname) \
                 .replace("{count}",str(c-2))
        names.append(cname +"5F0")
        cells.append(ss)

N = len(cells)

allnames = list()



with open("../cic/cells","w") as fo:
    fo.write("CELLS = " + " ".join(names))

with open("../cic/cells.json","w") as fo:

    fo.write(json.dumps(names))

with open("../cic/alltran.json","w") as fo:
    fo.write("""
{
   "cells" : [
""")
    for i in range(0,N):
        st = cells[i]
        if(i <N-1):
            st += ","
        fo.write(st)
    fo.write("""
   ]
}
""")
