`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2026 19:14:30
// Design Name: 
// Module Name: EE
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
  reg a,b,ci;
  wire SUM,CARRY;
  
  SUM_CARRY dut(.a(a),.b(b),.ci(ci),.SUM(SUM),.CARRY(CARRY));

  initial begin
    
    $monitor ("TIme=%0t , a=%b , b=%b , ci=%b , SUM=%b , CARRY=%b",$time,a,b,ci,SUM,CARRY);
    
    repeat (20) begin
      
      {a,b,ci}=$random;
      #1;
    end
  end
endmodule
