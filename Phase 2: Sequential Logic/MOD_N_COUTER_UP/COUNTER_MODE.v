`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.07.2026 18:55:44
// Design Name: 
// Module Name: COUNTER_MODE
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

//MoD_N counter
module counter_MOD(clk,rst,count);
input clk,rst;
parameter WIDTH =3;
parameter MOD=5;
output reg [WIDTH-1:0]count;
always @(posedge clk)begin
if(!rst)
count<=0;
else if(count==MOD-1)
count<=0;
else
count<=count+1;
end
endmodule