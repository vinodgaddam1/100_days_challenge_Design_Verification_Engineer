==========================================================================
            SystemVerilog Constraints  problems Level-4
==========================================================================

//31:Generate three numbers whose sum is 50.
class sample;
rand int a,b,c;
function void print();
	$display(" a = %0d | b = %0d | c = %0d",a,b,c);
	$display("SUM=%0d",a+b+c);
endfunction


constraint a_c{
	a inside {[1:100]}; 
	b inside {[1:100]};
	c inside {[1:100]};
	a+b+c==50;
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


//32:Generate three numbers in ascending order.
class sample;
rand int a,b,c;
function void print();
	$display(" a = %0d | b = %0d | c = %0d",a,b,c);
endfunction


constraint a_c{
	a inside {[1:100]}; 
	b inside {[1:100]};
	c inside {[1:100]};
	a<b;
	b<c;
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


//33:Generate three numbers in descending order.
class sample;
rand int a,b,c;
function void print();
	$display(" a = %0d | b = %0d | c = %0d",a,b,c);
endfunction


constraint a_c{
	a inside {[1:100]}; 
	b inside {[1:100]};
	c inside {[1:100]};
	a>b;
	b>c;
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


//34:Generate two numbers where a+b is even.
class sample;
rand int a,b;
function void print();
	$display(" a = %0d | b = %0d ",a,b);	
	$display(" EVEN_SUM = %0d ",a+b);	
endfunction


constraint a_c{
	a inside {[1:100]}; 
	b inside {[1:100]};
	(a+b) % 2==0;
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


//35:Generate two numbers where a+b is odd.
class sample;
rand int a,b;
function void print();
	$display(" a = %0d | b = %0d ",a,b);	
	$display(" ODD_SUM = %0d ",a+b);	
endfunction


constraint a_c{
	a inside {[1:100]}; 
	b inside {[1:100]};
	(a+b) % 2!=0;
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


//36:Generate an array of 5 elements between 1 and 50.
class sample;
rand int array[]; //dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

function new();
array=new[5];	
endfunction


constraint a_c{
	foreach (array[i])
	array[i] inside {[1:50]}; 
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


//37:Generate a 10-element array between 1 and 100.
class sample;
rand int array[]; //dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

//function new();
//array=new[5];	
//endfunction


constraint a_c{
	array.size==10;
	foreach (array[i])
	array[i] inside {[1:100]}; 
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



//38:Generate a 10-element array with unique values.
//Note: Here I'm Implementing 3 ways 1.randc,2.unique,normal way 
class sample;
//randc int array[]; dynamic array with randc  
rand int array[];
function void print();
	$display(" array=%p ",array);	
endfunction

//constraint a_c{
//	foreach (array[i]){
//	array[i] inside {[1:100]};
//}
//unique {array}; 2.unique {};
//	}
//endclass


//noramal way
constraint a_c{
foreach (array[i]){
	array[i] inside {[1:100]};
foreach(array[j]){
	if(i<j){
		array[i]!=array[j];
	}
}
}
}
endclass
module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
	s.array=new[10];
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


//39:Generate a 10-element array in ascending order.
class sample;
rand int array[]; //dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size==10;
	foreach (array[i]){
	array[i] inside {[10:100]};
	if(i>0){
	array[i] > array[i-1]; 
}
}
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
//40:Generate a 10-element array in descending order.
class sample;
rand int array[]; //dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size==10;
	foreach (array[i]){
	array[i] inside {[10:100]};
	if(i>0){
	array[i] < array[i-1]; 
}
}
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

