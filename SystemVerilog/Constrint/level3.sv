======================================================================== 	                                      
         SystemVerilog Constraints based problems Level-3
========================================================================
//21:Generate two numbers where a < b.
class sample;
rand int a;
rand int b;
function void print();
	$display(" a = %0d",a);
	$display(" b = %0d",b);
endfunction


constraint a_c{
	a inside {[1:10]}; 
	b inside {[1:10]};
	a<b;
	
	}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule

//22:Generate two numbers whose sum is 100.
class sample;
rand int a;
rand int b;
function void print();
	$display(" a = %0d | b = %0d",a,b);
	$display("SUM=%0d ",a+b);
endfunction


constraint a_c{
	a inside {[1:100]}; 
	b inside {[1:100]};
	a+b==100;
	}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule

//23:Generate two numbers whose difference is 20.
class sample;
rand int a;
rand int b;
function void print();
	$display(" a = %0d | b = %0d",a,b);
	$display("Diff=%0d ",a-b);
endfunction


constraint a_c{
	a inside {[1:100]}; 
	b inside {[1:100]};
	a-b==20;
	}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule


//24:Generate two numbers where a is twice b.
class sample;
rand int a;
rand int b;
function void print();
	$display(" a = %0d | b = %0d",a,b);
endfunction


constraint a_c{
	a inside {[1:100]}; 
	b inside {[1:100]};
	a==2*b;
	}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule


//25:Generate two numbers where a is three b.
class sample;
rand int a;
rand int b;
function void print();
	$display(" a = %0d | b = %0d",a,b);
endfunction


constraint a_c{
	a inside {[1:100]}; 
	b inside {[1:100]};
	a==3*b;
	}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule


//26: Generate two even numbers.
class sample;
rand int a;
rand int b;
function void print();
	$display(" a = %0d | b = %0d",a,b);
endfunction


constraint a_c{
	a inside {[1:10]}; 
	b inside {[1:10]};
	a % 2 ==0 && b % 2 == 0; 
	}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule


//27:Generate two odd numbers.
class sample;
rand int a;
rand int b;
function void print();
	$display(" a = %0d | b = %0d",a,b);
endfunction


constraint a_c{
	a inside {[1:10]}; 
	b inside {[1:10]};
	a % 2 !=0 && b % 2 == 1; 
	}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule

//28: Generate one even and one odd number.
class sample;
rand int a;
rand int b;
function void print();
	$display(" a = %0d | b = %0d",a,b);
endfunction


constraint a_c{
	a inside {[1:10]}; 
	b inside {[1:10]};
	a % 2 !=0 && b % 2 == 0; 
	}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule

//29:Generate two different numbers.
class sample;
rand int a;
rand int b;
function void print();
	$display(" a = %0d | b = %0d",a,b);
endfunction


constraint a_c{
	a inside {[1:10]}; 
	b inside {[1:10]};
	a != b; 
	}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule
*/
//30: Generate two numbers whose product is 100.
class sample;
rand int a;
rand int b;
function void print();
	$display(" a = %0d | b = %0d",a,b);
	$display("Product=%0d",a*b);
endfunction


constraint a_c{
	a inside {[1:100]}; 
	b inside {[1:100]};
	a*b==100;
	}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule


