`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.07.2026 18:30:10
// Design Name: 
// Module Name: SISO
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
module SISO(
input clk,rst,
input din,
output  dout
);
reg[3:0]q;
assign dout = q[3];
  always @(posedge clk) begin
  if(rst)
  q<=4'b0000;
  else
  q<={q[2:0],din}; 
  end
endmodule
    