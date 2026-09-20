/********************************************************************************
*                          SystemVerilog Nested Class
* *******************************************************************************
//1.Example
class Outer;
	class Inner;
		int data;
		function void display();
			$display("Inner data = %0d",data);
		endfunction
	endclass
endclass


module top;
Outer::Inner obj;
initial begin
	obj=new();
	obj.data=100;
	obj.display();
end
endmodule
OUTPUT:
# Inner data = 100



//2.Example
class packet;
	class header;
		int id;
		int length;

		function new(int id,int length);
			this.id=id;
			this.length=length;
		endfunction


		function void display();
			$display("ID = %0d  Length = %0d",id,length);
		endfunction
	endclass
endclass


module top;
packet::header h;
initial begin
	h=new(10,20);
	h.display();
end
endmodule
OUTPUT:
# ID = 10  Length = 20



//3.Example

class Company;


      class Employee;

	string name;
	int id;

	function new(string name,int id);
		this.name=name;
		this.id=id;
	endfunction

        function void print();
		$display("Name = %s , ID = %0d",name,id);
	endfunction
		
endclass
endclass

module top;
Company::Employee e1;
Company::Employee e2;
initial begin
	e1=new("Vinod",21);
	e2=new("Teja",22);
	e1.print();
	e2.print();
end
endmodule

OUTPUT:
# Name = Vinod , ID = 21
# Name = Teja , ID = 22


//4.Example

class classA;

	class classB;
		class classC;
                static int count;  //obj with static and without static
		function new();
			count++;
		endfunction

		function void display();
			$display("count=%0d",count);
		endfunction
		endclass
	endclass
endclass


module top;
classA::classB::classC h1;
classA::classB::classC h2;
classA::classB::classC h3;
initial begin
h1=new();
h2=new();
h3=new();
h3.display();
end
endmodule
OUTPUT:
count=3;//with
count=1;//without



//5.Example;
class packet;
	class header;
		bit [7:0]src;
		bit [7:0]dest;
		function new(bit [7:0]src,bit[7:0]dest);
			this.src=src;
			this.dest=dest;
		endfunction
	function void display();
		$display("SRC=%0h DEST=%0x",src,dest);
	endfunction
	endclass
	header h;
	function new();
		h=new(8'hac,8'ha4);
	endfunction
endclass

module top;
packet p;
initial begin
	p=new();
	p.h.display();
end
endmodule
OUTPUT:
# SRC=ac DEST=a4


*/
//6.Example
class A;
	class B;
virtual function void print();
	$display("Base Header");
endfunction
	endclass
endclass

class C extends A::B;
function void print();
	$display("Extended Header");
endfunction
endclass

module top;
A::B h;
initial begin
	h=new();
	h.print();
end
endmodule
OUTPUT:
# Base Header




















