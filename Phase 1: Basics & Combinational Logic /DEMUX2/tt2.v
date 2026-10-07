`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2026 19:00:16
// Design Name: 
// Module Name: tt2
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
  reg a,b;
  wire SUM,CARRY;
  integer i;
  
  half_adder_demux dut(.a(a),.b(b),.SUM(SUM),.CARRY(CARRY));
  
  initial begin
    for(i=0;i<4;i=i+1)begin
      {b,a}=i;
      #1;
      $display ("time=%0t,a=%b,b=%b,SUM=%b,CARRY=%b",$time,a,b,SUM,CARRY);
      
    end
    
  end
endmodule