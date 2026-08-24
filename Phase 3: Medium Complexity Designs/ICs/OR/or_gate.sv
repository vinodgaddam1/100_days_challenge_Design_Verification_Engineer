/***************************************************************************
 * Module Name : IC7432
 * Description :
 *   Behavioral representation of the 74LS32 quad 2-input OR gate IC.
 *
 * Author      :GADDAM VINOD KUMAR
 * Date        :22 AGU 2026
 *
 * Details:
 *   - Contains four independent 2-input OR gates.
 *   - PIN1  and PIN2  -> PIN3
 *   - PIN4  and PIN5  -> PIN6
 *   - PIN9  and PIN10 -> PIN8
 *   - PIN12 and PIN13 -> PIN11
 *   - PIN7  : GND
 *   - PIN14 : VCC
 *
 ***************************************************************************/
module IC7432(
input PIN1,
input PIN2,
output PIN3,

input PIN4,
input PIN5,
output PIN6,


input PIN9,
input PIN10,
output PIN8,


input PIN12,
input  PIN13,
output PIN11,


input PIN7,
input PIN14
);




or g3(PIN3,PIN1,PIN2);
or g4(PIN6,PIN4,PIN5);


or g5(PIN8,PIN10,PIN9);
or g6(PIN11,PIN12,PIN13);


endmodule
































