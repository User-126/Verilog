`timescale 1ns / 1ps

module  jkff_top( j,k,clk,q,qb,rst);
  input j,k,clk,rst;
  output reg q,qb;
  
  always @(posedge clk or posedge rst) 
    begin 
      if (rst) begin
      	q <= 0;
        qb <= ~q;
      end
      else begin 
        q <= (j & (~q)) | (q & (~k));
        qb <= ~q;
      end
    end
endmodule
