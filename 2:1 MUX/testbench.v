`timescale 1ns / 1ps

module tb_mux2to1();
    reg i0,i1,sel;
    wire o;
    
    mux2to1_top uut(.i0(i0),.i1(i1),.sel(sel),.o(o));
    initial begin
    i0=0;i1=0;sel=0;
    #2 i0=0;i1=0;sel=1;
    #2 i0=0;i1=1;sel=0;
    #2 i0=0;i1=1;sel=1;
    #2 i0=1;i1=0;sel=0;
    #2 i0=1;i1=0;sel=1;
    #2 i0=1;i1=1;sel=0;
    #2 i0=1;i1=1;sel=1;
    
    end
    
endmodule
