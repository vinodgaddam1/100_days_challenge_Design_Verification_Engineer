`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.07.2026 18:43:30
// Design Name: 
// Module Name: ALU
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
/**************************************************************************************************
Arithmetic:  ADD SUB MUL DIV MOD INC DEC
Logical:     AND OR XOR NOT
Shift:       LEFT RIGHT
Comparison:  EQUAL LESS_EQUAL
Flags:       carry zero negative overflow
Parameterized N-bit design
**************************************************************************************************/

module ALU(a,b,opcode,result,carry,zero,neg,overflow,product);
parameter N=8;
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
input [N-1:0]a;
input [N-1:0]b;
input [3:0]opcode;
output reg [2*N-1:0]product;
output reg [N-1:0]result;
output reg carry;
output zero;
output neg;
output reg overflow;
reg[N:0]temp;
assign zero = (opcode == MUL) ? (product == 0) :(result == 0);

assign neg  = (opcode == MUL) ? product[2*N-1] : result[N-1];
always @(*)begin
result=0;
product=0;
carry=0;
overflow=0;
temp=0;
case(opcode)
ADD:begin
temp={1'b0,a}+{1'b0,b};
result=temp[N-1:0];
carry=temp[N];
overflow=(~(a[N-1]^b[N-1])&(result[N-1]^a[N-1]));
end
SUB:begin
result=a-b;
overflow=(a[N-1]^b[N-1])&(result[N-1]^a[N-1]);
end
MUL:
product=a*b;
DIV: begin
if (b!=0)
result=a/b;
else
result=0;
end
MOD: begin
if(b!=0)
result=a%b;
else
result=0;
end
XOR:
result=a^b;
NOT:
result=~a;
AND:
result=a&b;
OR:
result=a|b;
LOG_LEFT_SHIFT:
result=a<<1;
LOG_RIGHT_SHIFT:
result=a>>1;
INC:
result=a+1'b1;
DEC:
result=a-1'b1;
EQUAL:
result=(a==b);
LESS_EQ:
result=(a<=b);
default: begin
result=0;
product=0;
end
endcase
end
endmodule
