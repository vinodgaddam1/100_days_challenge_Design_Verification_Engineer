>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                            SystemVerilog-OOP:
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
What is OOPs?
OOPs = Object-Oriented Programming System.
“OOP is a programming paradigm that organizes data and behavior into objects and classes, providing features such as encapsulation, inheritance, polymorphism, and abstraction.”

Simple idea
Think of a class as a blueprint and an object as the actual thing created from that blueprint.

1.Class:
What is a Class in SystemVerilog?
“A class is a user-defined data type that contains data members and methods together.”
class packet;
    int data;
    int addr;
    function void display();
        $display("data=%0d, addr=%0d", data, addr);
    endfunction
endclass
 packet → class name 
 data, addr → data members / properties 
 display() → method

2.Objects:
What is an Object in SystemVerilog?
“An object is an instance of a class. It is the actual entity created from the class blueprint and holds the actual values of the class properties.”
For Ex:
class packet;
    int data;
    int addr;
    function void display();
        $display("data=%0d addr=%0d", data, addr);
    endfunction
endclass

module top;
packet p;
 initial begin
p = new();
 p.data = 100;
 p.addr = 20;
 p.display();
 end
endmodule

p is an object handle. At this point, the actual object has not been created.
new() creates the actual object, and p now refers to it.

Two objects from the same class
packet p1;
packet p2;
initial begin
    p1 = new();
    p2 = new();
    p1.data = 10;
    p2.data = 50
end

Summary:
class <class_name>;
 // Properties
    int data;
    int addr;
 // Methods
    function void display();
        // ...
    Endfunction
 // Constraints
    constraint c1 {
        data inside {[0:100]};
    }
endclass

3.new() 
“new() is a constructor. It is used to create an object of a class and optionally initialize its properties.” It declare 6 ways.
Type 1 — Constructor with no arguments
Example:
class sample;
	logic [6:0]a;
	bit [6:0]b;
	function void display();

		$displayb("a=%b",a);
		$displayb("a=%b",b);
	endfunction
endclass

class field extends sample;
function new();
endfunction
endclass
module top;
field p;
initial begin
p=new();
p.display();
end
endmodule
Concept: new() has no arguments, so default values are used.

Type 2 — Constructor assigns fixed values
class sample;
	logic [6:0]a;
	bit [6:0]b;
	function void display();

		$displayb("a=%b",a);
		$displayb("a=%b",b);
	endfunction
endclass

class field extends sample;
function new();
	a=20;
	b=40;
endfunction
endclass

module top;
field p;
initial begin
p=new();
p.display();
end
endmodule
Concept: Constructor has no arguments, but assigns fixed values.


Type 3 — Constructor with arguments
class sample;
	logic [6:0]a;
	bit [6:0]b;
	function void display();
		$display("a=%d",a);
		$display("a=%d",b);
	endfunction
endclass

class field extends sample;
function new(bit [6:0]a,logic[6:0]b);
	this.a=a;
	this.b=b;
endfunction
endclass

module top;
field p;
//field p=new(10,20);
initial begin
p=new(10,20);
p.display();
end
endmodule
Concept: this refers to the current object.
Type 4 — First argument has a default value
class sample;
	logic [6:0]a;
	bit [6:0]b;
	function void display();
		$display("a=%d",a);
		$display("a=%d",b);
	endfunction
endclass

class field extends sample;
function new(bit [6:0]a=20,logic[6:0]b);
	this.a=a;
	this.b=b;
endfunction
endclass

module top;
field p;
//field p=new(10,20);
initial begin
p=new(,20);
p.display();
end
endmodule

Concept: Skip the first argument and use its default value.

Type 5 — Second argument has a default value
class sample;
	logic [6:0]a;
	bit [6:0]b;
	function void display();
		$display("a=%d",a);
		$display("a=%d",b);
	endfunction
endclass

class field extends sample;
function new(bit [6:0]a,logic[6:0]b=30);
	this.a=a;
	this.b=b;
endfunction
endclass

module top;
field p;
//field p=new(10,20);
initial begin
p=new(40);
p.display();
end
endmodule


Type 6 — Both arguments have default values
class sample;
	logic [6:0]a;
	bit [6:0]b;
	function void display();
		$display("a=%d",a);
		$display("a=%d",b);
	endfunction
endclass

class field extends sample;
function new(bit [6:0]a=20,logic[6:0]b=50);
	this.a=a;
	this.b=b;
endfunction
endclass

module top;
field p;
//field p=new(10,20);
initial begin
p=new();
p.display();
end
endmodule

Example for class/object/Handle/new() Code:
class packet;
	int addr;
	int data;
function new(int addr ,int data);
		this.addr=addr;
		this.data=data;
	endfunction
function void updata(int new_data);
        data=new_data;
	endfunction
function void display();
		$display("addr=%0d,data=%0d",addr,data);
	endfunction
endclass


module top;
packet p1;
packet p2;
packet p3;
packet p4;
initial begin
//p1=new();
//p1.display();
p1=new(10,100);
p2=new(20,200);
p3=new(30,400);
p4=p3;//handling
p1.display();
p2.display();
p3.display();
p4.display();
p1.updata(30);
p1.display();
end
endmodule



