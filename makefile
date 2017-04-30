CC = iverilog

all: SubBytesHamming SubBytesQuad

SubBytesHamming: SubBytes.v Hamming.v SubBytesHammingTestBench.v
	$(CC) -o SubBytesHamming SubBytes.v Hamming.v SubBytesHammingTestBench.v

SubBytesQuad: SubBytes.v FFMul4.v SubBytesQuadTestBench.v
	$(CC) -o SubBytesQuad SubBytes.v FFMul4.v SubBytesQuadTestBench.v

run: all
	vvp SubBytesHamming
	vvp SubBytesQuad
