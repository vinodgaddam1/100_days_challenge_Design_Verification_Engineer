//==========================================================================//  
                   Aseertions Problems
//==========================================================================

//1.Write an immediate assertion to check that a is equal to b.

module top;
int a,b;
initial begin
	a=10;
	b=10;
assert (a==b)
$display("a is equal to b");
else $error("a is not equal to b");
end
endmodule

//2.Write an immediate assertion to check that a is not equal to b.
module top;
int a,b;
initial begin
	a=10;
	b=9;
	assert (a!=b)
	 $display("a is not equal to b");
	else $error("a is equal to b");
end
endmodule


//3.Assert that enable is high
module top;
bit enable=1'b1;
initial begin
	assert (enable)
	 $display("enable is high");
	else $error("enable is low");
end
endmodule

//4.Assert that reset is low.
module top;
bit reset=1'b0;
initial begin
	assert (reset==0)
	 $display("reset is Low");
	else $error("reset is high");
end
endmodule

//5.Assert that count is less than 10.
module top;
int count;
initial begin
	count = 32'd10;
	assert (count<10)
	 $display("count is less than  ten");
	else $error("count is not less than ten");
end
endmodule


//6.Assert that count is greater than or equal to 5.
module top;
int count;
initial begin
	count = 32'd5;
	assert (count>=5)
	 $display("count is less than or equal to five");
	else $error("count is not less than five");
end
endmodule

//7.Assert that data equals 8'hA5.
module top;
int data;
initial begin
	data = 8'hAC;
	assert (data==8'hA5)
	 $display("data=%0h",data);
	else $error("data=%0h",data);
end
endmodule



//9:Assert that valid and ready are never simultaneously low.
module top;
bit valid ,ready;
initial begin
valid =1'b1;
ready =1'b0;
	assert (valid || ready)
	 $display("valid or ready high ");
	else  
	 $display("valid and ready both are low");
end
endmodule




//10:Assert that wr_en and rd_en are never high simultaneously.
module top;
bit wr_en ,rd_en;
initial begin
wr_en =1'b1;
rd_en =1'b1;
	assert (!(wr_en && rd_en))
	 $display("wr_en and rd_en both not are high ");
	else  
	 $display("wr_en and rd_en both  are high ");
end
endmodule


