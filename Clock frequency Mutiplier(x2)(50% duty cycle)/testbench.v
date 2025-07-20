`timescale 1ns / 1ps


module tb_fx2(

    );
    reg in;
    wire out;
    wire in_delay;
    fx2_top uut(.in(in),.out(out),.in_delay(in_delay));
    always #10 in=~in;
    assign #5 in_delay = in;
    initial begin
    in=0;
    end
endmodule
