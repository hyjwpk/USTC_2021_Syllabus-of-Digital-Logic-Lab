module signal_edge( 
input clk, 
input button, 
output button_edge); 
reg button_r1,button_r2; 
always@(posedge clk)
button_r1 <= button; 
always@(posedge clk) 
button_r2 <= button_r1; 
assign button_edge = button_r1 & (~button_r2); 
endmodule