`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2026 19:49:33
// Design Name: 
// Module Name: design5
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


/*   Implement the following function using only
 2:1 mux (1) a'b ,a+b' 
         (a) Take A as select line
         (b) Take B as select line*/

module mux3(
input  a,b,
output reg y
);
  always @(a,b,y)begin 
    if (a==0)                      //(1a) a'b a is selected line
       y= 0;
    else 
      y=b;
      end
endmodule
module mux3(
input  a,b,
output reg y
);
  always @(a,b,y)begin 
    if (b==0)                      //(1b) a'b b is selected line
       y= 0;
    else 
      y=~a;
      end
endmodule
module mux3(
input  a,b,
output reg y
);
  always @(a,b,y)begin 
    if (a==0)                      //(2a) a+b' a is selected line
       y= ~b;
    else 
      y=1;
      end
endmodule
module mux3(
input  a,b,
output reg y
);
  always @(a,b,y)begin 
    if (b==0)                      //(2b) a+b' b is selected line
       y= a;
    else 
      y=1;
      end
endmodule
