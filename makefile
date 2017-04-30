CC = iverilog

all: SubBytes.v Hamming.v SubBytesHammingTestBench.v
	$(CC) -o SubBytes SubBytes.v Hamming.v SubBytesHammingTestBench.v

run: all
	vvp SubBytes
