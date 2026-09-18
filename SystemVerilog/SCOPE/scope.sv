>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            SystemVerilog hierarchical scope
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

1. $root
$root refers to the top-level scope of the entire SystemVerilog simulation.
For Example:
//$root access one module to other module

module S1;
	int a ;
	int b ;
endmodule	


module S2;
	S1 s1_inst();
endmodule

module S3;
S2 s2_inst();
endmodule


module S4;
initial begin
	$root.S3.s2_inst.s1_inst.a=100;
	$root.S3.s2_inst.s1_inst.b=200;
	$display("a=%0d",$root.S3.s2_inst.s1_inst.a);
	$display("b=%0d",$root.S3.s2_inst.s1_inst.b);
end
endmodule

2. Scope Resolution(::)
:: is used to access a member from a specific scope.
For Example:
int count = 25;
module top;
int count =10;
initial begin
	print();
end
function void print();
	int count;
	count=35;
	$display("global count = %0d",$unit::count);
	$display("module count = %0d",$root.top.count);
	$display("function count = %0d",$root.top.print.count);
	//$display("function count = %0d",count);
endfunction
endmodule

3. unit
A compilation unit is the scope created for a SystemVerilog source file when compilation-unit declarations are used.

For Example:
//$unit it is used access the gloable things
int a=100;
string name="VINOD";
class sample;
int b=20;
function void display();
$display("a=%0d,b=%0d,name=%s",$unit::a,b,$unit::name);
endfunction
endclass

module top;
sample s;
initial begin
	s=new();
	s.display();
end
endmodule

