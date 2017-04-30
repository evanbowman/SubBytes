
module SubBytesQuadraticPredictor(in, w);
   input      [7:0] in;
   output reg [3:0] w;
   wire [7:0]       sbOut;
   reg [3:0]        mulIn1, mulIn2;
   wire [3:0]       mulOut;
   SubBytes sb(in, sbOut);
   FFMul_K4_Q2 mul_4_2(mulIn1, mulIn2, mulOut);
   always @ (sbOut) begin
      mulIn1 <= sbOut[7:4];
      mulIn2 <= sbOut[3:0];
   end
   always @ (mulOut) begin
      w <= mulOut;
   end
endmodule // SubBytesQuadraticPredictor


module SubBytesQuadraticChecker(in, err);
   input [11:0] in;
   output reg   err;
   wire [3:0]   mulOut;
   FFMul_K4_Q2 mul_4_2(in[11:8], in[7:4], mulOut);
   always @ (mulOut) begin
      err <= mulOut != in[3:0];
   end
endmodule // SubBytesQuadraticChecker
