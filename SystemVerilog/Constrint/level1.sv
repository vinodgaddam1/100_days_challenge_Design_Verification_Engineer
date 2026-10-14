================================================================================	            
               SystemVerilog Constraints based problems Level-1
===============================================================================


//1: Generate a number between 10 and 50
class sample;
rand bit [7:0]a;
function void print();
	$display("a=%p",a);
endfunction

constraint a_c{
	a inside {[10:50]};

}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
	s.randomize();
	s.print;
end
end
endmodule



//2: Generate only even numbers
class sample;
rand int a;
function void print();
	$display("a=%03d",a);
endfunction

constraint a_c{
	a inside {[10:100]};
	a%2==0;
	}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
	s.randomize();
	s.print;
end
end
endmodule



//3: Generate only even numbers 1 to 100
class sample;
rand int a;
function void print();
	$display("a=%03d",a);
endfunction

constraint a_c{
	a inside {[1:100]};
	a%2==0;
	}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
	s.randomize();
	s.print;
end
end
endmodule

//4: Generate prime number between 1 to 15
class sample;
rand int num;
int div[];
function void print();
	$display("prime numbers=%0d",num);
endfunction

function new();
	div=new[15];
       foreach (div[i])
	       div[i]=i+1;
endfunction

constraint a_c{
	num inside {[2:15]};
	foreach(div[i])
		if(div[i]>=2 && div[i]<num)
			num%div[i]!=0;
	}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
	s.randomize();
	s.print;
end
end
endmodule


//5: Generate  number  divible by 5 between 20 to 100
class sample;
rand int num;
function void print();
	$display(" numbers=%0d",num);
endfunction


constraint a_c{
	num inside {[20:100]};
	num%5==0;
	}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
	s.randomize();
	s.print;
end
end
endmodule


//6: Generate  number  divible by 5 and 3 between 20 to 100  note find LCM
//3 and 5 =15
class sample;
rand int num;
function void print();
	$display(" numbers=%0d",num);
endfunction


constraint a_c{
	num inside {[20:100]};
	num%15==0;
	}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
	s.randomize();
	s.print;
end
end
endmodule

//7: Generate a  number 50 to 150 without using ""inside""   
class sample;
rand int num;
function void print();
	$display(" numbers=%0d",num);
endfunction


constraint a_c{
	num>=50;
	num<=150;
	
	}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
	s.randomize();
	s.print;
end
end
endmodule


//8: Generate a number  from the set {2,4,8,16,32} use inside
class sample;
rand int num;
function void print();
	$display(" numbers=%0d",num);
endfunction


constraint a_c{
	num inside {2,4,8,16,32};
	}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
	s.randomize();
	s.print;
end
end
endmodule


//9:Generate a number from either 10–20 or 80–90. 
class sample;
rand int num;
function void print();
	$display(" numbers=%0d",num);
endfunction


constraint a_c{
	num inside {[10:20],[80:90]};
	}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
	s.randomize();
	s.print;
end
end
endmodule
*/

//10:Generate a number greater than 25 and less than 75.
class sample;
rand int num;
function void print();
	$display(" numbers=%0d",num);
endfunction


constraint a_c{
	num>25;
	num<75;
	}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
	s.randomize();
	s.print;
end
end
endmodule
