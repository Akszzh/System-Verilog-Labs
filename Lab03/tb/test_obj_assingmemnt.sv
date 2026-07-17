module test_obj_assignment;


        // Declare class packet
        class packet;
                // Within the class packet
                // Declare the below class properties
                bit [3:0] data;
                // data (bit type, size 4)
                bit [15:0] addr;
                // addr (bit type, size 16)
                bit [15:0] mem;
                // mem  (bit type, size 16)


        endclass: packet

        // Declare two handles for the packet class "pkt_h1" and "pkt_h2"

        packet p1,p2;

        // Within initial block
        initial
                begin
                // Construct pkt_h1 object
                        p1=new();
                // Assign random values to the addr, data and mem of pkt_h1 object
                        p1.data=4'b1101;
                        p1.addr=16'h1000;
                        p1.mem=16'h64;
                // Display the object pkt_h1
                        $display("packet p1 data is =  %p",p1);
                // Assign pkt_h1 to pkt_h2

                        p2=p1;
                $display("\nAfter assigning one object to the other,");
                // Display the objects pkt_h1 & pkt_h2
                        $display("the packet p1 = %p \n the packet p2 = %p",p1,p2);
                // Make changes to address and data using handle pkt_h2
                p2.addr=96;
                p2.mem=99;


                $display("After changing the values of properties with one handle,");
                $display("the packet p1 is %p \n the packet p2 is %p2",p1,p2);
                // Display the object pkt_h1 & pkt_h2
                // observe that pkth1 and pkth2 will display the same contents because,
                // both the handles point to the same object
                end

endmodule
