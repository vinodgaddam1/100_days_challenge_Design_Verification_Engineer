`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.07.2026 18:30:29
// Design Name: 
// Module Name: tb12
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
reg clk,rst;
reg din;
wire  dout;
SISO dut(.clk(clk),.rst(rst),.din(din),.dout(dout));
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
$monitor("Time=%0t,rst=%b,din=%b,dout=%b,q=%b",$time,rst,din,dout,dut.q);
rst=1;
#10;
rst=0;
repeat (10)begin
din=$random;
#10;
end
rst=1;
#10;
rst=0;
repeat (5)begin
din=$random;
end
#100;
$finish;
end










endmodule
