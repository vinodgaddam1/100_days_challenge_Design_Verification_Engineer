/*/non patrameter parent and non parameter child
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


//non patrameter parent and non parameter child
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

//non patrameter parent and  parameter child
class parent;
int a;
int b;
endclass

class child #(parameter int N=10,type T=int) extends parent;
function void display();
	$display("a=%0d",a);
	$display("b=%0d",b);
	$display("N=%0d",N);
	
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


// patrameter parent and non parameter child
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



// patrameter parent and  parameter child
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


































































