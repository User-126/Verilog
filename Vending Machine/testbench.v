`timescale 1ns / 1ps


module tb_vending_machine(

    );
    reg clk;
    reg rst;
    reg start;
    reg cancel;
    reg[2:0] prod_code;
    reg online_payment;
    reg[6:0] coins;
    
    wire [3:0] state;
    wire dispense_prod;
    wire [6:0] return_change_value;
    wire [6:0] prod_price_value;
    
    
    
vending_machine_top uut(.clk(clk),.rst(rst),.start(start),.cancel(cancel),.prod_code(prod_code),.online_payment(online_payment),.coin_val(coins),.state(state),.dispense_prod(dispense_prod),.return_change(return_change_value),.prod_price(prod_price_value));

always #5 clk=~clk;
initial begin
clk=0;
rst=1;
start=0;
cancel=0;
coins=0;
online_payment=0;
prod_code=0;

#100 rst =0;
#100;
start = 1;
online_payment=1;
#30 start = 0;
online_payment=0;

#50
start=1;
prod_code = 3'b001;
coins= 7'd60;
#30 start=0;

#50
start=1;
prod_code = 3'b100;
coins= 7'd20;
#30 start=0;

#50
start=1;
prod_code = 3'b100;
coins= 7'd30;
#30 start=0;



end
    
endmodule
