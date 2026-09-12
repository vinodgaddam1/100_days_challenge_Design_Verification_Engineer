class sample;
	int a;
	int b;
	function void display(string str);
		$display("------->print the %0s data<-------",str);
		$display("a=%0d | b=%0d",a,b);
	endfunction
endclass

module top;
sample s1;
sample s2;
initial begin
	s1=new();
	s1.a=100;
	s1.b=200;
	s1.display("S1");

	s2=s1; //copy by handle
	s2.display("S2");
        

	s2.a=120;
	s2.b=130;
	s1.display("S1-->S2");//Here i am changing s2 values but see obj
        
	s1.a=20;
	s1.b=30;
        s2.display("S2--->S1"); //Here i am changin s1 values and printing s2  obj


end
endmodule








































