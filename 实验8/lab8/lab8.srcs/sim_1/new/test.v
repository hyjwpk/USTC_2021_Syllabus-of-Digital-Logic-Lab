`timescale 1ns / 1ps
module test();
reg clk;
reg [7:0] sw;
reg btn;
wire [2:0] hexplay_an;
wire [3:0] hexplay_data;
wire [2:0]condition;
wire result;
wire [3:0] counter;
wire btn_edge;
wire [3:0]data;
practice4 practice4(clk,sw,btn,hexplay_an,hexplay_data,condition,result,counter,btn_edge,data);
initial begin
    clk=0;
    forever
    #1 clk=~clk;
end

initial begin
    sw[0]=1;
    #20
    sw[0]=0;
end

initial begin
    btn=0;
    forever
    #5 btn=~btn;
end

endmodule
