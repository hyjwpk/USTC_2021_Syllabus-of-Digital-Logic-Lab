module practice3(
	input clk,
	input rst,
	output reg [2:0] hexplay_an,
	output reg [3:0] hexplay_data
);

reg [15:0] data;
reg [32:0] hexplay_cnt;

initial
    data=0;

always@(posedge clk) begin
	if (hexplay_cnt >= (2000000 / 4)) hexplay_cnt <= 0;
	else hexplay_cnt <= hexplay_cnt + 1;
end

always@(posedge clk) begin
	if (hexplay_cnt == 0)
		if (hexplay_an == 3) hexplay_an <= 0;
		else hexplay_an <= hexplay_an + 1;
    else ;
end

always@(*) begin
	case(hexplay_an)
		0: hexplay_data = (data[3:0] <= 4'd9) ? data[3:0] : 0 ;
		1: hexplay_data = (data[7:4] <= 4'd9) ? data[7:4] : 0;
		2: hexplay_data = (data[11:8] <= 4'd5) ? data[11:8] : 0;
		3: hexplay_data = data[15:12];
	endcase
end

reg [31:0] timer_cnt;
always@(posedge clk) begin
	if (timer_cnt >= 10000000) timer_cnt <= 0;
	else timer_cnt <= timer_cnt + 1;
end

always@(posedge clk) begin
	if (timer_cnt == 0) begin
		if (rst) begin
            data[15:12] <= 4'd1;
            data[11:8] <= 4'd2;
            data[7:4] <= 4'd3;
            data[3:0] <= 4'd4;
		end
		else begin
			data[3:0] <= data[3:0] + 1;
            if(data[3:0] >= 10) begin
                data[3:0] <= 0;
                data[7:4] <= data[7:4] + 1;
            end
            else ;
            if(data[7:4] >= 10) begin
                data[7:4] <= 0;
                data[11:8] <= data[11:8] + 1;
            end
            else ;
            if(data[11:8] >= 6) begin
                data[11:8] <= 0;
                data[15:12] <= data[15:12] + 1;
            end
            else ;
		end
	end
end

endmodule
