CC = iverilog

all: SubBytes.v
	$(CC) -o SubBytes SubBytes.v

run: all
	vvp SubBytes
