********************************************************
                                              Break
********************************************************
Break: is used to immediately terminates the current loop.
module top;
int i;
initial begin
	for (i=0;i<10;i++)begin
		if(i==5)
			break;
			$display("i = %0d",i);
	end
	$display("Loop Ended");

end
endmodule
OUTPUT:
# i = 0
# i = 1
# i = 2
# i = 3
# i = 4
# Loop Ended



********************************************************
                                             Continue
********************************************************
Continue: is used to skips the remaining statement in the current iteration and moves to the next iteration.
//Example-1:
module top;
int i;
initial begin
	for (i=0;i<10;i++)begin
		if(i==5)
			continue;
			$display("i = %0d",i);
	end
	$display("Loop Ended");
end
endmodule



//EXAMPLE-2:
module top;
int i;
initial begin
	for (i=0;i<10;i++)begin
		if(i%2==0) //skip the even numbers
			continue;
			$display("i = %0d",i);
	end
	$display("Loop Ended");
end
endmodule

********************************************************
                                              Return
********************************************************
Return: is used to terminate execution of a function or task and transfer control back to the calling statement.
//Ex-1:
module top;
int result;
	function int sum(input int a,b);
	return a+b;
	endfunction

	initial begin
	result = sum(10,30);
$display("SUM = %0d",result);	
	end
endmodule
*/

module top;
initial begin
$display("checking_number = %s ",checking_number(10));
$display("checking_number = %s ",checking_number(3));
end


function int checking_number(int num);
	if(num%2==0)
		return "Even";
	else
		return "odd";
endfunction

endmodule


