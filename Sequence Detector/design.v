`timescale 1ns / 1ps

module seqdetector101_top(
  input wire x,clk,rst,
  
  output wire z
  
    );
    parameter A = 2'b00;
  parameter B = 2'b01;
  parameter C = 2'b10;
  reg [1:0]nextstate;
  reg [1:0]state;
  
    always @(posedge clk or negedge rst) begin
    if(!rst) begin 
      state <= A;
    end
    else state <= nextstate;
  end
  
  always @(state or x) begin
    case(state)
      A: begin
           if(x == 0) nextstate = A;
           else       nextstate = B;
         end
      B: begin
           if(x == 0) nextstate = C;
           else       nextstate = B;
         end
      C: begin
           if(x == 0) nextstate = A;
           else       nextstate = B;
         end
      
      default: nextstate = A;
    endcase
  end
  assign z = (state == C) && (x == 1)? 1:0;
endmodule
      
    
