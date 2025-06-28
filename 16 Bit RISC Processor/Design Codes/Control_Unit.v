`timescale 1ns / 1ps

module CU(
input clk,
input rst,
output enfetch,endec,enrgrd,enalu,enrgwr,enmem

    );
    parameter fetch=0,
              dec=1,
              rgrd=2,
              alu=3,
              rgwr=4,
              mem=5;
              
    reg[5:0]state;
    initial begin
    state<=6'b000001;
    end
    
    always@(posedge clk) begin
     if(rst)
        state<=6'b000001;
        else begin
        case(state)
        6'b000001: state<= 6'b000010;
        6'b000010: state<= 6'b000100;
        6'b000100: state<= 6'b001000;
        6'b001000: state<= 6'b010000;
        6'b010000: state<= 6'b100000;
        default: state<= 6'b000001;
        
        endcase
        end
        end
        assign enfetch= state[0];
        assign endec= state[1];
        assign enrgrd= state[2] | state[4];
        assign enalu= state[3];
        assign enrgwr= state[4];
        assign enmem= state[5];
    
    
endmodule
