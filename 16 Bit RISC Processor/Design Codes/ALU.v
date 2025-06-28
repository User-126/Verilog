`timescale 1ns / 1ps


module ALU(
input en,clk,
input [4:0] aluop,
input[15:0] dataA,
input[15:0] dataB,
input [7:0] imm,
output [15:0] result,
output reg shdbranch
    );
    
   reg [17:0] int_result;
    wire op_lsb;
    wire[3:0] opcode;
    parameter Add=0,
              Sub=1,
              OR=2,
              AND=3,
              XOR=4,
              NOT=5,
              Load=6,
              Cmp=7,
              SHL=8,
              SHR=9,
              JMPA=10,
              JMPR=11;
    
    initial begin
    int_result<=0;
    
    end
   assign op_lsb=aluop[0];
   assign opcode=aluop[4:1];
   assign result = int_result[15:0];
    always@(negedge clk) begin
    if(en) begin
    case(opcode)
       Add: begin 
         int_result<=(op_lsb?($signed(dataA)+$signed(dataB)):(dataA+dataB));
      shdbranch<=0;
       end
       
       Sub: begin
       int_result<=(op_lsb?($signed(dataA)-$signed(dataB)):(dataA-dataB));
       shdbranch<=0;
       end
       
       OR:
       begin
       int_result<=dataA|dataB;
       shdbranch<=0;
    end
    AND:begin
    int_result<=dataA&dataB;
    shdbranch<=0;
    end
    
    XOR:begin
    int_result<=dataA^dataB;
    shdbranch<=0;
    end
    
    NOT:begin
    int_result<=~dataA;
    shdbranch<=0;
    end
    
    Load: begin
    int_result<=(op_lsb?({imm,8'h00}):({8'h00,imm}));
    shdbranch<=0;
    end
    Cmp:
    begin
    if(op_lsb) begin
    int_result[0]<=($signed(dataA)==$signed(dataB))?1:0;
     int_result[1]<=($signed(dataA)==0)?1:0;
     int_result[2]<=($signed(dataB)==0)?1:0;
     int_result[3]<=($signed(dataA)>$signed(dataB))?1:0;
     int_result[4]<=($signed(dataA)<$signed(dataB))?1:0;
     end
     else begin
     int_result[0]<=((dataA)==(dataB))?1:0;
     int_result[1]<=((dataA)==0)?1:0;
     int_result[2]<=((dataB)==0)?1:0;
     int_result[3]<=((dataA)>(dataB))?1:0;
     int_result[4]<=((dataA)<(dataB))?1:0;
    
    end
    shdbranch<=0;
    end
    
    SHL: begin
    int_result<=dataA<<(dataB[3:0]);
    shdbranch<=0;
    end
    
    SHR: begin
    int_result<=dataA>>(dataB[3:0]);
    shdbranch<=0;
    end
    JMPA: begin
    int_result<=(op_lsb? dataA: imm);
    shdbranch<=1;
    
    end
    JMPR: begin
    int_result<=dataA;
    shdbranch<= dataB[{op_lsb,imm[1:0]}];
    
    end
    endcase
    
 end   
 end
endmodule
