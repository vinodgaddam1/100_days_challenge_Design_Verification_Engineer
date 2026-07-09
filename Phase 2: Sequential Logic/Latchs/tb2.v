`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.07.2026 19:17:08
// Design Name: 
// Module Name: tb2
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
  reg s,r;
  wire q,qbor;
  //sr_latch_nor dut (.s(s),.r(r),.q(q));
   //sr_latch_nand dut (.s(s),.r(r),.q(q));
 // rs_latch_nor dut (.s(s),.r(r),.q(q),.qbor(qbor));
 rs_latch_nand dut (.s(s),.r(r),.q(q),.qbor(qbor));

  
  initial begin
    $monitor("Time=%0t , s=%b, r=%b ,q=%b,qbor=%b",$time,s,r,q,qbor);
    //$monitor("Time=%0t , s=%b, r=%b ,q=%b",$time,s,r,q);
    repeat (8)begin
      {s,r}=$random % 4;
      #5;
    end
  end
  
  
endmodule
