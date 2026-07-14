`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2026 19:01:56
// Design Name: 
// Module Name: D_all_ff
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

//one flip to another flip-flop
module D_T(
input rst, clk,
input T,
output reg q
);
wire d;
assign d=T^q;
always @(posedge clk)begin
if (rst)
q<=1'b0;
else 
q<=d;
end
endmodule
