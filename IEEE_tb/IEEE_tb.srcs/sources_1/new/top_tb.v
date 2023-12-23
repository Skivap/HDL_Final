module top;
    reg clk = 0;
    reg [63:0] a, b;
    wire [63:0] out;
    
    always#(1) clk = !clk;
    
    simul s(
    clk, a, b, out
);
    
    initial begin
        a = 64'b0_10000000110_1101000011011101011000111000100001100101100101001011;
        b = 64'b0_10000001011_0001110101010110100110010101101010101111011110010000;
        #2 $finish;
    end
endmodule;