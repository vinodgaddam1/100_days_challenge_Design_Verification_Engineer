`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 18:54:09
// Design Name: 
// Module Name: d
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

//encoder 8:3 
module encoder(
  input [7:0]d,
  output reg [2:0]y
);
  always @(*) begin
    case(d)
      8'b00000001: y=3'b000;
      8'b00000010: y=3'b001;
      8'b00000100: y=3'b010;
      8'b00001000: y=3'b011;
      8'b00010000: y=3'b100;
      8'b00100000: y=3'b101;
      8'b01000000: y=3'b110;
      8'b10000000: y=3'b111;
      default:y=3'b000;
    endcase
  end
endmodule
