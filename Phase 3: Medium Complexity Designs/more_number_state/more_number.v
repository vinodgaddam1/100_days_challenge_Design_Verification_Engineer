`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2026 18:30:07
// Design Name: 
// Module Name: more_number
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


//Design a FSM which detect the sequence 1100,1010,1001
//Using Melay overlapping
module more_number(clk,rst,din,dout);
parameter S0= 7'b0000_001;
parameter S1= 7'b0000_010;
parameter S2= 7'b0000_100;
parameter S3= 7'b0001_000;
parameter S4= 7'b0010_000;
parameter S5= 7'b0100_000;
parameter S6= 7'b1000_000;
input clk;
input rst;
input din;
output reg dout;
reg [6:0]state;
reg [6:0]next_state;


//state 
always @(posedge clk)begin
	if(rst)begin
	state<=S0;	
	end
	else begin
	state<=next_state;
	end
end

//next_state logic
always @(*)begin
	case(state)
		S0:begin
		       if(din)
                         next_state=S1;
		       else
		         next_state=S0;	       
		end
		S1:begin
		       if(din)
                         next_state=S2;
		       else
		         next_state=S4;	       

		end
		S2:begin
		       if(din)
                         next_state=S1;
		       else
		         next_state=S3;	       
		end
		S3:begin
		       if(din)
                         next_state=S5;
		       else
		         next_state=S6;	       
		end
		S4:begin
		       if(din)
                         next_state=S5;
		       else
		         next_state=S6;	       
		end
		S5:begin
		       if(din)
                         next_state=S2;
		       else
		         next_state=S4;	       
		end
		S6:begin
		       if(din)
                         next_state=S1;
		       else
		         next_state=S0;	       
		end
		default: next_state=S0;
	endcase

end

//Output logic
always @(*)begin
if(rst)
dout=S0;
else
	case(state)
	S3: begin
		if(din)
		dout=0;
		else
		dout=1;
	end
        S5:begin
                if(din)
	        dout=0;
	        else
	        dout=1;
	        end
        S6:begin
		if(din)
		dout=1;
		else
		dout=0;
	end
default:dout=0;
endcase
end
endmodule

