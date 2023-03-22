`timescale 1ns / 1ps
module practice4();
reg [2:0] in;
wire [7:0] out;
decoder decoder(in,out);
initial
begin
    in=0;
    forever #5 in=in+1;
end
initial
    #40 $stop;
endmodule
