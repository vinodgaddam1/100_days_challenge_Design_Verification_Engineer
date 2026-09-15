>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            SystemVerilog OOP   object copying 4-ways 
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

1.Copy by Handle in SystemVerilog
Copy by handle means two handles refer to the same object. Changing the object through one handle affects what the other handle sees.
For Example:
class sample;
	int a;
	int b;
	function void display(string str);
		$display("------->print the %0s data<-------",str);
		$display("a=%0d | b=%0d",a,b);
	endfunction
endclass

module top;
sample s1;
sample s2;
initial begin
	s1=new();
	s1.a=100;
	s1.b=200;
	s1.display("S1");

	s2=s1; //copy by handle
	s2.display("S2");
        

	s2.a=120;
	s2.b=130;
	s1.display("S1-->S2");//Here i am changing s2 values but see obj
        
	s1.a=20;
	s1.b=30;
        s2.display("S2--->S1"); //Here i am changin s1 values and printing s2  obj


end
endmodule

2.Shallow Copy in SystemVerilog
A new object is created, but if the object contains handles to other objects, those handles are copied—not the nested objects.

For Example:
class parent;
	int count;//non properties
endclass
class sample;
	int a;
	int b;
	parent p;
        function new();
		p=new();
	endfunction

	function void set(input int y);
		p.count=y;  //objects properties
	endfunction

	function void display(string str);
		$display("------->print the %0s data<-------",str);
		$display("a=%0d | b=%0d",a,b);
		$display("count=%0d",p.count);
	endfunction
endclass

module top;
sample s1;
sample s2;
initial begin
	s1=new();
	s1.a=100;
	s1.b=200;
	s1.set(20);
	s1.display("S1");

	s2=new s1; //shallow copy 
	s2.display("S2");
        

	s2.a=120;
	s2.b=130;
	s1.set(58);
	s1.display("S1-->S2"); //obj now we get expected output
        
	s1.a=20;
	s1.b=30;
	s1.set(47);
        s2.display("S2--->S1"); 


end
endmodule


3.Deep Copy in SystemVerilog:
A new object is created, and all nested objects are also separately created and copied.

For Example:
class parent;
	int count;//non properties
endclass
class sample;
	int a;
	int b;
	parent p;
        function new();
		p=new();
	endfunction

	function void set(input int y);
		p.count=y;  //objects properties
	endfunction

	function void display(string str);
		$display("------->print the %0s data<-------",str);
		$display("a=%0d | b=%0d",a,b);
		$display("count=%0d",p.count);
	endfunction

	function void copy(input sample op1,output sample op2);
		op2=new();
		op2.a=op1.a;
		op2.b=op1.b;
		op2.p.count=op1.p.count;
	endfunction

endclass

module top;
sample s1;
sample s2;
initial begin
	s1=new();
	s1.a=100;
	s1.b=200;
	s1.set(20);
	s1.display("S1");
	s1.copy(s1,s2);

	s1.copy(s1,s2); //deep copy 
	s2.display("S2");
        

	s2.a=120;
	s2.b=130;
	s1.set(58);
	s1.display("S1-->S2"); //obj now we get expected output
        
	s1.a=20;
	s1.b=30;
	s1.set(47);
        s2.display("S2--->S1"); 


end
endmodule


4.Casting in SystemVerilog
Casting means converting a value or object from one data type to another data type.
1.static and dynamic casting
For Example: static_casting
module top;
int a;
string b;
initial begin
	repeat (10)begin
	a=$urandom_range(10,20);
	b=string '(a);
	$display("strings %0s",b);
end
end
endmodule

Dynamic casting: Using $cast();
class parent;
endclass 

class child1 extends parent; 
endclass

class child2 extends parent;
endclass



module top;
parent p1,p2;
child1 c1;
child2 c2;
initial begin
	p1=new();
    p2=new();
	c1=new();
	c2=new();
	if($cast(p1,p2)) $display("casting is possible");
	else  $display("casting is not possible");
	$display("-------------------------------------------");
	if($cast(c1,p2)) $display("casting is possible");
	else  $display("casting is not possible");
	$display("-------------------------------------------");
	if($cast(p1,c1)) $display("casting is possible");
	else  $display("casting is not possible");
	$display("-------------------------------------------");
	if($cast(c2,c1)) $display("casting is possible");
	else  $display("casting is not possible");
	$display("-------------------------------------------");
end
endmodule















































































