module boot_multiplier #(
parameter N=4
)
(
	input clk,
	input rst,
	input start,

	input signed [N-1:0]multiplicand,
	input signed [N-1:0]multiplier,

	output reg signed [2*N-1:0]product,
	output reg busy,
	output reg done
);
reg signed [N-1:0]A;
reg signed [N-1:0]M;
reg signed [N-1:0]Q;

reg Q_1;

reg[$clog2(N+1)-1:0]count;


always @(posedge clk)begin
	if (rst)begin
		A        <=0;
		M        <=0;
		Q        <=0;
		Q_1      <=0;
		count    <=0;
		product  <=0;
		done     <=0;
		busy     <=0;
	end
        else begin
             done <=0;
                 //load
		 if(start && !busy)begin
			 A <=4'B0000;
			 M <=multiplicand;
			 Q <=multiplier;
			 Q_1<=1'b0;
			 count<=0;
			 busy<=1'b1;
		 end
		 else if (busy)begin
                 case ({Q[0],Q_1})

			 2'b01:
			 A<=A+M;
			 2'b10:
			 A<=A-M;
			 default:A<=A;
		 endcase
                 {A,Q,Q_1}<={A,Q,Q_1}>>>1;

		 if(count==3)begin
			 product<={A,Q};
			 busy<=0;
			 done<=1;
		 end
		 else begin
			 count<=count+1;
		 end
		 end

	end
end
endmodule












































