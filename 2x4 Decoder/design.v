`timescale 1ns / 1ps

module decoder2to4_top(
input wire i0,
input wire i1,
output wire o0,
output wire o1,
output wire o2,
output wire o3
    );
    
    assign o0= (~i0) & (~i1);
    assign o1= (~i0) & i1;
    assign o2= (i0) & (~i1);
    assign o3= i0 & i1;
    
endmodule
