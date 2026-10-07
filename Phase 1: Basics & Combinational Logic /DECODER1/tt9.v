`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2026 19:22:05
// Design Name: 
// Module Name: tt9
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


// test beanch
 module tb;
reg a,b;
wire [3:0]y;
decoder dut(.a(a),.b(b),.y(y));
initial begin
	$monitor("Time=%0t,a=%b,b=%b,y=%b",$time,a,b,y);
	//repeat (30) begin
	//{a,b}=$random;
	//b=$random;
	a=0;b=0;#10;
	a=0;b=1;#10;
	a=1;b=0;#10;
	a=1;b=1;#10;
	
//end
end
endmodule
