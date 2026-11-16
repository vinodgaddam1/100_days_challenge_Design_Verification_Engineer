`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 19:19:51
// Design Name: 
// Module Name: dd
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

// implementing type-3 mux delay based
module ring_oscillator_mux(
output y_output
);
  wire y1,y2;
  assign #5 y1=y_output?1:0;
  assign #7 y2=y1?0:1;
  assign #8 y_output= y2?1:0;
endmodule



Tb


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 19:20:07
// Design Name: 
// Module Name: tt
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
  wire y_output;
  ring_oscillator_mux dut (.y_output(y_output));

  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    $monitor("Time=%0t, y_output=%b", $time, y_output);

    // Kick-start the oscillator
    force dut.y1 = 0;
    #20 release dut.y1;  // hold longer than the largest delay

    #200 $finish;
  end
endmodule
