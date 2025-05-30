DESIGN = fpga-playground
GB3_ROOT = /gb3-resources
sail-nextpnr:
	mkdir -p $(GB3_ROOT)/build
	yosys -p "synth_ice40 -blif $(DESIGN).blif; write_json $(DESIGN).json" top.v agu.v
	nextpnr-ice40 --up5k --package uwg30 --json $(DESIGN).json --pcf $(DESIGN).pcf --asc $(DESIGN).asc
	icetime -p $(DESIGN).pcf -P uwg30 -d up5k -t $(DESIGN).asc
	icepack $(DESIGN).asc design.bin
	cp design.bin $(GB3_ROOT)/build/


clean:
	rm -f *.json *.blif *.asc *.bin