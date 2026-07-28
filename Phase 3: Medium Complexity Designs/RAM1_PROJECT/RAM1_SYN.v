`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2026 22:52:10
// Design Name: 
// Module Name: RAM1_SYN
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

    parameter WIDTH = 8;
    parameter DEPTH = 16;
    parameter ADDR  = $clog2(DEPTH);

    reg clk;
    reg rst;
    reg w_r;
    reg [ADDR-1:0] addr;
    reg [WIDTH-1:0] wdata_in;

    wire [WIDTH-1:0] rdata_out;

    integer i;

    // DUT
    synchronous_RAM #(
        .WIDTH(WIDTH),
        .DEPTH(DEPTH),
        .ADDR(ADDR)
    ) dut (
        .clk(clk),
        .rst(rst),
        .w_r(w_r),
        .addr(addr),
        .wdata_in(wdata_in),
        .rdata_out(rdata_out)
    );

    // Clock: 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test
    initial begin

        // Initial values
        rst      = 1;
        w_r      = 0;
        addr     = 0;
        wdata_in = 0;

        // Reset
        repeat(2) @(posedge clk);

        @(negedge clk);
        rst = 0;


        // =========================
        // WRITE OPERATION
        // =========================

        for (i = 0; i < DEPTH; i = i + 1) begin

            @(posedge clk);

            w_r      = 1;
            addr     = i;
            wdata_in = $random;

            @(posedge clk);

        end


        // =========================
        // READ OPERATION
        // =========================

        for (i = 0; i < DEPTH; i = i + 1) begin

            @(posedge clk);

            w_r  = 0;
            addr = i;

            @(posedge clk);
            #1;

            $display(
                "Time=%0t | Address=%0d | Read Data=%h",
                $time, addr, rdata_out
            );

        end


        @(posedge clk);

        w_r      = 0;
        addr     = 0;
        wdata_in = 0;

        #20;
        $finish;

    end

endmodule