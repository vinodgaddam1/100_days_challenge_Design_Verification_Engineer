
//========================================================                                       
                 Assertion_problems_Level-2
//========================================================

//11:Write a concurrent assertion that checks valid at every rising edge of clk.

module top;
bit clk,valid;
always #5 clk=~clk;
initial begin
	clk=0;
	valid=1;
	#50;
	$finish;
end

property valid_check;
@(posedge clk) valid;
endproperty

assert property  (valid_check)
else  $error("valid is low at a rising edge of clk");
endmodule

//11:Write an assertion that checks data == expected_data on every rising clock edge.
module top;
int data,expected_data;
bit clk;
always #5 clk=~clk;
initial begin
	data=$urandom_range(1,5);
	expected_data=data;
$display("data=%0d | expected_data=%0d ",data,expected_data);
	clk=0;
	#50;
	$finish;
end

property data_check;
@(posedge clk) (data==expected_data);
endproperty

assert property  (data_check)
$display("data macthing");
else  $error("data mismatching");
endmodule


//12:Write an assertion that checks a condition only when enable is high.
module top;
int data,expected_data;
bit clk,enable;

always #5 clk=~clk;
initial begin
	clk=0;
	repeat (5)begin
		@(negedge clk);
	data=$urandom_range(1,5);
	enable=$urandom_range(0,1);
	expected_data=data;
$display("data=%0d | expected_data=%0d | Enable=%0b ",data,expected_data,enable);
end
	#50;
	$finish;
end

property data_check;
@(posedge clk) (enable==1)|-> (data==expected_data);
endproperty

assert property  (data_check)
$display("PASS:data macthing");
else  $error("FAIL:data mismatching");
endmodule


//12:Write an assertion that checks data only when valid is high.
module top;
int data;
bit clk,valid;

always #5 clk=~clk;
initial begin
	clk=0;
	repeat (50)begin
	@(posedge clk);
	data=$urandom_range(1,5);
	valid=$urandom_range(0,1);
$display("data=%0d | Valid=%0b ",data,valid);
end
	#50;
	$finish;
end

property data_check;
@(posedge clk) valid |-> (data!=0);
endproperty

assert property  (data_check)
$display("PASS:data macthing at %0t",$time);
else  $error("FAIL:data mismatching");
endmodule


//13:Write an assertion that disables checking during reset.
module top;
int data;
bit clk,valid,reset;

always #5 clk=~clk;
initial begin
	clk=0;
	repeat (50)begin
	@(negedge clk);
	data=$urandom_range(1,5);
	valid=$urandom_range(0,1);
	reset=$urandom_range(0,1);
$display("data=%0d | Valid=%0b reset=%0b ",data,valid,reset);
end
	#50;
	$finish;
end

property data_check;
@(posedge clk) disable iff (reset) //disable checking while reset is high 
(valid) |-> (data!=0);
endproperty

assert property  (data_check)
$display("PASS:data macthing at %0t",$time);
else  $error("FAIL:data mismatching");
endmodule


//14:Write a property separately and instantiate it using assert property.
module top;

bit clk;
bit reset;
int response,request;
always #5 clk=~clk;
initial begin
clk=0;
reset=1;
repeat(10)begin
@(negedge clk);
request=$urandom_range(0,1);
end
#50;
$finish;
end
always @(posedge clk)
	response<=request;
	property rq_gets_res;
	@(posedge clk) disable iff (!reset)
	request |-> ##[1:3] response;
	endproperty

	assert property (rq_gets_res)
  else $error("No response within 1-3 cycles: request=%0d response=%0d at %0t",
              request, response, $time);
endmodule



//16:Write a reusable property that checks a signal against a parameterized expected value.
module top;

bit clk;
bit[3:0] data;
bit[3:0] expected;

always #5 clk=~clk;
	property check (signal,expected);
		@(posedge clk)
		signal == expected; //when signla is expected data happend assertion will be pass
	endproperty
        //here when data is 4'd5 assertion was pass and 4'd3 assertion was
	//fail
	assert property (check(data,4'd5))
	 $display("PASS: data matches expected value ");
	else $error("FAIL: data mismatch ");

	initial begin
		data=4'd3;
		#20;
		data=4'd3;
		#20;
		$finish;
	end		
endmodule
*/

//17:Create a testbench containing two immediate assertions and two concurrent assertions.
module top;

bit clk;
bit rst;
bit valid;
bit ready;
int data;


always #5 clk=~clk;
	initial begin
		rst=0;
		clk=0;
		valid=0;
		ready=0;


      #20;
      rst =0;
      data =5;
      valid=1;
      ready=1;
      #20;
      data= 3;
      #20;
      valid=0;
      ready=0;

      #20;
      $finish;
	//reset checking
	assert (rst==0)
	$display("PASS: Reset is pass");
	else $error("FAIL: Reset is fail");
	
	//data checking
	data =4'd5;  
	assert (data==4'd5)
	$display("PASS: data is 5");
	else $error("FAIL: data is not 5");
        
end
       property reset_check();
	       @(posedge clk) !rst; 
       endproperty
assert property (reset_check)
$display("PASS: Reset is pass");
else $error("FAIL: Reset is fail");


property valid_ready;
@(posedge clk) (valid)|->(ready)
endproperty

assert property (valid_ready)
$display("PASS: Valid->ready pass");
else 
$error("FAIL: Valid->ready fail");
endmodule































