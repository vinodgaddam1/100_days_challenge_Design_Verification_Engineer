`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2026 19:57:18
// Design Name: 
// Module Name: RAM1
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

//Using Handshaking 




/*                 +------------------------+
                   |    Synchronous RAM     |
                   |                        |
valid ------------>| Request                |
                   |                        |----> ready
w_r -------------->| Read / Write           |
addr --------------| Address                |
wdata_in ----------| Write Data             |
                   |                        |----> rdata_out
clk -------------->| Clock                  |
rst -------------->| Reset                  |
                   +------------------------+
*/

module syn_RAM (clk,rst,w_r,wdata_in,rdata_out,addr,valid,ready);
  //sparameter SIZE=DEPTH*WIDTH;//16 memory locations  2**13
  parameter WIDTH=8;
  parameter DEPTH=16;
  parameter ADDR=$clog2(DEPTH);
  input clk;
  input rst;
  input w_r;
  input [WIDTH-1:0]wdata_in; 
  input [ADDR-1:0]addr;
  output reg ready;
  output reg [WIDTH-1:0] rdata_out;
  input valid;
  reg [WIDTH-1:0]mem[DEPTH-1:0];
  integer i;
  always @(posedge clk)begin
    if(rst)
      for(i=0;i<DEPTH;i=i+1)begin
        mem[i]=0;
      end
    else //rst relese
      if (valid==1)begin
           ready=1;
        if(w_r==1)
            mem[addr]=wdata_in;
        else 
          rdata_out=mem[addr];
      end
       else//valid=0;
         ready=0;
  end
endmodule


