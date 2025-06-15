`timescale 1ns / 1ps


module tb_seqdetector;
  reg clk, rst, x;
  wire z;
  
  seqdetector101_top uut(.clk(clk), .rst(rst), .x(x),.z(z));
  initial clk = 0;   
  always #2 clk = ~clk;
    
  initial begin
    x = 0;
    clk=0;
    #1 rst = 0;
    #2 rst = 1;
    
    #3 x = 1;
    #3 x = 0;
    #3 x = 1;
    #3 x = 1;
    #3 x = 0;
    #3 x = 1;
    #3 x = 0;
    #3 x = 1;
    #3 x = 1;
    #3 x = 1;
    #3 x = 0;
    #3 x = 1;
    #3 x = 0;
    #2 x = 1;
    #3 x = 0;
    #10;
    $finish;
  end
  
  endmodule
