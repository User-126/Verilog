`timescale 1ns / 1ps


module tb_fx3(

    );
    reg in;
    wire out;
    wire in_delay1;
    wire in_delay2;
    fx3_top uut(.in(in),.out(out),.in_delay1(in_delay1),.in_delay2(in_delay2));
    always #15 in=~in;
    assign #5 in_delay1 = in;
    assign #5 in_delay2 = in_delay1;
    initial begin
    in=0;
    end
endmodule
