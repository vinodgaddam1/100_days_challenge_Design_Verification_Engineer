==========================================================================	
           SystemVerilog Constraints based problems Level-2
==========================================================================
//11:Generate a 4-bit random variable with values from 3 to 12.
class sample;
rand bit [4:0]num;
function void print();
	$display(" numbers=%0d",num);
endfunction


constraint a_c{
	num>=3;
	num<=12;
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


//12:Generate a number whose remainder is 1 when divided by 4.
class sample;
rand int num;
function void print();
	$display(" numbers=%0d",num);
endfunction


constraint a_c{
	num inside {[10:50]};
	num % 4 == 1;
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


//13:Generate a multiple of 8 between 8 and 120.
class sample;
rand int num;
function void print();
	$display(" numbers=%0d",num);
endfunction


constraint a_c{
	num>=8;
	num<=120;
	num % 8 == 0;
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


//14:Generate a number that is not in {0, 1, 2, 3}.
class sample;
rand int num;
function void print();
	$display(" numbers=%0d",num);
endfunction


constraint a_c{
	 num inside {[1:10]};
	!(num inside {0,1,2,3});
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



//15:Generate a number between 1 and 100, excluding 50.
class sample;
rand int num;
function void print();
	$display(" numbers=%0d",num);
endfunction


constraint a_c{
	num inside {[1:100]};
	num !=50;
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


//16:Generate a 2-bit variable with values 1 or 2 only.
class sample;
rand bit[1:0]num;
function void print();
	$display(" numbers=%0d",num);
endfunction


constraint a_c{
	num inside {1,2};
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


//17:Generate a number greater than 10 and divisible by 2.
class sample;
rand int num;
function void print();
	$display(" numbers=%0d",num);
endfunction


constraint a_c{
	num inside {[10:50]};
	num>10 && num % 2 ==0;
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


//18:Generate a number less than 100 and divisible by 7.
class sample;
rand int num;
function void print();
	$display(" numbers=%0d",num);
endfunction


constraint a_c{
	num inside {[10:50]};
	num<100 && num % 7 ==0;
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


//19:Generate a number between 20 and 80 that is divisible by 3.
class sample;
rand int num;
function void print();
	$display(" numbers=%0d",num);
endfunction


constraint a_c{
	num inside {[20:80]};
	num % 3 ==0;
	
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
//20:Generate a number between 1 and 200 that is divisible by 4 but not by 8.
class sample;
rand int num;
function void print();
	$display(" numbers=%0d",num);
endfunction


constraint a_c{
	num inside {[1:200]};
	num % 4 ==0 && num % 8 !=0; 
	
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

