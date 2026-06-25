`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 19:35:51
// Design Name: 
// Module Name: ttt
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
  pr_encoder dut(.d(d),.y(y));
  initial begin
    $monitor("Time=%0t,d=%b,y=%b",$time,d,y);
    repeat (50) begin
    d=$random;
    #1;
    end
  end
endmodule
