`timescale 1ns / 1ps

module tb_mux4to1(

    );
    reg i0,i1,i2,i3,s0,s1;
    wire t1,t2;
    wire o;
    
    mux4to1_top uut(.i0(i0),.i1(i1),.i2(i2),.i3(i3),.s0(s0),.s1(s1),.o(o),.t1(t1),.t2(t2));
    initial begin 
    i0=1;i1=0;i2=0;i3=0;s0=0;s1=0;
    #2 i0=0;i1=0;i2=0;i3=0;s0=0;s1=0;
    #2 i0=0;i1=1;i2=1;i3=0;s0=0;s1=1;
    #2 i0=0;i1=0;i2=0;i3=0;s0=1;s1=0;
    #2 i0=0;i1=0;i2=0;i3=1;s0=1;s1=1;
   
    end
        
endmodule
