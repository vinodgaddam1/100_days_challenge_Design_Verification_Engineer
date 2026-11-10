Final Blocks

The final block is  “procedural Block ” that Executes only ones, when the simulation is about to terminate, normally used to printing final simulation.
can’t contain timing controls such ,#,@,wait it look like function behaviour
Syntax:
final  begin
//statement
End

For Example:
module top;
int pass = 0;
int fail = 0;

initial begin
	if(10 == 10)
		pass++;
	if(20 == 30)
		pass ++;
        else
		fail++;
	if(5 == 5)
		pass++;
end

final begin
$display("-----------------------------------------");
$display("               TEST SUMMARY              ");
$display("-----------------------------------------");
$display("PASS COUNT = %0D",pass);
$display("FAIL COUNT = %0D",fail);
end
endmodule


//OUTPUT:
-----------------------------------------
               TEST SUMMARY              
-----------------------------------------
PASS COUNT = 2
FAIL COUNT = 1
