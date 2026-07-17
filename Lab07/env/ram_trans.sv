class ram_trans;
   // Declare the following rand fields
        rand logic [63:0] data;
   // data (bit/logic type , size 64)
        rand logic [63:0] rd_address;
        rand logic [63:0] wr_address;
   // rd_address, wr_address (bit/logic type , size 12)
        rand logic read;
        rand logic write;
   // read, write (bit/logic type , size 1)
        logic [63:0] data_out;
   // Declare a variable data_out (logic type , size 64)
        static int trans_id;
   // Declare a static variable trans_id (int type), to keep the count of transactions generated
        static int no_of_read_trans;
        static int no_of_write_trans;
        static int no_of_RW_trans;
   // Declare three static variables no_of_read_trans, no_of_write_trans, no_of_RW_trans (int type)


   // Add the following constraints
   // wr_address!=rd_address;
        constraint valid_oper { {read,write}!=2'b00;}
        constraint valid_addr { wr_address!=rd_address;}
        constraint valid_data { data inside {[1:4294]};}
   // read,write != 2'b00;

   // data between 1 and 4294

        virtual function void  display(input string str);
                $display(str);
                $display("data is %d",data);
                $display("read address  is %d",rd_address);
                $display("write address is %d",wr_address);
                $display("read is %d",read);
                $display("write is %d",write);
                $display("no of read transaction is %d",no_of_read_trans);
                $display("no of write transaction is %d",no_of_write_trans);
                $display("no of read and write %d",no_of_RW_trans);
                $display("output data is %d",data_out);
        endfunction
   //In virtual function display
   // display the string
   // display all the properties of the transaction class
        function void  post_randomize();
   // In post_randomize method
      // Increment trans_id
                trans_id++;
      // If it is only read transaction, increment no_of_read_trans
                if(this.read == 1)
                        no_of_read_trans++;
      // If it is only write transaction, increment no_of_write_trans
                else if(this.write == 1)
                        no_of_write_trans++;
      // If it is read-write transaction, increment no_of_RW_trans
                else if(this.read == 1 && this.write == 1)
                        no_of_RW_trans++;
                this.display("randomized data");
        endfunction
      // call the display method and pass a string

endclass
