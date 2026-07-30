`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2026 19:57:36
// Design Name: 
// Module Name: tb2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//Testbanch
module tb;
parameter WIDTH=8;
  parameter DEPTH=16;
  parameter ADDR=$clog2(DEPTH);
  reg clk;
  reg rst;
  reg w_r;
  reg [WIDTH-1:0]wdata_in; 
  reg [ADDR-1:0]addr;
  wire ready;
  wire [WIDTH-1:0] rdata_out;
  reg valid;
  integer i;
  syn_RAM dut(.clk(clk),.rst(rst),.w_r(w_r),.wdata_in(wdata_in),.addr(addr),.ready(ready),.rdata_out(rdata_out),.valid(valid));

//clock genration time_period=10ns  
initial begin
clk=0;
forever #5 clk=~clk;
end

//Main testcase
initial begin
	reset();

 //read  & write 0 to  depth 
	write(0,DEPTH);
    read(0,DEPTH);	
        $finish;
end

//Write opearion
task write(input reg [ADDR-1:0]start_addr,input reg [ADDR:0] number_writes);
begin
for(i=start_addr;i<start_addr+number_writes;i=i+1)begin
@(posedge clk);
w_r=1;
valid=1;
addr=i;
wdata_in=$random;
wait (ready==1);
end
@(posedge clk);
valid=0;
end
endtask

task read(input reg [ADDR-1:0]start_addr,input reg [ADDR:0] number_read);
begin
for(i=start_addr;i<start_addr+number_read;i=i+1)begin
@(posedge clk);
w_r=0;
valid=1;
addr=i;
wait (ready==1);
end
@(posedge clk);
valid=0;
end
endtask



//Reset 
task reset();
begin
	rst=1;
	#20; @(posedge clk);
	rst=0; @(posedge clk);
end
endtask
endmodule




















