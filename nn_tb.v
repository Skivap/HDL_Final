`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/07/2024 05:36:06 AM
// Design Name: 
// Module Name: nn_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module nn_tb();

    reg clk = 0;
    reg  a, b, c, d, e, f;
//    wire [23:0] out1, out2, out3;
    wire [1:0] dir;
    
    neural_network nn( a, b, c, d, e, f, dir);
    always#(1) clk = !clk;
    
    initial begin
        a = 1;
        b = 1;
        c = 1;
        d = 1;
        e = 1;
        f = 1;

        #1
        $finish;
    end
    
endmodule
