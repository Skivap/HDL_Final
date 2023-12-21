module random(clk, rst_n, out);
    input clk;
    input rst_n;
    output reg [8-1:0] out;
    reg t;
    
    always@(posedge clk) begin
        if(!rst_n) begin
            out = 8'b1011_1101; 
        end
        else begin
            t = (out[1] ^ out[2]) ^ (out[3] ^ out[7]);
            out = {out[6:0], t};
        end
    end
endmodule