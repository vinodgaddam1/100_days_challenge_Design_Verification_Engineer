//==============================================================================
//                   SystemVerilog Coverage — Basic to Advanced
//===============================================================================

In SystemVerilog verification, coverage measures how thoroughly your design and verification environment have been exercised by simulation. It helps identify scenarios that your tests have covered and scenarios that are still missing.

//Types of Coverage
-----------------------------------------------------------------------------------------------------------------------------------------------------
| Coverage type       | Purpose                                                     | Example                                                       |
| ------------------- | ----------------------------------------------------------- | ------------------------------------------------------------- |
| Code Coverage       | Measures which parts of RTL code were exercised             | Whether both branches of an `if-else` executed                |
| Functional Coverage | Measures whether specified design scenarios occurred        | Whether a memory was tested with address 0 and address 255    |
| Assertion Coverage  | Tracks whether assertions were exercised and their outcomes | Whether a protocol assertion was evaluated and passed         |
| Toggle Coverage     | Measures signal transitions                                 | Whether a signal experienced both `0→1` and `1→0` transitions |
-----------------------------------------------------------------------------------------------------------------------------------------------------



1.Functional Coverage Topics: Basic to Advanced

-------------------------------------------------------------------------------------------------------------
| Level           | Topics                                                                                  |
| --------------- | --------------------------------------------------------------------------------------- |
| Basic           | `covergroup`, `coverpoint`, `sample()`, `bins`, `default bins`                          |
| Intermediate    | `ignore_bins`, `illegal_bins`, `iff`, `with`, `wildcard bins`                           |
| Advanced        | Cross coverage, `binsof`, `intersect`, transition bins                                  |
| Expert          | `option.at_least`, `option.goal`, `option.weight`, `option.per_instance`, `type_option` |
| Interview Focus | Coverage closure, coverage holes, unreachable bins, constrained-random testing          |
| Practical       | Coverage databases, merging UCDB files, reports and exclusions in QuestaSim             |
-------------------------------------------------------------------------------------------------------------




//1.BASIC


1.covergroup:
A covergroup contains one or more coverpoints and can optionally contain crosses and coverage options.

Syntax:

covergroup cg_name;

  coverpoint variable_name;

endgroup

Important: Declaring a covergroup does not automatically create and sample an instance. You must construct an instance and ensure that sampling occurs.

1.Example:

class  sample;
rand int data;

function void print();
$display("---------------DATA = %0d ----------------",data);
endfunction



covergroup cg_data;
	coverpoint data;
endgroup


function new();
	cg_data=new();
endfunction


constraint a_c{
data inside {[1:50]};
}

endclass



module top;

sample s1;

initial begin

s1=new();
s1.randomize();
s1.print();
//Noted Point:Declaring a covergroup does not automatically create and sample an instance.
s1.cg_data.sample();
end
endmodule


2.Example:
module top;

bit [1:0] data;

covergroup cg_data;
coverpoint  data; 
endgroup

initial begin
	cg_data cov = new();
data = 0;
$display("data = %0d Coverage =%0.2f%%",data,cov.get_coverage());
cov.sample();

data = 1;
$display("data = %0d Coverage =%0.2f%%",data,cov.get_coverage());
cov.sample();

data = 0;
$display("data = %0d Coverage =%0.2f%%",data,cov.get_coverage());
cov.sample();

data = 1;
$display("data = %0d Coverage =%0.2f%%",data,cov.get_coverage());
cov.sample();

data = 1;
$display("data = %0d Coverage =%0.2f%%",data,cov.get_coverage());
cov.sample();
end
endmodule
OUTPUT:
# data = 0 Coverage =0.00%
# data = 1 Coverage =25.00%
# data = 0 Coverage =50.00%
# data = 1 Coverage =50.00%
# data = 1 Coverage =50.00%


//2. Coverpoint:

A coverpoint is a construct inside a SystemVerilog covergroup that specifies which variable or expression you want to measure for functional coverage.

It helps you determine whether your simulation has exercised the values and conditions defined in your verification plan.

//1.Example:

class  sample;
rand int data;
rand int addr;
rand int opcode;

function void print();
$display("---------------DATA = %0d ----------------",data);
$display("---------------ADDRESS = %0d ----------------",addr);
$display("---------------OPCODE = %0d ----------------",opcode);
endfunction



covergroup cg_data;
	coverpoint data;
	coverpoint addr;
	coverpoint opcode;

endgroup

function new();
	cg_data=new();
endfunction

constraint a_c{
data inside {[1:50]};
}

endclass



module top;

sample s1;

initial begin

s1=new();
s1.randomize();
s1.print();
//Noted Point:Declaring a covergroup does not automatically create and sample an instance.
s1.cg_data.sample();
end
endmodule

//2.Example:
module top;

  bit [1:0] data;

  covergroup cg;
    cp_data: coverpoint data;
  endgroup

  cg cov = new();

  initial begin
    data = 0;
    cov.sample();

    data = 1;
    cov.sample();

    data = 2;
    cov.sample();

    data = 3;
    cov.sample();

    $display("Coverage = %0.2f%%",
             cov.get_inst_coverage());
  end

endmodule














