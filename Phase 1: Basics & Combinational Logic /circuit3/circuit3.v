`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2026 19:26:40
// Design Name: 
// Module Name: circuit3
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


/* Design a combinational circuit which produce 2's complement 
of a 4-bit number.ignore sign bit*/
module circuit3(
  input  [3:0] in,
  output [3:0] y
);
  assign y = ~in + 1;  // 2's complement
endmodule
/* Design a combinational circuit which produce 1's complement 
of a 4-bit number.ignore sign bit*/
/*module circuit3(
  input  [3:0] in,
  output [3:0] y
);
  assign y = ~in ;  // 1's complement
endmodule
*/