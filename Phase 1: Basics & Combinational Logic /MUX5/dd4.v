`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2026 19:32:13
// Design Name: 
// Module Name: dd4
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


//Implement Higher level mux from lower level
//style-1 cascading 8:1 using 4:1 + 2:1

//2:1 mux
module mux2to1(
input a,b,se1,
output y
);
  assign y=se1? b : a;
endmodule
//4:1 mux using 2:1 mux

module mux4to1(a,sel,y);
  input [3:0]a;
  input [2:0]sel;
  output y;
  wire y0,y1;
  mux2to1 mux1(a[0],a[1],sel[0],y0);
  mux2to1 mux2(a[2],a[3],sel[0],y1);
  mux2to1 mux3(y0,y1,sel[1],y);
endmodule

//8:1 mux using 4:1 + 2:1  mux
module mux8to1(input [7:0]a,input [3:0]sel, output y);
  wire y0,y1;
  mux4to1 mux1(a[3:0],sel[1:0],y0);
  mux4to1 mux2(a[7:4],sel[1:0],y1);
  mux2to1 mux3(y0,y1,sel[2],y);
endmodule
  
