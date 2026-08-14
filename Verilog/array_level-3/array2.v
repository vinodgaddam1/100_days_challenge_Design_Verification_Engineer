/*==============================================================================
                        Array based-problems
=================================================================================
*********************************************************************************
                              Leve-3
*********************************************************************************
1.Searching an element
module tb;
integer array[9:0];
integer found;
integer search;
integer i;
initial begin
found=0;
//array printing
for(i=0;i<10;i=i+1)begin
	array[i]= 10*(i+1);
	$display("array[%0d]=%0d",i,array[i]);
end
//value
search=10;
for (i=0;i<10;i=i+1)begin
	if(array[i]==search)begin
		found=1;
		$display("Found=%0d",array[i]);
		$display("Index=%0d",i);
		
	end
end
if(found==0)
	
		$display("Not found");
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
# Found=10
# Index=0
2.Count occurrences

module tb;
integer array[9:0];
integer i;
integer search;
integer count;
initial begin
	count=0;
	for(i=0;i<10;i=i+1)begin
		array[i]=(i%3)*10;
		$display("array[%0d]=%0d",i,array[i]);
	end
	search=10;
	for(i=0;i<10;i=i+1)begin
		if(array[i]==search)begin
			count=count+1;
		end

	end
	$display("Count=%0d",count);
        $display("Number=%0d",search);
end
endmodule
OUTPUT:
# array[0]=0
# array[1]=10
# array[2]=20
# array[3]=0
# array[4]=10
# array[5]=20
# array[6]=0
# array[7]=10
# array[8]=20
# array[9]=0
# Count=3
# Number=10

3.Reverse array
module tb;
integer i;
integer array[9:0];
initial begin
	for(i=0;i<10;i=i+1)begin
		array[i]=10*(i+1);
		$display("array[%0d]=%0d",i,array[i]);
	end
	$display("Reverse number");
        for(i=9;i>=0;i=i-1)begin
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
# array[5]=60
# array[6]=70
# array[7]=80
# array[8]=90
# array[9]=100
# Reverse number
# array[9]=100
# array[8]=90
# array[7]=80
# array[6]=70
# array[5]=60
# array[4]=50
# array[3]=40
# array[2]=30
# array[1]=20
# array[0]=10

4.Separate even and odd

module tb;
integer i;
integer array[9:0];
integer even_indix;
integer odd_indix;
integer even_arr[9:0];
integer odd_arr[9:0];
initial begin
even_indix=0;
odd_indix=0;
for(i=0;i<10;i=i+1)begin
array[i]=3*(i+1);
$display("array[%0d]=%0d",i,array[i]);
end
for(i=0;i<10;i=i+1)begin
	if(array[i]%2==0)begin
		even_arr[even_indix]=array[i];
		even_indix=even_indix+1;
	end
	else begin
		odd_arr[odd_indix]=array[i];
	         odd_indix=odd_indix+1;
        end
        end
	$display("Even array");
	for(i=0;i<even_indix;i=i+1)begin
        $display("%0d",even_arr[i]);
end
	$display("odd array");
	for(i=0;i<odd_indix;i=i+1)begin
        $display("%0d",odd_arr[i]);
end
	
end
endmodule
OUTPUT:
# array[0]=3
# array[1]=6
# array[2]=9
# array[3]=12
# array[4]=15
# array[5]=18
# array[6]=21
# array[7]=24
# array[8]=27
# array[9]=30
# Even array
# 6
# 12
# 18
# 24
# 30
# odd array
# 3
# 9
# 15
# 21
# 27


4.Print prime numbers

module tb;
integer array[9:0];
integer i,j;
integer count;
initial begin
	count=0;
	for(i=0;i<10;i=i+1)begin
		array[i]=$urandom_range(1,100);
		$display("array[%0d]==%0d",i,array[i]);
	end
	//check prime number
	for(i=0;i<10;i=i+1)begin
		count=0;
		for(j=1;j<=array[i];j=j+1)begin
			if(array[i]%j==0)
				count=count+1;
			
		end
		if(count==2)
		$display("Prime=%0d",array[i]);
	end

end
endmodule
OUTPUT:
# array[0]==13
# array[1]==91
# array[2]==43
# array[3]==63
# array[4]==47
# array[5]==91
# array[6]==23
# array[7]==23
# array[8]==92
# array[9]==59
# Prime=13
# Prime=43
# Prime=47
# Prime=23
# Prime=23
# Prime=59




































