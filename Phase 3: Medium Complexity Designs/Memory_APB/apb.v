`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.08.2026 12:42:29
// Design Name: 
// Module Name: apb
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

//memory apb
module apb(PCLK,PRESETn,PADDR,PWDATA,PRDATA,PWRITE,PSELx,PREADY,PENABLE);
parameter WIDTH=8;
parameter DEPTH=16;
parameter ADDR=$clog2(DEPTH);
input PCLK;
input PRESETn;
input [ADDR-1:0]PADDR;
input [WIDTH-1:0]PWDATA;
input PSELx;
input PWRITE;
input PENABLE;
output reg [WIDTH-1:0]PRDATA;
output reg PREADY; 
integer i;
//Memory 
reg [WIDTH-1:0]mem[0:DEPTH-1];


always @(posedge PCLK or negedge PRESETn)begin
	if(!PRESETn)begin
	PRDATA<=0;
	PREADY=0;
	for(i=0;i<DEPTH;i=i+1)
        mem[i]<=0;	
      	end  
        else begin
	PREADY<=0;
	if (PSELx && PENABLE) begin
		    PREADY<=1;
		    if(PWRITE)
	                mem[PADDR]<=PWDATA;
		    else //write=0
                        PRDATA<=mem[PADDR];
	end
	else begin
            PREADY<=0;
        end
       end
end
endmodule





