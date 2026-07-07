`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2026 19:44:43
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
  reg ci;
  wire [3:0]sum;
  wire co;
  carry_look dut(.a(a),.b(b),.ci(ci),.sum(sum),.co(co));
  initial begin
    $monitor("time=%0t,a=%b,b=%b,ci=%b,sum=%b,carry=%b",$time,a,b,ci,sum,co);
    repeat (20)begin
      {a,b,ci}=$random;
    #1;
    end
  end
endmodule
