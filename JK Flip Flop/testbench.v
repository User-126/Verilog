`timescale 1ns / 1ps


module tb_jkff;
  reg j, k, clk, rst;
  wire q, qb;
  
  jkff_top uut(.j(j),.k(k),.clk(clk),.rst(rst),.q(q),.qb(qb));
  
  always #5 clk = ~clk;
  
  initial begin
    j=0;k=0;clk=0;rst=1;#4
    rst=0;#5
    j = 0; k = 0;#10
    j = 0; k = 1;#10
    j = 1; k = 0;#10
    j = 1; k = 1;#70
    $finish;
  end
endmodule
