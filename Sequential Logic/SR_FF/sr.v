
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

//TB
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
