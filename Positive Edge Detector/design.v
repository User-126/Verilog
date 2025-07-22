`timescale 1ns / 1ps


module posedge_detector_top(
input in, clk, output reg out
    );
    reg q,qb;
    always@(posedge clk)
    begin
    q<=in;
    end
    always@(q) begin
    assign qb=~q;
    assign out = in&qb;
    end
    
endmodule
