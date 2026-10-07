`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2026 18:47:52
// Design Name: 
// Module Name: UP_DOWN_COUNTER
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


//Implementing N_bit UP/DOWN  Counter	Synchronous Active-High Reset
module up_down_counter(clk,rst,up,count);
  parameter N=10;
  input clk,rst,up;
  output reg [N-1:0]count;
  always @(posedge clk)begin
    if(rst) begin
      count<=0;
    end
    else if (up)begin
      count<=count+1; //UP_counter
    end
    else begin
      count<=count-1; //Down counter
    end
  end
endmodule