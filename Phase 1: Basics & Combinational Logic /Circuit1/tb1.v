`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 20:01:34
// Design Name: 
// Module Name: tb1
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
  reg g0,g1,g2,g3;
  wire y;

  // Connect the 4 bits into the vector input
  circuit1 dut (.g({g3,g2,g1,g0}), .y(y));

  initial begin
    $monitor("time=%0t g3=%b g2=%b g1=%b g0=%b y=%b",
             $time,g3,g2,g1,g0,y);

    // Apply test vectors
    g3=0; g2=1; g1=1; g0=1; #10; // Gray 0111-7 (decimal 5)
    g3=0; g2=1; g1=0; g0=1; #10; // Gray 0101-5 (decimal 6)
    g3=0; g2=1; g1=0; g0=0; #10; // Gray 0100-4 (decimal 7)
    g3=1; g2=1; g1=0; g0=0; #10; // Gray 1100-12 (decimal 8)
    g3=1; g2=1; g1=0; g0=1; #10; // Gray 1101-13 (decimal 9)
    g3=1; g2=1; g1=1; g0=1; #10; // Gray 1111-15 (decimal 10)
    g3=1; g2=0; g1=0; g0=1; #10; // Gray 1001 =!-9 my minterm (decimal 14)
    g3=0; g2=0; g1=1; g0=1; #10; // Gray 0011 =!-3 my minterm (decimal 2)
  end
endmodule

