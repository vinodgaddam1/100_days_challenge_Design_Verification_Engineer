=========================================================
       Assertions Problems Level-6 Memory Based 
=========================================================

//1. Check that write data is known during a write operation.
module top;

bit wr_en,clk;
int wdata;


always #5  clk =~clk;
initial begin
clk=0;
wr_en=0;
wdata=0;
@(negedge clk);

wr_en=1;
repeat (10)begin
@(negedge clk);
wdata=$urandom_range(1,50);
end


#100;
$finish;
end

property mem;
	@(posedge clk)
	wr_en |-> !$isunknown(wdata);
endproperty

assert property (mem)
$display("PASS: write data is known during a write operation clk=%0t",$time);
else 

$error("FAIL: write data is unknown during a write operation clk=%0t",$time);

endmodule


OUTPUT:
 


//2. Check that the address remains stable during a write operation.
module top;

bit wr_en,clk;
int addr;


always #5  clk =~clk;
initial begin
clk=0;
wr_en=0;
addr=0;
@(negedge clk);


wr_en=1;
addr=25;
repeat (5)begin
@(negedge clk);
wr_en=0;
end

addr=30;
repeat (5)begin
@(negedge clk);
wr_en=1;
end

#100;
$finish;
end

property mem;
	@(posedge clk)
	wr_en |=> $stable(addr);
endproperty

assert property (mem)
$display("PASS: addr is stable during a write operation clk=%0t",$time);
else 

$error("FAIL: addr  isnot stable during a write operation clk=%0t",$time);

Endmodule


OUTPUT:
 


//3.Check that write enable and read enable are not simultaneously active.
module top;

bit wr_en,clk,rd_en;


always #5  clk =~clk;
initial begin
clk=0;
wr_en=0;
rd_en=0;
#20;

wr_en=1;
rd_en=0;
#20;


wr_en=0;
rd_en=1;

#20;


wr_en=1;
rd_en=1;

#100;
$finish;
end

property mem;
	@(posedge clk) !(wr_en && rd_en);
endproperty

assert property (mem)
$display("PASS: write and read enable are not simultaneousle active clk=%0t",$time);
else 
$error("FAIL: write and read enable are  simultaneousle active clk=%0t",$time);
Endmodule



OUTPUT:
 




//4.Check that read data is valid after one clock cycle.
module top;

bit valid,clk,rd_en;


always #5  clk =~clk;
initial begin
clk=0;
valid=0;
rd_en=0;

#10;

valid=1;
rd_en=1;

#100;
$finish;
end

property mem;
	@(posedge clk) rd_en |=> valid;
endproperty

assert property (mem)
$display("PASS: read data is valid after one clk cycle clk=%0t",$time);
else 
$error("FAIL: read data is not  valid after one clk cycle clk=%0t",$time);
endmodule

OUTPUT:
 



//5.Check that read data is valid after two clock cycles.
module top;

bit valid,clk,rd_en;


always #5  clk =~clk;
initial begin
clk=0;
valid=0;
rd_en=0;

#10;

valid=1;
rd_en=1;

#100;
$finish;
end

property mem;
	@(posedge clk) rd_en |-> ##2 valid;
endproperty

assert property (mem)
$display("PASS: read data is valid after two clk cycle clk=%0t",$time);
else 
$error("FAIL: read data is not  valid after two clk cycle clk=%0t",$time);
endmodule

OUTPUT:
 
