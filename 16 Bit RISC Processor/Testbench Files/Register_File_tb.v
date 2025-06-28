`timescale 1ns / 1ps


module tb_REG_FILE(

    );
    reg clk,en,we;
reg [2:0] selA;
reg [2:0] selB;
reg [2:0] selD;
reg [15:0] dataD;

wire  [15:0] dataA;
wire  [15:0] dataB;

REG_FILE uut(.clk(clk),.en(en),.selA(selA),.selB(selB),.selD(selD),
             .dataD(dataD),.dataA(dataA),.dataB(dataB));
     always #5 clk=~clk;         
initial begin
   clk=0;
   dataD=0;
   en=0;
   selA=0;
   selB=0;
   selD=0;
   we=0;
  #7;
   en=1;
   selB=3'b001;
   
   dataD=16'hFFFF;
   we=1;
   
   #10;
   we=0;
   selD=3'b010;
   dataD=16'h2222;
   
   #10;
   we=1;
   #10;
   dataD=16'h3333;
   #10;
   we=0;
   selD=3'b000;
   dataD=16'hFEED;
   #10;
   selD=3'b100;
   dataD=16'h4444;
   #10;
   we=1;
   #50;
   selA= 3'b100;
   selB=3'b100;
   
   
   end
  
   
   
endmodule
