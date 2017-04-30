CC = iverilog

all: SubBytesHamming SubBytesQuad FFMul4

SubBytesHamming: SubBytes.v Hamming.v SubBytesHammingTestBench.v
	$(CC) -o SubBytesHamming SubBytes.v Hamming.v SubBytesHammingTestBench.v

SubBytesQuad: SubBytes.v FFMul4.v SubBytesQuadTestBench.v
	$(CC) -o SubBytesQuad SubBytes.v FFMul4.v SubBytesQuadTestBench.v

FFMul4: FFMul4.v FFMul4TestBench.v
	$(CC) -o FFMul4 FFMul4.v FFMul4TestBench.v

run: all
	vvp SubBytesHamming
	vvp FFMul4
	vvp SubBytesQuad
