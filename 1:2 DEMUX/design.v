`timescale 1ns / 1ps


module demux2to1_top(
  input wire i,
  input wire sel,
  output wire o0,
  output wire o1
    );
    
    assign o0= (~sel)&i;
    assign o1= sel&i;
endmodule
