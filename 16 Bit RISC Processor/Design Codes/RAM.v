`timescale 1ns / 1ps


module RAM(
    input clk,
    input we,
    input [15:0] address,
    input[15:0] datain,
    output reg [15:0] dataout
    );
    
    reg [15:0] mem[8:0];
    initial begin
    
    mem[0]=16'b1000000011111110;
    mem[1]=16'b1000100111101101;
    mem[2]=16'b0010001000100000;
    mem[3]=16'b1000001100000001;
    mem[4]=16'b1000010000000001;
    mem[5]=16'b0000001101110000;
    mem[6]=16'b1100000000000101;
    mem[7]=0;
    mem[8]=0;
    
    dataout=16'b0000000000000000;
    end
    always@(negedge clk) begin
       if(we) begin
       mem[address[15:0]]<=datain;
       end
       dataout<= mem[address[15:0]];
    
    
    
    
    
    end
    
endmodule
