`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.07.2026 18:43:51
// Design Name: 
// Module Name: tb
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
parameter N=8;
integer i;
parameter ADD=4'b0000;
parameter SUB=4'b0001;
parameter MUL=4'b0010;
parameter DIV=4'b0011;
parameter MOD=4'b0100;
parameter XOR=4'b0101;
parameter NOT=4'b0110;
parameter AND=4'b0111;
parameter OR=4'b1000;
parameter LOG_LEFT_SHIFT=4'b1001;
parameter LOG_RIGHT_SHIFT=4'b1010;
parameter INC=4'b1011;
parameter DEC=4'b1100;
parameter EQUAL=4'b1101;
parameter LESS_EQ=4'b1110;
reg [N-1:0]a;
reg [N-1:0]b;
reg [3:0]opcode;
wire [2*N-1:0]product;
wire [N-1:0]result;
wire carry;
wire zero;
wire neg;
wire overflow;
 ALU dut(.a(a),.b(b),.opcode(opcode),.result(result),.carry(carry),.zero(zero),.neg(neg),.overflow(overflow),.product(product));
 initial begin
 $monitor("Time=%0t,a=%d,b=%d,opcode=%b,product=%0d,result=%d,carry=%b,zero=%b,neg=%b,overflow=%b",$time,a,b,opcode,product,result,carry,zero,neg,overflow);
 for (i=0;i<15;i=i+1)begin
 a=$random;
 b=$random ;
 opcode=i;
 #10;
 end
 $finish;
 end
endmodule
