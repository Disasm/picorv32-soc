FIRMWARE_TXT = cores/firmware/firmware.txt
FIRMWARE_BIN = build/firmware.bin
FIRMWARE_ELF = build/riscv32imc-unknown-none-elf/release/picorv32-example

PROJ = de2-115-picorv32
SOF = build/$(PROJ)/bld-quartus/$(PROJ).sof

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
	fusesoc --cores-root cores build $(PROJ)
	@cat build/$(PROJ)/bld-quartus/$(PROJ).fit.summary

.PHONY: program
program:
	fusesoc --cores-root cores pgm $(PROJ)

.PHONY: clean
clean:
	rm -f $(FIRMWARE_TXT)
	rm -rf build

