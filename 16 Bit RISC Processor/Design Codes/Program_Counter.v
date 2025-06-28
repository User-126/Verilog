`timescale 1ns / 1ps


module PROGRAM_COUNTER(
input clk,
input [1:0] opcode,
input [15:0] i_pc,
output reg [15:0] o_pc
    );
    initial begin 
    o_pc<=0;
    end
    
    always@(negedge clk) begin
      case(opcode) 
      2'b00: o_pc<=o_pc;
      2'b01:  o_pc<= o_pc+1;
      2'b10: o_pc <= i_pc;
      2'b11:o_pc<=0;
    
    endcase
    
    
    end
    

endmodule
