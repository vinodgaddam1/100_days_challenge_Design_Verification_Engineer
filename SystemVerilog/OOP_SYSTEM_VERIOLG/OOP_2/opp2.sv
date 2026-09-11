>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  Encapsulation in SystemVerilog/OOP:
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Encapsulation
Encapsulation means bundling data and the methods that operate on that data inside a class, while controlling how that data can be accessed from outside.
For Example:
class packet;
	int addr;
	int data;
	function void display();
	$display("addr=%0d,data=%0d",addr,data);
	endfunction
endclass
module top;
packet p;
initial begin
	p=new();
	p.addr=10;
	p.data=200;
	p.display();
end
endmodule

1.Example: create a class student and to print student roll number ,Marks and display them.
class student;
	int roll_no;
	int marks;
	function void display();
	$display("roll_no=%0d,marks=%0d",roll_no,marks);
	endfunction
endclass
module top;
student s;
initial begin
	s=new();
	s.roll_no=2269;
	s.marks=23;
	s.display();
end
endmodule
2.Example: Create a Class name is “car” print speed, price and display.
class car;
	int speed;
	int price;	
	function void display();
		$display("speed=%0d,price=%0d",speed,price);
	endfunction
endclass
module top;
car c;
initial begin
c=new();
c.speed=120;
c.price=500000;
c.display();
end
endmodule

SystemVerilog access modifiers:
Protected:
Accessible inside class and derived classes
For Example:
//Protected
class parent;
protected int data;
function void set_data(int value);
data=value;
endfunction
endclass

class child extends parent;
function void display();
	$display("Data=%0d",data);
endfunction
endclass

module top;
child p;
initial begin
p=new();
//p.set_data(100);
p.display();
//OUTPUT:
//# Data=100
p.data=200;//ERROR data is protected
//OUTPUT
// oop.sv(256): Illegal access to protected member data.
p.display();
end
endmodule

Local:
Accessible only inside the same class
//Local

class student;
	local int marks;
	function void set_marks(int value);
		marks=value;
	endfunction
endclass
//This not passible here but in protect possible diff class like parent and
//child
//OUTPUT:
//# ** Error (suppressible): (vlog-8688) oop.sv(283): Illegal access to local member marks.
//class child extends student;
  //      function void display();
//		$display("Marks=%0d",marks);
//	endfunction

//endclass

module top;
child p;
initial begin
p=new();
//p.marks=200;
//p.display();//oop.sv(288): Illegal access to local member marks.
p.set_marks(30);
p.display();
//OUTPUT:
//# Marks=30
end
endmodule



Public:
Accessible from anywhere
class parent;
	int data;
	int addr;

	function void set_data(int value);
		data=value;
	endfunction
endclass
class child extends parent;
	function void set_addr(int value);
		addr=value;
	endfunction
	function void display();
		$display("Data=%0d,Addr=%0d",data,addr);
	endfunction
endclass

module top;
child p;
initial begin
	p=new();
	p.data=200;
	p.addr=10;
        p.display();
end
endmodule
