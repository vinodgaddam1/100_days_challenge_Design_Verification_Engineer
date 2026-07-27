`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.07.2026 19:01:07
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
reg [3:0]addr;
wire  [7:0]data_out;
ROM1 dut(.addr(addr),.data_out(data_out));
initial begin
$monitor("Time=%0t,addr=%0d,data_out=%0d",$time,addr,data_out);
repeat(15)begin 
addr=$random;
#10;
end
$finish;
end
endmodule
