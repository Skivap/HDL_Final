module game_ai(
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
    
    reg [3:0] x, y;
    reg [7:0] size;
    reg [1:0] move, last_move;
    
    // Parameter movement
    parameter up_ = 2'b00;
    parameter down_ = 2'b01;
    parameter left_ = 2'b10;
    parameter right_ = 2'b11;
    
    // Decode One-Hot to Movement
    always@(*) begin
        case(key)
            4'b0001: move = last_move == down_ ? down_ : up_;
            4'b0010: move = last_move == up_ ? up_ : down_;
            4'b0100: move = last_move == right_ ? right_ : left_;
            4'b1000: move = last_move == left_ ? left_ : right_;
        endcase
    end
    
    // Generate the Apple
    wire [7:0] random_number, random_coor;
    reg [7:0] apple, next_apple;
    reg has_apple;
    random random_(
        .clk(clk), 
        .rst_n(rst), 
        .out(random_number)
    );
    
    assign random_coor = random_number % 100;
    always@(posedge clk) begin
        if(board[random_coor] == 0 && random_coor != apple)
            next_apple = random_coor;
    end
    
    // Snake Movement
    always@(posedge clk) begin
        if(rst) begin
            game_over <= 1'b0;
            x <= 4'd5;
            y <= 4'd5;
            size <= 8'd1;
            apple <= next_apple;
        end
        else begin
            if(one_sec && !game_over) begin
                case(move)
                    up_: begin
                        if(y == 0) game_over <= 1'b1;
                        else if(board[x*10+(y-1)]>0) game_over <= 1'b1;
                        else y <= y-1;
                        
                        if(x*10+(y-1) == apple) begin
                            has_apple <= 1;
                            size <= size + 1;
                            apple <= next_apple;
                        end
                        else begin
                            has_apple <= 0;
                        end
                    end
                    down_: begin
                        if(y == 9) game_over <= 1'b1;
                        else if(board[x*10+(y+1)]>0) game_over <= 1'b1;
                        else y <= y+1;
                        
                        if(x*10+(y+1) == apple) begin
                            size <= size + 1;
                            apple <= next_apple;
                            has_apple <= 1;
                        end
                        else begin
                            has_apple <= 0;
                        end
                    end
                    left_: begin
                        if(x == 0) game_over <= 1'b1;
                        else if(board[(x-1)*10+y]>0) game_over <= 1'b1;
                        else x <= x-1;
                        
                        if((x-1)*10+y == apple) begin
                            size <= size + 1;
                            apple <= next_apple;
                            has_apple <= 1;
                        end
                        else begin
                            has_apple <= 0;
                        end
                    end
                    right_: begin
                        if(x == 9) game_over <= 1'b1;
                        else if(board[(x+1)*10+y]>0) game_over <= 1'b1;
                        else x <= x+1;
                        
                        if((x+1)*10+y == apple) begin
                            size <= size + 1;
                            apple <= next_apple;
                            has_apple <= 1;
                        end
                        else begin
                            has_apple <= 0;
                        end
                    end
                endcase
                last_move <= move;
            end 
        end
    end
    
    // update board
    reg [7:0] i;
    reg board_update;
    always@(posedge clk) begin
        if(rst) begin
            for(i=0; i<100; i=i+1) begin
                board[i] = 8'd0;
            end
            board_update = 0;
        end
        else begin
            if(one_sec) begin
                board_update = 1;
            end
            else if(board_update) begin
                for(i=0; i<100; i=i+1) begin
                    if(x*10 + y == i)
                        board[i] = size;
                    else if(board[i] > 0 && !has_apple)
                        board[i] = board[i]-1;
                    else
                        board[i] = board[i];
                end
                board_update = 0;
            end
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
        else if(x_c * 10 + y_c == apple)
            {vgaRed, vgaGreen, vgaBlue} = 12'h00f;
        else
             {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   end
endmodule