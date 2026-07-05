`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2026 19:29:14
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
  reg [3:0]d;
  reg p_in;
wire error;
  four_bit_checker dut(.d(d),.p_in(p_in),.error(error));
  initial begin
    $monitor("Time=%0t d=%b ,p_in=%b error=%b",$time,d,p_in,error);
    repeat (10) begin
      {d,p_in}=$random;
       p_in=^d;     
       #1;
    end    
  end
  
endmodule