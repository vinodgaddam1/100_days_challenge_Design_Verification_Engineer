==========================================================================	
SystemVerilog Constraints problems Level-6
==========================================================================

//61:Generate an array of 10 elements with no consecutive duplicate values.
class sample;
rand int array[];//dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size()==10;
	foreach (array[i]){
	array[i] inside {[0:100]};
	if(i>0)
	array[i]!=array[i-1];
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


//62:Generate an array where the sum of all elements is even and same question
//find odd also.
class sample;
rand int array[];//dynamic array
function void print();
	$display(" array=%p ",array);	
	$display(" SUM=%0d ",array.sum());	
endfunction

constraint a_c{
	array.size()==10;
	foreach (array[i]){
	array[i] inside {[0:100]};
	array.sum () % 2==0;  //even
//	array.sum()  %2 !=0;  odd
	
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

//63:Generate an array where the Even index is odd elements,odd index even
//element
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
		array[i]%2==1;
	else 
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

//64:Generate an array whose first half contains only even values and second half only odd values.
class sample;
rand int array[];//dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size()==10;
	foreach (array[i]){
	array[i] inside {[0:100]};
	if(i<5)
		array[i]%2==0;

	else
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


//65:Generate an array where every element is greater than the array's first element, except the first itself.
class sample;
rand int array[];//dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size()==10;
	foreach (array[i]){
	array[i] inside {[0:100]};
	if(i>0)
		array[i]>array[0];
	
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

//66:Generate an array of 10 elements where each element is greater than the previous element by at least 3.
class sample;
rand int array[];//dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size()==10;
	foreach (array[i]){
	array[i] inside {[0:100]};
	if(i>0)
		array[i]>=array[i-1]+3;
	
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


//67:Generate an array containing exactly four odd numbers.
class sample;
rand int array[];//dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size()==10;
	foreach (array[i]){
	array[i] inside {[0:100]};
	array.sum()with (int'(item  % 2==1))==4;
	
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

//68:Generate an array where all elements are unique and the sum is 100.
class sample;
rand int array[];//dynamic array
function void print();
	$display(" array=%p ",array);	
	$display(" SUM=%0d ",array.sum());	
endfunction

constraint a_c{
	array.size()==10;
	foreach (array[i]){
	array[i] inside {[0:50]};
	unique{array};
	array.sum()==100;
	
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

//69:Generate an array where every element is either 10, 20, 30, or 40, with no duplicates.
class sample;
rand int array[];//dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size()==4;
	foreach (array[i]){
	array[i] inside {10,20,30,40};
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
*/
//70:Generate an array where the first five elements sum to 50 and the last five sum to 100.
class sample;
rand int array[];//dynamic array
function void print();
	$display(" array=%p ",array);	
	$display(" First Half SUM=%0d ",array[0]+array[1]+array[2]+array[3]+array[4]);	
	$display(" Second Half SUM=%0d ",array[5]+array[6]+array[7]+array[8]+array[9]);	
endfunction

constraint a_c{
	array.size()==10;
	foreach (array[i]){
	array[i] inside {[0:100]};
	array[0]+array[1]+array[2]+array[3]+array[4]==50;
	array[5]+array[6]+array[7]+array[8]+array[9]==100;

	
	
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

