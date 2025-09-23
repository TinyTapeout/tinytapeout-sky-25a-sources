#!/usr/bin/env python3

from pyosys import libyosys as ys

scl_prefix = "\\sky130_fd_sc_hd__"

combo_logic = {
    "a2111o", "a2111oi", "a211o", "a211oi", "a21bo", "a21boi", "a21o", "a21oi", "a221o", "a221oi", "a222oi", "a22o",
    "a22oi", "a2bb2o", "a2bb2oi", "a311o", "a311oi", "a31o", "a31oi", "a32o", "a32oi", "a41o", "a41oi", "and2", "and2b",
    "and3", "and3b", "and4", "and4b", "and4bb",  "buf", "bufbuf", "bufinv", "conb", "fa", "fah", "fahcin", "fahcon",
    "ha", "inv", "maj3", "mux2", "mux2i", "mux4", "nand2", "nand2b", "nand3", "nand3b", "nand4", "nand4b", "nand4bb",
    "nor2", "nor2b", "nor3", "nor3b", "nor4", "nor4b", "nor4bb", "o2111a", "o2111ai", "o211a", "o211ai", "o21a",
    "o21ai", "o21ba", "o21bai", "o221a", "o221ai", "o22a", "o22ai", "o2bb2a", "o2bb2ai", "o311a", "o311ai", "o31a",
    "o31ai", "o32a", "o32ai", "o41a", "o41ai", "or2", "or2b", "or3", "or3b", "or4", "or4b", "or4bb", "xnor2", "xnor3",
    "xor2", "xor3",
}

tristates = {
    "ebufn", "einvn", "einvp",
}

flops = {
    "dfbbn", "dfbbp", "dfrbp", "dfrtn", "dfrtp", "dfsbp", "dfstp", "dfxbp", "dfxtp", "edfxbp", "edfxtp", "sdfbbn",
    "sdfbbp", "sdfrbp", "sdfrtn", "sdfrtp", "sdfsbp", "sdfstp", "sdfxbp", "sdfxtp", "sedfxbp", "sedfxtp",
}

latches = {
    "dlclkp", "dlrbn", "dlrbp", "dlrtn", "dlrtp", "dlxbn", "dlxbp", "dlxtn", "dlxtp", "sdlclkp",
}

misc_cells = {
    "clkbuf", "clkdlybuf4s15", "clkdlybuf4s18", "clkdlybuf4s25", "clkdlybuf4s50", "clkinv", "clkinvlp", "decap",
    "diode", "dlygate4sd1", "dlygate4sd2", "dlygate4sd3", "dlymetal6s2s", "dlymetal6s4s", "dlymetal6s6s", "fill",
    "tap", "tapvgnd", "tapvgnd2", "tapvpwrvgnd",
}

unsupported = {
    "lpflow_bleeder", "lpflow_clkbufkapwr", "lpflow_clkinvkapwr", "lpflow_decapkapwr", "lpflow_inputiso0n",
    "lpflow_inputiso0p", "lpflow_inputiso1n", "lpflow_inputiso1p", "lpflow_inputisolatch", "lpflow_isobufsrc",
    "lpflow_isobufsrckapwr", "lpflow_lsbuf_lh_hl_isowell_tap", "lpflow_lsbuf_lh_isowell", "lpflow_lsbuf_lh_isowell_tap",
    "macro_sparecell", "probec_p", "probe_p",
}


ys.run_pass("read_verilog orig_gl/tt_um_htfab_split_flops.nl.v")

d = ys.yosys_get_design()
m = d.top_module()

def get_wire(name, index=None):
    if index is None:
        return ys.SigSpec(m.wire(ys.IdString("\\" + name)))
    else:
        return ys.SigSpec(ys.SigBit(m.wire(ys.IdString("\\" + name)), index), 1)

def add_wire(name):
    return ys.SigSpec(m.addWire(ys.IdString(name)))

def add_cell(cellname, celltype, ports):
    cell = m.addCell(ys.IdString(cellname), ys.IdString(scl_prefix + celltype))
    for key, value in ports.items():
        #if not isinstance(value, ys.SigSpec):
        #    value = ys.SigSpec(value)
        cell.setPort(ys.IdString("\\" + key), value)

CLK1 = get_wire("clk")
CLK2 = get_wire("ui_in", 5)
SCE = get_wire("ui_in", 6)
SCD = get_wire("ui_in", 7)
SCQ = get_wire("uo_out", 7)

for c in list(m.cells()):
    ctype = c.type.str()
    if not ctype.startswith(scl_prefix):
        continue
    ctype, strength = ctype.removeprefix(scl_prefix).rsplit("_", 1)
    assert ctype not in unsupported
    assert ctype not in latches
    pins = {k.str().removeprefix("\\") : v for k, v in c.connections().items()}
    if SCQ in pins.values():
        print(f"Removed cell {ctype} connected to uo_out[0]")
        m.remove(c)
        continue  
    if ctype not in flops:
        continue
    CLK = pins["CLK"]
    assert CLK.is_wire()
    assert CLK.as_wire().name.str() == "\\clk"
    prefix = "$" + c.name.str().removeprefix("\\") + "_"
    D_S = add_wire(prefix + "D_S")
    M = add_wire(prefix + "M")
    match ctype:
        case "dfxtp":
            add_cell(prefix + "mux2", "mux2_1", {"A0": pins["D"], "A1": SCD, "S": SCE, "X": D_S})
            add_cell(prefix + "stage1", "dlxtp_1", {"GATE": CLK1, "D": D_S, "Q": M})
            add_cell(prefix + "stage2", "dlxtp_1", {"GATE": CLK2, "D": M, "Q": pins["Q"]})
        case "dfxbp":
            add_cell(prefix + "mux2", "mux2_1", {"A0": pins["D"], "A1": SCD, "S": SCE, "X": D_S})
            add_cell(prefix + "stage1", "dlxtp_1", {"GATE": CLK1, "D": D_S, "Q": M})
            add_cell(prefix + "stage2", "dlxbp_1", {"GATE": CLK2, "D": M, "Q": pins["Q"], "Q_N": pins["Q_N"]})
        case "dfrtp":
            RESET_B_S = add_wire(prefix + "RESET_B_S")
            add_cell(prefix + "mux2", "mux2_1", {"A0": pins["D"], "A1": SCD, "S": SCE, "X": D_S})
            add_cell(prefix + "or2", "or2_1", {"A": pins["RESET_B"], "B": SCE, "X": RESET_B_S})
            add_cell(prefix + "stage1", "dlrtp_1", {"GATE": CLK1, "RESET_B": RESET_B_S, "D": D_S, "Q": M})
            add_cell(prefix + "stage2", "dlrtp_1", {"GATE": CLK2, "RESET_B": RESET_B_S, "D": M, "Q": pins["Q"]})
        case "dfrbp":
            RESET_B_S = add_wire(prefix + "RESET_B_S")
            add_cell(prefix + "mux2", "mux2_1", {"A0": pins["D"], "A1": SCD, "S": SCE, "X": D_S})
            add_cell(prefix + "or2", "or2_1", {"A": pins["RESET_B"], "B": SCE, "X": RESET_B_S})
            add_cell(prefix + "stage1", "dlrtp_1", {"GATE": CLK1, "RESET_B": RESET_B_S, "D": D_S, "Q": M})
            add_cell(prefix + "stage2", "dlrbp_1", {"GATE": CLK2, "RESET_B": RESET_B_S, "D": M, "Q": pins["Q"], "Q_N": pins["Q_N"]})
        case _:
            assert False, f"Transform for {ctype} unimplemented"
    SCD = pins["Q"]
    m.remove(c)

add_cell("$_buf", "buf_1", {"A": SCD, "X": SCQ})
        
ys.run_pass("write_verilog patched_gl/tt_um_htfab_split_flops.nl.v")

