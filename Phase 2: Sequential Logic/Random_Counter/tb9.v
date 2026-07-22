`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 18:37:53
// Design Name: 
// Module Name: tb9
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module tb();
reg clk,rst;
wire [4:0]count;
integer i;
//Random_seq_counter dut(.clk(clk),.rst(rst),.count(count));
//EVEN_COUNTER dut(.clk(clk),.rst(rst),.count(count));
ODD_COUNTER dut(.clk(clk),.rst(rst),.count(count));
initial begin
clk=0;
for(i=0;i<=500;i=i+1)//Using For to genrate the Clock 
#5 clk=~clk;
end
initial begin
$monitor("TIme=%0t,rst=%b,count=%b",$time,rst,count);
//rst=1; Active High
rst=0;
#20;
rst=1;
repeat (20)begin
#20;
end
rst=0;
#20;
rst=1;
repeat (5)begin
#20;
end
#50;
$finish;
end
endmodule
