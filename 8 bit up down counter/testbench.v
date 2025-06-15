`timescale 1ns / 1ps


module tb_bit8updown(

    );
    reg clk,rst,m;
    wire [7:0]count;
    
    bit8updown_top uut(.rst(rst),.clk(clk),.m(m),.count(count));
    always #5 clk=~clk;
    initial begin
    
    clk=0;rst=0;m=1;
    #3 rst=1;
    #500 m=0;
    #200 m=1;
    #100 rst=0;
    #10 $finish;
    end
    
endmodule
