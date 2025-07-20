`timescale 1ns / 1ps

module dff_top(
input wire d,
input wire clk,
input  rst,
output reg q,
output reg qbar

    );
    
    always @(posedge clk or negedge rst)
    begin
    if (!rst)
    begin
    q=0;
    end
    else
    begin
    q=d;
    end
    end
    always @(q)
     qbar =~q;
endmodule
