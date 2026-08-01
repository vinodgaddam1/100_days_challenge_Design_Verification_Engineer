`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2026 19:17:39
// Design Name: 
// Module Name: tb
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


//Test_bench 
module tb;
         reg clk;
         reg rst;
         reg toggle;
         wire  out;
parameter OFF=1'b0;
parameter ON=1'b1;

toggle_fsm #(.OFF(OFF),.ON(ON)) dut(.clk(clk),.rst(rst),.toggle(toggle),.out(out));
initial begin
clk=0;
forever #5 clk=~clk;
end	
initial begin
	$monitor("TIme=%0t,rst=%b,toggle=%b,out=%b",$time,rst,toggle,out);
rst=1;
#20;
rst=0;
repeat (20)begin
toggle=$random;
#10;
end
$finish;
end
endmodule
