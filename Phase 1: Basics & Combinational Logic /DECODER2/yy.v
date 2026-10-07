`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2026 19:38:42
// Design Name: 
// Module Name: yy
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
  reg [2:0]a;
  reg en;
  wire [7:0]y;
  decoder3to8 dut(.a(a),.y(y),.en(en));
  initial begin
    $monitor("time=%0t,a=%b,en=%b,y=%b",$time,a,en,y);
    repeat (50)begin
      {en,a}=$random;
      #1;
    end
  end
endmodule
