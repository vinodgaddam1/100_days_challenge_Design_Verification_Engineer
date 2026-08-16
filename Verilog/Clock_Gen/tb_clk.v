/**************************************************************************
                            CLOCK GENRATION
***************************************************************************
Important VLSI Conversions:
| From  | To       |
| ----- | -------- |
| 1 GHz | 1000 MHz |
| 1 MHz | 1000 kHz |
| 1 ms  | 1000 µs  |
| 1 µs  | 1000 ns  |
| 1 ns  | 1000 ps  |
| 1 ps  | 1000 fs  |


 Note:Formula:T=1/F ,F=1/T

| Frequency | Period |
| --------- | ------ |
| 1 GHz     | 1 ns   |
| 500 MHz   | 2 ns   |
| 250 MHz   | 4 ns   |
| 200 MHz   | 5 ns   |
| 100 MHz   | 10 ns  |
| 50 MHz    | 20 ns  |
| 25 MHz    | 40 ns  |
| 10 MHz    | 100 ns |

Note:Interview Shortcut:
1.Frequency(MHz)= 1000/Period(nsec)
2.Period(nsec)= 1000/Frequency(MHz)
3.Duty Cycle =THIGH/T*100
    --->T=THIGH+TLOW
4.High Time 
    THIGH=DUTY/100*T
5.LOW TIME
    TLOW=T-THIGH
6.Clock Divider
        by 2 input 100MHz
7.Skew
     Skew=T2-T1
8.Jitter
     Jitter=|Actual - Ideal|
9.Setup Slack
     Slack=Required - Arrival
10.Hold Slack
     Slack = Arrival - Required

Common Interview Questions:
---------------------------
Practice answering these without a calculator:
100 MHz → ? ns (10 ns)
250 MHz → ? ns (4 ns)
400 MHz → ? ns (2.5 ns)
5 ns → ? MHz (200 MHz)
8 ns → ? MHz (125 MHz)
20 ns → ? MHz (50 MHz)
Duty cycle: High = 3 ns, Period = 10 ns (30%)
Divide 200 MHz by 8 (25 MHz)
PLL: 50 MHz × 6 (300 MHz)
Skew: 4.8 ns and 5.1 ns (0.3 ns)
FOUT=FIN*M/N
----->FIN=Input frequency
----->M=Multiplication Factor
----->N=Division factor



1.always #delay
HIGH = 5 ns
LOW = 5 ns
Period = 10 ns
Frequency = 100 MHz
Duty cycle = 50%
Use: Testbench only ❌ synthesizable

`timescale 1ns/1ns 
module tb;
reg clk=0;
always  begin #5 clk=~clk; end
initial begin
$monitor("clock=%0d",clk);
#100;
$finish;
end
endmodule

2.Forever loop
HIGH = 10 ns
LOW = 10 ns
Period = 20 ns
Frequency = 50 MHz
Duty cycle = 50%
Use: Testbench only ❌ synthesizable

 
`timescale 1ns/1ns
module tb;
reg clk;
initial begin
	clk=0;
	forever #10 clk=~clk;
	$display("Clock=%0d",clk);
end
initial begin
	$monitor("Clock=%0d",clk);
	#200;
	$finish;
end
endmodule


3.forloop loop
HIGH = 0.5 ns
LOW = 0.5 ns
Period = 1 ns
Frequency = 1GHz 
Duty cycle = 50%
Use: Testbench only ❌ synthesizable


`timescale 1ns/1ps
module tb;
reg clk;
integer i;
initial begin
	clk=0;
	for(i=0;i<20;i=i+1)
	#0.5 clk=~clk;
end
initial begin
	$monitor("Clock=%0d",clk);
end
endmodule

4.while loop
HIGH = 0.2 ns
LOW = 0.2 ns
Period = 0.4 ns
Frequency = 2.5GHz 
Duty cycle = 50%
Use: Testbench only ❌ synthesizable


`timescale 1ns/1ps
module tb;
reg clk;
integer i;
initial begin
	clk=0;
	i=0;
	while(i<20)
	#0.2 clk=~clk;
	i=i+1;
end
initial begin
	$monitor("Clock=%0d",clk);
	#100;
	$finish;
end
endmodule


5.repeat loop()
HIGH = 100 ns
LOW = 100 ns
Period = 200 ns
Frequency = 5MHz 
Duty cycle = 50%
Use: Testbench only ❌ synthesizable

`timescale 1ns/1ps
module tb;
reg clk;
initial begin
	clk=0;
	repeat(50)begin
		#100 clk=~clk;
	end
end
initial begin
	$monitor("Clock=%0d",clk);
	#100;
end
endmodule















































































































