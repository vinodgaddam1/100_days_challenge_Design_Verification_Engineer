/***************************************************************************
 * Testbench Name : tb
 * Description    :
 *   Testbench for the 74LS04 hex inverter IC.
 *
 * Author         : GADDAM VINOD KUMAR
 * Date           : 23 AUG 2026
 *
 * Details:
 *   - Drives all six logic inputs of IC7404 with random values.
 *   - Verifies the corresponding six inverted outputs.
 *   - PIN7  is connected to GND (0).
 *   - PIN14 is connected to VCC (1).
 *
 *   IC7404 Pin Mapping:
 *
 *   PIN1  -> PIN2
 *   PIN3  -> PIN4
 *   PIN5  -> PIN6
 *   PIN9  -> PIN8
 *   PIN11 -> PIN10
 *   PIN13 -> PIN12
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
logic PIN8;

logic PIN11;
logic PIN10;

logic PIN13;
logic PIN12;

logic PIN7;
logic PIN14;


//====================================================
//                    DUT
//====================================================

IC7404 dut (
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


//====================================================
//                 TEST GENERATION
//====================================================

initial begin

    // Power supply
    PIN7  = 1'b0;       // GND
    PIN14 = 1'b1;       // VCC

    $monitor(
        "PIN1=%0b | PIN2=%0b | "
        "PIN3=%0b | PIN4=%0b | "
        "PIN5=%0b | PIN6=%0b | "
        "GND=%0b | "
        "PIN9=%0b | PIN8=%0b | "
        "PIN11=%0b | PIN10=%0b | "
        "PIN13=%0b | PIN12=%0b | "
        "VCC=%0b",
        
        PIN1, PIN2,
        PIN3, PIN4,
        PIN5, PIN6,
        PIN7,
        PIN9, PIN8,
        PIN11, PIN10,
        PIN13, PIN12,
        PIN14
    );


    repeat(10) begin

        // Randomize six input pins
        {PIN1, PIN3, PIN5, PIN9, PIN11, PIN13} = $urandom;

        #1;

    end

    $finish;

end

endmodule





module tb;

logic PIN1;
logic PIN2;


logic PIN3;
logic PIN4;


logic PIN5;
logic PIN6;


logic PIN9;
logic PIN8;


logic PIN11;
logic PIN10;


logic PIN13;
logic PIN12;


logic PIN7;
logic PIN14;



 IC7404 dut (
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
$monitor("PIN1=%0B | PIN2=%0B | PIN3=%0B | PIN4=%0B | PIN5=%0B | PIN6=%0B | GND=%0B | PIN9=%0B | PIN8=%0B | PIN11=%0B | PIN10=%0B | PIN13=%0B | PIN12=%0B | VCC=%0B",PIN1,PIN2,PIN3,PIN4,PIN5,PIN6,PIN7,PIN9,PIN8,PIN11,PIN10,PIN13,PIN12,PIN14);

repeat(10)begin
{PIN1,PIN3,PIN5,PIN9,PIN11,PIN13}=$urandom;
#1;
end
end
endmodule 










