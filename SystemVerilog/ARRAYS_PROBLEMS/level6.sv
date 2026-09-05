
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
              Level 6 — Array Manipulation + Advanced Types
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//Goal: Stop treating arrays independently. Combine them.

mixed array declarations
1.int arr[][$]
module top;
int arr[][$];
initial begin
arr=new[3];

arr[0].push_back(10);
arr[0].push_back(20);


arr[1].push_back(30);
arr[1].push_back(40);

arr[2].push_front(22);  //obj here
arr[2].push_front(32);
arr[2].push_front(32);
arr[2].push_front(32);
arr[2].push_front(32);
arr[2].push_front(32);
arr[2].push_front(32);

arr=new[6] (arr); //resize 

arr[3].push_front(44);
arr[3].push_front(34);


arr[4].push_front(14);
arr[5].push_front(24);

arr[6].push_front(44); //obj here 
arr[7].push_front(34);

arr=new[1] (arr); //size inc

arr[0].push_back(90);
arr[0].push_back(55);


foreach(arr[i,j])begin
	$display("arr[%0d][%0d]=%0d",i,j,arr[i][j]);
end

end
endmodule


2.int arr[$][]   
module top;
int arr[$][];//obj
int temp[];
initial begin

temp=new[3];
temp[0]=10;
temp[1]=20;
temp[2]=30;
arr.push_back(temp);

temp=new[2];
temp[0]=40;
temp[1]=50;
arr.push_back(temp);

foreach(arr[i,j])begin
	$display("arr[%0d][%0d]=%0d",i,j,arr[i][j]);
end
end
endmodule

3.int arr[string][$]

module top;
int arr[string][$];
initial begin
arr["apple"].push_back(10);
arr["apple"].push_back(20);


arr["banana"].push_back(30);
arr["banana"].push_back(40);

foreach(arr[key,i])begin
$display("arr[%s][%0d]=%0d",key,i,arr[key][i]);
end
end
endmodule


4.int arr[int][]
module top;
int arr[int][];
initial begin
	arr[10]=new[3];
	arr[20]=new[2];

	arr[10][10]=100;
	arr[10][1]=200;
	arr[10][2]=300;

	arr[20][0]=400;
	arr[20][1]=500;

	foreach(arr[i,j])begin
		$display("arr[%0d][%0d]=%0d",i,j,arr[i][j]);
	end
end
endmodule


5.int arr[][$]

module top;
int arr[][$];
initial begin
arr=new[3];
arr[0].push_back(10);
arr[0].push_back(10);
arr[0].push_back(10);

arr[1].push_front(30);
arr[1].push_front(40);
arr[1].push_front(50);


arr[2].push_front(60);
arr[2].push_front(70);
arr[2].push_front(80);


foreach(arr[i,j])begin
	$display("arr[%0d][%0d]=%0d",i,j,arr[i][j]);
end

end
endmodule


6.int arr[][int]

module top;
int arr[][int];
initial begin
arr=new[3];
arr[0][10]=30;
arr[0][20]=20;
arr[0][30]=40;
arr[0][30]=40;//this is not print obj
foreach(arr[i,j])begin
	$display("arr[%0d][%0d]=%0d",i,j,arr[i][j]);
end
	$display("----------------------------------------");

arr=new[10] (arr);
arr[1][40]=50;
arr[1][100]=80;
arr[1][70]=90;
arr[9][100]=100;
foreach(arr[i,j])begin
	$display("arr[%0d][%0d]=%0d",i,j,arr[i][j]);
end
	$display("----------------------------------------");

arr[2][5]=30;
arr[5][9]=10;
arr[2][6]=40;
arr[6][100]=100;

arr=new[3] ;
arr[1][5]=30;
arr[1][9]=10;
arr[1][6]=40;
foreach(arr[i,j])begin
	$display("arr[%0d][%0d]=%0d",i,j,arr[i][j]);
end
end
endmodule
7.int [$][int]
module top;
int arr[$][int];
int tem[int];
initial begin
tem[10]=100;
tem[40]=50;
tem[90]=30;
tem[1000]=30;
arr.push_back(tem);
foreach(arr[i,j])begin
	$display("arr[%0d][%0d]=%0d",i,j,arr[i][j]);
end
end
endmodule 


8.int [][$][int]

module top;
int arr[][$][int];
int temp[][int];
initial begin
temp =new[3];
temp[0][100]=100;
temp[0][200]=200;
temp[0][300]=300;

temp[1][400]=400;
temp[1][500]=500;
temp[1][600]=600;
arr=new[10];
arr[0].push_back(temp[0]);
arr[1].push_back(temp[1]);
foreach(arr[i,j,k])begin
$display("arr[%0d][%0d][%0d]=%0d",i,j,k,arr[i][j][k]);
end
end
endmodule


9.int [$][string][];

module top;
int arr[$][string][];
int temp[string][];
initial begin
temp["vinod"]=new[3];
temp["kumar"]=new[4];

temp["vinod"][2]=100;
temp["kumar"][2]=100;

arr.push_back(temp);
foreach(arr[i,j,k])begin
$display("arr[%0d][%s][%0d]=%0d",i,j,k,arr[i][j][k]);
end

end
endmodule

