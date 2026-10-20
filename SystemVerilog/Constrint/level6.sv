
==========================================================================	 
SystemVerilog Constraints problems Level-6
==========================================================================

//51:Generate an array where every third element is even.
class sample;
rand int array[];//dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size==10;
	foreach (array[i]){
	array[i] inside {[1:20]};
         if((i+1)%3 == 0)
         array[i]%2==0;
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

//52:Generate an array where elements at even indices are even
class sample;
rand int array[];//dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size==10;
	foreach (array[i]){
	array[i] inside {[1:20]};
         if(i%2== 0) 
         array[i]%2==0;
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

//53:Generate an array where elements at odd indices are odd
class sample;
rand int array[];//dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size==10;
	foreach (array[i]){
	array[i] inside {[1:20]};
         if((i)%2!= 0) 
         array[i]%2!=0;
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

//54:Generate an array containing exactly five even numbers.
class sample;
rand int array[];//dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size==10;
	foreach (array[i]){
	array[i] inside {[1:20]};
         array.sum() with (int'(item % 2==0)) == 5;
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

//55:Generate an array containing exactly three occurrences of 7
class sample;
rand int array[];//dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size==10;
	foreach (array[i]){
	array[i] inside {[1:20]};
         array.sum() with (int'(item ==7)) == 3;
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

//56:Generate a 10-element array of unique values between 1 and 100, sorted ascending.
class sample;
rand int array[];//dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size==10;
	foreach (array[i]){
	array[i] inside {[1:100]};
         if(i>0)
		 array[i]>array[i-1];
		 unique{array};

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

//57:Generate a 10-element array of unique values between 1 and 100, sorted descending.
class sample;
rand int array[];//dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size==10;
	foreach (array[i]){
	array[i] inside {[1:100]};
         if(i>0)
		 array[i]<array[i-1];
		 unique{array};

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


//58:Generate an array of 10 elements where adjacent elements differ by exactly 1.
class sample;
rand int array[];//dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size==10;
	foreach (array[i]){
	array[i] inside {[1:100]};
         if(i>0)
		 array[i]==array[i-1]+1;
		 unique{array};

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


//59:Generate an array of 10 elements where pattern like this 0,1,0,2,0,3....
class sample;
rand int array[];//dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size()==10;
	foreach (array[i]){
	array[i] inside {[0:100]};
	if(i%2==0)
		array[i]==0;
	else
		array[i]==(i+1)/2;
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
//60:Generate an array containing the values 1 through 10 in random order.
class sample;
rand int array[];//dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size()==10;
	foreach (array[i]){
	array[i] inside {[0:100]};
	unique {array};
	
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

