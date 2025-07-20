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
module freqdivide4_top(
input clk,input rst,
output reg q1, qbar1,q2,qbar2
    );
    wire t1,t2,t3,t4;
    dff_top d1(.d(t2),.clk(clk),.rst(rst),.q(t1),.qbar(t2));
    dff_top d2(.d(t4),.clk(t1),.rst(rst),.q(t3),.qbar(t4));
    always @(posedge clk)
    begin
    q1<=t1;
    qbar1<=t2;
    q2<=t3;
    qbar2<=t4;
    end
    
   
endmodule

