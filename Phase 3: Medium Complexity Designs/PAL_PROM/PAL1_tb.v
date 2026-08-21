module tb;
reg X,Y,Cin;
wire sum,cout;
PAL_FULL_ADDER dut(.*);
initial begin
$monitor("X=%b | Y=%b | CIN=%b | SUM=%b | COUT=%b | P1=%b | P2=%b | P3=%b | P4=%b | P5=%b | P6=%b | P7=%b ",X,Y,Cin,sum,cout,dut.P1,dut.P2,dut.P3,dut.P4,dut.P5,dut.P6,dut.P7);
	repeat (10)begin
	{X,Y,Cin}=$random;
	#1;
	end
end
endmodule





















