class parent;
endclass 

class child1 extends parent; 
endclass

class child2 extends parent;
endclass



module top;
parent p1,p2;
child1 c1;
child2 c2;
initial begin
	p1=new();
    p2=new();
	c1=new();
	c2=new();
	if($cast(p1,p2)) $display("casting is possible");
	else  $display("casting is not possible");
	$display("-------------------------------------------");
	if($cast(c1,p2)) $display("casting is possible");
	else  $display("casting is not possible");
	$display("-------------------------------------------");
	if($cast(p1,c1)) $display("casting is possible");
	else  $display("casting is not possible");
	$display("-------------------------------------------");
	if($cast(c2,c1)) $display("casting is possible");
	else  $display("casting is not possible");
	$display("-------------------------------------------");
end
endmodule

































































