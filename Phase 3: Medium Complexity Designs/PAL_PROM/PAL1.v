/*************************************************************************
              Implementation of a Full Adder Using a PAL
***************************************************************************/
module PAL_FULL_ADDER(
input X,Y,Cin,
output sum,cout
);
wire P1,P2,P3,P4,P5,P6,P7;

assign P1= ~X & ~Y & Cin;
assign P2= ~X & Y & ~Cin;
assign P3= X & ~Y & ~Cin;
assign P4=  X & Y & Cin;
assign P5=  X &  Cin;
assign P6=  Y & Cin;
assign P7=  X & Y ;

assign  sum = P1 | P2 | P3 | P4;
assign cout = P5 | P6 | P7 ;

endmodule






















