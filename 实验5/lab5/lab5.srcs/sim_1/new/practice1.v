`timescale 1ns / 1ps
module practice1();
reg a,b;
initial
begin
    a=1;
    #200 a=0;
    #200 $stop;
end
initial
begin
    b=0;
    #100 b=1;
    #175 b=0;
    #75  b=1;
end
endmodule