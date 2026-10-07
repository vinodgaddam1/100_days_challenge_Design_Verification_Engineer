`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2026 19:45:16
// Design Name: 
// Module Name: tb2
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


module tb;
 reg a,b,sel1;
 wire y_and,y_or,y_not,y_buffer,y_nand,y_nor,y_xor,y_xnor ;
  logic_gates dut(
    .a(a),
    .b(b),
    .sel1(sel1),
    .y_and(y_and),
    .y_or(y_or),
    .y_not(y_not),
    .y_buffer(y_buffer),
    .y_nand(y_nand),
    .y_nor(y_nor),
    .y_xor(y_xor),
    .y_xnor(y_xnor) 
  );
  initial begin
    $monitor("Time=%0t,a=%b,b=%b,sel1=%b,y_and=%b,y_or=%b,y_not=%b,y_buffer=%b,y_nand=%b,y_nor=%b,y_xor=%b,y_xnor=%b",$time,a,b,sel1,y_and,y_or,y_not,y_buffer,y_nand,y_nor,y_xor,y_xnor);
    sel1=1'b1;
    
    a=1'b0;b=1'b0;#10;
    a=1'b0;b=1'b1;#10;
    a=1'b1;b=1'b0;#10;
    a=1'b1;b=1'b1;#10;
    //a=1'bx;b=1'bx;#10;
  end
endmodule
