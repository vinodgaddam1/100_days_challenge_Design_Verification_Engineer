`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2026 19:44:23
// Design Name: 
// Module Name: carry_look
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


//design a 4-bit-carry look ahead adder
module carry_look(
  input [3:0]a,b,
  input ci,
  output [3:0]sum,    
  output co                
);
  wire [3:0]p,g;
  wire [3:0]c;
  
  assign p=a ^ b ;
  assign g=a & b ;
  
  
  assign c[0]=g[0] | (p[0] & ci);
  assign c[1]=g[1] | (p[1] & g[0]) | (p[0] & p[1] & ci); 
  assign c[2]=g[2] | (p[2] & g[1])| (g[2] & p[1] & g[0]) | p[2] & p[1] & p[0] & ci; 
  assign c[3]=g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & ci) ;
  
  assign sum[0] = p[0] ^ ci;
  assign sum[1] = p[1] ^ c[0];
  assign sum[2] = p[2] ^ c[1];
  assign sum[3] = p[3] ^ c[2];
  
  assign co=c[3];
  
endmodule
