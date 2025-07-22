`timescale 1ns / 1ps


module tb_posedge(

    );
    reg in,clk;
    wire out;
    posedge_detector_top uut(.in(in),.clk(clk),.out(out));
    always #5 clk=~clk;
    initial begin
    clk=0;
    in=0;
    #6 in=1;
    #13 in =0;
    #15 in=1;
    #6 in=0;
    #27 in=1;
    #20 in=0;
    end
    
endmodule
