`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 19:16:16
// Design Name: 
// Module Name: add_sub
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

// N-bit Adder-Subtractor
module add_sub #(parameter N=4) (
  input  [N-1:0] a, b,
  input          sel,   // sel=0 → add, sel=1 → subtract
  output [N-1:0] result,
  output         carry_borrow
);
  wire [N-1:0] b_mod;
  wire         c_in;

  // XOR each bit of b with sel → if sel=1, b is inverted
  assign b_mod = b ^ {N{sel}};
  assign c_in  = sel;   // add +1 when subtracting

  assign {carry_borrow, result} = a + b_mod + c_in;
endmodule

