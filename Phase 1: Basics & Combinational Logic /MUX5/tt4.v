`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2026 19:32:33
// Design Name: 
// Module Name: tt4
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
  reg [7:0]a;
  reg [3:0]sel;
  wire y;
  integer i;
  mux8to1 dut(.a(a),.sel(sel),.y(y));
  initial begin
    $monitor("Time=%0t,a=%b,sel=%b,y=%b",$time, a,sel,y);
    a=8'b11111111;
    for(i=0;i<8;i=i+1)begin
      sel=i;
      #10;
    end
  end
endmodule
