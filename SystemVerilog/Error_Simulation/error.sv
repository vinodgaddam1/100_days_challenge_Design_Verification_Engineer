/*==========================================================================
*
* ===========================================================================

//1.$finish
module top;
initial begin
	$display("Simulation started");
	#10;
	$display("Simulation is runnig");

	#10;
	$finish;
	$display("This will NOT executed");

end
endmodule





//2.$stop
module top;
initial begin
	$display("Simulation started");
	#10;
	$display("Before stop");
        $stop;
	#10;
	$display("After stop");

end
endmodule




//3.fatal;
module top;
logic [3:0]actual;
logic [3:0]expected;
initial begin
actual  = 4'd10;
expected  = 4'd5;
$display("Before comparison: actual=%0d expected=%0d",
         actual, expected);
	 if(actual !=expected)
	$fatal(1,"Mismatch: expected=%0d,actual=%0d",expected,actual);
  $display("Simulation Continues....."); //Obj here 
end
endmodule


//$error
module top;
logic [3:0]actual;
logic [3:0]expected;
initial begin
actual  = 4'd10;
expected  = 4'd5;
$display("Before comparison: actual=%0d expected=%0d",
         actual, expected);
	 if(actual !=expected)
	$error("Mismatch: expected=%0d,actual=%0d",expected,actual);
  $display("Simulation Continues.....");//obj here
end
endmodule


*/


//$warning
module top;
logic [4:0]data;
initial begin
	data=5'd20;
	if(data>20)
		$warning("data is greater than 15 :data=%0d",data);
         $display("Simulation Continues.....");//obj here
end
endmodule





































































