`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 19:20:24
// Design Name: 
// Module Name: YY
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


//  implementing 5x1 mux using 2x1 mux
module mux2to1(input [1:0]i,input sel,output y);
  assign y = sel ? i[1] : i[0];
endmodule

//---> now implementing 5x1 mux

module mux5to1(input [4:0]i,input[2:0]sel,output y);
  wire w1,w2,w3;
  
  mux2to1 g1(.i({i[1],i[0]}),.sel(sel[0]),.y(w1));
  mux2to1 g2(.i({i[3],i[2]}),.sel(sel[0]),.y(w2));
  mux2to1 g3(.i({w2,w1}),.sel(sel[1]),.y(w3));
  mux2to1 g4(.i({i[4],w3}),.sel(sel[2]),.y(y));
endmodule