`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2026 18:59:15
// Design Name: 
// Module Name: COUNTER
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

//Implementing N_bit Synchronous down Counter + Asynchronous Active-Low Reset
module DOWN_COUNTER(clk,rst,count);
parameter N=10;
input clk,rst;
  output reg [N-1:0]count;
  always @(posedge clk or negedge rst)begin
    if(!rst)
      count<={N{1'b1}};
    else
      count<=count-1;
  end
endmodule


==================================================================================================================
                                      Test_bench
==================================================================================================================


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2026 18:59:37
// Design Name: 
// Module Name: tb4
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
  parameter N=4;
  reg clk,rst;
  wire [N-1:0]count;
  DOWN_COUNTER  #(.N(4))  dut(.clk(clk),.rst(rst),.count(count));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    $monitor("Time=%0t,rst=%b,count=%b",$time,rst,count);
    rst=0;
    #10;
    rst=1;
    repeat (10)begin
      #10;
    end
    rst=0;
    #10;
    rst=1;
    repeat (5)begin
      #10;
    end
    #20 $finish;
  end
endmodule
