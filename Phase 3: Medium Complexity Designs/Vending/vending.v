module vending(clk,rst,coin5,coin10,dispence,change);
parameter S0=4'b0001;
parameter S1=4'b0010;
parameter S0=4'b0100;
parameter S0=4'b1000;
input clk,rst,coin5,coin10;
output reg dispence,change;
reg [2:0]state,next_state;

//state logic
always @(posedge clk)begin
	if(rst)begin
        state<=S0;
	end
        else begin
        state<=next_state;
	end
end

//Output logic
always @(*)begin
case(state)
	S0:
	if(coin5) begin
        next_state<=S1;
        end
	else if (coin10)begin
        next_state<= S2;		
	end
	else begin
        next_state<=S0;
	end
	S1:
	if(coin5) begin
        next_state<=S2;
        end
	else if (coin10)begin
        next_state<= S3;		
	end
        else begin
        next_state<=S0;
	end
	S2:
	if(coin5) begin
        next_state<=S3;
        end
	else if (coin10)begin
        next_state<= S3;		
	end
        else begin
        next_state<=S0;
	end
	S3: begin
		next_state<=S0;
	end
default:next_state<=S0;
end

//Output logic
always @(*)begin
if(rst)begin
   dispence=0;
   change=0;   
end
else begin
	case(state)
	S0:
	dispence=0;
        change=0;
	S1:
	dispence=0;
        change=0;
	S2:
	dispence=0;
        change=0;
	S3:
	dispence=1;
        change=0;
default:dispence=0;
        chnage=0;
end
endmodule


























