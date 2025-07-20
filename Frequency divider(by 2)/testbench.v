`timescale 1ns / 1ps


module tb_fdivide2();
    reg clk, rst;
    wire q,qbar;
    
    fdivide2_top uut(.clk(clk),.rst(rst),.q(q),.qbar(qbar));
    always #5 clk=~clk;
    initial begin
    clk=0;
    rst=0;
    #2 rst=1;
    end
endmodule
