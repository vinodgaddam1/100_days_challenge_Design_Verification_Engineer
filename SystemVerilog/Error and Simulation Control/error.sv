>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
          Error and Simulation Control In SystemVerilog
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

1.$finish in SystemVerilog
$finish is a simulation control system task used to terminate the simulation normally.
Syntax
$finish;

For Example:
1.$finish
module top;
initial begin
	$display("Simulation started");
	#10;
	$display("Simulation is runnig");

	#10;
	$finish; //At 20 time units, $finish terminates the simulation.
	$display("This will NOT executed");

end
endmodule


2.$stop in SystemVerilog
$stop is a simulation control system task used to suspend/pause the simulation.
Syntax
$stop;

For Example:
2.$stop
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

3.$fatal in SystemVerilog
$fatal is a SystemVerilog severity system task used when a critical error occurs. It reports the error and terminates the simulation.
Syntax
$fatal;

For Example:
3.fatal;
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

Noted:You can also provide formatting arguments:
$fatal(1, "Expected=%0d, Actual=%0d", expected, actual);


4.$error — Next SystemVerilog Severity Task
$error is used to report an error during simulation without immediately terminating the simulation.
Syntax
$error("Error message");

For Example:
$error
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

5.$warning in SystemVerilog
$warning is a SystemVerilog severity system task used to report a condition that is unexpected or suspicious, but not serious enough to stop the simulation.
Syntax
$warning("Warning message");

For Example:

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

