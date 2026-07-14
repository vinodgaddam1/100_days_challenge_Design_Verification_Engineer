`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.07.2026 18:41:10
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
  reg rst,clk;
  reg  T;
  wire q;
  D_T dut(.rst(rst),.clk(clk),.q(q),.T(T));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
     rst=1;
     T=0;
      #10;
     rst=0;
     
     //Hold
     #10 T=0;
     
     //Toggle
     #10 T=1;
     #20 T=1;
     
     //Hold
     #10 T=0;
     
     //Toggle
     #20 T=1;
     #20; $finish;
        end
  initial begin
    $monitor("Time=%0t,rst=%b,T=%b,q=%b",$time,rst,T,q);
  end
endmodule


