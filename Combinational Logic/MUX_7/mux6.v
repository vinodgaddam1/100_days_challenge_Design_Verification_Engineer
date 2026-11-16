`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2026 19:18:06
// Design Name: 
// Module Name: sum
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


//Implementing Half Adder using 2:1 mux
module mux2to1(input a,b,sel,output y);
  assign y=sel ? b : a ;
endmodule


//Half adder sum---->when a==0 my output should be "b" 
//Half adder sum---->when a==1 my output should be "~b"
//Half adder carry---->when a==0 my output should be "0"
//Half adder carry---->when a==1 my output should be "b"

//sum
/*module sum1(input a,b,output sum1);
  mux2to1 u1(.sel(a),.b(~b),.a(b),.y(sum1));
endmodule*/

//carry
module carry1(input a,b,output carry);
  mux2to1 u1(.sel(a),.b(b),.a(1'b0),.y(carry));
endmodule











Tb


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2026 19:18:39
// Design Name: 
// Module Name: tt9
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
  reg a,b;
  wire carry;
  //wire sum1;
  carry1 dut(.a(a),.b(b),.carry(carry));
  //sum1 dut(.a(a),.b(b),.sum1(sum1));
  
  initial begin
    $monitor ("Time=%0t ,a=%b,b=%b,carry=%b",$time,a,b,carry);
  //  $monitor ("Time=%0t ,a=%b,b=%b,sum=%b",$time,a,b,sum1);
    repeat (10) begin
      {a,b}=$random;
      //sum1=$random;
      #1;
    end
  end
  
endmodule

