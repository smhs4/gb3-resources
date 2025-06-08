DESIGN	= dragonfly_v
GB3_ROOT = /gb3-resources

fail-safe:
	yosys -q yscript/$(DESIGN).ys
	nextpnr-ice40 --up5k --package uwg30 --json build/$(DESIGN).json --pcf pcf/$(DESIGN).pcf --asc build/$(DESIGN).asc
	icetime -p pcf/$(DESIGN).pcf -P uwg30 -d up5k -t build/$(DESIGN).asc
	icepack build/$(DESIGN).asc build/design.bin
	cp build/design.bin $(GB3_ROOT)/build/

minimal:
	yosys -q yscript/$(DESIGN).ys -DUSE_DSP
	nextpnr-ice40 --up5k --package uwg30 --json build/$(DESIGN).json --pcf pcf/$(DESIGN).pcf --asc build/$(DESIGN).asc
	icetime -p pcf/$(DESIGN).pcf -P uwg30 -d up5k -t build/$(DESIGN).asc
	icepack build/$(DESIGN).asc build/design.bin
	cp build/design.bin $(GB3_ROOT)/build/

standard:
	yosys -q yscript/$(DESIGN).ys -DUSE_DSP -DUSE_UART
	nextpnr-ice40 --up5k --package uwg30 --json build/$(DESIGN).json --pcf pcf/$(DESIGN).pcf --asc build/$(DESIGN).asc
	icetime -p pcf/$(DESIGN).pcf -P uwg30 -d up5k -t build/$(DESIGN).asc
	icepack build/$(DESIGN).asc build/design.bin
	cp build/design.bin $(GB3_ROOT)/build/


clean:
	rm -f *.json *.blif *.asc *.bin