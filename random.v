module random(clk, rst_n, out);
    // Galois http://rdsl.csit-sun.pub.ro/docs/PROIECTARE%20cu%20FPGA%20CURS/lecture6[1].pdf
    input clk;
    input rst_n;
    output reg [8:0] out = 9'b1_1011_1101;
    reg t;
    
    always@(posedge clk) begin
        if(rst_n) begin
            out <= 8'b1011_1101; 
        end
        else begin
            out[8] <= out[0];
            out[7] <= out[8];
            out[6:4] <= out [7:5];
            out[3] <= out[4] ^ out[0];
            out[2] <= out[3] ^ out[0];
            out[1] <= out[2] ^ out[0];
            out[0] <= out[1];
        end
    end
endmodule

/*
module gaussian_random( // Create gaussian normal distribution random from 0 to 64
    input clk,
    input rst,
    output [7:0] out
);
    wire [3:0] a, b, c, d, e, f, g, h;
    mini_gaussian lfsr1(clk, rst, 8'b1011_1101, a);
    mini_gaussian lfsr2(clk, rst, 8'b1010_1001, b);
    mini_gaussian lfsr3(clk, rst, 8'b0100_0101, c);
    mini_gaussian lfsr4(clk, rst, 8'b0110_1110, d);
    mini_gaussian lfsr5(clk, rst, 8'b1001_0000, e);
    mini_gaussian lfsr6(clk, rst, 8'b0101_0100, f);
    mini_gaussian lfsr7(clk, rst, 8'b1111_0000, g);
    mini_gaussian lfsr8(clk, rst, 8'b1011_0111, h);
    
    assign out = a + b + c + d + e + f + g + h;
    
endmodule

module mini_gaussian(clk, rst_n, rst_value, sum);
    input clk;
    input rst_n;
    input [7:0] rst_value;
    output [3:0] sum;
    reg [7:0] out;
    
    always@(posedge clk) begin
        if(rst_n) begin
            out <= rst_value;
        end
        else begin
            out[7] <= out[0];
            out[6:4] <= out [7:5];
            out[3] <= out[4] ^ out[0];
            out[2] <= out[3] ^ out[0];
            out[1] <= out[2] ^ out[0];
            out[0] <= out[1];
        end
    end
    
    assign sum = out[0] + out[1] + out[2] + out[3] + out[4] + out[5] + out[6] + out[7];
endmodule
*/