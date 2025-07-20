`timescale 1ns / 1ps

module mux2to1_top(
   input wire i0,
   input wire i1,
   input wire sel,
   output wire o
   
    );
    
    assign o = (i0& ~(sel) | i1&sel);
endmodule

module mux4to1_top(
  input wire i0,
  input wire i1,
  input wire i2,
  input wire i3,
  input wire s0,
  input wire s1,
  output wire o,
  wire t1,
  wire t2
    );
    
    mux2to1_top mux1(i0,i1,s0,t1);
    mux2to1_top mux2(i2,i3,s0,t2);
    mux2to1_top mux3(t1,t2,s1,o);
    
    
     
    
endmodule
