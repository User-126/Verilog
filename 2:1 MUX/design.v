`timescale 1ns / 1ps


module mux2to1_top(
   input wire i0,
   input wire i1,
   input wire sel,
   output wire o
   
    );
    
    assign o = (i0& ~(sel) | i1&sel);
endmodule
