`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2026 20:25:34
// Design Name: 
// Module Name: design1
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


// design 5-bit comparator using 2-bit comparator
module two_bit(
  input [1:0]a,b,
  output G,E,L
);
  
  assign G=a[1]&~b[1]|~(a[1]^b[1])&a[0]&~b[0];
  assign L=~a[1]&b[1]|~(a[1]^b[1])&~a[0]&b[0];
  assign E= ~(a[1]^b[1])&~(a[0]^b[0]);
endmodule
module five_bit(
  input [4:0]a,b,
  output G,E,L
);
  wire g1,g2,g3,e1,e2,e3,l1,l2,l3 ;
  
  two_bit cmp1(.a(a[4:3]),.b(b[4:3]),.G(g1),.L(l1),.E(e1));
  
  two_bit cmp2(.a(a[2:1]),.b(b[2:1]),.G(g2),.L(l2),.E(e2));
  
  two_bit cmp3(.a({1'b0, a[0]}), .b({1'b0, b[0]}),.G(g3),.L(l3),.E(e3));
  
  assign G = g1 | (e1 & g2) | (e1 & e2 & g3);
  assign L = l1 | (e1 & l2) | (e1 & e2 & l3);
  assign E = e1 & e2 & e3;
endmodule

