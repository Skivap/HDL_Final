parameter bit_size = 64;

// try to make the neural network as simple as possible
// using all parameter as integer
module neural_network(
    input clk,
    input rst,
    
    // Input for preduction
    input start, // Testing or Prediction
    input [31:0] input_layer, // One-Hot Encoded
    output done, 
    output [1:0] out, // Movement prediction
    
    // Initial & Update Weight Parameter
    input init_param, // First step - Start randomize weight    
    input [7:0] score, // To store the highest score for next mutation
    input mutation_param, // Start to select the best param
    output ready
    
    
);
    // The layer is 32 - 20 - 12 - 4
    reg [bit_size-1:0] w1 [31:0];
    reg [bit_size-1:0] b1 [31:0];
    
    reg [bit_size-1:0] h1 [19:0];
    
    reg [bit_size-1:0] w2 [19:0];
    reg [bit_size-1:0] b2 [19:0];
    
    reg [bit_size-1:0] h2 [11:0];
    
    reg [bit_size-1:0] w3 [11:0];
    reg [bit_size-1:0] b3 [11:0];
    
    reg [bit_size-1:0] h3 [3:0];
    
    reg [1:0] state;
    parameter wait_input = 2'b00;
    parameter initialize = 2'b01;
    parameter calculate = 2'b10;
    parameter finish = 2'b11;
    reg [7:0] i, j, k;
    
    reg [2:0] init_state;
    parameter wait_call = 3'b000;
    parameter first_init_param = 3'b001;
    parameter update_param = 3'b010;
    
    always@(posedge clk) begin
        if(rst) begin
            init_state <= wait_input;
        end
        else begin
            case(init_state)
                wait_call: begin
                    if(init_param)
                        init_state <= first_init_param;
                    else if(mutation_param)
                        init_state <= update_param;
                end
                first_init_param: begin
                    
                end
                update_param: begin
                
                end
            endcase
        end
        
    end
    
    always@(posedge clk) begin
        if(rst) begin
            state = wait_input;
        end
        else begin
            case(state)
                wait_input: begin
                    if(start == 1'b1) state = initialize;
                end
                initialize: begin
                    for(i=0; i<20; i=i+1) begin
                        h1[i] = 64'd0;
                    end
                    for(j=0; j<12; j=j+1) begin
                        h2[j] = 64'd0;
                    end
                    for(k=0; k<4; k=k+1) begin
                        h3[k] = 64'd0;
                    end
                    state = calculate;
                end
                calculate: begin
                    for(i=0; i<32; i=i+1) begin
                        for(j=0; j<20; j=j+1) begin
                        
                        end
                    end
                end
            endcase
        end
    end
endmodule

module random_gaussian_int(
    input clk,
    input rst,
    output [63:0] out
);
    wire [7:0] rand;
    
    gaussian_random r_norm(
        .clk(clk),
        .rst(rst),
        .out(rand)
    );
    
    assign out [63:7] = { // Shifting the distribution to have gaussian [-32 : 32]
        rand > 8'd16 ? 0 : 1, // 0 is positive, 1 is negative
        55'd0, 
        rand > 8'd16 ? rand - 8'd16 : rand
    }; 
endmodule

module random_int(
    input clk,
    input rst,
    output [63:0] out
);
    wire [7:0] rand;
    random r(
        .clk(clk),
        .rst(rst),
        .out(rand)
    );
    assign out [63:7] = {rand[7], 56'd0, rand[6:0]};
endmodule