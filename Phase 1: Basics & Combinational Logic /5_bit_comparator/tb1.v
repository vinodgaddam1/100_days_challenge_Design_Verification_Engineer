`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2026 20:26:19
// Design Name: 
// Module Name: tb1
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


module tb;
  reg [4:0]a,b;
  wire G,E,L;
  five_bit dut(.a(a),.b(b),.G(G),.E(E),.L(L));
  integer i,j;
  initial begin
    $monitor("Time=%0t,a=%b,b=%b,G=%b,E=%b,L=%b",$time,a,b,G,E,L);
    for(i=0;i<32;i=i+1)begin
      for(j=0;j<32;j=j+1) begin
        a=i;
        b=j;
        #10;
      end
    end
  end
endmodule
