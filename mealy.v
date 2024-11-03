module mealy(x, z, clk, rst);
    input x, clk, rst;
    output z;
    reg [2:0] Q = 3'b000;
    assign z = x && (Q == 3'b011);
    always @(posedge clk) begin
        if (rst)
            Q <= 3'b000;
        else if (Q==3'b000) begin//state 0
            if(x == 1'b0)
                Q <= 3'b000;
            else if (x == 1'b1)
                Q <= 3'b001;
        end
        else if (Q==3'b001) begin//state 1: 1
            if(x == 1'b0)
                Q <= 3'b000;
            else if (x == 1'b1)
                Q <= 3'b010;
        end
        else if (Q==3'b010) begin//state 2: 11
            if(x == 1'b0)
                Q <= 3'b011;
            else if (x == 1'b1)
                Q <= 3'b010;
        end
        else if (Q==3'b011) begin//state 3: 110
            if(x == 1'b0)
                Q <= 3'b000;
            else if (x == 1'b1)
                Q <= 3'b001;
        end  
    end
   
endmodule
