`timescale 1ns / 1ps


module tb_dec24(

    );
    reg i0,i1;
    wire o0,o1,o2,o3;
    
    decoder2to4_top uut(.i0(i0),.i1(i1),.o0(o0),.o1(o1),.o2(o2),.o3(o3));
    initial begin
    i0=0;i1=0;
    #2 i0=0;i1=1;
    #2 i0=1;i1=0;
    #2 i0=1;i1=1;
    
    end
    
