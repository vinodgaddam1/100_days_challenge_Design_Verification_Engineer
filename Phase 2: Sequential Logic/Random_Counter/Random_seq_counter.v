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





