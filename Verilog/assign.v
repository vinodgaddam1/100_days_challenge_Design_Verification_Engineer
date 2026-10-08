/*       Scalar and vector declaration
*********************************************
EX:1 Declare a net type scalar of name "valid"
*********************************************
module tb;
wire valid=1;
initial begin
	
	$display ("valid=%d",valid);
end
endmodule
OUTPUT:
# valiad=x
*********************************************
Declare a reg type scalar of addr
*********************************************

module tb;
reg addr;
initial begin
	addr=1'b1;
	$display ("addr=%d",addr);
end
endmodule
OUTPUT:
# addr=1 
*********************************************
Declare a 33-bit reg vector named wdata whose LSB is 3 
*********************************************
module tb;
reg [30:3] wdata;
initial begin
	wdata=33'd23456;
	$display("wdata=%b",wdata);
end
endmodule
OUTPUT:
# wdata=0000000000000101101110100000
*********************************************
Declare a 64-bit net vector named rdata whose MSB 69
*********************************************
module tb;
wire [69:11]rdata=64'd20345245;//---->LSB=MSB-SIZE+1=69-64+1=11
initial  begin
	$display("rdata=%b",rdata);

end
endmodule
OUTPUT:
# rdata=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
*********************************************
Declare an 8-bibt vector of name 'write_data' which is output of AND gate
*********************************************
module tb;
reg [7:0]a;
reg [7:0]b;
reg[7:0]write_data;
initial begin
	write_data =a & b;
	$display("write_data=%b",write_data);
end

endmodule
OUTPUT:
# write_data=xxxxxxxx
*********************************************
EX:2 Processor and memory vector port list declaration 
*********************************************
module processor;
//processor 32-bit 
input clock;
input reset;
input [31:0]rdata;
input ready;
output [31:0]addr;
output [31:0]wdata;
output wr_rd; // 1= write 0=read
output sel;
endmodule

module memory;
//memory 32-bit 
input clock;
input reset;
output [31:0]rdata;
output ready;
input [31:0]addr;
input [31:0]wdata;
input wr_rd; // 1= write 0=read
output sel;
endmodule
*********************************************
EX:3 Vector to Vector assignment
*********************************************
module tb;
reg [3:-1]a; //5-bit
reg [7:2]b; //6-bit
initial begin
	b=6'b101111;
        a=b;
	$display("a=%b",a);

	$display("b=%b",b);

end
endmodule
OUTPUT:
# a=_01111
# b=101111
*********************************************
 LHS bigger than RHS
*********************************************
module tb;
reg [3:-5]a; //8-bit
reg [7:2]b; //6-bit
initial begin
	b=6'b101111;
        a=b;
	$display("a=%b",a);

	$display("b=%b",b);
end
endmodule
OUTPUT:
# a=000101111
# b=101111
*********************************************
LHS smaller than RHS
*********************************************module tb;
reg [3:-2]a; //6-bit
reg [7:0]b; //8-bit
initial begin
	b=8'b10111101;
        a=b;
	$display("a=%b",a);

	$display("b=%b",b);
end
endmodule
OUTPUT:
# a=111101
# b=10111101
*********************************************
EX:4 Radix Conversion
*********************************************
module tb;
reg [15:0]a=16'd723;
initial begin
	$display("binary=%b,Hexa=%h,Decimal=%d,Octal=%o",a,a,a,a);
end
endmodule
OUTPUT:
# binary=0000001011010011,
#Hexa=02d3,
#Decimal=  723,
#Octal=001323
*********************************************
Convert 16'h7654 to all other radix formate
*********************************************
module tb;
reg [15:0]a;
initial begin
a=16'h7654;
	$display("binary=%b\n,Hexa=%h\n,Decimal=%d\n,Octal=%o\n",a,a,a,a);
end
endmodule
OUTPUT:
# binary=0111011001010100
# Hexa=7654
# Decimal=30292
# Octal=073124
*********************************************
Convert 16'o45632 to hexa decimal format
*********************************************
module tb;
reg [15:0]a;
initial begin
a=16'o45632;
	$display("binary=%b\n,Hexa=%h\n,Decimal=%d\n,Octal=%o\n",a,a,a,a);
end
endmodule
OUTPUT:
# binary=0100101110011010
# Hexa=4b9a
# Decimal=19354
# Octal=045632
********************************************
Represent decimal -743 (minus 743) as 16-bit 
variable in all radix
*********************************************
module tb;
reg [15:0]a;
initial begin
	a=-743;
	$display("binary=%b\n,Hexa=%h\n,Decimal=%d\n,Octal=%o\n",a,a,a,a);

end
endmodule
OUTPUT://2's complement form
# binary=1111110100011001
# Hexa=fd19
# Decimal=64793
# Octal=176431
***************************************************************
Represent 16'hCxDz in all radix formats-->hint:(bring binary then all process)
**************************************************************
module tb;
reg[15:0]a;
initial begin
	a=16'hCxDz; //-->binary:1100_xxxx_1101_zzzz

end
endmodule
OUTPUT:
# binary=1100xxxx1101zzzz
# ,Hexa=cxdz
# ,Decimal=    X
# ,Octal=14xXZz
***************************************************************
        convert 16'o14xXZz to binary formate
***************************************************************
module tb;
reg [15:0]a;
initial begin
	a=16'o14xXZz;//binary-->001_100_xxx_XXX_ZZZ_zzz
	$display("binary=%b\n,Hexa=%h\n,Decimal=%d\n,Octal=%o\n",a,a,a,a);
end
endmodule
OUTPUT:
# binary=1100xxxxxxzzzzzz
# ,Hexa=cxXz
# ,Decimal=    X
# ,Octal=14xxzz
****************************************************************************
Ex:5 Implementing 8x1 mux using vector inputs
****************************************************************************
module mux8x1(
input [7:0]i,
input [2:0]sel,
output y
);
assign y=i[sel];
endmodule
module tb;
reg [7:0]i;
reg [2:0]sel;
wire y;
mux8x1 dut (i,sel,y);

initial begin
	$monitor("Time=%0t,i=%b,sel=%b,y=%b",$time,i,sel,y);
	repeat (10)begin
		{sel,i}=$random;
		#1;
	end
end

endmodule
OUTPUT:
# Time=0,i=00100100,sel=101,y=1
# Time=1,i=10000001,sel=110,y=0
# Time=2,i=00001001,sel=110,y=0
# Time=3,i=01100011,sel=110,y=1
# Time=4,i=00001101,sel=011,y=1
# Time=5,i=10001101,sel=001,y=0
# Time=6,i=01100101,sel=100,y=0
# Time=7,i=00010010,sel=010,y=0
# Time=8,i=00000001,sel=011,y=0
# Time=9,i=00001101,sel=101,y=0
***************************************************************************
EX:6 difficult question above with vector multi bit input
a.8x1 mux which take each input as 2 bit vector
*****************************************************************************

module mux8x1(
input [1:0]i0,i1,i2,i3,i4,i5,i6,i7,
input [2:0]sel,
output reg y
);
always @(*)begin
	case(sel)
		3'b000:y=i0;
		3'b001:y=i1;
		3'b010:y=i2;
		3'b011:y=i3;
		3'b100:y=i4;
		3'b101:y=i5;
		3'b110:y=i6;
		3'b111:y=i7;
		default:y=2'bxx;
	endcase
end
endmodule
module tb;
reg [1:0]i0,i1,i2,i3,i4,i5,i6,i7;
reg [2:0]sel;
wire y;
mux8x1 dut (i0,i1,i2,i3,i4,i5,i6,i7
,sel,y);

initial begin
	$monitor("Time=%0t,i0=%b,i1=%b,i2=%b,i3=%b,i4=%b,i5=%b,i6=%b,i7=%b;
,sel=%b,y=%d",$time,i0,i1,i2,i3,i4,i5,i6,i7,sel,y);
	repeat (10)begin
		{sel,i0,i1,i2,i3,i4,i5,i6,i7
}=$random;
		#1;
	end
end
endmodule
OUTPUT:
# Time=0,i0=00,i1=11,i2=01,i3=01,i4=00,i5=10,i6=01,i7=00;
# 
# ,sel=101,y=0
# Time=1,i0=01,i1=01,i2=11,i3=10,i4=10,i5=00,i6=00,i7=01;
# 
# ,sel=001,y=1
# Time=2,i0=11,i1=01,i2=01,i3=10,i4=00,i5=00,i6=10,i7=01;
# 
# ,sel=100,y=0
# Time=3,i0=01,i1=01,i2=01,i3=10,i4=01,i5=10,i6=00,i7=11;
# 
# ,sel=000,y=1
# Time=4,i0=01,i1=11,i2=10,i3=11,i4=00,i5=00,i6=11,i7=01;
# 
# ,sel=001,y=1
# Time=5,i0=10,i1=01,i2=10,i3=01,i4=10,i5=00,i6=11,i7=01;
# 
# ,sel=111,y=1
# Time=6,i0=10,i1=00,i2=01,i3=00,i4=01,i5=10,i6=01,i7=01;
# 
# ,sel=010,y=1
# Time=7,i0=01,i1=01,i2=00,i3=10,i4=00,i5=01,i6=00,i7=10;
# 
# ,sel=111,y=0
# Time=8,i0=11,i1=10,i2=00,i3=11,i4=00,i5=00,i6=00,i7=01;
# 
# ,sel=011,y=1
# Time=9,i0=11,i1=00,i2=11,i3=01,i4=00,i5=00,i6=11,i7=01;
# 
# ,sel=111,y=1
***************************************************************************************
b.c.complete I input is 16 bit vector
 i.i[1:0] goes to sel=3'b000.....
***************************************************************************************
module mux16x1(
input [15:0]i,
input [2:0]sel,
output reg [1:0]y
);
always @(*)begin
case(sel)
	3'b000:y=i[1:0];
	3'b000:y=i[3:2];
	3'b000:y=i[5:4];
	3'b000:y=i[7:6];
	3'b000:y=i[9:8];
	3'b000:y=i[11:10];
	3'b000:y=i[13:12];
	3'b000:y=i[15:14];
	default:y=2'bxx;
endcase
end
endmodule
module tb;
reg [15:0]i;
reg [2:0]sel;
wire [1:0]y;
mux16x1 dut (i,sel,y);

initial begin
	$monitor("Time=%0t,i=%b,sel=%b,y=%b",$time,i,sel,y);
	repeat (30)begin
		{sel,i}=$random;
		#1;
	end
end
endmodule
OUTPUT:
# Time=0,i=0011010100100100,sel=101,y=xx
# Time=1,i=0101111010000001,sel=001,y=xx
# Time=2,i=1101011000001001,sel=100,y=xx
# Time=3,i=0101011001100011,sel=000,y=11
# Time=4,i=0111101100001101,sel=001,y=xx
# Time=5,i=1001100110001101,sel=111,y=xx
# Time=6,i=1000010001100101,sel=010,y=xx
# Time=7,i=0101001000010010,sel=111,y=xx
# Time=8,i=1110001100000001,sel=011,y=xx
# Time=9,i=1100110100001101,sel=111,y=xx
# Time=10,i=1111000101110110,sel=011,y=xx
# Time=11,i=1100110100111101,sel=101,y=xx
# Time=12,i=0101011111101101,sel=100,y=xx
# Time=13,i=1111011110001100,sel=101,y=xx
# Time=14,i=1110100111111001,sel=101,y=xx
# Time=15,i=0010010011000110,sel=111,y=xx
# Time=16,i=1000010011000101,sel=111,y=xx
# Time=17,i=1101001010101010,sel=011,y=xx
# Time=18,i=1111011111100101,sel=111,y=xx
# Time=19,i=0111001001110111,sel=010,y=xx
# Time=20,i=1101011000010010,sel=010,y=xx
# Time=21,i=1101101110001111,sel=100,y=xx
# Time=22,i=0110100111110010,sel=000,y=10
# Time=23,i=1001011011001110,sel=110,y=xx
# Time=24,i=0111101011101000,sel=000,y=00
# Time=25,i=0100111011000101,sel=010,y=xx
# Time=26,i=0100100101011100,sel=000,y=00
# Time=27,i=0010100010111101,sel=110,y=xx
# Time=28,i=0101100000101101,sel=011,y=xx
# Time=29,i=0010011001100101,sel=111,y=xx
***************************************************************************************************EX:7 declare an integer 
a.what is the default value of integer---> b.32-bit default
***************************************************************************************************
module tb;
integer a;
initial begin
	a=4'b11;
	$display("a=%b",a);
end
endmodule
OUTPUT:
# a=00000000000000000000000000000011
***************************************************************************************************
EX:8 declare a real varialbe 
a.what is the default value of real--->32-bit only but when we give %f it takes 0.000_000
**********************************************************************************************
module tb;
real a;
initial begin
	a=4.6;
	$display("a=%f",a);
end
endmodule
OUTPUT:
# a=4.600000
***************************************************************************************************
EX:9 generate a 96 bit random number
a.$random only generate 32 bit number --->B.{$random,$random,$random}
***************************************************************************************************
module tb;
reg [95:0]a;
initial begin
	a={$random,$random,$random};
	$display("a=%b",a);
end
endmodule
OUTPUT:
# a=000100100001010100110101001001001100000010001001010111101000000110000100100001001101011000001001
i***************************************************************************************************
Ex:10 declare a time and realtime variable
a.explaine diff using an example
***********************************************************************
//`timescale 1ns/1ps
`timescale 1ns/10ns
module tb;
time a;
realtime b;
initial begin
	#10.54;
	a=$time;
	b=$realtime;
	$display("time=%0t",a);
	$display("realtime=%0f",b);
end
endmodule
//OUTPUT:
//# time=11000
//# realtime=10.540000
//# time=1100
//# realtime=10.540000*/


















