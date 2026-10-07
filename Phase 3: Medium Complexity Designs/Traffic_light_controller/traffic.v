`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2026 19:37:43
// Design Name: 
// Module Name: traffic
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

/*/Traffic Light Controller
                  +--------------------------+
                  | Traffic Light Controller |
                  |                          |
 clk -----------> |                          |
 rst -----------> |                          |
                  |                          |
                  +--------------------------+
                     |     |     |      |
                     |     |     |      |
                  NS_G   NS_Y  EW_G   EW_Y
*/

module traffic_light(clk,rst,time_done,NS_G,NS_Y,NS_R,EW_G,EW_Y,EW_R);
//one hot coding
parameter S0=3'b000;
parameter S1=3'b001;
parameter S2=3'b010;
parameter S3=3'b100;
input clk,rst;
input time_done;
output reg NS_G;
output reg NS_Y;
output reg NS_R;
output reg EW_G;
output reg EW_Y;
output reg EW_R;

reg[2:0]state;
reg[2:0]next_state;

always @(posedge clk)begin
	if (rst)begin
         state<=S0;
	end
	else begin
	state<=next_state;	
	end
end

//Next_state logic
always @(*)begin
case(state)
	S0:begin
		if(time_done)
		 next_state<=S1;	
		else
		 next_state<=S0;	
	    end       

	S1:begin
		if(time_done)
		 next_state<=S2;	
		else
		 next_state<=S1;	
	    end       

	S2:begin
		if(time_done)
		 next_state<=S3;	
		else
		 next_state<=S2;	
	    end       

	S3:begin
		if(time_done)
		 next_state<=S0;	
		else
		 next_state<=S3;	
	    end       
     default:next_state<=S0;
endcase
end


//Output logic
always@(*)begin
//default_value
NS_R=0;
NS_Y=0;
NS_G=0;
EW_R=0;
EW_Y=0;
EW_G=0;
case(state)
	S0:begin
        NS_G=1;
	EW_R=1;
	end
	S1:begin
        NS_Y=1;
	     EW_R=1;
	end
	S2:begin
        NS_R=1;
	    EW_G=1;
        end
	S3:begin
        NS_R=1;
	EW_Y=1;
	end
endcase	
end
endmodule
