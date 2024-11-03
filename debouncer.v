module debouncer(input raw, input clk, output reg clean);
    reg [2:0] counter;
    wire tc;
   
    always @(posedge clk) begin
        if (~raw)
            counter <= 3'b000;
        else
            counter <= counter + 3'b001;
    end
   
    assign tc = (counter==3'b111);
   
    always @ (posedge clk) begin
        if (~raw)
            clean <= 1'b0;
        else if (tc)
            clean <= 1'b1;
    end
endmodule
