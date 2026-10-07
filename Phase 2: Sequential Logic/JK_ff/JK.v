`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2026 18:58:56
// Design Name: 
// Module Name: JK
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


// Implementing JK_ff
module JK_ff(
input J,K,clk,rst,
output reg q
);
  always @(posedge clk)begin
    if(rst)begin
      q<=0;
    end
    else begin 
      if(J==0 && K==0)begin
        q<=q;//Hold
      end
    else  if(J==0 && K==1)begin
        q<=0;//Reset
    end
    else  if(J==1 && K==0)begin
        q<=1;//set
    end
    else  if(J==1
     && K==1)begin
        q<=~q;//togggle
    end
   end
  end
endmodule
