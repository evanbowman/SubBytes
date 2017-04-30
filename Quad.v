
module SubBytesQuadraticPredictor(in, w);
   input      [7:0] in;
   output reg [3:0] out;
   wire [7:0]       sbOut;
   reg [3:0]        mulIn1, mulIn2, mulOut;
   SubBytes sb(in, sbOut);
   FFMul_K4_Q2(mulIn1, mulIn2, mulOut);
   always @ (sbOut) begin
      mulIn1 <= sbOut[7:4];
      mulIn2 <= sbOut[3:0];
   end
   always @ (mulOut) begin
      out <= mulOut;
   end
endmodule // SubBytesQuadraticPredictor
