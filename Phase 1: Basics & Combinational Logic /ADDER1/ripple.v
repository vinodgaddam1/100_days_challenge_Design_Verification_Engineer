`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.07.2026 18:37:58
// Design Name: 
// Module Name: ripple
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


//Implementing  ripple adder 10-bit

//Fulladder
module adder(
  input a,b,
  input ci,
  output SUM,
  output CARRY
);
  assign {CARRY,SUM}=a+b+ci;
endmodule
module ripple(input [9:0]a,b,input ci,output[9:0]SUM,output CARRY);
  wire [9:0]c;
  adder u1(a[0],b[0],ci,SUM[0],c[0]);
  adder u2(a[1],b[1],c[0],SUM[1],c[1]);
  adder u3(a[2],b[2],c[1],SUM[2],c[2]);
  adder u4(a[3],b[3],c[2],SUM[3],c[3]);
  adder u5(a[4],b[4],c[3],SUM[4],c[4]);
  adder u6(a[5],b[5],c[4],SUM[5],c[5]);
  adder u7(a[6],b[6],c[5],SUM[6],c[6]);
  adder u8(a[7],b[7],c[6],SUM[7],c[7]);
  adder u9(a[8],b[8],c[7],SUM[8],c[8]);
  adder u10(a[9],b[9],c[8],SUM[9],CARRY);
endmodule
