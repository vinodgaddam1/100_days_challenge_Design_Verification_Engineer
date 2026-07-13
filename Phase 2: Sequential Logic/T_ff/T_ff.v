`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.07.2026 18:40:47
// Design Name: 
// Module Name: T_ff
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


//Implementing T-ff 
module T_ff(
  input rst,clk,
  input  T,
  output reg q
);
  always @(posedge clk)begin  //asy
    if (rst)
      q<=1'b0;
    else begin
      case(T)
        1'b0:q<=q;
        1'b1:q<=~q;
      endcase
    end
  end
endmodule
