`timescale 1ns / 1ps

module full_adder_top(
input wire a,
input wire b,
input wire cin,
output wire s,
output wire cout
    );
    
    assign s= a^b^cin;
    assign cout= a&b | b&cin | cin&a;
endmodule
module bit4adder_top(
    input wire a0,
    input wire a1,
    input wire a2,
    input wire a3,
    input wire b0,
    input wire b1,
    input wire b2,
    input wire b3,
    input wire c0,
    output wire s0,
    output wire s1,
    output wire s2,
    output wire s3,
    output wire c4,
    wire c1,
    wire c2,
    wire c3
    );
    full_adder_top fa1(a0,b0,c0,s0,c1);
    full_adder_top fa2(a1,b1,c1,s1,c2);
    full_adder_top fa3(a2,b2,c2,s2,c3);
    full_adder_top fa4(a3,b3,c3,s3,c4);
    
    
    
    
endmodule
