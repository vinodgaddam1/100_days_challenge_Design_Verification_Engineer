`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.07.2026 18:47:56
// Design Name: 
// Module Name: registers
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

//SIPO - Serial In → Parallel Out
module Registers(
input clk,rst,
input din,
output reg [3:0] q
    );
    always @(posedge clk)begin
    if(rst)
    q<=4'b0000;
    else
    q<={q[2:0],din}; //0011-->one bit at a time
    end
endmodule


/*/PISO - Parallel In → Serial Out
module Registers(
input clk,rst,
input [3:0]din,
input load,
output dout
    );
    reg  [3:0]q;
    always @(posedge clk)begin
    if(rst)
    q<=4'b0000;
    else if (load)
    q<=din;
    else
    q<={q[2:0],1'b0}; //0011-->one bit at a time
    end
    assign dout=q[3];
endmodule

//PIPO Parallel load and Parallel Out
module Registers(
input clk,rst,
input [3:0]din,
output reg  [3:0]q
    );
    always @(posedge clk)begin
    if(rst)
    q<=4'b0000;
    else
    q<=din;
    end
endmodule
*/










