`timescale 1ns / 1ps


module tb_bit3reg(

    );
    reg d,clk,rst;
    wire q;
    
    bit3reg_top uut(.d(d),.clk(clk),.rst(rst),.q(q));
    always #5 clk=~clk;
    initial begin
    d=0;clk=0;rst=1;
    #2 rst=0;
    #10 d=1;
    #10 d=0;
    #10 d=1;
    #20 d=0;
    #100 $finish;
    
    
   
    end 
endmodule
