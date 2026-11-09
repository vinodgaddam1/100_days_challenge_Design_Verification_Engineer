/********************************************************************************
                    Packages In SystemVerilog
*************************************************************************************
//1.Example: package with parameter and function,classes

package pg;
	//Parameter
	parameter int N=8;

	//function
	function automatic int add(int a,b);
		return a+b;
	endfunction

        //class
	class trans;
 
        rand int addr;
        rand int data;
           

	function void print ();
		$display("ADDR = %0d | DATA = %0d",addr,data);
	endfunction

	constraint cg{
	addr inside {[10:50]};
	data inside {[10:50]};
	}
        endclass

endpackage


module top;
import pg::*;
trans tx;
initial begin
	$display("N=%0d",N);
	$display("SUM=%0d",add(10,20));
	
	//scope resolution operator(::)
	//$display("N=%0d",pg::N);
	//$display("SUM=%0d",pg::add(10,20));
	repeat (10)begin	
tx=new();
assert(tx.randomize());
tx.print();
end
end
endmodule

//OUTPUT:
# N=8
# SUM=30
# ADDR = 22 | DATA = 16
# ADDR = 48 | DATA = 26
# ADDR = 47 | DATA = 14
# ADDR = 12 | DATA = 50
# ADDR = 33 | DATA = 15
# ADDR = 28 | DATA = 44
# ADDR = 24 | DATA = 18
# ADDR = 14 | DATA = 40
# ADDR = 31 | DATA = 31
# ADDR = 20 | DATA = 50


//Multi package
package pg1;
function void name1();
	$display("Package-1");
endfunction
endpackage 



package pg2;
function void name2();
	$display("Package-2");
endfunction
endpackage 


module top;
import pg1::*;
import pg2::*;
initial begin
name1;
name2;
end
endmodule

OUTPUT:
# Package-1
# Package-2

*/

//Nested Package 


package pg1;

function void name1();
	$display("package-1");
endfunction
endpackage 



package pg2;
	import pg1::*;
function void name2();
	$display("package-2");
endfunction
endpackage 



package pg3;
	import pg2::*;
function void name3();
	$display("package-3");
endfunction
endpackage 



module top;
initial begin
	pg1::name1;
	pg2::name2;
	pg3::name3;
end
endmodule
OUTPUT:
# package-1
# package-2
# package-3


