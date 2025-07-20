`timescale 1ns / 1ps
module dff_top(
input wire d,
input wire clk,
input  wire rst,
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
module fdivide2_top(
input clk,input rst,
output reg q, qbar
    );
    wire t1,t2;
    dff_top d1(.d(t2),.clk(clk),.rst(rst),.q(t1),.qbar(t2));
    always @(posedge clk)
    begin
    q<=t1;
    qbar<=t2;
    end
    
   
endmodule
