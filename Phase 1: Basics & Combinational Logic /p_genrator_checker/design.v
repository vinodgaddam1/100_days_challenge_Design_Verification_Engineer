`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2026 19:28:53
// Design Name: 
// Module Name: design
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


//parity genrator and parity checker
module four_bit_even(
  input [3:0]d,
output  p
);
  assign p=d[0] ^ d[1] ^ d[2] ^ d[3] ; //even
endmodule
module four_bit_checker(
  input [3:0]d,
  input p_in,
output reg error
);
  wire p_cal;
   four_bit_even g1(.d(d),.p(p_cal));
  always @(*)begin
    if (p_in != p_cal)
       error =1;
      else
        error=0;
  end
endmodule