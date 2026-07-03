`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2026 18:32:39
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

//Using Function 
module tb;
  reg a,b,bi;
wire diff,br;
  full_sub dut(a,b,bi,diff,br);
 always begin
   $monitor("Time=%0t , a=%b ,b=%b , bi=%b diff=%b,br=%b",$time,a,b,bi,diff,br);
   repeat (10) begin
     {a,b,bi}=$random;
     #1;
   end
    $finish;
 end
  
endmodule
