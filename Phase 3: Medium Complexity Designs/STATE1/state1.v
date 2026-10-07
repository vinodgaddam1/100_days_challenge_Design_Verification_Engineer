`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2026 19:17:14
// Design Name: 
// Module Name: state1
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


/*
| Present State | Toggle | Next State | Output |
| ------------- | ------ | ---------- | ------ |
| OFF           | 0      | OFF        | 0      |
| OFF           | 1      | ON         | 0      |
| ON            | 0      | ON         | 1      |
| ON            | 1      | OFF        | 1      |
*/

module toggle_fsm(
         input clk,
         input rst,
         input toggle,
         output reg out
);
parameter OFF=1'b0;
parameter ON=1'b1;

reg state;
reg next_state;

//////////////////////////////////////////////////////////
//                  1.State Register
//////////////////////////////////////////////////////////
always @(posedge clk or posedge rst)begin
if(rst)begin
state<=OFF;
end
else begin
state<=next_state;
end
end


////////////////////////////////////////////////////////
//                  2.Next State Logic
///////////////////////////////////////////////////////
always @(*)begin
case (state)
	OFF:begin
        if(toggle)
		next_state<=ON;
	else
	   next_state<=OFF;	   
	end
	ON:begin
	if(toggle)
		next_state<=OFF;
	else
	        next_state<=ON;
         end
        default:next_state<=OFF;

endcase
end


/////////////////////////////////////////////////////////
// Output Logic (Moore FSM)
/////////////////////////////////////////////////////////
always @(*)begin
	case(state)
	OFF: out=1'b0;
	ON:  out=1'b1;
	default: out=1'b0;
endcase
end
endmodule


