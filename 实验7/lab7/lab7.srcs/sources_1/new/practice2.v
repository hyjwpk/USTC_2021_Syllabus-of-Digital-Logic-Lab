module practice2(
	input clk,
    input [7:0] sw,
	output reg [2:0] hexplay_an,
	output reg [3:0] hexplay_data
);

reg [32:0] hexplay_cnt;

always@(posedge clk)
	if (hexplay_cnt >= (2000000 / 2)) hexplay_cnt <= 0;
	else hexplay_cnt <= hexplay_cnt + 1;

always@(posedge clk)
	if (hexplay_cnt == 0) 
        if(hexplay_an >= 1) hexplay_an <= 0;
        else hexplay_an <= 1;
    else;

always@(*) begin
	case(hexplay_an)
		0: hexplay_data = sw[3:0];
		1: hexplay_data = sw[7:4];
	endcase
end

endmodule
