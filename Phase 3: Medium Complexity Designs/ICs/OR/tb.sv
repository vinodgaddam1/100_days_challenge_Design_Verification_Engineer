/***************************************************************************
 * Testbench Name : tb
 * Description    :
 *   Testbench for verifying the functionality of the IC7432
 *   (74LS32 quad 2-input OR gate).
 *
 * Author         : GADDAM VINOD KUMAR
 * Date           : 22 AGU 2026
 *
 * Details:
 *   - Instantiates the IC7432 DUT.
 *   - PIN7 is connected to GND (logic 0).
 *   - PIN14 is connected to VCC (logic 1).
 *   - Generates random input combinations for all four OR gates.
 *   - Monitors input and output pins using $monitor.
 *   - Runs 10 random test cases with a #1 time-unit delay.
 *
 * OR Gate Connections:
 *   PIN1  + PIN2  -> PIN3
 *   PIN4  + PIN5  -> PIN6
 *   PIN9  + PIN10 -> PIN8
 *   PIN12 + PIN13 -> PIN11
 *
 ***************************************************************************/


module tb;
logic PIN1;
logic PIN2;
logic PIN3;

logic PIN4;
logic PIN5;
logic PIN6;


logic PIN9;
logic PIN10;
logic PIN8;


logic PIN12;
logic  PIN13;
logic PIN11;

logic PIN7;
logic PIN14;


IC7432 dut(
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
	$monitor("PIN1=%0b | PIN2=%0b | PIN3=%0b | PIN4=%0b | PIN5=%0B | PIN6=%0B | GND =%0B | PIN9=%0B | PIN10=%0B | PIN8=%0B | PIN13=%0B | PIN12=%0B | PIN11=%0B | PIN14=%0B",PIN1,PIN2,PIN3,PIN4,PIN5,PIN6,PIN7,PIN9,PIN10,PIN8,PIN13,PIN12,PIN11,PIN14);
	repeat(10)begin
{PIN1,PIN2,PIN4,PIN5,PIN9,PIN10,PIN12,PIN13}=$urandom;
#1;
end
end
endmodule
