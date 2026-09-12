>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
             Inheritance and Polymorphism in SystemVerilog OOP
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

1. Inheritance
Inheritance means creating a new class from an existing class.
      The existing class is called the base/parent class.
       The new class is called the derived/child class.
  
For Example:
class parent;
	int data;
	int addr;
endclass


class child1 extends parent;
	function  new(int data1,int addr1);
		this.data=data1;
		this.addr=addr1;
	endfunction
endclass


class child2 extends child1;
	function new(int data,int addr);
		super.new(data,addr);
	endfunction
	function void display();
		$display("data=%0d | Addr=%0d",data,addr);
	endfunction
endclass


module top;
child2 c1;
initial begin
c1=new(10,200);
c1.display();
end
endmodule


2. Polymorphism
Polymorphism means "one interface, many forms."
In SystemVerilog, a base-class handle can point to an object of a derived class.
For Example:
//polymorphism
class parent;
	 function void display();
	$display("parent display");
endfunction
endclass


class child extends parent;
	virtual function void display();
		$display("Child display");
	endfunction
endclass


module top;
parent p;
child c;
initial begin
	c=new();
	p=c;
	p.display();
end
endmodule





