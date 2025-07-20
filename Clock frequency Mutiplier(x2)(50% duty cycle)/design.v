`timescale 1ns / 1ps

module fx2_top(
  input in,
   input in_delay,
  output out
 
    );
   
    assign out = in ^ (in_delay);
    
endmodule
