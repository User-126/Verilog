`timescale 1ns / 1ps


module pulse_stretcher_top(
 input in, clk, output reg out
    );
    reg q1,q2;
    always@(posedge clk) begin
    q1<=in;
    q2<=q1;
    end
    always@(in or q1 or q2) begin
    assign out= in | q1 | q2;
    end
endmodule
