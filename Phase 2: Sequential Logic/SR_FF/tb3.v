`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2026 19:42:42
// Design Name: 
// Module Name: tb3
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

reg s, r, clk, rst;
wire q;
integer i;

sr_ff dut (
    .s(s),
    .r(r),
    .clk(clk),
    .rst(rst),
    .q(q)
);

// Clock Generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Monitor
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    $monitor("Time=%0t clk=%b rst=%b s=%b r=%b q=%b",
              $time, clk, rst, s, r, q);
end

// Stimulus
initial begin
    // Initialize
    s = 0;
    r = 0;
    rst = 1;

    // Apply reset
    #10;
    rst = 0;

    // Apply all input combinations
    for (i = 0; i < 4; i = i + 1) begin
        {s, r} = i;
        #10;
    end

    #20;
    $finish;
end

endmodule
