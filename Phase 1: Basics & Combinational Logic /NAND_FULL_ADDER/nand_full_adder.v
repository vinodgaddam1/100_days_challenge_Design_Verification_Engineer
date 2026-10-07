`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2026 18:48:39
// Design Name: 
// Module Name: nand_full_adder
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


//Implementing Fulladder using NAND gates
  module NAND_Full_adder(input a,b,ci,output SUM,CARRY);
    wire w1,w2,w3,w4,w5,w6,w7,w8,w9;
  nand g1(w0,a,b);
  nand g2(w1,a,w0);
  nand g3(w2,b,w0);
  nand g4(w3,w1,w2);
  nand g5(w4,ci,w3);
  nand g6(w5,w3,w4);
  nand g7(w6,ci,w4);
  nand g8(SUM,w5,w6);
  nand g9(CARRY,w0,w4);
endmodule
