PROGRAM:=program.efi
BIN:=./bin
SRCS:=$(shell find -name "*.asm")
OBJS:=$(SRCS:.asm=.o)
FORMAT:=coff
LD:=ld
LDFLAGS:=
AFLAGS:=-a x86 -m amd64 -f
ASM:=yasm

$(BIN)/$(OBJS): $(SRCS)
	mkdir -p $(dir $@)
	$(ASM) $(AFLAGS) $(FORMAT) -o $@ $<

$(BIN)/$(PROGRAM): $(OBJS)
	$(LD) $< -o $@

.PHONY: clean
clean:
	rm -rf $(BIN)

