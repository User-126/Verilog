`timescale 1ns / 1ps

module tb_dff(


    );
    reg d,clk,rst;
    wire q,qbar;
    
    dff_top uut(.d(d),.clk(clk),.rst(rst),.q(q),.qbar(qbar));
    always #5 clk=~clk;
    initial begin 
    d=0;clk=0;rst=0;
    #2 rst=1;
    #4 d=1;
    #20 d=0;
    end
    
    
    
endmodule
