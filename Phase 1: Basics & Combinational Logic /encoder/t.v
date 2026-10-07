`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 18:54:28
// Design Name: 
// Module Name: t
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


// Code your testbench here
// or browse Examples
module tb;
  reg [7:0]d;
  wire [2:0]y;
  integer i;
  encoder dut(.d(d),.y(y));
  initial begin
    $monitor("Time=%0t,d=%b,y=%b",$time,d,y);
    for(i=0;i<8;i=i+1) begin
      d=1<<i;
    //repeat (30) begin
    //d=$random;
    #10;
    end
  end
endmodule
