`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2026 18:43:45
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


//implementing n-bit ripple adder using genvar
//full_adder
module full_adder(
input a,b,ci,
output sum,carry
);
  assign {carry,sum}=a+b+ci;
endmodule
//n_bit ripple adder
module n_bit_ripple(a,b,ci,sum,carry);
  parameter WIDTH = 50;
  input [WIDTH-1:0] a,b;
  input ci;
  output [WIDTH-1:0] sum;
  output carry;
  wire [WIDTH:0]c;
  genvar i;
  generate 
   assign c[0]=ci;
  assign carry=c[WIDTH];
  for(i=0;i<WIDTH;i=i+1)
    full_adder u0 (.a(a[i]),.b(b[i]),.ci(c[i]),.sum(sum[i]),.carry(c[i+1]));
  endgenerate
endmodule

