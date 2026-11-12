DPI (Direct Programming interface)

In systemverilog, DPI allows systemverilog code to communicate directly with programming languages such as C and C++,it is mainly used when we want to integrated External C/C++ functions into systemverilog.

 Types of DPI’s

1.DPI-C Import (call a C function from SV) 
2.DPI-C Export (Call a Sv function from C)

Import:
Import is used to when systemverilog wants to call a function implemented in C.
Syntax:
Import  “DPI-C” function return_type function_name (argument);

For Example:

C file.
#include <stdio.h>
int add(int a,int b){
return a+b;
}




SytemVerilog Code:

module top;
import "DPI-C" function int add(input int a,input int b);
int result;
initial begin
result = add(1,20);
$display("Addition = %0d",result);
end
endmodule
 
Example-2:

C file:
#include <stdio.h>

const char* checking_number(int a)
{
    if (a % 2 == 0)
        return "Even";
    else
        return "Odd";
}




SystemVerilog:

module top;
import "DPI-C" function string checking_number(input int a);
initial begin

$display("Checking_Number = %0s",checking_number(10));
$display("Checking_Number = %0s",checking_number(3));
end
endmodule


Export:
Export is used to when C wants to call a function implemented in SystemVerilog.

Syntax:
Export “DPI-C” function  function_name;

For Example:

C-file:
#include <stdio.h>
#include "svdpi.h"

// Declaration of exported SystemVerilog function
extern int multiply(int a, int b);

// C function
void call_sv_function()
{
    int result;

    printf("Calling SystemVerilog function from C\n");

    result = multiply(10, 20);

    printf("C Result = %d\n", result);
}


Sytemverilog code:

module top;

    // Export SV function to C
    export "DPI-C" function multiply;

    // Import C function into SV
    import "DPI-C" context function void call_sv_function();

    // SV function
    function int multiply(int a, int b);

        return a * b;

    endfunction

    initial begin

        $display("SV Result = %0d", multiply(5, 4));

        call_sv_function();

    end

endmodule





