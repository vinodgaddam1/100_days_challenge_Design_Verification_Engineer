`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 19:32:28
// Design Name: 
// Module Name: tt3
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
  reg [7:0] a;
  reg [3:0] sel;
  wire y;

  mux8 uut (.a(a), .sel(sel), .y(y));

  initial begin
    $monitor("Time=%0t | a=%b | sel=%b | y=%b", $time, a, sel, y);

    a = 4'b1; 

    sel = 3'b000; #10;
    sel = 3'b001; #10;
    sel = 3'b010; #10;
    sel = 3'b011; #10;

    $finish;
  end
endmodule
