/***************************************************************************
	               Display & Formatting
****************************************************************************

// Print messange + newline $display();
module top;
int a;
int b;
initial begin	
	a=10;
	b=45;
$display("a=%0d | b=%0d",a,b);
end
endmodule 


// Print messange with binary + newline $displayb();
module top;
int a;
int b;
initial begin	
	a=10;
	b=45;
$displayb(a,,,,,,b);
end
endmodule


// Print messange with Hexdecimal + newline $displayh();
module top;
int a;
int b;
initial begin	
	a=10;
	b=14;
$displayh(a,,,,,,b);
end
endmodule




// Print messange with octal + newline $displayo();
module top;
int a;
int b;
initial begin	
	a=8;
	b=7;
$displayo(a,,,,,,b);
end
endmodule


//Automatically print when argumentus change
module top;
int a;
int b;
initial begin	
$monitor(a,b);
	a=10;
	b=10;//obj
	//a=20;
	b=20;

end
endmodule


//print without automatic newline $write();
module top;
int a;
int b;
initial begin	
	a=10;
	b=14;
$write("a=%0d",a);//this one and line number 79 both print same line
$write("b=%0d\n",b);//equal to display
$write("b=%0d",b);
end
endmodule


//print value at end of current time step $strob();
module top;
int a;
int b;
initial begin	
	a=10;
$write("a=%0d,b=%0d\n",a,b);//obj
$strobe("a=%0d,b=%0d",a,b);
	b=14;
$strobe("a=%0d,b=%0d",a,b);
end
endmodule
*/













































