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

