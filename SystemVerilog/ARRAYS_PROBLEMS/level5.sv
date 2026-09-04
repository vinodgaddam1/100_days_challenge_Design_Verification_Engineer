>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                Level 5 — Associative Arrays
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//Goal: Master key/value storage.
1. Create integer-key associative array.
module top;
int arr[*];
initial begin
arr[0]=100;
arr[1]=200;
arr[2]=300;
arr[3]=400;
arr[4]=500;
$display("array=%p",arr);
end
endmodule
OUTPUT:
# array='{0:100, 1:200, 2:300, 3:400, 4:500 }
2. Store:
10 → 100
20 → 200
30 → 300

module top;
int arr[*];
initial begin
	arr[10]=100;
	arr[20]=200;
	arr[30]=300;

$display("array=%p",arr);
end
endmodule
OUTPUT:
# array='{10:100, 20:200, 30:300 }
3. Check exists are not using .exists()

module top;
int arr[string];
initial begin
	arr["A"]=100;
	arr["B"]=200;
	arr["C"]=300;
	arr["D"]=400;
$display("array=%p",arr);
if (arr.exists("A"))
	$display("Index is exists");
else
	$display("Index is not exists");

end
endmodule
OUTPUT:
# array='{"A":100, "B":200, "C":300, "D":400 }
# Index is exists

4. Delete entire array.
module top;
int arr[string];
initial begin
	arr["A"]=100;
	arr["B"]=200;
	arr["C"]=300;
	arr["D"]=400;
$display("array=%p",arr);
arr.delete();
$display("array=%p",arr);

end
endmodule
OUTPUT:
# array='{"A":100, "B":200, "C":300, "D":400 }
# array='{ }

5. Delete one entry.

module top;
int arr[string];
initial begin
	arr["A"]=100;
	arr["B"]=300;
	arr["C"]=400;
	arr["D"]=500;
	arr["E"]=600;
	arr["F"]=700;
$display("array=%p",arr);
arr.delete("A");// arr.delete(100) illegel let's try it see the output the will be same
$display("array=%p",arr);
end
endmodule
OUTPUT:
# array='{"A":100, "B":300, "C":400, "D":500, "E":600, "F":700 }
# array='{"B":300, "C":400, "D":500, "E":600, "F":700 }


6. Use:
.first()
.last()
.next()
.prev()

module top;
string arr[string];
string data;
initial begin
	arr["A"]="VINOD";
	arr["B"]="KUMAR";
	arr["C"]="VAMSI";;
	arr["D"]="RAJU";
	arr["E"]="TEJA";
$display("array=%p",arr);
if(arr.first(data))
$display("First=%s",data);


if(arr.last(data))
$display("Last=%s",data);

data="D";
if(arr.next(data))
$display("Next=%s",data);


data="B";
if(arr.prev(data))
$display("previous=%s",data);

end
endmodule
OUTPUT:
# array='{"A":"VINOD", "B":"KUMAR", "C":"VAMSI", "D":"RAJU", "E":"TEJA" }
# First=A
# Last=E
# Next=E
# Previous=A


7. Traverse without foreach
module top;
int arr[string];
string key;
initial begin
	arr["one"]=100;
	arr["two"]=200;
	arr["three"]=300;
	arr["four"]=400;
	arr["five"]=500;
	
arr.first(key);

while(1)begin
	$display("key=%s ,value=%0d",key,arr[key]);

if(!arr.next(key))
	break;
end
end
endmodule
OUTPUT:
# key=five ,value=500
# key=four ,value=400
# key=one ,value=100
# key=three ,value=300
# key=two ,value=200


8. Traverse with foreach


module top;
int arr[string];
initial begin
	arr["one"]=100;
	arr["two"]=200;
	arr["three"]=300;
	arr["four"]=400;
	arr["five"]=500;
	foreach(arr[key])begin
		$display("key=%s ,value=%0d",key,arr[key]);
	end

end
endmodule
OUTPUT:
# key=five ,value=500
# key=four ,value=400
# key=one ,value=100
# key=three ,value=300
# key=two ,value=200

9. Create string-key associative array

module top;
int arr[string];
initial begin
	arr["one"]=100;
	arr["two"]=200;
	arr["three"]=300;
	arr["four"]=400;
	$display("key=%p",arr);

end
endmodule
OUTPUT:
# key='{"four":400, "one":100, "three":300, "two":200 }

10. Build a frequency counter

module top;
int data[6]={10,20,10,40,50,60};
int freq[int];
initial begin
	for(int i=0;i<6;i++)begin
	freq[data[i]]++;
end
foreach(freq[key])begin
		$display("%0d occurs %0d time",key,freq[key]);

end
end
endmodule
OUTPUT:
# 10 occurs 2 time
# 20 occurs 1 time
# 40 occurs 1 time
# 50 occurs 1 time
# 60 occurs 1 time


