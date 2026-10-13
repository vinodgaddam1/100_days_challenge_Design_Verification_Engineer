`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2026 18:59:58
// Design Name: 
// Module Name: tt1
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


//Implementing Half adder using Demux 1:4
module half_adder_demux(input a,b,output SUM,CARRY);
  wire [3:0]y;
  assign y[0]=(~a & ~b);
  assign y[1]=(~a & b);
  assign y[2]=(a & ~b);
  assign y[3]=(a & b);
  
  assign SUM= y[1] | y[2] ;
  assign CARRY= y[3];
  endmodule



//TB




`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2026 19:00:16
// Design Name: 
// Module Name: tt2
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
  reg a,b;
  wire SUM,CARRY;
  integer i;
  
  half_adder_demux dut(.a(a),.b(b),.SUM(SUM),.CARRY(CARRY));
  
  initial begin
    for(i=0;i<4;i=i+1)begin
      {b,a}=i;
      #1;
      $display ("time=%0t,a=%b,b=%b,SUM=%b,CARRY=%b",$time,a,b,SUM,CARRY);
      
    end
    
  end
endmodule
