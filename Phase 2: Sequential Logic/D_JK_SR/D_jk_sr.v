`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2026 18:46:27
// Design Name: 
// Module Name: D_jk_sr
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


/*/Implementing D_ JK/SR
//D_JK
module D_JK(
input rst,clk,
input J,K,
output reg q
);
  wire d;
  assign d=(~K & q) | (J & ~q);
  always @(posedge clk)begin
    if (rst)begin
      q<=1'b0;
    end
    else begin
      q<=d;
    end
    
  end
endmodule
*/

//D_SR
module D_SR(
input rst,clk,
input S,R,
output reg q
);
  wire d;
  assign d = (S && R) ? 1'bx : ((~R & q) | S);
  always @(posedge clk)begin
    if (rst)begin
      q<=1'b0;
    end
    else begin
      q<=d;
    end
  end
endmodule



