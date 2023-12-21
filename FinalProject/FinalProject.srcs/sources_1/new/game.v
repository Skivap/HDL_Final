parameter size = 10;

module game_single(
    input clk,
    input rst,
    input [3:0] key,
    
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   input valid,
   output reg [3:0] vgaRed,
   output reg [3:0] vgaGreen,
   output reg [3:0] vgaBlue,
   output [3:0] x, // for debuging purpose only
   output [3:0] y  // --
);
    wire one_sec;
    reg game_over;
    one_second os(clk, rst, one_sec);
    
    reg [7:0] board [0:99]; // 10 x 10 x 8bit
    reg [7:0] next_board [0:99];
    
    reg [3:0] x, y;
    reg [7:0] size;
    
    always@(posedge clk) begin
        if(rst) begin
            game_over <= 1'b0;
            x <= 4'd5;
            y <= 4'd5;
            size <= 8'd3;
        end
        else begin
            if(one_sec && !game_over) begin
                if(key == 4'b0001) begin // UP
                    if(y == 0) game_over <= 1'b1;
                    else y <= y-1;
                end
                else if(key == 4'b0010) begin // DOWN
                    if(y == 9) game_over <= 1'b1;
                    else y <= y+1;
                end
                else if(key == 4'b0100) begin // LEFT
                    if(x == 0) game_over <= 1'b1;
                    else x <= x-1;
                end
                else if(key == 4'b1000) begin // RIGHT
                    if(x == 9) game_over <= 1'b1;
                    else x <= x+1;
                end
            end
            
        end
    end
    
    // reset board
    reg [7:0] i;
    reg board_rst, board_update;
    always@(posedge clk) begin
        if(rst) begin
            for(i=0; i<100; i=i+1) begin
                board[i] = 8'd0;
            end
        end
        else begin
            if(one_sec) begin
                for(i=0; i<100; i=i+1) begin
                    board[i] = next_board[i];
                end
            end
        end
        
    end
    
    // next board
    reg [7:0] j;
    always@(posedge clk) begin
        for(j=0; j<100; j=j+1) begin
            if(x * 10 + y == j)
                next_board[j] = size;
            else if(board[j] > 0)
                next_board[j] = board[j] - 1;
        end
    end
    
    //pixel gen
   wire [3:0] x_c, y_c;
   assign x_c = (h_cnt-120)/40;
   assign y_c = (v_cnt-40)/40;
   
   always @(*) begin
       if(!valid)
             {vgaRed, vgaGreen, vgaBlue} = 12'h0;
        else if(h_cnt < 120 || h_cnt >= 520 || v_cnt < 40 || v_cnt >= 440)
             {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(board[x_c * 10 + y_c] > 0)
            {vgaRed, vgaGreen, vgaBlue} = 12'hf00;
        else
             {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   end
endmodule