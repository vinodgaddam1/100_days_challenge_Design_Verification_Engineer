========================================================================
          Assertions Problems Level-5   based On counters
========================================================================

//1:Check that a counter remains stable when enable is low.
module top;
bit clk;
int count;
bit enable;

always #5 clk=~clk;

always @(posedge clk ) if (enable) count <= count+1;
initial begin
	clk=0;
	count=$urandom_range (10,30);
	enable=0;


	//Enable is High 
	repeat (3) begin
		@(negedge clk);
		enable =1;
	end
	
	//Enable is LOW 
	repeat (5) begin
		@(negedge clk);
		enable =0;
	end

	#100;
	$finish;
end
property detecte;
	@(posedge clk) !enable |=>count == $past(count);
endproperty

assert property (detecte)
$display(" count %0d reamins stable when enable is low %0b   clk %0t ",count,enable,$time);
else
$error(" count %0d reamins not stable when enable is high %0b   clk %0t ",count,enable,$time);
Endmodule


OUTPUT:
Enable             count         $past           expected
   0                       10              -                   initial
   0                       10             10                    10 (pass)
   0                       11            10                     11 (fail)
   0                       10            11                     10  (pass)

 



//2:Check that a counter resets to zero.
module top;
bit clk;
int count;
bit reset;

always #5 clk=~clk;

always @(posedge clk ) begin
	if (reset)
	count <=0;
	else	
	count <= count+1;
end
initial begin
	clk=0;
	count=0;
	reset=0;


	//Enable is LOW 
	repeat (3) begin
		@(negedge clk);
		reset =0;
	end
	
	//Enable is HIGH
	repeat (5) begin
		@(negedge clk);
		reset = 1 ;
	end
	
	//Enable is LOW 
	repeat (3) begin
		@(negedge clk);
		reset =0;
	end
	#100;
	$finish;
end
property detecte;
	@(posedge clk) reset |=>count == 0;
endproperty

assert property (detecte)
$display(" when reset %0d  happend count must be zero %0d   clk %0t ",reset,count,$time);
else
$error(" when reset %0d  not happend count will be increace %0d   clk %0t ",reset,count,$time);
endmodule


OUTPUT:
 



//3:Check that a counter never exceeds its maximum value.

module top;
bit clk;
int count;
parameter MAX_COUNT = 15;
always #5 clk=~clk;

always @(posedge clk ) begin
	if (count==MAX_COUNT+1)
	count <=0;
	else	
	count <= count+1;
end
initial begin
	clk=0;
	count=0;
	#200;
	$finish;
end
property detecte;
	@(posedge clk) count <= MAX_COUNT;
endproperty

assert property (detecte)
$display("  count is never exceed max = %0d    clk %0t ",count,$time);
else
$error("  count is  exceed max = %0d    clk %0t ",count,$time);
Endmodule



OUTPUT:  When exceed my max value my assertion will be see here my max value upto 15 I get 16 it will fail.
 



//4:Check that a counter wraps around after reaching its maximum value.
module top;
bit clk;
int count;
bit enable;
parameter MAX_COUNT = 15;
always #5 clk=~clk;

always @(posedge clk ) begin
	if(enable)begin
	if (count==MAX_COUNT) begin
	count <=0;
end
	else	begin
	count <= count+1;
end
end
end
initial begin
	clk=0;
	count=0;
	enable=0;
	@(negedge clk);
	enable=1;
 repeat (20)begin
	 @(negedge clk);
	 enable=1;
 end
enable=0;
	#200;
	$finish;
end
property detecte;
	@(posedge clk) 
	disable iff (!enable)
	( count == MAX_COUNT) |=> count ==0;
endproperty

assert property (detecte)
$display("  count is never exceed max = %0d    clk %0t ",count,$time);
else
$error("  count is  exceed max = %0d    clk %0t ",count,$time);
endmodule


OUTPUT:

 


/5:Check that an up/down counter increments or decrements correctly.
module top;
bit clk,rst;
int count;
bit up_down;
parameter MAX_COUNT = 15;
always #5 clk=~clk;

always @(posedge clk ) begin
	if(rst)begin
		count<=0;
	end
	else if (up_down)begin
		if(count==MAX_COUNT)begin
			count<=0;
		end
		else begin
			count<=count+1;;
		end
	end
	else begin

		if(count==0)begin
			count<=MAX_COUNT;
		end
		else begin
			count<=count-1;;
		end
	end
	end
initial begin
	clk=0;
	count=0;
	up_down=1;
	rst=1;

	@(negedge clk);
	rst=0;

 repeat (20) @(negedge clk);


	up_down =0;
 repeat (20) @(negedge clk);

	#200;
	$finish;
end


//-------------------UP_COUNTER---------------------------------
property up_counter;
	@(posedge clk) 
	disable iff (rst)
	( up_down && count < MAX_COUNT) |=> count == (($past(count)+1));
endproperty

assert property (up_counter)
    $display("UP PASS: count=%0d time=%0t", count, $time);
else
    $error("UP FAIL: count=%0d time=%0t", count, $time);



 //-------------------UP_COUNTER_wraparound---------------------------------
property up_wrap;
	@(posedge clk) 
	disable iff (rst)
	( up_down && count == MAX_COUNT) |=> count == 0;
endproperty

assert property (up_wrap)
    $display("UP PASS: count=%0d time=%0t", count, $time);
else
    $error("UP FAIL: count=%0d time=%0t", count, $time);
   

 //-------------------DOWN_COUNTER---------------------------------
property down_counter;
	@(posedge clk) 
	disable iff (rst)
	(!up_down && count > 0) |=> count == ($past(count)-1);
endproperty

assert property (down_counter)
    $display("UP PASS: count=%0d time=%0t", count, $time);
else
    $error("UP FAIL: count=%0d time=%0t", count, $time);



//-------------------DOWN_wrap---------------------------------
property down_wrap;
	@(posedge clk) 
	disable iff (rst)
	(!up_down && count == 0) |=> count == MAX_COUNT;
endproperty

assert property (down_wrap)
    $display("UP PASS: count=%0d time=%0t", count, $time);
else
    $error("UP FAIL: count=%0d time=%0t", count, $time);
endmodule

 



