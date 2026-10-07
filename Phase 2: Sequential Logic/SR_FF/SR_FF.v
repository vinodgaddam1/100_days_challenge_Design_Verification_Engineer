`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2026 19:42:15
// Design Name: 
// Module Name: SR_FF
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


//Implememting flip-flop-sr
module sr_ff(input s,r,rst,clk,output reg q);
  always @(posedge clk)begin  
    if (rst)begin //synchronous
      q<=0;
    end
    else begin
    case({s,r})
      2'b00 : q<=q;//hold
      2'b01 : q<=0;//reset
      2'b10 : q<=1;//set
      2'b11 : q<=1'bx;//invalid
      default: q<=1'b0;
    endcase
    end
  end
endmodule
