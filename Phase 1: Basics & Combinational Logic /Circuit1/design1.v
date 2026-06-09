`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 20:00:45
// Design Name: 
// Module Name: design1
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


/* Design a circuit to detect 
"Decimal number 5 to 10 in 4-bit gray-code"*/
module circuit1 (
  input [3:0] g,
output y
);
  wire w1,w2;
  assign w1 = g[2] & g[0];
  assign w2 = g[2] & ~g[1];
  assign y = w1 | w2;
endmodule



