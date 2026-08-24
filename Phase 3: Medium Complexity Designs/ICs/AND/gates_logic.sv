/*==========================================================================
                       Logic_gates_ICs
============================================================================
****************************************************************************
                         IC.number IC7408(AND) 
****************************************************************************
             +---------+
  PIN   1  --|         |-- 14 PIN
  PIN   2  --|         |-- 13 PIN
  PIN   3  --|  7408   |-- 12 PIN
  PIN   4  --|         |-- 11 PIN
  PIN   5  --|         |-- 10 PIN
  PIN   6  --|         |--  9 PIN
  PIN   7  --|         |--  8 PIN
             +---------+

*/

module IC7408(
input PIN1,
input PIN2,
output PIN3,

input PIN4,
input PIN5,
output PIN6,


input PIN10,
input PIN9,
output PIN8,

input PIN12,
input PIN13,
output PIN11,

input PIN7,
input PIN14
);
logic GND; 
logic VCC;
assign PIN3 = PIN1 & PIN2;

assign PIN6 = PIN4 & PIN5;


assign PIN8 = PIN10 & PIN9;

assign PIN11 = PIN12 & PIN13;
 

endmodule









































