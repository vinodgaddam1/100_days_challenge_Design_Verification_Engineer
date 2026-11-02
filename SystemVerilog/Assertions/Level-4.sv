=========================================================
             Assertions Problems Level-4 
=========================================================

//6:Check that a signal never becomes X or Z.
module top;
bit clk;
int data;

always #5 clk=~clk;

initial begin
	clk=0;
	#20;
	data=32'd32;
	#20
	data=32'd44;
        #20;
	data=32'dx;
        #20;
	data=32'd56;


	#100;
	$finish;
end
property no_unknown;
	@(posedge clk)
	!($isunknown(data));
endproperty

assert property (no_unknown)
$display("signal never become X or Z clk %0t ",$time);
else
$error("signal become X or Z  clk %0t ",$time);
endmodule


OUTPUT:  In this code I’ m force fully give unknown value but it will be produced “known “ here I’m printing all know values
 


//7:Check that a signal rises from 0 to 1.
module top;
bit clk;
bit signal;

always #5 clk=~clk;

initial begin
	clk=0;
	#20;
	signal=1;
	#20;
	signal=0;
	#20;
	signal=1;
	#100;
	$finish;
end
property rise;
	@(posedge clk)
	$rose(signal);
endproperty

assert property (rise)
$display("signal rise from 0 to 1 clk %0t ",$time);
else
$error("signal not rise from 0 to 1  clk %0t ",$time);
Endmodule

OUTPUT: obj here only when signal is going 0to1 then my assertion is pass 
Reaming thing fail condition in waveform

 

//8:Check that a signal falls from 1 to 0.
module top;

bit clk;
bit signal;

always #5 clk=~clk;

initial begin
	clk=0;
	#20;
	signal=1;
	#20;
	signal=0;
	#20;
	signal=1;
	#20;
	signal=0;
	#100;
	$finish;
end
property fall;
	@(posedge clk)
	$fell(signal);
endproperty

assert property (fall)
$display("signal falls from 1 to 0 clk %0t ",$time);
else
$error("signal not fall from 1 to 0  clk %0t ",$time);
endmodule




OUTPUT:$fell detects a tx from 1 to 0
 


//9:Check that two control signals are never high simultaneously.
module top;

bit clk;
bit signal1;
bit signal2;

always #5 clk=~clk;

initial begin
	clk=0;
	#20;
	//pass
       signal1=1;
       signal2=0;
	#20;
	//pass
       signal1=0;
       signal2=0;

	#20;
	//pass
       signal1=0;
       signal2=1;
	#20;
	//fail
       signal1=1;
       signal2=1;

	#100;
	$finish;
end
property s;
	@(posedge clk)
	(!(signal1 && signal2));
endproperty

assert property (s)
$display("never happend high at simultaneously clk %0t ",$time);
else
$error(" happend high at simutaneously  clk %0t ",$time);
endmodule

OUTPUT:    (1,0)//pass,(0,0)//pass ,(0,1)//pass ,(1,1)//fail
 



//10:Check that a counter increments by one every clock cycle when enable is high.
module top;
bit clk;
int count;
bit enable;

always #5 clk=~clk;

always @(posedge clk ) if (enable) count <= count+1;
initial begin
	clk=0;
	enable=0;

	#20;
	enable=1;
	#20;
	enable=0;
	#20;
	enable=1;
	#20;
	enable=1;
	#100;
	$finish;
end
property detecte;
	@(posedge clk) enable |=>count == ($past(count)+1);//logic
endproperty

assert property (detecte)
$display(" count %0d incr by every clk cycle enable is high %0b   clk %0t ",count,enable,$time);
else
$error(" count %0d  not incr by every clk cycle enable is Low %0b   clk %0t ",count,enable,$time);
endmodule




OUTPUT:
 
