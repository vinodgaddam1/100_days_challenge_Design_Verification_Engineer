module tb;
reg [1:0]X;
wire SUM,CARRY;
PROM_4x2_Half dut(.*);
initial begin
	$monitor("X=%B ,SUM=%B,CARRY=%B",X,SUM,CARRY);
	repeat(10)begin
		X=$random;
		#1;

	end
end
endmodule
