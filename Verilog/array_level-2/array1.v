/*==========================================================================
                Array-based-problems
============================================================================
****************************************************************************
                                    Level-2
****************************************************************************
//Genarate the array,it calculat the Sum 
module tb;
integer array[9:0];
integer i;
integer sum;
initial begin
	sum=0;
for(i=0;i<10;i=i+1)begin
array[i]=i+1;
sum=sum+array[i];
$display("array[%0d]==%0d",i,sum);
end
end
endmodule
OUTPUT:
# array[0]==1
# array[1]==3
# array[2]==6
# array[3]==10
# array[4]==15
# array[5]==21
# array[6]==28
# array[7]==36
# array[8]==45
# array[9]==55


//Find the maximum number, in give array
module tb;
integer array[9:0];
integer i;
integer max;
initial begin
	// Generate array
	for(i=0;i<10;i=i+1)begin
		array[i]=10*i;
	end
	//Assume frist element is max
	max=array[0];

	//Find the max
	for(i=0;i<10;i=i+1)begin
		if(array[i]>max)
			max=array[i];




        //Print array elements
	$display("array[%0d]=%0d",i,array[i]);
	end
       $display("Maximum = %0d",max);
       end
endmodule
OUTPUT:
# array[0]=0
# array[1]=10
# array[2]=20
# array[3]=30
# array[4]=40
# array[5]=50
# array[6]=60
# array[7]=70
# array[8]=80
# array[9]=90
# Maximum = 90

//Find the minmum number, in give array
module tb;
integer array[9:0];
integer i;
integer min;
initial begin
	// Generate array
	for(i=0;i<10;i=i+1)begin
		array[i]=10*(i+1);
	end
	//Assume frist element is min
	min=array[0];

	//Find the min
	for(i=0;i<10;i=i+1)begin
		if(array[i]<min)
			min=array[i];




        //Print array elements
	$display("array[%0d]=%0d",i,array[i]);
	end
       $display("Minmum = %0d",min);
       end
endmodule
OUTPUT:
# array[0]=10
# array[1]=20
# array[2]=30
# array[3]=40
# array[4]=50
# array[5]=60
# array[6]=70
# array[7]=80
# array[8]=90
# array[9]=100
# Minmum = 10


//Count the even and odd numbers, give array
module tb;
integer array[9:0];
integer i;
integer even;
integer odd;
initial begin
	even=0;
	odd=0;
	//Genarate array
	for(i=0;i<10;i=i+1)begin
	array[i]=$urandom_range(10,50);
	end
        //find odd and even	
	for(i=0;i<10;i=i+1)begin
		if(array[i]%2==0)begin
	         even=even+1;
		end
	     else begin
		    odd=odd+1;
             end
	 $display("array[%0d]=%0d",i,array[i]);
         end
        $display("Even=%0d",even);//count
        $display("odd=%0d",odd);//count
end
endmodule
OUTPUT:
# array[0]=29
# array[1]=18
# array[2]=34
# array[3]=26
# array[4]=32
# array[5]=13
# array[6]=19
# array[7]=30
# array[8]=43
# array[9]=46
# Even=6
# odd=4
*/











































