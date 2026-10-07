`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.07.2026 19:05:01
// Design Name: 
// Module Name: UP_COUNTER
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


//Implementing counters asynchronous UP_counter
module Counters ( clk,rst,count);
  parameter N=10;
  input clk,rst;
  output reg [N-1:0]count;
  always @(posedge clk or posedge rst)begin
    if(rst)
      count<=0;
    else
      count<=count+1;
  end
endmodule





