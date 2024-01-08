module digitsnake(
    input clk,
    input rst,
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    input valid,
    input [3:0] key,
    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output [3:0] vgaBlue
);
    parameter pi = 10'b011_0010010; // 19:17 for int, 16:0 for float
    
    // board and pixel
    reg board [0:783]; // 28 * 28 = 784
    reg next_board[0:783];
    reg [11:0] pixel;
    
    // For Snake
    reg [14:0] x, y; // 5 bit int, 10 bit precision float
    wire [4:0] next_x, next_y;
    reg [9:0] trail [0:9]; // 5 bit x, 5 bit y
    // Angle
    reg [8:0] degree, last_degree;
    // SinX and CosX for radian
    wire [14:0] new_x, new_y;
    cosX cx(degree, x, new_x);
    sinY sy(degree, y, new_y);
    
    // Assign next_x and next_y
    assign next_x = new_x[14:10];
    assign next_y = new_y[14:10];
    
    // iterator
    reg [9:0] it, itb;
    
    // time
    wire one_sec;
    one_second osc(clk, rst, one_sec);
    
    // Direction Snake
    reg dir; // 0 -> left /// 1 -> right
    always@(*)begin
        if(key == 4'b0100)
            dir = 0;
        else if(key == 4'b1000)
            dir = 1;
    end
    
    // Assign degree
    always@(*) begin
        if(dir == 0) begin
            if(9 > last_degree)
                degree = 360 + last_degree - 9;
            else
                degree = last_degree - 9;
        end
        else begin
            if(last_degree + 9 > 360)
                degree = last_degree + 9 - 360;
            else
                degree = last_degree + 9;
        end
    end
    
    always@(posedge clk) begin
        if(rst) begin
            for(it=0; it < 10; it = it + 1) begin
                trail[it] = {5'd10 + it, 5'd10};
            end
            x = {5'd10, 10'd0};
            y = {5'd10, 10'd0};
            
            last_degree = 180;
            degree = 180;
            dir = 0;
        end
        else begin
            if(one_sec) begin
                for(it = 9; it > 0; it = it - 1) begin
                    trail[it] = trail[it]-1;
                end
                trail[0] = {next_x, next_y};
                x = new_x;
                y = new_y;
                last_degree = degree;
            end
        end
    end
    
    // Board 
    // Formula to board : x * 28 + y
    reg [4:0] a_, b_;
    reg [9:0] coord;
    reg [1:0] boardstateloop;
    always@(posedge clk) begin
        if(rst) begin
            for(itb=0; itb < 784; itb = itb + 1) begin
                board[it] = 0;
                next_board[it] = 0;
                boardstateloop = 0;
            end
        end
        else begin
            case(boardstateloop)
                0: begin
                    for(itb=0; itb < 784; itb = itb + 1) begin
                        next_board[itb] = 0;
                    end
                    boardstateloop = 1;
                end
                1: begin
                    for(itb=0; itb < 10; itb = itb + 1) begin
                        a_ = trail[itb][9:5];
                        b_ = trail[itb][4:0];
                        coord = a_ * 28 + b_;
                        next_board[coord] = 1;
                    end
                    boardstateloop = 2;
                end
                2: begin
                    for(itb=0; itb < 784; itb = itb + 1) begin
                        board[itb] = next_board[itb];
                    end
                    boardstateloop = 0;
                end
            endcase
        end
    end
    
    
    // Pixel address
    // Monitor Size = 640 x 480
    //
    // 15px * 28 block = 420px
    // 30px border, 420*420 for the canvas
    // 30 - 420 - 30 -> 450 - 30
    wire [9:0] jad;
    assign jad = (h_cnt-30)/15 * 28 + (v_cnt-30)/15;
    assign {vgaRed, vgaGreen, vgaBlue} = {valid == 1'b1} ? pixel: 12'd0;
    
    always @(*) begin
        if(h_cnt < 30 || v_cnt < 30 || h_cnt >= 450 || v_cnt >= 450)
            pixel <= 12'h00f;
        else begin
            if(board[jad] == 1) begin
                pixel <= 12'h000;
            end
            else begin
                pixel <= 12'hfff;
            end
        end
   end
   
   assign {vgaRed, vgaGreen, vgaBlue} = pixel;
   
endmodule

module cosX(deg, x, out);
    input [8:0] deg; // 0 to 360
    input [14:0] x; // 5 bit int, 10 bit precision float
    output reg [14:0] out;
    
    reg [14:0] dX;
    reg [8:0] deg_;
    wire [1:0] rad;
    
    // Determine the value
    always@(*) begin
        case(deg_)
            0 : dX = 15'b00001_0000000000;
            9 : dX = 15'b00000_1111110011;
            18: dX = 15'b00000_1111001101;
            27: dX = 15'b00000_1110010000;
            36: dX = 15'b00000_1100111100;
            45: dX = 15'b00000_1011010100;
            54: dX = 15'b00000_1001011001;
            63: dX = 15'b00000_0111010000;
            72: dX = 15'b00000_0100111100;
            81: dX = 15'b00000_0010100000;
            90: dX = 15'b00000_0000000000;
        endcase
    end
    
    always@(*) begin
        case(rad)
            0: deg_ = deg;
            1: deg_ = 180-deg; // cos(x) = -cos(180 - x)
            2: deg_ = deg-180; // cos(x) = -cos(x - 180)
            3: deg_ = 360-deg; // cos(x) =  cos(360 - x)
        endcase
    end
    
    // Calculate new X as out
    always@(*) begin
        case(rad)
            0: begin
                if(x + dX >= 15'b11100_00000_00000)
                    out = x + dX - 15'b11100_00000_00000;
                else
                    out = x + dX;
            end
            1: begin
                if(dX > x)
                    out = 15'b11100_00000_00000 + x - dX;
                else
                    out = x - dX;
            end
            2: begin
                if(dX > x)
                    out = 15'b11100_00000_00000 + x - dX;
                else
                    out = x - dX;
            end
            3: begin
                if(x + dX >= 15'b11100_00000_00000)
                    out = x + dX - 15'b11100_00000_00000;
                else
                    out = x + dX;
            end
        endcase
    end
    
    // Assign which radian
    assign rad = deg <= 90 ? 0 :
                 deg <= 180 ? 1 :
                 deg <= 270 ? 2 : 3;
   
endmodule

module sinY(deg, y, out);
    input [8:0] deg; // 0 to 360
    input [14:0] y; // 5 bit int, 10 bit precision float
    output reg [14:0] out;
    
    reg [14:0] dY;
    reg [8:0] deg_;
    wire [1:0] rad;
    
    // Determine the value
    always@(*) begin
        case(deg_)
            90: dY = 15'b00001_0000000000;
            81: dY = 15'b00000_1111110011;
            72: dY = 15'b00000_1111001101;
            63: dY = 15'b00000_1110010000;
            54: dY = 15'b00000_1100111100;
            45: dY = 15'b00000_1011010100;
            36: dY = 15'b00000_1001011001;
            27: dY = 15'b00000_0111010000;
            18: dY = 15'b00000_0100111100;
             9: dY = 15'b00000_0010100000;
             0: dY = 15'b00000_0000000000;
        endcase
    end
    
    always@(*) begin
        case(rad)
            0: deg_ = deg;
            1: deg_ = 180-deg; // sin(x) = sin(180 - x)
            2: deg_ = deg-180; // sin(x) = -sin(x - 180)
            3: deg_ = 360-deg; // sin(x) = -sin(360 - x)
        endcase
    end
    
    // Calculate new X as out
    always@(*) begin
        case(rad)
            0: begin
                if(y + dY >= 15'b11100_00000_00000)
                    out = y + dY - 15'b11100_00000_00000;
                else
                    out = y + dY;
            end
            1: begin
                if(y + dY >= 15'b11100_00000_00000)
                    out = y + dY - 15'b11100_00000_00000;
                else
                    out = y + dY;
            end
            2: begin
                if(dY > y)
                    out = 15'b11100_00000_00000 + y - dY;
                else
                    out = y - dY;
            end
            3: begin
                if(dY > y)
                    out = 15'b11100_00000_00000 + y - dY;
                else
                    out = y - dY;
            end
        endcase
    end
    
    // Assign which radian
    assign rad = deg <= 90 ? 0 :
                 deg <= 180 ? 1 :
                 deg <= 270 ? 2 : 3;
   
endmodule