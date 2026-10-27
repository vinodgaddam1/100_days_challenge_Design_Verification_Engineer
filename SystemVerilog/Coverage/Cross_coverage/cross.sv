===========================================
           Cross Coverage
===========================================

Cross Coverage:
Cross coverage measures combinations of values from two or more coverpoints.

For Example:
class sample;
  rand int x;
  rand int y;

  function void print();
	  $display("X=%0d",x);
	  $display("Y=%0d",y);
  endfunction

  constraint a{
  x inside {[1:100]};
  y inside {[1:100]};
  }


//Cross Coverage
covergroup cg;
	  CP1:coverpoint x{
	  bins X0 = {[0:3]};
	  bins X1 = {[4:7]};
	  bins X2 = {[8:11]};
	  bins X3 = {[12:15]};
		   
		  
	  }
	  CP2:coverpoint y{
	  bins Y0 = {[0:3]};
	  bins Y1 = {[4:7]};
	  bins Y2 = {[8:11]};
	  bins Y3 = {[12:15]};
	  }
	  cross CP1,CP2;

  endgroup

  function new();
	  cg=new();
  endfunction
endclass

module top;
sample s=new();
initial begin
	repeat(10)begin	
	assert(s.randomize());
	s.print();
	s.cg.sample();
end

end
endmodule
 



Filters In cross Coverage:
Binsof: 
binsof is used in cross coverage to select specific bins from a coverpoint.

For Example:
class sample;
  rand int x;
  rand int y;

  function void print();
	  $display("X=%0d",x);
	  $display("Y=%0d",y);
  endfunction

  constraint a{
  x inside {[1:100]};
  y inside {[1:100]};
  }

  //Filters In cross Coverage
 covergroup cg;
	  CP1:coverpoint x{
	  bins X0 = {[0:3]};
	  bins X1 = {[4:7]};
	  bins X2 = {[8:11]};
	  bins X3 = {[12:15]};
		   
		  
	  }
	  CP2:coverpoint y{
	  bins Y0 = {[0:3]};
	  bins Y1 = {[4:7]};
	  bins Y2 = {[8:11]};
	  bins Y3 = {[12:15]};
	  }
	  cross CP1,CP2 {
	  bins Z = binsof (CP1.X0);//What ever X0 related things are there it will comes under one group 
	  }

  endgroup 
  

  function new();
	  cg=new();
  endfunction
endclass

module top;
sample s=new();
initial begin
	repeat(10)begin	
	assert(s.randomize());
	s.print();
	s.cg.sample();
end

end
endmodule

Binsof  intersect:
binsof selects bins from a coverpoint, while intersect filters that selection based on specified values.

For Example:
class sample;
  rand int x;
  rand int y;

  function void print();
	  $display("X=%0d",x);
	  $display("Y=%0d",y);
  endfunction

  constraint a{
  x inside {[1:100]};
  y inside {[1:100]};
  }
 //Filters In cross Coverage (2.binsof with intesect)
 covergroup cg;
	  CP1:coverpoint x{
	  bins X0 = {[0:3]};
	  bins X1 = {[4:7]};
	  bins X2 = {[8:11]};
	  bins X3 = {[12:15]};
		   
		  
	  }
	  CP2:coverpoint y{
	  bins Y0 = {[0:3]};
	  bins Y1 = {[4:7]};
	  bins Y2 = {[8:11]};
	  bins Y3 = {[12:15]};
	  }
	  cross CP1,CP2 {
	  bins Z = binsof (CP1) intersect {[2:9]}; //Here b/w 2-to-9 comes under one group and remaing not will come like (X0,X1,X2) possibility and X3 is  out of give range 
	  }

  endgroup 
 

  function new();
	  cg=new();
  endfunction
endclass

module top;
sample s=new();
initial begin
	repeat(10)begin	
	assert(s.randomize());
	s.print();
	s.cg.sample();
end

end
endmodule

 

Binsof Intersect:
binsof selects bins from a coverpoint, while intersect filters that selection based on specified values.

For Example:
class sample;
  rand int x;
  rand int y;

  function void print();
	  $display("X=%0d",x);
	  $display("Y=%0d",y);
  endfunction

  constraint a{
  x inside {[1:100]};
  y inside {[1:100]};
  }

 //Filters In cross Coverage (2.binsof with intesect)
 covergroup cg;
	  CP1:coverpoint x{
	  bins X0 = {[0:3]};
	  bins X1 = {[4:7]};
	  bins X2 = {[8:11]};
	  bins X3 = {[12:15]};
		   
		  
	  }
	  CP2:coverpoint y{
	  bins Y0 = {[0:3]};
	  bins Y1 = {[4:7]};
	  bins Y2 = {[8:11]};
	  bins Y3 = {[12:15]};
	  }
	  cross CP1,CP2 {
	  bins Z = binsof (CP1) intersect {[2:9]}; //Here b/w 2-to-9 comes under one group and remaing not will come like (X0,X1,X2) possibility and X3 is out of give range 
	  }

  endgroup 
 

  function new();
	  cg=new();
  endfunction
endclass

module top;
sample s=new();
initial begin
	repeat(10)begin	
	assert(s.randomize());
	s.print();
	s.cg.sample();
end

end
endmodule

 

wildcard bins:
Wildcard bins allow x, z, and ? bits in a bin's pattern to act as don't-care bits for matching.
For Example:
class sample;

  rand bit [1:0] data;
  rand int addr;

  function void print();
    $display("data = %0b, addr = %0d", data, addr);
  endfunction

  constraint a {
    data inside {[1:2]};
    addr inside {[1:100]};
  }

  covergroup sam;
    cp_data: coverpoint data {
      wildcard bins DATA_1 = {2'b0?};
      wildcard bins DATA_2 = {2'b1?};
    }

    cp_addr: coverpoint addr {
      bins LOW  = {[1:50]};
      bins HIGH = {[51:100]};
    }
  endgroup

  function new();
    sam = new();
  endfunction

endclass


module top;

  sample s = new();

  initial begin
    repeat (10) begin
      assert(s.randomize())
        else $fatal("Randomization failed");

      s.print();
      s.sam.sample();
    end

    $display("Coverage = %0.2f%%",
             s.sam.get_coverage());

    $finish;
  end

endmodule
 
 














