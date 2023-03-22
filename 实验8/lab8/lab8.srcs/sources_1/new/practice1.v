`timescale 1ns / 1ps
module practice1( 
input clk,rst_n, 
output led); 
reg [1:0] curr_state;
reg [1:0] next_state; 
always @(*) begin
    next_state = curr_state + 2'b1;
end
always@(posedge clk or posedge rst_n)
begin
    if(rst_n)curr_state <= 2'b0; 
    else curr_state <= next_state; 
end
assign led = (curr_state==2'b11) ? 1'b1 : 1'b0; 
endmodule