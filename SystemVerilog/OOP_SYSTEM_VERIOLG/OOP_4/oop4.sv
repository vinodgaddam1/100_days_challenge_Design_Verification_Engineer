>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 Abstraction/ Static/ Interface in SystemVerilog / OOP
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
1. Abstraction:
means hiding the internal implementation and exposing only the essential functionality.

For Example:
virtual class Shape;

    // Abstract method
    pure virtual function void area();

endclass

class Rectangle extends Shape;

    int length = 10;
    int width  = 5;

    function void area();
        $display("Area = %0d", length * width);
    endfunction

endclass


module tb;

    Rectangle r;

    initial begin
        r = new();
        r.area();
    end

endmodule



2.Static in SystemVerilog:
static means the variable or method belongs to the class itself or maintains a single shared value, rather than having a separate copy for every object.

For Example:
class sample;
static int a;
	int b;

	static function void display_a();
	$display("a=%0d",a);
	endfunction
	
	function void display_b();
	$display("b=%0d",b);
	endfunction
	
	//function void display_c();  this is illegal
	//$display("b=%0d",b);
	//$display("a=%0d",a);
	//endfunction

endclass


module top;
sample s;
initial begin
	sample::a=100;
	sample::display_a;

	s=new();
	s.b=10;
	s.display_b();
end
endmodule 


3.Interface in SystemVerilog:

For Example:
interface class sample;
	pure virtual function void display();
	pure virtual function void display1();
endclass

 class sample1  implements sample;
virtual function void display();
		$display("Printing display");
	endfunction
virtual 	function void display1();
		$display("Printing display1");
	endfunction
endclass

module top;
sample1  s1;
initial begin
	s1=new();
	s1.display();
	s1.display1();
end
endmodule










































































