/*==========================================================================
                Array-based-problems
============================================================================
*********************************************************************************
                             Level-1
********************************************************************************
//genarate the multiples of 4  using array
module tb;
parameter N=4;
integer array[9:0];
integer i;
initial begin
	
	for(i=0;i<10;i=i+1)begin
        array[i]=N*(i+1);	
	$display("array[%0d]=%0d",i,array[i]);
	end

end
endmodule
OUTPUT:
# array[0]=4
# array[1]=8
# array[2]=12
# array[3]=16
# array[4]=20
# array[5]=24
# array[6]=28
# array[7]=32
# array[8]=36
# array[9]=40


//Genarate the odd numbers using array
module tb;
integer array[9:0];
integer i;
initial begin
	for(i=0;i<10;i=i+1)begin
	array[i]=2*i+1;
        $display("array[%0d]=%0d",i,array[i]);
	end
end
endmodule
OUTPUT:
# array[0]=1
# array[1]=3
# array[2]=5
# array[3]=7
# array[4]=9
# array[5]=11
# array[6]=13
# array[7]=15
# array[8]=17
# array[9]=19

//Genarate the even numbers using array
module tb;
integer array[9:0];
integer i;
initial begin
	for(i=0;i<10;i=i+1)begin
	array[i]=2*i;
        $display("array[%0d]=%0d",i,array[i]);
	end
end
endmodule
OUTPUT:
# array[0]=0
# array[1]=2
# array[2]=4
# array[3]=6
# array[4]=8
# array[5]=10
# array[6]=12
# array[7]=14
# array[8]=16
# array[9]=18


//Genarate the Squares numbers using array
module tb;
integer array[9:0];
integer i;
initial begin
	for(i=0;i<10;i=i+1)begin
	array[i]=i*i;
        $display("array[%0d]=%0d",i,array[i]);
	end
end
endmodule
OUTPUT:
# array[0]=0
# array[1]=1
# array[2]=4
# array[3]=9
# array[4]=16
# array[5]=25
# array[6]=36
# array[7]=49
# array[8]=64
# array[9]=81



//Genarate the cubes numbers using array
module tb;
integer array[9:0];
integer i;
initial begin
	for(i=0;i<10;i=i+1)begin
	array[i]=i*i*i;
        $display("array[%0d]=%0d",i,array[i]);
	end
end
endmodule
OUTPUT:
# array[0]=0
# array[1]=1
# array[2]=8
# array[3]=27
# array[4]=64
# array[5]=125
# array[6]=216
# array[7]=343
# array[8]=512
# array[9]=729

















