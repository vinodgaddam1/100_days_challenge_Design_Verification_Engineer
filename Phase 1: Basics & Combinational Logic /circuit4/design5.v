`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 18:48:38
// Design Name: 
// Module Name: design5
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


/*design a combinational circuit which take 3-bit binary input
& produce output equal to the square of the input in binary*/
module circuit4(
  input [2:0]a,
  output [5:0]y
);
  assign y=a*a;
endmodule

