==================================================
                        Assertions Problems Level-7 Memory Based 
==================================================

//6.Check that memory address is within the valid range.
module top;

bit clk,wd_en,rd_en;
int addr;


always #5  clk =~clk;
initial begin
clk=0;
wd_en=0;
rd_en=0;
@(negedge clk);

wd_en=1;
rd_en=1;
repeat (10)begin
@(negedge clk);
addr=$urandom_range(10,50);
end

//out of range
repeat (10)begin
@(negedge clk);
addr=$urandom_range(10,100);
end

#100;
$finish;
end

property mem;
	@(posedge clk) 
	(wd_en || rd_en) |->(addr inside {[10:50]});
endproperty

assert property (mem)
$display("PASS: memory address within the valid range  clk=%0t",$time);
else 
$error("FAIL: memory address not within the valid range cycle clk=%0t",$time);
endmodule


OUTPUT:

 


//7.Check that write data remains stable while a write is stalled.
module top;

bit clk,wd_en,ready;
int wdata;


always #5  clk =~clk;
initial begin
clk=0;
wd_en=0;
ready=0;
@(negedge clk);

ready=1;
wd_en=1;
repeat (10)begin
@(negedge clk);
wdata=$urandom_range(10,50);
end

ready=0;
repeat (10)begin
@(negedge clk);
wdata=$urandom_range(10,100);
end

#100;
$finish;
end

property mem;
	//concept of handsaking
	@(posedge clk) 
	(wd_en && !ready) |=>
	(wd_en && $stable(wdata));
endproperty

assert property (mem)
$display("PASS: write data remains stable while a write is stalled  clk=%0t",$time);
else 
$error("FAIL: write  data remains not stable while a write is stalled clk=%0t",$time);
endmodule

Output:
 



//8.Check that a read response occurs only after 2 cycles a read request.
module top;

bit clk,valid,rd_en;


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
	//concept of handsaking
	@(posedge clk) 
	valid |-> $past (rd_en,2); 
endproperty

assert property (mem)
$display("PASS:  read response occurs only after 2 cycles a read request.
  clk=%0t",$time);
else 
$error("FAIL:  read response occurs only after 2 cycles a read request.
 clk=%0t",$time);
endmodule

 



//9:check that memory output remains stable when no read occurs.

module top;

bit clk,rd_en,ready;
int rdata;


always #5  clk =~clk;
initial begin
clk=0;
rd_en=0;
@(negedge clk);

rd_en=1;
repeat (10)begin
@(negedge clk);
rdata=$urandom_range(10,50);
end
rd_en=0;
repeat (10)begin
@(negedge clk);
rdata=$urandom_range(10,100);
end

#100;
$finish;
end

property mem;
	@(posedge clk) 
	!rd_en |=> $stable(rdata);
endproperty

assert property (mem)
$display("PASS:memory output remains stable when no read occurs  clk=%0t",$time);
else 
$error("FAIL: memory output remains stable when no read occurs clk=%0t",$time);
Endmodule
OUTPUT:
 

//10:Check that reset disables memory operations.
module top;

bit clk,rst,wr_en,rd_en;


always #5  clk =~clk;
initial begin
clk=0;
rst=1;
rd_en=0;
wr_en=0;

#10;


rst=0;
rd_en=0;
wr_en=1;

#10;

rst=0;
rd_en=0;
wr_en=0;

#10;

rst=1;
rd_en=1;
wr_en=1;

#10;

rst=1;
rd_en=0;
wr_en=0;

#100;
$finish;
end

property mem;
	@(posedge clk) 
	rst |-> (!wr_en && !rd_en)
endproperty

assert property (mem)
$display("PASS: reset disables memory operations  clk=%0t",$time);
else 
$error("FAIL: reset disables memory operations clk=%0t",$time);
endmodule

 
