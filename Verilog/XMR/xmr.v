/********************************************************************************
*                                 XMR-Cross Module Reference
*********************************************************************************
1.Basic Idea
tb
 └── dut
      └── u1
           └── signal_a

module child;
reg a;

initial begin
	a=1'b1;
end
endmodule

module top;
child c1();

initial begin
	#5;
	$display("a=%b",c1.a);
end
endmodule



2.Deep Hierarchy
top
 └── u1
      └── u2
           └── data

module block2;
reg data;
initial begin
	data=1'b1;
end
endmodule


module block1;
block2 u1();
endmodule

module top;
block1 u2();
initial begin
	#5;
	$display("data=%b",u2.u1.data);//top.u2.u1.data---this is full hierarchy
end
endmodule

3.Upward XMR

module top;
reg test_signal;
child c1();
initial begin
	test_signal =1'b1;
end
endmodule


module child;
initial begin
	#5 ;
	$display("test_signal=%b",top.test_signal);
end
endmodule


4.Downward XMR

module child;
reg a;
initial begin
a=1'b1;
end
endmodule

module top;
child c1(); 
initial begin
#5;
$display("a=%b",top.c1.a);
end
endmodule






















