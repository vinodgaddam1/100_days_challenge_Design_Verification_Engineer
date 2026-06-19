`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 19:32:09
// Design Name: 
// Module Name: dd3
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


//      Implement lower level mux from high level mux
/*4:1---->2:1
module mux5(
  input [3:0]a,
  input [1:0]sel,
  output y
);
  assign y = sel[1] ? (sel[0] ? 0 : 0) 
    : (sel[0] ? 1 : 1);
endmodule*/
//8:1----> 2:1
module mux8(a,sel,y);
  input [7:0]a;
  input [3:0]sel;
  output reg y;

  always @(* ) begin
    case (sel)
      3'b000: y=1;
      3'b001: y=1;
      3'b010: y=1'bx;
      3'b011: y=1'bx;
      3'b100: y=1'bx;
      3'b101: y=1'bx;
      3'b110: y=1'bx;
      3'b111: y=1'bx;
      default y=1'b0;
    endcase
  end
endmodule


  
      
  