`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2026 19:18:14
// Design Name: 
// Module Name: sy_asy
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

//Implementing Synchronous and Asynchronous using D-ff
/*/Synchronous Active low reset
module dff_active_low(
input rst,clk,d,
output reg q
);
  always @(negedge clk) begin
    if(!rst)
      q<=0;
    else
      q<=d;
  end
endmodule

//Synchronous Active High reset
module dff_active_high(
input rst,clk,d,
output reg q
);
  always @(posedge clk) begin
    if(rst)
      q<=0;
    else
      q<=d;
  end
endmodule


//Asynchronous Active High reset
module dff_active_high(
input rst,clk,d,
output reg q
);
  always @(posedge clk or posedge rst) begin
    if(rst)
      q<=0;
    else
      q<=d;
  end
endmodule
*/

//Asynchronous Active low reset
module dff_active_low(
input rst,clk,d,
output reg q
);
  always @(posedge clk or negedge rst) begin
    if(!rst)
      q<=0;
    else
      q<=d;
  end
endmodule

