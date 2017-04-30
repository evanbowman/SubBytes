module FFMul4TestBench();
   reg  [3:0] in1, in2;
   wire [3:0] mulOut;
   FFMul_K4_Q2 mul(in1, in2, mulOut);
   initial begin
      $display("\nRUNNING TESTS FOR 4-BIT FIELD MULTIPLIER");
      in1 = 5;
      in2 = 8;
      #1;
      if (mulOut != 14) begin
         $display(" - Error: 8 times 5 in F^4_2 should equal 14");
         $finish;
      end
      $display(" - Passed!\n");
   end
endmodule // FFMul_tb
