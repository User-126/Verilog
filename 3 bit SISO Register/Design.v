`timescale 1ns / 1ps

module dff_top(
input wire d,
input wire clk,
input  wire rst,
output reg q
    );
    
    always @(posedge clk or posedge rst)
    begin
      if (rst)
    begin
       q<=0;
    end
    else
    begin
      q<=d;
    end
    end
endmodule
module bit3reg_top(
  input wire d,
  input wire clk,
  input wire rst,
  output wire q 
    );
    wire t1, t2;
    
    dff_top d1(.d(d),.clk(clk),.rst(rst),.q(t1));
    dff_top d2(.d(t1),.clk(clk),.rst(rst),.q(t2));
    dff_top d3(.d(t2),.clk(clk),.rst(rst),.q(q));
    
endmodule
