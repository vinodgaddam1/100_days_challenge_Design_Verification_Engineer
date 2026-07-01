`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2026 18:49:08
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
  reg a,b,ci;
  wire SUM,CARRY;
  //integer i;
  NAND_Full_adder dut( a,b,ci, SUM,CARRY);
  initial begin
    $monitor("Time=%0t,a=%b,b=%b,ci=%b,SUM=%b,CARRY=%b",$time,a,b,ci,SUM,CARRY);
    repeat (10)begin
      {a,b,ci}=$random;
    #1;
  end
  end
endmodule
