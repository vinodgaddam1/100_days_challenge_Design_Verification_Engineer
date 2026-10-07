`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.07.2026 19:05:22
// Design Name: 
// Module Name: tb3
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
  parameter DEPTH=16;
  parameter WIDTH=8;
  parameter ADDR=$clog2(DEPTH);
  reg clk,rst;
  reg w_r;
  reg [ADDR-1:0]addr;
  reg [WIDTH-1:0]wdata_in;
  wire [WIDTH-1:0]rdata_out;
  integer i;
  Asy_RAM dut(clk,rst,w_r,wdata_in,rdata_out,addr);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
 initial begin
 
 $monitor("Time=%0t,rst=%0b,w_r=%b,wdata=%0h,rdata=%0h",$time,rst,w_r,wdata_in,rdata_out);
   rst=1;
   #20;   //repeat(2)#10; both are same only
   rst=0;
   
   //Write operation
   for(i=0;i<DEPTH;i=i+1)begin
    @(posedge clk);
   w_r=1;
   addr=i;
   wdata_in=$random;
   end
   @(posedge clk);
    w_r=0;
    #2;
   //Read operation
   for(i=0;i<DEPTH;i=i+1)begin
  // @(posedge clk);
   addr=i;
   #2;
   end
   #500;
   $finish;
 end
endmodule
