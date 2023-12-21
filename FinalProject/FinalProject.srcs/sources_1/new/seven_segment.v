`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2023 11:20:22 AM
// Design Name: 
// Module Name: seven_segment
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


module seven_segment(
    input clk,
    input[15:0] num,
    output reg [6:0] LED,
    output reg [3:0] an
);

    parameter zero = 7'b0000001;
    parameter one = 7'b1001111;
    parameter two = 7'b0010010;
    parameter three = 7'b0000110;
    parameter four = 7'b1001100;
    parameter five = 7'b0100100;
    parameter six = 7'b0100000;
    parameter seven = 7'b0001111;
    parameter eight = 7'b0000000;
    parameter nine = 7'b0000100;
    parameter letter_a = 7'b0000010;
    parameter letter_b = 7'b1100000;
    parameter letter_c = 7'b0110001;
    parameter letter_d = 7'b1000010;
    parameter letter_e = 7'b0110000;
    parameter letter_f = 7'b0111000;
    
    reg [19:0] refresh_counter;
    wire [1:0] an_state;
    reg [3:0] display_num;
    
    always@(posedge clk) begin
        refresh_counter <= refresh_counter + 1;
    end
    assign an_state = refresh_counter[19:18];
    
    always@(*) begin
        case(an_state)
            2'b00: begin
                an = 4'b1110;
                display_num = num[3:0];
            end
            2'b01: begin
                an = 4'b1101;
                display_num = num[7:4];
            end
            2'b10: begin
                an = 4'b1011;
                display_num = num[11:8];
            end
            2'b11: begin
                an = 4'b0111;
                display_num = num[15:12];
            end
        endcase
    end
    
    always@(*) begin
        case(display_num)
             4'd0 : LED = zero;
             4'd1 : LED = one;
             4'd2 : LED = two;
             4'd3 : LED = three;
             4'd4 : LED = four;
             4'd5 : LED = five;
             4'd6 : LED = six;
             4'd7 : LED = seven;
             4'd8 : LED = eight;
             4'd9 : LED = nine;
             4'd10 : LED = letter_a;
             4'd11 : LED = letter_b;
             4'd12 : LED = letter_c;
             4'd13 : LED = letter_d;
             4'd14 : LED = letter_e;
             4'd15 : LED = letter_f;
        endcase
    end
endmodule
