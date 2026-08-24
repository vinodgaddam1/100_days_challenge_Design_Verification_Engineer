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

logic PIN12;
logic PIN13;
logic PIN11;

logic PIN7;
logic PIN14;

IC7408 dut(.PIN1(PIN1),.PIN2(PIN2),.PIN3(PIN3),.PIN4(PIN4),.PIN5(PIN5),.PIN6(PIN6),.PIN7(PIN7),.PIN8(PIN8),.PIN9(PIN9),.PIN10(PIN10),.PIN11(PIN11),.PIN12(PIN12),.PIN13(PIN13),.PIN14(PIN14));

initial begin
	PIN7=1'b0;
	PIN14=1'b1;
	$monitor("PIN1=%0b | PIN2=%0b | PIN3=%0b | PIN4=%0b | PIN5=%0b | PIN6=%0b | GND=%0b | PIN8=%0b | PIN9=%0b | PIN10=%0b | PIN11=%0b | PIN12=%0b | PIN13=%0b | VCC=%0b ",PIN1,PIN2,PIN3,PIN4,PIN5,PIN6,PIN7,PIN8,PIN9,PIN10,PIN11,PIN12,PIN13,PIN14);
	repeat(10)begin
{PIN1,PIN2,PIN4,PIN5,PIN10,PIN9,PIN12,PIN13} = $random;
#1;
end
end
endmodule

