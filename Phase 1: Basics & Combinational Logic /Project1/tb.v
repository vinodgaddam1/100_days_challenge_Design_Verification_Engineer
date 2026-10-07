`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 19:16:35
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
  reg [3:0] a, b;
  reg sel;
  wire [3:0] result;
  wire carry_borrow;

  add_sub  dut(a, b, sel, result, carry_borrow);

  initial begin
    $monitor("time=%0t | a=%d b=%d sel=%b | result=%d carry_borrow=%b",
             $time, a, b, sel, result, carry_borrow);
    repeat (20) begin
    {a,b,sel}=$random;
    #10 ;
    end
  end
endmodule

