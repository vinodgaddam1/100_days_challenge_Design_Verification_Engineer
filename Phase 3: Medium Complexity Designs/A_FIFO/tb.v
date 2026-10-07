`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2026 18:15:51
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
reg clk,rst,in;
wire out;
//melay_overlapping dut(.clk(clk),.rst(rst),.in(in),.out(out));
melay__non_overlapping dut(.clk(clk),.rst(rst),.in(in),.out(out));
//moore__non_overlapping dut(.clk(clk),.rst(rst),.in(in),.out(out));
//moore_overlapping dut(.clk(clk),.rst(rst),.in(in),.out(out));
//Enocde the States
parameter S0=3'b000;
parameter S1=3'b001;
parameter S2=3'b010;
parameter S3=3'b011;
parameter S4=3'b100;

initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
$monitor("Time=%0t,in=%b,out=%b,rst=%b",$time,in,out,rst);
rst=1;
in=0;
#20;
rst=0;
repeat (30)begin
@(posedge clk);
in=$random;
#10;
end
$finish;
end
endmodule

