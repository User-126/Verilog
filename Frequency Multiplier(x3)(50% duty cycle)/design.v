timescale 1ns / 1ps
module xor3(input a, input b, input c, output reg o);
always@(*) begin
 o=a^b^c;
 end
 endmodule
 
 
module fx3_top(
   input in,
   input in_delay1,
   input in_delay2,
  output out
 
    );
   
    xor3 g(.a(in),.b(in_delay1),.c(in_delay2),.o(out));
    
endmodule
