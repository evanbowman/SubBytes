module FFMul4TestBench();
   reg  [3:0] in1, in2;
   wire [3:0] mulOut;
   FFMul_K4_Q2 mul(in1, in2, mulOut);
   initial begin
      $display("\nRUNNING TESTS FOR 4-BIT FIELD MULTIPLIER");
      $display(" - Four times three is twelve");
      in1 = 4;
      in2 = 3;
      #1;
      if (mulOut != 12) begin
         $display(" - Error: 4 times 3 in F^4_2 should equal 12");
         $finish;
      end
      $display(" - Success!\n");
      $display(" - Two times two is four");
      in1 = 2;
      in2 = 2;
      #1;
      if (mulOut != 4) begin
         $display(" - Error: 2 times 2 in F^4_2 should equal 4");
         $finish;
      end
      $display(" - Success!\n");
      $display(" - Five times eight is fourteen");
      in1 = 5;
      in2 = 8;
      #1;
      if (mulOut != 14) begin
         $display(" - Error: 8 times 5 in F^4_2 should equal 14");
         $finish;
      end
      $display(" - Success!\n");
      $display(" - Fifteen times fifteen is ten");
      in1 = 15;
      in2 = 15;
      #1;
      if (mulOut != 10) begin
         $display(" - Error: 15 times 15 in F^4_2 should equal 10");
         $finish;
      end
      $display(" - Success!\n");
   end
endmodule // FFMul_tb
