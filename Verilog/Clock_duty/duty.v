
/***************************************************************************
                             Duty Cycle
****************************************************************************
1.Duty cycle 20%
HIGH = 2 ns
LOW = 8 ns
Period = 10 ns
Duty cycle = 20%

`timescale 1ns/1ns
module tb;
reg clk;
initial begin
clk=0;
forever begin
#8 clk=1;
#2 clk=0;
end
end
initial begin
	$monitor("clock=%0d",clk);
	#100;
	$finish;
end
endmodule

2.Duty Cycle
HIGH = 7 ns
LOW = 3 ns
Period = 10 ns
Duty cycle = 70%

`timescale 1ns/1ns
module tb;
reg clk;
initial begin
clk=0;
forever begin
#3 clk=1;
#7 clk=0;
end
end
initial begin
	$monitor("clock=%0d",clk);
	#100;
	$finish;
end
endmodule



*********************************************************************************                             High From Duty Cycle
*********************************************************************************
Give:
Duty Cycle=30%;
LOW=7ns
find:
HIGH=3
Period=14
Fre=

`timescale 1ns/1ns
module tb;
reg clk;
initial begin
clk=0;
forever begin
#3 clk=1;
#7 clk=0;
end
end
initial begin
	$monitor("clock=%0d",clk);
	#100;
	$finish;
end
endmodule

*********************************************************************************
                       Low from duty Cycle            
*********************************************************************************
1.Find LOW from duty Cycle
Given
Duty Cycle = 60%
HIGH       = 6 ns
Find:
LOW      = ?(4)
Period   = ?(10)
Frequency = ?(100MHz)
`timescale 1ns/1ns
module tb;
reg clk;
initial begin
clk=0;
forever begin
#4 clk=1;
#6 clk=0;
end
end
initial begin
	$monitor("clock=%0d",clk);
	#100;
	$finish;
end
endmodule


*********************************************************************************
                                   Jitter
*********************************************************************************
Meaning
Jitter = variation of a clock edge from its ideal/expected timing.
Jitter=|Tactual- Tideal|
Example:
Ideal=10nsec
Actual=10.2nsec
Find jitter?
Jitter=10.2-10===>0.2ns
HIGH = 5 ns
LOW  = 5 ns
Period = 10 ns
Jitter=2
`timescale 1ns/1ps
module tb;
reg clk;
initial begin
clk=0;
forever begin
#5.2 clk=1;
#4.8 clk=0;
#4.8 clk=1;
#5.2 clk=0;
end
end
initial begin
	$monitor("clock=%0d",clk);
	#100;
	$finish;
end
endmodule

*********************************************************************************                                Skew in Verilog
*********************************************************************************
Skew
Skew = difference in arrival time of the clock at two different destinations.
Clock at FF1 = 5.0 ns
Clock at FF2 = 5.4 ns
Skew=FF2-FF1
Skew=5.4-5.0 ==>0.4ns
*/
`timescale 1ns/1ps

module tb;

reg source_clk;

wire clk_a;
wire clk_b;

initial begin
    source_clk = 0;

    forever
        #5 source_clk = ~source_clk;
end

assign #1.0 clk_a = source_clk;
assign #1.4 clk_b = source_clk;
initial begin
	#100;
	$finish;
end
endmodule






















































































































