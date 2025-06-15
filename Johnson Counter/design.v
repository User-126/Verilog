`timescale 1ns / 1ps
module dff_top(
input wire d,
input wire clk,
input  wire prst,
input wire clr,
output reg q,
output reg qb
    );
    always @(posedge clk or negedge clr or negedge prst)
    begin
    if (!prst)
    begin
    q<=1;
    qb<=0;
    end
    else if (!clr)
    begin
    q<=0;
    qb<=1;
    end
    else
    begin 
    q<=d;
    qb<=~q;
    end
    end
    
endmodule

module johnson_top(
    input mrst,clk,output reg q0,q1,q2
    );
     wire t1,t2,t3,t4,t5,t6;
    dff_top d1(.d(t6),.clk(clk),.prst(1),.clr(mrst),.q(t1),.qb(t4));
    dff_top d2(.d(t1),.clk(clk),.prst(1),.clr(mrst),.q(t2),.qb(t5));
    dff_top d3(.d(t2),.clk(clk),.prst(1),.clr(mrst),.q(t3),.qb(t6));
    always @(posedge clk) begin
    q0 <= t1;
    q1 <= t2;
    q2 <= t3;
    end
endmodule
