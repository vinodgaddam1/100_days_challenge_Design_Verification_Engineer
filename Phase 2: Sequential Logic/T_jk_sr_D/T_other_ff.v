`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2026 18:42:03
// Design Name: 
// Module Name: T_other_ff
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

// Implementing  T_other flip_flops
module T_sr(
input clk,rst,
input s,r,
output reg q
);
  wire T;
  assign T=(s&~q)|(r&q);
  always @(posedge clk)
    begin
      if (rst)
        q<=1'b0;
      else if (s&&r)
        q<=1'bx;
      else if (T)
        q<=~q;
      else
        q<=q;
    end
endmodule

/*T_jk
module T_jk(
input clk,rst,
input j,k,
output reg q
);
  wire T;
  assign T=(j&~q)|(~k&q);
  always @(posedge clk)
    begin
      if (rst)
        q<=1'b0;
      else 
        q<=T;
    end
endmodule


//T_D
module T_D(
input clk,rst,
input D,
output reg q
);
  wire T;
 assign T=D^q;
  always @(posedge clk)
    begin
      if (rst)
        q<=1'b0;
      else if(T)
        q<=~q;
        else
        q<=q;
    end
endmodule
*/