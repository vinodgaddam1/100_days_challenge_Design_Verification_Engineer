`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2026 19:02:38
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
  reg rst,clk;
  reg  d;
  wire q;
  D_ff dut(.rst(rst),.clk(clk),.q(q),.d(d));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    rst=0;
    #10 rst=1;
    #10 rst=0;
    end
  initial begin
    $monitor("Time=%0t,rst=%b,d=%b,q=%b",$time,rst,d,q);
    repeat (10)begin
    d=$random;
      #10;
    end
    #20 $finish;
  end
endmodule
