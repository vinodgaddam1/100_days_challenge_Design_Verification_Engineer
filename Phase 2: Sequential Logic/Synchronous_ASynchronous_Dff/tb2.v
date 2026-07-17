`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2026 19:18:33
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
  reg clk,rst,d;
  wire q;
  //dff_active_high dut(.clk(clk),.rst(rst),.d(d),.q(q));
  dff_active_low dut(.clk(clk),.rst(rst),.d(d),.q(q));
   initial begin
     clk=0;
     forever #5 clk=~clk;
   end
   initial begin
     $monitor("Time=%0t ,rst=%b,d=%b,q=%b",$time,rst,d,q);
     rst=0; //-->when high change to rest=1
     d=0;
     #10 rst=1; //relased  reset
      repeat (10)begin
      d=$random & 32'h7fffffff;
     #10;
     end
     
     rst=0;
     #10;
     rst=1;
     repeat(5)begin
       d=$random & 32'h7fffffff;
       #10;
     end
     #20 $finish;
   end    
endmodule
