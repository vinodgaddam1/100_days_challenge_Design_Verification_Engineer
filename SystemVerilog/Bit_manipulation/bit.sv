
/*
//1.$signed();
module top;
logic [7:0]a;
initial begin
	a=8'b1111_1111;//255
  $display("%0d",$signed(a));//-1
end
endmodule






//2.un$signed();
module top;
logic [7:0]a;
initial begin
	a=-1;//-1
  $display("%0d",$unsigned(a));//255
end
endmodule


//3.$bits();
module top;
logic [7:0]a;
initial begin
  $display("%0d",$bits(a));
end
endmodule





//4.$itor;
module top;
int a;
real b;
initial begin
	a=10;
	b=$itor(a);
	$display("a=%0d",a);
	$display("b=%0f",b);
end
endmodule






//5.$rtoi;
module top;
int a;
real b;
initial begin
	b=10.5;
	a=$rtoi(b);
	$display("b=%0f",b);
	$display("a=%0d",a);
end
endmodule









//6.$bitstoreal;
module top;
bit [63:0]data;
real b;
initial begin
 data = 64'h3FF0000000000000;
        b=$bitstoreal(data);
	$display("data=%0h",data);
	$display("b=%0f",b);
end
endmodule










*/




//7.$realtobits;
module top;
bit [63:0]b;
real data;
initial begin
        data = 1.000000;
        b=$realtobits(data);
	$display("data=%0f",data);
	$display("b=%0h",b);
end
endmodule
