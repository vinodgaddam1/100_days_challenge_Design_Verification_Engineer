`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 19:20:40
// Design Name: 
// Module Name: TT
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
  reg  [4:0]i;
  reg  [2:0]sel;
  wire y;
  
  mux5to1 dut(.i(i),.sel(sel),.y(y));
  
  initial begin
    
    $monitor ("TIme=%0t i=%b ,sel=%b ,y=%b",$time,i,sel,y);
    
    repeat (30) begin
    
    {sel,i}=$random;
    
    #1;
    end
    
  end
  
endmodule
