`timescale 1ns / 1ps


module tb_bit4adder();
   reg a0,a1,a2,a3,b0,b1,b2,b3,c0;
   wire s0,s1,s2,s3,c4;
   wire c1,c2,c3;
   
   bit4adder_top uut(.a0(a0),.a1(a1),.a2(a2),.a3(a3),.b0(b0),.b1(b1),.b2(b2),.b3(b3),.s0(s0),.s1(s1),.s2(s2),.s3(s3),.c0(c0),.c1(c1),.c2(c2),.c3(c3),.c4(c4));
   initial begin
   a0=0;a1=0;a2=0;a3=0;b0=0;b1=0;b2=0;b3=0;c0=0;
   #2 a1=1;b0=1;b1=1;
   #2 $finish;
   end
   
   
endmodule
