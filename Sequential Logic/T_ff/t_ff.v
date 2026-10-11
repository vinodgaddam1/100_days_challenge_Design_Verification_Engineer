`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.07.2026 18:40:47
// Design Name: 
// Module Name: T_ff
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


//Implementing T-ff 
module T_ff(
  input rst,clk,
  input  T,
  output reg q
);
  always @(posedge clk)begin  //asy
    if (rst)
      q<=1'b0;
    else begin
      case(T)
        1'b0:q<=q;
        1'b1:q<=~q;
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
// Create Date: 13.07.2026 18:41:10
// Design Name: 
// Module Name: tb1
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
  reg rst,clk;
  reg  T;
  wire q;
  T_ff dut(.rst(rst),.clk(clk),.q(q),.T(T));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    rst=0;
    #10 rst=1;
    #10 rst=0;
    end
  initial begin
    T=0;
    $monitor("Time=%0t,rst=%b,T=%b,q=%b",$time,rst,T,q);
    repeat (10)begin
    T=$random &1;
      #10;
    end
    #20; $finish;
  end
endmodule
