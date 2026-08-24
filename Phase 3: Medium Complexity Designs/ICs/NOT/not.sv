/***************************************************************************
 * Module Name : IC7404
 * Description :
 *   Behavioral representation of the 74LS04 hex inverter IC.
 *
 * Author      : GADDAM VINOD KUMAR
 * Date        : 23 AUG 2026
 *
 * Details:
 *   - Contains six independent NOT gates (inverters).
 *   - PIN1  -> PIN2
 *   - PIN3  -> PIN4
 *   - PIN5  -> PIN6
 *   - PIN9  -> PIN8
 *   - PIN11 -> PIN10
 *   - PIN13 -> PIN12
 *   - PIN7  : GND
 *   - PIN14 : VCC
 *
 * Function:
 *   Each output is the logical complement of its corresponding input.
 *
 *   PIN2  = ~PIN1
 *   PIN4  = ~PIN3
 *   PIN6  = ~PIN5
 *   PIN8  = ~PIN9
 *   PIN10 = ~PIN11
 *   PIN12 = ~PIN13
 *
 ***************************************************************************/
module IC7404(

input PIN1,
output reg PIN2,


input PIN3,
output reg PIN4,


input PIN5,
output reg PIN6,


input PIN9,
output reg PIN8,


input PIN11,
output reg PIN10,


input PIN13,
output reg PIN12,


input PIN7,
input PIN14

);

always @(*)begin

PIN2 = ~PIN1;

PIN4 = ~PIN3;

PIN6 = ~PIN5;

PIN8 = ~PIN9;

PIN10 = ~PIN11;

PIN12 = ~PIN13;
end
endmodule



















