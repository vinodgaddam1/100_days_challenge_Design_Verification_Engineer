=================================================
Types of Bins Creation in SystemVerilog
=================================================
1. Automatic Bins (Auto Bins)
SystemVerilog automatically creates bins for the values of a coverpoint when you don't define bins explicitly.

Example:
class sample;
  rand bit [1:0] data;
endclass

module top;
  sample s = new();

  covergroup cg;
    cp_data: coverpoint s.data;
  endgroup

  cg cov = new();

  initial begin
    repeat (10) begin
      assert(s.randomize());
      cov.sample();
      $display("data = %0d", s.data);
    end
    $display("Coverage = %0.2f%%", cov.get_coverage());
  end
endmodule

 

Example2:

class sample;
  rand int data;
  rand int addr;

  function void print();
	  $display("data=%0d",data);
	  $display("addr=%0d",addr);
  endfunction

  constraint a{
  data inside {[1:100]};
  addr inside {[1:100]};
  }

  covergroup sam;
	  coverpoint data{
	  }
	  coverpoint addr{
	  }
  endgroup

  function new();
	  sam=new();
  endfunction
endclass

module top;
sample s=new();
initial begin
	repeat(10)begin	
	assert(s.randomize());
	s.print();
	s.sam.sample();
end

end
endmodule
 

2. Explicit Bins (User-Defined Bins)
You manually define bins to group specific values.
For Example:
class sample;
  rand int data;
  rand int addr;

  function void print();
	  $display("data=%0d",data);
	  $display("addr=%0d",addr);
  endfunction

  constraint a{
  data inside {[1:100]};
  addr inside {[1:100]};
  }

  //Here not define bins 
  covergroup sam;
	  coverpoint data{
		  bins data1 = {[0:3]};
		  bins data2 = {[4:9]};

	  }
	  coverpoint addr{
		  bins addr1 = {[0:3]};
		  bins addr2 = {[4:9]};
	  }
  endgroup

  function new();
	  sam=new();
  endfunction
endclass

module top;
sample s=new();
initial begin
	repeat(10)begin	
	assert(s.randomize());
	s.print();
	s.sam.sample();
end

end
endmodule


 


3.Array Bins (static Array)
You can create multiple bins using an array declaration.
For Example:

class sample;
  rand int data;
  rand int addr;

  function void print();
	  $display("data=%0d",data);
	  $display("addr=%0d",addr);
  endfunction

  constraint a{
  data inside {[1:100]};
  addr inside {[1:100]};
  }

//3.Array bins creation (static array);
covergroup sam;
	  coverpoint data{
		  bins data1[5] = {[0:100]}; 
		  

	  }
	  coverpoint addr{
		  bins addr1[10] = {[0:32]};
	  }
  endgroup



  function new();
	  sam=new();
  endfunction
endclass

module top;
sample s=new();
initial begin
	repeat(10)begin	
	assert(s.randomize());
	s.print();
	s.sam.sample();
end

end
endmodule
 

2.Example: (Bins (dynamic Array)

class sample;
  rand int data;
  rand int addr;

  function void print();
	  $display("data=%0d",data);
	  $display("addr=%0d",addr);
  endfunction

  constraint a{
  data inside {[1:100]};
  addr inside {[1:100]};
  }

//3.Array bins creation (dynamic array);
covergroup sam;
	  coverpoint data{
		  bins data1[] = {[0:100]}; 
	  }
	  coverpoint addr{
		  bins addr1[] = {[0:32]};
	  }
  endgroup



  function new();
	  sam=new();
  endfunction
endclass

module top;
sample s=new();
initial begin
	repeat(10)begin	
	assert(s.randomize());
	s.print();
	s.sam.sample();
end

end
endmodule
 
class sample;
  rand int data;
  rand int addr;

  function void print();
	  $display("data=%0d",data);
	  $display("addr=%0d",addr);
  endfunction

  constraint a{
  data inside {[1:100]};
  addr inside {[1:100]};
  }

//3.Array bins creation (dynamic array with condtion);
covergroup sam;
	  coverpoint data{
		  bins data1[] = {[0:100]} with (item % 2==0); 
	  }
	  coverpoint addr{
		  bins addr1[] = {[0:32]} with (item %2 !=0);
	  }
  endgroup

  function new();
	  sam=new();
  endfunction
endclass

module top;
sample s=new();
initial begin
	repeat(10)begin	
	assert(s.randomize());
	s.print();
	s.sam.sample();
end

end
endmodule

 

Transition bin:

For Example:
module top;

  bit clk = 0;
  bit data;

  always #5 clk = ~clk;

  covergroup cg @(posedge clk);
    cp_data: coverpoint data {
      bins pattern_10010 = (1 => 0 => 0 => 1 => 0);
    }
  endgroup

  cg cov = new();

  initial begin
    data = 1;
    @(negedge clk); data = 0;
    @(negedge clk); data = 0;
    @(negedge clk); data = 1;
    @(negedge clk); data = 0;
    @(negedge clk);
    $display("Coverage = %0.2f%%", cov.get_coverage());
    $finish;
  end

endmodule
 

Default Bins:
The default bin collects values that are not matched by the other explicitly defined bins.
For Example:
class sample;
  rand int data;
  rand int addr;

  function void print();
	  $display("data=%0d",data);
	  $display("addr=%0d",addr);
  endfunction

  constraint a{
  data inside {[1:100]};
  addr inside {[1:100]};
  }

// Default Bins
covergroup sam;
	  coverpoint data{
		  bins data1[10] = default; 
		  
	  }
	  coverpoint addr{
		  bins addr1[10] =default; 
	  }
  endgroup


  function new();
	  sam=new();
  endfunction
endclass

module top;
sample s=new();
initial begin
	repeat(10)begin	
	assert(s.randomize());
	s.print();
	s.sam.sample();
end

end
endmodule


Note: To get this report you add run.do file “coverage report -details”  
 
Important: default bins collect values that are not covered by your explicitly defined bins, but they do not increase the coverage percentage.

Example 1: Default bin
covergroup cg;
  cp_data: coverpoint data {
    bins LOW = {[0:3]};
    bins HIGH = {[4:6]};
    bins OTHER = default;
  }
endgroup
Suppose data is a 3-bit variable, so it can take values from 0 to 7.
•	LOW covers values 0, 1, 2, 3.
•	HIGH covers values 4, 5, 6.
•	OTHER collects value 7,etc…
Suppose the simulation samples 0, 2, 4, 7.
Coverage is 100% of the ordinary bins because both LOW and HIGH were hit. The OTHER bin does not affect that percentage.
 
Ignore Bins
Ignore bins exclude specified values from coverage calculations.
For Example:
class sample;
  rand int data;
  rand int addr;

  function void print();
	  $display("data=%0d",data);
	  $display("addr=%0d",addr);
  endfunction

  constraint a{
  data inside {[1:2]};
  addr inside {[1:100]};
  }

//Ignore Bins
covergroup sam;
	  coverpoint data{
		  ignore_bins data1 = {[0:3]};
		  bins data2 = {[4:7]};
		
		   
		  
	  }
	  coverpoint addr{
		  bins addr1[2] =default; 
	  }
  Endgroup

  function new();
	  sam=new();
  endfunction
endclass

module top;
sample s=new();
initial begin
	repeat(10)begin	
	assert(s.randomize());
	s.print();
	s.sam.sample();
end

end
endmodule
 

 Illegal Bins
Illegal bins identify values that should not occur according to the verification specification.
For Example:

class sample;
  rand int data;
  rand int addr;

  function void print();
	  $display("data=%0d",data);
	  $display("addr=%0d",addr);
  endfunction

  constraint a{
  data inside {[1:2]};
  addr inside {[1:100]};
  }

//Illegal Bins
covergroup sam;
	  coverpoint data{
		  illegal_bins data1 = {[0:3]};
		  bins data2 = {[4:7]};
		
		   
		  
	  }
	  coverpoint addr{
		  bins addr1[2] =default; 
	  }
  Endgroup

  function new();
	  sam=new();
  endfunction
endclass

module top;
sample s=new();
initial begin
	repeat(10)begin	
	assert(s.randomize());
	s.print();
	s.sam.sample();
end

end
endmodule



