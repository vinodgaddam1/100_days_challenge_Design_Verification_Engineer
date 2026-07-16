`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2026 18:42:43
// Design Name: 
// Module Name: tb7
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
  //reg j,k;
  //reg D; 
  reg s,r;
  parameter MIN=0;
  parameter MAX=4;
  wire q;
  integer seed;
  T_sr dut(.s(s),.r(r),.clk(clk),.rst(rst),.q(q));
  //T_jk dut(.j(j),.k(k),.clk(clk),.rst(rst),.q(q));
  //T_D dut(.D(D),.clk(clk),.rst(rst),.q(q));
  initial 
  clk=0;
  always #5 clk=~clk;
  initial begin
         seed=3277777;//this seed will be 3277777 T_jk,T_d,T_sr
     
    $monitor ("Time=%0t s=%b,r=%b,rst=%b,q=%b",$time,s,r,rst,q);
    //$monitor ("Time=%0t j=%b,k=%b,rst=%b,q=%b",$time,j,k,rst,q);
    //$monitor ("Time=%0t D=%b,rst=%b,q=%b",$time,D,rst,q);
    rst=1;
    s=0;r=0;
    //j=0;k=0;
    //D=0;
    #10 rst=0;
    repeat(10)begin
      {s,r}=MIN+(($random(seed) &32'h7fffffff) %(MAX-MIN+1));
      //{j,k}=MIN+(($random(seed) &32'h7fffffff) %(MAX-MIN+1));
    //  D=MIN+(($random(seed) &32'h7fffffff) %(MAX-MIN+1));
      
      #10;
    end
      #20 $finish;
  end
endmodule