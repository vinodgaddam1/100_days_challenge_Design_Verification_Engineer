`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2026 19:28:02
// Design Name: 
// Module Name: tb3
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


module tb;
  reg [3:0] in;
  wire [3:0] y;

  circuit3 dut(.in(in), .y(y));

  integer i;

  initial begin
    $monitor("time=%0t, in=%b, y=%b", $time, in, y);

    for (i = 0; i < 16; i = i + 1) begin
      in = i;
      #10;
    end
  end
endmodule

