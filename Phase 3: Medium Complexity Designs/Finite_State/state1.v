`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2026 18:15:31
// Design Name: 
// Module Name: State
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
/*/design a seq detector for 1011
module melay_overlapping(clk,rst,in,out);
input clk,rst,in;
output reg out;
//Enocde the States
parameter S0=2'b00;
parameter S1=2'b01;
parameter S2=2'b10;
parameter S3=2'b11;


//Declartion Register
reg [1:0]state;
reg [1:0]next_state;

//State Register
always @(posedge clk)begin
	if(rst)begin
        state<=0;
	end
	else begin
		state<=next_state;
	end
end

//Next_state_Logic
always @(*)begin
case(state)
	S0: begin
		if(in)
			next_state<=S1;
	        else
			next_state<=S0;
	end
	S1: begin
		if(in)
			next_state<=S1;
	        else
			next_state<=S2;
	end
	S2: begin
		if(in)
			next_state<=S3;
	        else
			next_state<=S0;
	end
	S3: begin
		if(in)
			next_state<=S1;
	        else
			next_state<=S2;
	end
	default:next_state<=S0;
endcase
end

//Output_logic
always @(*)begin
out=0;
case(state)
	S3:
	if(in)begin
		out=1;
	end
        else begin
		out=0;
	end

default:out=0;
endcase
end
endmodule



//design a seq detector for 1011 mealy_overlapping_not_allowed
module melay__non_overlapping(clk,rst,in,out);
input clk,rst,in;
output reg out;
//Enocde the States
parameter S0=2'b00;
parameter S1=2'b01;
parameter S2=2'b10;
parameter S3=2'b11;


//Declartion Register
reg [1:0]state;
reg [1:0]next_state;

//State Register
always @(posedge clk)begin
	if(rst)begin
        state<=0;
	end
	else begin
		state<=next_state;
	end
end

//Next_state_Logic
always @(*)begin
case(state)
	S0: begin
		if(in)
			next_state<=S1;
	        else
			next_state<=S0;
	end
	S1: begin
		if(in)
			next_state<=S1;
	        else
			next_state<=S2;
	end
	S2: begin
		if(in)
			next_state<=S3;
	        else
			next_state<=S0;
	end
	S3: begin
		if(in)
			next_state<=S0;  //Non_Overlapping
	        else
			next_state<=S2;
	end
	default:next_state<=S0;
endcase
end

//Output_logic
always @(*)begin
out=0;
case(state)
	S3:
	if(in)begin
		out=1;
	end
        else  begin
		out=0;
	
	end
default:out=0;
endcase
end
endmodule


//design a seq detector for 1011 moore_non_overlapping
module moore__non_overlapping(clk,rst,in,out);
input clk,rst,in;
output reg out;
//Enocde the States
parameter S0=3'b000;
parameter S1=3'b001;
parameter S2=3'b010;
parameter S3=3'b011;
parameter S4=3'b100;

//Declartion Register
reg [2:0]state;
reg [2:0]next_state;

//State Register
always @(posedge clk)begin
	if(rst)begin
        state<=0;
	end
	else begin
		state<=next_state;
	end
end

//Next_state_Logic
always @(*)begin
case(state)
	S0: begin
		if(in)
			next_state<=S1;
	        else
			next_state<=S0;
	end
	S1: begin
		if(in)
			next_state<=S1;
	        else
			next_state<=S2;
	end
	S2: begin
		if(in)
			next_state<=S3;
	        else
			next_state<=S0;
	end
	S3: begin
		if(in)
			next_state<=S4;
	        else
			next_state<=S2;
	end
	S4: begin
		if(in)
			next_state<=S0;
	        else
			next_state<=S0;
	end
	default:next_state<=S0;
endcase
end

//Output_logic
always @(*)begin
out=0;
case(state)
	S4:
	if(in)begin
		out=1;
	end
        else begin
		out=0;

	end
default:out=0;
endcase
end
endmodule
*/

//design a seq detector for 1011 moore_overlapping_allowed
module moore_overlapping(clk,rst,in,out);
input clk,rst,in;
output reg out;
//Enocde the States
parameter S0=3'b000;
parameter S1=3'b001;
parameter S2=3'b010;
parameter S3=3'b011;
parameter S4=3'b100;



//Declartion Register
reg [2:0]state;
reg [2:0]next_state;

//State Register
always @(posedge clk)begin
	if(rst)begin
        state<=0;
	end
	else begin
		state<=next_state;
	end
end

//Next_state_Logic
always @(*)begin
case(state)
	S0: begin
		if(in)
			next_state<=S1;
	        else
			next_state<=S0;
	end
	S1: begin
		if(in)
			next_state<=S1;
	        else
			next_state<=S2;
	end
	S2: begin
		if(in)
			next_state<=S3;
	        else
			next_state<=S0;
	end
	S3: begin
		if(in)
			next_state<=S4;
	        else
			next_state<=S2;
	end
	S4: begin
		if(in)
			next_state<=S1;
	        else
			next_state<=S2;
	end
	default:next_state<=S0;
endcase
end

//Output_logic
always @(*)begin
out=0;
case(state)
	S4:
	if(in)begin
		out=1;
	end
        else begin
		out=0;
	
	end
default:out=0;
endcase
end
endmodule























































