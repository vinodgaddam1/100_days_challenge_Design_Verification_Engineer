`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 19:06:38
// Design Name: 
// Module Name: design4
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


/* Design a circuit to detect the decimal number 1,3,5,7,and 9
 in a 1-nibble (4-bits) 5211 BCD inputs.*/
module circuit2 (
  input a,b,c,d,
output f
);
  assign f = ~a&(c^d) | a &(~(c^d));
endmodule

  TB



`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 19:07:25
// Design Name: 
// Module Name: tb4
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
  reg a,b,c,d;
  wire f;
  circuit2 dut (.a(a),.b(b),.c(c),.d(d),.f(f));
  initial begin
    $monitor("Time=%0t,a=%b,b=%b,c=%b,d=%b,f=%b",$time,a,b,c,d,f);
    //this all are equal to 5211
    a=0;b=0;c=0;d=1;#10; //(0001)1=1
    a=0;b=0;c=1;d=0;#10; //(0010)2=1
    a=0;b=1;c=0;d=1;#10; //(0101)5=3
    a=0;b=1;c=1;d=0;#10; //(0110)6=3
    a=1;b=0;c=0;d=0;#10; //(1000)8=5
    a=1;b=1;c=0;d=0;#10; //(1100)12=7
    a=1;b=0;c=1;d=1;#10; //(1011)11=7
    a=1;b=1;c=1;d=1;#10; //(1111)15=9
    // this all are equal to 5211  but not my minterms
    a=0;b=0;c=1;d=1;#10; //(0011)3=2
    a=0;b=1;c=0;d=0;#10; //(0100)4=2
    a=1;b=1;c=0;d=1;#10; //(1101)13=8
    $finish; 
  end
endmodule
