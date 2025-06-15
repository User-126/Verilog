`timescale 1ns / 1ps


 module bit8updown_top(
   input wire rst,
   input wire clk,
   input wire m,
   output reg [7:0]count
    );
    always @(posedge clk or negedge rst)
    begin 
    if(!rst)
    begin
    count<=8'b00000000;
    end
    else if(count==8'b11111111)
    begin
    count<=8'b00000000;
    end
    else if(m)
    begin 
    count<=count+1;
    end
    else
    begin
    count<=count-1;
    end
    end
    
    
    
endmodule
