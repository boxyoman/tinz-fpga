PROJ = example
PIN_DEF = tinz.pcf
DEVICE = 1k

all: build/$(PROJ).bin

build/%.blif: src/*.v
	yosys -p 'synth_ice40 -top top -blif $@' $<

build/%.asc: $(PIN_DEF) build/%.blif
	arachne-pnr -d $(DEVICE) -o $@ -p $^

build/%.bin: build/%.asc
	icepack $< $@

prog: build/$(PROJ).bin
	iceprog $<

sudo-prog: build/$(PROJ).bin
	@echo 'Executing prog as root!!!'
	iceprog $<

clean:
	rm -f build/$(PROJ).blif build/$(PROJ).asc build/$(PROJ).bin

.PHONY: all prog clean
