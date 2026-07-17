
class ram_gen;
        int number_of_transactions = 10;
   //Declare a handle 'gen_trans' of class type ram_trans which has to be randomized
        ram_trans gen_trans;
   //Declare a handle 'data2send' of class type ram_trans which has to be put into the mailboxes
        ram_trans data2send;
   //Declare two mailboxes gen2rd, gen2wr  parameterized by ram_trans
        mailbox #(ram_trans) gen2rd;
        mailbox #(ram_trans) gen2wr;
   //In constructor
   //add mailboxes parameterized by transaction class as an argument and make the assignment
   //and create the object for the handle to be randomized
        function new(mailbox #(ram_trans) gen2rd,mailbox #(ram_trans) gen2wr);
                this.gen2rd=gen2rd;
                this.gen2wr=gen2wr;
                this.gen_trans=new;
        endfunction

   // In virtual task start
   virtual task start();
   //Inside fork join_none
   //Generate random transactions equal to number_of_transactions(defined in package)
                fork
                begin
                        for(int i=0;i<number_of_transactions;i++) begin
                                assert(gen_trans.randomize());
                        end
                end
                join_none
   //Randomize using transaction handle using 'if' or 'assert'
   //If randomization fails, display message "DATA NOT RANDOMIZED" and stop the simulation

   //Shallow copy gen_trans to data2send
                 data2send = new gen_trans;
   //Put the handle into both the mailboxes
                gen2rd.put(data2send);
                gen2wr.put(data2send);
   endtask: start

endclass: ram_gen
