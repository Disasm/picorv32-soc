FIRMWARE_TXT = cores/firmware/firmware.txt
FIRMWARE_BIN = build/firmware.bin
FIRMWARE_ELF = build/riscv32imc-unknown-none-elf/release/picorv32-example

SYSTEM ?= de2-115-picorv32
#SYSTEM ?= ice40-picorv32-soc
SOF = build/$(SYSTEM)/bld-quartus/$(SYSTEM).sof

all: $(SOF)

.PHONY: $(FIRMWARE_ELF)
$(FIRMWARE_ELF):
	cd firmware && cargo build --release --target-dir=../build/

$(FIRMWARE_BIN): $(FIRMWARE_ELF)
	riscv32-unknown-elf-objcopy -O binary $< $@

$(FIRMWARE_TXT): $(FIRMWARE_BIN)
	hexdump -v -e '/4 "%08x\n"' $< > $@

sof: $(SOF)

.PHONY: $(SOF)
$(SOF): $(FIRMWARE_TXT)
	fusesoc --cores-root cores build $(SYSTEM)
	@cat build/$(SYSTEM)/bld-quartus/$(SYSTEM).fit.summary

.PHONY: program
program:
	fusesoc --cores-root cores pgm $(SYSTEM)

.PHONY: clean
clean:
	rm -f $(FIRMWARE_TXT)
	rm -rf build

