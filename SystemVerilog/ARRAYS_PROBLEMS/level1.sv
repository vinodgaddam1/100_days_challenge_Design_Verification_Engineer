
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                       Level 1 — Static / Fixed Arrays
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//Goal: Understand indexing, declaration, initialization, loops.



1.Declare array int arr[5],store 10,20,30,40,50,print using for loop (5-min time)

module top;
int arr[5];
int i;
initial begin
arr='{10,20,30,40,50};
for (i=0;i<5;i++)begin
	$display("arr[%0d]=%0d",i,arr[i]);
end
end
endmodule
OUTPUT:
# arr[0]=10
# arr[1]=20
# arr[2]=30
# arr[3]=40
# arr[4]=50

2.print the sum without .sum()
module top;
int arr[5]='{10,20,30,40,50};
int sum;
initial begin
	sum=0;
	foreach (arr[i])begin
        sum=sum + arr[i];
	end
	$display("Sum = %0d",sum);
end
endmodule
OUTPUT:
# Sum = 150


3. Find maximum and minimum.
module top;
int arr[5];
int max;
int min;
initial begin
	foreach (arr[i])
	arr[i]=$urandom_range(1,100);
        max=arr[0];
	min=arr[0];


	foreach (arr[i])begin

		if(arr[i]>max)
			max=arr[i];
	        if(arr[i]<min)
			min=arr[i];
	end
	$display("Array = %p",arr);
	$display("Max =%0d",max);
	$display("Min =%0d",min);

end
endmodule
OUTPUT:
# Array = '{13, 91, 43, 63, 47}
# Max =91
# Min =13

4.Count even and odd numbers.
module top;
int arr[20];
int even_count;
int odd_count;
initial begin
even_count=0;
odd_count=0;
foreach (arr[i])begin
	arr[i]=$urandom_range(10,100);
end
foreach (arr[i])begin
	if (arr[i]%2==0)
	even_count++;
	else
	odd_count++;
end
$display("Array   =%p",arr);
$display("Even count = %0d",even_count);
$display("Odd count = %0d",odd_count);
end
endmodule
OUTPUT:
# Array   ='{99, 10, 62, 27, 13, 88, 87, 70, 87, 90, 54, 66, 51, 69, 65, 96, 22, 34, 68, 36}
# Even count = 12
# Odd count = 8


5. Reverse the array.
module top;
int arr[5];
int rev[5];
int i;
initial begin
foreach(arr[i])
	arr[i]=$urandom_range(1,100);
	foreach(rev[i])begin
		rev[i]=arr[4-i];
	end
	$display("Original array = %p",arr);
	$display("Recverse array = %p",rev);
end
endmodule
OUTPUT:
# Original array = '{13, 91, 43, 63, 47}
# Recverse array = '{47, 63, 43, 91, 13}


6.Search for a particular value and print its index.

module top;
int arr[20];
int search;
bit found;
initial begin
	search=10;
	found=0;

	foreach(arr[i])begin
	arr[i]=$urandom_range(1,100);
	end

        $display("arr=%p",arr);

	foreach(arr[i])begin
		if(arr[i]==search)begin
            $display("search=%0d found at index = %0d",search,i);
            found=1;
    end
end
if(!found)
$display("search = %0d not found ",search);	
end
endmodule
OUTPUT:
# arr='{13, 91, 43, 63, 47, 91, 23, 23, 92, 59, 59, 29, 56, 83, 74, 65, 3, 22, 12, 50}
# search = 10 not found 

7. Copy one static array into another.

module top;
int arr2[5];
int arr1[5];
initial begin
	foreach(arr1[i])begin
		arr1[i]=$urandom_range(10,100);

	end
	$display("array1=%p",arr1);
	foreach(arr2[i])begin
		arr2[i]=arr1[i];
	end
	$display("array2=%p",arr2);
end
endmodule
OUTPUT:
# array1='{99, 10, 62, 27, 13}
# array2='{99, 10, 62, 27, 13}


8. Compare two arrays.

module top;
int arr1[5];
int arr2[5];
int i;
initial begin
	foreach(arr1[i])begin
		//arr1[i]=$urandom_range(1,100);
		arr1[i]=i+1;
	end
	$display("array1=%p",arr1);
	foreach(arr2[i])begin
		//arr2[i]=$urandom_range(1,100);
		arr2[i]=i+1;
	end
	$display("array2=%p",arr2);
		if(arr1[i]==arr2[i])
			$display("Both array's are equal");
		else
			$display("Both array's are not equal");
end
endmodule

OUTPUT:

# array1='{13, 91, 43, 63, 47}
# array2='{91, 23, 23, 92, 59}
# Both array's are not equal


# array1='{1, 2, 3, 4, 5}
# array2='{1, 2, 3, 4, 5}
# Both array's are equal

9. Find duplicate elements.

module top;
int arr[10];
bit duplicate_found;
int j,i;
initial begin
foreach(arr[i])begin
	arr[i]=$urandom_range(1,100);
end
$display("Array = %p",arr);

for(i=0;i<10;i++)begin
duplicate_found=0;
for (j=0;j<i;j++)begin
	if (arr[i]==arr[j])begin
		duplicate_found=1;
	end
end
if(duplicate_found)
	$display("Duplicate = %0d",arr[i]);
end
end
endmodule
OUTPUT:
# Array = '{13, 91, 43, 63, 47, 91, 23, 23, 92, 59}
# Duplicate = 91
# Duplicate = 23


10. Rotate the array left by one position.

module top;
int arr[5];
int temp;
int i;
initial begin
	foreach(arr[i])begin
		arr[i]=$urandom_range(10,20);
	end
         $display("Before rotation = %p",arr);
	 temp=arr[0];

	 for (i=0;i<4;i++)begin
		 arr[i]=arr[i+1];
	 end
	 arr[4]=temp;
	 $display("After rotation = %p",arr);

end
endmodule
OUTPUT:
# Before rotation = '{17, 20, 18, 13, 15}
# After rotation = '{20, 18, 13, 15, 17}

























