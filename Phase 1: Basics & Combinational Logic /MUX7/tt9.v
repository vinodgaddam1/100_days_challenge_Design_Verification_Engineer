`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2026 19:18:39
// Design Name: 
// Module Name: tt9
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
  wire carry;
  //wire sum1;
  carry1 dut(.a(a),.b(b),.carry(carry));
  //sum1 dut(.a(a),.b(b),.sum1(sum1));
  
  initial begin
    $monitor ("Time=%0t ,a=%b,b=%b,carry=%b",$time,a,b,carry);
  //  $monitor ("Time=%0t ,a=%b,b=%b,sum=%b",$time,a,b,sum1);
    repeat (10) begin
      {a,b}=$random;
      //sum1=$random;
      #1;
    end
  end
  
endmodule
