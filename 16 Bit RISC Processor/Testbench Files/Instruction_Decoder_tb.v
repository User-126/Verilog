`timescale 1ns / 1ps


module tb_INSTRUCTION_DECODER(

    );
    reg [15:0] instr;
reg clk,en;
wire  aluop;
wire  [2:0] selA;
 wire [2:0] selB;
 wire [2:0] selD;
 wire [15:0] imm;
 wire regwe;
 
 INSTRUCTION_DECODER uut(.instr(instr),.clk(clk),.en(en),.aluop(aluop),
                         .selA(selA),.selB(selB),.selD(selD),.imm(imm),
                         .regwe(regwe));
 initial begin
 clk=0;
 en=0;
 instr=0;
 
 #10;
 instr= 16'b0001011100000100;
 #10;
 en=1;
 end
 always #5 clk=~clk;
 
 
endmodule
