`timescale 1ns / 1ps

module jitter_clr( 
input clk, 
input button, 
output button_clean );
reg [3:0] cnt; 
always@(posedge clk) 
begin
    if(button==1'b0) cnt <= 4'h0; 
    else if(cnt<4'h8) cnt <= cnt + 1'b1;
    else; 
end
assign button_clean = cnt[3]; 
endmodule

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

module practice3(
	input clk,
    input [7:0] sw,
    input btn,
	output reg [2:0] hexplay_an,
	output reg [3:0] hexplay_data
);

reg [32:0] hexplay_cnt;
reg [7:0]counter;
wire btn_clean;
wire btn_edge;

jitter_clr jitter_clr(clk,btn,btn_clean);
signal_edge signal_edge(clk,btn_clean,btn_edge);

always@(posedge clk)
	if (hexplay_cnt >= (2000000 / 2)) hexplay_cnt <= 0;
	else hexplay_cnt <= hexplay_cnt + 1;

always@(posedge clk)
	if (hexplay_cnt == 0) 
        if(hexplay_an >= 1) hexplay_an <= 0;
        else hexplay_an <= 1;
    else;

always@(posedge clk) begin 
    if(sw[1])
        counter = 8'b0001_1111;
    else if(btn_edge)
        if(sw[0]) counter <= counter + 1;
		else counter <= counter - 1;
    else ;
end

always@(*) begin
	case(hexplay_an)
		0: hexplay_data = counter[3:0];
		1: hexplay_data = counter[7:4];
	endcase
end

endmodule