`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.07.2026 19:16:53
// Design Name: 
// Module Name: latch
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

// Implementing latches
/*/NOR_SR_LATCH
module sr_latch_nor(input s,r,output reg q=0);
  always @(*)begin
    if(s==0 && r==0)
      q=q;
    else if (s==0 && r==1)
      q=0;
    else if (s==1 && r==0)
      q=1;
    else  if (s==1 && r==1)
      q=1'bx;
  end
endmodule

//NAND_SR_LATCH
module sr_latch_nand(input s,r,output reg q);
  always @(*)begin
    case({s,r})
      2'b00: q=1'bx;
      2'b01: q=1;
      2'b10: q=0;
      2'b11: q=q;
      default:q=1'b0;
    endcase
  end
endmodule

//NOR_RS_LATCH
module rs_latch_nor(input s,r,output q,output qbor);
  nor (q,s,qbor);
  nor (qbor,r,q);
endmodule
*/
//NAND_RS_LATCH
module rs_latch_nand(input s,r,output q,output qbor);
  nand (q, r, qbor);   
  nand (qbor, s, q); 
endmodule

