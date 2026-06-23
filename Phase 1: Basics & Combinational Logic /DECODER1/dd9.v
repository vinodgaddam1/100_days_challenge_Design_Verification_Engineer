`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2026 19:21:46
// Design Name: 
// Module Name: dd9
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


//2:4 decoder implementing
module decoder(
input a,b,
output [3:0]y
);
//dateflow
/*assign y[0]=~(a&b);
assign y[1]=(~a&b);
assign y[2]=(a&~b);
assign y[3]=(a&b);*/
assign y=(a==0 && b==0) ? 4'b1000:
(a==0 && b==1) ? 4'b0100:
(a==1 && b==0) ? 4'b0010:
(a==1 && b==1) ? 4'b0001:4'b0000;
endmodule

