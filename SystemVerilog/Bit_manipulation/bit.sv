>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
         Bit Manipulation/Conversion in SystemVerilog 
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

1. $signed()
Forces an expression to be treated as signed.

For Example:
1.$signed();
module top;
logic [7:0]a;
initial begin
	a=8'b1111_1111;//255
  $display("%0d",$signed(a));//-1
end
endmodule


2. $unsigned()
Forces an expression to be treated as unsigned.

For Example:

2.un$signed();
module top;
logic [7:0]a;
initial begin
	a=-1;//-1
  $display("%0d",$unsigned(a));//255
end
endmodule


3. $bits()
Returns the number of bits required by an expression/type.

For Example:

3.$bits();
module top;
logic [7:0]a;
initial begin
  $display("%0d",$bits(a));
end
endmodule


4.$itor() means Integer To Real.
It converts an integer value into a real (floating-point) value.

Syntax
$itor(integer_expression)


For Example:

4.$itor;
module top;
int a;
real b;
initial begin
	a=10;
	b=$itor(a);
	$display("a=%0d",a);
	$display("b=%0f",b);
end
endmodule


5.$rtoi() — Real to Integer
$rtoi() is a SystemVerilog system function that converts a real value to an integer.
Syntax
$rtoi(real_expression)


For Example:

5.$rtoi;
module top;
int a;
real b;
initial begin
	b=10.5;
	a=$rtoi(b);
	$display("b=%0f",b);
	$display("a=%0d",a);
end
endmodule

6.$bitstoreal() is a different SystemVerilog system function. It converts a 64-bit bit pattern into a real value.
$bitstoreal()
Syntax:
$bitstoreal(expression)

For Example:

6.$bitstoreal;
module top;
bit [63:0]data;
real b;
initial begin
 data = 64'h3FF0000000000000;
        b=$bitstoreal(data);
	$display("data=%0h",data);
	$display("b=%0f",b);
end
endmodule


7. $realtobits()
$realtobits() converts a 64-bit real value into its 64-bit IEEE-754 bit representation.
Syntax
$realtobits(real_expression)

For Example:

7.$realtobits;
module top;
bit [63:0]b;
real data;
initial begin
        data = 1.000000;
        b=$realtobits(data);
	$display("data=%0f",data);
	$display("b=%0h",b);
end
endmodule




