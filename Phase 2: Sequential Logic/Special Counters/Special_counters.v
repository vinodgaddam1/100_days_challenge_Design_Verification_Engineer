`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.07.2026 18:05:04
// Design Name: 
// Module Name: Special_counters
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

/*/Decade/BCD Counter
module Special_counters(
input clk,rst,
output reg [4:0]count
    );
    always @(posedge clk)begin
    if(rst)
    count<=0;
    else if(count==9)
    count<=0;
    else
    count<=count+1;
    end
endmodule

//Frequency Divider Counter
module Special_counters (clk,rst,clk_out);
input clk,rst;
output reg clk_out;
    integer count;
    parameter DIV=10;
    always @(posedge clk)begin
    if(rst)begin
    count<=0;
    clk_out<=0;
    end
    else if(count==(DIV/2)-1)begin    
    count<=0;
    clk_out<=~clk_out;
    end
    else
    count<=count+1;
    end
endmodule

//Programmable Mod-N Counter
module Special_counters(clk,rst,count);
parameter N =10;
parameter WIDTH= 4;
input clk,rst;
output reg [WIDTH-1:0]count;
    always @(posedge clk)begin
    if(rst)
    count<=0;
    else if(count==N-1)
    count<=0;
    else
    count<=count+1;
    end
endmodule
//Loadable Counter
module Special_counters(clk,rst,count,load,load_data);
parameter WIDTH= 4;
input clk,rst,load;
input  [3:0]load_data;
output reg [WIDTH-1:0]count;
    always @(posedge clk)begin
    if(rst)
    count<=0;
    else if(load)
    count<=load_data;
    else
    count<=count+1;
    end
endmodule

//Timer Counter
module Special_counters(
input clk,rst,
output reg done
);
reg [3:0]count;
    always @(posedge clk)begin
    if(rst)begin
    count<=0;
    done<=0;
    end
    else if (count==9) begin
    count<=0;
    done<=1;
    end
    else begin
    count<=count+1;
    done<=0;
    end
    end
endmodule

//Pluse Counter
module Special_counters(
input pluse,rst,
output reg [4:0]count
    );
    always @(posedge pluse)begin
    if(rst)
    count<=0;
    else
    count<=count+1;
    end
endmodule

//Event Counter (incrementing 1 when event=1)
module Special_counters(
input clk,rst,
input event1,
output reg [7:0]count
    );
    always @(posedge clk)begin
    if(rst)
    count<=0;
    else if(event1) 
    count<=count+1;
    end
endmodule

//Ring counter
module Special_counters(
input clk,rst,
output reg [3:0]count
    );
    always @(posedge clk)begin
    if(rst)
    count<=4'b0001;
    else if(count==4)begin
    count<=4'b0001;
    end
    else
    count<=count+1;  
    //count<={count[1:0],count[3:2]};//-------->  0001 to 0100
    end
endmodule


//Johnson Counter Twisted Ring Counter 
module Special_counters(
input clk,rst,
output reg [3:0]count
    );
    always @(posedge clk)begin
    if(rst)
    count<=4'b0000;
    else  
    count<={count[2:0],~count[3]};//-------->  0000 to 1000
    end
endmodule

//Gray Counter 
module Special_counters(
input clk,rst,
output reg [3:0]count,
output [3:0]gray
    );
    assign gray=count^(count>>1);
    always @(posedge clk)begin
    if(rst)
    count<=0;
    else  
    count<=count+1;// 1_bit changes
    end
endmodule
*/
//LFSR Counter (Linear Feedback Shift Register)
module Special_counters(
input clk,rst,
output reg [3:0]count
    );
    wire feedback;
    assign feedback=count[3]^count[2];
    always @(posedge clk)begin
    if(rst)
    count<=4'b0001;
    else  
    count<={count[2:0],feedback};// 0001--> 0010-->0101
    end
endmodule



