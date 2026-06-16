`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2026 19:18:37
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
  reg [3:0]in;
  wire y;
  mux1 dut (.in(in),.y(y));
  integer i;
  initial begin
    $monitor("Time=%0t,in=%d,y=%d",$time,in,y);
    for(i=0;i<16;i=i+1)
      begin
        in=i;
        #10;
      end
  end
endmodule
