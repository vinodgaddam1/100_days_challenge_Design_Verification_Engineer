==================================================================
               Assertions Problems Level-3 
==================================================================

//1. Check that reset makes all control signals zero.

module top;

bit valid,ready,clk,enable,reset;

always #5 clk=~clk;
initial begin
clk=0;
reset=0;
valid=0;
ready=0;
enable=0;

@(negedge clk);
reset =1;
valid=0;
ready=0;
enable=0;

repeat (2)begin
@(negedge clk);
reset = 0;
valid=1;
ready=1;
enable=1;
#20;

reset=1;
valid=1;
ready=1;
enable=1;

#20;


valid=0;
ready=0;
enable=0;
#100;
$finish;
end
end
property control;
	@(posedge clk)
	reset |-> (enable==0 && valid==0 && ready==0);
endproperty

assert property (control)
$display("PASS: control signals pass");
else
$error("FAIL: control signals pass");
endmodule

OUPUT:
 



//2. Check that a request is acknowledged in the same cycle.
module top;

bit req,ack,clk;

always #5 clk=~clk;

initial begin
	clk=0;
	req=0;
	ack=0;
	#20;
	req=$urandom_range(0,1);
	//PASS case
	if(req)
		ack=1;
	else 
		ack=0;


        #20;
        
	//FALS
	if(req)
		ack=0;
	else
		ack=1;
	#20;

        //PASS
	if(req)
		ack=1;
	else
		ack=0;

	#100;
	$finish;
end
property re_ack;
	@(posedge clk)
	req |-> ack;
endproperty

assert property (re_ack)
$display("Request and Acknoledged happend same clk edge ");
else
$error("Request and Acknoledged happend different clk edge");
endmodule

OUTPUT:
 




//3. Check that a request is acknowledged in the next cycle.
module top;

bit req,ack,clk;

always #5 clk=~clk;

initial begin
	clk=0;
	req=0;
	ack=0;
	#20;
	req=$urandom_range(0,1);
	//PASS case
	if(req)
		ack=1;
	else 
		ack=0;


        #20;
        
	//FALS
	if(req)
		ack=0;
	else
		ack=1;
	#20;

        //PASS
	if(req)
		ack=1;
	else
		ack=0;

	#100;
	$finish;
end
property re_ack;
	@(posedge clk)
	req |=> ack;
endproperty

assert property (re_ack)
$display("Request and Acknoledged happend same clk edge ");
else
$error("Request and Acknoledged happend different clk edge");
endmodule

OUTPUT:
 






//4. Check that an acknowledgement occurs within 1–5 cycles of a request.
module top;

bit req,ack,clk;

always #5 clk=~clk;

initial begin
	clk=0;
	req=0;
	ack=0;
	#20;
	req=$urandom_range(0,1);
	//PASS case
	if(req)
		ack=1;
	else 
		ack=0;


        #20;
        
	//FALS
	if(req)
		ack=0;
	else
		ack=1;
	#20;

        //PASS
	if(req)
		ack=1;
	else
		ack=0;

	#100;
	$finish;
end
property re_ack;
	@(posedge clk)
	req |-> ##[1:5] ack;
endproperty

assert property (re_ack)
$display("Request and Acknoledged happend within [1:5] clk edge ");
else
$error("Request and Acknoledged happend not happend edge");
endmodule



OUTPUT:
 


//5:Check that a signal remains stable for three consecutive clock cycles.
module top;

bit clk;
int data;

always #5 clk=~clk;

initial begin
	clk=0;
	#20;
	data=$urandom_range(10,50);
	#100;
	$finish;
end
property signal;
	@(posedge clk)
	$stable(data) [*3];
endproperty

assert property (signal)
$display("signal remains stable for three consecutive clk %0t ",$time);
else
$error("signal not remains stable for three consecutive clk %0t ",$time);
endmodule



OUTPUT:
 
