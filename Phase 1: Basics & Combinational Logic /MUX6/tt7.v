`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2026 19:40:31
// Design Name: 
// Module Name: tt7
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
  reg [15:0]a;
  reg [3:0]s;
  wire y;
  integer i;
  mux16to1 dut (.a(a),.s(s),.y(y));
  initial begin
    $monitor("time=%0t,a=%b,s=%b,y=%b",$time,a,s,y);
    a=16'b1111111111111111;
    for(i=0;i<16;i=i+1) begin
      s=i; 
      #10;
    end
  end
  
endmodule

