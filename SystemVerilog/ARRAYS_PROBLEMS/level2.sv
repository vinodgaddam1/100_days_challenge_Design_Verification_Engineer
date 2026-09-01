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

