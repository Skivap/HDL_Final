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
    wire frame_enable;
    one_second os(clk, rst, one_sec);
    frame_counter fs(clk, rst, frame_enable);
    
    reg [8:0] board [0:399]; // 10 x 10 x 8bit
//    reg [3:0] direction [0:399]; // 2 bit pertama -> kemana, 2 bit ketrakhir -> dari mana
    
//    reg [4:0] x, y;
    reg [8:0] size;
    reg [1:0] move, last_move, next_move;
    reg [3:0] mkey;
    
    // AI MOVEMENT
    wire nin1, nin2, nin3, nin4, nin5, nin6;
//    reg start_ai;
//    wire finish_ai, available_ai;
    
    assign out = {nin1, nin2, nin3, nin4, nin5, nin6};
    
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
        if(board[random_coor] == 0 && random_coor != apple && (random_coor/20)%2 == 0)
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
                            left_: begin
                                if(y == 0) 
                                    game_over <= 1'b1;
                                else if(board[x*20+(y-1)]>1) 
                                    game_over <= 1'b1;
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
                            right_: begin
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
                            up_: begin
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
                            down_: begin
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
                board[i] <= 9'd0;
            end
            else begin
                if(update_board) begin
                    if(x*20 + y == i)
                        board[i] <= size;
                    else if(board[i] > 0 && !has_apple)
                        board[i] <= board[i]-1;
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
    
    wire [3:0] hidval1, hidval2, hidval3, hidval4, hidval5, hidval6, hidval7;
    wire [3:0] res1, res2, res3;
    
    neural_network nn(
        nin1, nin2, nin3, nin4, nin5, nin6,
        ai_move,
        hidval1, hidval2, hidval3, hidval4, hidval5, hidval6, hidval7,
        res1, res2, res3
    );
    
    reg [5:0] as1, as2, as3, as4;
    assign nin1 = as1[0] || as2[0] || as3[0] || as4[0];
    assign nin2 = as1[1] || as2[1] || as3[1] || as4[1];
    assign nin3 = as1[2] || as2[2] || as3[2] || as4[2];
    assign nin4 = as1[3] || as2[3] || as3[3] || as4[3];
    assign nin5 = as1[4] || as2[4] || as3[4] || as4[4];
    assign nin6 = as1[5] || as2[5] || as3[5] || as4[5];
    
    wire [5:0] apple_x, apple_y;
    assign apple_x = apple/20;
    assign apple_y = apple%20;
    
    // Generate input for AI
    always@(posedge clk) begin
        case(last_move)
            up_: begin
                as2 <= 6'b000_000;
                as3 <= 6'b000_000;
                as4 <= 6'b000_000;
                // front apple
                if(y == apple_y && apple_x < x)
                    as1[0] <= 1;
                else
                    as1[0] <= 0;
                    
                // left apple
                if(x == apple_x && apple_y < y)
                    as1[1] <= 1;
                else
                    as1[1] <= 0;  
                    
                // right apple 
                if(x == apple_x && apple_y > y)
                    as1[2] <= 1;
                else
                    as1[2] <= 0;
                
                // obstacle front
                if(x == 0)
                    as1[3] <= 1;
                else if(board[(x-1)*20 + y] > 1)
                    as1[3] <= 1;
                else
                    as1[3] <= 0;
                
                // obstacle left
                if(y == 0)
                    as1[4] <= 1;
                else if(board[x*20+y-1] > 1)
                    as1[4] <= 1;
                else
                    as1[4] <= 0;
                
                // obstacle right
                if(y == 19)
                    as1[5] <= 1;
                else if(board[x*20+y+1] > 1)
                    as1[5] <= 1;
                else
                    as1[5] <= 0;
       end
       down_: begin
                as1 <= 6'b000_000;
                as3 <= 6'b000_000;
                as4 <= 6'b000_000;
            // (down) front apple
            if(y == apple_y && apple_x > x)
                as2[0] <= 1;
            else
                as2[0] <= 0;
                
            // (down) left apple
            if(x == apple_x && apple_y > y)
                as2[1] <= 1;
            else
                as2[1] <= 0;  
                
            // (down) right apple 
            if(x == apple_x && apple_y < y)
                as2[2] <= 1;
            else
                as2[2] <= 0;
            
            // (down) obstacle front
            if(x == 19)
                as2[3] <= 1;
            else if(board[(x+1)*20 + y] > 1)
                as2[3] <= 1;
            else
                as2[3] <= 0;
            
            // (down) obstacle left
            if(y == 19)
                as2[4] <= 1;
            else if(board[x*20+y+1] > 1)
                as2[4] <= 1;
            else
                as2[4] <= 0;
            
            // (down) obstacle right
            if(y == 0)
                as2[5] <= 1;
            else if(board[x*20+y-1] > 1)
                as2[5] <= 1;
            else
                as2[5] <= 0;
        end
        left_: begin
                as1 <= 6'b000_000;
                as2 <= 6'b000_000;
                as4 <= 6'b000_000;
            // (left) front apple
            if(x == apple_x && apple_y < y)
                as3[0] <= 1;
            else
                as3[0] <= 0;
                
            // (left) left apple
            if(y == apple_y && apple_x > x)
                as3[1] <= 1;
            else
                as3[1] <= 0;  
                
            // (left) right apple 
            if(y == apple_y && apple_x < x)
                as3[2] <= 1;
            else
                as3[2] <= 0;
            
            // (left) obstacle front
            if(y == 0)
                as3[3] <= 1;
            else if(board[x*20 + y - 1] > 1)
                as3[3] <= 1;
            else
                as3[3] <= 0;
            
            // (left) obstacle left
            if(x == 19)
                as3[4] <= 1;
            else if(board[(x+1)*20 + y] > 1)
                as3[4] <= 1;
            else
                as3[4] <= 0;
            
            // (left) obstacle right
            if(x == 0)
                as3[5] <= 1;
            else if(board[(x-1)*20 + y] > 1)
                as3[5] <= 1;
            else
                as3[5] <= 0;
        end
        right_: begin
                as1 <= 6'b000_000;
                as2 <= 6'b000_000;
                as3 <= 6'b000_000;
            // (right) front apple
            if(x == apple_x && apple_y > y)
                as4[0] <= 1;
            else
                as4[0] <= 0;
                
            // (right) left apple
            if(y == apple_y && apple_x < x)
                as4[1] <= 1;
            else
                as4[1] <= 0;  
                
            // (right) right apple 
            if(y == apple_y && apple_x > x)
                as4[2] <= 1;
            else
                as4[2] <= 0;
            
            // (right) obstacle front
            if(y == 19)
                as4[3] <= 1;
            else if(board[x*20 + y + 1] > 1)
                as4[3] <= 1;
            else
                as4[3] <= 0;
            
            // (right) obstacle left
            if(x == 0)
                as4[4] <= 1;
            else if(board[(x-1)*20 + y] > 1)
                as4[4] <= 1;
            else
                as4[4] <= 0;
            
            // (right) obstacle right
            if(x == 19)
                as4[5] <= 1;
            else if(board[(x+1)*20 + y] > 1)
                as4[5] <= 1;
            else
                as4[5] <= 0;
        end
        endcase 
    end
   
    // GENERATE THE PIXEL COLOR
   wire [11:0] data;
   wire clk_25MHz;
   wire clk_22;
   reg [16:0] pixel_addr_model;
   wire [11:0] pixel_model;
   
   wire [5:0] x_c, y_c, pix_x, pix_y;
   wire [9:0] coordinate_pixel;
   assign coordinate_pixel = x_c * 20 + y_c < 400 ?  x_c * 20 + y_c : 0;
   
   wire [11:0] snake_color;
   assign y_c = h_cnt >= 20 ? (h_cnt-20)/15 : 0;
   assign x_c = v_cnt >= 90 ? (v_cnt-90)/15 : 0;
   assign pix_y = h_cnt >= 20 ? (h_cnt-20)%15 : 0;
   assign pix_x = v_cnt >= 90 ? (v_cnt-90)%15 : 0;
   
   clock_divisor_25MHz clk_25(
      .clk(clk),
      .clk1(clk_25MHz),
      .clk22(clk_22)
    );
    
   pixel_snake pxs(
        pix_x, pix_y, snake_color
   );
   
    // Value for input, masyaallah too many
   wire [3:0] in_node_1, in_node_2, in_node_3, in_node_4, in_node_5, in_node_6;
   wire [11:0] pixel_in1, pixel_in2, pixel_in3, pixel_in4, pixel_in5, pixel_in6;
   wire [11:0] pxh1, pxh2, pxh3, pxh4, pxh5, pxh6, pxh7;
   wire [11:0] pxo1, pxo2, pxo3;
   
    reg [11:0] pixel;
    assign {vgaRed, vgaGreen, vgaBlue} = (valid == 1'b1) ? pixel : 12'd0;
    
    reg [4:0] x_in1, x_in2, x_in3, x_in4, x_in5, x_in6;
    reg [4:0] y_in1; 
    
    reg [4:0] x_hid1, x_hid2, x_hid3, x_hid4, x_hid5, x_hid6, x_hid7;
    reg [4:0] y_hid1;
    
    reg [4:0] x_out1, x_out2, x_out3, y_out;
    
   assign in_node_1 = nin1 ? 12 : 0;
   assign in_node_2 = nin2 ? 12 : 0;
   assign in_node_3 = nin3 ? 12 : 0;
   assign in_node_4 = nin4 ? 12 : 0;
   assign in_node_5 = nin5 ? 12 : 0;
   assign in_node_6 = nin6 ? 12 : 0;
   
   always@(*) begin
        if(v_cnt >= 40 && v_cnt < 440 && h_cnt >= 340)
            pixel_addr_model = ((h_cnt - 340) + (v_cnt - 40) * 300) % 120000;
        else 
            pixel_addr_model = 0;
   end
   
   always@(*) begin
        if(h_cnt >= 592 && h_cnt < 624)
            y_out = (h_cnt - 592) >> 1;
        else
            y_out = 0;
         
        if(v_cnt >= 163 && v_cnt < 195)
            x_out1 = (v_cnt - 163) >> 1;
        else
            x_out1 = 0;
        
        if(v_cnt >= 219 && v_cnt < 251)
            x_out2 = (v_cnt - 219) >> 1;
        else
            x_out2 = 0;
        
        if(v_cnt >= 275 && v_cnt < 307)
            x_out3 = (v_cnt - 275) >> 1;
        else
            x_out3 = 0;
   end
   
   always@(*) begin
        if(h_cnt >= 479 && h_cnt < 511)
            y_hid1 = (h_cnt-479) >> 1;
        else
            y_hid1 = 0;
        
        if(v_cnt >= 59 && v_cnt < 91)
            x_hid1 = (v_cnt - 59) >> 1;
        else
            x_hid1 = 0;
            
        if(v_cnt >= 115 && v_cnt < 147)
            x_hid2 = (v_cnt - 115) >> 1;
        else
            x_hid2 = 0;
            
        if(v_cnt >= 171 && v_cnt < 203)
            x_hid3 = (v_cnt - 171) >> 1;
        else
            x_hid3 = 0;
            
        if(v_cnt >= 227 && v_cnt < 259)
            x_hid4 = (v_cnt - 227) >> 1;
        else
            x_hid4 = 0;
            
        if(v_cnt >= 283 && v_cnt < 315)
            x_hid5 = (v_cnt - 283) >> 1;
        else
            x_hid5 = 0;
            
        if(v_cnt >= 339 && v_cnt < 371)
            x_hid6 = (v_cnt - 339) >> 1;
        else
            x_hid6 = 0;
        
        if(v_cnt >= 395 && v_cnt < 427)
            x_hid7 = (v_cnt - 395) >> 1;
        else
            x_hid7 = 0;
   end
   
   always@(*) begin
        if(v_cnt >= 79 && v_cnt < 111) begin
            x_in1 = (v_cnt -  79) / 2;
        end
        else begin
            x_in1 = 0;
        end
        if(v_cnt >= 135 && v_cnt < 167) begin
            x_in2 = (v_cnt - 135) / 2;
        end
        else begin
            x_in2 = 0;
        end
        if(v_cnt >= 191 && v_cnt < 223) begin
            x_in3 = (v_cnt -  191) / 2;
        end
        else begin
            x_in3 = 0;
        end
        if(v_cnt >= 247 && v_cnt < 279) begin
            x_in4 = (v_cnt - 247) / 2;
        end
        else begin
            x_in4 = 0;
        end
        if(v_cnt >= 305 && v_cnt < 337) begin
            x_in5 = (v_cnt -  305) / 2;
        end
        else begin
            x_in5 = 0;
        end
        if(v_cnt >= 359 && v_cnt < 391) begin
            x_in6 = (v_cnt - 359) / 2;
        end
        else begin
            x_in6 = 0;
        end
        
        if(h_cnt >= 359 && h_cnt < 391) begin
            y_in1 = (h_cnt - 359) / 2;
        end
        else begin
            y_in1 = 0;
        end
   end
   
   pixel_node pn_o1(
        frame_enable, rst,
        x_out1, y_out,
        res1,
        pxo1
   );
   pixel_node pn_o2(
        frame_enable, rst,
        x_out2, y_out,
        res2,
        pxo2
   );
   pixel_node pn_o3(
        frame_enable, rst,
        x_out3, y_out,
        res3,
        pxo3
   );
   
   pixel_node pn_h1(
        frame_enable, rst,
        x_hid1, y_hid1,
        hidval1,
        pxh1
   );
   pixel_node pn_h2(
        frame_enable, rst,
        x_hid2, y_hid1,
        hidval2,
        pxh2
   );
   pixel_node pn_h3(
        frame_enable, rst,
        x_hid3, y_hid1,
        hidval3,
        pxh3
   );
   pixel_node pn_h4(
        frame_enable, rst,
        x_hid4, y_hid1,
        hidval4,
        pxh4
   );
   pixel_node pn_h5(
        frame_enable, rst,
        x_hid5, y_hid1,
        hidval5,
        pxh5
   );
   pixel_node pn_h6(
        frame_enable, rst,
        x_hid6, y_hid1,
        hidval6,
        pxh6
   );
   pixel_node pn_h7(
        frame_enable, rst,
        x_hid7, y_hid1,
        hidval7,
        pxh7
   );
    
    pixel_node pn_i1(
        frame_enable, rst,
        x_in1, y_in1,
        in_node_1,
        pixel_in1
    );
    
    pixel_node pn_i2(
        frame_enable, rst,
        x_in2, y_in1,
        in_node_2,
        pixel_in2
    );
    
    pixel_node pn_i3(
        frame_enable, rst,
        x_in3, y_in1,
        in_node_3,
        pixel_in3
    );
    
    pixel_node pn_i4(
        frame_enable, rst,
        x_in4, y_in1,
        in_node_4,
        pixel_in4
    );
    
    pixel_node pn_i5(
        frame_enable, rst,
        x_in5, y_in1,
        in_node_5,
        pixel_in5
    );
    
    pixel_node pn_i6(
        frame_enable, rst,
        x_in6, y_in1,
        in_node_6,
        pixel_in6
    );
    
   blk_mem_gen_0 blk_mem_gen_model(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_model),
      .dina(data),
      .douta(pixel_model)
    );
   
   // Rendering
   always @(*) begin
        if(!valid)
             pixel = 12'h000;
        else if(v_cnt >= 70 && v_cnt < 410 && h_cnt < 340) begin
            if(v_cnt >= 90 && v_cnt < 390 && h_cnt >= 20 && h_cnt < 320) begin
                if(board[coordinate_pixel] > 0) begin
                    pixel = snake_color;
                end
                else if(coordinate_pixel == apple)
                    pixel = 12'h888;
                else if((x_c + y_c) % 2 == 0)
                    pixel = 12'h4A0;
                else
                    pixel = 12'h8A0;
            end
            else if(v_cnt >= 85 && v_cnt < 395 && h_cnt >= 15 && h_cnt < 325)
                pixel = 12'h411;
            else if(v_cnt >= 80 && v_cnt < 400 && h_cnt >= 10 && h_cnt < 330)
                pixel = 12'h9DE;
            else if(v_cnt >= 75 && v_cnt < 405 && h_cnt >= 5 && h_cnt < 335)
                pixel = 12'h411;
            else
                pixel = 12'h9DE;
        end
        else if(h_cnt >= 340 && v_cnt >= 40 && v_cnt < 440) begin
            if(h_cnt >= 359 && h_cnt < 391) begin
                if(v_cnt >= 79 && v_cnt < 111)
                    pixel = pixel_in1;
                else if(v_cnt >= 135 && v_cnt < 167)
                    pixel = pixel_in2;
                else if(v_cnt >= 191 && v_cnt < 223)
                    pixel = pixel_in3;
                else if(v_cnt >= 247 && v_cnt < 279)
                    pixel = pixel_in4;
                else if(v_cnt >= 305 && v_cnt < 337)
                    pixel = pixel_in5;
                else if(v_cnt >= 359 && v_cnt < 391)
                    pixel = pixel_in6;
                else 
                    pixel = pixel_model; //12'h9DE;
            end
            else if(h_cnt >= 479 && h_cnt < 511) begin
                if(v_cnt >= 59 && v_cnt < 91)
                    pixel = pxh1;
                else if(v_cnt >= 115 && v_cnt < 147)
                    pixel = pxh2;
                else if(v_cnt >= 171 && v_cnt < 203)
                    pixel = pxh3;
                else if(v_cnt >= 227 && v_cnt < 259)
                    pixel = pxh4;
                else if(v_cnt >= 283 && v_cnt < 315)
                    pixel = pxh5;
                else if(v_cnt >= 339 && v_cnt < 371)
                    pixel = pxh6;
                else if(v_cnt >= 395 && v_cnt < 427)
                    pixel = pxh7;
                else 
                    pixel = pixel_model; //12'h9DE;
            end
            else if(h_cnt >= 592 && h_cnt < 624) begin
                if(v_cnt >= 163 && v_cnt < 195)
                    pixel = pxo1;
                else if(v_cnt >= 219 && v_cnt < 251)
                    pixel = pxo2;
                else if(v_cnt >= 275 && v_cnt < 307)
                    pixel = pxo3;
                else
                    pixel = pixel_model; //12'h9DE;
            end
            else
                pixel = pixel_model; //12'h9DE;
        end
        else begin
            pixel = 12'h9DE;
        end
   end
   
endmodule

module pixel_snake(
    input [5:0] x,
    input [5:0] y,
    output reg [11:0] color
);
    wire bg;
    assign bg = (x + y) % 2 == 0;
    always@(*) begin
        if(x == 0 || x == 14) begin
            if (y <= 1 || y >= 13)
                if(bg)
                    color = 12'h4A0;
                else
                    color = 12'h8A0;
            else
                color = 12'h000;
        end
        else if(x == 1 || x == 13) begin
            if(y == 0 || y == 14) 
                if(bg)
                    color = 12'h4A0;
                else
                    color = 12'h8A0;
            else if(y <= 2 || y >= 12)
                color = 12'h000;
            else
                color = 12'h777;
        end
        else if(x == 2 || x == 12) begin
            if(y <= 1 || y >= 13)
                color = 12'h000;
            else
                color = 12'h777;
        end
        else begin
            if(y == 0 || y == 14)
                color = 12'h000;
            else
                color = 12'h777;
        end
    end
endmodule


module pixel_node(
    input clk,
    input rst,
    input [4:0] x,
    input [4:0] y,
    input [3:0] level,
    output reg [11:0] color
);
    reg [3:0] cur_level;
    always@(posedge clk) begin
        if(rst) begin
            cur_level <= 0;
        end
        else begin
            if(level < cur_level) begin
                if(cur_level > 0)
                    cur_level <= cur_level - 1;
            end
            else if(level > cur_level) begin
                if(cur_level >= 12)
                    cur_level <= 12;
                else
                    cur_level <= cur_level + 1;
            end
        end
    end 
    
    always@(*) begin
        if(x == 0 || x == 15) begin
            if (y <= 1 || y >= 14)
                color = 12'h9DE;
            else
                color = 12'h000;
        end
        else if(x == 1 || x == 14) begin
            if(y == 0 || y == 15) 
                color = 12'h9DE;
            else if(y <= 2 || y >= 13)
                color = 12'h000;
            else
                color = 12'hfff;
        end
        else if(y == 0 || y == 15) begin
            color = 12'h000;
        end
        else if(y == 1 || y == 14) begin
            if(x == 2 || x == 13)
                color = 12'h000;
            else
                color = 12'hfff;
        end
        else begin
            if((x == 2 || x == 13) && (y <= 3 || y >= 12))
                color = 12'hfff;
            else if((x == 3 || x == 12) && (y==2 || y == 13))
                color = 12'hfff;
            else if(cur_level <= 12) begin
                if(x < 12 - cur_level)
                    color = 12'hfff;
                else
                    color = 12'h444;
            end
            else
                color = 12'h444;
        end
    end
endmodule