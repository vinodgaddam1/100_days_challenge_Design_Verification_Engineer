`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.07.2026 19:05:17
// Design Name: 
// Module Name: tb2
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
  parameter N=10;
  reg clk,rst;
  wire [N-1:0]count;
  Counters dut(.clk(clk),.rst(rst),.count(count)); 
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    $monitor("Time=%0t,rst=%b,count=%b",$time,rst,count);
    rst=1;
    #10;
    rst=0;
    repeat(10)begin
      #10;
    end
    rst=1;
    #10;
    rst=0;
    repeat (5)begin
    #10;
    end
    #20 $finish;
  end
endmodule
