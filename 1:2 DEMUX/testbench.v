`timescale 1ns / 1ps

module tb_demux1to2(

    );
    reg i,sel;
    wire o0,o1;
    
    demux2to1_top uut(.i(i),.sel(sel),.o0(o0),.o1(o1));
    initial begin
    
    i=0;sel=0;
    #2 sel=1;
    #2 i=1;
    #2 sel=0;
    end
endmodule
