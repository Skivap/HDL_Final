module neural_network(
    input clk,
    input in1,
    input in2,
    input in3,
    input in4,
    input in5,
    input in6,
    
//    output [23:0] out1,
//    output [23:0] out2,
//    output [23:0] out3,
    
    output [1:0] move,
    
    output reg [3:0] h1,
    output reg [3:0] h2,
    output reg [3:0] h3,
    output reg [3:0] h4,
    output reg [3:0] h5,
    output reg [3:0] h6,
    output reg [3:0] h7,
    
    output reg [3:0] c1,
    output reg [3:0] c2,
    output reg [3:0] c3
);
    wire [25:0] out1;
    wire [25:0] out2;
    wire [25:0] out3;
    
    // hidden layer
    wire [11:0] r1, r2, r3, r4, r5, r6, r7;
    hidden_node_1 hn1(in1, in2, in3, in4, in5, in6, r1, clk);
    hidden_node_2 hn2(in1, in2, in3, in4, in5, in6, r2, clk);
    hidden_node_3 hn3(in1, in2, in3, in4, in5, in6, r3, clk);
    hidden_node_4 hn4(in1, in2, in3, in4, in5, in6, r4, clk);
    hidden_node_5 hn51(in1, in2, in3, in4, in5, in6,r5, clk);
    hidden_node_6 hn6(in1, in2, in3, in4, in5, in6, r6, clk);
    hidden_node_7 hn7(in1, in2, in3, in4, in5, in6, r7, clk);
    
    // output layer
    output_node_1 on1(r1, r2, r3, r4, r5, r6, r7, out1, clk);
    output_node_2 on2(r1, r2, r3, r4, r5, r6, r7, out2, clk);
    output_node_3 on3(r1, r2, r3, r4, r5, r6, r7, out3, clk);
    
    assign move = 
        out1 > out2 ?
            out1 > out3 ?
                0 : 2
           : out2 > out3 ? 1 : 2;
    always@(posedge clk) begin
        case(move)
        0: begin
            c1 <= 12;
            c2 <= 0;
            c3 <= 0;
        end
        1: begin
            c1 <= 0;
            c2 <= 12;
            c3 <= 0;
        end
        2: begin
            c1 <= 0;
            c2 <= 0;
            c3 <= 12;
        end
        endcase
    end
    always@(posedge clk) begin
//        if(out1 / 240 > 12)
//            c1 = 12;
//        else
//            c1 = out1 / 240;
//        if(out2 / 240 > 12)
//            c2 = 12;
//        else
//            c2 = out2 / 240;
//        if(out3 / 240 > 12)
//            c3 = 12;
//        else
//            c3 = out3 / 240;
        
        // Calculate h1 based on r1
        if (r1 / 60 > 12)
            h1 <= 12;
        else
            h1 <= r1 / 60;
        
        // Calculate h2 based on r2
        if (r2 / 60 > 12)
            h2 <= 12;
        else
            h2 <= r2 / 60;
        
        // Calculate h3 based on r3
        if (r3 / 60 > 12)
            h3 <= 12;
        else
            h3 <= r3 / 60;
        
        // Calculate h4 based on r4
        if (r4 / 60 > 12)
            h4 <= 12;
        else
            h4 <= r4 / 60;
        
        // Calculate h5 based on r5
        if (r5 / 60 > 12)
            h5 <= 12;
        else
            h5 <= r5 / 60;
        
        // Calculate h6 based on r6
        if (r6 / 60 > 12)
            h6 <= 12;
        else
            h6 <= r6 / 60;
        
        // Calculate h7 based on r7
        if (r7 / 60 > 12)
            h7 <= 12;
        else
            h7 <= r7 / 60;
    end
endmodule

module output_node_1(
    a, b, c, d, e, f, g,
    out, clk
);
    input [11:0] a, b, c, d, e, f, g;
    output reg [25:0] out;
    input clk;
    
    reg [25:0] sum1, sum2;
   
    always@(posedge clk) begin
        sum1 <= (a * 314) + (d * 465) + (f * 280);
        sum2 <= (b * 199) + (c * 82) + (e * 393) + (g * 101);
        out <= sum1 > sum2 ? sum1 - sum2 : 0;
    end
    
endmodule

module output_node_2(
    a, b, c, d, e, f, g,
    out, clk
);
    input [11:0] a, b, c, d, e, f, g;
    output reg [25:0] out;
    input clk;
    reg [25:0] sum1, sum2;
    
    always@(posedge clk) begin
        sum1 <= (a * 791) + (b * 317) + (d * 365) + (e * 376);
        sum2 <= (c * 438) + (f * 790) + (g * 137);
        out <= sum1 > sum2 ? sum1 - sum2 : 0;
    end
    
endmodule

module output_node_3(
    a, b, c, d, e, f, g,
    out, clk
);
    input [11:0] a, b, c, d, e, f, g;
    output reg [25:0] out;
    input clk;
    reg [25:0] sum1, sum2;
    
    always@(posedge clk) begin
        sum1 <= (a * 441) + (b * 221) + (c * 36) + (d * 366) + (f * 420) + (g * 667);
        sum2 <= (e * 301) + 13;
        out <= sum1 > sum2 ? sum1 - sum2 : 0;
    end
endmodule

module hidden_node_1(
    a, b, c, d, e, f,
    out, clk
);
    input a, b, c, d, e, f;
    output reg [11:0] out;
    input clk;
    reg [11:0] sum1, sum2;
    
    always@(posedge clk) begin
        sum1 <= (b * 498) + (c * 490) + 89;
        sum2 <= (a * 436) + (d * 648) + (e * 595) + (f * 198);
        out <= sum1 > sum2 ? sum1 - sum2 : 0;
    end
    
endmodule

module hidden_node_2(
    a, b, c, d, e, f,
    out, clk
);
    input a, b, c, d, e, f;
    output reg [11:0] out;
    input clk;
    reg [11:0] sum1, sum2;
    
    always@(posedge clk) begin
        sum1 <= (b * 285) + (d * 205) + (f * 437);
        sum2 <= (a * 450) + (c * 230) + (e * 960);
        out <= sum1 > sum2 ? sum1 - sum2 : 0;
    end
endmodule

module hidden_node_3(
    a, b, c, d, e, f,
    out, clk
);
    input a, b, c, d, e, f;
    output reg [11:0] out;
    input clk;
    reg [11:0] sum1, sum2;
    
    always@(posedge clk) begin
        sum1 <= (a * 25) + (e * 758);
        sum2 <= (b * 500) + (c * 345) + (d * 324) + (f * 891);
        out <= sum1 > sum2 ? sum1 - sum2 : 0;
    end
endmodule

module hidden_node_4(
    a, b, c, d, e, f,
    out, clk
);
    input a, b, c, d, e, f;
    output reg [11:0] out;
    input clk;
    reg [11:0] sum1, sum2;
    
    always@(posedge clk) begin
         sum1 <= (b * 483) + (c * 205) + (d * 126);
         sum2 <= (a * 78) + (e * 465) + (f * 672);
         out <= sum1 > sum2 ? sum1 - sum2 : 0;
    end
endmodule

module hidden_node_5(
    a, b, c, d, e, f,
    out, clk
);
    input a, b, c, d, e, f;
    output reg [11:0] out;
    input clk;
    reg [11:0] sum1, sum2;
    
    always@(posedge clk) begin
        sum1 <= (a * 711) + (c * 69) + (f * 650) + 40;
        sum2 <= (b * 1114) + (d * 715) + (e * 544);
        out <= sum1 > sum2 ? sum1 - sum2 : 0;
    end
endmodule

module hidden_node_6(
    a, b, c, d, e, f,
    out, clk
);
    input a, b, c, d, e, f;
    output reg[11:0] out;
    input clk;
    reg [11:0] sum1, sum2;
    
    always@(posedge clk) begin
        sum1 <= (a * 143) + (b * 870) + (c * 497) + (d * 202) + (f * 233);
        sum2 <= (e * 349);
        out <= sum1 > sum2 ? sum1 - sum2 : 0;
    end
endmodule

module hidden_node_7(
    a, b, c, d, e, f,
    out, clk
);
    input a, b, c, d, e, f;
    output reg [11:0] out;
    input clk;
    reg [11:0] sum1, sum2;
    
    always@(posedge clk) begin
        sum1 <= (b * 36) + (c * 87) + (d * 745) + (e * 669) + (f * 19);
        sum2 <= (a * 986);
        out <= sum1 > sum2 ? sum1 - sum2 : 0;
    end
    
endmodule