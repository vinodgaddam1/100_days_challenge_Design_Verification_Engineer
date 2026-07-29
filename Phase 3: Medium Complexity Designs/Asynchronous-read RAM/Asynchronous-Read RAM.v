`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.07.2026 19:05:02
// Design Name: 
// Module Name: Asynchronous-Read RAM
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

//Asynchronous-Read RAM 

/*                +----------------------+
                  |   Async-Read RAM     |
                  |                      |
addr ------------>| Address              |
wdata_in -------->| Write Data           |
we -------------->| Write Enable         |
clk ------------->| Clock                |-----> rdata_out                               |                      |
                  |   mem[0]  [7:0]      |
                  |   mem[1]  [7:0]      |
                  |      ...             |
                  |   mem[15] [7:0]      |
                  +----------------------+

WRITE → waits for posedge clk
READ  → does NOT wait for clock  */
module Asy_RAM(clk,rst,w_r,wdata_in,rdata_out,addr);
  parameter DEPTH=16;
  parameter WIDTH=8;
  parameter ADDR=$clog2(DEPTH);
  input clk,rst;
  input w_r;
  input [ADDR-1:0]addr;
  input [WIDTH-1:0]wdata_in;
  output [WIDTH-1:0]rdata_out;
  integer i;
  reg [WIDTH-1:0]mem[0:DEPTH-1];
  always @(posedge clk)begin
    if (rst)
      for (i=0;i<DEPTH;i=i+1)begin
        mem[i]<={DEPTH{1'b0}};
      end
    else if 
      (w_r==1)begin
        mem[addr]<=wdata_in;
      end
  end
  //Asynchronous read
  assign rdata_out= mem[addr];
endmodule
