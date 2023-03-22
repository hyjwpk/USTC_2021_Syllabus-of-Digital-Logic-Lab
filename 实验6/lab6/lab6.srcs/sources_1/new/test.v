module top1(
input clk,
output reg [7:0] led
);
reg [29:0] data;
always@(posedge clk) begin
	data <= data + 1;
end
always@(*) begin
	led<={data[22],data[23],data[24],data[25],data[26],data[27],data[28],data[29]};
end
endmodule


module top2(
input clk,
output reg [7:0] led
);
reg [31:0] data;
always@(posedge clk) begin
	data <= data + 1;
end
always@(*) begin
	led<={data[24],data[25],data[26],data[27],data[28],data[29],data[30],data[31]};
end
endmodule


module test (
input clk,rst,
input [7:0] sw,
output reg [7:0] led
);
always @(posedge clk or posedge rst) begin
	if (rst) led<=8'haa;
	else led<={sw[0],sw[1],sw[2],sw[3],sw[4],sw[5],sw[6],sw[7]};
end
endmodule