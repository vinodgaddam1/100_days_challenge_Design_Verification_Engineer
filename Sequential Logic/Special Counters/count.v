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



//TB
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
