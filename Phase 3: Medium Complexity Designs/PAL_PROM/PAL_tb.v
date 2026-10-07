module tb;
reg A,B,C;
wire X,Y;
PAL dut(.*);
initial begin
	$monitor("A=%b | B=%b | C=%b | X=%b | Y=%b | P1=%b | P2=%b | P3=%b | P4=%b",A,B,C,X,Y,dut.P1,dut.P2,dut.P3,dut.P4);
repeat (10)begin
	{A,B,C}=$random;
	#1;
end
end
endmodule













