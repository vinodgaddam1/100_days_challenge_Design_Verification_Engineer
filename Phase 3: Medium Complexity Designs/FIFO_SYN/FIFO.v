`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.07.2026 23:01:27
// Design Name: 
// Module Name: FIFO
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


//FIFOi
module FIFO(clk,rst,cs,wr_en,rd_en,data_in,data_out,full,empty);
parameter FIFO_DEPTH=8;
parameter DATA_WIDTH=32;
parameter FIFO_DEPTH_LOG=$clog2(FIFO_DEPTH);//000--111
input clk;
input rst;
input cs;
input wr_en;
input rd_en;
input [DATA_WIDTH-1:0]data_in;
output reg [DATA_WIDTH-1:0]data_out;
output full;
output empty;
reg [DATA_WIDTH-1:0]mem[0:FIFO_DEPTH-1];
reg [FIFO_DEPTH_LOG:0]write_pointer;//4bit
reg [FIFO_DEPTH_LOG:0]read_pointer;//4bit
always @(posedge clk)begin
	if (rst)begin
           write_pointer<=0;
             data_out<=0;	   
	end
       else if (cs && wr_en && !full)begin
            mem[write_pointer[FIFO_DEPTH_LOG-1:0]]<=data_in;
            write_pointer<=write_pointer+1;

       end
       end
always @(posedge clk)begin
	if (rst)begin
           read_pointer<=0;	   
	end
       else if (cs && rd_en && !empty)begin
           data_out<= mem[read_pointer[FIFO_DEPTH_LOG-1:0]];
            read_pointer<=read_pointer+1;

       end
       end
assign empty=(read_pointer==write_pointer);  
assign full=(read_pointer=={~write_pointer[FIFO_DEPTH_LOG],write_pointer[FIFO_DEPTH_LOG-1:0]});//1000---->0000 last bit changes  
endmodule