/***************************************************************************
                       PAL(Programming array logic)
*****************************************************************************/

module PAL(
input A,B,C,
output X,Y
);
wire P1,P2,P3,P4;
assign P1 = A & B;
assign P2 = A & ~C;
assign P3 = A & ~B;
assign P4 = B & ~C;

assign X = P1 | P2 ;
assign Y = P3 | P4;
endmodule




































