/***************************************************************************
*                   SystemVerilog Arrays — Beginner → Pro
**************************************************************************
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


>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                Level 2 — Multidimensional Static Arrays
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//Goal: Become comfortable with 2D/3D arrays.
Fill it with 1–12.

2. Print using nested for.

3. Print using nested foreach.

4. Find the sum of every row.

5. Find the sum of every column.

6. Find maximum value in the entire matrix.

7. Search for a value and print row/column.

8. Transpose a 3×3 matrix.

9. Compare two 2D arrays.

10. Create a 3D array:


1. Declare an array in arr[3][4],fill it with 1-12,USING forloop
module top;
int arr[3][4];
initial begin
	for(int i=0;i<3;i++)begin
		for(int j=0;j<4;j++)begin
		arr[i][j]=i*4+j+1;
	end
end
$display("arr=%p",arr);
end
endmodule
OUTPUT:
# arr='{'{1, 2, 3, 4}, '{5, 6, 7, 8}, '{9, 10, 11, 12}}



2. Print using nested foreach.

module top;
int arr[3][4];
initial begin
	foreach(arr[i])begin
		foreach(arr[j])begin
			arr[i][j]=$urandom_range(10,20);

		end
	end
$display("arr=%p",arr);
end
endmodule
OUTPUT:
# arr='{'{17, 20, 18, 0}, '{13, 15, 19, 0}, '{13, 20, 16, 0}}


3. Find the sum of every row.
module top;
int arr[3][4];
int sum;
initial begin
          for(int i=0;i<3;i++)begin
		  for(int j=0;j<4;j++)begin
			  arr[i][j]=$urandom_range(10,20);
		  end
	  end
	  $display("arr=%p",arr);
	for(int i=0;i<3;i++)begin
		sum=0;
		for(int j=0;j<4;j++)begin
			sum=sum+arr[i][j];
		end
		$display("row %0d sum=%0d",i,sum);
	end
end
endmodule

OUTPUT:
# arr='{'{17, 20, 18, 13}, '{15, 19, 13, 20}, '{16, 13, 19, 13}}
# row 0 sum=68
# row 1 sum=67
# row 2 sum=61



4. Find the sum of every column.
module top;
int arr[3][5];
int sum;
initial begin
	for(int i=0;i<3;i++)begin
		for(int j=0;j<5;j++)begin
			arr[i][j]=$urandom_range(10,20);
		end
	end
	$display("arr=%p",arr);
	for(int i=0;i<5;i++)begin
	        sum=0;
		for(int j=0;j<3;j++)begin
			sum=sum+arr[j][i];
		end
	$display("colume = %0d sum = %0d",i,sum);
	end

end
endmodule
OUTPUT:
# arr='{'{17, 20, 18, 13, 15}, '{19, 13, 20, 16, 13}, '{19, 13, 14, 12, 20}}
# colume = 0 sum = 55
# colume = 1 sum = 46
# colume = 2 sum = 52
# colume = 3 sum = 41
# colume = 4 sum = 48

5. Find maximum and minmum values in the entire matrix.
module top;
int arr[3][4];
int max ;
int min ;
initial begin
	for(int i=0;i<3;i++)begin
		for(int j=0;j<4;j++)begin
			arr[i][j]=$urandom_range(10,20);
		end
	end
	$display("arr=%p",arr);
max=arr[0][0];
min=arr[0][0];
	for(int i=0;i<3;i++)begin
		for(int j=0;j<4;j++)begin
			if(arr[i][j]>max)begin
				max=arr[i][j];
			end
			if(arr[i][j]<min)begin
			min=arr[i][j];
			end
		end
	end
			$display("max = %0d",max);
			$display("min = %0d",min);
end
endmodule
OUTPUT:
# arr='{'{17, 20, 18, 13}, '{15, 19, 13, 20}, '{16, 13, 19, 13}}
# max = 20
# min = 13


6. Search for a value and print row/column.

module top;
int arr[3][5];
int search;
bit found;
initial begin
	for(int i=0;i<3;i++)begin
		for(int j=0;j<4;j++)begin
			arr[i][j]=$urandom_range(10,20);
		end
	end
	$display("arr=%p",arr);
	search=15;
	found=0;
	for(int i=0;i<3;i++)begin
		for(int j=0;j<5;j++)begin
			if(arr[i][j]==search)begin
				$display("%0d found at row = %0d ,column = %0d",search,i,j);
				found=1;
			end
		end
	end
	if(!found)begin
		$display("%0d not found search ",search);
	end

end
endmodule
OUTPUT:
# arr='{'{17, 20, 18, 13, 0}, '{15, 19, 13, 20, 0}, '{16, 13, 19, 13, 0}}
# 15 found at row = 1 ,column = 0


7. Transpose a 3×3 matrix.
module top;
int arr[3][3];
int trans[3][3];
initial begin
	for(int i=0 ;i<3;i++)begin
		for(int j=0;j<3;j++)begin
                      arr[i][j]=i+1;
		end
	end
	$display("arr=%p",arr);
	for(int i=0 ;i<3;i++)begin
		for(int j=0;j<3;j++)begin
                      trans[j][i]=arr[i][j];
		end
	end
	$display("trans=%p",trans);

end
endmodule
# arr='{'{1, 1, 1}, '{2, 2, 2}, '{3, 3, 3}}
# trans='{'{1, 2, 3}, '{1, 2, 3}, '{1, 2, 3}}


8. Compare two 2D arrays.

module top;

int arr1[3][5];
int arr2[3][5];
bit match;

initial begin

    // Fill arr1
    for (int i = 0; i < 3; i++) begin
        for (int j = 0; j < 5; j++) begin
            arr1[i][j] = $urandom_range(10,20);
        end
    end

    // Make arr2 a copy of arr1
    arr2 = arr1;

    $display("arr1 = %p", arr1);
    $display("arr2 = %p", arr2);

    match = 1;

    // Compare
    for (int i = 0; i < 3; i++) begin
        for (int j = 0; j < 5; j++) begin

            if (arr1[i][j] != arr2[i][j]) begin
                match = 0;
            end

        end
    end

    if (match)
        $display("Comparison PASSED");
    else
        $display("Comparison FAILED");

end

endmodule
OUTPUT:
# arr1 = '{'{17, 20, 18, 13, 15}, '{19, 13, 20, 16, 13}, '{19, 13, 14, 12, 20}}
# arr2 = '{'{17, 20, 18, 13, 15}, '{19, 13, 20, 16, 13}, '{19, 13, 14, 12, 20}}
# Comparison PASSED
*/









































