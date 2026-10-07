`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2026 19:10:47
// Design Name: 
// Module Name: dd8
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


// implementing 1:4 demux 

module demux(
  input a,
  input [1:0]sel,
  output reg [3:0]y
);
  always @(*) begin
    case (sel)
      2'b00 : y={3'b000,a};
      2'b01 : y={2'b00,a,1'b0};
      2'b10 : y={1'b0,a,2'b00};
      2'b11 : y={a,3'b000};
      default: y=4'b0000;
    endcase
  end
endmodule
      
      
