`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2026 18:48:10
// Design Name: 
// Module Name: tb5
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
  parameter N=5;
  reg  clk,rst,up;
  wire [N-1:0]count;
  up_down_counter #(.N(5)) dut(.clk(clk),.rst(rst),.up(up),.count(count));
  initial begin
    clk=0;
    forever #5 clk=~clk;
    end
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    $monitor("Time=%0t,rst=%b,up=%b,count=%b",$time,rst,up,count);
    rst=1;
    up=0;
    #10;
    rst=0;
    up=1;
    repeat(10)begin
      #10;
    end
    rst=1;
    #10;
    rst=0;
    up=0;
    repeat (5)begin
      #10;
    end
    #50 $finish;
  end
endmodule
