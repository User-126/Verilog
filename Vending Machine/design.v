`timescale 1ns / 1ps

module vending_machine_top(
     input wire clk,
     input wire rst,
     input wire start,
     input wire cancel,
     input wire [2:0] prod_code,
     input wire online_payment,
     input wire [6:0] coin_val,
     
     output wire[3:0] state,
     output wire      dispense_prod,
     output wire[6:0] return_change,
     output wire[6:0] prod_price
    );
    
    parameter IDLE = 4'b0000,
              SELECT_PROD = 4'b0001,
              PEN_SELECT = 4'b0010,
              NOTEBOOK_SELECT = 4'b0011,
              COKE_SELECT = 4'b0100,
              LAYS_SELECT = 4'b0101,
              WATER_SELECT = 4'b0110,
              DISPENSE_AND_RETURN = 4'b0111;
              
    parameter WATER_PRICE = 7'd20,
              PEN_PRICE = 7'd10,
              NOTEBOOK_PRICE= 7'd50,
              COKE_PRICE = 7'd35,
              LAYS_PRICE = 7'd20;
              
 reg [3:0] curr_state, next_state;
 reg [6:0] curr_return_change, curr_prod_price;
 reg [6:0] next_return_change, next_prod_price;
 reg curr_dispense_prod;
 
 always@(posedge clk or posedge rst)
 begin
 if(rst) begin
 curr_state<= IDLE;
 curr_prod_price<=0;
 curr_return_change<=0;
 end 
 else begin
 curr_state<=next_state;
 curr_return_change<= next_return_change;
 curr_prod_price<= next_prod_price;
 end
 
 end
 
 always@(*) begin
   next_state=curr_state;
   next_return_change=curr_return_change;
   next_prod_price= curr_prod_price;
   
   case(curr_state)
   
       IDLE: begin
       if(start)
          next_state = SELECT_PROD;
          
       else if(cancel)
          next_state= IDLE;
        
       else
       next_state= IDLE;
       
       end 
       
      SELECT_PROD: begin
        case(prod_code)
         3'b000:begin
         next_state = PEN_SELECT;
         next_prod_price= PEN_PRICE; 
       end
       
       3'b001:begin
         next_state = NOTEBOOK_SELECT;
         next_prod_price= NOTEBOOK_PRICE; 
       end
       
       3'b010:begin
         next_state = COKE_SELECT;
         next_prod_price= COKE_PRICE; 
       end
       
       3'b011:begin
         next_state = LAYS_SELECT;
         next_prod_price= LAYS_PRICE; 
       end
       
       3'b100:begin
         next_state = WATER_SELECT;
         next_prod_price= WATER_PRICE; 
       end
       
       default: begin
         next_state = IDLE;
         next_prod_price= 0; 
       end
       endcase
       end
       
       PEN_SELECT,
       NOTEBOOK_SELECT,
       COKE_SELECT,
       LAYS_SELECT,
       WATER_SELECT: begin
       if(cancel) begin
         next_state= IDLE;
         next_return_change= coin_val;
         end
        else if(coin_val>= curr_prod_price)
          next_state= DISPENSE_AND_RETURN;
        else if(online_payment)
        next_state = DISPENSE_AND_RETURN;        
        else
          next_state= curr_state;
       
       end
       DISPENSE_AND_RETURN: begin
       
       next_state= IDLE;
       if( online_payment)
         next_return_change=0;
       else if(coin_val>= curr_prod_price)
         next_return_change = coin_val - curr_prod_price;
         
     end
    
    default: begin
       next_state= IDLE;
       next_prod_price=0;
       next_return_change=0;
       
    end
endcase
 end 
 assign state= curr_state;
 assign dispense_prod=(curr_state== DISPENSE_AND_RETURN)?1'b1: 1'b0;
 assign return_change=(curr_state== DISPENSE_AND_RETURN)?curr_return_change: 1'b0;
 assign prod_price=(curr_state== DISPENSE_AND_RETURN)?curr_prod_price: 1'b0;
    
    
endmodule
