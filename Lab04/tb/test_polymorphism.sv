module test_polymorphism;


        // In class packet_c
        class packet_c;
                // In task send
                virtual task send();
                        // Display message "Sending base class packet"
                        $display("sending base class packet");
                endtask
        endclass

        // Extend badpacket_c from packet_c
        class badpacket_c extends packet_c;
                // Override task send
                virtual task  send();
                        // Display message "Sending derived class packet"
                        $display("Sending derived class packet");
                endtask
        endclass


        // Within initial
        initial
                begin
                // Create instances for badpacket_c and packet_c
                badpacket_c b1;
                packet_c p1;
                b1=new;
                p1=new;
                // Call send tasks using base and extended class handles
                p1.send;
                b1.send;
                // Assign extended class handle to base class handle
                p1=b1;
                // Call send task using base class object
                p1.send();
                end



endmodule
