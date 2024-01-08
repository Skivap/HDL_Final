module neural_network(
    input in1,
    input in2,
    input in3,
    input in4,
    input in5,
    input in6,
    
//    output [23:0] out1,
//    output [23:0] out2,
//    output [23:0] out3,
    
    output [1:0] move
);
    wire [25:0] out1;
    wire [25:0] out2;
    wire [25:0] out3;
    
    // hidden layer
    wire [11:0] r1, r2, r3, r4, r5, r6, r7;
    hidden_node_1 hn1(in1, in2, in3, in4, in5, in6, r1);
    hidden_node_2 hn2(in1, in2, in3, in4, in5, in6, r2);
    hidden_node_3 hn3(in1, in2, in3, in4, in5, in6, r3);
    hidden_node_4 hn4(in1, in2, in3, in4, in5, in6, r4);
    hidden_node_5 hn51(in1, in2, in3, in4, in5, in6,r5);
    hidden_node_6 hn6(in1, in2, in3, in4, in5, in6, r6);
    hidden_node_7 hn7(in1, in2, in3, in4, in5, in6, r7);
    
    // output layer
    output_node_1 on1(r1, r2, r3, r4, r5, r6, r7, out1);
    output_node_2 on2(r1, r2, r3, r4, r5, r6, r7, out2);
    output_node_3 on3(r1, r2, r3, r4, r5, r6, r7, out3);
    
    assign move = 
        out1 > out2 ?
            out1 > out3 ?
                0 : 2
           : out2 > out3 ? 1 : 2;
endmodule

module output_node_1(
    a, b, c, d, e, f, g,
    out
);
    input [11:0] a, b, c, d, e, f, g;
    output [25:0] out;
    wire [25:0] sum1, sum2;
    
    assign sum1 = (a * 314) + (d * 465) + (f * 280);
    assign sum2 = (b * 199) + (c * 82) + (e * 393) + (g * 101);
    assign out = sum1 > sum2 ? sum1 - sum2 : 0;
    
endmodule

module output_node_2(
    a, b, c, d, e, f, g,
    out
);
    input [11:0] a, b, c, d, e, f, g;
    output [25:0] out;
    wire [25:0] sum1, sum2;
    
    assign sum1 = (a * 791) + (b * 317) + (d * 365) + (e * 376);
    assign sum2 = (c * 438) + (f * 790) + (g * 137);
    assign out = sum1 > sum2 ? sum1 - sum2 : 0;
    
endmodule

module output_node_3(
    a, b, c, d, e, f, g,
    out
);
    input [11:0] a, b, c, d, e, f, g;
    output [25:0] out;
    wire [25:0] sum1, sum2;
    
    assign sum1 = (a * 441) + (b * 221) + (c * 36) + (d * 366) + (f * 420) + (g * 667);
    assign sum2 = (e * 301) + 13;
    assign out = sum1 > sum2 ? sum1 - sum2 : 0;
    
endmodule

module hidden_node_1(
    a, b, c, d, e, f,
    out
);
    input a, b, c, d, e, f;
    output [11:0] out;
    wire [11:0] sum1, sum2;
    
    assign sum1 = (b * 498) + (c * 490) + 89;
    assign sum2 = (a * 436) + (d * 648) + (e * 595) + (f * 198);
    assign out = sum1 > sum2 ? sum1 - sum2 : 0;
    
endmodule

module hidden_node_2(
    a, b, c, d, e, f,
    out
);
    input a, b, c, d, e, f;
    output [11:0] out;
    wire [11:0] sum1, sum2;
    
    assign sum1 = (b * 285) + (d * 205) + (f * 437);
    assign sum2 = (a * 450) + (c * 230) + (e * 960);
    assign out = sum1 > sum2 ? sum1 - sum2 : 0;
endmodule

module hidden_node_3(
    a, b, c, d, e, f,
    out
);
    input a, b, c, d, e, f;
    output [11:0] out;
    wire [11:0] sum1, sum2;
    
    assign sum1 = (a * 25) + (e * 758);
    assign sum2 = (b * 500) + (c * 345) + (d * 324) + (f * 891);
    assign out = sum1 > sum2 ? sum1 - sum2 : 0;
endmodule

module hidden_node_4(
    a, b, c, d, e, f,
    out
);
    input a, b, c, d, e, f;
    output [11:0] out;
    wire [11:0] sum1, sum2;
    
    assign sum1 = (b * 483) + (c * 205) + (d * 126);
    assign sum2 = (a * 78) + (e * 465) + (f * 672);
    assign out = sum1 > sum2 ? sum1 - sum2 : 0;
endmodule

module hidden_node_5(
    a, b, c, d, e, f,
    out
);
    input a, b, c, d, e, f;
    output [11:0] out;
    wire [11:0] sum1, sum2;
    
    assign sum1 = (a * 711) + (c * 69) + (f * 650) + 40;
    assign sum2 = (b * 1114) + (d * 715) + (e * 544);
    assign out = sum1 > sum2 ? sum1 - sum2 : 0;
endmodule

module hidden_node_6(
    a, b, c, d, e, f,
    out
);
    input a, b, c, d, e, f;
    output [11:0] out;
    wire [11:0] sum1, sum2;
    
    assign sum1 = (a * 143) + (b * 870) + (c * 497) + (d * 202) + (f * 233);
    assign sum2 = (e * 349);
    assign out = sum1 > sum2 ? sum1 - sum2 : 0;
endmodule

module hidden_node_7(
    a, b, c, d, e, f,
    out
);
    input a, b, c, d, e, f;
    output [11:0] out;
    wire [11:0] sum1, sum2;
    
    assign sum1 = (b * 36) + (c * 87) + (d * 745) + (e * 669) + (f * 19);
    assign sum2 = (a * 986);
    assign out = sum1 > sum2 ? sum1 - sum2 : 0;
endmodule