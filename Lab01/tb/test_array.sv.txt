module test_array();


        // Declare a dynamic array data_da of int data type
        int data_da[];
        // Declare queues data_q & addr_q of int data type
        int data_q[$],addr_q[$];



        // Declare associative array data_mem of int data type and indexed with bit[7:0]

        int data_mem[bit[7:0]];
        // Declare int variable result,and and an 8 bit variable idx
        int result;
        bit [7:0] idx;


        initial
                begin
                        // Allocate 10 memory locations for dynamic array & initialize
                     data_da=new[10];

                        // all the locations with some random values less than 20 & display the array
                     foreach(data_da[i])
                                data_da[i]={$random}%20;
                     $display("%p",data_da);




                        // Call the array reduction method sum which returns the sum
                      result=data_da.sum;
                        // of all elements of array and collect the return value to the variable result


                        // Display the sum of elements, result
                      $display("sum of element=%p",result);
 // Similarly explore other array reduction methods
                        // product,or,and & xor
                       result=data_da.product;
                       $display("product=%0d",result,);
                         result=data_da.xor;
                       $display("xor=%0d",result);



                        // Call the array reduction method sum with "with" clause which returns
                        // total number of elements satisfying the condition within the "with" clause

                        result = data_da.sum with (int'(item>7));

                        // Display the value of the result

                        $display(" no. of items greater than 7 = %0d", result);

                        // Similarly explore other array reduction methods with "with"clause
                         result=data_da.sum with((item%2==0)*item);
                        $display("0p",result);

                        // Sorting Methods

                        // call all the sorting methods like reverse, sort, rsort &
                        data_da.sort();
                        $display("after sort =%p",data_da);

                        data_da.reverse();
                          $display("after reverse  sort =%p",data_da);

                        // shuffle & display the array after execution of each method to
                        // understand the behaviour of the array methods
                         data_da.shuffle();
                          $display("after shuffle =%p",data_da);
  // Call Array locator methods like min, max, unique,find_* with,
                        // find_*_index with using dynamic array & display
                        // the contents of data_q after execution of each method to
                        // understand the behaviour of the array methods
                        data_q=data_da.min();
                          $display("min =%p",data_q);
                        data_q=data_da.max();
                         $display("max =%p",data_q);
                        data_q=data_da.find_first_index with (item%2==1);
                          $display("first index of a odd number=%p",data_q);
                        data_q=data_da.find_last with (item>4);
                           $display("last item greater than 4 =%p",data_q);


                        //Generate some 10 random address less than 100 within a repeat loop
                        //push the address in to the addr_q
                        repeat(10)
                                begin
                                      result={$random}%100;
                                      addr_q.push_back(result);
                                end

                        //Display the addr_q
                                 $display("the queue is %p",addr_q);




                        // With in for loop update the associate array with random data less than 200

                        // based on the address stored in addr_q
                        // Hint: To get the address use pop method
                        for(int i=0;i<10;i++)
                                begin
                                    data_mem[addr_q.pop_back()]={$random}%200;
                                end

                        // Display the contents of associate array using foreach loop
                        foreach(data_mem[i])
 $display("data_mem[%d]=%d",i,data_mem[i]);

                        // Display the first index of the array by using associative array method first
                         // Display the first element of the array

                        if(data_mem.first(idx));
                                $display("first entry %d in address %d",data_mem[idx],idx);



                        // Display the last index of the array by using associative array method last
                          // Display the last element of the array

                        if(data_mem.last(idx));
                                $display("last entry %d in address %d",data_mem[idx],idx);

                end

endmodule
