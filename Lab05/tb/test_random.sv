
module test_random;


        // In class alu_trans_c
        class alu_trans_c;

                // Declare a typedef variable OPERATION of type enum with LOGIC, ARITH and SHIFT as the values
                typedef enum {LOGIC,ARITH,SHIFT} OPERATION;

                // Add the following rand fields
                // alu_sel_in ( logic type, size 4)
                // rand_oper ( OPERATION type)
                rand OPERATION rand_oper;
                rand  logic[3:0] alu_sel_in;



                // Apply following constraints
                // If rand_oper = LOGIC then alu_sel_in should be inside [0:5]
                // If rand_oper = ARITH, then alu_sel_in should be inside [6:9]
                // If rand_oper = SHIFT, then alu_sel_in should be inside [10:15]
                // Give weightage of 2 to ARITH operation
                constraint con { if(rand_oper == LOGIC)
                                        alu_sel_in inside {[0:5]};
                                 else if (rand_oper == ARITH)
                                        alu_sel_in inside {[6:9]};
                                 else if (rand_oper == SHIFT)
                                        alu_sel_in inside {[10:15]};

                                rand_oper dist {LOGIC := 1,ARITH := 2,SHIFT := 1};
                                }
                // In post_randomize method ,display all the randomized values
                function void post_randomize();
                        $display("rand operation =  %s",rand_oper);
                        $display("alu_sel_in = %d",alu_sel_in);
                endfunction
        endclass

        alu_trans_c alu;

        // Within initial
        initial
                begin
                // Create an instance of alu_trans_c
                alu=new();
                // Generate 10 set of random values for the instance alu_trans_c
                repeat(10) begin

                // Randomize using 'assert' or 'if' construct
                if(alu.randomize())
                        $display("randomization is success\n");
                end
        end


endmodule

