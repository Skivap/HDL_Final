module top(
   input clk,
   input rst_n,
   input rst_n2,
   inout wire PS2_DATA,
   inout wire PS2_CLK,
   
   output [6:0] seven_segment,
   output [3:0] an,
   
   output [3:0] vgaRed,
   output [3:0] vgaGreen,
   output [3:0] vgaBlue,
   output hsync,
   output vsync
);  
    // RESET
    wire rst, rst_p;
    Debounce DB_R(
        .pb_debounced(rst_p), 
        .pb(rst_n), 
        .clk(clk)
    );
    OnePulse OP_R(
        .signal_single_pulse(rst),
        .signal(rst_p),
        .clock(clk)
    );
    
    wire rst2, rst_p2;
    Debounce DB_R2(
        .pb_debounced(rst_p2), 
        .pb(rst_n2), 
        .clk(clk)
    );
    OnePulse OP_R2(
        .signal_single_pulse(rst2),
        .signal(rst_p2),
        .clock(clk)
    );
    
    // MONITOR
    wire clk_25MHz;
    wire valid;
    wire [9:0] h_cnt; //640
    wire [9:0] v_cnt;  //480
    wire [3:0] state;

    clock_divisor clk_wiz_0_inst(
      .clk(clk),
      .clk1(clk_25MHz)
    );

    wire [3:0] x, y;
    game_single gs1(
        clk, rst2, state,
        h_cnt, v_cnt, valid,
        vgaRed, vgaGreen, vgaBlue,
        x, y
        
    );

    vga_controller   vga_inst(
      .pclk(clk_25MHz), // 25 MHz
      .reset(rst),
      .hsync(hsync),
      .vsync(vsync),
      .valid(valid),
      .h_cnt(h_cnt),
      .v_cnt(v_cnt)
    );
      
      
   // KEYBOARD
   KeyboardEvent KeyEv(
        .PS2_DATA(PS2_DATA),
        .PS2_CLK(PS2_CLK),
        .rst(rst),
        .clk(clk),
        .state(state)
    );
    
    // Seven Segment for debug
    wire [15:0] num;
    assign num = {state, x, 4'd0, y};
    
    seven_segment sg(
        .clk(clk),
        .num(num),
        .LED(seven_segment),
        .an(an)
    );
endmodule
