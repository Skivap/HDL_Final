module OnePulse (
    output reg signal_single_pulse,
    input wire signal,
    input wire clock
    );
    
    reg signal_delay;

    always @(posedge clock) begin
        if (signal == 1'b1 & signal_delay == 1'b0)
            signal_single_pulse <= 1'b1;
        else
            signal_single_pulse <= 1'b0;
        signal_delay <= signal;
    end
endmodule

module Debounce (pb_debounced, pb, clk);
     output pb_debounced; // signal of a pushbutton after being debounced
     input pb; // signal from a pushbutton
     input clk;
       
     reg [3:0] DFF; // use shift_reg to filter pushbutton bounce
     always @(posedge clk)
     begin
     DFF[3:1] <= DFF[2:0];
     DFF[0] <= pb;
     end
     assign pb_debounced = ((DFF == 4'b1111) ? 1'b1 : 1'b0);
endmodule