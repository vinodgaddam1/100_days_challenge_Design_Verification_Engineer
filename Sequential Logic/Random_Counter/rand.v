`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 18:20:53
// Design Name: 
// Module Name: Random_seq_counter
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

/*/0 → 3 → 6 → 9 → 12 → 15 → 0
module Random_seq_counter(
input clk,rst,
output reg [3:0]count
    );
    always @(posedge clk)begin
    if(rst)
    count<=0;
    else if(count==15)
    count<=0;
    else
    count<=count+3; 
    end
endmodule
//5 → 10 → 15 → 20 → 25 → 30 → 5
module Random_seq_counter(
input clk,rst,
output reg [5:0]count
);
always @(posedge clk or posedge rst)begin
if (rst)
count<=5;
else if (count==30)
count<=5;
else
count<=count+5;
end
endmodule
//EVEN_COUNTER 0->2->4...20->0.
module EVEN_COUNTER(
input clk,rst,
output reg [4:0]count
    );
    always @(posedge clk or negedge rst)begin
    if(!rst)
    count<=0;
    else if(count==20)
    count<=0;
    else
    count<=count+2; 
    end
endmodule
*/
//ODD_COUNTER 1->3->5...19->1...
module ODD_COUNTER(
input clk,rst,
output reg [4:0]count
    );
    always @(posedge clk)begin
    if(!rst)
    count<=1;
    else if(count==19)
    count<=0;
    else
    count<=count+2; 
    end
endmodule
//TB
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 18:37:53
// Design Name: 
// Module Name: tb9
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
module tb();
reg clk,rst;
wire [4:0]count;
integer i;
//Random_seq_counter dut(.clk(clk),.rst(rst),.count(count));
//EVEN_COUNTER dut(.clk(clk),.rst(rst),.count(count));
ODD_COUNTER dut(.clk(clk),.rst(rst),.count(count));
initial begin
clk=0;
for(i=0;i<=500;i=i+1)//Using For to genrate the Clock 
#5 clk=~clk;
end
initial begin
$monitor("TIme=%0t,rst=%b,count=%b",$time,rst,count);
//rst=1; Active High
rst=0;
#20;
rst=1;
repeat (20)begin
#20;
end
rst=0;
#20;
rst=1;
repeat (5)begin
#20;
end
#50;
$finish;
end
endmodule
