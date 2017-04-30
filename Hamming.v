
module SubBytesHammingPredictor(in, w);
   input      [7:0] in;
   wire       [7:0] sbOut;
   output reg [3:0] w;
   SubBytes sb(in, sbOut);
   always @ (sbOut) begin
      /* -------------------
      Encoding:                     | 1 1 1 1 |
                                    | 1 1 1 0 |
                                    | 0 1 1 1 |
      | x7 x6 x5 x4 x3 x2 x1 x0 | * | 1 1 0 1 | = | w3 w2 w1 w0 |
                                    | 1 0 1 1 |
                                    | 1 1 0 0 |
                                    | 0 0 1 1 |
                                    | 0 1 1 0 |
       -------------------- */
      w[3] <= sbOut[7] ^ sbOut[6] ^ sbOut[4] ^ sbOut[3] ^ sbOut[2];
      w[2] <= sbOut[7] ^ sbOut[6] ^ sbOut[5] ^ sbOut[4] ^ sbOut[2] ^ sbOut[0];
      w[1] <= sbOut[7] ^ sbOut[6] ^ sbOut[5] ^ sbOut[3] ^ sbOut[1] ^ sbOut[0];
      w[0] <= sbOut[7] ^ sbOut[5] ^ sbOut[4] ^ sbOut[3] ^ sbOut[1];
   end
endmodule // SubBytesHammingPredictor


module SubBytesHammingChecker(in, S);
   input     [11:0] in;
   output reg [3:0] S;
   always @ (in) begin
      /* -------------------
       Syndrome calculation:
       
       | 1 1 0 1 1 1 0 0 : 1 0 0 0 |        | S0 |
       | 1 1 1 1 0 1 0 1 : 0 1 0 0 |        | S1 |
       | 1 1 1 0 1 0 1 1 : 0 0 1 0 | * in = | S2 |
       | 1 0 1 1 1 0 1 0 : 0 0 0 1 |        | S3 |
         ~~~~~~~~~~~~~~~   ~~~~~~~
              -P'             I
       -------------------- */
      S[0] <= in[11] ^ in[10] ^ in[8] ^ in[7] ^ in[6] ^ in[3];
      S[1] <= in[11] ^ in[10] ^ in[9] ^ in[8] ^ in[6] ^ in[4] ^ in[2];
      S[2] <= in[11] ^ in[10] ^ in[9] ^ in[7] ^ in[5] ^ in[4] ^ in[1];
      S[3] <= in[11] ^ in[9] ^ in[8] ^ in[7] ^ in[5] ^ in[0];
   end
endmodule // SubBytesHammingDecoder
