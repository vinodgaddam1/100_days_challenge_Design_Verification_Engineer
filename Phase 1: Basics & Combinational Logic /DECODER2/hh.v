`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2026 19:38:27
// Design Name: 
// Module Name: hh
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


//HIGHER ORDER DECODERS FROM LOWER ODER DECODERS
//implementing 3:8 decoders using 1:2 decoder
module decoder1to2(
input a,enable,
  output [1:0]y
);
  assign y[0]=enable&~a;
  assign y[1]=enable&a;
endmodule
//2:4 decoder 
module decoder3to8(
  input [2:0]a,
  input en,
  output [7:0]y
);
  wire [5:0]w;
  //stage-1 
  decoder1to2 u3(.a(a[2]),.enable(en),.y(w));
  //stage-2 
  decoder1to2 u1(.a(a[1]),.enable(w[0]),.y(w[3:2]));
  decoder1to2 u2(.a(a[1]),.enable(w[1]),.y(w[5:4]));
  //stage-3
  decoder1to2 u4(.a(a[0]),.enable(w[2]),.y(y[1:0]));
  decoder1to2 u5(.a(a[0]),.enable(w[3]),.y(y[3:2]));
  decoder1to2 u6(.a(a[0]),.enable(w[4]),.y(y[5:4]));
  decoder1to2 u7(.a(a[0]),.enable(w[5]),.y(y[7:6]));
  
endmodule
                 
                 
                 
              
