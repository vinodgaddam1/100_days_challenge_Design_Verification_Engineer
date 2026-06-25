`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 19:35:33
// Design Name: 
// Module Name: ccc
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


// MSB Priority Encoder 8:3 (Gate-Level)
module pr_encoder (
  input [7:0]d,
  output [2:0]y
);
  wire w1,w2,w3,w4,w5;
  
  or g1(y[2],d[7],d[6],d[5],d[4]); //y2
  
  and g2(w1,d[3],~d[4],~d[5],~d[6],~d[7]);
  and g3(w2,d[2],~d[3],~d[4],~d[5],~d[6],~d[7]);
  or g4(y[1],w1,w2,d[7],d[6]); //y1
  
  and g5(w3,d[5],~d[6],~d[7]);
  and g6(w4,d[3],~d[4],~d[5],~d[6],~d[7]);
  and g7(w5,d[1],~d[2],~d[3],~d[4],~d[5],~d[6],~d[7]);
  or g8(y[0],d[7],w3,w4,w5); //y0
endmodule


