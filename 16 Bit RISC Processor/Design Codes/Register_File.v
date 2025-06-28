`timescale 1ns / 1ps


module REG_FILE(
input clk,en,we,
input [2:0] selA,
input [2:0] selB,
input [2:0] selD,
input [15:0] dataD,

output reg [15:0] dataA,
output reg [15:0] dataB
    );
    
    reg [15:0] regs [7:0];
    
    integer count;
    initial begin
    dataA<=0;
    dataB<=0;
    for(count=0;count<8;count=count+1) begin
    regs[count]<=0;
    end
    end
    always@(negedge clk) begin
    if(en) begin
    if(we)
    regs[selD]<=dataD;
    dataA<=regs[selA];
    dataB<=regs[selB];
    end
  end  
endmodule
