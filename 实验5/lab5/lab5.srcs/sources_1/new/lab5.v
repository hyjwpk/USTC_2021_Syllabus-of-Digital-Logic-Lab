module decoder(
input [2:0] in,
output reg [7:0] out);
always@(*)
begin
    case(in)
    3'b000: out = 8'b0000_0001;
    3'b001: out = 8'b0000_0010;
    3'b010: out = 8'b0000_0100;
    3'b011: out = 8'b0000_1000;
    3'b100: out = 8'b0001_0000;
    3'b101: out = 8'b0010_0000;
    3'b110: out = 8'b0100_0000;
    3'b111: out = 8'b1000_0000;
    endcase
end
endmodule

module d_ff_r(
input clk,rst_n,d,
output reg q);
always@(posedge clk)
begin
if(rst_n==0)
q <= 1'b0;
else
q <= d;
end
endmodule
