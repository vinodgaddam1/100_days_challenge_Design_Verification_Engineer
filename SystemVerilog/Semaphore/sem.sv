>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                 SystemVerilog semaphores
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

1. Definition
A semaphore is like a set of keys/tokens.
•	A process must get a key before accessing a shared resource. 
•	After finishing, it puts the key back. 
•	If no key is available, the process waits. 
SystemVerilog provides the built-in semaphore class.


1. new()
Creates the semaphore with a specified number of keys.
2. get()
Used to acquire keys.
3. try_get()
Used to acquire keys without waiting.
4. put()
Used to return/release keys.

For Example:
module top;
semaphore sem=new(1);
//semaphore sem=new(2);
//semaphore sem=new(3);
initial begin
	sem.get();
	$display("%0t: get the resoure-1",$time);
	$display("%0t: put the resoure-1",$time);
	sem.put();
end
initial begin
	sem.get();
	#10;
	$display("%0t: get the resoure-2",$time);

	$display("%0t: put the resoure-2",$time);
	sem.put();

end
initial begin
	sem.get();
	#20;
	$display("%0t: get the resoure-3",$time);

	$display("%0t: put the resoure-3",$time);
	sem.put();
end
endmodule





