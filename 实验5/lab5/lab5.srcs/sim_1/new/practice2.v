`timescale 1ns / 1ps
module practice2();
reg CLK,RST_N,D;
wire q;
d_ff_r d_ff_r(CLK,RST_N,D,q);
initial
begin
    CLK=0;
    forever #5 CLK=~CLK;
end
initial
begin
    RST_N =0;
    #27.5 RST_N=1;
    #27.5 $stop;
end
initial
begin
    D =0;
    #12.5 D=1;
    #25 D=0;
end
endmodule
