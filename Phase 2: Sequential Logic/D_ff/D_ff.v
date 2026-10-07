`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2026 19:02:22
// Design Name: 
// Module Name: D_ff
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


//Implementing D-ff 
module D_ff(
  input rst,clk,
  input  d,
  output reg q
);
  always @(posedge clk)begin  //asy
    if (rst)
      q<=1'b0;
    else
      q<=d;
  end
endmodule
