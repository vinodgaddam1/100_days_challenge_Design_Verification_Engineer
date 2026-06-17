`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2026 19:49:49
// Design Name: 
// Module Name: tb5
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
 reg  a,b;
  wire y;
  mux3 dut (.a(a),.b(b),.y(y));
  integer i;
  initial begin
    $monitor("Time=%0t); a=%b; b==%b; y=%b",$time ,a,b,y);
    for (i=0;i<4;i=i+1) begin
      {a,b}=i;
      #1;
    end
  end
  
endmodule