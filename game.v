module game_single(
    input clk,
    input rst,
    input rstVGA,
    input [3:0] key,
    
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   input valid,
   output [3:0] vgaRed,
   output [3:0] vgaGreen,
   output [3:0] vgaBlue,
   input switch,
   output [5:0] out,
   output [1:0] ai_move,
   output reg [5:0] x, 
   output reg [5:0] y
);
    wire one_sec;
    reg game_over;
    one_second os(clk, rst, one_sec);
    
    reg [8:0] board [0:399]; // 10 x 10 x 8bit
//    reg [3:0] direction [0:399]; // 2 bit pertama -> kemana, 2 bit ketrakhir -> dari mana
    
//    reg [4:0] x, y;
    reg [8:0] size;
    reg [1:0] move, last_move, next_move;
    reg [3:0] mkey;
    
    // AI MOVEMENT
    wire [5:0] input_param;
//    reg start_ai;
//    wire finish_ai, available_ai;
    
    assign out[0] = input_param[0];
    assign out[1] = input_param[1];
    assign out[2] = input_param[2];
    assign out[3] = input_param[3];
    assign out[4] = input_param[4];
    assign out[5] = input_param[5];
    
    //wire [1:0] ai_move;
    
    // Parameter movement
    parameter up_ = 2'b00;
    parameter down_ = 2'b01;
    parameter left_ = 2'b10;
    parameter right_ = 2'b11;
    
    always@(*) begin
        if(ai_move == 0)begin
            case(last_move) // turn right
                up_:    mkey = 4'b1000;
                down_:  mkey = 4'b0100;
                left_:  mkey = 4'b0001;
                right_: mkey = 4'b0010;
            endcase
        end
        else if(ai_move == 1) begin
            case(last_move)
                up_:    mkey = 4'b0001;
                down_:  mkey = 4'b0010;
                left_:  mkey = 4'b0100;
                right_: mkey = 4'b1000;
            endcase
        end
        else if(ai_move == 2) begin
            case(last_move)
                up_:    mkey = 4'b0100;
                down_:  mkey = 4'b1000;
                left_:  mkey = 4'b0010;
                right_: mkey = 4'b0001;
            endcase
        end
    end
    
    // Decode One-Hot to Movement
    always@(posedge clk) begin
      //  if(move == last_move) begin
      if(switch) begin
            case(key)
                4'b0001: move <= last_move == down_ ? down_ : up_; // up
                4'b0010: move <= last_move == up_ ? up_ : down_; // down
                4'b0100: move <= last_move == right_ ? right_ : left_; // left
                4'b1000: move <= last_move == left_ ? left_ : right_; // right
            endcase
      end
      else begin
            case(mkey)
                4'b0001: move <= last_move == down_ ? down_ : up_; // up
                4'b0010: move <= last_move == up_ ? up_ : down_; // down
                4'b0100: move <= last_move == right_ ? right_ : left_; // left
                4'b1000: move <= last_move == left_ ? left_ : right_; // right
            endcase
      end
       // end
    end
    
    // Generate the Apple
    wire [8:0] random_number, random_coor;
    reg [8:0] apple, next_apple;
    reg has_apple;
    random random_(
        .clk(clk), 
        .rst_n(rst), 
        .out(random_number)
    );
    
    assign random_coor = random_number % 400;
    always@(posedge clk) begin
        if(board[random_coor] == 0 && random_coor != apple)
            next_apple = random_coor;
    end
    
    // Snake Movement
//    reg [1:0] snake_state;
    reg update_board;
    always@(posedge clk) begin
        if(rst) begin
            game_over <= 1'b0;
            x <= 5'd5;
            y <= 5'd5;
            size <= 9'd1;
            apple <= next_apple;
            update_board <= 0;
        end
        else begin
                  if(one_sec && !game_over) begin
//                        snake_state <= 0;
                        case(move)
                            up_: begin
                                if(y == 0) game_over <= 1'b1;
                                else if(board[x*20+(y-1)]>1) game_over <= 1'b1;
                                else begin
                                    y <= y-1;
                                end
                                if(x*20+(y-1) == apple) begin
                                    has_apple <= 1;
                                    size <= size + 1;
                                    apple <= next_apple;
                                end
                                else begin
                                    has_apple <= 0;
                                end
                            end
                            down_: begin
                                if(y == 19) game_over <= 1'b1;
                                else if(board[x*20+(y+1)]>1) game_over <= 1'b1;
                                else begin
                                    y <= y+1;
                                end
                                
                                if(x*20+(y+1) == apple) begin
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
                                else if(board[(x-1)*20+y]>1) game_over <= 1'b1;
                                else begin
                                    x <= x-1;
                                end
                                
                                if((x-1)*20+y == apple) begin
                                    size <= size + 1;
                                    apple <= next_apple;
                                    has_apple <= 1;
                                end
                                else begin
                                    has_apple <= 0;
                                end
                            end
                            right_: begin
                                if(x == 19) game_over <= 1'b1;
                                else if(board[(x+1)*20+y]>1) game_over <= 1'b1;
                                else begin
                                    x <= x+1;
                                end
                                
                                if((x+1)*20+y == apple) begin
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
                        update_board <= 1;
                    end
              else begin
                update_board <= 0;
              end
        end
    end
    
    // update board
    genvar i;
    generate
    for(i=0; i<400; i=i+1) begin
        always@(posedge clk) begin
            if(rst) begin
                board[i] = 9'd0;
            end
            else begin
                if(update_board) begin
                    if(x*20 + y == i)
                        board[i] = size;
                    else if(board[i] > 0 && !has_apple)
                        board[i] = board[i]-1;
                    else
                        board[i] = board[i];
                end
            end
            
        end
    end
    endgenerate
    
    // GENERATE AI MOVEMENT
    /*
    reg input_param [0:5];
    reg ai_move [1:0]; 
    coordinate = (y, x) y-> vertical
    */
    
    neural_network nn(
        input_param[0], input_param[1], input_param[2], 
        input_param[3], input_param[4], input_param[5], 
        ai_move
    );
    
//    assign input_param[0] = 1;
//    assign input_param[1] = 0;
//    assign input_param[2] = 0;
//    assign input_param[3] = 0;
//    assign input_param[4] = 1;
//    assign input_param[5] = 0;
    assign input_param[0] = (((last_move == up_) && (x == apple/20) && (y < apple%20)) ||
                            ((last_move == down_) && (x == apple/20) && (y > apple%20)) ||
                            ((last_move == left_) && (x < apple/20) && (y == apple%20)) ||
                            ((last_move == right_) && (x > apple/20) && (y == apple%20)));
                            
    assign input_param[1] = (((last_move == up_) && (x < apple/20) && (y == apple%20)) ||
                            ((last_move == down_) && (x > apple/20) && (y == apple%20)) ||
                            ((last_move == left_) && (x == apple/20) && (y > apple%20)) ||
                            ((last_move == right_) && (x == apple/20) && (y < apple%20)));
                            
    assign input_param[2] = (((last_move == up_) && (x > apple/20) && (y == apple%20)) ||
                            ((last_move == down_) && (x < apple/20) && (y == apple%20)) ||
                            ((last_move == left_) && (x == apple/20) && (y > apple%20)) ||
                            ((last_move == right_) && (x == apple/20) && (y < apple%20)));
                            
    assign input_param[3] = (((last_move == up_) && (y == 0 ? 1 : board[x*20+(y-1)] > 1)) ||
                            ((last_move == down_) && (y == 19 ? 1 : board[x*20+(y+1)] > 1)) ||
                            ((last_move == left_) && (x == 0 ? 1 : board[(x-1)*20+y] > 1)) ||
                            ((last_move == right_) && (x == 19 ? 1 : board[(x+1)*20+y] > 1)));
                            
    assign input_param[4] = (((last_move == up_) && (x == 0 ? 1 : board[(x-1)*20+y] > 1)) ||
                            ((last_move == down_) && (x == 19 ? 1 : board[(x+1)*20+y] > 1)) ||
                            ((last_move == left_) && (y == 19 ? 1 : board[x*20+(y+1)] > 1)) ||
                            ((last_move == right_) && (y == 0 ? 1 : board[x*20+(y-1)] > 1)));
                            
    assign input_param[5] = (((last_move == up_) && (x == 19 ? 1 : board[(x+1)*20+y] > 1)) ||
                            ((last_move == down_) && (x == 0 ? 1 : board[(x-1)*20+y] > 1)) ||
                            ((last_move == left_) && (y == 0 ? 1 : board[x*20+(y-1)] > 1)) ||
                            ((last_move == right_) && (y == 19 ? 1 : board[x*20+(y+1)] > 1)));
                            
    // GENERATE THE PIXEL COLOR
   
   wire [5:0] x_c, y_c, pix_x, pix_y;
   wire [9:0] coordinate_pixel;
   assign coordinate_pixel = x_c * 20 + y_c < 400 ?  x_c * 20 + y_c : 0;
   
   wire [11:0] snake_color;
   assign x_c = (h_cnt-20)/15;
   assign y_c = (v_cnt-90)/15;
   assign pix_x = (h_cnt-20)%15;
   assign pix_y = (v_cnt-90)%15;
   
   pixel_snake pxs(
        pix_x, pix_y, snake_color
   );
   
    reg [11:0] pixel;
    assign {vgaRed, vgaGreen, vgaBlue} = {valid == 1'b1} ? pixel: 12'd0;

    always @(*) begin
       if(!valid)
             pixel = 12'h000;
        else if((h_cnt >= 10 && h_cnt < 20) || (h_cnt >= 320 && h_cnt < 330))
            if(v_cnt >= 90 && v_cnt < 390)
                pixel = 12'h740;
            else if((h_cnt == 17) && (v_cnt == 79))
                pixel = 12'h540;
            else if((h_cnt == 16) && (v_cnt >= 80 && v_cnt < 83))
                pixel = 12'h540;
            else if((h_cnt == 15) && (v_cnt >= 81 && v_cnt < 86))
                pixel = 12'h540;
            else if((h_cnt == 14) && (v_cnt >= 82) && (v_cnt < 89))
                pixel = 12'h540;
            else if((h_cnt == 13) && ((v_cnt >= 83) && (v_cnt < 90)))
                pixel = 12'h540; 
            else if((h_cnt == 12) && ((v_cnt >= 84) && (v_cnt < 91)))
                pixel = 12'h540;
            else if((h_cnt == 11) && ((v_cnt >= 85) && (v_cnt < 92)))
                pixel = 12'h540;
            else if((h_cnt == 10) && ((v_cnt >= 86) && (v_cnt < 93)))
                pixel = 12'h540; 
            else if((h_cnt == 323) && (v_cnt == 396))
                pixel = 12'h540;
            else if((h_cnt == 324) && (v_cnt >= 395 && v_cnt < 398))
                pixel = 12'h540;
            else if((h_cnt == 325) && (v_cnt >= 394) && (v_cnt < 399))
                pixel = 12'h540;
            else if((h_cnt == 326) && ((v_cnt >= 393) && (v_cnt < 400)))
                pixel = 12'h540; 
            else if((h_cnt == 327) && ((v_cnt >= 392) && (v_cnt < 399)))
                pixel = 12'h540;
            else if((h_cnt == 328) && ((v_cnt >= 391) && (v_cnt < 398)))
                pixel = 12'h540;
            else if((h_cnt == 329) && ((v_cnt >= 390) && (v_cnt < 397)))
                pixel = 12'h540; 
            else
                pixel = 12'hfff;
        else if((h_cnt >= 20 && h_cnt < 320) && ((v_cnt >= 80 && v_cnt < 90) || (v_cnt >= 390 && v_cnt < 400)))
            pixel = 12'h740;
        else if((v_cnt < 70) || (v_cnt >= 410))
            pixel = 12'hfff;
        else if(h_cnt < 10) begin
            if((h_cnt == 3) && (v_cnt == 93))
                pixel = 12'h540;
            else if((h_cnt == 4) && (v_cnt >= 92) && (v_cnt < 95))
                pixel = 12'h540;
            else if((h_cnt == 5) && (v_cnt >= 91) && (v_cnt < 96))
                pixel = 12'h540;
            else if((h_cnt == 6) && ((v_cnt >= 90) && (v_cnt < 97)))
                pixel = 12'h540; 
            else if((h_cnt == 7) && ((v_cnt >= 89) && (v_cnt < 96)))
                pixel = 12'h540;
            else if((h_cnt == 8) && ((v_cnt >= 88) && (v_cnt < 95)))
                pixel = 12'h540;
            else if((h_cnt == 9) && ((v_cnt >= 87) && (v_cnt < 94)))
                pixel = 12'h540; 
            else
                pixel = 12'hfff;
        end
        else if(h_cnt >= 330) begin
            if((h_cnt == 338) && (v_cnt == 387))
                pixel = 12'h540;
            else if((h_cnt == 337) && (v_cnt >= 386) && (v_cnt < 389))
                pixel = 12'h540;
            else if((h_cnt == 336) && (v_cnt >= 385) && (v_cnt < 390))
                pixel = 12'h540;
            else if((h_cnt == 335) && ((v_cnt >= 384) && (v_cnt < 391)))
                pixel = 12'h540; 
            else if((h_cnt == 334) && ((v_cnt >= 385) && (v_cnt < 392)))
                pixel = 12'h540;
            else if((h_cnt == 333) && ((v_cnt >= 386) && (v_cnt < 393)))
                pixel = 12'h540;
            else if((h_cnt == 332) && ((v_cnt >= 387) && (v_cnt < 394)))
                pixel = 12'h540; 
            else if((h_cnt == 331) && ((v_cnt >= 388) && (v_cnt < 395)))
                pixel = 12'h540;
            else if((h_cnt == 330) && ((v_cnt >= 389) && (v_cnt < 396)))
                pixel = 12'h540;
            else
                pixel = 12'hfff;
        end
        else if(board[coordinate_pixel] > 0) begin
            pixel = snake_color; //12'h000;
        end
        else if(coordinate_pixel == apple)
            pixel = 12'h888;
        else
            pixel = 12'h040;
   end
endmodule

module pixel_snake(
    input [5:0] x,
    input [5:0] y,
    output reg [11:0] color
);

    always@(*) begin
        if(x == 0 || x == 14) begin
            if (y <= 1 || y >= 13)
                color = 12'h040;
            else
                color = 12'h000;
        end
        else if(x == 1 || x == 13) begin
            if(y == 0 || y == 14) 
                color = 12'h040;
            else if(y <= 2 || y >= 12)
                color = 12'h000;
            else
                color = 12'h444;
        end
        else if(x == 2 || x == 12) begin
            if(y <= 1 || y >= 13)
                color = 12'h000;
            else
                color = 12'h444;
        end
        else begin
            if(y == 0 || y == 14)
                color = 12'h000;
            else
                color = 12'h444;
        end
    end
endmodule


module pixel_node(
    input [4:0] x,
    input [4:0] y,
    input [4:0] num,
    output reg [11:0] color
);
    reg [4:0] cur_level;
    wire [4:0] level = 17 - num;
    always@(*) begin
        if(x == 0 || x == 19) begin
            if (y <= 1 || y >= 18)
                color = 12'hfff;
            else
                color = 12'h000;
        end
        else if(x == 1 || x == 18) begin
            if(y == 0 || y == 19) 
                color = 12'hfff;
            else if(y <= 2 || y >= 17)
                color = 12'h000;
            else
                color = 12'hfff;
        end
        else if(y == 0 || y == 19) begin
            color = 12'h000;
        end
        else if(y == 1 || y == 18) begin
            if(x == 2 || x == 17)
                color = 12'h000;
            else
                color = 12'hfff;
        end
        else begin
            if(x <= level)
                color = 12'h555;
            else
                color = 12'hfff;
        end
    end
endmodule