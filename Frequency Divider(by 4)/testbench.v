`timescale 1ns / 1ps

module tb_freqdivide4();
    reg clk, rst;
    wire q1,qbar1,q2,qbar2;
    
    freqdivide4_top uut(.clk(clk),.rst(rst),.q1(q1),.qbar1(qbar1),.q2(q2),.qbar2(qbar2));
    always #5 clk=~clk;
    initial begin
    clk=0;
    rst=0;
    #2 rst=1;
    end
endmodule
