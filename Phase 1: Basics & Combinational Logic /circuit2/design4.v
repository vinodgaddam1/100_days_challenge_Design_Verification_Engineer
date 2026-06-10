`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 19:06:38
// Design Name: 
// Module Name: design4
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


/* Design a circuit to detect the decimal number 1,3,5,7,and 9
 in a 1-nibble (4-bits) 5211 BCD inputs.*/
module circuit2 (
  input a,b,c,d,
output f
);
  assign f = ~a&(c^d) | a &(~(c^d));
endmodule

  
