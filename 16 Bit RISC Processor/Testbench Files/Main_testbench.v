`timescale 1ns / 1ps


module tb_MAIN(

    );
    reg clk;
    reg rst;
    reg ram_we=0;
    reg[15:0] datain=0;
    
    wire [2:0]selA;
    wire [2:0]selB;
    wire [2:0]selD;
    wire[15:0] dataA;
    wire[15:0] dataB;
    wire[15:0] dataD;
    wire[4:0] aluop;
    wire[7:0] imm;
    wire [15:0] dataout;
    wire [1:0] opcode;
    wire [15:0] o_pc;
    
    wire shdbranch;
    wire enfetch;
    wire enalu;
    wire endec;
    wire enmem;
    wire enrgrd;
    wire enrgwr;
    wire regwe;
    wire update;
    
    assign enrgwr= update & regwe;
    assign opcode =((rst)? 2'b11:((shdbranch)?2'b10:((enalu)? 2'b01:2'b00)));
    
  REG_FILE main_reg(
   clk,enrgrd,
   enrgwr,
  selA,
 selB,
 selD,
 dataD,

 dataA,
 dataB 
    
    );
    
   INSTRUCTION_DECODER main_instr(
    dataout,
 clk,endec,
  aluop,
 selA,
 selB,
  selD,
  imm,
  regwe
 ) ;
 ALU main_alu(
     enalu,clk,
 aluop,
 dataA,
 dataB,
  imm,
 dataD,
 shdbranch
);

CU main_cu(
 clk,
 rst,
 enfetch,endec,enrgrd,enalu,update,enmem
);

PROGRAM_COUNTER main_pc(
 clk,
 opcode,
 dataD,
 o_pc
);

RAM main_ram(
  clk,
     ram_we,
     o_pc,
     datain,
     dataout
    );
    
    initial begin
    clk=0;
    rst=1;
    #20
    rst=0;
    
   end 
   always #5 clk=~clk;
endmodule
