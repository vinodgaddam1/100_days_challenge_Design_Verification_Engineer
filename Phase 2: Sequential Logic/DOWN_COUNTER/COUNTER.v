`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2026 18:59:15
// Design Name: 
// Module Name: COUNTER
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

//Implementing N_bit Synchronous down Counter + Asynchronous Active-Low Reset
module DOWN_COUNTER(clk,rst,count);
parameter N=10;
input clk,rst;
  output reg [N-1:0]count;
  always @(posedge clk or negedge rst)begin
    if(!rst)
      count<={N{1'b1}};
    else
      count<=count-1;
  end
endmodule