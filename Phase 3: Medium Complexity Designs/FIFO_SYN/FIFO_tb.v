`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.07.2026 23:01:49
// Design Name: 
// Module Name: FIFO_tb
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

module tb;
parameter FIFO_DEPTH=8;
parameter DATA_WIDTH=32;
parameter FIFO_DEPTH_LOG=$clog2(FIFO_DEPTH);//000--111
reg clk=0;
reg rst;
reg cs;
reg wr_en;
reg rd_en;
reg [DATA_WIDTH-1:0]data_in;
wire [DATA_WIDTH-1:0]data_out;
wire full;
wire empty;
integer i;

FIFO  #(.FIFO_DEPTH(FIFO_DEPTH),.DATA_WIDTH(DATA_WIDTH),.FIFO_DEPTH_LOG(FIFO_DEPTH_LOG)) dut (.clk(clk),.rst(rst),.wr_en(wr_en),.rd_en(rd_en),.data_in(data_in),.data_out(data_out),.full(full),.empty(empty),.cs(cs));
always begin #5 clk=~clk;end
task write_data(input [DATA_WIDTH-1:0] d_in);
begin
@(negedge clk);
cs=1;wr_en=1;
rd_en=0;
data_in=d_in;
$display($time,"write_data data_in=%0d",data_in);
@(posedge clk);
#1;
cs=1;wr_en=0;
@(negedge clk);
cs=0;wr_en=0;
end
endtask

task read_data();
begin
@(negedge clk);
cs=1;rd_en=1;
wr_en=0;
@(posedge clk);
$display($time,"read_data data_out=%0d",data_out);
#1;
cs=1;rd_en=0;
@(negedge clk);
cs=0;rd_en=0;
end
endtask


//simulation
initial begin
	#1;
rst=1;
wr_en=0;
rd_en=0;
cs=0;
data_in=0;
repeat(2)
@(posedge clk);
@(negedge clk);
rst=0;
//Case-I
write_data(1);
write_data(10);
write_data(100);
read_data();
read_data();
read_data();


//case-II //empty condition writing and reading ata time
for(i=0;i<FIFO_DEPTH;i=i+1)begin
write_data(2**i);
read_data();
end

//case-III //Full condition
for(i=0;i<FIFO_DEPTH;i=i+1)begin
write_data(2**i);
end

//case-IV    // empty condition
for(i=0;i<FIFO_DEPTH;i=i+1)begin
read_data();
end
#50;
$finish;
end
endmodule







