>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                Level 3 — Dynamic  Arrays
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//Goal: Understand runtime-sized arrays.
1. Create a dynamic array of 10 elements.
module top;
int arr[];
initial begin
	arr=new[10];
	foreach(arr[i])begin
		arr[i]=$urandom_range(10,50);
	end
	$display("array=%p",arr);

end
endmodule 
OUTPUT:
# array='{29, 18, 34, 26, 32, 13, 19, 30, 43, 46}

2. Allocate 20 elements using:

module top;
int arr[];
initial begin
	arr=new[10];
	foreach(arr[i])begin
		arr[i]=$urandom_range(10,50);
	end
	$display("array=%p",arr);
	arr=new[20] (arr);
	$display("array=%p",arr);


end
endmodule
OUTPUT:
# array='{29, 18, 34, 26, 32, 13, 19, 30, 43, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}


3. Fill with 1–10.

module top;
int arr[];
initial begin
	arr=new[10];
	foreach(arr[i])begin
		arr[i]=i+1;
	end
	$display("array=%p",arr);
end
endmodule
OUTPUT:
# array='{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}


4. Resize 5 → 10 while preserving old values.

module top;
int arr[];
initial begin
	arr=new[5];
	foreach(arr[i])begin
		arr[i]=i+1;
	end
	$display("array=%p",arr);
	arr=new[10] (arr);
	$display("array=%p",arr);

end
endmodule
OUTPUT:
# array='{1, 2, 3, 4, 5}
# array='{1, 2, 3, 4, 5, 0, 0, 0, 0, 0}


5. Resize 10 → 5.

module top;
int arr[];
initial begin
	arr=new[5];
	foreach(arr[i])begin
		arr[i]=i+1;
	end
	$display("array=%p",arr);
	arr=new[10] (arr);
	$display("array=%p",arr);
	arr=new[5](arr);
	$display("array=%p",arr);
	
end
endmodule
OUTPUT:
# array='{1, 2, 3, 4, 5}
# array='{1, 2, 3, 4, 5, 0, 0, 0, 0, 0}
# array='{1, 2, 3, 4, 5}

6. Check size using:size();

module top;
int arr[];
initial begin
	arr=new[5];
	foreach(arr[i])begin
		arr[i]=i+1;
	end
	$display("array=%p",arr);
	$display("array=%0d",arr.size());

end
endmodule
OUTPUT:
# array='{1, 2, 3, 4, 5}
# array=5

7. Delete the entire dynamic array.delete();

module top;
int arr[];
initial begin
	arr=new[5];
	foreach(arr[i])begin
		arr[i]=i+1;
	end
	$display("array=%p",arr);
        arr.delete();
	$display("array=%p",arr);

end
endmodule
OUTPUT:
# array='{1, 2, 3, 4, 5}
# array='{}

8. Copy one dynamic array into another.

module top;
int arr1[];
int arr2[];
initial begin
	arr1=new[10];
	foreach(arr1[i])begin
	arr1[i]=$urandom_range(10,20);
	end
	arr2=arr1;
	$display("array1=%p",arr1);
	$display("array2=%p",arr2);


end
endmodule
OUTPUT;
# array1='{17, 20, 18, 13, 15, 19, 13, 20, 16, 13}
# array2='{17, 20, 18, 13, 15, 19, 13, 20, 16, 13}


9. Create a dynamic 2D array and Allocate 3x4:

module top;
int arr[][];
initial begin
	arr=new[3];
	foreach(arr[i])begin
		arr[i]=new[4];
	end
	foreach(arr[i,j])begin
		arr[i][j]=$urandom_range(10,20);
        end
	$display("array=%p",arr);
end
endmodule
OUTPUT:
# array='{'{17, 20, 18, 13}, '{15, 19, 13, 20}, '{16, 13, 19, 13}}


