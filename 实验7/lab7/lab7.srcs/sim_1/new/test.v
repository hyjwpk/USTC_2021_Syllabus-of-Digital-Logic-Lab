`timescale 1ns / 1ps
module test();
reg clk;
reg [7:0] sw;
wire [2:0] hexplay_an;
wire [3:0] hexplay_data;
practice2 practice2(clk,sw,hexplay_an,hexplay_data);
initial begin
    clk=0;
    forever
    #1 clk=~clk;
end

initial begin
    sw=0;
    forever begin
        #10 sw=sw+1;
    end
end
endmodule
