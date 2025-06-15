`timescale 1ns / 1ps

module tb_ringcount(

    );
    reg clk,mrst;
    wire q0,q1,q2;
    
    ringcount_top uut(.mrst(mrst),.clk(clk),.q0(q0),.q1(q1),.q2(q2));
    always #5 clk = ~clk;
    initial begin
    clk = 0;
     mrst = 0;  #11
   mrst=1;
    #200 $finish;
    
    
    
    
  end
endmodule
