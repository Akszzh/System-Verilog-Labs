module test_semaphore;

        // In class driver
        class driver;

                // write task send with input argument of string type
                task send(string str);
                        // Get the key using sem handle
                        sem.get(1);
                        // Display the string which indicates the respective driver information
                        $display("got key is  %s",str);
                        // Put the key using sem handle
                        sem.put(1);
                        // Display the string which indicates the respective driver information
                        $display("dropped key is %s",str);
                endtask
        endclass
        // Declare an array of two drivers
        driver dr[2];

        // Declare a handle for semaphore
        semaphore sem;
        // Within initial block
        initial begin
                // Create instances of drivers
                foreach(dr[i]) begin
                // Create the instance of semaphore handle and initialize it with 1 key
                        sem = new(1);
                end
                // Call send task of both drivers 5 times within fork join
                // pass any meaning full string message to indicate the driver information
                dr[1].send("1");
                dr[2].send("1");
                end
        endmodule
