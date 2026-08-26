//TB
module tb;

logic PIN1;
logic PIN2;
logic PIN3;



logic PIN4;
logic PIN5;
logic PIN6;



logic PIN10;
logic PIN9;
logic PIN8;



logic PIN13;
logic PIN12;
logic PIN11;



logic PIN7;
logic PIN14;


IC7400 dut(
	.PIN1(PIN1),
	.PIN2(PIN2),
	.PIN3(PIN3),
	.PIN4(PIN4),
	.PIN5(PIN5),
	.PIN6(PIN6),
	.PIN7(PIN7),
	.PIN8(PIN8),
	.PIN9(PIN9),
	.PIN10(PIN10),
	.PIN11(PIN11),
	.PIN12(PIN12),
	.PIN13(PIN13),
	.PIN14(PIN14)	
);

initial begin


PIN7=1'B0;
PIN14=1'B1;

$monitor("PIN1=%0B | PIN2=%0B | PIN3=%0B | PIN4=%0B | PIN5=%0B | PIN6=%0B |  GND=%0B | PIN10=%0B | PIN9=%0B | PIN8=%0B | PIN13=%0B | PIN12=%0B | PIN11=%0B | VCC=%0B",PIN1,PIN2,PIN3,PIN4,PIN5,PIN6,PIN7,PIN10,PIN9,PIN8,PIN13,PIN12,PIN11,PIN14);
repeat(10)begin
{PIN1,PIN2,PIN4,PIN5,PIN9,PIN10,PIN13,PIN12}=$urandom_range(10,20);
#1;
end
end
endmodule
