/*=========================================================================================================================
                                                      Compiler directives
===========================================================================================================================
***************************************************************************************************************************
| Directive                  | Description                                               | Example                        |
| -------------------------- | --------------------------------------------------------- | ------------------------------ |
| `` `define ``              | Defines a macro or constant.                              | `` `define WIDTH 8 ``          |
| `` `undef ``               | Undefines a previously defined macro.                     | `` `undef WIDTH ``             |
| `` `include ``             | Includes another Verilog file.                            | `` `include "module.v" ``      |
| `` `ifdef ``               | Compiles code if a macro is defined.                      | `` `ifdef DEBUG ``             |
| `` `ifndef ``              | Compiles code if a macro is **not** defined.              | `` `ifndef SYNTHESIS ``        |
| `` `else ``                | Alternative block in conditional compilation.             | Used with `ifdef` or `ifndef`. |
| `` `elsif ``               | Else-if condition for conditional compilation.            | `` `elsif TEST ``              |
| `` `endif ``               | Ends a conditional compilation block.                     | `` `endif ``                   |
| `` `timescale ``           | Specifies simulation time unit and precision.             | `` `timescale 1ns/1ps ``       |
| `` `default_nettype ``     | Sets the default type of undeclared nets.                 | `` `default_nettype none ``    |
| `` `celldefine ``          | Marks modules as library cells.                           | `` `celldefine ``              |
| `` `endcelldefine ``       | Ends the cell definition block.                           | `` `endcelldefine ``           |
| `` `resetall ``            | Resets all compiler directive settings to default values. | `` `resetall ``                |
| `` `unconnected_drive ``   | Specifies the value of unconnected input ports.           | `` `unconnected_drive pull0 `` |
| `` `nounconnected_drive `` | Disables `unconnected_drive`.                             | `` `nounconnected_drive ``     |
***************************************************************************************************************************


//`define-define a macro
`define WIDTH 8
module tb;
reg[`WIDTH-1:0]data;
initial begin
	data=8'hA2;
	$display("data=%h",data);
end
endmodule

Meaning: Wherever the compiler sees `WIDTH, it replaces it with 8.


//`undef - Remove a macro
`define WIDTH 8
module tb;
reg[`undef-1:0]data;
endmodule

`undef WIDTH
Meaning: After `undef WIDTH, the macro WIDTH no longer exists.




//`include "filename.v"
`include "def.v"
module tb;
reg [`WIDTH-1:0]data;
initial begin
data=8'hA2;
$display("data= %h",data);
end
endmodule

Meaning: The contents of def.v are inserted at the `include location.


//`ifdef-if is macro
`define DEBUG
module tb;
`ifdef DEBUG
initial begin
$display("DEBUG mode is ON");
`endif
end
endmodule

Meaning:Because DEBUG is defined, the initial block is compiled.

//`ifndef - if macro is NOT defined
`ifndef  WIDTH 
`define WIDTH 9
  `endif

module tb;
reg [`WIDTH-1:0]data;
endmodule

If WIDTH doesn't already exist, it gets defined as 8.

//`else - alternative condition
`define DEBUG
module tb;
`ifdef DEBUG
initial 
$display("Debug mode");
`else 
initial 
  $display("Normal mode");
  `endif
endmodule

Output:
Debug mode
If DEBUG is removed, it prints:
Normal mode


//`elsif -Else -if condition
`define TEST
module tb;
`ifdef DEBUG
initial 
$display("Debug mode");
`elsif TEST
initial 
$display("TEST mode");
`else 
initial 
$display("Normal mode");
`endif
endmodule

Since TEST is defined:
Test mode


//`timescale-simulation time unit and precision
`timescale 1ns/1ps
module tb;
reg clk;
initial begin
	clk=0;
	#5 clk=1;
	#5 clk=0;
	$monitor("clk=%d",clk);
end
endmodule


//`default_nettype - Control underclared nets
`default_nettype none

module tb(
    input a,
    input b,
    output y
);

assign y = a & b;

endmodule

`default_nettype wire

you must explicitly declare signals.
*/























