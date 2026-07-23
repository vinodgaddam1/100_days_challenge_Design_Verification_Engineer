`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.07.2026 18:05:23
// Design Name: 
// Module Name: tb11
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
//BCD _tb
/*module tb;
reg clk,rst;
wire[4:0]count;
Special_counters dut(.clk(clk),.rst(rst),.count(count));
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
$monitor("Time=%0t,rst=%b,count=%b",$time,rst,count);
rst=1;
#20;
rst=0;
repeat (10)begin
#10;
end
rst=1;
#20;
rst=0;
repeat(10)begin
#10;
end
#100;
$finish;
end
endmodule

//Frequency divider
module tb;
reg clk,rst;
wire clk_out;
parameter DIV=8;
Special_counters #(.DIV(8)) dut(.clk(clk),.rst(rst),.clk_out(clk_out));
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
$monitor("Time=%0t,rst=%b,count=%b,clk_out=%b",$time,rst,dut.count,clk_out);
rst=1;
#20;
rst=0;
repeat (10)begin
#10;
end
rst=1;
#20;
rst=0;
repeat(10)begin
#10;
end
#100;
$finish;
end
endmodule

//Programmable Mod-N Counter
module tb;
reg clk,rst;
wire [WIDTH-1:0]count;
parameter N =20;
parameter WIDTH= 5;
Special_counters #(.N(N),.WIDTH(WIDTH)) dut(.clk(clk),.rst(rst),.count(count));
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
$monitor("Time=%0t,rst=%b,count=%b",$time,rst,count);
rst=1;
#20;
rst=0;
repeat (10)begin
#10;
end
rst=1;
#20;
rst=0;
repeat(10)begin
#10;
end
#100;
$finish;
end
endmodule


//Loadable Counter
module tb;
reg clk,rst,load;
reg [3:0] load_data;
parameter WIDTH= 4;
wire [WIDTH-1:0]count;
Special_counters #(.WIDTH(WIDTH)) dut(.clk(clk),.rst(rst),.count(count),.load(load),.load_data(load_data));
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
$monitor("Time=%0t,rst=%b,count=%b,load=%b,load_data=%b",$time,rst,count,load,load_data);
rst=1;
#20;
rst=0;
load=1;
repeat (10)begin
load_data=$random;
#10;
end
rst=1;
#20;
rst=0;
load=0;
repeat(10)begin
load_data=$random;
#10;
end
#100;
$finish;
end
endmodule

//Timer Counter
module tb;
reg clk,rst;
wire done;
Special_counters dut(.clk(clk),.rst(rst),.done(done));
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
$monitor("Time=%0t,rst=%b,count=%d,done=%b",$time,rst,dut.count,done);
rst=1;
#20;
rst=0;
repeat (10)begin
#10;
end
rst=1;
#20;
rst=0;
repeat(10)begin
#10;
end
#100;
$finish;
end
endmodule

//Pluse Counter
module tb;
reg pluse,rst;
wire[4:0]count;
Special_counters dut(.pluse(pluse),.rst(rst),.count(count));
initial begin
pluse=0;
forever #5 pluse=~pluse;
end
initial begin
$monitor("Time=%0t,rst=%b,count=%b,pluse=%b",$time,rst,count,pluse);
rst=1;
#20;
rst=0;
repeat (10)begin
#10;
end
rst=1;
#20;
rst=0;
repeat(10)begin
#10;
end
#100;
$finish;
end
endmodule

//EVENT Counter
`timescale 1ns / 1ps

module tb;

reg clk;
reg rst;
reg event1;
wire [7:0] count;

Special_counters dut(
    .clk(clk),
    .rst(rst),
    .event1(event1),
    .count(count)
);

// Clock Generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Stimulus
initial begin

    $monitor("Time=%0t rst=%b event1=%b count=%0d",
              $time, rst, event1, count);

    // Apply Reset
    rst = 1;
    event1 = 0;
    #20;

    // Release Reset
    rst = 0;

    // Event Sequence
    event1 = 1; #10;   // count = 1
    event1 = 0; #10;   // count = 1
    event1 = 1; #10;   // count = 2
    event1 = 1; #10;   // count = 3
    event1 = 0; #10;   // count = 3
    event1 = 1; #10;   // count = 4
    event1 = 0; #20;

    // Apply Reset Again
    rst = 1;
    #20;
    rst = 0;

    // More Events
    event1 = 1; #10;   // count = 1
    event1 = 0; #10;
    event1 = 1; #10;   // count = 2
    event1 = 0; #20;

    $finish;

end

endmodule


//Ring counter
//Johnson Counter Twisted Ring Counter 
module tb;
reg clk,rst;
wire[3:0]count;
Special_counters dut(.clk(clk),.rst(rst),.count(count));
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
$monitor("Time=%0t,rst=%b,count=%b",$time,rst,count);
rst=1;
#20;
rst=0;
repeat (10)begin
#10;
end
rst=1;
#20;
rst=0;
repeat(10)begin
#10;
end
#100;
$finish;
end
endmodule

//Gray counter
module tb;
reg clk,rst;
wire [3:0]gray;
wire[3:0]count;
Special_counters dut(.clk(clk),.rst(rst),.count(count),.gray(gray));
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
$monitor("Time=%0t,rst=%b,count=%b,gray=%b",$time,rst,count,gray);
rst=1;
#20;
rst=0;
repeat (10)begin
#10;
end
rst=1;
#20;
rst=0;
repeat(10)begin
#10;
end
#100;
$finish;
end
endmodule
*/
//LFSR Counter (Linear Feedback Shift Register)
module tb;
reg clk,rst;
wire[3:0]count;
Special_counters dut(.clk(clk),.rst(rst),.count(count));
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
$monitor("Time=%0t,rst=%b,count=%b",$time,rst,count,);
rst=1;
#20;
rst=0;
repeat (10)begin
#10;
end
rst=1;
#20;
rst=0;
repeat(10)begin
#10;
end
#100;
$finish;
end
endmodule
















