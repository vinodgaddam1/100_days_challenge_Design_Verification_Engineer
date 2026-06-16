`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2026 19:18:19
// Design Name: 
// Module Name: desgin3
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


// MUX Type-2 Circuits
module mux1(
  input [3:0]in,
output reg y
);
  always @(*) begin
    case(in)
      4'd1, 4'd2, 4'd5, 4'd9, 4'd10, 4'd12, 4'd13:y=1;
      default y=0;
    endcase
  end
endmodule
    
    

