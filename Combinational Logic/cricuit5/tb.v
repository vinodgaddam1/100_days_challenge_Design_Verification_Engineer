`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2026 19:19:40
// Design Name: 
// Module Name: tb6
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
  reg a,b,c,d;
  wire y;
  circuit5 dut(.y(y),.a(a),.b(b),.c(c),.d(d));
  integer i;
  initial begin
    $monitor("Time=%0t,a=%b,b=%b,c=%b,d=%b,y=%h",$time,a,b,c,d,y);
    for (i=0;i<10;i=i+1)begin
      {a,b,c,d}=i;
      #10;
    end   
  end
endmodule
