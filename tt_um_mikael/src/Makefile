.PHONY: clean

test.v: test.vhdl
	ghdl -a test.vhdl
	ghdl --synth --out=verilog -o=test.v test


clean:
	rm -rfv *.o
	rm -rfv *.cf
	rm -rfv obj_dir
