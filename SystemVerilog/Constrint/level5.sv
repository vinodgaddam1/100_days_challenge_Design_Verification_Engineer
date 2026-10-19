==========================================================================	    SystemVerilog Constraints problems Level-5
==========================================================================

//41:Generate a 10-element array containing only even numbers.
class sample;
rand int array[]; //dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size==10;
	foreach (array[i]){
	array[i] inside {[10:100]};
	array[i] % 2 ==0;
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


//42:Generate a 10-element array containing only odd numbers.
class sample;
rand int array[]; //dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size==10;
	foreach (array[i]){
	array[i] inside {[10:100]};
	array[i] % 2 ==1;
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


//43:Generate an array containing values from 1 to 20, with no duplicates.
class sample;
rand int array[]; //dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size==10;
	foreach (array[i]){
	array[i] inside {[1:20]};
	}
	unique{array};
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


//44:Generate an array where every element is divisible by 5.
class sample;
rand int array[]; //dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size==10;
	foreach (array[i]){
	array[i] inside {[1:20]};
	array[i] % 5 == 0;
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

//45:Generate an array whose elements sum to 100.
class sample;
rand int array[];//dynamic array
rand int sum[];
function void print();
	$display(" array=%p ",array);	
	//$display(" SUM=%0d ",array.sum());	
	$display(" SUM=%0d ",sum[9]);	
endfunction

constraint a_c{
	array.size==10;
	sum.size==10;
	foreach (array[i]){
	array[i] inside {[1:100]};
	//array.sum() == 100;
	if(i==0)
	sum[i]==array[i];

	else
		sum[i]==sum[i-1]+array[i];
	sum[9]==100;
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

//46:Generate an array whose elements sum to 50, with each element between 1 and 10.
class sample;
rand int array[];//dynamic array
rand int sum[];
function void print();
	$display(" array=%p ",array);	
	$display(" SUM=%0d ",array.sum());	
	//$display(" SUM=%0d ",sum[9]);	
endfunction

constraint a_c{
	array.size==10;
	sum.size==10;
	foreach (array[i]){
	array[i] inside {[1:10]};
	//if(i==0)
	//sum[i]==array[i];

	//else
	//	sum[i]==sum[i-1]+array[i];
	//sum[9]==100;
	}
	array.sum() == 50;
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

//47:Generate an array where the first element is 10.
class sample;
rand int array[];//dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size==10;
	foreach (array[i]){
	array[i] inside {[1:10]};
	}
	array[0]==10;
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


//48:Generate an array where the last element is 100.
class sample;
rand int array[];//dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size==10;
	foreach (array[i]){
	array[i] inside {[1:100]};
	}
	array[9]==100;
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


//49:Generate an array where the first element is smaller than the last.
class sample;
rand int array[];//dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size==10;
	foreach (array[i]){
	array[i] inside {[1:100]};
	}
	array[0]<array[9];
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
//50:Generate an array where adjacent elements differ by at least 5.
class sample;
rand int array[];//dynamic array
function void print();
	$display(" array=%p ",array);	
endfunction

constraint a_c{
	array.size==10;
	foreach (array[i]){
	array[i] inside {[0:50]};
        if(i<array.size()-1)
		array[i]-array[i+1]>=5 || (array[i+1]-array[i]>=5); 
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
