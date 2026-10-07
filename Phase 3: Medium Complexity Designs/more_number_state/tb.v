`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2026 18:30:24
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

module tb;
parameter S0= 7'b0000_001;
parameter S1= 7'b0000_010;
parameter S2= 7'b0000_100;
parameter S3= 7'b0001_000;
parameter S4= 7'b0010_000;
parameter S5= 7'b0100_001;
parameter S6= 7'b1000_001;
reg clk;
reg rst;
reg din;
wire  dout;
more_number dut(clk,rst,din,dout);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
rst=1;
din=0;
rst=0;
repeat (50)begin
@(posedge clk);
din=$random;
end
#500;
$finish;
end
endmodule
