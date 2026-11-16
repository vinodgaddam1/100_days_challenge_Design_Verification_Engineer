`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 18:49:20
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
  reg [2:0]a;
  wire [5:0]y;
  circuit4 dut (.a(a),.y(y));
  integer i;
  initial begin
    $monitor("Time=%0t,a=%d,y=%d",$time,a,y);
      for(i=0;i<8;i=i+1)
        begin
          a=i;
          #10;
    end
  end
endmodule
