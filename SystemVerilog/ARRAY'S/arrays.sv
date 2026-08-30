==========================================================================
                     Arrays-In-System-Verilog
==========================================================================
                    SYSTEMVERILOG ARRAYS
                           │
          ┌────────────────┴────────────────┐
          │                                 │
       BASIC                            ADVANCED
          │                                 │
    Fixed Array                       Dynamic Array
          │                                 │
    Indexing / Size                       Queue
          │                                 │
       for loop                    Associative Array
          │                                 │
      foreach                    Multidimensional
          │                                 │
   Basic Problems                  Array Methods
          │                                 │
  ┌───────┴────────┐              Constrained Random
  │                │                       │
Search           Count                rand
  │                │                       │
Min/Max         Even/Odd             constraint
  │                │                       │
Reverse        Divisibility           randomize()
  │                │                       │
Sort           Duplicates              unique
  │                │                       │
Second Max     Random Arrays          DV/UVM

//fixed-array
module tb;
integer array[0:4];
integer i;
initial begin
	array[0]=10;
	array[1]=20;
	array[2]=30;
	array[3]=40;
	array[4]=50;
	for(i=0;i<5;i=i+1)begin
		$display("array[%0d]=%0d",i,array[i]);
	end
end
endmodule
OUTPUT:
# array[0]=10
# array[1]=20
# array[2]=30
# array[3]=40
# array[4]=50

//Declare with value dirctly
module tb;
integer array[0:4]='{10,20,30,40,50};
integer i;
initial begin
	for(i=0;i<5;i=i+1)begin
		$display("array[%0d]=%0d",i,array[i]);
	end
end
endmodule
OUTPUT:
# array[0]=10
# array[1]=20
# array[2]=30
# array[3]=40
# array[4]=50
1.Single dimensional array
//array assignment 
module tb;
int arr[5]='{10,20,30,40,50};
integer i;
initial begin
foreach(arr[i])begin
	$display("array[%0d]=%0d",i,arr[i]);
end
end
endmodule
OUTPUT:
# array[0]=10
# array[1]=20
# array[2]=30
# array[3]=40
# array[4]=50

2.Multidimensional array
//Two-dimensional array
module tb;
int arr[6][2]='{'{1,100},'{2,200},'{3,300},'{4,400},'{5,500},'{6,600}};
integer i,j;
initial begin
	for(i=0;i<6;i=i+1)begin
		for(j=0;j<2;j=j+1)begin
		$display("array[%0d][%0d]=%0d",i,j,arr[i][j]);
	end
end
end
endmodule
OUTPUT:
# array[0][0]=1
# array[0][1]=100
# array[1][0]=2
# array[1][1]=200
# array[2][0]=3
# array[2][1]=300
# array[3][0]=4
# array[3][1]=400
# array[4][0]=5
# array[4][1]=500
# array[5][0]=6
# array[5][1]=600

//Three-dimensional array
module tb;
integer arr[3][2][3]='{
                     '{'{1,10,100},'{2,20,200}},
                     '{'{3,30,300},'{4,40,400}},
		     '{'{5,50,500},'{6,60,600}}
	     };
integer i,j,k;
initial begin
	for(i=0;i<3;i=i+1)begin
		for(j=0;j<2;j=j+1)begin
			for(k=0;k<3;k=k+1)begin
		$display("array[%0d][%0d][%0d]=%0d",i,j,k,arr[i][j][k]);
	   end
	end
end
end
endmodule
OUTPUT:
# array[0][0][0]=1
# array[0][0][1]=10
# array[0][0][2]=100
# array[0][1][0]=2
# array[0][1][1]=20
# array[0][1][2]=200
# array[1][0][0]=3
# array[1][0][1]=30
# array[1][0][2]=300
# array[1][1][0]=4
# array[1][1][1]=40
# array[1][1][2]=400
# array[2][0][0]=5
# array[2][0][1]=50
# array[2][0][2]=500
# array[2][1][0]=6
# array[2][1][1]=60
# array[2][1][2]=600

//four-dimensional array
int[2][3][4][5]=
    |  |  |  |
    |  |  |  |__colume    
    |  |  |
    |  |  |___rows
    |  |
    |  |_____groups
    |
    |
    |__Block
    

module tb;
int arr[2][3][4][5]='{
	//block
    '{
	'{'{1,3,2,4,5},{2,3,4,5,6},{3,4,5,6,2},{1,1,1,1,1}},
	'{'{1,3,2,4,5},{2,3,4,5,6},{3,4,5,6,2},{1,1,1,1,1}},
	'{'{1,3,2,4,5},{2,3,4,5,6},{3,4,5,6,2},{1,1,1,1,1}}
     },

//block2
    '{
	'{'{1,3,2,4,5},{2,3,4,5,6},{3,4,5,6,2},{1,1,1,1,1}},
	'{'{1,3,2,4,5},{2,3,4,5,6},{3,4,5,6,2},{1,1,1,1,1}},
	'{'{1,3,2,4,5},{2,3,4,5,6},{3,4,5,6,2},{1,1,1,1,1}}

     }
            };
integer i,j,k,l;
initial begin
	for(i=0;i<2;i=i+1)begin
		for(j=0;j<3;j=j+1)begin
			for(k=0;k<4;k=k+1)begin
				for(l=0;l<5;l=l+1)begin
					$display("array[%0d][%0d][%0d][%0d]=%0d",i,j,k,l,arr[i][j][k][l]);
	end
end
end
end
end
endmodule
OUTPUT:
 array[0][0][0][0]=1
# array[0][0][0][1]=3
# array[0][0][0][2]=2
# array[0][0][0][3]=4
# array[0][0][0][4]=5
# array[0][0][1][0]=2
# array[0][0][1][1]=3
# array[0][0][1][2]=4
# array[0][0][1][3]=5
# array[0][0][1][4]=6
# array[0][0][2][0]=3
# array[0][0][2][1]=4
# array[0][0][2][2]=5
# array[0][0][2][3]=6
# array[0][0][2][4]=2
# array[0][0][3][0]=1
# array[0][0][3][1]=1
# array[0][0][3][2]=1
# array[0][0][3][3]=1
# array[0][0][3][4]=1
# array[0][1][0][0]=1
# array[0][1][0][1]=3
# array[0][1][0][2]=2
# array[0][1][0][3]=4
# array[0][1][0][4]=5
# array[0][1][1][0]=2
# array[0][1][1][1]=3
# array[0][1][1][2]=4
# array[0][1][1][3]=5
# array[0][1][1][4]=6
# array[0][1][2][0]=3
# array[0][1][2][1]=4
# array[0][1][2][2]=5
# array[0][1][2][3]=6
# array[0][1][2][4]=2
# array[0][1][3][0]=1
# array[0][1][3][1]=1
# array[0][1][3][2]=1
# array[0][1][3][3]=1
# array[0][1][3][4]=1
# array[0][2][0][0]=1
# array[0][2][0][1]=3
# array[0][2][0][2]=2
# array[0][2][0][3]=4
# array[0][2][0][4]=5
# array[0][2][1][0]=2
# array[0][2][1][1]=3
# array[0][2][1][2]=4
# array[0][2][1][3]=5
# array[0][2][1][4]=6
# array[0][2][2][0]=3
# array[0][2][2][1]=4
# array[0][2][2][2]=5
# array[0][2][2][3]=6
# array[0][2][2][4]=2
# array[0][2][3][0]=1
# array[0][2][3][1]=1
# array[0][2][3][2]=1
# array[0][2][3][3]=1
# array[0][2][3][4]=1
# array[1][0][0][0]=1
# array[1][0][0][1]=3
# array[1][0][0][2]=2
# array[1][0][0][3]=4
# array[1][0][0][4]=5
# array[1][0][1][0]=2
# array[1][0][1][1]=3
# array[1][0][1][2]=4
# array[1][0][1][3]=5
# array[1][0][1][4]=6
# array[1][0][2][0]=3
# array[1][0][2][1]=4
# array[1][0][2][2]=5
# array[1][0][2][3]=6
# array[1][0][2][4]=2
# array[1][0][3][0]=1
# array[1][0][3][1]=1
# array[1][0][3][2]=1
# array[1][0][3][3]=1
# array[1][0][3][4]=1
# array[1][1][0][0]=1
# array[1][1][0][1]=3
# array[1][1][0][2]=2
# array[1][1][0][3]=4
# array[1][1][0][4]=5
# array[1][1][1][0]=2
# array[1][1][1][1]=3
# array[1][1][1][2]=4
# array[1][1][1][3]=5
# array[1][1][1][4]=6
# array[1][1][2][0]=3
# array[1][1][2][1]=4
# array[1][1][2][2]=5
# array[1][1][2][3]=6
# array[1][1][2][4]=2
# array[1][1][3][0]=1
# array[1][1][3][1]=1
# array[1][1][3][2]=1
# array[1][1][3][3]=1
# array[1][1][3][4]=1
# array[1][2][0][0]=1
# array[1][2][0][1]=3
# array[1][2][0][2]=2
# array[1][2][0][3]=4
# array[1][2][0][4]=5
# array[1][2][1][0]=2
# array[1][2][1][1]=3
# array[1][2][1][2]=4
# array[1][2][1][3]=5
# array[1][2][1][4]=6
# array[1][2][2][0]=3
# array[1][2][2][1]=4
# array[1][2][2][2]=5
# array[1][2][2][3]=6
# array[1][2][2][4]=2
# array[1][2][3][0]=1
# array[1][2][3][1]=1
# array[1][2][3][2]=1
# array[1][2][3][3]=1
# array[1][2][3][4]=1

****************************************************************************
                                Scalar In System Verilog
****************************************************************************
1.bit 
module tb;
bit a;//2-states
initial begin
	a=1;
	$display("a=%b",a);
	a=0;
	$display("a=%b",a);
end
endmodule
OUTPUT:
# a=1
# a=0

2.logic 
module tb;
logic a;//4-states
initial begin
	a=1;
	$display("a=%b",a);
	a=0;
	$display("a=%b",a);
end
endmodule
OUTPUT:
# a=1
# a=0

and reming wire & reg


****************************************************************************
                                Vector In System Verilog
****************************************************************************
1.bit 


module tb;
bit[9:0] a;//2-states
initial begin
	a=1;
	$display("a=%b",a);
	a=0;
	$display("a=%b",a);
end
endmodule
OUTPUT:
# a=0000000001
# a=0000000000

2.logic

module tb;
logic[-1:5] a;//4-states
initial begin
	a=1;
	$display("a=%b",a);
	a=0;
	$display("a=%b",a);
end
endmodule
OUTPUT:
# a=0000001
# a=0000000

and reming wire & reg
****************************************************************************
                       Packed and UnPacked array
****************************************************************************
//packed with mutipule
module tb;
bit[3:0][5:0]array='{5'd2,5'd4,5'd1,5'd3};
initial begin
	foreach(array[i])begin
		$display("array[%0d]=%0d",i,array[i]);
	end
end
endmodule
OUTPUT:
# array[3]=2
# array[2]=4
# array[1]=1
# array[0]=3


//Unpaked array
module tb;
int array[3:0][2:0]='{'{2,4,5},'{3,5,6},'{3,5,6},{2,4,3}};
int i,j;
initial begin
	for(i=3;i>=0;i=i-1)begin
		for(j=2;j>=0;j=j-1)begin
			$display("array[%0d][%0d]=%0d",i,j,array[i][j]);
		end
	end
end
endmodule
OUTPUT:
# array[3][2]=2
# array[3][1]=4
# array[3][0]=5
# array[2][2]=3
# array[2][1]=5
# array[2][0]=6
# array[1][2]=3
# array[1][1]=5
# array[1][0]=6
# array[0][2]=2
# array[0][1]=4
# array[0][0]=3


//combinational of a packed and unpacked array
module tb;
bit [4:0]array[2:0][1:0]='{'{5'd3,5'd4},'{5'd3,5'd2},{5'd3,5'd2}};
integer i,j;
initial begin
	for(i=0;i<2;i=i+1)begin
		for(j=0;j<3;j=j+1)begin
			$display("array[%0d][%0d]=%0d",i,j,array[i][j]);
		end
	end
end
endmodule
OUTPUT:
# array[0][0]=2
# array[0][1]=3
# array[0][2]=0
# array[1][0]=2
# array[1][1]=3
# array[1][2]=0




**************************************************************************
                            Dynamic Array
***************************************************************************

//Using size,new[],delete
module tb;
int array[];
integer i;
initial begin

	//print array
	array=new[5];
	array='{1,2,3,4,5};
	foreach(array[i])
	$display("array[%0d]=%0d",i,array[i]);
	$display("size of array = %0d",array.size());
	

	//add elements array
        array=new[10] (array);
	foreach(array[i])
	$display("array[%0d]=%0d",i,array[i]);
	$display("size of array = %0d",array.size());

	//delete
        $display("Deleting an array");
	foreach(array[i])
		array.delete(5);
	$display("array=%0d",array.size());


end
endmodule

OUTPUT:
# array[0]=1
# array[1]=2
# array[2]=3
# array[3]=4
# array[4]=5
# size of array = 5
# array[0]=1
# array[1]=2
# array[2]=3
# array[3]=4
# array[4]=5
# array[5]=0
# array[6]=0
# array[7]=0
# array[8]=0
# array[9]=0
# size of array = 10
# Deleting an array
# array=0


****************************************************************************
                             Queue methods             
****************************************************************************
| Method         | Purpose               |
| -------------- | --------------------- |
|  push_back()   | Add at end            |
|  push_front()  | Add at beginning      |
|  pop_back()    | Remove from end       |
|  pop_front()   | Remove from beginning |
|  size()        | Number of elements    |
|  insert()      | Insert at index       |
|  delete()      | Delete element/queue  |
|  q[index]      | Access element        |
------------------------------------------

module tb;
int q[$];
int data;
initial begin

//Add back 
q.push_back(10);
q.push_back(5);
q.push_back(6);
q.push_back(8);
q.push_back(2);
$display("q=%p",q);
//# q='{10, 5, 6, 8, 2}

//Add front 
q.push_front(10);
q.push_front(10);
q.push_front(10);
$display("q=%p",q);

//# q='{10, 5, 6, 8, 2}
//# q='{10, 10, 10, 10, 5, 6, 8, 2}


//Now see backdoor
q.push_back(2);
q.push_back(2);
q.push_back(2);
$display("q=%p",q);
//# q='{10, 5, 6, 8, 2}
//# q='{10, 10, 10, 10, 5, 6, 8, 2}
//# q='{10, 10, 10, 10, 5, 6, 8, 2, 2, 2, 2}

//Remove at front
$display("remove front");
q.pop_front();
q.pop_front();
$display("q=%p",q);

//# q='{10, 5, 6, 8, 2}
//# q='{10, 10, 10, 10, 5, 6, 8, 2}
//# q='{10, 10, 10, 10, 5, 6, 8, 2, 2, 2, 2}
//# remove back
//# q='{10, 10, 5, 6, 8, 2, 2, 2, 2}




$display("remove back");
q.pop_back();
q.pop_back();
$display("q=%p",q);


//# q='{10, 5, 6, 8, 2}
//# q='{10, 10, 10, 10, 5, 6, 8, 2}
//# q='{10, 10, 10, 10, 5, 6, 8, 2, 2, 2, 2}
//# remove front
//# q='{10, 10, 5, 6, 8, 2, 2, 2, 2}
//# remove back
//# q='{10, 10, 5, 6, 8, 2, 2}
$display("size of an array=%0d",q.size());


//# q='{10, 5, 6, 8, 2}
//# q='{10, 10, 10, 10, 5, 6, 8, 2}
//# q='{10, 10, 10, 10, 5, 6, 8, 2, 2, 2, 2}
//# remove front
//# q='{10, 10, 5, 6, 8, 2, 2, 2, 2}
//# remove back
//# q='{10, 10, 5, 6, 8, 2, 2}
//# size of an array=7

q.insert(0,10);
$display("q=%p",q);

//# q='{10, 5, 6, 8, 2}
//# q='{10, 10, 10, 10, 5, 6, 8, 2}
//# q='{10, 10, 10, 10, 5, 6, 8, 2, 2, 2, 2}
//# remove front
//# q='{10, 10, 5, 6, 8, 2, 2, 2, 2}
//# remove back
//# q='{10, 10, 5, 6, 8, 2, 2}
//# size of an array=7
//# q='{10, 10, 10, 5, 6, 8, 2, 2}


q.delete(1);
$display("Delete index 1");
$display("q=%p",q);

//# q='{10, 5, 6, 8, 2}
//# q='{10, 10, 10, 10, 5, 6, 8, 2}
//# q='{10, 10, 10, 10, 5, 6, 8, 2, 2, 2, 2}
//# remove front
//# q='{10, 10, 5, 6, 8, 2, 2, 2, 2}
//# remove back
//# q='{10, 10, 5, 6, 8, 2, 2}
//# size of an array=7
//# q='{10, 10, 10, 5, 6, 8, 2, 2}
//# Delete index 1
//# q='{10, 10, 5, 6, 8, 2, 2}


$display("Reversal");
q.reverse();
$display("q=%p",q);

//# q='{10, 5, 6, 8, 2}
//# q='{10, 10, 10, 10, 5, 6, 8, 2}
//# q='{10, 10, 10, 10, 5, 6, 8, 2, 2, 2, 2}
//# remove front
//# q='{10, 10, 5, 6, 8, 2, 2, 2, 2}
//# remove back
//# q='{10, 10, 5, 6, 8, 2, 2}
//# size of an array=7
//# q='{10, 10, 10, 5, 6, 8, 2, 2}
//# Delete index 1
//# q='{10, 10, 5, 6, 8, 2, 2}
//# Reversal
//# q='{2, 2, 8, 6, 5, 10, 10}

$display("Shuffie------");
q.shuffle();
$display("q=%p",q);


//# q='{10, 5, 6, 8, 2}
//# q='{10, 10, 10, 10, 5, 6, 8, 2}
//# q='{10, 10, 10, 10, 5, 6, 8, 2, 2, 2, 2}
//# remove front
//# q='{10, 10, 5, 6, 8, 2, 2, 2, 2}
//# remove back
//# q='{10, 10, 5, 6, 8, 2, 2}
//# size of an array=7
//# q='{10, 10, 10, 5, 6, 8, 2, 2}
//# Delete index 1
//# q='{10, 10, 5, 6, 8, 2, 2}
//# Reversal
//# q='{2, 2, 8, 6, 5, 10, 10}
//# Shuffie------
//# q='{6, 2, 2, 10, 8, 5, 10}
end
endmodule




//Implement the FIFO and LIFO nature by using quesue?
//FIFO
module tb;
int q[$];
int data;
initial begin
	//insert
	q.push_back(20);
	q.push_back(10);
	q.push_back(30);
	q.push_back(40);
	q.push_back(60);
	$display("%p",q);


	//remove
	data=q.pop_front();
	$display("Read=%p",data);
	
	data=q.pop_front();
	$display("Read=%p",data);
	
	data=q.pop_front();
	$display("Read=%p",data);

end
endmodule
# '{20, 10, 30, 40, 60}
# Read=20
# Read=10
# Read=30

//LIFO
module tb;
int q[$];
int data;
initial begin
q.push_back(10);
q.push_back(20);
q.push_back(30);
q.push_back(40);
q.push_back(50);
$display("%p",q);

	data=q.pop_back();
	$display("Read=%p",data);
	
	data=q.pop_back();
	$display("Read=%p",data);
	
	data=q.pop_back();
	$display("Read=%p",data);


end
endmodule
# '{10, 20, 30, 40, 50}
# Read=50
# Read=40
# Read=30



****************************************************************************
                       Associative array Method
***************************************************************************
1.Return the number of element  "num()"  ,  "size()"
module tb;
int arr[string];
initial begin
	arr["A"]=10;
	arr["B"]=20;
	arr["C"]=30;
	$display("Numbers = %0d",arr.num());
	$display("size = %0d",arr.size());
end
endmodule


//2.Check whether key "exists()"
module tb;
int arr[string];
initial begin
	arr["A"]=10;
	arr["B"]=20;
	if(arr.exists("B"))
		$display("B exists");
	if (arr.exists("C"))
		$display("C exists");
        else
		$display("C does not exists");

end
endmodule
OUTPUT:
# B exists
# C does not exists


//first()---returns the first index
module tb;
int arr[int];
int index;
initial begin
	arr[10]=100;
	arr[20]=200;
	arr[30]=300;
	arr[40]=400;
	arr[50]=500;
	if(arr.first(index))

$display("First index =%0d",index);
end
endmodule
# First index =10




//last()---Returns the last index
module tb;
int arr[int];
int index;
initial begin
	arr[10]=100;
	arr[20]=200;
	arr[30]=300;
	arr[40]=400;
	arr[50]=500;
	if(arr.last(index))
$display("Last Index=%0d",index);
end
endmodule
OUTPUT:
# Last Index=50


//next()---gets next index next() 
module tb;
int arr[int];
int index;
initial begin
	arr[10]=100;
	arr[20]=200;
	arr[30]=300;
	arr[40]=400;
	arr[50]=500;
	index=20;
	//index=50; --using this nothing will print
	if(arr.next(index))

$display("next index=%0d",index);
end
endmodule
OUTPUT:
# next index=20


//prev()---gets the previous
module tb;
int arr[int];
int index;
initial begin
	arr[10]=100;
	arr[20]=200;
	arr[30]=300;
	arr[40]=400;
	arr[50]=500;
	index=20;
	//index=50; --using this nothing will print
	if(arr.prev(index))

$display("previous index=%0d",index);
end
endmodule
OUTPUT:
# previous index=10

****************************************************************************                       
                        Array Locator Methods
****************************************************************************
find()              → matching VALUES
find_index()        → matching INDEXES

find_first()        → first matching VALUE
find_first_index()  → first matching INDEX

find_last()         → last matching VALUE
find_last_index()   → last matching INDEX

min()               → minimum VALUE
max()               → maximum VALUE

1.find() 
</> array.find(condtion);


//without local variable
module tb;
int a[]='{10.20,30,40,50,24};
int result[$];
initial begin
result = a.find() with (item>=24);
$display("%p",result);
end
endmodule
# '{30, 40, 50, 24}


//with local variable
module tb;
int a[]='{10.20,30,40,50,24};
int result[$];
initial begin
result = a.find(x) with (x>24);
$display("%p",result);
end
endmodule
# '{30, 40, 50}

2.find_index()
</>array.find_index() with condition

//with local variable
module tb;
int a[]='{10,29,35,40,50,60};
int result[$];
initial begin
result = a.find_index(x) with (x%2==0);
$display("%p",result);
end
endmodule
# '{0, 3, 4, 5}

3.find_first()
</>array.find_first() with condition


//without local variable
module tb;
int a[]='{10,29,35,40,50,60};
int result[$];
initial begin
result = a.find_first() with (item>30);
$display("%p",result);
end
endmodule
# '{35}


4.find_first_index()
</>array.find_first_index() with (condition)

//without local variable
module tb;
int a[]='{10,29,35,40,50,60};
int result[$];
initial begin
result = a.find_first_index() with (item%2!=0);
$display("%p",result);
end
endmodule
# '{1}


5.find_last()
</>array.find_last()with (condition)



//without local variable
module tb;
int a[]='{10,29,35,40,50,60};
int result[$];
initial begin
result = a.find_last() with (item>30);
$display("%p",result);
end
endmodule
# '{60}


6.find_last_index()
</>array.find_last_index()

//without local variable
module tb;
int a[]='{10,29,35,40,50,60};
int result[$];
initial begin
result = a.find_last_index() with (item==3);
$display("%p",result);
end
endmodule
# '{}


7.min()
</>array.min()
module tb;
int a[]='{10,29,35,40,50,60};
int result[$];
initial begin
result = a.min();
$display("%p",result);
end
endmodule
# '{10}



8.max()
</>array.max()

module tb;
int a[]='{10,29,35,40,50,60};
int result[$];
initial begin
result = a.max();
$display("%p",result);
end
endmodule
# '{60}



****************************************************************************
                       Array ordering methods in SV
****************************************************************************

module tb;
int arr[8]='{1,2,5,3,7,4,7,8};
initial begin
$display("-------------------------------------");
$display("-------Printing array and queue------");
$display("-------------------------------------");
print_array_queue();

$display("-------------------------------------");
$display("-------Printing array descending-----");
$display("-------------------------------------");
rsort_method();
print_array_queue();

$display("-------------------------------------");
$display("-------Printing array ascending-----");
$display("-------------------------------------");
sort_method();
print_array_queue();
end


function void print_array_queue();
begin
	$display("Array = %p",arr);
end
endfunction

function void rsort_method();
begin
arr.rsort();
end
endfunction


function void sort_method();
begin
arr.sort();
end
endfunction
endmodule


****************************************************************************
                 Array Reduction Methods in SystemVerilog
****************************************************************************
//sum(),product(),and(),or(),xor()
module tb;
int arr1[]='{10,20,30,40,50};
logic arr2[]='{4'b1111,4'b1010,4'b1110};
initial begin
$display("Sum = %0d ",arr1.sum());
$display("product = %0d ",arr1.product());
$display("and = %0b ",arr2.and());
$display("or = %0b ",arr2.or());
$display("xor = %0b ",arr2.xor());
end
endmodule


















