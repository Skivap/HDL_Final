module clock_divisor(clk1, clk);
    input clk;
    output clk1;
    
    reg [1:0] num;
    wire [1:0] next_num;
    
    always @(posedge clk) begin
      num <= next_num;
    end
    
    assign next_num = num + 1'b1;
    assign clk1 = num[1];

endmodule

module one_second(clk, rst, one_second_enable);
    input clk, rst;
    output one_second_enable;
    
    reg [26:0] counter;
    always@(posedge clk) begin
        if(rst) begin
            counter <= 27'd0;
        end
        else begin
            if(counter >= 27'd19999999)
                counter <= 0;
            else
                counter <= counter + 1;
        end
    end
    
    assign one_second_enable = (counter == 27'd19999999) ? 1'b1 : 1'b0;
endmodule

module frame_counter(clk, rst, frame_enable);
    input clk, rst;
    output frame_enable;
    
    reg [26:0] counter;
    always@(posedge clk) begin
        if(rst) begin
            counter <= 27'd0;
        end
        else begin
            if(counter >= 27'd1999999)
                counter <= 0;
            else
                counter <= counter + 1;
        end
    end
    
    assign frame_enable = (counter == 27'd1999999) ? 1'b1 : 1'b0;
endmodule

module clock_divisor_25MHz(clk1, clk, clk22);
    input clk;
    output clk1;
    output clk22;
    reg [21:0] num;
    wire [21:0] next_num;
    
    always @(posedge clk) begin
      num <= next_num;
    end
    
    assign next_num = num + 1'b1;
    assign clk1 = num[1];
    assign clk22 = num[21];
endmodule



