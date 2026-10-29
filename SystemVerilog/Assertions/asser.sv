=========================================================
          Assertions (SVA) — Beginner to Advanced
=========================================================

An assertion is a statement that checks whether a specified condition or behavior is true.
Example 1: Check that a counter does not exceed 100.
assert (count <= 100)
  $display("PASS: Counter is within range");
else
  $error("FAIL: Counter exceeded 100");

There are two main types of assertions:
1.  Immediate Assertions 
2.  Concurrent Assertions

1. Immediate Assertions
An immediate assertion checks whether an expression is true when procedural execution reaches the assertion.
It executes like a procedural statement in an initial, always, always_comb, or other procedural block.
Syntax
assert (expression)
  pass_statement;
else
  fail_statement;


For Example: Check whether two values are equal

module top;
bit [3:0]a,b;
initial begin
	a=4'b10;
	b=4'b10;
assert (a==b)
$display("PASS:a is equals to b");
else 
$error("FAIL: a is not equal to b ");

end
endmodule

Example:
module top;

logic [7:0]counter;
initial begin
	counter = 8'd150;
	assert (counter<100)
	$display("Counter is within the range of 100");
	else 
	$error ("Counter is exceeds the range of 100");
end
endmodule

OUTPUT:
# ** Error: Counter is exceeds the range of 100
#    Time: 0 ns  Scope: top File: ass.sv Line: 30


2. Concurrent Assertions
A concurrent assertion checks a property according to specified clocking and sampling semantics.
It is particularly useful for verifying sequential circuits, protocols, counters, FIFOs, and handshaking logic.
Concurrent assertions commonly use:
•	assert property 
•	property and endproperty 
•	@(posedge clk) 
•	Temporal operators such as |->, |=>, and ## 
•	Optional reset handling through disable iff 
Syntax
property property_name;
  @(posedge clk)
  expression;
endproperty

assert property (property_name);

For Example:
Write an assertion to check the time period is 10 or not?

`timescale 1ns/1ps

module top;

  logic clk;

  initial clk = 0;

  always #5 clk = ~clk;

  initial begin
    #150;
    $finish;
  end

  property tp_check;
    realtime current_time;
    @(posedge clk)
      (1, current_time = $realtime)
      |=> ($realtime - current_time == 10.0);
  endproperty

  assert property (tp_check)
    $display("PASS: Clock period is 10 ns at time %0t", $time);
  else
    $error("FAIL: Clock period is not 10 ns at time %0t", $time);

Endmodule
Output:
# PASS: Clock period is 10 ns at time 15000
# PASS: Clock period is 10 ns at time 25000
# PASS: Clock period is 10 ns at time 35000
# PASS: Clock period is 10 ns at time 45000
# PASS: Clock period is 10 ns at time 55000
# PASS: Clock period is 10 ns at time 65000
# PASS: Clock period is 10 ns at time 75000
# PASS: Clock period is 10 ns at time 85000
# PASS: Clock period is 10 ns at time 95000
# PASS: Clock period is 10 ns at time 105000
# PASS: Clock period is 10 ns at time 115000
# PASS: Clock period is 10 ns at time 125000
# PASS: Clock period is 10 ns at time 135000
# PASS: Clock period is 10 ns at time 145000
# ** Note: $finish    : ass.sv(51)
#    Time: 150 ns  Iteration: 0  Instance:

Assertion wave:
 

//2.Example:Check that valid is high whenever enable is high
module top;

logic  clk;
logic enable,valid;

always #5 clk=~clk;
initial begin
	valid=1'b1;
	enable=1'b1;
	clk=0;
	#200;
	$finish;
end

property en;
@(posedge clk)
enable |-> valid;
endproperty

assert property (en)
else 
$error("valid is low when enable is high");
Endmodule



Assertion wave:
 


