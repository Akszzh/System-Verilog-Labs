 module top();

   //Import ram_pkg
   import ram_pkg::*;

   parameter cycle = 10;

   reg clock;

   //Instantiate the interface
   ram_if DUV_IF(clock);

   //Declare an handle for the test as test_h
   test test_h;

   //Instantiate the DUV

   ram_4096 RAM ( .clk        (clock),
                  .data_in    (DUV_IF.data_in),
                  .data_out   (DUV_IF.data_out),
                  .wr_address (DUV_IF.wr_address),
                  .rd_address (DUV_IF.rd_address),
                  .read       (DUV_IF.read),
                  .write      (DUV_IF.write)
                );

   //Generate the clock
   initial
      begin
         clock = 1'b0;
         forever #(cycle/2) clock=~clock;
      end

   initial
      begin

        `ifdef VCS
         $fsdbDumpvars(0, top);
        `endif
        //Create the object for test and pass the interface instances as arguments
         test_h = new(DUV_IF,DUV_IF, DUV_IF, DUV_IF);
         //Call the virtual task build and virtual task run
         test_h.build();
         test_h.run();
         $finish;
      end

endmodule
