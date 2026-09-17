>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
               SystemVerilog Parameter
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
“A parameter is a constant value that you define once and can use throughout a module. It makes your RTL reusable and configurable.”
Verilog:
1.Basic Syntax:  //This is we learn In Verilog 
module adder #(
    parameter WIDTH = 8
)(
    input  logic [WIDTH-1:0] a,
    input  logic [WIDTH-1:0] b,
    output logic [WIDTH-1:0] sum
);

    assign sum = a + b;

endmodule

2. Override the parameter:
adder #(
    .WIDTH(16)
) u2 (
    .a(a),
    .b(b),
    .sum(sum)
);

SystemVerilog:
1. Value Parameter
parameter parameter_name = value;
parameter WIDTH = 8;
2. Typed Parameter
parameter type parameter_name = default_type;
parameter type DATA_T = logic [7:0];
3. Local Parameter
localparam parameter_name = value;
localparam int MAX_VALUE = 255;

parameter             → parameter NAME = VALUE;
typed parameter       → parameter TYPE NAME = VALUE;
type parameter        → parameter type NAME = TYPE;
local parameter       → localparam TYPE NAME = VALUE;

How declare in “class” with parameter and how to override?
Four way’s to declare
1.non patrameter parent and non parameter child
class parent;
int a;
int b;
endclass

class child extends parent;
function void display();
	$display("a=%0d",a);
	$display("b=%0d",b);
	
endfunction
endclass

module top;
child ch;
initial begin
	ch=new();
	ch.a=100;
	ch.b=20;
	ch.display();
end
endmodule

2.non patrameter parent and non parameter child
class parent;
int a;
int b;
endclass

class child extends parent;
function void display();
	$display("a=%0d",a);
	$display("b=%0d",b);
	
endfunction
endclass

module top;
child ch;
initial begin
	ch=new();
	ch.a=100;
	ch.b=20;
	ch.display();
end
endmodule

3.patrameter parent and non parameter child
class parent #(parameter N=10,type T=int);
T a;
T b;

endclass



//class child extends parent;//obj
class child extends parent #(8,byte);//overraiding
function void display();
	$display("a=%b",a);
	$display("b=%b",b);	
endfunction
endclass

module top;
child ch;
initial begin
	ch=new();
	ch.a=8;
	ch.b=9;
	ch.display();
end
endmodule


4. parameter parent and parameter child
class parent #(parameter N=10,type T=int);
T a;
T b;

endclass



class child #(parameter N=2,type T=int) extends parent #(8,byte);//overraiding
function void display();
	$display("a=%b",a);
	$display("b=%b",b);	
	$display("N=%b",N);	

endfunction
endclass

module top;
child ch;
initial begin
	ch=new();
	ch.a=8;
	ch.b=9;
	ch.display();
end
endmodule
