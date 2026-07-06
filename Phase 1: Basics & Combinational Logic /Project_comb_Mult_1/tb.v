`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2026 21:44:46
// Design Name: 
// Module Name: tb
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
  reg [3:0]a,b;
  wire [7:0]p;
  mult_4to4 dut(.a(a),.b(b),.p(p));
  initial begin
    
    $monitor("Time=%0t,a=%0d,b=%0d,sum=%0b",$time,a,b,p);
    repeat (10)begin
      {a,b}=$random;
      #10;
      
    end
  end
  
endmodule
