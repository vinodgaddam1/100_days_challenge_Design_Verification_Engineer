`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2026 18:46:45
// Design Name: 
// Module Name: tb6
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
  reg clk,rst;
  reg S,R;
  //reg J,K;
  wire q;
  //integer seed;
  D_SR dut (.clk(clk),.rst(rst),.S(S),.R(R),.q(q));
  //D_JK dut (.clk(clk),.rst(rst),.J(J),.K(K),.q(q));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    $monitor ("Time=%0t,S=%b,R=%b,rst=%b,q=%b",$time,S,R,rst,q);
    //$monitor ("Time=%0t,J=%b,K=%b,rst=%b,q=%b",$time,J,K,rst,q);
    rst=1;
    S=0;R=0;
    //J=0;K=0;
    #10;
    rst=0;
    repeat (10)begin
      @(negedge clk); 
      {S,R}=$random;
      //{J,K}=$random;
      
      end
  #100 $finish;
  end
endmodule
