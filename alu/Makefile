ENT = alu

all : ghdl yosys arachne icepack

ghdl :
	ghdl -a $(ENT).vhdl

yosys :
	yosys -p 'ghdl $(ENT); synth_ice40 -blif $(ENT).blif' -m /home/pieter/Coding/hdl/ghdlsynth-beta/ghdl.so

arachne :
	arachne-pnr -d 1k -o $(ENT).asc -p $(ENT).pcf $(ENT).blif

icepack :
	icepack $(ENT).asc $(ENT).bin

program :
	iceprog $(ENT).bin

prog : program

show : ghdl
	yosys -p 'ghdl $(ENT); show' -m /home/pieter/Coding/hdl/ghdlsynth-beta/ghdl.so

clean :
	-rm *.asc *.bin *.blif *.cf
