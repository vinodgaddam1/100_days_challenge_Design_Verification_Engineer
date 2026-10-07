`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2026 19:14:15
// Design Name: 
// Module Name: WW
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


//Implementing Full adder using 8:1 mux 

module mux8to1 (
  input [7:0]i,
  input [2:0]s,
output y
);
  assign y = i[s];
endmodule

module SUM_CARRY(input a,b,ci,output SUM,CARRY);
  wire [2:0]sel={a,b,ci};
  mux8to1 G1(.i(8'b10010110),.s(sel),.y(SUM));
  mux8to1 G2(.i(8'b11101000),.s(sel),.y(CARRY));
endmodule


