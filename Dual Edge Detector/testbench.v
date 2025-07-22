`timescale 1ns / 1ps


module tb_dual(

    );
    reg in,clk;
    wire out;
    dual_edge_top uut(.in(in),.clk(clk),.out(out));
    always #5 clk=~clk;
    initial begin
    clk=0;
    in=0;
    #6 in=1;
    #33 in =0;
    #15 in=1;
    #43 in=0;
    
    end
    
endmodule
