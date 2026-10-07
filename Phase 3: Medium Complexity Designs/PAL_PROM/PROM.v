/***************************************************************************
                         Logic construction of 64x4 PROM
*****************************************************************************/
//decoder
module decoder_2x4(
input [1:0]X,
output reg [3:0]Y
);
always @(*)begin
	case(X)
	2'b00:Y=4'b0001;
	2'b01:Y=4'b0010;
	2'b10:Y=4'b0100;
	2'b11:Y=4'b1000;
	default:Y=4'b0000;
endcase
end
endmodule

//PROM
module PROM_4x2_Half(
input [1:0]X,
output SUM,CARRY
);
wire [3:0]Y;
decoder_2x4 u1(.X(X),.Y(Y));
assign SUM = Y[1] | Y[2];
assign CARRY = Y[3];
endmodule




























