==========================================================================	    SystemVerilog Constraints problems Level-8
==========================================================================

//81:Generate values 0, 1, and 2 with relative weights 50, 30, and 20.
class sample;
rand int out;
function void print();
	$display(" out=%0d ",out);	
endfunction

constraint a_c{
out  dist {0:=50,1:=30,2:=20};
}

endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule

//82:Give values 1 through 5 equal weights.
class sample;
rand int out;
function void print();
	$display(" out=%0d ",out);	
endfunction

constraint a_c{
out  dist {1:=1,2:=1,3:=1,4:=1,5:=1};
}

endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule


//83:Give values 0 through 3 a total distribution weight of 100.
class sample;
rand int out;
function void print();
	$display(" out=%0d ",out);	
endfunction

constraint a_c{
out  dist {[0:3]:/100};
}

endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule


//84:Generate a 4-bit value without repeating values until the available cycle is exhausted.

class sample;
randc  bit[3:0] out;
function void print();
	$display(" out=%0d ",out);	
endfunction

constraint a_c{
out inside {[0:50]};
}

endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule


//85: Create a soft constraint that defaults a variable to 10–20.

class sample;
rand  int a;
function void print();
	$display(" a=%0d ",a);	
endfunction

constraint a_c{
soft  a inside {[10:20]};
}

endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule

//86:Override a soft constraint with a conflicting hard constraint.
class sample;
rand  int a;
function void print();
	$display(" a=%0d ",a);	
endfunction

constraint a_c{
soft  a inside {[10:20]};
}

endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize() with {a==50;})begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule


//87:Generate a mode that prefers 0 over 1.(weighted distribution)
class sample;
rand  int a;
function void print();
	$display(" a=%0d ",a);	
endfunction

constraint a_c{
  a dist {0:=2,1:=1};
}

endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule


//88:Generate a number where values 1–10 have greater weight than values 50–60.
class sample;
rand  int a;
function void print();
	$display(" a=%0d ",a);	
endfunction

constraint a_c{
  a dist {[1:10]:/2,[50:60]:/1};
}

endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule


//89:Create two constraints that conflict and observe randomization failure.
class sample;
rand  int a;
function void print();
	$display(" a=%0d ",a);	
endfunction

constraint a_c{
  a >10;
}
constraint b_c{
  a <5;
}

endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule
*/
//90:Use solve...before to change the distribution of dependent variables.
class sample;
rand  int a,b;
function void print();
	$display(" a=%0d ",a);	
	$display(" b=%0d ",b);	
endfunction

constraint a_c{
	a inside {[10:50]};
	b inside {[10:50]};
   a<b;
  solve a before b ;
}

endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule
