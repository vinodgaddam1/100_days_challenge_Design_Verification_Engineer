`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.07.2026 18:47:56
// Design Name: 
// Module Name: registers
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

//SIPO - Serial In → Parallel Out
module Registers(
input clk,rst,
input din,
output reg [3:0] q
    );
    always @(posedge clk)begin
    if(rst)
    q<=4'b0000;
    else
    q<={q[2:0],din}; //0011-->one bit at a time
    end
endmodule


/*/PISO - Parallel In → Serial Out
module Registers(
input clk,rst,
input [3:0]din,
input load,
output dout
    );
    reg  [3:0]q;
    always @(posedge clk)begin
    if(rst)
    q<=4'b0000;
    else if (load)
    q<=din;
    else
    q<={q[2:0],1'b0}; //0011-->one bit at a time
    end
    assign dout=q[3];
endmodule

//PIPO Parallel load and Parallel Out
module Registers(
input clk,rst,
input [3:0]din,
output reg  [3:0]q
    );
    always @(posedge clk)begin
    if(rst)
    q<=4'b0000;
    else
    q<=din;
    end
endmodule
*/

//Tb

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.07.2026 18:48:18
// Design Name: 
// Module Name: tb13
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
/////////////////////////////////////////////////////////////////////////////////
module tb13;
//reg clk,rst,load;
reg clk,rst;
reg din;
wire  [3:0]q;
//Registers dut(.clk(clk),.rst(rst),.din(din),.q(q));
//Registers dut(.clk(clk),.rst(rst),.din(din),.dout(dout),.load(load));
Registers dut(.clk(clk),.rst(rst),.din(din),.q(q));
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
//$monitor("Time=%0t,rst=%b,din=%b,dout=%b,load=%b",$time,rst,din,dout,load);
$monitor("Time=%0t,rst=%b,din=%b,q=%b",$time,rst,din,q);
rst=1;
din=0;
//load=0;
#10;
rst=0;
//load=1;
//din=4'b1101;
//#10;
//load=0;
repeat (4)begin
din=$random;
#10;
//din=4'b0110;
//load=1;
//#10;
//load=0;
end
rst=1;
#10;
rst=0;
repeat (4)begin
din=$random;
//load=0;
//rst=1;
//#20;
//rst=0;
//load=0;
end
#100;
$finish;
end
endmodule
