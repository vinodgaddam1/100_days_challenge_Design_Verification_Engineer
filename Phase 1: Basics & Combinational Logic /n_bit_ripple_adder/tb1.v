`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2026 18:44:02
// Design Name: 
// Module Name: tb1
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
  parameter WIDTH = 50;
  reg [WIDTH-1:0] a,b;
  reg ci;
  wire [WIDTH-1:0] sum;
  wire carry;
  
  n_bit_ripple #(.WIDTH(WIDTH))dut (.a(a),.b(b),.ci(ci),.sum(sum),.carry(carry));//-->overriding
  //n_bit_ripple dut (.a(a),.b(b),.ci(ci),.sum(sum),.carry(carry));
  initial begin
    $monitor ("Time=%0t a=%b,b=%b,ci=%b,sum=%b,carry=%b,",$time,a,b,ci,sum,carry);
    repeat (10)begin
      {a,b,ci}=$random;
      #1;
    end
  end
endmodule