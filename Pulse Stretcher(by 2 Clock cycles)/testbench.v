`timescale 1ns / 1ps


module tb_pulse(

    );
    reg in,clk;
    wire out;
    pulse_stretcher_top uut(.in(in),.clk(clk),.out(out));
    always #5 clk=~clk;
    initial begin
    clk=0;
    in=0;
    #14 in=1;
    #12 in=0;
    end
endmodule
