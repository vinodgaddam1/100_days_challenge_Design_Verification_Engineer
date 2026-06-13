`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2026 19:18:41
// Design Name: 
// Module Name: design6
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


/*Design a circuit that detect the number that user lower
  left in 7-segment dispaly for a 4-bit BCD code input*/
module circuit5(
  input a,b,c,d,
output y    
);                                  //      a     
  assign y = c&~d|~b&~d;            //    =====    
endmodule                           // b |     |
                                    //   |  g  | f
                                    //    =====
                                    // c |     |
                                    // --|     | e
                                    // |  =====
                                    // |    d
                                    // |
                                    // lower left segment
