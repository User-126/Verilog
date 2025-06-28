`timescale 1ns / 1ps


module INSTRUCTION_DECODER(
input [15:0] instr,
input clk,en,
output reg [4:0]aluop,
output reg [2:0] selA,
output reg [2:0] selB,
output reg [2:0] selD,
output reg [15:0] imm,
output reg regwe
    );
    
    initial begin
    aluop<=0;
    selA<=0;
    selB<=0;
    selD<=0;
    imm<=0;
    regwe<=0;
    end
    
    always@(negedge clk) begin
    if(en) begin
    aluop<=instr[15:11];
    selA<=instr[10:8];
    selB<=instr[7:5];
    selD<=instr[4:2];
    imm<=instr[7:0];
    
    case(instr[15:12])
      4'b0111: regwe<=0;
      4'b1100: regwe<=0;
      4'b1101: regwe<=0;
      default: regwe<=1;
    endcase 
    end
    end 
        
endmodule
