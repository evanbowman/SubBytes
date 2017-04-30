
module SubBytesHammingTestBench();
   reg  [7:0] in;
   wire [7:0] out;
   wire [3:0] w, S;
   reg [11:0] checkerInput;
   reg [8:0]  i, j;
   SubBytes sb(in, out);
   SubBytesHammingPredictor sbhp(in, w);
   SubBytesHammingChecker sbhc(checkerInput, S);
   initial begin
      $display("\nRUNNING TESTS FOR 2 BIT ERROR DETECTION");
      in = 0;
      $display(" - Syndrome tests for no errors...");
      repeat (256) begin
         #1;
         checkerInput = {out, w};
         #1;
         if (S != 0) begin
            $display(" - Error: SubBytes logic fundamentally broken.");
            $finish;
         end
         in = in + 1;
      end
      $display(" - Passed!");      
      in = 0;
      $display("\n - Syndrome tests for one error...");
      repeat (256) begin
         for (i = 0; i < 12; i = i + 1) begin
            #1;
            checkerInput = {out, w};
            checkerInput[i] = ~checkerInput[i];
            #1;
            if (S == 0) begin
               $display(" - Error: single bit error somehow masked");
               $finish;
            end
         end
         in = in + 1;
      end
      $display(" - Passed!");
      in = 0;
      $display("\n - Syndrome tests for two errors...");
      repeat (256) begin
         for (i = 0; i < 12; i = i + 1) begin
            for (j = 0; j < i; j = j + 1) begin
               #1;
               checkerInput = {out, w};
               checkerInput[i] = ~checkerInput[i];
               checkerInput[j] = ~checkerInput[j];
               #1;
               if (S == 0) begin;
                  $display(" - Error: double bit error somehow masked");
                  $finish;
               end;
            end
         end
         in = in + 1;
      end
      $display(" - Passed!");
   end
endmodule // SubBytesHammingTestBench
