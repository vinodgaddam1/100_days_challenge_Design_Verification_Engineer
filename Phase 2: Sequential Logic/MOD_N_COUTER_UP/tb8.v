`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.07.2026 18:56:02
// Design Name: 
// Module Name: tb8
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


module tb;
parameter WIDTH=3;
reg clk,rst;
wire [WIDTH-1:0]count;
counter_MOD dut(.clk(clk),.rst(rst),.count(count));
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
$monitor("time=%0t,rst=%b,count=%b",$time,rst,count);
rst=0;
#10;
rst=1;
repeat(10)begin
#10;
end
rst=0;
#10;
rst=1;
repeat (5)begin
#10;
end
#20;
$finish;
end
endmodule