/*==========================================================================
                     Array based problems
============================================================================
****************************************************************************
                           Level-4 
***************************************************************************
| Question             | Possible?  | Why                          |
| -------------------- | ---------  | ---------------------------- |
| Even + multiple of 3 | ✅         | 6, 12, 18...                 |
| Even + multiple of 5 | ✅         | 10, 20, 30...                |
| Even + multiple of 9 | ✅         | 18, 36, 54...                |
| Odd + multiple of 3  | ✅         | 3, 9, 15...                  |
| Odd + multiple of 5  | ✅         | 5, 15, 25...                 |
| Odd + multiple of 7  | ✅         | 7, 21, 35...                 |
| Odd + multiple of 2  | ❌         | Every multiple of 2 is even  |
| Odd + multiple of 4  | ❌         | Every multiple of 4 is even  |
| Odd + multiple of 6  | ❌         | Every multiple of 6 is even  |
| Odd + multiple of 10 | ❌         | Every multiple of 10 is even |

Note:even+mul even is possible
     even+mul odd is possible
     odd+mul odd is possible
     odd+even is not possible******  

1.even number + multiple of 3---->method-I
module tb;
integer array[9:0];
integer i;
initial begin
for(i=0;i<10;i=i+1)begin
	array[i]=$urandom_range(10.50);
	$display("array[%0d]==%0d",i,array[i]);
end
//array checking
$display("Mul");
for(i=0;i<10;i=i+1)begin
	if(array[i]%2==0 && array[i] % 3==0)begin
	//odd array[i]%2!=0 &&array% 3==0)
	$display("array[%0d]==%0d",i,array[i]);
	end
end
end
endmodule
OUTPUT:
# array[0]==7
# array[1]==10
# array[2]==8
# array[3]==3
# array[4]==5
# array[5]==9
# array[6]==3
# array[7]==10
# array[8]==6
# array[9]==3
# Mul
# array[8]==6

//method-II--->Even + multiple of 3 = multiple of 6  this is LCM.
module tb;
integer i;
integer array[9:0];
initial begin
	for(i=0;i<10;i=i+1)begin
		array[i]=$urandom_range(1,10)*6;
		$display("array[%0d]=%0d",i,array[i]);

	end
		
end
endmodule
OUTPUT:
# array[0]=18
# array[1]=6
# array[2]=18
# array[3]=18
# array[4]=42
# array[5]=6
# array[6]=18
# array[7]=18
# array[8]=12
# array[9]=54

//2.Genarate factorial of number
module tb;
integer i,j;
integer array[9:0];
integer fact;
initial begin
	for(i=0;i<10;i=i+1)begin
		array[i]=i+1;
	end
	//Factorial number
	for(i=0;i<10;i=i+1)begin
		fact=1;
		for(j=0;j<array[i];j=j+1)begin
			fact=fact*(j+1);
		end
		$display("array=%0d=%0d",i,fact);
	end
end
endmodule
OUTPUT:
# array=0=1
# array=1=2
# array=2=6
# array=3=24
# array=4=120
# array=5=720
# array=6=5040
# array=7=40320
# array=8=362880
# array=9=3628800

3.Generate the unique values

module tb;
integer i,j;
integer array[9:0];
integer temp;
integer duplicate;
initial begin
for(i=0;i<10;i=i+1)begin
duplicate=1;
while(duplicate==1)begin
	duplicate=0;
	temp=$urandom_range(10,20);
	for(j=0;j<10;j=j+1)begin
		if(array[j]==temp)
		duplicate=1;
	end
 end
 array[i]=temp;
 $display("array[%0d]=%0d",i,array[i]);
end
end
endmodule
OUTPUT:
# array[0]=17
# array[1]=20
# array[2]=18
# array[3]=13
# array[4]=15
# array[5]=19
# array[6]=16
# array[7]=14
# array[8]=12
# array[9]=11

4.odd values in even position and even valuein odd position
module tb;
integer array[9:0];
integer i;
initial begin
	for(i=0;i<10;i=i+1)begin
		if(i%2==0)begin
			array[i]=2*i+1;//odd
		end
		else begin
			array[i]=2*i+2;//even
		end
		$display("array[%0d]=%0d",i,array[i]);
	end
	
end
endmodule
# array[0]=1
# array[1]=4
# array[2]=5
# array[3]=8
# array[4]=9
# array[5]=12
# array[6]=13
# array[7]=16
# array[8]=17
# array[9]=20
5.odd values in even position and even value in odd position using $random
module tb;
integer i;
integer array[9:0];
initial begin
for(i=0;i<10;i=i+1)begin
	if(i%2==0)begin
	 array[i]=$urandom_range(10,50);
         while(array[i]%2==0)
	 array[i]=$urandom_range(10,50);
        end    
	else begin
	 array[i]=$urandom_range(10,50);
		while(array[i]%2!==0)
	       array[i]=$urandom_range(10,50);
        end
$display("array[%0d]=%0d",i,array[i]);
end
end
endmodule
OUTPUT:
# array[0]=29
# array[1]=18
# array[2]=13
# array[3]=30
# array[4]=43
# array[5]=46
# array[6]=25
# array[7]=18
# array[8]=23
# array[9]=30

6.Find the Duplicate value in the array
module tb;
integer array[9:0];
integer i,j;
initial begin
	array[0]=10;
	array[1]=10;
	array[2]=10;
	array[3]=20;
	array[4]=30;
	array[5]=50;
	array[6]=70;
	array[7]=80;
	array[8]=00;
	array[9]=30;
	for(i=0;i<10;i=i+1)begin
		for(j=i+1;j<10;j=j+1)begin
			if(array[i]==array[j])begin
				$display("Duplicate=%0d",array[i]);
			end
		end
	end
end
endmodule
OUTPUT:
# Duplicate=10
# Duplicate=10
# Duplicate=10
# Duplicate=30



7.Find the Duplicate value in the array print only once

module tb;
integer array[9:0];
integer i,j,k;
integer already;
initial begin
	array[0]=10;
	array[1]=10;
	array[2]=10;
	array[3]=20;
	array[4]=30;
	array[5]=50;
	array[6]=70;
	array[7]=80;
	array[8]=00;
	array[9]=30;
	for(i=0;i<10;i=i+1)begin
		already=0;
		//check if current value is appeared before
		for(j=0;j<i;j=j+1)begin
			if(array[i]==array[j])begin
                           already=1;
			end
		end
         //only search for duplicate if not already processed
       if(already==0)begin
	       for(k=i+1;k<10;k=k+1)begin
		       if(array[k]==array[i])begin
				$display("Duplicate=%0d",array[i]);
				k=10;

		       end
	       end
       end

end

end
endmodule
OUTPUT:
# Duplicate=10
# Duplicate=30

8.sort array in Ascending order
module tb;
integer i,j,temp;
integer array[9:0];
initial begin
	for(i=0;i<10;i=i+1)begin
		array[i]=$urandom_range(50,10);
	end
	for(i=0;i<10;i=i+1)begin
		for(j=0;j<9-i;j=j+1)begin
			if(array[j]>array[j+1])begin
				temp=array[j];
				array[j]=array[j+1];
				array[j+1]=temp;
			end
		end
	end
	for(i=0;i<10;i=i+1)begin
        $display("Ascending[%0d]=%0d",i,array[i]);
end
end
endmodule
OUTPUT:
# Ascending[0]=13
# Ascending[1]=18
# Ascending[2]=19
# Ascending[3]=26
# Ascending[4]=29
# Ascending[5]=30
# Ascending[6]=32
# Ascending[7]=34
# Ascending[8]=43
# Ascending[9]=46


9.sort array in descending order
module tb;
integer i,j,temp;
integer array[9:0];
initial begin
	for(i=0;i<10;i=i+1)begin
		array[i]=$urandom_range(50,10);
	end
	for(i=0;i<10;i=i+1)begin
		for(j=0;j<9-i;j=j+1)begin
			if(array[j]<array[j+1])begin
				temp=array[j];
				array[j]=array[j+1];
				array[j+1]=temp;
			end
		end
	end
	for(i=0;i<10;i=i+1)begin
        $display("Desending[%0d]=%0d",i,array[i]);
end
end
endmodule
OUTPUT:
# Desending[0]=46
# Desending[1]=43
# Desending[2]=34
# Desending[3]=32
# Desending[4]=30
# Desending[5]=29
# Desending[6]=26
# Desending[7]=19
# Desending[8]=18
# Desending[9]=13

10.find the common element in two arrays

module tb;
integer i,j;
integer array1[9:0];
integer array2[9:0];
initial begin
	for(i=0;i<10;i=i+1)begin
		array1[i]=$urandom_range(10,20);
		$display("array1[%0d]=%0d",i,array1[i]);

	end
	for(j=0;j<10;j=j+1)begin
		array2[j]=$urandom_range(15,25);
		$display("array2[%0d]=%0d",j,array2[j]);
	end
	$display("Common Element in the array");
	for(i=0;i<10;i=i+1)begin
	      for(j=0;j<10;j=j+1)begin
	        if(array1[i]==array2[j])begin
		$display("Common=%0d",array1[i]);
            	end
             end
        end
end
endmodule
OUTPUT:
# array1[0]=17
# array1[1]=20
# array1[2]=18
# array1[3]=13
# array1[4]=15
# array1[5]=19
# array1[6]=13
# array1[7]=20
# array1[8]=16
# array1[9]=13
# array2[0]=24
# array2[1]=18
# array2[2]=19
# array2[3]=17
# array2[4]=25
# array2[5]=25
# array2[6]=20
# array2[7]=17
# array2[8]=20
# array2[9]=18
# Common Element in the array
# Common=17
# Common=17
# Common=20
# Common=20
# Common=18
# Common=18
# Common=19
# Common=20
# Common=20


















