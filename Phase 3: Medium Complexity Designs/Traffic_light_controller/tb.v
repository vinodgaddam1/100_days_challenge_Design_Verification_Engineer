`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2026 19:37:56
// Design Name: 
// Module Name: tb
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

//traffic lights
module tb;
parameter S0=3'b000;
parameter S1=3'b001;
parameter S2=3'b010;
parameter S3=3'b100;
reg clk,rst;
reg time_done;
wire  NS_G;
wire  NS_Y;
wire  NS_R;
wire  EW_G;
wire  EW_Y;
wire  EW_R;
traffic_light dut(clk,rst,time_done,NS_G,NS_Y,NS_R,EW_G,EW_Y,EW_R);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin	
rst=1;
time_done=0;
#10;
rst=0;
input_logic();
#10;
#500;
$finish;
end
initial begin
$monitor("Time=%0t,rst=%0b,time_done=%0b,NS_G=%0b,NS_Y=%b,NS_R=%b,EW_G=%b,EW_Y=%b,EW_R=%b,state=%b",$time,rst,time_done,NS_G,NS_Y,NS_R,EW_G,EW_Y,EW_R,dut.state);
end

task input_logic();
begin
// S0 -> S1
@(posedge clk);
time_done = 1;
@(posedge clk);
time_done = 0;

// S1 -> S2
@(posedge clk);
time_done = 1;
@(posedge clk);
time_done = 0;

// S2 -> S3
@(posedge clk);
time_done = 1;
@(posedge clk);
time_done = 0;

// S3 -> S0
@(posedge clk);
time_done = 1;
@(posedge clk);
time_done = 0;
end
endtask

endmodule










