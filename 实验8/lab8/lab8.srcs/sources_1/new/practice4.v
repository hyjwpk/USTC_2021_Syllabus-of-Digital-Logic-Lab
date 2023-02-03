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

module machine( 
input clk,se, 
output [2:0]condition,
output result); 

reg [2:0] curr_state;
reg [2:0] next_state;
parameter S_0 = 3'b000;
parameter S_1 = 3'b001;
parameter S_2 = 3'b010;
parameter S_3 = 3'b011;
parameter S_4 = 3'b100;

initial begin
    curr_state = S_0;
end 
always @(*) begin
    case (curr_state)
        S_0:  next_state = (se == 0) ? S_0 : S_1 ;
        S_1:  next_state = (se == 0) ? S_0 : S_2 ;
        S_2:  next_state = (se == 0) ? S_3 : S_2 ;
        S_3:  next_state = (se == 0) ? S_4 : S_1 ;
        S_4:  next_state = (se == 0) ? S_0 : S_1 ;
        default: next_state = S_0;
    endcase
end

always@(posedge clk)
begin
    curr_state <= next_state; 
end

assign result = (curr_state == S_4) ? 1'b1 : 1'b0; 
assign condition = curr_state;
endmodule

module practice4(
	input clk,
    input [7:0] sw,
    input btn,
	output reg [2:0] hexplay_an,
	output reg [3:0] hexplay_data
);

reg [32:0] hexplay_cnt;
wire btn_clean,btn_edge,result;
wire [2:0] condition;
reg [3:0] counter;
reg [3:0] data;
wire result_edge;

jitter_clr jitter_clr(clk,btn,btn_clean);
signal_edge signal_edge1(clk,btn,btn_edge);
signal_edge signal_edge2(clk,result,result_edge);
machine machine(btn_edge,sw[0],condition,result);

initial begin
    counter = 0;
    data = 0;
end

always@(posedge clk)
	if (hexplay_cnt >= (2000000 / 6)) hexplay_cnt <= 0;
	else hexplay_cnt <= hexplay_cnt + 1;

always@(posedge clk)
	if (hexplay_cnt == 0) 
        if(hexplay_an >= 5) hexplay_an <= 0;
        else hexplay_an <= hexplay_an + 1;
    else;

always@(posedge clk) begin
    if(result_edge)
        counter <= counter + 1;
    else ;
end

always @(posedge clk) begin
    if(btn_edge)
        data <= {data[2:0],sw[0]};
    else;
end

always@(*) begin
	case(hexplay_an)
		0: hexplay_data = counter;
		1: hexplay_data = condition;
        2: hexplay_data = data[0];
		3: hexplay_data = data[1];
		4: hexplay_data = data[2];
		5: hexplay_data = data[3];
	endcase
end

endmodule