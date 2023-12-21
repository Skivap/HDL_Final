module pixel_gen(
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   input valid,
   output reg [3:0] vgaRed,
   output reg [3:0] vgaGreen,
   output reg [3:0] vgaBlue
   );
   
   wire x_c, y_c;
   assign x_c = (h_cnt-120)/40;
   assign y_c = (v_cnt-40)/40;
   always @(*) begin
       if(!valid)
             {vgaRed, vgaGreen, vgaBlue} = 12'h0;
        else if(h_cnt < 120 || h_cnt >= 520 || v_cnt < 40 || v_cnt >= 440)
             {vgaRed, vgaGreen, vgaBlue} = 12'hf00;
        else if(board[x_c][y_c] > 0)
             {vgaRed, vgaGreen, vgaBlue} = 12'h00f;
        else
             {vgaRed, vgaGreen, vgaBlue} = 12'hf00;
   end
endmodule
