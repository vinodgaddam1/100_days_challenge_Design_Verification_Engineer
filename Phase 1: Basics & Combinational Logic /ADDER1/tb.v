`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.07.2026 18:38:16
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
  reg [9:0]a,b;
  reg ci;
  wire[9:0]SUM;
  wire CARRY;
  ripple dut(a,b,ci,SUM,CARRY);
  initial begin
    $monitor("Time=%0t ,a=%b,b=%b,ci=%b,SUM=%b,CARRY=%b",$time,a,b,ci,SUM,CARRY);
    repeat (20) begin
      
      {a,b,ci} = $random;
      #1;
      
    end
    
    
  end
  
endmodule
