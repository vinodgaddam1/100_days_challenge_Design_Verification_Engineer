`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2026 22:52:40
// Design Name: 
// Module Name: RAM2
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


/*                +----------------------+
                  |   Synchronous RAM    |
                  |                      |
 addr ----------->| Address              |
 wdata_in ------->| Write Data           |
 w_r ------------>| Read / Write         |
 clk ------------>| Clock                |
 rst ------------>| Reset                |
                  |                      |
                  |   mem[0]  [7:0]      |
                  |   mem[1]  [7:0]      |
                  |   mem[2]  [7:0]      |
                  |      ...             |
                  |   mem[15] [7:0]      |
                  |                      |
                  +----------+-----------+
                             |
                             v
                         rdata_out
                         
                         
   */                      




module synchronous_RAM #(
    parameter WIDTH = 8,
    parameter DEPTH = 16,
    parameter ADDR  = $clog2(DEPTH)
)(
    input                  clk,
    input                  rst,
    input                  w_r,        // 1 = Write, 0 = Read
    input  [ADDR-1:0]      addr,
    input  [WIDTH-1:0]     wdata_in,
    output reg [WIDTH-1:0] rdata_out
);

    // Memory Array
    reg [WIDTH-1:0] mem [0:DEPTH-1];

    integer i;

    always @(posedge clk) begin

        if (rst) begin

            rdata_out <= {WIDTH{1'b0}};

            for (i = 0; i < DEPTH; i = i + 1)
                mem[i] <= {WIDTH{1'b0}};

        end
        else begin

            if (w_r == 1'b1) begin
                // WRITE operation
                mem[addr] <= wdata_in;
            end
            else begin
                // READ operation
                rdata_out <= mem[addr];
            end

        end

    end

endmodule










