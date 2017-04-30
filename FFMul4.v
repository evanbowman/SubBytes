
module FFLog_K4_Q2(in, out);
   input      [3:0] in;
   output reg [3:0] out;
   always @ (in) begin
      case (in)
        4'b0001: out = 0;
        4'b0010: out = 1;
        4'b0011: out = 4;
        4'b0100: out = 2;
        4'b0101: out = 8;
        4'b0110: out = 5;
        4'b0111: out = 10;
        4'b1000: out = 3;
        4'b1001: out = 14;
        4'b1010: out = 9;
        4'b1011: out = 7;
        4'b1100: out = 6;
        4'b1101: out = 13;
        4'b1110: out = 11;
        4'b1111: out = 12;
      endcase
   end
endmodule // FFLog_K4_Q2


module FFAntiLog_K4_Q2(in, out);
   input      [3:0] in;
   output reg [3:0] out;
   always @ (in) begin
     case (in)
       0: out = 4'b0001;
       1: out = 4'b0010;
       2: out = 4'b0100;
       3: out = 4'b1000;
       4: out = 4'b0011;
       5: out = 4'b0110;
       6: out = 4'b1100;
       7: out = 4'b1011;
       8: out = 4'b0101;
       9: out = 4'b1010;
       10: out = 4'b0111;
       11: out = 4'b1110;
       12: out = 4'b1111;
       13: out = 4'b1101;
       14: out = 4'b1001;
     endcase
   end
endmodule // FFAntiLog_K4_Q2


module FFMul_K4_Q2(in1, in2, out);
   input      [3:0] in1, in2;
   wire [3:0]       in1LogOut, in2LogOut, antiLogOut;
   output reg [3:0] out;
   reg [3:0]        antiLogIn;
   FFLog_K4_Q2 in1Log(in1, in1LogOut);
   FFLog_K4_Q2 in2Log(in2, in2LogOut);
   FFAntiLog_K4_Q2 antiLog(antiLogIn, antiLogOut);
   always @ (in1LogOut or in2LogOut) begin
      // Special case: forward any zero inputs to the output
      if (in1 == 0 || in2 == 0) out <= 0;
      // Otherwise perform a field multiplication
      else antiLogIn <= (in1LogOut + in2LogOut) % 15;
   end
   always @ (antiLogOut) begin
      out <= antiLogOut;
   end
endmodule // FFMul_K4_Q2
