>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  SystemVerilog built-in bit/state checking system functions
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

1. $isunknown()
Checks whether a vector contains X or Z.
Syntax
$isunknown(expression)

For Example:
//1.$isunknown
module top;
logic [3:0]data;
initial begin
	//data = 4'b10x1; //Remove commants and check it
          data = 4'b1100;
	if ($isunknown(data))
	$display("X or Z detected");
	else
	$display("No X/Z");
	
end
endmodule

2. $countbits()
Counts how many bits match the specified values.
Syntax
$countbits(expression, bit_value)


For Example:
//2.$countbits()
module top;
logic [7:0]data;
initial begin
          data = 8'b1100_xxzz;
	  $display("Nuber of 1's = %0d",$countbits(data,1'b1));
	  $display("Nuber of 0's = %0d",$countbits(data,1'b0));
	  $display("Nuber of x's = %0d",$countbits(data,1'bx));
	  $display("Nuber of z's = %0d",$countbits(data,1'bz));
end
endmodule

3. $countones()
This is specifically used to count the number of 1 bits.
Syntax
$countones(expression)

For Example:
//3.$countones()
module top;
logic [7:0]data;
initial begin
          data = 8'b1100_xxzz;
	  $display("Nuber of 1's = %0d",$countones(data));
end
endmodule

4. $onehot()
Checks whether exactly ONE bit is 1.
Syntax
$onehot(expression)

For Example:

//4.onehot();
module top;
logic [3:0]data1;
logic [3:0]data2;
logic [3:0]data3;
logic [3:0]data4;
initial begin
data1=4'b0001;
data2=4'bx010;
data3=4'b010z;
data4=4'b0101;
if ($onehot(data1))
	$display("Valid one-hot value in data1");
else
	$display("InValid one-hot value in data1");

if ($onehot(data2))
	$display("Valid one-hot value in data2");
else
	$display("InValid one-hot value in data2");

if ($onehot(data3))
	$display("Valid one-hot value in data3");
else
	$display("InValid one-hot value in data3");
	
if ($onehot(data4))
	$display("Valid one-hot value in data4");
else
	$display("InValid one-hot value in data4");
          
end
endmodule

5. $onehot0()
This is similar to $onehot(), but it allows zero or one 1.

Syntax
$onehot0(expression)

For Example:
//5.onehot0();
module top;
logic [3:0]data1;
logic [3:0]data2;
logic [3:0]data3;
logic [3:0]data4;
initial begin
data1=4'b0000; //0001--->also possible
data2=4'bx100;
data3=4'b001z;
data4=4'b1010;
if ($onehot0(data1))
	$display("Valid one-hot value in data1");
else
	$display("InValid one-hot value in data1");

if ($onehot0(data2))
	$display("Valid one-hot value in data2");
else
	$display("InValid one-hot value in data2");

if ($onehot0(data3))
	$display("Valid one-hot value in data3");
else
	$display("InValid one-hot value in data3");
	
if ($onehot0(data4))
	$display("Valid one-hot value in data4");
else
	$display("InValid one-hot value in data4");

end
endmodule



