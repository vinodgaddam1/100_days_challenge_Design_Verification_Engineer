`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2026 19:40:16
// Design Name: 
// Module Name: dd7
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


//16:1 MUX using 2:1 MUX
module mux2to1 (input a, input b,input s,output y);
  assign y=s ? b:a; 
endmodule

module mux16to1(
  input [15:0]a,
  input [3:0]s,
output y
);
  wire[7:0]y1;
  wire[3:0]y2;
  wire[1:0]y3;

genvar i;

generate 
  for(i=0;i<8;i=i+1) begin :level1
    mux2to1 m1(a[2*i],a[2*i+1],s[0],y1[i]);
  end
endgenerate

generate 
  for(i=0;i<4;i=i+1) begin :level2
    mux2to1 m2(y1[2*i],y1[2*i+1],s[1],y2[i]);
  end
endgenerate

generate 
  for(i=0;i<2;i=i+1) begin :level3
    mux2to1 m3(y2[2*i],y2[2*i+1],s[2],y3[i]);
  end
endgenerate

  mux2to1 m_final(y3[0],y3[1],s[3],y);
endmodule
