
module SubBytesQuadTestBench();
   wire       err;
   reg  [7:0] in;
   wire [7:0] out;
   wire [3:0] w;
   reg [11:0] checkerInput;
   real       errCount;
   SubBytes sb(in, out);
   SubBytesQuadraticPredictor sbqp(in, w);
   SubBytesQuadraticChecker sbqc(checkerInput, err);
   initial begin
      $display("\nRUNNING TESTS FOR BYTE ERROR DETECTION");
      in = 0;
      $display(" - Error tests for no errors");
      repeat (256) begin
         #1;
         checkerInput = {out, w};
         #1;
         if (err) begin
            $display(" - Error: Something went horribly wrong");
            $finish;
         end
         in = in + 1;
      end
      $display(" - Passed!\n");
      errCount = 0;
      repeat (256) begin
         #1;
         checkerInput = {out, w};
         checkerInput[11:4] = ~checkerInput[11:4];
         #1;
         if (!err) begin
            errCount = errCount + 1;
         end
         in = in + 1;
      end
      $display(" - For whole byte errors, number of errors masked: %f", errCount);
      $display(" - Therefore, masking probability is %f", errCount / 256.0);
   end
endmodule // SubBytesQuadTestBench
