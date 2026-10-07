`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2026 19:44:37
// Design Name: 
// Module Name: design2
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


// Implement all logic gates using 2:1 mux
module logic_gates(
input a,b,sel1,
output y_and,y_or,y_not,y_buffer,y_nand,y_nor,y_xor,y_xnor
);
  
    
    //AND gate uisng 2:1 MUX                    
  assign y_and= a?b:0;
    //OR gate uisng 2:1 MUX
  assign y_or= a?1:b;
    //NOT gate uisng 2:1 MUX
  assign y_not= a?0:1;
    //BUFFER gate uisng 2:1 MUX
  assign y_buffer= a?1:0;
    //NAND gate uisng 2:1 MUX
  assign y_nand= a?~b:1;
    //NOR gate uisng 2:1 MUX
  assign y_nor= a?0:~b;
    //XOR gate uisng 2:1 MUX
  assign y_xor= a?~b:b;
    //XNOR gate uisng 2:1 MUX
  assign y_xnor= a?b:~b;
  
endmodule
  
  
