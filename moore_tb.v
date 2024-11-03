module moore_tb();
    reg x, clk, rst;
    wire z;
   
    moore uut(x, z, clk, rst);
   
    always begin
        #10 clk = ~clk;
    end
   
    initial begin
        x = 0; rst = 0; clk = 0;
        #5 x = 1;
        #40 x = 0;
        #40 rst = 1;
        #20 rst = 0; x = 1;
        #20 x = 0;
        #20 x = 1;
        #20 $stop;
    end
endmodule
